Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7380123BFC4
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgHDT1k (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:27:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgHDT1j (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:27:39 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9885E22B45;
        Tue,  4 Aug 2020 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569258;
        bh=3iJScp/oOnw2TBm43T5Fy57mzej9dpxzGVeQy8mj7MM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zd5XlrjVRXC1S0X8J3rBX3Rsob30zLCO6mf6puMiT9wnFqnRB4Zvi71RTAuTeYQyg
         0gOV/wdZDBxMbCCofVkqcNqn9b4E0hIDFTB5o/jW4CiEGsMGnkwAvsN5VOPLjv+Oj1
         nbmUA0oq+L9nO0PRVjl5IeGmdJGQJSFHWw0/FuuY=
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
Subject: [PATCH v2 03/13] ARM: s3c64xx: include header to fix -Wmissing-prototypes
Date:   Tue,  4 Aug 2020 21:26:44 +0200
Message-Id: <20200804192654.12783-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Include the spi-s3c64xx.h header to fix W=1 build warning:

    arch/arm/mach-s3c64xx/setup-spi.c:11:5: warning:
        no previous prototype for 's3c64xx_spi0_cfg_gpio' [-Wmissing-prototypes]
       11 | int s3c64xx_spi0_cfg_gpio(void)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Add review tag.
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

