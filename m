Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912853DB21F
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhG3EOY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhG3EOX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:14:23 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93975C061765;
        Thu, 29 Jul 2021 21:14:19 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so12744731pjd.0;
        Thu, 29 Jul 2021 21:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CedIVTVLdu/lypJPj4Dg+lxWwqXrdBZt0BeM9wWDGz8=;
        b=jZ6MhW4oRJotCzmn9yT9MzAXcuBUV4+57oKI8XRLcj5BfUBrWhl+uwGd7F82BKF8pf
         2c65NwcMmRf/nSdIRKYUcqzqhtpou4abeb4Ybc+mn06aHa/21n5HQeCL2pKcGd57TBxz
         ZBYpPZbt4axbS0We7eLYBb9y490YVQkggWcgf+PFyov6L+VmI0HdFmqNt34ih3C0VqDK
         N6US9Tbo10ixo3qPxXM47CupTy23gPjLzUlmkaA95zzCItYAd4TQyEb8tc6I99/Fz9Pk
         diUucro3uDhnpqsaxEXmbvJJs0NUwZn426AKrqMZROSxvv20o5uRKGsBIQXEqMpo4lgP
         Z4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CedIVTVLdu/lypJPj4Dg+lxWwqXrdBZt0BeM9wWDGz8=;
        b=uVWTxgt9KzcPQqxkQxolNX7k7eCXrrErMDpTxIMjUwi96kL1xOEVlJr9eam4Sn0mkz
         5M3jXWb+bi38FM4vlKmFwv+/xuSxqNL6QT9PgVzpCB1d1x11pV5kCWPZv1ocToHkVh9J
         YNcpelmaGbUQw383PS4Wj5GHykjGMXItysNk4XSUAyCYQbqD5hQT2Kh1YtZVJvmGbJUC
         jtycAhpWRppBdojsdRvyPCfOEPCGsQNTKyFSoMWCmmfyahF0IAdaX6oltpeBtc+CHMAQ
         O5M1jDhsLZGns38ay3vO8XkT+GezrOjUlKnW7DmvZp/4jzD/hW1WACUogREm9d/7+0ag
         Z/Gw==
X-Gm-Message-State: AOAM530czSEzmGn5hV0PpYKnF2Y2ZhgSdfOoI2h4TLBZ/63fj79vSvG4
        /vnAyRoFxseRWMsu4tRAFog=
X-Google-Smtp-Source: ABdhPJy3kNbcx3oc1mWZ4cBWSGRz4ql7ZJ9dNzE7MfbESnJvcd7q99M/D3ctid0xDHHp5sx1BUSIlw==
X-Received: by 2002:a05:6a00:1352:b029:331:afed:38b5 with SMTP id k18-20020a056a001352b0290331afed38b5mr793450pfu.5.1627618459222;
        Thu, 29 Jul 2021 21:14:19 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:14:18 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
Date:   Fri, 30 Jul 2021 12:13:54 +0800
Message-Id: <20210730041355.2810397-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add timeout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5aebc3a09652..945f5e65db57 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static unsigned int timeout;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
-- 
2.25.1

