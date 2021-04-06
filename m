Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950D335536B
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 14:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238620AbhDFMPX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 08:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233385AbhDFMPW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 08:15:22 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D134C06174A
        for <linux-watchdog@vger.kernel.org>; Tue,  6 Apr 2021 05:15:13 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ba6so8762593edb.1
        for <linux-watchdog@vger.kernel.org>; Tue, 06 Apr 2021 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sRr//mSXW0qNkdz7KvUofiyzAbmUzDGvq8AbMB4E84=;
        b=YoR1wNRdBPTdi3fyZ+LEx5H+jowwWcjOps6zZNlOxQxvrq9R55iV+5YVpSXqhFuT/t
         qq4QdcZwZhik13tS4+TQRLEtOf+Uvc00vNKsyLZGa7ho0mi2xMzwOGxA8Z2TYlZ3dVVK
         CNd9hIpPPIUfPvCSn37kePuIgMFqdD6z4XR55LXYr24BuPN2UW2CChWCogoj23m36XfE
         e3NhHTZH06jA25+Kg1IcKOez+bBJgU2lJx5QjAvZFx9gL4IgeaQB1d+6LMqZyEZYmdg4
         e9i2jHE0vjwu60Hk4U08Va/8Ofsz0OeXS+6Y7Bufd1LZjMrtcH3MRAi7fTiRzZGIYD8f
         6Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3sRr//mSXW0qNkdz7KvUofiyzAbmUzDGvq8AbMB4E84=;
        b=nOa36guR9Oyv/iaHDPbUDHQQVzROLrqmiX9QxAPqY7ddsjtHvqI/2c+0jpOlxpIONV
         3bbEKInk/QvZv3hBk0N9CMc+Hbt9dNkomoAqpDZOO78cmUUZb32KMAqxPAuKRbNpZ7nZ
         14Zwis8UUyqA6OiSQ13TYh5EQQaTKwXidt7ePh3xyjyejqNUoXlnTo5d1gUSM1u/YecM
         IMFug4uTMwPUoP8VB0jicBBPQuFcyrd87G0oHX9EdDdbAhs9w4M8oxxF+GWmsevJwlh5
         jwOqopdoBDb7QNEGln2u6HsguG5ung9sdrdoLRIdmzsnrm/EeDHfT7R6WOjOJyxnzHH5
         oMVw==
X-Gm-Message-State: AOAM530qqoWgdAtHFmOnmdSRpRyHc7OD0ArptToBeeK9t10f21jCxPS5
        mYCO8hz9pVBJchrzVFur0jJ+foV0pBOkq0rv
X-Google-Smtp-Source: ABdhPJxgoVzeFSZfcHKuXEYgiqmqRtEtq4YgGRCbwMXICNxcHf3neBfniN2I67id/Ri8jPGEzOrvMA==
X-Received: by 2002:a05:6402:c:: with SMTP id d12mr36799746edu.100.1617711311734;
        Tue, 06 Apr 2021 05:15:11 -0700 (PDT)
Received: from eichest-laptop.lan (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id lj21sm690378ejb.64.2021.04.06.05.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 05:15:11 -0700 (PDT)
From:   eichest@gmail.com
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Eichenberger <eichest@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2] watchdog: imx_sc_wdt: fix pretimeout
Date:   Tue,  6 Apr 2021 14:12:47 +0200
Message-Id: <20210406121246.49335-1-eichest@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Stefan Eichenberger <eichest@gmail.com>

If the WDIOF_PRETIMEOUT flag is not set when registering the device the
driver will not show the sysfs entries or register the default governor.
By moving the registering after the decision whether pretimeout is
supported this gets fixed.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/watchdog/imx_sc_wdt.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index e9ee22a7cb45..8ac021748d16 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -183,16 +183,12 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 
-	ret = devm_watchdog_register_device(dev, wdog);
-	if (ret)
-		return ret;
-
 	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
 	if (ret) {
 		dev_warn(dev, "Enable irq failed, pretimeout NOT supported\n");
-		return 0;
+		goto register_device;
 	}
 
 	imx_sc_wdd->wdt_notifier.notifier_call = imx_sc_wdt_notify;
@@ -203,7 +199,7 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 					 false);
 		dev_warn(dev,
 			 "Register irq notifier failed, pretimeout NOT supported\n");
-		return 0;
+		goto register_device;
 	}
 
 	ret = devm_add_action_or_reset(dev, imx_sc_wdt_action,
@@ -213,7 +209,8 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	else
 		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
 
-	return 0;
+register_device:
+	return devm_watchdog_register_device(dev, wdog);
 }
 
 static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
-- 
2.27.0

