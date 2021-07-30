Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96543DB21D
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhG3EOT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhG3EOT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:14:19 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61788C061765;
        Thu, 29 Jul 2021 21:14:14 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so12744471pjd.0;
        Thu, 29 Jul 2021 21:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AoyWEpL0YVaQE9+ONyJr4LFablmBYJyxFXjy9TOBNNM=;
        b=e4g8fCwQWSMiPKyMS3xOy0kn8ySE15HVD9klYxHd0iWkDDCAhg5u1WiUT7OZgaoWOz
         WP4rgRiC7L3WdQL/FXiN6QIMaK9Iu60ECweg38Nqysz/PxliK2vQG7UngRyZabypHCoy
         jB5gdbbQJRakgljm3aaHZBlDj6JqC69f1zIw88Y6Pqpla906qN3Ny0mPSgHWbWcbu+93
         tiSM0FfmpwjET5hATIpcxPJcvkLZ6awmz8H4wt3S5gdua4HVJto2VRUumnAawsznE6Ss
         skxEt/Lp3eVLaV2U3mfw0Sl2nmByonaf0My4XQRa5f6+Fbr+/0stDORGFfRgRSr7A3nL
         ZpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoyWEpL0YVaQE9+ONyJr4LFablmBYJyxFXjy9TOBNNM=;
        b=ffz/ULDX9QWaDqlaZ9AixEol1dl75mZZ8FtmL+EbJw2DvowBE9IfKW+X5cSHxZuCPD
         R6FSIr99im8NL+jAaDHuJT++elOn8nv8sgk9TX0HxDucUpiNYDyuDzBStU+ks/ukViqS
         ww6dqVBcq7/R0lFBKAbNZfYvrdTg4HL6C4qJhPrCd0zjowasSzkGijq7qdPZ/UX1pWQB
         crTiXV9hfWjnJ2ywszJ7xi1Wl94nXM8DQwLq9pzR78RYoUc6ACnb7+XmJH02OKti7nQN
         q+FTheVVKwglQksCI+gPgFHDeoR8IvBicO3BVkjyGbyzGBwGDcWHnFGZzDA+pUK2XELP
         9FPg==
X-Gm-Message-State: AOAM530FhTyAjJIYwPb8PJOFOTzTx0oppoFYd4SJ2gMcOcKOyQKcycC2
        P9iBKq6ob9mx11et46VnbnM=
X-Google-Smtp-Source: ABdhPJwx/PToy3FwF3WwEtnts+RJLI8IjXehkAeFuBJIPYUzM3QTFrLsAXSHWvmAw5W+PHEUysy22g==
X-Received: by 2002:a05:6a00:26d0:b029:32d:7d40:5859 with SMTP id p16-20020a056a0026d0b029032d7d405859mr593191pfw.76.1627618454004;
        Thu, 29 Jul 2021 21:14:14 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:14:13 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
Date:   Fri, 30 Jul 2021 12:13:53 +0800
Message-Id: <20210730041355.2810397-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add nowayout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..5aebc3a09652 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -29,6 +29,11 @@
 #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
 #define GXBB_WDT_TCNT_CNT_SHIFT			16
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
-- 
2.25.1

