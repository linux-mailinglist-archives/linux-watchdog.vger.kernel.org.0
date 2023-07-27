Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0BC8764293
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jul 2023 01:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjGZXdQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jul 2023 19:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjGZXdP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jul 2023 19:33:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2373F2727;
        Wed, 26 Jul 2023 16:33:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96B9861CDB;
        Wed, 26 Jul 2023 23:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7757C433C8;
        Wed, 26 Jul 2023 23:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690414392;
        bh=fCw5MBXiD1lggmFQTITNXliJqRzkSJyOEUC213FVJ/s=;
        h=From:To:Cc:Subject:Date:From;
        b=QxxF2VuK4Z+WRForiKwf9x4dZ2lgqeAs2m1MyK60KgGFibdO51duMYi0qN6slcYUE
         wJ5QMrZaLvZofNhTqVzlIR1Ab6APHQS65oSAW7Dy4j1m71Aa+8BrhIQnF6It+ufJrs
         DGjWFMwtqu7TcsQtF8UJELw/7lrKblN0Z5VFCqyiif+uVasS1ZsoDd/54SGjK5wnl+
         CyY5zLf3zHakU3oCLUQZlMQZ5OiTeYoIB5qPleGqtKAqekmq/4Yr0JHCFgcnPIaaeg
         zew21QqYT3BmigYoqn2CYdBsf+1L74aRrvrIjKrVYGmuhnv8fTx4B8FvTvc/NO8Nta
         kini7+BCk1O9Q==
Received: (nullmailer pid 3812927 invoked by uid 1000);
        Wed, 26 Jul 2023 23:33:07 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev
Subject: [PATCH v3] watchdog: Explicitly include correct DT includes
Date:   Wed, 26 Jul 2023 17:33:00 -0600
Message-Id: <20230726233302.3812749-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
 - Fix build for lantiq_wdt.c, pic32-dmt.c, pic32-wdt.c
v2:
 - Add gef_wdt.c and mpc8xxx_wdt.c
---
 drivers/watchdog/armada_37xx_wdt.c | 1 -
 drivers/watchdog/at91rm9200_wdt.c  | 3 +--
 drivers/watchdog/cpwd.c            | 2 +-
 drivers/watchdog/ftwdt010_wdt.c    | 6 ++----
 drivers/watchdog/gef_wdt.c         | 2 +-
 drivers/watchdog/imx2_wdt.c        | 3 +--
 drivers/watchdog/imx7ulp_wdt.c     | 1 -
 drivers/watchdog/lantiq_wdt.c      | 3 ++-
 drivers/watchdog/meson_wdt.c       | 4 ++--
 drivers/watchdog/mpc8xxx_wdt.c     | 4 ++--
 drivers/watchdog/mtk_wdt.c         | 1 -
 drivers/watchdog/of_xilinx_wdt.c   | 3 +--
 drivers/watchdog/pic32-dmt.c       | 1 -
 drivers/watchdog/pic32-wdt.c       | 1 -
 drivers/watchdog/pika_wdt.c        | 2 +-
 drivers/watchdog/qcom-wdt.c        | 1 -
 drivers/watchdog/rave-sp-wdt.c     | 2 +-
 drivers/watchdog/riowd.c           | 2 +-
 drivers/watchdog/rza_wdt.c         | 4 ++--
 drivers/watchdog/rzg2l_wdt.c       | 2 +-
 drivers/watchdog/s3c2410_wdt.c     | 1 -
 drivers/watchdog/sama5d4_wdt.c     | 1 -
 drivers/watchdog/sbsa_gwdt.c       | 3 +--
 drivers/watchdog/starfive-wdt.c    | 3 ++-
 drivers/watchdog/stm32_iwdg.c      | 1 -
 drivers/watchdog/sunxi_wdt.c       | 1 -
 drivers/watchdog/xilinx_wwdt.c     | 4 ++--
 27 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/watchdog/armada_37xx_wdt.c b/drivers/watchdog/armada_37xx_wdt.c
index e58652939f8a..8133a5d05647 100644
--- a/drivers/watchdog/armada_37xx_wdt.c
+++ b/drivers/watchdog/armada_37xx_wdt.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
diff --git a/drivers/watchdog/at91rm9200_wdt.c b/drivers/watchdog/at91rm9200_wdt.c
index d20ec27ba354..558015f08c7a 100644
--- a/drivers/watchdog/at91rm9200_wdt.c
+++ b/drivers/watchdog/at91rm9200_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/atmel-st.h>
 #include <linux/miscdevice.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
