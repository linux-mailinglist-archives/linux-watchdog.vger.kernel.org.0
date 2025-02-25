Return-Path: <linux-watchdog+bounces-3005-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE1A441C8
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 15:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660B87A8B94
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 14:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A62A26772D;
	Tue, 25 Feb 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="c2vmPaIn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD626A092;
	Tue, 25 Feb 2025 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492412; cv=none; b=mGV9q+59UZSpqATCpTi5XA+pCTH43avzLCf07woj98l0yKJJy7Yp3jXVjgQXRH6skGP2S1mqxLhzaPqhH5sC1jJgb2nTvPWTrRoj3O/INHRgmOGtpees08HGsk8bvs7G+dvEYqqeHHwT1KaN8Jzv96/wt6Xv9TLCVdCoi1UgD/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492412; c=relaxed/simple;
	bh=M7oqMVzbbhG+SttZEb8GQg30c0sA18a1xTh4dtesdIM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PerQ3sZXR1nQciw8P11jJh3RURiNdSdPmB+sb85f8Bq3CfydVkujz02ypNkRt0/IRIqZg2o1rdXvbGGIno0m6nBFk2DmwJQVYTUxTNDJmIkxES5ee0bm4EOaPWtkQDU+r7+QST3W0j2ZjvMkbVxCRG5hCz/jmLx6C4DTE0Tvhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=c2vmPaIn; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PE66BH013112;
	Tue, 25 Feb 2025 06:06:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=ueaqfgYOPfU7pacwLQ3jjff
	9NVBgGQu5G4U/N2L7ySA=; b=c2vmPaIn/qCw5j2JAgjuWkyKIhCdviJSO/R/P2z
	dSuAoQAzLLQRxU9/R9n9zXGc4WUBltu+tmdbaXZIySLLPpvKidpPrgTLdvlhHCmC
	TEla/wVjyEvgzix+HoZpHXVNJUkqYOwWt2mtGhTbGhvnHP8evv2lMO+4wsCJ6Y42
	RHzmMLtSuuoUm2ZUKZexFh4Qnqe9MhBDP/c0CNL8CL3rPfEjtlnaLxxjZ+rhlwPh
	XFqC+oGxjQEiq9F31odkEGURJa8qVJnma14FoNHjnhD+72GKpD+CS6q1CG2OMKan
	i+bjALfTZA3vB9AAFdFOkjclGZcMdbH8TdsV1ZYEiVfsBrw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 451fawg01j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 06:06:24 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 25 Feb 2025 06:06:20 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 25 Feb 2025 06:06:20 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 68CCF3F7040;
	Tue, 25 Feb 2025 06:06:20 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <corbet@lwn.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH v3] drivers: watchdog: Add support for panic notifier callback
Date: Tue, 25 Feb 2025 14:06:15 +0000
Message-ID: <20250225140615.2141119-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ovi1yz/t c=1 sm=1 tr=0 ts=67bdce60 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=T2h4t0Lz3GQA:10 a=M5GUcnROAAAA:8 a=OmVHwVlGuMYDsWmUhBYA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: ns0TcKWY8M1ozPMwfEI8JMfnq0LrB8lQ
X-Proofpoint-GUID: ns0TcKWY8M1ozPMwfEI8JMfnq0LrB8lQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01

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

v2 -> v3
- Remove the helper function watchdog_stop_on_panic() from watchdog.h.
- There are no users for this. 

 drivers/watchdog/watchdog_core.c | 42 ++++++++++++++++++++++++++++++++
 include/linux/watchdog.h         |  2 ++
 2 files changed, 44 insertions(+)

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
index 99660197a36c..ef6f1136a4c5 100644
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
 
-- 
2.34.1


