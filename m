Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6DF4587C8
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Nov 2021 02:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhKVBiH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 20:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbhKVBiH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 20:38:07 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74327C061574
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 17:35:01 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b1so72760123lfs.13
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 17:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dH9DwZsMEmHuADMJdo4bZJF+nskxTaX3+w96Fu8Zmrw=;
        b=SzHtP3jFeptXwLMSzeIqR/YmhLeC2HEaDV32ayeKCejNlHSAfE6L95xf5ng14MtPmD
         6O1NFb0zB5bFhGN3d803jezwvTDylrxwdRrciuYZBqRsuOdFIVZ1v6Cj54DHOpKn5tM1
         OsmOe2WQQeaRKIy9IdGcwoGiTyRWVsI/sH+oyLuciMV82yabbpsxugO1lqglEWNN9TIs
         N50NM2HSRcgZmdyeTbStsAIHcuU4WUmEqL2n4T/bxev0yZweD6Fh3IOxu5pAqj19VdpN
         xJlQj86My+cSnGk+vxozKMJSYZ5kwLUdf9U6vu4hGTJGWmZtSWS3CorPQFaQHc71WpUh
         VDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dH9DwZsMEmHuADMJdo4bZJF+nskxTaX3+w96Fu8Zmrw=;
        b=X7HAai2bJoEdbsFBOayAa5KD9YDacK3k2rA8q2GkgKXFr5+L13l3odEI343mRorRaS
         RtCEQ8CroHyUMEwRlukAv6HTu328lVpfyolaw4mX+t6o8mU9x0v9hjvPBGBn13aV7NT1
         WpFHo+4vHGY71FH5dxOwsKHdXNLT3a8k8wnXBDyK+032W64V3y8Qz/t+9bIloyNQgjY9
         jVXIlNDmSBwzk15TohNOULT9X2VUgnOgIWowqZHX1zu0flNCxRpBt33a7GoUtoU3PlqY
         t4QKo3UUH9Dy2G8G2au1dUGe5f0ODZt/aZAnL8bG7m4npTSEZL22pHVK+lvahn1BhLhb
         fd6A==
X-Gm-Message-State: AOAM53317Mu0nbuTMIJ6grbpvSjCbI+mhggWiamTB7VU6CJrBgzhaK+z
        am5P9cbnoM5yU79OrVkg8lz/jw==
X-Google-Smtp-Source: ABdhPJxOJlYOHdA37LZHSXsmfEf67Q40BqXrNLWY6pbN/d1KL4gUSwng4voYr+hAVfAtULwc3r6WBw==
X-Received: by 2002:a05:6512:31cf:: with SMTP id j15mr53703985lfe.229.1637544899830;
        Sun, 21 Nov 2021 17:34:59 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id bp15sm798579lfb.176.2021.11.21.17.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 17:34:58 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] watchdog: ixp4xx: Implement restart
Date:   Mon, 22 Nov 2021 02:32:56 +0100
Message-Id: <20211122013256.3050966-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Implement watchdog restart in the IXP4xx watchdog timer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/watchdog/ixp4xx_wdt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 31b03fa71341..7b188591f6d4 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/soc/ixp4xx/cpu.h>
 
 struct ixp4xx_wdt {
@@ -84,10 +85,25 @@ static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int ixp4xx_wdt_restart(struct watchdog_device *wdd,
+                              unsigned long action, void *data)
+{
+	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
+
+	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWT_OFFSET);
+	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
+		     iwdt->base + IXP4XX_OSWE_OFFSET);
+	msleep(1000);
+
+	return 0;
+}
+
 static const struct watchdog_ops ixp4xx_wdt_ops = {
 	.start = ixp4xx_wdt_start,
 	.stop = ixp4xx_wdt_stop,
 	.set_timeout = ixp4xx_wdt_set_timeout,
+	.restart = ixp4xx_wdt_restart,
 	.owner = THIS_MODULE,
 };
 
-- 
2.31.1

