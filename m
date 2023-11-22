Return-Path: <linux-watchdog+bounces-19-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC17F3CB3
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 05:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB711C20E9B
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Nov 2023 04:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75789BE45;
	Wed, 22 Nov 2023 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TxTZNu7k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB58BA4;
	Tue, 21 Nov 2023 20:17:16 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AM4GlnI026736;
	Tue, 21 Nov 2023 22:16:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700626607;
	bh=2QwHzizvXnwi2gIoXfGTNVgb+YIpsEqc/zkQqkt1laY=;
	h=From:To:CC:Subject:Date;
	b=TxTZNu7kqQIOw55qt7E+wi1vsAzzdwMn4qFxSkFZzbj/mMe2vLnBDLsdINc5jF9Gx
	 GwVwsrILBWsmZ/koy8NFmEgIm/bTHePZVxxRhgmYCK8PFiGylV89bENowtUzTgNpkT
	 CTVsFyq245Mdowqar3Uue0hDISGwF7HhpDdheKs0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AM4GljK108302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Nov 2023 22:16:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Nov 2023 22:16:46 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Nov 2023 22:16:46 -0600
Received: from uda0132425.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AM4Gh9G065087;
	Tue, 21 Nov 2023 22:16:44 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <afd@ti.com>
Subject: [PATCH v2] watchdog: rti_wdt: Drop RPM count when unused
Date: Wed, 22 Nov 2023 09:46:42 +0530
Message-ID: <20231122041642.2015936-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Do a RPM put if watchdog is not already started during probe and re
enable it in watchdog start.

On K3 SoCs, watchdogs and their corresponding CPUs are under same PD, so
if the reference count of unused watchdogs aren't dropped, it will lead
to CPU hotplug failures as Device Management firmware won't allow to
turn off the PD due to dangling reference count.

Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

v2:
* Drop 1/2 (will be posted along with runtime_pm callbacks)
* Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync() which
 takes care of err handling

v1: lore.kernel.org/r/20231110100726.2930218-1-vigneshr@ti.com

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
2.42.0


