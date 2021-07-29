Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE253D9E53
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 09:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhG2HYW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 03:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234634AbhG2HYW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 03:24:22 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64789C061757;
        Thu, 29 Jul 2021 00:24:19 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k4-20020a17090a5144b02901731c776526so14191450pjm.4;
        Thu, 29 Jul 2021 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rMswTWDvtI4DXxuELsfIeTapWGrqixV6WaQArp0NDx8=;
        b=YAJ5HBfu1f8I+IYA4g4kd7SbYHRqr/mqwUKfrup7IAXbGRP44wtjgHAQnarxHE+dJi
         /lk5rVSR5DNyQ8a1bWFeFM2GtBG/0KKIld0h5HI7Q4xyebFYLS9PhUWkDEWIUj6puxcZ
         sHxFf22tUAxabG9TT+1jxVPREqtTr1vQjln4vUYXSSkorI0vQtqF8KbQUvEYNl2HoJc6
         XZngzzgWmejVIEMiPBMWVXezE1ttgb74r9cGcFAwNkejWOkz0N0WYSvCQN6yeGuDsyid
         XwORDxnCvP3vqm/gSNEwkLsKwQK7o+XxX8K96VKra5AHWyPCAqJ8dAHCX7bLkx1O6H1L
         z0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMswTWDvtI4DXxuELsfIeTapWGrqixV6WaQArp0NDx8=;
        b=mywq9muLg/uJ8wuasqNlrNQdjgPy4DJy5p4YoRmJR3U4UeyvACRDtHsKlAGvnXYq0/
         S1X8LU9EzZ3zfQk9bxU9nnVVBkt/H3hI9pbbje9zMzoHr8VRCy/V7GHVQZ14apSGDilJ
         TY8RgGkYh/1jWlaLDD8icVjqViSQk7nITFtE6Hjn6KZAKYDZMaXKRvLPR4eBFlpw8hHJ
         c8BHjII/XjdaQbZeGwQ9fl6vDQZmphNf61zWqF12eY9fuNHEVJPrl9+8KiOYUI2eBaax
         tHR129QhW87rQCVu6MRG3iVCPFlmU13ZNDny7iCYXI2emJ5hiqpPfkZ/pJvEXgaasW3N
         hnVA==
X-Gm-Message-State: AOAM5329yKLcVUrSbq6up0FeSV4iIN9DF3+dgSff31TP5hjkRB3sYsr0
        3N9oDrzNeRP1ISbviUd8Z2s=
X-Google-Smtp-Source: ABdhPJxjKZYGxl9UmdCm+aHK8JWzKneFtaMZp4OFYm7PF5EkDbyru5cOh1mYJw99LDZEIv0sgFFSsA==
X-Received: by 2002:aa7:8e51:0:b029:332:920f:1430 with SMTP id d17-20020aa78e510000b0290332920f1430mr3814819pfr.1.1627543459056;
        Thu, 29 Jul 2021 00:24:19 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:24:18 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Date:   Thu, 29 Jul 2021 15:23:08 +0800
Message-Id: <20210729072308.1908904-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove watchdog_stop_on_reboot()

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 3f3866878..cafc6cdc0 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1