@@ -26,8 +27,6 @@
 #include <linux/types.h>
 #include <linux/watchdog.h>
 #include <linux/uaccess.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 
 #define WDT_DEFAULT_TIME	5	/* seconds */
 #define WDT_MAX_TIME		256	/* seconds */
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 47250f9b68c7..901b94d456db 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -31,7 +31,7 @@
 #include <linux/mutex.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include <asm/irq.h>
diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index 442c5bf63ff4..28f5af752c10 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -14,7 +14,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
@@ -221,20 +221,18 @@ static const struct dev_pm_ops ftwdt010_wdt_dev_pm_ops = {
 				ftwdt010_wdt_resume)
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id ftwdt010_wdt_match[] = {
 	{ .compatible = "faraday,ftwdt010" },
 	{ .compatible = "cortina,gemini-watchdog" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ftwdt010_wdt_match);
-#endif
 
 static struct platform_driver ftwdt010_wdt_driver = {
 	.probe		= ftwdt010_wdt_probe,
 	.driver		= {
 		.name	= "ftwdt010-wdt",
-		.of_match_table = of_match_ptr(ftwdt010_wdt_match),
+		.of_match_table = ftwdt010_wdt_match,
 		.pm = &ftwdt010_wdt_dev_pm_ops,
 	},
 };
diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index 97afc907f659..6a1db1c783fa 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -31,7 +31,7 @@
 #include <linux/fs.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
 
diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 6fcc3596103c..1a27665a2f53 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -26,8 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 7ca486794ba7..c703586c6e5f 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/lantiq_wdt.c b/drivers/watchdog/lantiq_wdt.c
index 6fab504af88b..a273b97ebcb4 100644
--- a/drivers/watchdog/lantiq_wdt.c
+++ b/drivers/watchdog/lantiq_wdt.c
@@ -9,7 +9,8 @@
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/watchdog.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/clk.h>
 #include <linux/io.h>
diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 539feaa1f904..497496f64f55 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -11,11 +11,11 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
 
diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
index 1c569be72ea2..867f9f311379 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -16,8 +16,8 @@
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/watchdog.h>
 #include <linux/io.h>
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a9c437598e7e..b2330b16b497 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -25,7 +25,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/types.h>
diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 2a079ca04aa3..05657dc1d36a 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -10,14 +10,13 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/ioport.h>
 #include <linux/watchdog.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
 
 /* Register offsets for the Wdt device */
 #define XWT_TWCSR0_OFFSET   0x0 /* Control/Status Register0 */
diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
index bc4ccddc75a3..ab0682492c85 100644
--- a/drivers/watchdog/pic32-dmt.c
+++ b/drivers/watchdog/pic32-dmt.c
@@ -12,7 +12,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
index 6d1a00222991..1d282de312ef 100644
--- a/drivers/watchdog/pic32-wdt.c
+++ b/drivers/watchdog/pic32-wdt.c
@@ -12,7 +12,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
index a98abd0d3146..782b8c23d99c 100644
--- a/drivers/watchdog/pika_wdt.c
+++ b/drivers/watchdog/pika_wdt.c
@@ -23,8 +23,8 @@
 #include <linux/bitops.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #define DRV_NAME "PIKA-WDT"
 
diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index d776474dcdf3..9e790f0c2096 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -11,7 +11,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
-#include <linux/of_device.h>
 
 enum wdt_reg {
 	WDT_RST,
diff --git a/drivers/watchdog/rave-sp-wdt.c b/drivers/watchdog/rave-sp-wdt.c
index 2c95615b6354..5d1c2176d445 100644
--- a/drivers/watchdog/rave-sp-wdt.c
+++ b/drivers/watchdog/rave-sp-wdt.c
@@ -13,7 +13,7 @@
 #include <linux/mfd/rave-sp.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index c04b383e1712..b293792a292a 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -14,7 +14,7 @@
 #include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
index fe6c2ed35e04..cb4901b3f777 100644
--- a/drivers/watchdog/rza_wdt.c
+++ b/drivers/watchdog/rza_wdt.c
@@ -9,9 +9,9 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index d404953d0e0f..1741f98ca67c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -11,7 +11,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 95416a9bdd4b..2bcc8faa7fa5 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -23,7 +23,6 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index aeee934ca51b..71e8b5fbf51f 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index fd3cfdda4949..421ebcda62e6 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -43,10 +43,9 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 8058fca4d05d..9e6db8e0164f 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -8,7 +8,8 @@
 #include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 570a71509d2a..fa5e70c4b93a 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -17,7 +17,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index 6cf82922d3fb..b85354a99582 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
index 2585038d5575..1d998db41533 100644
--- a/drivers/watchdog/xilinx_wwdt.c
+++ b/drivers/watchdog/xilinx_wwdt.c
@@ -9,9 +9,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
 /* Max timeout is calculated at 100MHz source clock */
-- 
2.40.1

