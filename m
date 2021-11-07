Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDC24475C6
	for <lists+linux-watchdog@lfdr.de>; Sun,  7 Nov 2021 21:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236612AbhKGUc7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 7 Nov 2021 15:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236532AbhKGUcm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:42 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50873C061210
        for <linux-watchdog@vger.kernel.org>; Sun,  7 Nov 2021 12:29:59 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 1so25500712ljv.2
        for <linux-watchdog@vger.kernel.org>; Sun, 07 Nov 2021 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gwRvv6JWYHkP0WVTDOklhEQk+5sp5J7RUIlH627gYXk=;
        b=AfwRqk5RuTd5wLqEKeibXK3JQpPM/jlPr0qxIH5/Za5BtBrqKF2jlxMS2sDF+LMr7o
         zGYiIUIN/P2s6OxZPX7SLPbV3t/5npt839NFPjFuW11Th7y4xBv/zgrFThNpSc/Ryodq
         AxJOKQfBk6NM2Zai5LhzS/GwE3kwCFcFHQ6G6vdstNIBgi+l9rEQhEcywKyF3/uDmsqU
         vsSqOwIGP9qleSIJv+zOW591DLHulUHgZgYMa74B7AbUGJHvoWMdTjMeYAX5/3nmdjjD
         WEYVwanSRulBN5I0YYOsYeqFAZFrQFC1u1QsMLH+FK9K04lZ/gjKxxM+N1/LXYjLhg7I
         NUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gwRvv6JWYHkP0WVTDOklhEQk+5sp5J7RUIlH627gYXk=;
        b=ajyOHfEPHaMFQ5MQpvWzNJxQ7am89hDXzq8PO5dMp++Y0yRvyKiioixPxl5JoxtS+S
         LibQkQT3ojzry0tPgxemHNqy4w1Z+JPwYYaYN0/jY/uxPZ4tBsziS0ySmpNIVYYkB7pk
         WEjoF07E2nppn43sKceof6jWhvY01tShgaNHcZDItUTJu1+Ks+AQgAtF/HOdcSzM/tnU
         P5g3VGI3GzegkgysYPqvRLGJLJF7NVrkQk1QjaE0rNB9VP85eu05/g6mpZZCBboRkILU
         pVjI/wl7WIgio2AqhwRLpQADkBU6B4aWOqNDzCjzcdqv/63QNRSBnTHOojWQAb8Hb6Jx
         u88Q==
X-Gm-Message-State: AOAM531+1hyN+t9GV/4sv6vsYmW6cftoISF3kv5ICThwF3jfxqWYj/xc
        YTr0O7IvFQg4/sPNkmmT6vPQwg==
X-Google-Smtp-Source: ABdhPJxYSOnp6UQC3ISHYbyEdtc/s7sNF9ByV37440rhY16YHTdKXmVgDRdIUSAcV56tMIgfbg3OEQ==
X-Received: by 2002:a2e:9d58:: with SMTP id y24mr45135599ljj.22.1636316997660;
        Sun, 07 Nov 2021 12:29:57 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id d20sm1570894lfv.117.2021.11.07.12.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:57 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 07/12] watchdog: s3c2410: Implement a way to invert mask reg value
Date:   Sun,  7 Nov 2021 22:29:38 +0200
Message-Id: <20211107202943.8859-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On new Exynos chips (like Exynos850) the MASK_WDT_RESET_REQUEST register
is replaced with CLUSTERx_NONCPU_INT_EN, and its mask bit value meaning
was reversed: for new register the bit value "1" means "Interrupt
enabled", while for MASK_WDT_RESET_REQUEST register "1" means "Mask the
interrupt" (i.e. "Interrupt disabled").

Introduce "mask_reset_inv" boolean field in driver data structure; when
that field is "true", mask register handling function will invert the
value before setting it to the register.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 4ac0a30e835e..2a61b6ea5602 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -92,6 +92,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * timer reset functionality.
  * @mask_reset_reg: Offset in pmureg for the register that masks the watchdog
  * timer reset functionality.
+ * @mask_reset_inv: If set, mask_reset_reg value will have inverted meaning.
  * @mask_bit: Bit number for the watchdog timer in the disable register and the
  * mask reset register.
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
@@ -103,6 +104,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
 struct s3c2410_wdt_variant {
 	int disable_reg;
 	int mask_reset_reg;
+	bool mask_reset_inv;
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
@@ -219,7 +221,8 @@ static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
-	const u32 val = mask ? mask_val : 0;
+	const bool val_inv = wdt->drv_data->mask_reset_inv;
+	const u32 val = (mask ^ val_inv) ? mask_val : 0;
 	int ret;
 
 	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
-- 
2.30.2

