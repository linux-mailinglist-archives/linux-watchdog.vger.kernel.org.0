Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331D630E3E7
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 21:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhBCUMh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 15:12:37 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:54634 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231511AbhBCUMf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 15:12:35 -0500
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 113K9BsB009515;
        Wed, 3 Feb 2021 20:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=G+a7mMLR4wBmfzeUeKJRD3kVWOTcaoypnJjvF/QDEjs=;
 b=eTdanm2ZHvzMOnp3NRIugQWq4QG4RN98LrZ1KjVUvqCacO0ZCpZh/ZVyKoXpdKAUFZoU
 kz1S5li0IeyWc3nyupe2eMizvlaM/QgjsWgTESMXQF/Yc1NWRn7uT8CQyCaNq2Gwf+9b
 sQUMZ3eNbqABcnDhf+sqmnf84uwychPh0Y8T2qWCospGlS2HO9/Cyu9hzFRk1HBG/I/2
 QpStJqexbdWgAQ0d2/WRdEBhFnJ/qMLwexIBFLmLZEiWOvdtP6/JiyKDgF3uW8t85C70
 ffhYqwbqbIIsEKEsPPLQDEdZwP7VLkG5qL+q3CwnRGGOMEoynpKV1lKSK576eAkLVNma eg== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0a-002e3701.pphosted.com with ESMTP id 36fq1dx8fb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Feb 2021 20:11:40 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g2t2354.austin.hpe.com (Postfix) with ESMTP id 64F0DB5;
        Wed,  3 Feb 2021 20:11:39 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH v3] watchdog: Add hrtimer-based pretimeout feature
Date:   Wed,  3 Feb 2021 12:11:30 -0800
Message-Id: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-03_08:2021-02-03,2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030119
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
Changes from v2
 - Added required includes to watchdog_core.h
 - Added watchdog_have_pretimeout function and use throughout
 - Moved function declarations to watchdog_core.h and made stubs static

Changes from v1 (watchdog: Add software pretimeout support)
 - Changed subject for clarity
 - Renamed KCONFIG to WATCHDOG_HRTIMER_PRETIMEOUT also for clarity
 - Moved init/start/stop logic to watchdog_hrtimer_pretimeout.c
 - Moved watchdog_core_data struct to watchdog_core.h so it can be
    used in watchdog_hrtimer_pretimeout.c and watchdog_core.c

 drivers/watchdog/Kconfig                       |  8 +++++
 drivers/watchdog/Makefile                      |  1 +
 drivers/watchdog/watchdog_core.h               | 48 ++++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c                | 47 +++++++++----------------
 drivers/watchdog/watchdog_hrtimer_pretimeout.c | 44 +++++++++++++++++++++++
 drivers/watchdog/watchdog_pretimeout.c         |  5 +--
 6 files changed, 121 insertions(+), 32 deletions(-)
 create mode 100644 drivers/watchdog/watchdog_hrtimer_pretimeout.c

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
diff --git a/drivers/watchdog/watchdog_core.h b/drivers/watchdog/watchdog_core.h
index a5062e8..5b35a84 100644
--- a/drivers/watchdog/watchdog_core.h
+++ b/drivers/watchdog/watchdog_core.h
@@ -7,6 +7,8 @@
  *
  *	(c) Copyright 2008-2011 Wim Van Sebroeck <wim@iguana.be>.
  *
+ *	(c) Copyright 2021 Hewlett Packard Enterprise Development LP.
+ *
  *	This source code is part of the generic code that can be used
  *	by all the watchdog timer drivers.
  *
@@ -22,12 +24,58 @@
  *	This material is provided "AS-IS" and at no charge.
  */
 
+#include <linux/hrtimer.h>
+#include <linux/kthread.h>
+
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
 extern void watchdog_dev_unregister(struct watchdog_device *);
 extern int __init watchdog_dev_init(void);
 extern void __exit watchdog_dev_exit(void);
