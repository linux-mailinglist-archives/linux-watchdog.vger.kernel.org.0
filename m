Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138873D9E51
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 09:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhG2HYV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 03:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbhG2HYR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 03:24:17 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F7DC061757;
        Thu, 29 Jul 2021 00:24:14 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id l19so9095998pjz.0;
        Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQ7/1DfrNRJ45H+W3f9Rw2cpCH1NPP5TLpi8qbhtTMs=;
        b=mF/HYZbpFZ8pkbLuKfvn6MfD/1/1PsljR+EN+iZ5tVaETldfVQGCR0Ht0vxD2CkFXn
         HSUu/z5ETa2T52U3KplVzDhPQ+BAAhw0MFwKpB8Py/mQdNeRoKmNshE4NhrtJqnm3Uwv
         7StQlGrvfL2frwpUOKIqdj02XYBpSg61owhi36FNhQbHjovPCE7gG5jHVdd98SWHPeLz
         9fscKpGc5u3J+YMJgdCOEnThe/yVro9MDPqDiV9TnVzgnN3qGC1s+KvZu5EwdW0gYfZ/
         yxDRO8rjFbp1Jb1coW/x/Tp45Ru/t1fV088Zg9wzCiVAHNvxCiD3MXnf8WyTrYg9LwK3
         bhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQ7/1DfrNRJ45H+W3f9Rw2cpCH1NPP5TLpi8qbhtTMs=;
        b=PTnRsFmrc2mABTkqOoC/D9R6axz8/d2mIhB5xlwFtFghMs7FttOoZabGjG0TDZfCsD
         F1csjOHKWWVyV3QYV6zsfna6S3ONbQ3iZwx2WvkbDnRU1xXuF1oNfEcXRvZ7BjuP/gXU
         M1OJPra+eODewB14JyGX2rjw+rvUiwqEp+3ZFrfS6xJHMQchIpANvw0lyvqRuUJOGnw1
         /6tmgrHKEx0PbV+at2sQ2dS2IwzXgMzr8rbThx0svwDlrXU7B0odbw0R4PgeLZpq9V5Z
         1znpo+5YamCzHTT42iyEdnfIjQCJfwT2xHAMEk8BqmGdvCS2sZ4rcfpmoa3Vr3hCU7eR
         5qNw==
X-Gm-Message-State: AOAM530QRa8nMHi6qdBMgoLrEgs7SRohtVYT+Lnb+QHzgnhkZ37tHmot
        FYSiCPv9rf0rF6X9ssC4iRU=
X-Google-Smtp-Source: ABdhPJxFNBy2+YgD1/m2YORZ9tY9MV+wbmfG8Bruauj/29dn7TZdgF+hsWc55pUfPJJXc3BE8rHWug==
X-Received: by 2002:a17:902:bd82:b029:129:2e87:9946 with SMTP id q2-20020a170902bd82b02901292e879946mr3464634pls.53.1627543453630;
        Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: add timeout parameter
Date:   Thu, 29 Jul 2021 15:23:07 +0800
Message-Id: <20210729072308.1908904-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
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
index 5aebc3a09..3f3866878 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static unsigned int timeout = DEFAULT_TIMEOUT;
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

