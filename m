Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F57C7AE8B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Sep 2023 11:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbjIZJNy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Sep 2023 05:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjIZJNy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Sep 2023 05:13:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C4FEB
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Sep 2023 02:13:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50307759b65so13575504e87.0
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Sep 2023 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695719626; x=1696324426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eRJvToNUf5WqQrtFGrRXNgdtxFqUONQI/Mo3ZEgnrNU=;
        b=mDn/p7CShxu0orOdEDjPOIOmGTEwe8uK0x80Ssxpaayp6IftnzGlLSg6nf0fcfoNfC
         M+b5c6C7RAj+/LV9VEgBURQKiq6hwWjuQCWhHa4jjOTEnyo0oEEzDWY/Box24nWhJ23R
         ABCcNu9aO9PhLhm+U5ocpPt2EkoAUjhhDvNgDWdee45N0Ea0GQbZgy1wKG8l3CXtuQ7w
         0I/8ax2pvaqAScDE8q7iQBzsc2WFduDyUbCXsyf+7IYgXq5oUk321rICAWhGNUtvlkJ/
         aNJJAhSbvifkoly0wbm+9w5VVjlZm1ydqt5MK5hEoyRpi35OrpFnjy+qB8GH53YALFuD
         Au1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695719626; x=1696324426;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRJvToNUf5WqQrtFGrRXNgdtxFqUONQI/Mo3ZEgnrNU=;
        b=JNMr4Pjxm7aGLxRCoRstf4sY4bP/wLb5ker+JNiPl+zI25QaaHIagguXu/OYcR3fW1
         aZ8PTabrtm7PIqYB25wSUvZTD1ABVPZNag3ilrj6OhHvG9B3+Q8/eDLohkemcOjaMpll
         BQHMnAbaK96rUYEF/dORx/4RUKh18rgmRqqvf0ZWbYundlEh0AJgtTC/gWV0fQ6Oqj2z
         X8+8Hqp+SeirsgHNuKGLIokVWNVjuPq/kYXsCYVfulaZGFISUp13HercABHl5VUlZAme
         HhgLG+6+j5vbZjemH60yrG95UOEpkGmX2Ni4fkU1HXC6sVQyj5LbKo/qEosB12DIqlMe
         vrnw==
X-Gm-Message-State: AOJu0YxAVogHh5ulOztgJJlLpnS30AlcDLZc8B5Pvdmdg8Lf8ozjAIZl
        rwqS9AAM2oGlwXs1WoLk1v4lKg==
X-Google-Smtp-Source: AGHT+IHQC2xWWevS8Hi+Jr/qaTcfGVDca/jkUjpllY+Uc4Ot+5d3IGKnBnZr1mdGhCNBdq/0TbWuOw==
X-Received: by 2002:a05:6512:b1a:b0:502:a942:d7a8 with SMTP id w26-20020a0565120b1a00b00502a942d7a8mr8084934lfu.69.1695719625468;
        Tue, 26 Sep 2023 02:13:45 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id n19-20020a195513000000b004fba82dde47sm2151248lfe.123.2023.09.26.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 02:13:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 11:13:44 +0200
Subject: [PATCH v2] watchdog: ixp4xx: Make sure restart always works
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-ixp4xx-wdt-restart-v2-1-15cf4639b423@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMegEmUC/22NywrCMBBFf0Vm7UiT1Edd+R/SRWMm7YA0ZRJqp
 PTfjQV3Ls+Be+4CkYQpwnW3gNDMkcNYQO938Bi6sSdkVxh0pU3V6Bo5T3XO+HIJhWLqJKE7Wa8
 vdWPU2UAZTkKe8xa9t4UHjinIe/uY1df+csd/uVmhQk/aNlYZ5ay/PXnsJByC9NCu6/oBv15jF
 LUAAAA=
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The IXP4xx watchdog in early "A0" silicon is unreliable and
cannot be registered, however for some systems such as the
USRobotics USR8200 the watchdog is the only restart option,
so implement a "dummy" watchdog that can only support restart
in this case.

Fixes: 1aea522809e6 ("watchdog: ixp4xx: Implement restart")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Switch debugprint about only supporting restart from dev_err()
  to dev_info().
- Link to v1: https://lore.kernel.org/r/20230925-ixp4xx-wdt-restart-v1-1-fe2b9b131dbf@linaro.org
---
 drivers/watchdog/ixp4xx_wdt.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 607ce4b8df57..ec0c08652ec2 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -105,6 +105,25 @@ static const struct watchdog_ops ixp4xx_wdt_ops = {
 	.owner = THIS_MODULE,
 };
 
+/*
+ * The A0 version of the IXP422 had a bug in the watchdog making
+ * is useless, but we still need to use it to restart the system
+ * as it is the only way, so in this special case we register a
+ * "dummy" watchdog that doesn't really work, but will support
+ * the restart operation.
+ */
+static int ixp4xx_wdt_dummy(struct watchdog_device *wdd)
+{
+	return 0;
+}
+
+static const struct watchdog_ops ixp4xx_wdt_restart_only_ops = {
+	.start = ixp4xx_wdt_dummy,
+	.stop = ixp4xx_wdt_dummy,
+	.restart = ixp4xx_wdt_restart,
+	.owner = THIS_MODULE,
+};
+
 static const struct watchdog_info ixp4xx_wdt_info = {
 	.options = WDIOF_KEEPALIVEPING
 		| WDIOF_MAGICCLOSE
@@ -114,14 +133,17 @@ static const struct watchdog_info ixp4xx_wdt_info = {
 
 static int ixp4xx_wdt_probe(struct platform_device *pdev)
 {
+	static const struct watchdog_ops *iwdt_ops;
 	struct device *dev = &pdev->dev;
 	struct ixp4xx_wdt *iwdt;
 	struct clk *clk;
 	int ret;
 
 	if (!(read_cpuid_id() & 0xf) && !cpu_is_ixp46x()) {
-		dev_err(dev, "Rev. A0 IXP42x CPU detected - watchdog disabled\n");
-		return -ENODEV;
+		dev_info(dev, "Rev. A0 IXP42x CPU detected - only restart supported\n");
+		iwdt_ops = &ixp4xx_wdt_restart_only_ops;
+	} else {
+		iwdt_ops = &ixp4xx_wdt_ops;
 	}
 
 	iwdt = devm_kzalloc(dev, sizeof(*iwdt), GFP_KERNEL);
@@ -141,7 +163,7 @@ static int ixp4xx_wdt_probe(struct platform_device *pdev)
 		iwdt->rate = IXP4XX_TIMER_FREQ;
 
 	iwdt->wdd.info = &ixp4xx_wdt_info;
-	iwdt->wdd.ops = &ixp4xx_wdt_ops;
+	iwdt->wdd.ops = iwdt_ops;
 	iwdt->wdd.min_timeout = 1;
 	iwdt->wdd.max_timeout = U32_MAX / iwdt->rate;
 	iwdt->wdd.parent = dev;

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230924-ixp4xx-wdt-restart-d6bf28493173

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

