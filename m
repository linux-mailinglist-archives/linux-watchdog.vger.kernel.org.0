Return-Path: <linux-watchdog+bounces-3569-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F969AC0452
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 07:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF3354E35FD
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 05:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A741B1F2C58;
	Thu, 22 May 2025 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="W6+9Ol5W"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A21F1906;
	Thu, 22 May 2025 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893474; cv=none; b=sgN3FnZpLsVVOzpaIo7Abm4SgRVJNc2eyQYNNGj9IQ2VSBFxzn3G6Npd60l1rK7a+6YtttiLMychLNi8szKrXe56er/M+HpZv/FqL9vCo3jEM6FVZf8CIK+1Jut1z5KnOutiBtvY4dzy2qiTmBc6mGY32cZ+X0ItW9DwKMIsrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893474; c=relaxed/simple;
	bh=KvRLMsa4ZS4vGJe2Ejl3rV/a/uy73YQhW3DMOISV2Jo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEAJXCRSQafXG8TY4/be/SiK17o156QUK458fXe8WW8YnQ2KeWWX4ohZCUgX1uwGlvrftkroUfqrl6y3KTFJk9PaZyAwJr0vAlFcrzEBGAiY+fuU9dnr73dP4GKijRUruARM5THnI1p6d+Zc9nJrMuehiWx832ea0PsOooHoiB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=W6+9Ol5W; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LNWSCa010341;
	Wed, 21 May 2025 22:57:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=Q
	RbogAxa6wY5MlJKGbXArgC8WnLT5+lPy4Ur6edgAW0=; b=W6+9Ol5W6fZxETlx4
	NT5bJPDT6qdiQYaHsJyM9ykmHXBGyKYXcWsORA2HkaI1HtJJ4tUksc3ztoiuR/nx
	wOqc5e3SnLpuhXy4Q21VpOU+AfIHvEIXowvtldJkw89jJjOqzf56fkVbeqOXnILf
	G9dgVtIULmkQj6TSvuHwv2saz7s8l+HLg9OWawO+TTZouMfGszJcFxRT6aXdUmC/
	jlCghjBFDeJoNnpsuODkT7HNVf6JXDht/uJDNb6PWg2iGk+I0M6jFMmZ4JO0mmmq
	O9kW3sMROTnUC8o0L8LhkBiEp0xxfxLIRayzlKcU/8yKYUgNweBSSn8CrYkPVL8d
	54COw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46srka8j94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:57:34 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 21 May 2025 22:57:33 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 21 May 2025 22:57:33 -0700
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 7FF563F708E;
	Wed, 21 May 2025 22:57:33 -0700 (PDT)
From: George Cherian <george.cherian@marvell.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>, <a.fatoum@pengutronix.de>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "George
 Cherian" <george.cherian@marvell.com>
Subject: [RESEND PATCH v5 1/2] drivers: watchdog: Introduce watchdog reset timeout on panic
Date: Thu, 22 May 2025 05:57:14 +0000
Message-ID: <20250522055715.3533356-2-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522055715.3533356-1-george.cherian@marvell.com>
References: <20250522055715.3533356-1-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PVzuebCmCwlZORvDOA0UZFR_EMBYlyXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA1NyBTYWx0ZWRfXzHJQbWJT1Wec eXk0/9ugr5btuF4078cCWeBDdNJIMpwT8fFzL/OlNE1++ng9L9UW78oGMLS7TAusPgEAOQD0EbK GtVNwCPWe3L2xi6ZaBFDE3kzRL6cEQHDBFOL3u7JFHSgaYhSsB272h6lMfgk/LhzOLDrASETc/7
 4e2ZYuJmwQr2e/g6Q7kRriVob5FtTwWx80CsYOp6zTJdhh/rahfuMaf2YX9tTKFTyp/Dau4HbvJ oBAXtNR9x5g3pGPb8tiOfg1CncdSqeQwLon10mQzIYSyRBUGPL6tlbYdhw4r7HcmWqDJe4qfAaC aLcrHA0wYdkPstVCQ/kzRttBekUr2jKxVM5IA/9iUuBIo07O1fAXwc5pyhvHk2dZXnAxPRxV1hx
 MyeN6ZgNT9Gxf6nXtpV5cgelTi9AER7lj9SJ4fxXX7MsGISN1fTs/kzYWJvkiPoZXViHZoqc
X-Proofpoint-ORIG-GUID: PVzuebCmCwlZORvDOA0UZFR_EMBYlyXm
X-Authority-Analysis: v=2.4 cv=Bp+dwZX5 c=1 sm=1 tr=0 ts=682ebcce cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=dt9VzEwgFbYA:10 a=M5GUcnROAAAA:8 a=1XQDrr_peQNd6h_5ez0A:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_03,2025-05-20_03,2025-03-28_01

In a kernel panic situation followed by loading of kdump kernel, it can
so happen that watchdog reset can happen while booting the kdump kernel.
Add a provision to configure/update the watchdog timeout in case of
panic.
This is acheived by:
1. Provide a sysfs entry to configure the timeout (reset_on_panic) in
   case of kernel panic.
