Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6D97AD144
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Sep 2023 09:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjIYHUS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Sep 2023 03:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjIYHUR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Sep 2023 03:20:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B326A10A
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Sep 2023 00:20:07 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so92927161fa.3
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Sep 2023 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695626406; x=1696231206; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bxM9GVR4VSyyuE43awaZA1Wf9nkVTXawgZ7CU1WHNlk=;
        b=QHfa9thXAP8hbolUZ3uR7e+tTwQEAdB3+Ym8szSQSFnWqNyxNdIVEydIYtqslqTjmZ
         97+NyqIIVufa5W3hTkTJ/r/JqCnSHqEVSsvHC0UecsVVknupUG6YkZFCKLlt82C4Jsy6
         SWIfzuuVsinAxXydqfYwR+RSphaZQ5JXTFyyECYCM1Kkqs2+92xLcrJmyiTdbovBQ9+g
         /yipWL1c0wbM27DlOE3HgajaSjMbHbrLB2n/2Zs9qC795Q9jCpF7okOhIByWAu1KF3Vd
         sdGyhsqoIxm/AOB08hFSvZlBU4WkrUwZOdKkJQZlzJe2pdK96gxVhLSAIYHEXbpIq8KL
         NIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695626406; x=1696231206;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxM9GVR4VSyyuE43awaZA1Wf9nkVTXawgZ7CU1WHNlk=;
        b=XhRVxxj9AC0ij8CdLJMGPkNy1ESbWowhC8efoF0nO8czeqotPTNgsvkK7/uzacF0fT
         ZAtyvJoUDkhk8U7MDK8Wpp+4chSOt+WzKOY3SFVlZpi3x86DfEgJLdt5PLqk0yp73J6g
         pf6r2IfIDkG7/7ECjKn65Y9ot6EZbg/1h00Z6G332Mlgn7KUJY5nLXRtRpqaPB23n1GF
         5rJGG0ETAc9A1YjOGED7+MLd36D8/OX/+ZWBnfKSSJpj+Drk4bVDxTJQ+q511kpvOArJ
         3ynUuXaEQX+HBivSPLEowQ92QNxU1toC5dLGk3KkMTiB0uzwXCqYRHXdxsr866K1GvP2
         Bgvg==
X-Gm-Message-State: AOJu0YxCFoJMkSUcnEeJzGMdNWuBECyi5UnjPC0AKlHj1HYWH5OsGby4
        AgUcBamTnqNKsaoNSIEyq6HwQw==
X-Google-Smtp-Source: AGHT+IH9RYHbsNVG2GTkCHs4fYdFHNC+MasCDWLJCCpp7bAXAoYxyYMpn94cn7HTlmva8cvMQcpUoQ==
X-Received: by 2002:a05:6512:2812:b0:503:1913:ed8e with SMTP id cf18-20020a056512281200b005031913ed8emr5445725lfb.61.1695626405907;
        Mon, 25 Sep 2023 00:20:05 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id b11-20020ac2562b000000b0050096cc3ba1sm1722178lff.255.2023.09.25.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 00:20:05 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 Sep 2023 09:20:05 +0200
Subject: [PATCH] watchdog: ixp4xx: Make sure restart always works
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230925-ixp4xx-wdt-restart-v1-1-fe2b9b131dbf@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKQ0EWUC/x3MPQqAMAxA4atIZgPaFv+uIg5qU82ikhYtSO9uc
 fyG917wJEwehuIFoZs9n0dGXRaw7vOxEbLNBlUpXfXKIMfLxIiPDSjkwywBbbM41Zle162GHF5
 CjuM/HaeUPpERByZkAAAA
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
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
Other solutions like implementing a pure restart notifier
callback catch in the driver is possible, but this method
will minimize the amount of code and reuse infrastructure
in the core.
---
 drivers/watchdog/ixp4xx_wdt.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 607ce4b8df57..c0bf03125ec8 100644
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
+		dev_err(dev, "Rev. A0 IXP42x CPU detected - only restart supported\n");
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

