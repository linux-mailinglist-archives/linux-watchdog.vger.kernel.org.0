Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51118354237
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 15:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbhDENBm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 09:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDENBm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 09:01:42 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C00C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 06:01:36 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id w3so16697096ejc.4
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Apr 2021 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXpI45z8prm1S/0gV7wr7IfGG5ighcGpBQdN9DAdQ0c=;
        b=PeQFaBmbm+gKQUJljLwYHQ+BUqi/6OKt0p+RN0mmb9Rjvn9WmcTIHt8trP35Elp3xS
         L+i/Fx9IBJZ/HkkrrrSBOKqXuwPisPbCOZXfhNaaiKfrwMPlKbPOex12pTewv12Bs/iB
         HWoCR1dtijYP/cmaAxy5wcfLppxsHcb8CxQHCKwbD/lc5DZw640EAkyt0Sack+HjAMvg
         mU3LUuh7ydHyThxEGufEp2bBo9tkSD1bMjcVPI0Ubydt8hqPdG0ROeU42aSfYaBgrWfi
         RgvmtytW6E5PaBBtVBlPtKVZcHAwXSJw/CYMkyo+3omPyLZYpCISJYWtidxuOEYZqpzL
         Aojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXpI45z8prm1S/0gV7wr7IfGG5ighcGpBQdN9DAdQ0c=;
        b=Ix9UMkBZ+OTb36dEkTz80YVOC/n+OcILrczf+PYaQ0sM3PQfl+QBjr5fkAIP/z/QGM
         cSbabKxM1zwqxBQ+TrlfEyiC12wMzTubuq2Ag6t9H4BD4geIS+id50MnAaZ6M9k5DoDu
         4c6c+5W/lQmvL0ayCs2nfwlNeUSC17KopIGcYwi28ARkHecjnEvh9aJgtYWCaeGNxFr6
         kEvQSNjhMVmIs7Oh7xKTi1j9+BV6hDqj6EQCXvji/fWQwUlGs0M4uoB0gduvOesTeYcM
         +nNZDnmG2Z/6BBDGmaMuRq041dtnuPg7z3agtDdnoo8frYaO6dX5LEieTb3jShC5dcgt
         PMww==
X-Gm-Message-State: AOAM5334iaQziNZGg1zDDfHlPFkUm4yvlNQTtMmVmISlk3xjl8b5dT/4
        ytEExtF+487zTf3tEoRLdzRWidI3U8S7UZKq
X-Google-Smtp-Source: ABdhPJwM9bvq6Udit9rFxxAkerOOZkAQhBnt+GCYPqEMKKsRuGdck3tDUKFwhNSDTLJJAeWIS28pNg==
X-Received: by 2002:a17:906:2e9a:: with SMTP id o26mr11464091eji.357.1617627694776;
        Mon, 05 Apr 2021 06:01:34 -0700 (PDT)
Received: from eichest-laptop.lan (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id cy5sm11103296edb.46.2021.04.05.06.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 06:01:34 -0700 (PDT)
From:   eichest@gmail.com
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Stefan Eichenberger <eichest@gmail.com>
Subject: [PATCH] watchdog: imx_sc_wdt: fix pretimeout
Date:   Mon,  5 Apr 2021 14:59:48 +0200
Message-Id: <20210405125946.369230-1-eichest@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Stefan Eichenberger <eichest@gmail.com>

If the WDIOF_PRETIMEOUTE flag is not set when registering the device the
driver will not show the sysfs entries or register the default governor.
By moving the registering after the decision whether pretimeout is
supported this gets fixed.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/watchdog/imx_sc_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index e9ee22a7cb45..eddb1ae630e0 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -183,10 +183,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 
-	ret = devm_watchdog_register_device(dev, wdog);
-	if (ret)
-		return ret;
-
 	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
@@ -213,6 +209,10 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
 	else
 		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
 
+	ret = devm_watchdog_register_device(dev, wdog);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.27.0

