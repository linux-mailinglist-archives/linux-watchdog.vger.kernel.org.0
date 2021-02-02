Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5E530B43D
	for <lists+linux-watchdog@lfdr.de>; Tue,  2 Feb 2021 01:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhBBAkq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Feb 2021 19:40:46 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:19592 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhBBAkp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Feb 2021 19:40:45 -0500
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1120dnow018409;
        Tue, 2 Feb 2021 00:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=KHFhrc1CMtNkV9ga8lZB/gauqLQFHFH2u2fkLoVUdr8=;
 b=XRaBXuxuJ/0B7UkJATE+Y2wzSrxsfz1whMcdo2RHVKQcDz6kfVsHaProod4Jt8HYV3Gj
 Bb3SiKsKk4tPMSoQKu7TqcgGaLyE8A0hbj+liZDP07kpDgv5wck/lZBmNe0v3NGmwOmn
 6IMHSmxPR/heqmCHmrfhtCqd7aoljX3OnWqoKQ4prRpdt4y2QPV5sNlshLQnHAh1F+kt
 xaKHPHzQqNqzEFXvRJT1R9m24ReL8ex8gWanNbXezINtgZRlic1gKNi18LyZMrucljB/
 svXVgQym+g6y1vbbSLB1J828hE0lKJrzH0V+Jx3hMDR2FcJz/sx+AV4ONEyS0XgBtJ0p vQ== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0a-002e3701.pphosted.com with ESMTP id 36dhjf5wm4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Feb 2021 00:39:49 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 96CD459;
        Tue,  2 Feb 2021 00:39:48 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH v2] watchdog: Add hrtimer-based pretimeout feature
Date:   Mon,  1 Feb 2021 16:39:24 -0800
Message-Id: <1612226364-30951-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-01_14:2021-01-29,2021-02-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020002
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the option to use a hrtimer to generate a watchdog pretimeout
event for hardware watchdogs that do not natively support watchdog
pretimeouts.

With this enabled, all watchdogs will appear to have pretimeout support
in userspace. If no pretimeout value is set, there will be no change in
the watchdog's behavior. If a pretimeout value is set for a specific
watchdog that does not have built-in pretimeout support, a timer will be
started that should fire at the specified time before the watchdog
timeout would occur. When the watchdog is successfully pinged, the timer
will be restarted. If the timer is allowed to fire it will generate a
pretimeout event. However because a software timer is used, it may not
be able to fire in every circumstance.

If the watchdog does support a pretimeout natively, that functionality
will be used instead of the hrtimer.

The general design of this feaure was inspired by the software watchdog,
specifically its own pretimeout implementation. However the software
watchdog and this feature are completely independent. They can be used
together; with or without CONFIG_SOFT_WATCHDOG_PRETIMEOUT enabled.

The main advantage of using the hrtimer pretimeout with a hardware
watchdog, compared to running the software watchdog with a hardware
watchdog, is that if the hardware watchdog driver is unable to ping the
watchdog (e.g. due to a bus or communication error), then the hrtimer
pretimeout would still fire whereas the software watchdog would not.

Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
Changes from v1 (watchdog: Add software pretimeout support)
 - Changed subject for clarity
 - Renamed KCONFIG to WATCHDOG_HRTIMER_PRETIMEOUT also for clarity
 - Moved init/start/stop logic to watchdog_hrtimer_pretimeout.c
 - Moved watchdog_core_data struct to watchdog_core.h so it can be
    used in watchdog_hrtimer_pretimeout.c and watchdog_core.c

 drivers/watchdog/Kconfig                       |  8 ++++
 drivers/watchdog/Makefile                      |  1 +
 drivers/watchdog/watchdog_core.c               |  2 +
 drivers/watchdog/watchdog_core.h               | 27 ++++++++++++++
 drivers/watchdog/watchdog_dev.c                | 51 +++++++++++---------------
 drivers/watchdog/watchdog_hrtimer_pretimeout.c | 45 +++++++++++++++++++++++
 drivers/watchdog/watchdog_hrtimer_pretimeout.h | 19 ++++++++++
 drivers/watchdog/watchdog_pretimeout.c         |  6 ++-
 8 files changed, 128 insertions(+), 31 deletions(-)
 create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.c
 create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.h

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7ff941e..a5f0ca8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -73,6 +73,14 @@ config WATCHDOG_SYSFS
 	  Say Y here if you want to enable watchdog device status read through
 	  sysfs attributes.
 
