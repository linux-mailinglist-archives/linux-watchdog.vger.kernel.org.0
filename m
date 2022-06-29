Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4EE155FAFC
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 10:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbiF2Iss (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 04:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiF2Isr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 04:48:47 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243773CFDB;
        Wed, 29 Jun 2022 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1zHHTk30qvYg0NNWrgCR4OkuDHBLcPmoA3RGRJcNtZg=; b=aByI+JUdpUINa5miQrIDDe8TWK
        DwQAifGcnXN5rotUZxeSASfYQOFnYb2B1z6gI5x77ufh54cEFM0auQcd+XRFYZpLBfZYXm/PtaI3H
        MLnaFm6GxlwWj3hx5GRV610eGCizY8WCCgXHal03M5skeU0mozarJwEYuAqwSqabQjJh7KTPONniL
        WnV6Sc0V4aPsWWXlhlCmcHemWTCwkt7CdxOCSTRR2nR4b0LDfeVxv5OLnH4AawgBxe92hvEQgWWzR
        LhWr3Mlgiff6dTDnVytVRu4x+vY8kRzo0IHIV3FHRgzDFRS8+25rZTdrJB1QwFyOESrXPswqq/JLA
        SJZv09Jg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6TNI-006RUL-5X; Wed, 29 Jun 2022 10:48:40 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 3/3] watchdog: pm8916_wdt: Handle watchdog enabled by bootloader
Date:   Wed, 29 Jun 2022 10:48:16 +0200
Message-Id: <20220629084816.125515-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
References: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The bootloader might already enable the watchdog to catch hangs
during the boot process. In that case the kernel needs to ping
the watchdog temporarily until userspace is fully started.

Add a check for this in the probe() function and set the WDOG_HW_RUNNING
flag to make the watchdog core handle this automatically.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Changes in v2: Improve error handling (suggested by Guenter)
---
 drivers/watchdog/pm8916_wdt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 49f1a5204526..f4bfbffaf49c 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -142,6 +142,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct pm8916_wdt *wdt;
 	struct device *parent;
+	unsigned int val;
 	int err, irq;
 	u8 poff[2];
 
@@ -199,6 +200,15 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	if (poff[1] & PON_POFF_REASON2_OTST3)
 		wdt->wdev.bootstatus |= WDIOF_OVERHEAT;
 
+	err = regmap_read(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL2,
+			  &val);
+	if (err)  {
+		dev_err(dev, "failed to check if watchdog is active: %d\n", err);
+		return err;
+	}
+	if (val & S2_RESET_EN_BIT)
+		set_bit(WDOG_HW_RUNNING, &wdt->wdev.status);
+
 	/* Configure watchdog to hard-reset mode */
 	err = regmap_write(wdt->regmap,
 			   wdt->baseaddr + PON_PMIC_WD_RESET_S2_CTL,
-- 
2.30.2

