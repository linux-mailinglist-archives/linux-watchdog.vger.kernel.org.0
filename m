Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CF723BFBF
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgHDT1e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:27:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:39824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgHDT1d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:27:33 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D580922BED;
        Tue,  4 Aug 2020 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569253;
        bh=M8J6nrRzEAap14cQrZCXcH/ueWSbFlG8dxYq0IDzeOA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kSLQfwEAnIm3R1UdfyP0ccvN2S1heDSDk/moMG3Nli/1xGxvydzq4tuHeTFv6HQLL
         r2EPkdRT0UYC5ioF/+2R04wLCLweCrLjc/pcrwRtmMK0ydPgol6FxjTGMgA+UgXavP
         y0/vRf2jNCiGQwji5yb3bibdLSMDUEpgyigR4dPE=
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
Subject: [PATCH v2 02/13] clk: samsung: s3c24xx: declare s3c24xx_common_clk_init() in shared header
Date:   Tue,  4 Aug 2020 21:26:43 +0200
Message-Id: <20200804192654.12783-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The s3c2410_common_clk_init() and others are defined and used by the
clk-s3c24xx driver and also used in the mach-s3c24xx machine code.  Move
the declaration to a header to fix W=1 build warnings:

    drivers/clk/samsung/clk-s3c2410.c:320:13: warning: no previous prototype for 's3c2410_common_clk_init' [-Wmissing-prototypes]
      320 | void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
    drivers/clk/samsung/clk-s3c2412.c:205:13: warning: no previous prototype for 's3c2412_common_clk_init' [-Wmissing-prototypes]
      205 | void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
    drivers/clk/samsung/clk-s3c2443.c:341:13: warning: no previous prototype for 's3c2443_common_clk_init' [-Wmissing-prototypes]
      341 | void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/mach-s3c24xx/common.c    |  1 +
 arch/arm/mach-s3c24xx/common.h    | 15 ---------------
 drivers/clk/samsung/clk-s3c2410.c |  1 +
 drivers/clk/samsung/clk-s3c2412.c |  1 +
 drivers/clk/samsung/clk-s3c2443.c |  1 +
 include/linux/clk/samsung.h       | 32 +++++++++++++++++++++++++++++++
 6 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index 3dc029c2d2cb..0d55e88ee0a8 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/platform_data/dma-s3c24xx.h>
 #include <linux/dmaengine.h>
+#include <linux/clk/samsung.h>
 
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/common.h
index d087b20e8857..12d2a112eec7 100644
--- a/arch/arm/mach-s3c24xx/common.h
+++ b/arch/arm/mach-s3c24xx/common.h
@@ -108,19 +108,4 @@ extern struct platform_device s3c2443_device_dma;
 
 extern struct platform_device s3c2410_device_dclk;
 
-#ifdef CONFIG_S3C2410_COMMON_CLK
-void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
-				    int current_soc,
-				    void __iomem *reg_base);
-#endif
-#ifdef CONFIG_S3C2412_COMMON_CLK
-void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
-				unsigned long ext_f, void __iomem *reg_base);
-#endif
-#ifdef CONFIG_S3C2443_COMMON_CLK
-void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
-				    int current_soc,
-				    void __iomem *reg_base);
-#endif
-
 #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
index fcf6764693cc..5831d0606077 100644
--- a/drivers/clk/samsung/clk-s3c2410.c
+++ b/drivers/clk/samsung/clk-s3c2410.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/samsung.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index a95ab5f75163..724ef642f048 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/samsung.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index c7aba1e1af70..a827d63766d1 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/samsung.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
index 7a0824b22eed..79097e365f7f 100644
--- a/include/linux/clk/samsung.h
+++ b/include/linux/clk/samsung.h
@@ -21,4 +21,36 @@ static inline void s3c64xx_clk_init(struct device_node *np,
 				    bool s3c6400, void __iomem *base) { }
 #endif /* CONFIG_ARCH_S3C64XX */
 
+#ifdef CONFIG_S3C2410_COMMON_CLK
+void s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
+			     int current_soc,
+			     void __iomem *reg_base);
+#else
+static inline void s3c2410_common_clk_init(struct device_node *np,
+					   unsigned long xti_f,
+					   int current_soc,
+					   void __iomem *reg_base) { }
+#endif /* CONFIG_S3C2410_COMMON_CLK */
+
+#ifdef CONFIG_S3C2412_COMMON_CLK
+void s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
+			     unsigned long ext_f, void __iomem *reg_base);
+#else
+static inline void s3c2412_common_clk_init(struct device_node *np,
+					   unsigned long xti_f,
+					   unsigned long ext_f,
+					   void __iomem *reg_base) { }
+#endif /* CONFIG_S3C2412_COMMON_CLK */
+
+#ifdef CONFIG_S3C2443_COMMON_CLK
+void s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
+			     int current_soc,
+			     void __iomem *reg_base);
+#else
+static inline void s3c2443_common_clk_init(struct device_node *np,
+					   unsigned long xti_f,
+					   int current_soc,
+					   void __iomem *reg_base) { }
+#endif /* CONFIG_S3C2443_COMMON_CLK */
+
 #endif /* __LINUX_CLK_SAMSUNG_H_ */
-- 
2.17.1