+config WATCHDOG_HRTIMER_PRETIMEOUT
+	bool "Enable watchdog hrtimer-based pretimeouts"
+	help
+	  Enable this if you want to use a hrtimer timer based pretimeout for
+	  watchdogs that do not natively support pretimeout support. Be aware
+	  that because this pretimeout functionality uses hrtimers, it may not
+	  be able to fire before the actual watchdog fires in some situations.
+
 comment "Watchdog Pretimeout Governors"
 
 config WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 5c74ee1..6fecaab 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_WATCHDOG_CORE)	+= watchdog.o
 watchdog-objs	+= watchdog_core.o watchdog_dev.o
 
 watchdog-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV)	+= watchdog_pretimeout.o
+watchdog-$(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)	+= watchdog_hrtimer_pretimeout.o
 
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP)	+= pretimeout_noop.o
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC)	+= pretimeout_panic.o
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 0e9a995..1449bf124 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -27,7 +27,9 @@
 #include <linux/module.h>	/* For EXPORT_SYMBOL/module stuff/... */
 #include <linux/types.h>	/* For standard types */
 #include <linux/errno.h>	/* For the -ENODEV/... values */
+#include <linux/hrtimer.h>	/* For hrtimers */
 #include <linux/kernel.h>	/* For printk/panic/... */
+#include <linux/kthread.h>	/* For kthread_work */
 #include <linux/reboot.h>	/* For restart handler */
 #include <linux/watchdog.h>	/* For watchdog specific items */
 #include <linux/init.h>		/* For __init/__exit/... */
diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index a5062e8..323600a 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -25,6 +25,33 @@
 #define MAX_DOGS	32	/* Maximum number of watchdog devices */
 
 /*
+ * struct watchdog_core_data - watchdog core internal data
+ * @dev:	The watchdog's internal device
+ * @cdev:	The watchdog's Character device.
+ * @wdd:	Pointer to watchdog device.
+ * @lock:	Lock for watchdog core.
+ * @status:	Watchdog core internal status bits.
+ */
+struct watchdog_core_data {
+	struct device dev;
+	struct cdev cdev;
+	struct watchdog_device *wdd;
+	struct mutex lock;
+	ktime_t last_keepalive;
+	ktime_t last_hw_keepalive;
+	ktime_t open_deadline;
+	struct hrtimer timer;
+	struct kthread_work work;
+#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
+	struct hrtimer pretimeout_timer;
+#endif
+	unsigned long status;		/* Internal status bits */
+#define _WDOG_DEV_OPEN		0	/* Opened ? */
+#define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
+#define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
+};
+
+/*
  *	Functions/procedures to be called by the core
  */
 extern int watchdog_dev_register(struct watchdog_device *);
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a..2a2e8d8 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -7,6 +7,7 @@
  *
  *	(c) Copyright 2008-2011 Wim Van Sebroeck <wim@iguana.be>.
  *
+ *	(c) Copyright 2021 Hewlett Packard Enterprise Development LP.
  *
  *	This source code is part of the generic code that can be used
  *	by all the watchdog timer drivers.
@@ -45,30 +46,7 @@
 
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
-
-/*
- * struct watchdog_core_data - watchdog core internal data
- * @dev:	The watchdog's internal device
- * @cdev:	The watchdog's Character device.
- * @wdd:	Pointer to watchdog device.
- * @lock:	Lock for watchdog core.
- * @status:	Watchdog core internal status bits.
- */
-struct watchdog_core_data {
-	struct device dev;
-	struct cdev cdev;
-	struct watchdog_device *wdd;
-	struct mutex lock;
-	ktime_t last_keepalive;
-	ktime_t last_hw_keepalive;
-	ktime_t open_deadline;
-	struct hrtimer timer;
-	struct kthread_work work;
-	unsigned long status;		/* Internal status bits */
-#define _WDOG_DEV_OPEN		0	/* Opened ? */
-#define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
-#define _WDOG_KEEPALIVE		2	/* Did we receive a keepalive ? */
-};
+#include "watchdog_hrtimer_pretimeout.h"
 
 /* the dev_t structure to store the dynamically allocated watchdog devices */
 static dev_t watchdog_devt;
@@ -185,6 +163,9 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	else
 		err = wdd->ops->start(wdd); /* restart watchdog */
 
+	if (err == 0)
+		watchdog_hrtimer_pretimeout_start(wdd);
+
 	watchdog_update_worker(wdd);
 
 	return err;
@@ -275,8 +256,10 @@ static int watchdog_start(struct watchdog_device *wdd)
 	started_at = ktime_get();
 	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
 		err = __watchdog_ping(wdd);
