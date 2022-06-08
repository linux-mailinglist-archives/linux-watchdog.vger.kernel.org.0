Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77148542D38
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jun 2022 12:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbiFHKYP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jun 2022 06:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236741AbiFHKXE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jun 2022 06:23:04 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD73E1F62E9;
        Wed,  8 Jun 2022 03:12:22 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id 5D8D31C811C2;
        Wed,  8 Jun 2022 17:56:36 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 8 Jun 2022
 17:56:36 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 8 Jun 2022
 17:56:35 +0800
Received: from taln60.nuvoton.com (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 8 Jun 2022 17:56:35 +0800
Received: by taln60.nuvoton.com (Postfix, from userid 10070)
        id C645963A51; Wed,  8 Jun 2022 12:56:33 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <daniel.lezcano@linaro.org>,
        <tglx@linutronix.de>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <arnd@arndb.de>, <olof@lixom.net>, <jirislaby@kernel.org>,
        <shawnguo@kernel.org>, <bjorn.andersson@linaro.org>,
        <geert+renesas@glider.be>, <marcel.ziswiler@toradex.com>,
        <vkoul@kernel.org>, <biju.das.jz@bp.renesas.com>,
        <nobuhiro1.iwamatsu@toshiba.co.jp>, <robert.hancock@calian.com>,
        <j.neuschaefer@gmx.net>, <lkundrak@v3.sk>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v2 18/20] arm64: dts: nuvoton: Add initial NPCM8XX device tree
Date:   Wed, 8 Jun 2022 12:56:21 +0300
Message-ID: <20220608095623.22327-19-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220608095623.22327-1-tmaimon77@gmail.com>
References: <20220608095623.22327-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds initial device tree support for the
Nuvoton NPCM845 Board Management controller (BMC) SoC family.

The NPCM845 based quad-core Cortex-A35 ARMv8 architecture and
have various peripheral IPs.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |   1 +
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 197 ++++++++++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |  76 +++++++
 3 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 1ba04e31a438..7b107fa7414b 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -19,6 +19,7 @@ subdir-y += lg
 subdir-y += marvell
 subdir-y += mediatek
 subdir-y += microchip
+subdir-y += nuvoton
 subdir-y += nvidia
 subdir-y += qcom
 subdir-y += realtek
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
new file mode 100644
index 000000000000..97e108c50760
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021 Nuvoton Technology tomer.maimon@nuvoton.com
+
+#include <dt-bindings/clock/nuvoton,npcm8xx-clock.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	/* external reference clock */
+	clk_refclk: clk-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "refclk";
+	};
+
+	/* external reference clock for cpu. float in normal operation */
+	clk_sysbypck: clk-sysbypck {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1000000000>;
+		clock-output-names = "sysbypck";
+	};
+
+	/* external reference clock for MC. float in normal operation */
+	clk_mcbypck: clk-mcbypck {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1050000000>;
+		clock-output-names = "mcbypck";
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gcr: gcr@f0800000 {
+			compatible = "nuvoton,npcm845-gcr", "syscon",
+				"simple-mfd";
+			reg = <0x0 0xf0800000 0x0 0x1000>;
+		};
+
+		gic: interrupt-controller@dfff9000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xdfff9000 0x0 0x1000>,
+			      <0x0 0xdfffa000 0x0 0x2000>,
+			      <0x0 0xdfffc000 0x0 0x2000>,
+			      <0x0 0xdfffe000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			#address-cells = <0>;
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+			};
+		};
+	};
+
+	ahb {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		rstc: rstc@f0801000 {
+			compatible = "nuvoton,npcm845-reset";
+			reg = <0x0 0xf0801000 0x0 0x78>;
+			#reset-cells = <2>;
+			nuvoton,sysgcr = <&gcr>;
+		};
+
+		clk: clock-controller@f0801000 {
+			compatible = "nuvoton,npcm845-clk";
+			#clock-cells = <1>;
+			reg = <0x0 0xf0801000 0x0 0x1000>;
+			clock-names = "refclk", "sysbypck", "mcbypck";
+			clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
+		};
+
+		apb {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "simple-bus";
+			interrupt-parent = <&gic>;
+			ranges = <0x0 0x0 0xf0000000 0x00300000>,
+				<0xfff00000 0x0 0xfff00000 0x00016000>;
+
+			timer0: timer@8000 {
+				compatible = "nuvoton,npcm845-timer";
+				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x8000 0x1C>;
+				clocks	= <&clk_refclk>;
+				clock-names = "refclk";
+			};
+
+			serial0: serial@0 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x0 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial1: serial@1000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x1000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial2: serial@2000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x2000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial3: serial@3000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x3000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial4: serial@4000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x4000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial5: serial@5000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x5000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			serial6: serial@6000 {
+				compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
+				reg = <0x6000 0x1000>;
+				clocks = <&clk NPCM8XX_CLK_UART>;
+				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				status = "disabled";
+			};
+
+			watchdog0: watchdog@801c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x801c 0x4>;
+				status = "disabled";
+				clocks = <&clk_refclk>;
+				syscon = <&gcr>;
+			};
+
+			watchdog1: watchdog@901c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0x901c 0x4>;
+				status = "disabled";
+				clocks = <&clk_refclk>;
+				syscon = <&gcr>;
+			};
+
+			watchdog2: watchdog@a01c {
+				compatible = "nuvoton,npcm845-wdt", "nuvoton,npcm750-wdt";
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xa01c 0x4>;
+				status = "disabled";
+				clocks = <&clk_refclk>;
+				syscon = <&gcr>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
new file mode 100644
index 000000000000..12118b75c0e6
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021 Nuvoton Technology tomer.maimon@nuvoton.com
+
+#include "nuvoton-common-npcm8xx.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x0>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x1>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x2>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			clocks = <&clk NPCM8XX_CLK_CPU>;
+			reg = <0x0 0x3>;
+			next-level-cache = <&l2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible      = "arm,psci-1.0";
+		method          = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.33.0