2. reset_on_panic  takes time in seconds. If set to 0 then the watchdog
   is disarmed completely.
3. Register a panic notifer and update the watchdog timeout in case of
   panic.
4. Introduce a new flag to watchdog drivers to set whether ops are
   atmoic.
The above feature cannot be supported to watchdog drivers which sleeps
during set_timeout or stop.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 drivers/watchdog/watchdog_core.c | 33 ++++++++++++++++++++++++++++++++
 drivers/watchdog/watchdog_dev.c  | 28 +++++++++++++++++++++++++++
 include/linux/watchdog.h         |  3 +++
 include/uapi/linux/watchdog.h    |  1 +
 4 files changed, 65 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 6152dba4b52c..7ec46dfe9888 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -35,6 +35,7 @@
 #include <linux/err.h>		/* For IS_ERR macros */
 #include <linux/of.h>		/* For of_alias_get_id */
 #include <linux/property.h>	/* For device_property_read_u32 */
+#include <linux/panic_notifier.h> /* For panic handler */
 #include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
@@ -155,6 +156,28 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 }
 EXPORT_SYMBOL_GPL(watchdog_init_timeout);
 
+static int watchdog_panic_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	int ret;
+	struct watchdog_device *wdd;
+
+	wdd = container_of(nb, struct watchdog_device, panic_nb);
+	if (watchdog_active(wdd)) {
+		if (!wdd->reset_on_panic) {
+			ret = wdd->ops->stop(wdd);
+			if (ret)
+				return NOTIFY_BAD;
+		} else {
+			ret = wdd->ops->set_timeout(wdd, wdd->reset_on_panic);
+			if (ret)
+				return NOTIFY_BAD;
+		}
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int watchdog_reboot_notifier(struct notifier_block *nb,
 				    unsigned long code, void *data)
 {
@@ -334,6 +357,13 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
 				wdd->id, ret);
 	}
 
+	if (wdd->info->options & WDIOF_OPS_ATOMIC) {
+		wdd->panic_nb.notifier_call = watchdog_panic_notify;
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &wdd->panic_nb);
+		set_bit(WDOG_RESET_ON_PANIC, &wdd->status);
+	}
+
 	return 0;
 }
 
@@ -390,6 +420,9 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
 		unregister_reboot_notifier(&wdd->reboot_nb);
 
+	if (test_bit(WDOG_RESET_ON_PANIC, &wdd->status))
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &wdd->panic_nb);
 	watchdog_dev_unregister(wdd);
 	ida_free(&watchdog_ida, wdd->id);
 }
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8369fd94fc1a..89cc9b681992 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -617,6 +617,33 @@ static ssize_t pretimeout_governor_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(pretimeout_governor);
 
+static ssize_t reset_on_panic_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", wdd->reset_on_panic);
+}
+
+static ssize_t reset_on_panic_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret)
+		return ret;
+
+	wdd->reset_on_panic = value;
+
+	return count;
+}
+static DEVICE_ATTR_RW(reset_on_panic);
+
 static umode_t wdt_is_visible(struct kobject *kobj, struct attribute *attr,
 				int n)
 {
@@ -648,6 +675,7 @@ static struct attribute *wdt_attrs[] = {
 	&dev_attr_bootstatus.attr,
 	&dev_attr_status.attr,
 	&dev_attr_nowayout.attr,
+	&dev_attr_reset_on_panic.attr,
 	&dev_attr_pretimeout_governor.attr,
 	&dev_attr_pretimeout_available_governors.attr,
 	NULL,
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 99660197a36c..8783edf93bab 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -105,9 +105,11 @@ struct watchdog_device {
 	unsigned int max_timeout;
 	unsigned int min_hw_heartbeat_ms;
 	unsigned int max_hw_heartbeat_ms;
+	unsigned int reset_on_panic;
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
 	struct notifier_block pm_nb;
+	struct notifier_block panic_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
@@ -118,6 +120,7 @@ struct watchdog_device {
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
 #define WDOG_NO_PING_ON_SUSPEND	5	/* Ping worker should be stopped on suspend */
+#define WDOG_RESET_ON_PANIC	6	/* Reset the watchdog on panic for loading kdump kernels */
 	struct list_head deferred;
 };
 
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..4e19cc653a72 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -48,6 +48,7 @@ struct watchdog_info {
 #define	WDIOF_PRETIMEOUT	0x0200  /* Pretimeout (in seconds), get/set */
 #define	WDIOF_ALARMONLY		0x0400	/* Watchdog triggers a management or
 					   other external alarm not a reboot */
+#define WDIOF_OPS_ATOMIC	0x0800  /* Indicate whether watchdog ops will sleep or not */
 #define	WDIOF_KEEPALIVEPING	0x8000	/* Keep alive ping reply */
 
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
-- 
2.34.1


