Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFFE47306E
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 16:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240090AbhLMP1K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 10:27:10 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:60167 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234672AbhLMP1K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 10:27:10 -0500
X-IronPort-AV: E=Sophos;i="5.88,202,1635174000"; 
   d="scan'208";a="103326604"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Dec 2021 00:27:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 74CB740078D4;
        Tue, 14 Dec 2021 00:27:07 +0900 (JST)
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
Subject: [PATCH v2 3/4] watchdog: rzg2l_wdt: Add set_timeout callback
Date:   Mon, 13 Dec 2021 15:26:57 +0000
Message-Id: <20211213152658.26225-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
References: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Once watchdog is started, WDT cycle setting register(WDTSET) cannot be
changed. However we can reconfigure the new value for WDSET, after a
module reset. Otherwise it will ignore the writes and will hold the
previous value instead of the updated one.

This patch add support for set_timeout callback by doing module
reset, which allows us to update WDTSET register. Based on the
watchdog timer state, it may restart WDT with the modified values.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V1->V2:
 * Updated commit description
 * Removed stop/start and started using reset() instead.
 * After reset, Start WDT based on watchdog timer state.
---
 drivers/watchdog/rzg2l_wdt.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 0e62d7be153c..d1b5cb70d56c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -110,6 +110,33 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 	return reset_control_reset(priv->rstc);
 }
 
+static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
+{
+	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
+
+	wdev->timeout = timeout;
+
+	/*
+	 * We need to reset the module for updating WDTSET register
+	 * If watchdog is active, then decrement the PM counter to make
+	 * it balanced, after reset operation.
+	 */
+	if (watchdog_active(wdev))
+		pm_runtime_put(wdev->parent);
+
+	/* Reset the module for updating WDTSET register */
+	ret = reset_control_reset(priv->rstc);
+	if (watchdog_active(wdev)) {
+		if (ret)
+			pm_runtime_get_sync(wdev->parent);
+		else
+			rzg2l_wdt_start(wdev);
+	}
+
+	return ret;
+}
+
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
 			     unsigned long action, void *data)
 {
@@ -153,6 +180,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
 	.start = rzg2l_wdt_start,
 	.stop = rzg2l_wdt_stop,
 	.ping = rzg2l_wdt_ping,
+	.set_timeout = rzg2l_wdt_set_timeout,
 	.restart = rzg2l_wdt_restart,
 };
 
-- 
2.17.1

