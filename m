Return-Path: <linux-watchdog+bounces-2999-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF53A43A5A
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 10:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E926C3A508A
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 09:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AA02054FD;
	Tue, 25 Feb 2025 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="H944BIbK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAB18BB9C;
	Tue, 25 Feb 2025 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477148; cv=none; b=M1KgQx/NB9yL1Vpw4xMJlP+iT9kLS+B7iBvhYRUaLzajAaiag3dHXUJmel5i4r0uIE7QfZmh4PA5a8+kXnALXX6n62h7m8ev+twbApjW2jjviTns590RjCq7ob5KUMawaz4zSEOQvsFh/5ORosADNUjmLQFNuSkhH3sWGIAOeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477148; c=relaxed/simple;
	bh=13XhFyThWjddbCcTyIBgYU0jGQLILu93dCMct+l48CM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UcLaVlLbjatEfgxzII56ujiMQQqOLsCXBGhyzRcKrjer90cCsNojn8+1zEUHvrf8NacFXNVk3/mYsupePCUb9kJ5VSqj0uQIW4Ls3MOCW45KHpTOxwUAfLtxh71kvrK7XZbGBBFRT5wmhCSp7xyn8XAQ4IRXhYkeGbBm0pwaGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=H944BIbK; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ONUwVT005162;
	Tue, 25 Feb 2025 01:52:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=RI8q8A+C/mMkg4mX0jo9fet
	GEHZ8oz6WKdpobl6FLG0=; b=H944BIbKRL0vlXMoJ9WSdviz8Qbrxpe6D57RR2O
	p8mF1I9Cdag3mEhLpHnrZUijr+Y02qlpYVNc/Lq7PaMXyrHP0WzRyckiA+zHNMkD
	KcbeuIsDcdT8gYGJoQlfj1DQVssJyF9cA1lGjqlq/g0p32FS9OG6n6B+HmwPaKzr
	4BoI3vwwKb2yaIUWBLM8F1MnMi8ActDhWr9qfJ4bEeVODh7W3U4FJc43C+avXClY
	2mqtLGWrqjZLVsVwVZYkTF7oSeC2dNDoT2G+yr8UfUCN+4rjFZzYNanlNTNtRSTB
	pdJnOfUmu9z8eytc3OH7w+ih9oq1BgSF1BKLxUn9F2yuCxQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4512gh972j-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 01:52:09 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 25 Feb 2025 01:52:06 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 25 Feb 2025 01:52:06 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 35CAC3F706D;
	Tue, 25 Feb 2025 01:52:06 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <corbet@lwn.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH v2] drivers: watchdog: Add support for panic notifier callback
Date: Tue, 25 Feb 2025 09:52:03 +0000
Message-ID: <20250225095203.2139482-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bGCIOzTepTq8SHJVlu2mrXvmlXKmvUCl
X-Authority-Analysis: v=2.4 cv=FLrhx/os c=1 sm=1 tr=0 ts=67bd92c9 cx=c_pps a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17 a=T2h4t0Lz3GQA:10 a=M5GUcnROAAAA:8 a=OmVHwVlGuMYDsWmUhBYA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: bGCIOzTepTq8SHJVlu2mrXvmlXKmvUCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01

Watchdog is not turned off in kernel panic situation.
In certain systems this might prevent the successful loading
of kdump kernel. The kdump kernel might hit a watchdog reset
while it is booting.

To avoid such scenarios add a panic notifier call back function
which can stop the watchdog. This provision can be enabled by
passing watchdog.stop_on_panic=1 via kernel command-line parameter.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
Changelog:
v1 -> v2
- Remove the per driver flag setting option
- Take the parameter via kernel command-line parameter to watchdog_core.

 drivers/watchdog/watchdog_core.c | 42 ++++++++++++++++++++++++++++++++
 include/linux/watchdog.h         |  8 ++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index d46d8c8c01f2..8cbebe38b7dd 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -34,6 +34,7 @@
 #include <linux/idr.h>		/* For ida_* macros */
 #include <linux/err.h>		/* For IS_ERR macros */
 #include <linux/of.h>		/* For of_get_timeout_sec */
+#include <linux/panic_notifier.h> /* For panic handler */
 #include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
@@ -47,6 +48,9 @@ static int stop_on_reboot = -1;
 module_param(stop_on_reboot, int, 0444);
 MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
 
+static int stop_on_panic = -1;
+module_param(stop_on_panic, int, 0444);
+MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");
 /*
  * Deferred Registration infrastructure.
  *
@@ -155,6 +159,23 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
 }
 EXPORT_SYMBOL_GPL(watchdog_init_timeout);
 
+static int watchdog_panic_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct watchdog_device *wdd;
+
+	wdd = container_of(nb, struct watchdog_device, panic_nb);
+	if (watchdog_active(wdd)) {
+		int ret;
+
+		ret = wdd->ops->stop(wdd);
+		if (ret)
+			return NOTIFY_BAD;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int watchdog_reboot_notifier(struct notifier_block *nb,
 				    unsigned long code, void *data)
 {
@@ -299,6 +320,14 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
 			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
 	}
 
+	/* Module parameter to force watchdog policy on panic. */
+	if (stop_on_panic != -1) {
+		if (stop_on_panic &&  !test_bit(WDOG_NO_WAY_OUT, &wdd->status))
+			set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
+		else
+			clear_bit(WDOG_STOP_ON_PANIC, &wdd->status);
+	}
+
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
 		if (!wdd->ops->stop)
 			pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
@@ -334,6 +363,16 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
 				wdd->id, ret);
 	}
 
+	if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status)) {
+		if (!wdd->ops->stop) {
+			pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
+		} else {
+			wdd->panic_nb.notifier_call = watchdog_panic_notify;
+			atomic_notifier_chain_register(&panic_notifier_list,
+						       &wdd->panic_nb);
+		}
+	}
+
 	return 0;
 }
 
@@ -390,6 +429,9 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
 	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
 		unregister_reboot_notifier(&wdd->reboot_nb);
 
+	if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status))
+		atomic_notifier_chain_unregister(&panic_notifier_list,
+						 &wdd->panic_nb);
 	watchdog_dev_unregister(wdd);
 	ida_free(&watchdog_ida, wdd->id);
 }
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 99660197a36c..3c21b527ede9 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -108,6 +108,7 @@ struct watchdog_device {
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
 	struct notifier_block pm_nb;
+	struct notifier_block panic_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
@@ -118,6 +119,7 @@ struct watchdog_device {
 #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
 #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
 #define WDOG_NO_PING_ON_SUSPEND	5	/* Ping worker should be stopped on suspend */
+#define WDOG_STOP_ON_PANIC	6	/* Should be stopped on panic for loading kdump kernels */
 	struct list_head deferred;
 };
 
@@ -146,6 +148,12 @@ static inline void watchdog_set_nowayout(struct watchdog_device *wdd, bool noway
 		set_bit(WDOG_NO_WAY_OUT, &wdd->status);
 }
 
+/* Use the following function to stop the watchdog on panic */
+static inline void watchdog_stop_on_panic(struct watchdog_device *wdd)
+{
+	set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
+}
+
 /* Use the following function to stop the watchdog on reboot */
 static inline void watchdog_stop_on_reboot(struct watchdog_device *wdd)
 {
-- 
2.34.1


