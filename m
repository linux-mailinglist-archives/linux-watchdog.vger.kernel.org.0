Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20C5473071
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 16:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240096AbhLMP1M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 10:27:12 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:60167 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234975AbhLMP1M (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 10:27:12 -0500
X-IronPort-AV: E=Sophos;i="5.88,202,1635174000"; 
   d="scan'208";a="103326609"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2021 00:27:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B14E40078D4;
        Tue, 14 Dec 2021 00:27:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
Date:   Mon, 13 Dec 2021 15:26:58 +0000
Message-Id: <20211213152658.26225-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
References: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch uses the force reset(WDTRSTB) for triggering WDT reset
(WDTRSTB). This method is faster compared to the overflow method
for triggering watchdog reset.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V1->V2:
 * Updated the commit description.
---
 drivers/watchdog/rzg2l_wdt.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index d1b5cb70d56c..94f98825ab8d 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -21,8 +21,11 @@
 #define WDTSET		0x04
 #define WDTTIM		0x08
 #define WDTINT		0x0C
+#define PECR		0x10
+#define PEEN		0x14
 #define WDTCNT_WDTEN	BIT(0)
 #define WDTINT_INTDISP	BIT(0)
+#define PEEN_FORCE_RST	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT		60U
 
@@ -141,22 +144,12 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
-	int ret;
 
-	/* Reset the module before we modify any register */
-	ret = reset_control_reset(priv->rstc);
-	if (ret) {
-		dev_err(wdev->parent, "failed to reset");
-		return ret;
-	}
+	/* Generate Reset (WDTRSTB) Signal */
+	rzg2l_wdt_write(priv, 0, PECR);
 
-	pm_runtime_get_sync(wdev->parent);
-
-	/* smallest counter value to reboot soon */
-	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
-
-	/* Enable watchdog timer*/
-	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
+	/* Force reset (WDTRSTB) */
+	rzg2l_wdt_write(priv, PEEN_FORCE_RST, PEEN);
 
 	return 0;
 }
-- 
2.17.1