+
+static inline bool watchdog_have_pretimeout(struct watchdog_device *wdd)
+{
+	return wdd->info->options & WDIOF_PRETIMEOUT ||
+	       IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT);
+}
+
+#if IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT)
+void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd);
+void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd);
+void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd);
+#else
+static inline void watchdog_hrtimer_pretimeout_init(struct watchdog_device *wdd) {}
+static inline void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd) {}
+static inline void watchdog_hrtimer_pretimeout_stop(struct watchdog_device *wdd) {}
+#endif
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a..3eb3814 100644
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
@@ -46,30 +47,6 @@
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
 
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
-
 /* the dev_t structure to store the dynamically allocated watchdog devices */
 static dev_t watchdog_devt;
 /* Reference to watchdog device behind /dev/watchdog */
@@ -185,6 +162,9 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	else
 		err = wdd->ops->start(wdd); /* restart watchdog */
 
+	if (err == 0)
+		watchdog_hrtimer_pretimeout_start(wdd);
+
 	watchdog_update_worker(wdd);
 
 	return err;
@@ -275,8 +255,10 @@ static int watchdog_start(struct watchdog_device *wdd)
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
@@ -284,6 +266,7 @@ static int watchdog_start(struct watchdog_device *wdd)
 			wd_data->last_keepalive = started_at;
 			wd_data->last_hw_keepalive = started_at;
 			watchdog_update_worker(wdd);
+			watchdog_hrtimer_pretimeout_start(wdd);
 		}
 	}
 
@@ -325,6 +308,7 @@ static int watchdog_stop(struct watchdog_device *wdd)
 	if (err == 0) {
 		clear_bit(WDOG_ACTIVE, &wdd->status);
 		watchdog_update_worker(wdd);
+		watchdog_hrtimer_pretimeout_stop(wdd);
 	}
 
 	return err;
@@ -361,6 +345,9 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
 	if (test_and_clear_bit(_WDOG_KEEPALIVE, &wd_data->status))
 		status |= WDIOF_KEEPALIVEPING;
 
+	if (IS_ENABLED(CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT))
+		status |= WDIOF_PRETIMEOUT;
+
 	return status;
 }
 
@@ -408,7 +395,7 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 {
 	int err = 0;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!watchdog_have_pretimeout(wdd))
 		return -EOPNOTSUPP;
 
 	if (watchdog_pretimeout_invalid(wdd, timeout))
@@ -594,13 +581,11 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 
 	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
 		mode = 0;
-	else if (attr == &dev_attr_pretimeout.attr &&
-		 !(wdd->info->options & WDIOF_PRETIMEOUT))
+	else if (attr == &dev_attr_pretimeout.attr && !watchdog_have_pretimeout(wdd))
 		mode = 0;
 	else if ((attr == &dev_attr_pretimeout_governor.attr ||
 		  attr == &dev_attr_pretimeout_available_governors.attr) &&
-		 (!(wdd->info->options & WDIOF_PRETIMEOUT) ||
-		  !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
+		 (!watchdog_have_pretimeout(wdd) || !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
 		mode = 0;
 
 	return mode;
@@ -1009,6 +994,7 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 	kthread_init_work(&wd_data->work, watchdog_ping_work);
 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	wd_data->timer.function = watchdog_timer_expired;
+	watchdog_hrtimer_pretimeout_init(wdd);
 
 	if (wdd->id == 0) {
 		old_wd_data = wd_data;
@@ -1096,6 +1082,7 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 
 	hrtimer_cancel(&wd_data->timer);
 	kthread_cancel_work_sync(&wd_data->work);
+	watchdog_hrtimer_pretimeout_stop(wdd);
 
 	put_device(&wd_data->dev);
 }
diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
new file mode 100644
index 00000000..940b537
--- /dev/null
+++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * (c) Copyright 2021 Hewlett Packard Enterprise Development LP.
+ */
+
+#include <linux/hrtimer.h>
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
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84b..4d1c223 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -9,6 +9,7 @@
 #include <linux/string.h>
 #include <linux/watchdog.h>
 
+#include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
 
 /* Default watchdog pretimeout governor */
@@ -177,7 +178,7 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!watchdog_have_pretimeout(wdd))
 		return 0;
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
@@ -197,7 +198,7 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p, *t;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!watchdog_have_pretimeout(wdd))
 		return;
 
 	spin_lock_irq(&pretimeout_lock);
-- 
2.7.4

