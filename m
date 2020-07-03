Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918272139C0
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jul 2020 14:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgGCMGd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jul 2020 08:06:33 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38622 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGCMGd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Qo9060614;
        Fri, 3 Jul 2020 07:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593777866;
        bh=yErUdsaQq1DKXS4cIgWJyC1B7C7lxDSI9EbVYJz4ysc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VGlo6T2wwJMA5CfjQlpalll3QXV43UhUY6sP9jtb2MqG/lWkRK34lRsWmTcwoib2r
         u0VjP1ZcYiuPNJl7eFPKDq8gTAv65mOQPuJfiKQBwYZKE2emDFx8rSuvSh6o/GYNVc
         rHBp//bAVYRNqy4qOCuIp3o0qiS+AbTCPweNDuvk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063C4QcC078799
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jul 2020 07:04:26 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 07:04:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 07:04:25 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Fkj109800;
        Fri, 3 Jul 2020 07:04:24 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv2 5/5] watchdog: rti-wdt: balance pm runtime enable calls
Date:   Fri, 3 Jul 2020 15:04:06 +0300
Message-ID: <20200703120406.7092-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703120406.7092-1-t-kristo@ti.com>
References: <20200703120406.7092-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PM runtime should be disabled in the fail path of probe and when
the driver is removed.

Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/watchdog/rti_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 987e5a798cb4..7007445da80b 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -304,6 +304,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 err_iomap:
 	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
@@ -314,6 +315,7 @@ static int rti_wdt_remove(struct platform_device *pdev)
 
 	watchdog_unregister_device(&wdt->wdd);
 	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
