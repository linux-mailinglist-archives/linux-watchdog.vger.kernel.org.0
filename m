Return-Path: <linux-watchdog+bounces-2981-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981DA3EACF
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 03:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AA63B6931
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2025 02:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211421D7E2F;
	Fri, 21 Feb 2025 02:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="a71xTtDu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071F93C2F;
	Fri, 21 Feb 2025 02:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740105384; cv=none; b=YLNBKYRgzI0OqW7DI9FpGZAv/x8yhia0E2EQQKco2F0LqkzLeGzw8qSoZ/OBj0rKLuAajWwunNyTX793hsUFAhYUxUs8Ofa6xfDe1+hhk3UJsUw0zqtq71kPj5a9bTBq9oT09OvOuOlUR/Tv4AYeaBtWVufr+pRwNE6GiWDIYvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740105384; c=relaxed/simple;
	bh=bZK0D6NskJV20GTUtw762wIucpi7jyCaWV4efMBFBJw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G72ityn/Td9vgN15llGRztZjQOww5vlWJ5ldggcOZqV9vpvb4kQbvMZAL1nlQcgbbNa7zEl+ioZNDkVAbp/YSx3wZz1fGz5WGaLpz1+cXnYj5W2I4y+Sk4gCrZHOKvPX1dtlysn4m/ucns63bXIVxCgA94kRwiD3eh7AYVFSrRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=a71xTtDu; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLpI4X019253;
	Thu, 20 Feb 2025 18:36:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=yrGSGxFZaPyMAX/abbQYP6Y
	xMutI6bHyx5LFZnAqtuc=; b=a71xTtDu5NQM6q5GRDyuBKOtLvldojJzSZlQl8S
	ux2GtvKRxWp/ggH4g0GIxj/7ZZ3y4qiBoXVsvqAdqjhOFIB1n/0dJreXaFYWeSia
	eRXlHFrxxpxFBCG+VDKO5M/Jp0y1Vy942okcUXtUi2c467QjvlyIUXfN8s5KOxrp
	LSDuXP6zEh2g4E2TU+XNx+V0Fs30zMDpFPhSqJ0dElzM0hC8fNbtZKD7YxH2tGO8
	Uem8yvgG/nIxEnUmsdZQ/Q2Fj4BKT/bJAOLYybZ7ilOiwggaR/MOWjh9GWojFU5h
	7oP1wyWZs+eSDq6StDpVwByU2prbfqFqLjqbf4QS0/6lf+Q==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44wu8pb3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 18:36:06 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 18:36:05 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 18:36:05 -0800
Received: from tx2-sever.caveonetworks.com (unknown [10.110.141.15])
	by maili.marvell.com (Postfix) with ESMTP id 221A53F708C;
	Thu, 20 Feb 2025 18:36:05 -0800 (PST)
From: George Cherian <george.cherian@marvell.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <corbet@lwn.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        George Cherian <george.cherian@marvell.com>
Subject: [PATCH 1/2] drivers: watchdog: Add support for panic notifier callback
Date: Fri, 21 Feb 2025 02:35:49 +0000
Message-ID: <20250221023550.2092232-1-george.cherian@marvell.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jaxOC1g25aDZTmy-Cop8rA6vdyl7fdW5
X-Proofpoint-GUID: jaxOC1g25aDZTmy-Cop8rA6vdyl7fdW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01

Watchdog is not turned off in kernel panic situation.
In certain systems this might prevent the successful loading
of kdump kernel. The kdump kernel might hit a watchdog reset
while it is booting.

To avoid such scenarios add a panic notifier call back function
which can stop the watchdog. This provision can be enabled on per
driver basis if the user wishes to by setting the flag
WDOG_STOP_ON_PANIC from respective drivers.

Signed-off-by: George Cherian <george.cherian@marvell.com>
---
 drivers/watchdog/watchdog_core.c | 31 +++++++++++++++++++++++++++++++
 include/linux/watchdog.h         |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index d46d8c8c01f2..cce29d54535c 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -34,6 +34,7 @@
 #include <linux/idr.h>		/* For ida_* macros */
 #include <linux/err.h>		/* For IS_ERR macros */
 #include <linux/of.h>		/* For of_get_timeout_sec */
+#include <linux/panic_notifier.h>
 #include <linux/suspend.h>
 
 #include "watchdog_core.h"	/* For watchdog_dev_register/... */
@@ -155,6 +156,23 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
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
@@ -334,6 +352,16 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
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
 
@@ -390,6 +418,9 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
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


