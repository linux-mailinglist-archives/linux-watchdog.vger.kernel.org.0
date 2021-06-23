Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E013B11ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFWCrf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhFWCrf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:35 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3FCC061574;
        Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g24so636781pji.4;
        Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ip7ajlGeYj7m17iAVH4CDZ+K9tw9hchuXGcTy/Lm6iQ=;
        b=ZLHfABsqlgyddU1GXYU9y5z08Y+mthiwFyIpXRHJYRuxFLzMQ87pEBVg79j10WS2qY
         FiShyYhNhx8+VW+95/cNH4rGhSuBAAmbdjA6dutHC2p26uj1ug1lutM/V+BNia93oByg
         2FGz4R/kGqk37obq3lHyBVkQg0JD87lvKHgLfCUapD4yrMv0vctofqM31YhBXVCl8tUB
         pE9sgqKfduGMzqYg6xtrA5J/bH3d6yCwI33BoDzoMOb42bDmByANRj3A9Zh0sKu9MQBY
         GnVMrXqqaoxd+vdiW1PWVLvjFpWn8V+yrQUV72n3YSzP3UI5g7C+5OfNRbD+xPsMCWGM
         6Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ip7ajlGeYj7m17iAVH4CDZ+K9tw9hchuXGcTy/Lm6iQ=;
        b=pR2G7/c4S4+u6OlTDRnLB74dGdMCl+w9M/0XU/LsKVQpM1Hb8PaIbma2WkweZ6Bptw
         Ohhi3A9/3DqMe/Jg+ZoWazjeFHv+5LxyP78vlHg47MGu8pvvMYxUOQW2MbS2odw3FErx
         9BhNACzs1qz0XTmZG8nNcNV/DX8T9cmT6PmwYu3qx5VLoQDkxDvzliZdFYc2yTckKHnP
         Nhjd/Rxp57E6L+yxCbomD2Rb0W1kPElfB+0zsck7vk9LmG+qEj+LM0wI6013qGq4Z1py
         rqalGuy3SPVTHtxYjRgHQLGJu9LUexkHPePt2R1DCwTujr0ujG6MZ2NxGzCiOOZ25WXN
         N1lA==
X-Gm-Message-State: AOAM533S43QW4ACN4O8ZFWzqj9Ygdq09XLNycW2YGUdQVNc9b6Vbd7Nh
        9HsZ7fw466gnGYCePC+z4fM=
X-Google-Smtp-Source: ABdhPJyhCZwjN/m4vhnNitMbn91dSnkTedliyYAJ/e5+IN8eggGCWtWL3XZgZhB48Y3cBOXQ/yZ8uw==
X-Received: by 2002:a17:90a:c8b:: with SMTP id v11mr7062600pja.114.1624416318293;
        Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 4/5] watchdog: meson_gxbb_wdt: add stop_on_unregister
Date:   Wed, 23 Jun 2021 10:44:28 +0800
Message-Id: <20210623024429.1346349-5-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Added missed watchdog_stop_on_unregister call

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 0bf5dccf70b1..2dbe254e5122 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -196,6 +196,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
+	watchdog_stop_on_unregister(&data->wdt_dev);
 
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
-- 
2.25.1

