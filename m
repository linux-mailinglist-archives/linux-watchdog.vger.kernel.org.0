Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA372DCA90
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Dec 2020 02:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgLQBib (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Dec 2020 20:38:31 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:31956 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725889AbgLQBia (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Dec 2020 20:38:30 -0500
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BH1XOXt014925;
        Thu, 17 Dec 2020 01:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=rzj7XdiS5O61WrVGOKA72iaOrI6iKFZCCMb2DnGVbro=;
 b=JI4GV3PzZN7dmEDZyp62/58OdcZd0kbPO+1f/03ycfL2Ecu6ZTwSbTjJm+Fh88hYaA+Y
 WTNaLNjM5LfvNYnNC6BHi/dzIaPMVAwT/tF+1F3K8jHa01rEOXYYKKnw5l1wT1+GMmUn
 w/V5zaotRgPY882HvKK/4zyHT3nTbBPuNvAbsijmKkkvEaizVSmMJIVWvARjq+errPde
 BoqYaByExXJNedtr+GIWxnoxduxEXaC41cfk2Yrp3E7wPG3ViZAL7almznRTBTxIVFh2
 UrP5XcBZKU81O2uhViIbGz/vFhwlxpa5Z91749NtL6OZnZEWshdvmBWJZn7pcaDx84Pg vg== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 35f2qdc552-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Dec 2020 01:37:30 +0000
Received: from hpnsw-phaguraws.rose.rdlabs.hpecorp.net (unknown [16.93.60.123])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id 2F773A1;
        Thu, 17 Dec 2020 01:37:28 +0000 (UTC)
From:   Curtis Klein <curtis.klein@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, Curtis Klein <curtis.klein@hpe.com>
Subject: [PATCH] watchdog: Add software pretimeout support
Date:   Wed, 16 Dec 2020 17:36:01 -0800
Message-Id: <1608168961-17491-1-git-send-email-curtis.klein@hpe.com>
X-Mailer: git-send-email 2.7.4
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-16_12:2020-12-15,2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170008
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds the option to use a software timer to generate a watchdog
pretimeout event for hardware watchdogs that do not support the
pretimeout feature.

With this enabled, all watchdogs will appear to have pretimeout support
in userspace. If no pretimeout value is set, there will be no change in
the watchdog's behavior. If a pretimeout value is set for a specific
watchdog that does not have built-in pretimeout support, a timer will be
started that should fire at the specified time before the watchdog
timeout would occur. When the watchdog is successfully pinged, the timer
will be restarted. If the timer is allowed to fire it will generate a
pretimeout event.

If the watchdog does support a pretimeout natively, that functionality
will be used instead of the software timer.

Signed-off-by: Curtis Klein <curtis.klein@hpe.com>
---
 drivers/watchdog/Kconfig               |  8 +++++
 drivers/watchdog/watchdog_dev.c        | 62 +++++++++++++++++++++++++++++++---
 drivers/watchdog/watchdog_pretimeout.c |  7 ++--
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f22e373..6a4554b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -73,6 +73,14 @@ config WATCHDOG_SYSFS
 	  Say Y here if you want to enable watchdog device status read through
 	  sysfs attributes.
 
+config WATCHDOG_SOFTWARE_PRETIMEOUT
+	bool "Enable software timer based pretimeout support"
+	help
+	  Enable this if you want to use a software timer based pretimeout for
+	  watchdogs that do not have pretimeout support. Be aware that because
+	  this pretimeout is purely software based, it may not be able to fire
+	  before the actual watchdog fires in some situations.
+
 comment "Watchdog Pretimeout Governors"
 
 config WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a..ae4b5b4 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -7,6 +7,8 @@
  *
  *	(c) Copyright 2008-2011 Wim Van Sebroeck <wim@iguana.be>.
  *
+ *	(c) Copyright 2020 Hewlett Packard Enterprise Development LP.
+ *
  *
  *	This source code is part of the generic code that can be used
  *	by all the watchdog timer drivers.
@@ -64,6 +66,9 @@ struct watchdog_core_data {
 	ktime_t open_deadline;
 	struct hrtimer timer;
 	struct kthread_work work;
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+	struct hrtimer pretimeout_timer;
+#endif
 	unsigned long status;		/* Internal status bits */
 #define _WDOG_DEV_OPEN		0	/* Opened ? */
 #define _WDOG_ALLOW_RELEASE	1	/* Did we receive the magic char ? */
@@ -185,6 +190,17 @@ static int __watchdog_ping(struct watchdog_device *wdd)
 	else
 		err = wdd->ops->start(wdd); /* restart watchdog */
 
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) && wdd->pretimeout) {
+		if (err == 0)
+			hrtimer_start(&wd_data->pretimeout_timer,
+				      ktime_set(wdd->timeout - wdd->pretimeout, 0),
+				      HRTIMER_MODE_REL);
+	} else {
+		hrtimer_cancel(&wd_data->pretimeout_timer);
+	}
+#endif
+
 	watchdog_update_worker(wdd);
 
 	return err;
@@ -250,6 +266,19 @@ static enum hrtimer_restart watchdog_timer_expired(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
+
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+static enum hrtimer_restart watchdog_software_pretimeout(struct hrtimer *timer)
+{
+	struct watchdog_core_data *wd_data;
+
+	wd_data = container_of(timer, struct watchdog_core_data, pretimeout_timer);
+
+	watchdog_notify_pretimeout(wd_data->wdd);
+	return HRTIMER_NORESTART;
+}
+#endif
+
 /*
  *	watchdog_start: wrapper to start the watchdog.
  *	@wdd: the watchdog device to start
@@ -287,6 +316,12 @@ static int watchdog_start(struct watchdog_device *wdd)
 		}
 	}
 
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+		if (!(wdd->info->options & WDIOF_PRETIMEOUT) && wdd->pretimeout)
+			hrtimer_start(&wd_data->pretimeout_timer,
+				      ktime_set(wdd->timeout - wdd->pretimeout, 0),
+				      HRTIMER_MODE_REL);
+#endif
 	return err;
 }
 
@@ -325,6 +360,10 @@ static int watchdog_stop(struct watchdog_device *wdd)
 	if (err == 0) {
 		clear_bit(WDOG_ACTIVE, &wdd->status);
 		watchdog_update_worker(wdd);
+
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+		hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
+#endif
 	}
 
 	return err;
@@ -361,6 +400,9 @@ static unsigned int watchdog_get_status(struct watchdog_device *wdd)
 	if (test_and_clear_bit(_WDOG_KEEPALIVE, &wd_data->status))
 		status |= WDIOF_KEEPALIVEPING;
 
+	if (IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT))
+		status |= WDIOF_PRETIMEOUT;
+
 	return status;
 }
 
@@ -408,7 +450,8 @@ static int watchdog_set_pretimeout(struct watchdog_device *wdd,
 {
 	int err = 0;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT))
 		return -EOPNOTSUPP;
 
 	if (watchdog_pretimeout_invalid(wdd, timeout))
@@ -595,12 +638,14 @@ static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 	if (attr == &dev_attr_timeleft.attr && !wdd->ops->get_timeleft)
 		mode = 0;
 	else if (attr == &dev_attr_pretimeout.attr &&
-		 !(wdd->info->options & WDIOF_PRETIMEOUT))
+		 !(wdd->info->options & WDIOF_PRETIMEOUT) &&
+		 !IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT))
 		mode = 0;
 	else if ((attr == &dev_attr_pretimeout_governor.attr ||
 		  attr == &dev_attr_pretimeout_available_governors.attr) &&
-		 (!(wdd->info->options & WDIOF_PRETIMEOUT) ||
-		  !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
+		 ((!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+		   !IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT)) ||
+		   !IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)))
 		mode = 0;
 
 	return mode;
@@ -1010,6 +1055,11 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
 	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
 	wd_data->timer.function = watchdog_timer_expired;
 
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+	hrtimer_init(&wd_data->pretimeout_timer,  CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	wd_data->pretimeout_timer.function = watchdog_software_pretimeout;
+#endif
+
 	if (wdd->id == 0) {
 		old_wd_data = wd_data;
 		watchdog_miscdev.parent = wdd->parent;
@@ -1097,6 +1147,10 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
 	hrtimer_cancel(&wd_data->timer);
 	kthread_cancel_work_sync(&wd_data->work);
 
+#ifdef CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT
+	hrtimer_cancel(&wd_data->pretimeout_timer);
+#endif
+
 	put_device(&wd_data->dev);
 }
 
diff --git a/drivers/watchdog/watchdog_pretimeout.c b/drivers/watchdog/watchdog_pretimeout.c
index 01ca84b..cb3f8f4 100644
--- a/drivers/watchdog/watchdog_pretimeout.c
+++ b/drivers/watchdog/watchdog_pretimeout.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2015-2016 Mentor Graphics
+ * Copyright (C) 2020 Hewlett Packard Enterprise Development LP.
  */
 
 #include <linux/list.h>
@@ -177,7 +178,8 @@ int watchdog_register_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT))
 		return 0;
 
 	p = kzalloc(sizeof(*p), GFP_KERNEL);
@@ -197,7 +199,8 @@ void watchdog_unregister_pretimeout(struct watchdog_device *wdd)
 {
 	struct watchdog_pretimeout *p, *t;
 
-	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT) &&
+	    !IS_ENABLED(CONFIG_WATCHDOG_SOFTWARE_PRETIMEOUT))
 		return;
 
 	spin_lock_irq(&pretimeout_lock);
-- 
2.7.4

