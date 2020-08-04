Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F5223BFE8
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgHDT2W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:28:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727124AbgHDT2V (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:28:21 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4A7522B42;
        Tue,  4 Aug 2020 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569300;
        bh=V/XnlICubaqSdGc/oVbL46LdDLz8pa5t8bkW3kyzvAw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lp9rL0QjqRmYlIilySHlm+OoQDEI75KLDagAujimB4X5nPwr0UaaeJ6sjYLcWMK17
         3t4IEKW+3btM8obpbEi9ukBNEMuaAJUPGQMAu2HhgpAH5jg4iGRagtO/Xrcjexguxv
         WN1no2xHHDDPeAIK+u5eOw/tw5DT10EFnlds4Aw0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
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
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Sergio Prado <sergio.prado@e-labworks.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Cedric Roux <sed@free.fr>, Lihua Yao <ylhuajnu@outlook.com>
Subject: [PATCH v2 10/13] ARM: s3c24xx: sdhci: include plat/sdhci.h header
Date:   Tue,  4 Aug 2020 21:26:51 +0200
Message-Id: <20200804192654.12783-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include plat/sdhci.h header in the sdhci code to bring the prototypes of
defined functions and fix W=1 compile warnings:

    arch/arm/mach-s3c24xx/setup-sdhci-gpio.c:21:6: warning: no previous prototype for 's3c2416_setup_sdhci0_cfg_gpio' [-Wmissing-prototypes]
       21 | void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
    arch/arm/mach-s3c24xx/setup-sdhci-gpio.c:26:6: warning: no previous prototype for 's3c2416_setup_sdhci1_cfg_gpio' [-Wmissing-prototypes]
       26 | void s3c2416_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/setup-sdhci-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
index 218346a36d1e..ff5c0a51ded5 100644
--- a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
@@ -17,6 +17,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/gpio-samsung.h>
 #include <plat/gpio-cfg.h>
+#include <plat/sdhci.h>
 
 void s3c2416_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
 {
-- 
2.17.1

