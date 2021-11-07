Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126ED4475D6
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhKGUdV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhKGUdJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:33:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B42C07978C
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:30:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id p16so31613147lfa.2
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+qK7/brq27ekH8nrj1tS/lSC1KVkFATkys6si61XPg=;
        b=emsUoD0UPMXYEQnBBNozpHlD8Lp5cBTMi6QYw/WDxeqBn9y+8GFBD1r36kPaiuQvMR
         4voUCS62JqA4az0uDfsUIUkJHxB8U4QUepoqIMIoxPV6SaBEzwEsZZ7LsX/kiMvKd1FD
         hSzRU1TbUfmG5Asg7n2/tfvkY3WgFEJlYsMJ61AGBPloAp52GGMrA1esxOEeirZoAAUW
         zOciY5PePC1qHhO+1RUsAT9IB3OC1Ike55ExGpzlg3h4gF3RCjeIq9V0O6SP3+XAmI19
         z8PNZSVZV1Gjec8YdVM0EVlf4SLAC3Ua5qpp4hhD0e/4CMRj/TyJ/Eo0uVx5ElAt/Jmr
         Q//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+qK7/brq27ekH8nrj1tS/lSC1KVkFATkys6si61XPg=;
        b=qn37eSF3f2W2uoErKWHPfCT5BlAwQ1jzzgI0YqFwrYYcYxWD7DY4utnYfTBmcnLWzp
         5LRVAUkDAfAWEvbdQckeS80sjqJCvrGUGDtVbN2X0DuD5a1ifWI10d5cylcABrLZ5CrH
         f6My/cbKz/f6a7mcCZAgHakF5YDrOOLHsjk2uPtMklrMO4c523GwukRpgWz33EnbzSq0
         k3VsIe6KEBPqjDF7ZEvkAjkeBEoSZEbihXLqgv8HzLZZb8JAiZAdDoL2Z8OzC9V0p+ya
         iqW/C1fPmsD9QECr6umWhSbgsv/xFpJoY9or82bnkFHrwAU6QaPF1BaCpN0dpMG/gMDX
         dIjw==
X-Gm-Message-State: AOAM531ZMm3ug8iZK3qM5ox1NEobOxNM47qOcFzJZ/CDZllWFMeDl2gl
        G1JUIVJfHaDWXdPPo38xvF+xuA==
X-Google-Smtp-Source: ABdhPJx7pniBfJ046V9vGEp2NO/Qje5fxun851MFD75SQmupF8hRyft85IIKB+QhHAxj/ZusubgkMw==
X-Received: by 2002:a05:6512:261f:: with SMTP id bt31mr68786209lfb.506.1636317003797;
        Sun, 07 Nov 2021 12:30:03 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h13sm1114714lfv.90.2021.11.07.12.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:30:03 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 11/12] watchdog: s3c2410: Remove superfluous err label
Date:   Sun,  7 Nov 2021 22:29:42 +0200
Message-Id: <20211107202943.8859-12-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

'err' label in probe function is not really need, it just returns.
Remove it and replace all 'goto' statements with actual returns in
place.

No functional change here, just a cleanup patch.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index f31bc765a8a5..96aa5d9c6ed4 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -627,22 +627,18 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (wdt_irq == NULL) {
 		dev_err(dev, "no irq resource specified\n");
-		ret = -ENOENT;
-		goto err;
+		return -ENOENT;
 	}
 
 	/* get the memory region for the watchdog timer */
 	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->reg_base)) {
-		ret = PTR_ERR(wdt->reg_base);
-		goto err;
-	}
+	if (IS_ERR(wdt->reg_base))
+		return PTR_ERR(wdt->reg_base);
 
 	wdt->bus_clk = devm_clk_get(dev, "watchdog");
 	if (IS_ERR(wdt->bus_clk)) {
 		dev_err(dev, "failed to find bus clock\n");
-		ret = PTR_ERR(wdt->bus_clk);
-		goto err;
+		return PTR_ERR(wdt->bus_clk);
 	}
 
 	ret = clk_prepare_enable(wdt->bus_clk);
@@ -757,7 +753,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_bus_clk:
 	clk_disable_unprepare(wdt->bus_clk);
 
- err:
 	return ret;
 }
 
-- 
2.30.2

