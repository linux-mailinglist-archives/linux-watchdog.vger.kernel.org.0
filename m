Return-Path: <linux-watchdog+bounces-301-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CB8113FA
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 15:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78BDCB20D5D
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 14:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155152E620;
	Wed, 13 Dec 2023 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PwE8pVzJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8507010CB;
	Wed, 13 Dec 2023 06:01:33 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3BDE1IuP028512;
	Wed, 13 Dec 2023 08:01:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702476078;
	bh=IV6ikSPAmmlnSTHeM2+mRbfELz8qQ4FfHSx+eC/mlUY=;
	h=From:To:CC:Subject:Date;
	b=PwE8pVzJjyJcbHyHaYGXhmnl9I4NXVj0bMxdcSvf3SRMv9kea1UaeNu9GrnX+0qsI
	 eJN9sfaQhIQsiVUl+b68pIvQ/Thx573uswizppIYRvuFSVDDHu1cS/eOrAyEN7G+bX
	 fhsGHp6jU3bhBS5sfO4Rs2o+F/32YquXVXRr39N4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3BDE1Ibe015489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Dec 2023 08:01:18 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Dec 2023 08:01:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Dec 2023 08:01:18 -0600
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3BDE1FwW047173;
	Wed, 13 Dec 2023 08:01:16 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>
CC: Manorit Chawdhry <m-chawdhry@ti.com>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3] watchdog: rti_wdt: Drop runtime pm reference count when watchdog is unused
Date: Wed, 13 Dec 2023 19:31:10 +0530
Message-ID: <20231213140110.938129-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Call runtime_pm_put*() if watchdog is not already started during probe and re
enable it in watchdog start as required.

On K3 SoCs, watchdogs and their corresponding CPUs are under same
power-domain, so if the reference count of unused watchdogs aren't
dropped, it will lead to CPU hotplug failures as Device Management
firmware won't allow to turn off the power-domain due to dangling
reference count.

Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v3:
Reword commit message to expand non std acronyms
Collect Reviewed-by and Tested-by tags
No code change

v2: https://lore.kernel.org/r/20231122041642.2015936-1-vigneshr@ti.com

v2:
* Drop 1/2 (will be posted along with runtime_pm callbacks)
* Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync() which
 takes care of err handling

v1: https://lore.kernel.org/r/20231110100726.2930218-1-vigneshr@ti.com

 drivers/watchdog/rti_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 8e1be7ba0103..9215793a1c81 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -77,6 +77,11 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 {
 	u32 timer_margin;
 	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(wdd->parent);
+	if (ret)
+		return ret;
 
 	/* set timeout period */
 	timer_margin = (u64)wdd->timeout * wdt->freq;
@@ -343,6 +348,9 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	if (last_ping)
 		watchdog_set_last_hw_keepalive(wdd, last_ping);
 
+	if (!watchdog_hw_running(wdd))
+		pm_runtime_put_sync(&pdev->dev);
+
 	return 0;
 
 err_iomap:
@@ -357,7 +365,10 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
 
 	watchdog_unregister_device(&wdt->wdd);
-	pm_runtime_put(&pdev->dev);
+
+	if (!pm_runtime_suspended(&pdev->dev))
+		pm_runtime_put(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.43.0


