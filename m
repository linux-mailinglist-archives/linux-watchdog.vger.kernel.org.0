Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449A823BFBB
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Aug 2020 21:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHDT12 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Aug 2020 15:27:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgHDT12 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Aug 2020 15:27:28 -0400
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE01322CB1;
        Tue,  4 Aug 2020 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596569247;
        bh=uWBhjP6cYA/GkdxQt1ojbTAvgXvjD+ztYBpbG25q+ds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s07+Z3tHcqZckXKO3mhC0hZgUPLNucom00ju7a8rVeNOZn8mXRQr9bY87ZJqDHLEu
         Bfvv/aM2aeQ7bpaAulkXNgXFJ2Oqrb2SejSwWx4ECafc74kXO0q+zKvbRvCDC1BmPh
         5YXKDNikOq7NqNR1Afcl0zZVW89JH8eMf9LetyUY=
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
Subject: [PATCH v2 01/13] clk: samsung: s3c64xx: declare s3c64xx_clk_init() in shared header
Date:   Tue,  4 Aug 2020 21:26:42 +0200
Message-Id: <20200804192654.12783-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
References: <20200804192654.12783-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The s3c64xx_clk_init() is defined and used by the clk-s3c64xx driver and
also used in the mach-s3c64xx machine code.  Move the declaration to a
header to fix W=1 build warning:

    drivers/clk/samsung/clk-s3c64xx.c:391:13: warning: no previous prototype for 's3c64xx_clk_init' [-Wmissing-prototypes]
      391 | void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

---

Changes since v1:
1. Drop __init from header (as suggested by Stephen),
2. Add necessary header and forward declaration (as suggested by
   Stephen),
3. Add review tag.
---
 MAINTAINERS                       |  1 +
 arch/arm/mach-s3c64xx/common.c    |  1 +
 arch/arm/mach-s3c64xx/common.h    |  2 --
 drivers/clk/samsung/clk-s3c64xx.c |  1 +
 include/linux/clk/samsung.h       | 24 ++++++++++++++++++++++++
 5 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/clk/samsung.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a2885ec15bb8..5675fc9bfa00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15294,6 +15294,7 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
+F:	include/linux/clk/samsung.h
 
 SAMSUNG SPI DRIVERS
 M:	Kukjin Kim <kgene@kernel.org>
diff --git a/arch/arm/mach-s3c64xx/common.c b/arch/arm/mach-s3c64xx/common.c
index 13e91074308a..a655bf0c7802 100644
--- a/arch/arm/mach-s3c64xx/common.c
+++ b/arch/arm/mach-s3c64xx/common.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
+#include <linux/clk/samsung.h>
 #include <linux/dma-mapping.h>
 #include <linux/irq.h>
 #include <linux/gpio.h>
diff --git a/arch/arm/mach-s3c64xx/common.h b/arch/arm/mach-s3c64xx/common.h
index 03670887a764..f4eca42cdc86 100644
--- a/arch/arm/mach-s3c64xx/common.h
+++ b/arch/arm/mach-s3c64xx/common.h
@@ -22,8 +22,6 @@ void s3c64xx_init_io(struct map_desc *mach_desc, int size);
 void s3c64xx_restart(enum reboot_mode mode, const char *cmd);
 
 struct device_node;
-void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
-	unsigned long xusbxti_f, bool is_s3c6400, void __iomem *reg_base);
 void s3c64xx_set_xtal_freq(unsigned long freq);
 void s3c64xx_set_xusbxti_freq(unsigned long freq);
 
diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index b96d33e5eb45..56f95b63f71f 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -7,6 +7,7 @@
 
 #include <linux/slab.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/samsung.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 
diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
new file mode 100644
index 000000000000..7a0824b22eed
--- /dev/null
+++ b/include/linux/clk/samsung.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
+ */
+
+#ifndef __LINUX_CLK_SAMSUNG_H_
+#define __LINUX_CLK_SAMSUNG_H_
+
+#include <linux/compiler_types.h>
+
+struct device_node;
+
+#ifdef CONFIG_ARCH_S3C64XX
+void s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
+		      unsigned long xusbxti_f, bool s3c6400,
+		      void __iomem *base);
+#else
+static inline void s3c64xx_clk_init(struct device_node *np,
+				    unsigned long xtal_f,
+				    unsigned long xusbxti_f,
+				    bool s3c6400, void __iomem *base) { }
+#endif /* CONFIG_ARCH_S3C64XX */
+
+#endif /* __LINUX_CLK_SAMSUNG_H_ */
-- 
2.17.1

