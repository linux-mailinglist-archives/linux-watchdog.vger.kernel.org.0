Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3D221D6A1
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 15:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgGMNUZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 09:20:25 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54502 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729751AbgGMNUY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 09:20:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIXOF090700;
        Mon, 13 Jul 2020 08:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594646313;
        bh=IsCx21R9uOak9QcS7V2jheu5SR94fsyWHn32kBIsdH8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kG09VKpebNsw7WybqlaWAHpeMirfS/GUqi2jbftB9uIIaYJ9PqxqJcJIs+NIwezE9
         U90FAyKAh8j4rGyGCXhJjVVutG/ocKEF+pQ4E2UYZqLeH5wsDpPF/PONyPXZZf711n
         5as93xlL3tp+ZmR7PyRL/ZTYBUfLxREbZRgmDlhc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06DDIXl9092260
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 13 Jul 2020 08:18:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 08:18:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 08:18:33 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIOXs015417;
        Mon, 13 Jul 2020 08:18:32 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv3 4/4] watchdog: rti-wdt: balance pm runtime enable calls
Date:   Mon, 13 Jul 2020 16:18:18 +0300
Message-ID: <20200713131818.825-5-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713131818.825-1-t-kristo@ti.com>
References: <20200713131818.825-1-t-kristo@ti.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/rti_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 45dfc546e371..5cc1a1d654b6 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -302,6 +302,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 err_iomap:
 	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
@@ -312,6 +313,7 @@ static int rti_wdt_remove(struct platform_device *pdev)
 
 	watchdog_unregister_device(&wdt->wdd);
 	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
 	return 0;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
