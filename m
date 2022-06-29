Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631F755FE34
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 13:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiF2LH3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 07:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbiF2LHZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 07:07:25 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C3D3D4B4
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 04:07:24 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B923E41015
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1656500842;
        bh=Rbk3h/ZyQTcA1nhbUwjo+czhYffJ6+LSq1adnjDE8t4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vEMtHGMkTjYcfiF58KNfRoOUZsE6VJI38plBkCFW079KjbrAynKUtJubDr3aX7LLb
         cR54z0ImCVkojXQrAAYF82bRTXQ7Lo1OtvaeyMyj9p0w1lB9Zpi4LO7phD1NiZze2S
         fvEsesri5P3MNIhQRrsI58TsjoVEj3l8DtNr2NG0FeneSNxYemybX8tMiU8j1J0aNZ
         Ha4En7K8Hpd2L/EtxTq2JlymgHO4KJpPdrlcWm4Y5NCOYd0YyHuM5WzBnYoya9/W3i
         YibYiIacWUxgRD5lbN/BPtayOengkrGYzpxw3UYbk43nIg8qbvUsjQi6lNMe25LJmY
         tiMSbAWJjEvMQ==
Received: by mail-ej1-f70.google.com with SMTP id qf29-20020a1709077f1d00b00722e68806c4so4748835ejc.4
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jun 2022 04:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rbk3h/ZyQTcA1nhbUwjo+czhYffJ6+LSq1adnjDE8t4=;
        b=e7ZayPF3LgU07nzmuPp8U2tkFV9fjusAkuleNXmNEYcTQzauto3eY+59BcoFAbSnCo
         12tjL9+hmJjRNTccWIuT7GUehL3v9P2K4WOoYAtR1VHSjf0zyNbvl6f9yqOZCndqLEzS
         /NqkJi0JFx10pgvp9Q4bXU4XKxM+bDu1fyeJNyBkHi49KbT4MGUdM9prouvbsIPspZ/u
         Qd2RDqBL3LLRNkFEJpaxxSHFotmCdkWkZcI0wqp8KPxjdtavaolL49pNYkvs285i70j4
         AHmwQZa/MF5VHLjA0wVXnZMP8VxzW2VcZqTqy9KmPOOrzM4gdaqxoTI9SO8NEKR/ppYW
         6y3Q==
X-Gm-Message-State: AJIora9kh5Wwvlmvy877QO60jwPaSagUa/Lzllsz9M2e7QLjWZp4hHms
        4bNMmgD1xjWEIj26T9VIqsEp5n3+fTj91n+UFm7avEEW0EdLkBEaHuDvp1jRJciyeTD72D9Hzj8
        WVQ9PxswsGD4osQU58V1kkAGO1yS795GCoomHfj1SIIeN
X-Received: by 2002:a05:6402:3909:b0:435:7a69:2cfd with SMTP id fe9-20020a056402390900b004357a692cfdmr3406353edb.166.1656500842003;
        Wed, 29 Jun 2022 04:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tThif8280wzXk6Ut9jXKYRnm02Yy/OjNEOJCEj1xRjX3WNRnkf7vJYfXD49sy7it1uTCKgpw==
X-Received: by 2002:a05:6402:3909:b0:435:7a69:2cfd with SMTP id fe9-20020a056402390900b004357a692cfdmr3406323edb.166.1656500841846;
        Wed, 29 Jun 2022 04:07:21 -0700 (PDT)
Received: from Isaac-Laptop.fritz.box ([2a02:908:672:1020:dd2a:5258:a4c9:43ea])
        by smtp.gmail.com with ESMTPSA id r1-20020aa7cb81000000b004357b717a96sm11127630edt.85.2022.06.29.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 04:07:21 -0700 (PDT)
From:   Isaac True <isaac.true@canonical.com>
To:     linux-watchdog@vger.kernel.org
Cc:     devicetree@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, Isaac True <isaac.true@canonical.com>
Subject: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
Date:   Wed, 29 Jun 2022 13:06:26 +0200
Message-Id: <20220629110626.2158127-2-isaac.true@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629110626.2158127-1-isaac.true@canonical.com>
References: <20220629110626.2158127-1-isaac.true@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
minimum interval to be specified, stopping watchdog devices from being
fed too quickly if they require a certain interval between feeds.

Signed-off-by: Isaac True <isaac.true@canonical.com>
---
 drivers/watchdog/gpio_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 0923201ce874..309f66536a14 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -110,6 +110,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	struct gpio_wdt_priv *priv;
 	enum gpiod_flags gflags;
 	unsigned int hw_margin;
+	unsigned int min_hw_margin;
 	const char *algo;
 	int ret;
 
@@ -144,6 +145,16 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	if (hw_margin < 2 || hw_margin > 65535)
 		return -EINVAL;
 
+	ret = of_property_read_u32(np, "min_hw_margin_ms", &min_hw_margin);
+	if (ret)
+		min_hw_margin = 0;
+
+	if (min_hw_margin > hw_margin) {
+		dev_err(dev,
+			"Minimum interval cannot be greater than the watchdog interval");
+		return -EINVAL;
+	}
+
 	priv->always_running = of_property_read_bool(np,
 						     "always-running");
 
@@ -152,6 +163,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	priv->wdd.info		= &gpio_wdt_ident;
 	priv->wdd.ops		= &gpio_wdt_ops;
 	priv->wdd.min_timeout	= SOFT_TIMEOUT_MIN;
+	priv->wdd.min_hw_heartbeat_ms = min_hw_margin;
 	priv->wdd.max_hw_heartbeat_ms = hw_margin;
 	priv->wdd.parent	= dev;
 	priv->wdd.timeout	= SOFT_TIMEOUT_DEF;
-- 
2.34.1