-		if (err == 0)
+		if (err == 0) {
 			set_bit(WDOG_ACTIVE, &wdd->status);
+			watchdog_hrtimer_pretimeout_start(wdd);
+		}
 	} else {
 		err = wdd->ops->start(wdd);
 		if (err == 0) {
@@ -284,6 +267,7 @@ static int watchdog_start(struct watchdog_device *wdd)
 			wd_data->last_keepalive = started_at;
 			wd_data->last_hw_keepalive = started_at;
 			watchdog_update_worker(wdd);
+			watchdog_hrtimer_pretimeout_start(wdd);
 		}
 	}
 
@@ -325,6 +309,7 @@ static int watchdog_stop(struct watchdog_device *wdd)
 	if (err == 0) {
 		clear_bit(WDOG_ACTIVE, &wdd->status);
 		watchdog_update_worker(wdd);
+		watchdog_hrtimer_pretimeout_stop(wdd);
 	}
 
 	return err;
@@ -361,6 +346,9 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
 	if (test_and_clear_bit(_WDOG_KEEPALIVE, &wd_data->status))
 		status |= WDIOF_KEEPALIVEPING;
 
+	if (IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
+		status |= WDIOF_PRETIMEOUT;
+
 	return status;
 }
 
@@ -408,7 +396,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 {
 	int err = 0;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
 		return -EOPNOTSUPP;
 
 	if (watchdog_pretimeout_invalid(wdd, timeout))
@@ -595,12 +584,14 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
 		mode = 0;
 	else if (attr == &dev_attr_pretimeout.attr &&
-		 !(wdd->info->options & WDIOF_PRETIMEOUT))
+		 !(wdd->info->options & WDIOF_PRETIMEOUT) &&
+		 !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
 		mode = 0;
 	else if ((attr == &dev_attr_pretimeout_governor.attr ||
 		  attr == &dev_attr_pretimeout_available_governors.attr) &&
-		 (!(wdd->info->options & WDIOF_PRETIMEOUT) ||
-		  !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
+		 ((!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+		   !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)) ||
+		   !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
 		mode = 0;
 
 	return mode;
@@ -1009,6 +1000,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 	kthread_init_work(&wd_data->work, watchdog_ping_work);
 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	wd_data->timer.function = watchdog_timer_expired;
+	watchdog_hrtimer_pretimeout_init(wdd);
 
 	if (wdd->id == 0) {
 		old_wd_data = wd_data;
@@ -1096,6 +1088,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 
 	hrtimer_cancel(&wd_data->timer);
 	kthread_cancel_work_sync(&wd_data->work);
+	watchdog_hrtimer_pretimeout_stop(wdd);
 
 	put_device(&wd_data->dev);
 }
diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
new file mode 100644
index 00000000..a26a18c
--- /dev/null
+++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
+ */
+
+#include <linux/hrtimer.h>
+#include <linux/kthread.h>
+#include <linux/watchdog.h>
+
+#include "watchdog_core.h"
+#include "watchdog_pretimeout.h"
+
+static enum hrtimer_restart watchdog_hrtimer_pretimeout(struct hrtimer *timer)
+{
+	struct watchdog_core_data *wd_data;
+
+	wd_data = container_of(timer, struct watchdog_core_data, pretimeout_timer);
+
+	watchdog_notify_pretimeout(wd_data->wdd);
+	return HRTIMER_NORESTART;
+}
+
+void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+
+	hrtimer_init(&wd_data->pretimeout_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	wd_data->pretimeout_timer.function = watchdog_hrtimer_pretimeout;
+}
+
+void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd)
+{
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !watchdog_pretimeout_invalid(wdd, wdd->pretimeout))
+		hrtimer_start(&wdd->wd_data->pretimeout_timer,
+			      ktime_set(wdd->timeout - wdd->pretimeout, 0),
+			      HRTIMER_MODE_REL);
+	else
+		hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
+}
+
+void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd)
+{
+	hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
+}
diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.h b/drivers/watchdog/watchdog_hrtimer_pretimeout.h
new file mode 100644
index 00000000..ad136b2
--- /dev/null
+++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
+ */
+
+#ifndef __WATCHDOG_HRTIMER_PRETIMEOUT_H
+#define __WATCHDOG_HRTIMER_PRETIMEOUT_H
+
+#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
+void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd);
+void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd);
+void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd);
+#else
+static void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd) {}
+static void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd) {}
+static void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd) {}
+#endif
+
+#endif
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84b..5629198 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -177,7 +177,8 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
 		return 0;
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
@@ -197,7 +198,8 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p, *t;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
 		return;
 
 	spin_lock_irq(&pretimeout_lock);
-- 
2.7.4

