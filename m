Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AE8232240
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 18:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgG2QLL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 12:11:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:48886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgG2QLK (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 12:11:10 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF7502083E;
        Wed, 29 Jul 2020 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596039070;
        bh=OqsgY3rHZz/mK8qRiE5XeKJITCSK/QQUmG6SXu1vxkE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zhoyfxI8BIJn4/VmfqPmVr5vpeyRqX32Y4GLvb/iPzdyLN90aohd0jlCDvryFnFgJ
         /kg91CvjikQkPlQLkG3pWBAXfuIf1/ml9MSUv1O1yW39LUppqWVuIm4o5MattfkmX/
         k3bx83msaDdPKu6LN0Up3y5+SNFl7Ema6i7S0/Wo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vincent Sanders <vince@simtec.co.uk>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH 2/7] ARM: s3c64xx: Include header to fix -Wmissing-prototypes
Date:   Wed, 29 Jul 2020 18:09:37 +0200
Message-Id: <20200729160942.28867-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729160942.28867-1-krzk@kernel.org>
References: <20200729160942.28867-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include the spi-s3c64xx.h header to fix W=1 build warning:

    arch/arm/mach-s3c64xx/setup-spi.c:11:5: warning:
        no previous prototype for 's3c64xx_spi0_cfg_gpio' [-Wmissing-prototypes]
       11 | int s3c64xx_spi0_cfg_gpio(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c64xx/setup-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/setup-spi.c b/arch/arm/mach-s3c64xx/setup-spi.c
index 39dfae1f46e7..03c9d296bb0f 100644
--- a/arch/arm/mach-s3c64xx/setup-spi.c
+++ b/arch/arm/mach-s3c64xx/setup-spi.c
@@ -4,6 +4,7 @@
 //		http://www.samsung.com/
 
 #include <linux/gpio.h>
+#include <linux/platform_data/spi-s3c64xx.h>
 #include <plat/gpio-cfg.h>
 #include <mach/gpio-samsung.h>
 
-- 
2.17.1

