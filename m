Return-Path: <linux-watchdog+bounces-4962-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNb+N24mnGlfAAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4962-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C64C174764
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E28D3007E28
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 10:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01D8350A39;
	Mon, 23 Feb 2026 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrGq1jMN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC26E34D39C;
	Mon, 23 Feb 2026 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841110; cv=none; b=Osn6SJ7utT+h9BR4ScjJpz8EtS1BKXhYCe99JagWdW6asmAkU2N48MbzEb2rlgbbkL6VlvDL7TAFq0yXoYTWpCkV7pzqOUjZ3wxu0v4G6i9I5HPMUGUo4pDT3U53muwyUtTFF/tzTOSJ39MhRiBAmYG2WISAHHno6DewfuE6xyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841110; c=relaxed/simple;
	bh=0YMrV2cevL2my8oUGKDEQ/x1xeXPbxY0fifBbC2gTtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvTbUf7yKbKcyXDNDU5yYhyWnjrGPw/GS5sDTNvaF9rT/9CyibyC5mTiXnnyri2uvbhqvwDNyO8cBuGbykZsEMGjqBoNMopuYi4MpDMd/uuN+yr2BHvNmrpn5ip90ef6Wst44kPqIeLIv99kFtOHO9Ojx9rcH+PfkvmLFEaL9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrGq1jMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7D9C19424;
	Mon, 23 Feb 2026 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841110;
	bh=0YMrV2cevL2my8oUGKDEQ/x1xeXPbxY0fifBbC2gTtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GrGq1jMNFfkVNK/VI1330fWq4WOfE4w8S+zutqmgXVR1VgW3ohmN4W7pCTo0HdsCS
	 OjaRITDD1gZlLPNkRjsqnz8oJvMBQpw7ScvjIfcdjdUg6Ujm5dl0a9fOPBQTOQZJT7
	 P8OSdnwAdx4rQAidIVUKBgkjeBZtyy11g8GVe76VEZBBeyg1lVA+kGzgykivCkP49p
	 2nqCdhFkisv3Sp0z44BLT0HiJL9B6kkzaSNCT9+SY2k4Zhy5Pvtw2OU7epKakE8wmC
	 659F7YfWnLsWbfzMWjwFobU5tvRIV9Jx4u/VAkWnI/jtmP6bDW2S/Tl1902Ad4HHUl
	 zOoN6XSSbijnA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/8] arm64: dts: ti: remove the Kontron SMARC-sAM67
Date: Mon, 23 Feb 2026 11:04:46 +0100
Message-ID: <20260223100459.844967-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-4962-lists,linux-watchdog=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwalle@kernel.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1C64C174764
X-Rspamd-Action: no action

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/Makefile               |   13 -
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 ---
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 -----------------
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 -
 6 files changed, 1368 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..260e211ca277 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -142,17 +142,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
-k3-am67a-kontron-sa67-dtbs := k3-am67a-kontron-sa67-base.dtb \
-	k3-am67a-kontron-sa67-rtc-rv8263.dtbo k3-am67a-kontron-sa67-gbe1.dtbo
-k3-am67a-kontron-sa67-ads2-dtbs := k3-am67a-kontron-sa67.dtb k3-am67a-kontron-sa67-ads2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-base.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gbe1.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-gpios.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-rtc-rv8263.dtbo
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-ads2.dtb
-dtb-$(CONFIG_ARCH_K3) += k3-am67a-kontron-sa67-ads2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -244,8 +234,6 @@ k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-sdcard.dtbo
 k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
-k3-am67a-kontron-sa67-base-gpios-dtbs := \
-	k3-am67a-kontron-sa67-base.dtb k3-am67a-kontron-sa67-gpios.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -318,7 +306,6 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
-	k3-am67a-kontron-sa67-base-gpios.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
deleted file mode 100644
index ae5e2b52594b..000000000000
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
+++ /dev/null
@@ -1,146 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/*
- * Kontron SMARC-sa67 board on the Kontron Eval Carrier 2.2.
- *
- * Copyright (c) 2025 Kontron Europe GmbH
- */
-
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/interrupt-controller/irq.h>
-#include "k3-pinctrl.h"
-
-&{/} {
-	pwm-fan {
-		compatible = "pwm-fan";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm_fan_pins_default>;
-		interrupts-extended = <&main_gpio1 7 IRQ_TYPE_EDGE_FALLING>;
-		#cooling-cells = <2>;
-		pwms = <&epwm2 1 4000000 0>;
-		cooling-levels = <1 128 192 255>;
-	};
-
-	sound {
-		compatible = "simple-audio-card";
-		simple-audio-card,widgets =
-			"Headphone", "Headphone Jack",
-			"Line", "Line Out Jack",
-			"Microphone", "Microphone Jack",
-			"Line", "Line In Jack";
-		simple-audio-card,routing =
-			"Line Out Jack", "LINEOUTR",
-			"Line Out Jack", "LINEOUTL",
-			"Headphone Jack", "HPOUTR",
-			"Headphone Jack", "HPOUTL",
-			"IN1L", "Line In Jack",
-			"IN1R", "Line In Jack",
-			"Microphone Jack", "MICBIAS",
-			"IN2L", "Microphone Jack",
-			"IN2R", "Microphone Jack";
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,format = "i2s";
-		simple-audio-card,bitclock-master = <&dailink0_master>;
-		simple-audio-card,frame-master = <&dailink0_master>;
-
-		simple-audio-card,cpu {
-			sound-dai = <&mcasp0>;
-		};
-
-		dailink0_master: simple-audio-card,codec {
-			sound-dai = <&wm8904>;
-			clocks = <&audio_refclk0>;
-		};
-	};
-
-	cvcc_1p8v_i2s: regulator-carrier-0 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_1V8_S0_I2S";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	cvcc_1p8v_s0: regulator-carrier-1 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_1V8_S0";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
-	cvcc_3p3v_s0: regulator-carrier-2 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V3_S0";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-	};
-};
-
-&audio_refclk0 {
-	status = "okay";
-};
-
-&epwm2 {
-	status = "okay";
-};
-
-&main_pmx0 {
-	pwm_fan_pins_default: pwm-fan-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1ec, PIN_OUTPUT, 8)	/* (A22) I2C1_SDA.EHRPWM2_B */
-			J722S_IOPAD(0x194, PIN_INPUT, 0)	/* (A25) MCASP0_AXR3.GPIO1_7 */
-		>;
-	};
-};
-
-&mcasp0 {
-	#sound-dai-cells = <0>;
-	status = "okay";
-};
-
-&mcu_i2c0 {
-	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	wm8904: audio-codec@1a {
-		#sound-dai-cells = <0>;
-		compatible = "wlf,wm8904";
-		reg = <0x1a>;
-		clocks = <&audio_refclk0>;
-		clock-names = "mclk";
-		AVDD-supply = <&cvcc_1p8v_i2s>;
-		CPVDD-supply = <&cvcc_1p8v_i2s>;
-		DBVDD-supply = <&cvcc_1p8v_i2s>;
-		DCVDD-supply = <&cvcc_1p8v_i2s>;
-		MICVDD-supply = <&cvcc_1p8v_i2s>;
-	};
-};
-
-&mcu_spi0 {
-	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <104000000>;
-		m25p,fast-read;
-		vcc-supply = <&cvcc_1p8v_s0>;
-	};
-};
-
-&wkup_i2c0 {
-	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	/* SMARC Carrier EEPROM */
-	eeprom@57 {
-		compatible = "atmel,24c32";
-		reg = <0x57>;
-		pagesize = <32>;
-		vcc-supply = <&cvcc_3p3v_s0>;
-	};
-};
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
deleted file mode 100644
index 95234c8460ed..000000000000
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ /dev/null
@@ -1,1091 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/*
- * Kontron SMARC-sAM67 module
- *
- * Copyright (c) 2025 Kontron Europe GmbH
- */
-
-/dts-v1/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/phy/phy.h>
-#include "k3-j722s.dtsi"
-#include "k3-serdes.h"
-
-/ {
-	compatible = "kontron,sa67", "ti,j722s";
-	model = "Kontron SMARC-sAM67";
-
-	aliases {
-		serial0 = &mcu_uart0;
-		serial1 = &main_uart0;
-		serial2 = &main_uart5;
-		serial3 = &wkup_uart0;
-		mmc0 = &sdhci0;
-		mmc1 = &sdhci1;
-		rtc0 = &wkup_rtc0;
-	};
-
-	lcd0_backlight: backlight-1 {
-		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd0_backlight_pins_default>;
-		pwms = <&epwm1 0 50000 0>;
-		brightness-levels = <0 32 64 96 128 160 192 224 255>;
-		default-brightness-level = <8>;
-		enable-gpios = <&main_gpio0 29 GPIO_ACTIVE_HIGH>;
-		status = "disabled";
-	};
-
-	lcd1_backlight: backlight-2 {
-		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&lcd1_backlight_pins_default>;
-		pwms = <&epwm1 1 50000 0>;
-		brightness-levels = <0 32 64 96 128 160 192 224 255>;
-		default-brightness-level = <8>;
-		enable-gpios = <&main_gpio1 18 GPIO_ACTIVE_HIGH>;
-		status = "disabled";
-	};
-
-	chosen {
-		stdout-path = "serial1:115200n8";
-	};
-
-	connector-1 {
-		compatible = "gpio-usb-b-connector", "usb-b-connector";
-		pinctrl-names = "default";
-		pinctrl-0 = <&usb0_connector_pins_default>;
-		type = "micro";
-		id-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
-		vbus-supply = <&vcc_usb0_vbus>;
-
-		port  {
-			usb0_connector: endpoint {
-				remote-endpoint = <&usb0_hc>;
-			};
-		};
-
-	};
-
-	memory@80000000 {
-		/* Filled in by bootloader */
-		reg = <0x00000000 0x00000000 0x00000000 0x00000000>,
-		      <0x00000000 0x00000000 0x00000000 0x00000000>;
-		device_type = "memory";
-		bootph-pre-ram;
-	};
-
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		linux,cma {
-			compatible = "shared-dma-pool";
-			reusable;
-			size = <0x00 0x10000000>;
-			linux,cma-default;
-		};
-
-		secure_tfa_ddr: tfa@9e780000 {
-			reg = <0x00 0x9e780000 0x00 0x80000>;
-			no-map;
-		};
-
-		secure_ddr: optee@9e800000 {
-			reg = <0x00 0x9e800000 0x00 0x01800000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: r5f-memory@a0100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa0100000 0x00 0xf00000>;
-			no-map;
-		};
-	};
-
-	vin_5p0: regulator-1 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V0_5V25_IN";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-		bootph-all;
-	};
-
-	vcc_3p3_s5: regulator-2 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V3_S5";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vin_5p0>;
-		regulator-always-on;
-		regulator-boot-on;
-		bootph-all;
-	};
-
-	vcc_1p8_s5: regulator-3 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_1V8_S5";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		vin-supply = <&vin_5p0>;
-		regulator-always-on;
-		regulator-boot-on;
-		bootph-all;
-	};
-
-	vcc_3p3_s0: regulator-4 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V3_S0";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3p3_s5>;
-		regulator-always-on;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&tps652g1 1 GPIO_ACTIVE_HIGH>;
-		bootph-all;
-	};
-
-	vcc_3p3_sd_s0: regulator-5 {
-		compatible = "regulator-fixed";
-		regulator-name = "SDIO_PWR_EN";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_3p3_sd_s0_pins_default>;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&main_gpio0 7 GPIO_ACTIVE_HIGH>;
-		bootph-all;
-	};
-
-	vcc_3p3_sd_vio_s0: regulator-6 {
-		compatible = "regulator-gpio";
-		regulator-name = "V_3V3_1V8_SD_S0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_3p3_sd_vio_s0_pins_default>;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3p3_s0>;
-		regulator-boot-on;
-		enable-active-high;
-		enable-gpios = <&main_gpio0 7 GPIO_ACTIVE_HIGH>;
-		gpios = <&main_gpio0 8 GPIO_ACTIVE_HIGH>;
-		states = <3300000 0x0>,
-			 <1800000 0x1>;
-		bootph-all;
-	};
-
-	vcc_3p3_cam_s0: regulator-7 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_3V3_CAM_S0";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_3p3_cam_s0_pins_default>;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_3p3_s5>;
-		enable-active-high;
-		interrupts-extended = <&main_gpio1 30 IRQ_TYPE_EDGE_FALLING>;
-		bootph-all;
-	};
-
-	vcc_1p1_s0: regulator-8 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_1V1_S0";
-		regulator-min-microvolt = <1100000>;
-		regulator-max-microvolt = <1100000>;
-		vin-supply = <&vcc_1p1_s3>;
-		regulator-always-on;
-		regulator-boot-on;
-		enable-active-high;
-		/* shared with V_0V75_0V85_CORE_S0 */
-		gpios = <&tps652g1 4 GPIO_ACTIVE_HIGH>;
-		bootph-all;
-	};
-
-	vcc_0p85_vcore_s0: regulator-9 {
-		compatible = "regulator-fixed";
-		regulator-name = "V_0V75_0V85_CORE_S0";
-		regulator-min-microvolt = <850000>;
-		regulator-max-microvolt = <850000>;
-		vin-supply = <&vin_5p0>;
-		regulator-always-on;
-		regulator-boot-on;
-		enable-active-high;
-		gpios = <&tps652g1 4 GPIO_ACTIVE_HIGH>;
-		bootph-all;
-	};
-
-	vcc_lcd0_panel: regulator-10 {
-		compatible = "regulator-fixed";
-		regulator-name = "LCD0_VDD_EN";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_lcd0_panel_pins_default>;
-		enable-active-high;
-		gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
-	};
-
-	vcc_lcd1_panel: regulator-11 {
-		compatible = "regulator-fixed";
-		regulator-name = "LCD1_VDD_EN";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_lcd1_panel_pins_default>;
-		enable-active-high;
-		gpios = <&main_gpio1 19 GPIO_ACTIVE_HIGH>;
-	};
-
-	vcc_usb0_vbus: regulator-12 {
-		compatible = "regulator-fixed";
-		regulator-name = "USB0_EN_OC#";
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc_usb0_vbus_pins_default>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		enable-active-high;
-		gpios = <&main_gpio1 50 GPIO_ACTIVE_HIGH>;
-	};
-};
-
-&audio_refclk0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&audio_refclk0_pins_default>;
-	status = "disabled";
-};
-
-&audio_refclk1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&audio_refclk1_pins_default>;
-	status = "disabled";
-};
-
-&cpsw3g {
-	pinctrl-names = "default";
-	pinctrl-0 = <&cpsw3g_pins_default>, <&rgmii1_pins_default>,
-		    <&rgmii2_pins_default>;
-	status = "okay";
-};
-
-&cpsw3g_mdio {
-	pinctrl-names = "default";
-	pinctrl-0 = <&cpsw3g_mdio_pins_default>;
-	status = "okay";
-
-	phy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-
-	phy1: ethernet-phy@1 {
-		reg = <1>;
-	};
-};
-
-&cpsw_port1 {
-	phy-connection-type = "rgmii-id";
-	phy-handle = <&phy0>;
-	nvmem-cells = <&base_mac_address 0>;
-	nvmem-cell-names = "mac-address";
-	status = "okay";
-};
-
-&main_gpio0 {
-	gpio-line-names =
-		"", "", "", "", "", "", "", "SOC_SDIO_PWR_EN", "VSD_SEL",
-		"RESET_OUT#", "I2C_MUX_RST#", "SPI_FLASH_CS#", "QPSI_CS0#",
-		"QSPI_CS1#", "BOOT_SEL1", "BRDCFG0", "BRDCFG1", "BRDCFG2",
-		"BRDCFG3", "BRDCFG4", "", "BRDREV0", "BRDREV1", "", "", "", "",
-		"", "", "LCD0_BKLT_EN", "LCD0_VDD_EN", "GBE_INT#", "DSI0_TE",
-		"CHARGING#", "USB0_OTG_ID", "PMIC_INT#", "RTC_INT#",
-		"EDP_BRIDGE_EN", "EDP_BRIDGE_IRQ#", "", "CHARGER_PRSNT#", "",
-		"", "", "", "BOOT_SEL2#", "CAM2_RST#", "CAM2_PWR#", "",
-		"CAM3_RST#", "CAM3_PWR#", "GPIO0", "GPIO1", "", "", "", "", "",
-		"", "", "", "", "", "", "", "", "", "", "", "GPIO10", "GPIO11",
-		"SLEEP#", "LID#";
-
-	bootph-all;
-	status = "okay";
-};
-
-&main_gpio1 {
-	gpio-line-names =
-		"", "", "", "", "", "", "", "GPIO6", "GPIO7", "", "", "", "",
-		"GPIO8", "GPIO9", "PCIE_A_RST#", "", "BATLOW#", "LCD1_BKLT_EN",
-		"LCD1_VDD_EN", "", "", "", "", "GPIO2", "GPIO3", "", "",
-		"GPIO4", "GPIO5", "CAM_S0_FAULT#", "BOOT_SEL0#", "", "", "", "",
-		"", "", "", "", "", "", "", "", "", "", "", "", "SDIO_CD#", "",
-		"USB0_DRVVBUS", "USB1_DRVVBUS";
-
-	bootph-all;
-	status = "okay";
-};
-
-/* I2C_LOCAL */
-&main_i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_i2c0_pins_default>;
-	clock-frequency = <100000>;
-	bootph-all;
-	status = "okay";
-
-	tps652g1: pmic@44 {
-		compatible = "ti,tps652g1";
-		reg = <0x44>;
-		ti,primary-pmic;
-		system-power-controller;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-line-names =
-			"LPM_EN#", "EN_3V3_S0", "POWER_BTN#", "CARRIER_STBY#",
-			"EN_0V75_0V85_VCORE_S0", "PMIC_WAKEUP";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_irq_pins_default>;
-		interrupts-extended = <&main_gpio0 35 IRQ_TYPE_EDGE_FALLING>;
-
-		buck1-supply = <&vin_5p0>;
-		buck2-supply = <&vin_5p0>;
-		buck3-supply = <&vin_5p0>;
-		buck4-supply = <&vin_5p0>;
-		ldo1-supply = <&vin_5p0>;
-		ldo2-supply = <&vin_5p0>;
-		ldo3-supply = <&vin_5p0>;
-
-		bootph-all;
-
-		regulators {
-			vcc_0p85_s0: buck1 {
-				regulator-name = "V_0V85_S0";
-				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt = <850000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p1_s3: buck2 {
-				regulator-name = "V_1V1_S3";
-				regulator-min-microvolt = <1100000>;
-				regulator-max-microvolt = <1100000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p8_s0: buck3 {
-				regulator-name = "V_1V8_S0";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p2_s0: buck4 {
-				regulator-name = "V_1V2_S0";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p8_vda_pll_s0: ldo1 {
-				regulator-name = "V_1V8_VDA_PLL_S0";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p8_s3: ldo2 {
-				regulator-name = "V_1V8_S3";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			vcc_1p8_ret_s5: ldo3 {
-				regulator-name = "V_1V8_RET_S5";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-		};
-	};
-
-	system-controller@4a {
-		compatible = "kontron,sa67mcu", "kontron,sl28cpld";
-		reg = <0x4a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		watchdog@4 {
-			compatible = "kontron,sa67mcu-wdt", "kontron,sl28cpld-wdt";
-			reg = <0x4>;
-			kontron,assert-wdt-timeout-pin;
-		};
-
-		hwmon@8 {
-			compatible = "kontron,sa67mcu-hwmon";
-			reg = <0x8>;
-		};
-	};
-};
-
-/* I2C_CAM */
-&main_i2c2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_i2c2_pins_default>;
-	clock-frequency = <100000>;
-	status = "okay";
-
-	i2c-mux@70 {
-		compatible = "nxp,pca9546";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&i2c_mux_pins_default>;
-
-		vdd-supply = <&vcc_1p8_s0>;
-		reset-gpios = <&main_gpio0 10 GPIO_ACTIVE_LOW>;
-
-		i2c_cam0: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
-		};
-
-		i2c_cam1: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-		};
-
-		i2c_cam2: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-		};
-
-		i2c_cam3: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-		};
-	};
-};
-
-/* I2C_LCD */
-&main_i2c3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_i2c3_pins_default>;
-	clock-frequency = <100000>;
-	status = "okay";
-};
-
-&main_pmx0 {
-	audio_refclk0_pins_default: audio-refclk0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0c4, PIN_OUTPUT, 5)	/* (W23) VOUT0_DATA3.AUDIO_EXT_REFCLK0 */
-		>;
-	};
-
-	audio_refclk1_pins_default: audio-refclk1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0a0, PIN_OUTPUT, 1)	/* (N24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
-		>;
-	};
-
-	cpsw3g_mdio_pins_default: cpsw3g-mdio-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x160, PIN_OUTPUT, 0)	/* (AC24) MDIO0_MDC */
-			J722S_IOPAD(0x15c, PIN_INPUT, 0)	/* (AD25) MDIO0_MDIO */
-		>;
-	};
-
-	cpsw3g_pins_default: cpsw3g-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1b8, PIN_OUTPUT, 1)	/* (C20) SPI0_CS1.CP_GEMAC_CPTS0_TS_COMP */
-		>;
-	};
-
-	edp_bridge_pins_default: edp-bridge-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x098, PIN_OUTPUT, 7)	/* (V21) GPMC0_WAIT0.GPIO0_37 */
-			J722S_IOPAD(0x09c, PIN_INPUT, 7)	/* (W26) GPMC0_WAIT1.GPIO0_38 */
-		>;
-	};
-
-	i2c_mux_pins_default: i2c-mux-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x028, PIN_OUTPUT, 7)	/* (M27) OSPI0_D7.GPIO0_10 */
-		>;
-	};
-
-	lcd0_backlight_pins_default: lcd0-backlight-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x074, PIN_OUTPUT, 7)	/* (V22) GPMC0_AD14.GPIO0_29 */
-			J722S_IOPAD(0x110, PIN_OUTPUT, 4)	/* (G27) MMC2_DAT1.EHRPWM1_A */
-		>;
-	};
-
-	lcd1_backlight_pins_default: lcd1-backlight-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1c0, PIN_OUTPUT, 7)	/* (E19) SPI0_D0.GPIO1_18 */
-			J722S_IOPAD(0x114, PIN_OUTPUT, 4)	/* (G26) MMC2_DAT0.EHRPWM1_B */
-		>;
-	};
-
-	main_i2c0_pins_default: main-i2c0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1e0, PIN_INPUT, 0)	/* (D23) I2C0_SCL */
-			J722S_IOPAD(0x1e4, PIN_INPUT, 0)	/* (B22) I2C0_SDA */
-		>;
-		bootph-all;
-	};
-
-	main_i2c2_pins_default: main-i2c2-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0b0, PIN_INPUT, 1)	/* (P22) GPMC0_CSn2.I2C2_SCL */
-			J722S_IOPAD(0x0b4, PIN_INPUT, 1)	/* (P23) GPMC0_CSn3.I2C2_SDA */
-		>;
-	};
-
-	main_i2c3_pins_default: main-i2c3-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1d0, PIN_INPUT, 2)	/* (E22) UART0_CTSn.I2C3_SCL */
-			J722S_IOPAD(0x1d4, PIN_INPUT, 2)	/* (B21) UART0_RTSn.I2C3_SDA */
-		>;
-	};
-
-	main_i2c4_pins_default: main-i2c4-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0a8, PIN_INPUT, 1)	/* (R27) GPMC0_CSn0.I2C4_SCL */
-			J722S_IOPAD(0x0ac, PIN_INPUT, 1)	/* (P21) GPMC0_CSn1.I2C4_SDA */
-		>;
-	};
-
-	main_uart0_pins_default: main-uart0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1c8, PIN_INPUT, 0)	/* (F19) UART0_RXD */
-			J722S_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (F20) UART0_TXD */
-		>;
-		bootph-all;
-	};
-
-	main_uart5_pins_default: main-uart5-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x108, PIN_INPUT, 3)	/* (J27) MMC2_DAT3.UART5_RXD */
-			J722S_IOPAD(0x10c, PIN_OUTPUT, 3)	/* (H27) MMC2_DAT2.UART5_TXD */
-			J722S_IOPAD(0x008, PIN_INPUT, 5)	/* (L22) OSPI0_DQS.UART5_CTSn */
-			J722S_IOPAD(0x004, PIN_OUTPUT, 5)	/* (L23) OSPI0_LBCLKO.UART5_RTSn */
-		>;
-	};
-
-	mcasp0_pins_default: mcasp0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1a4, PIN_INPUT, 0)	/* (D25) MCASP0_ACLKX */
-			J722S_IOPAD(0x1a8, PIN_INPUT, 0)	/* (C26) MCASP0_AFSX */
-			J722S_IOPAD(0x1a0, PIN_INPUT, 0)	/* (F23) MCASP0_AXR0 */
-			J722S_IOPAD(0x19c, PIN_OUTPUT, 0)	/* (B25) MCASP0_AXR1 */
-		>;
-	};
-
-	mcasp2_pins_default: mcasp2-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x070, PIN_INPUT, 3)	/* (V24) GPMC0_AD13.MCASP2_ACLKX */
-			J722S_IOPAD(0x06c, PIN_INPUT, 3)	/* (V26) GPMC0_AD12.MCASP2_AFSX */
-			J722S_IOPAD(0x05c, PIN_INPUT, 3)	/* (U27) GPMC0_AD8.MCASP2_AXR0 */
-			J722S_IOPAD(0x060, PIN_OUTPUT, 3)	/* (U26) GPMC0_AD9.MCASP2_AXR1 */
-		>;
-	};
-
-	oldi0_pins_default: oldi0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x260, PIN_OUTPUT, 0)	/* (AF23) OLDI0_A0N */
-			J722S_IOPAD(0x25c, PIN_OUTPUT, 0)	/* (AG24) OLDI0_A0P */
-			J722S_IOPAD(0x268, PIN_OUTPUT, 0)	/* (AG22) OLDI0_A1N */
-			J722S_IOPAD(0x264, PIN_OUTPUT, 0)	/* (AG23) OLDI0_A1P */
-			J722S_IOPAD(0x270, PIN_OUTPUT, 0)	/* (AB20) OLDI0_A2N */
-			J722S_IOPAD(0x26c, PIN_OUTPUT, 0)	/* (AB21) OLDI0_A2P */
-			J722S_IOPAD(0x278, PIN_OUTPUT, 0)	/* (AG20) OLDI0_A3N */
-			J722S_IOPAD(0x274, PIN_OUTPUT, 0)	/* (AG21) OLDI0_A3P */
-			J722S_IOPAD(0x2a0, PIN_OUTPUT, 0)	/* (AF21) OLDI0_CLK0N */
-			J722S_IOPAD(0x29c, PIN_OUTPUT, 0)	/* (AE20) OLDI0_CLK0P */
-		>;
-	};
-
-	oldi1_pins_default: oldi1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x280, PIN_OUTPUT, 0)	/* (AD21) OLDI0_A4N */
-			J722S_IOPAD(0x27c, PIN_OUTPUT, 0)	/* (AC21) OLDI0_A4P */
-			J722S_IOPAD(0x288, PIN_OUTPUT, 0)	/* (AF19) OLDI0_A5N */
-			J722S_IOPAD(0x284, PIN_OUTPUT, 0)	/* (AF18) OLDI0_A5P */
-			J722S_IOPAD(0x290, PIN_OUTPUT, 0)	/* (AG17) OLDI0_A6N */
-			J722S_IOPAD(0x28c, PIN_OUTPUT, 0)	/* (AG18) OLDI0_A6P */
-			J722S_IOPAD(0x298, PIN_OUTPUT, 0)	/* (AB19) OLDI0_A7N */
-			J722S_IOPAD(0x294, PIN_OUTPUT, 0)	/* (AA20) OLDI0_A7P */
-			J722S_IOPAD(0x2a8, PIN_OUTPUT, 0)	/* (AD20) OLDI0_CLK1N */
-			J722S_IOPAD(0x2a4, PIN_OUTPUT, 0)	/* (AE19) OLDI0_CLK1P */
-		>;
-	};
-
-	ospi0_pins_default: ospi0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x000, PIN_OUTPUT, 0)	/* (L24) OSPI0_CLK */
-			J722S_IOPAD(0x02c, PIN_OUTPUT, 0)	/* (K26) OSPI0_CSn0 */
-			J722S_IOPAD(0x030, PIN_OUTPUT, 0)	/* (K23) OSPI0_CSn1 */
-			J722S_IOPAD(0x034, PIN_OUTPUT, 0)	/* (K22) OSPI0_CSn2 */
-			J722S_IOPAD(0x00c, PIN_INPUT, 0)	/* (K27) OSPI0_D0 */
-			J722S_IOPAD(0x010, PIN_INPUT, 0)	/* (L27) OSPI0_D1 */
-			J722S_IOPAD(0x014, PIN_INPUT, 0)	/* (L26) OSPI0_D2 */
-			J722S_IOPAD(0x018, PIN_INPUT, 0)	/* (L25) OSPI0_D3 */
-		>;
-		bootph-all;
-	};
-
-	pcie0_rc_pins_default: pcie0-rc-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x2ac, PIN_OUTPUT, 0)	/* (F25) PCIE0_CLKREQn */
-			J722S_IOPAD(0x1b4, PIN_OUTPUT, 7)	/* (B20) SPI0_CS0.GPIO1_15 */
-		>;
-	};
-
-	pmic_irq_pins_default: pmic-irq-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x090, PIN_INPUT, 7)	/* (P27) GPMC0_BE0n_CLE.GPIO0_35 */
-		>;
-	};
-
-	rgmii1_pins_default: rgmii1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x14c, PIN_INPUT, 0)	/* (AC25) RGMII1_RD0 */
-			J722S_IOPAD(0x150, PIN_INPUT, 0)	/* (AD27) RGMII1_RD1 */
-			J722S_IOPAD(0x154, PIN_INPUT, 0)	/* (AE24) RGMII1_RD2 */
-			J722S_IOPAD(0x158, PIN_INPUT, 0)	/* (AE26) RGMII1_RD3 */
-			J722S_IOPAD(0x148, PIN_INPUT, 0)	/* (AE27) RGMII1_RXC */
-			J722S_IOPAD(0x144, PIN_INPUT, 0)	/* (AD23) RGMII1_RX_CTL */
-			J722S_IOPAD(0x134, PIN_OUTPUT, 0)	/* (AF27) RGMII1_TD0 */
-			J722S_IOPAD(0x138, PIN_OUTPUT, 0)	/* (AE23) RGMII1_TD1 */
-			J722S_IOPAD(0x13c, PIN_OUTPUT, 0)	/* (AG25) RGMII1_TD2 */
-			J722S_IOPAD(0x140, PIN_OUTPUT, 0)	/* (AF24) RGMII1_TD3 */
-			J722S_IOPAD(0x130, PIN_OUTPUT, 0)	/* (AG26) RGMII1_TXC */
-			J722S_IOPAD(0x12c, PIN_OUTPUT, 0)	/* (AF25) RGMII1_TX_CTL */
-		>;
-	};
-
-	rgmii2_pins_default: rgmii2-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0f8, PIN_INPUT, 2)	/* (AB24) VOUT0_HSYNC.RGMII2_RD0 */
-			J722S_IOPAD(0x0fc, PIN_INPUT, 2)	/* (AC27) VOUT0_DE.RGMII2_RD1 */
-			J722S_IOPAD(0x100, PIN_INPUT, 2)	/* (AB23) VOUT0_VSYNC.RGMII2_RD2 */
-			J722S_IOPAD(0x104, PIN_INPUT, 2)	/* (AC26) VOUT0_PCLK.RGMII2_RD3 */
-			J722S_IOPAD(0x0f4, PIN_INPUT, 2)	/* (AB27) VOUT0_DATA15.RGMII2_RXC */
-			J722S_IOPAD(0x0f0, PIN_INPUT, 2)	/* (AB26) VOUT0_DATA14.RGMII2_RX_CTL */
-			J722S_IOPAD(0x0e0, PIN_OUTPUT, 2)	/* (AA25) VOUT0_DATA10.RGMII2_TD0 */
-			J722S_IOPAD(0x0e4, PIN_OUTPUT, 2)	/* (AB25) VOUT0_DATA11.RGMII2_TD1 */
-			J722S_IOPAD(0x0e8, PIN_OUTPUT, 2)	/* (AA23) VOUT0_DATA12.RGMII2_TD2 */
-			J722S_IOPAD(0x0ec, PIN_OUTPUT, 2)	/* (AA22) VOUT0_DATA13.RGMII2_TD3 */
-			J722S_IOPAD(0x0dc, PIN_OUTPUT, 2)	/* (AA27) VOUT0_DATA9.RGMII2_TXC */
-			J722S_IOPAD(0x0d8, PIN_OUTPUT, 2)	/* (AA24) VOUT0_DATA8.RGMII2_TX_CTL */
-		>;
-	};
-
-	rtc_pins_default: rtc-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x094, PIN_INPUT, 7)	/* (P26) GPMC0_BE1n.GPIO0_36 */
-		>;
-	};
-
-	sdhci1_pins_default: sdhci1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x23c, PIN_INPUT, 0)	/* (H22) MMC1_CMD */
-			J722S_IOPAD(0x234, PIN_OUTPUT, 0)	/* (H24) MMC1_CLK */
-			J722S_IOPAD(0x230, PIN_INPUT, 0)	/* (H23) MMC1_DAT0 */
-			J722S_IOPAD(0x22c, PIN_INPUT, 0)	/* (H20) MMC1_DAT1 */
-			J722S_IOPAD(0x228, PIN_INPUT, 0)	/* (J23) MMC1_DAT2 */
-			J722S_IOPAD(0x224, PIN_INPUT, 0)	/* (H25) MMC1_DAT3 */
-			J722S_IOPAD(0x240, PIN_INPUT, 0)	/* (B24) MMC1_SDCD */
-			J722S_IOPAD(0x244, PIN_INPUT, 0)	/* (A24) MMC1_SDWP */
-		>;
-		bootph-all;
-	};
-
-	usb0_connector_pins_default: usb0-connector-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x08c, PIN_INPUT_PULLUP, 7)	/* (N23) GPMC0_WEn.GPIO0_34 */
-		>;
-	};
-
-	usb1_pins_default: usb1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x258, PIN_OUTPUT, 0)	/* (B27) USB1_DRVVBUS */
-		>;
-	};
-
-	vcc_3p3_sd_s0_pins_default: vcc-3p3-sd-s0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x01c, PIN_OUTPUT, 7)	/* (L21) OSPI0_D4.GPIO0_7 */
-		>;
-		bootph-all;
-	};
-
-	vcc_3p3_sd_vio_s0_pins_default: vcc-3p3-sd-vio-s0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x020, PIN_OUTPUT, 7)	/* (M26) OSPI0_D5.GPIO0_8 */
-		>;
-		bootph-all;
-	};
-
-	vcc_3p3_cam_s0_pins_default: vcc-3p3-cam-s0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1f0, PIN_OUTPUT, 7)	/* (A23) EXT_REFCLK1.GPIO1_30 */
-		>;
-	};
-
-	vcc_lcd0_panel_pins_default: vcc-lcd0-panel-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x078, PIN_OUTPUT, 7)	/* (V23) GPMC0_AD15.GPIO0_30 */
-		>;
-	};
-
-	vcc_lcd1_panel_pins_default: vcc-lcd1-panel-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x1c4, PIN_OUTPUT, 7)	/* (E20) SPI0_D1.GPIO1_19 */
-		>;
-	};
-
-	vcc_usb0_vbus_pins_default: vcc-usb0-vbus-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x254, PIN_OUTPUT, 7)	/* (E25) USB0_DRVVBUS.GPIO1_50 */
-		>;
-	};
-};
-
-/* SER1 */
-&main_uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_uart0_pins_default>;
-	bootph-all;
-	status = "okay";
-};
-
-/* SER2 */
-&main_uart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_uart5_pins_default>;
-	bootph-all;
-	status = "okay";
-};
-
-/* I2S0 */
-&mcasp0 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcasp0_pins_default>;
-	op-mode = <0>; /* I2S */
-	tdm-slots = <2>;
-	serial-dir = <2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
-};
-
-/* I2S2 */
-&mcasp2 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcasp2_pins_default>;
-	op-mode = <0>; /* I2S */
-	tdm-slots = <2>;
-	serial-dir = <2 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
-};
-
-/* CAN0 */
-&mcu_mcan0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_mcan0_pins_default>;
-	status = "okay";
-};
-
-/* CAN1 */
-&mcu_mcan1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_mcan1_pins_default>;
-	status = "okay";
-};
-
-&mcu_gpio0 {
-	gpio-line-names =
-		"", "", "", "", "", "", "", "", "", "", "", /* 10 */ "GPIO12",
-		"MCU_INT#", "", "", "", "", "", "", "", "", "", "", "GPIO13";
-};
-
-/* I2C_GP */
-&mcu_i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_i2c0_pins_default>;
-	clock-frequency = <100000>;
-	status = "okay";
-
-	/* SMARC Module EEPROM */
-	eeprom@50 {
-		compatible = "atmel,24c32";
-		reg = <0x50>;
-		pagesize = <32>;
-		vcc-supply = <&vcc_1p8_s0>;
-	};
-};
-
-&mcu_pmx0 {
-	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x044, PIN_INPUT, 0)	/* (B13) MCU_I2C0_SCL */
-			J722S_MCU_IOPAD(0x048, PIN_INPUT, 0)	/* (E11) MCU_I2C0_SDA */
-		>;
-	};
-	mcu_mcan0_pins_default: mcu-mcan0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x038, PIN_INPUT, 0)	/* (D8) MCU_MCAN0_RX */
-			J722S_MCU_IOPAD(0x034, PIN_OUTPUT, 0)	/* (B2) MCU_MCAN0_TX */
-		>;
-	};
-
-	mcu_mcan1_pins_default: mcu-mcan1-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x040, PIN_INPUT, 0)	/* (B1) MCU_MCAN1_RX */
-			J722S_MCU_IOPAD(0x03c, PIN_OUTPUT, 0)	/* (C1) MCU_MCAN1_TX */
-		>;
-	};
-
-	mcu_uart0_pins_default: mcu-uart0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x014, PIN_INPUT, 0)	/* (B8) MCU_UART0_RXD */
-			J722S_MCU_IOPAD(0x018, PIN_OUTPUT, 0)	/* (B4) MCU_UART0_TXD */
-			J722S_MCU_IOPAD(0x01c, PIN_INPUT, 0)	/* (B5) MCU_UART0_CTSn */
-			J722S_MCU_IOPAD(0x020, PIN_OUTPUT, 0)	/* (C5) MCU_UART0_RTSn */
-		>;
-		bootph-all;
-	};
-
-	mcu_spi0_pins_default: mcu-spi0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x008, PIN_OUTPUT, 0)	/* (A9) MCU_SPI0_CLK */
-			J722S_MCU_IOPAD(0x000, PIN_OUTPUT, 0)	/* (C12) MCU_SPI0_CS0 */
-			J722S_MCU_IOPAD(0x004, PIN_OUTPUT, 0)	/* (A10) MCU_SPI0_CS1 */
-			J722S_MCU_IOPAD(0x00c, PIN_INPUT, 0)	/* (B12) MCU_SPI0_D0 */
-			J722S_MCU_IOPAD(0x010, PIN_OUTPUT, 0)	/* (C11) MCU_SPI0_D1 */
-		>;
-	};
-
-	wkup_uart0_pins_default: wkup-uart0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x024, PIN_INPUT, 0)	/* (B3) WKUP_UART0_RXD */
-			J722S_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (C8) WKUP_UART0_TXD */
-		>;
-		bootph-all;
-	};
-
-	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
-		pinctrl-single,pins = <
-			J722S_MCU_IOPAD(0x04c, PIN_INPUT, 0)	/* (B9) WKUP_I2C0_SCL */
-			J722S_MCU_IOPAD(0x050, PIN_INPUT, 0)	/* (D11) WKUP_I2C0_SDA */
-		>;
-	};
-};
-
-/* SPI0 */
-&mcu_spi0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_spi0_pins_default>;
-};
-
-/* SER0 */
-&mcu_uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_uart0_pins_default>;
-	bootph-all;
-	status = "okay";
-};
-
-/* QSPI0 */
-&ospi0 {
-	pinctrl-0 = <&ospi0_pins_default>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <104000000>;
-		spi-rx-bus-width = <2>;
-		spi-tx-bus-width = <2>;
-		m25p,fast-read;
-		cdns,tshsl-ns = <60>;
-		cdns,tsd2d-ns = <60>;
-		cdns,tchsh-ns = <60>;
-		cdns,tslch-ns = <60>;
-		cdns,read-delay = <3>;
-		vcc-supply = <&vcc_1p8_s0>;
-		bootph-all;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				reg = <0x000000 0x400000>;
-				label = "failsafe bootloader";
-				read-only;
-			};
-		};
-
-		otp-1 {
-			compatible = "user-otp";
-
-			nvmem-layout {
-				compatible = "kontron,sa67-vpd", "kontron,sl28-vpd";
-
-				serial_number: serial-number {
-				};
-
-				base_mac_address: base-mac-address {
-					#nvmem-cell-cells = <1>;
-				};
-			};
-		};
-	};
-};
-
-&pcie0_rc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_rc_pins_default>;
-
-	/*
-	 * This is low active, but the driver itself is broken and already
-	 * inverts the logic.
-	 */
-	reset-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
-	phys = <&serdes1_pcie>;
-	phy-names = "pcie-phy";
-	status = "okay";
-};
-
-&sdhci0 {
-	disable-wp;
-	bootph-all;
-	ti,driver-strength-ohm = <50>;
-	status = "okay";
-};
-
-/* SDIO */
-&sdhci1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&sdhci1_pins_default>;
-	vmmc-supply = <&vcc_3p3_sd_s0>;
-	vqmmc-supply = <&vcc_3p3_sd_vio_s0>;
-	bootph-all;
-	cd-gpios = <&main_gpio1 48 GPIO_ACTIVE_LOW>;
-	cd-debounce-delay-ms = <100>;
-	ti,fails-without-test-cd;
-	ti,driver-strength-ohm = <50>;
-	status = "okay";
-};
-
-&serdes_ln_ctrl {
-	idle-states = <J722S_SERDES0_LANE0_USB>,
-		      <J722S_SERDES1_LANE0_PCIE0_LANE0>;
-};
-
-&serdes_wiz0 {
-	status = "okay";
-};
-
-&serdes_wiz1 {
-	status = "okay";
-};
-
-&serdes0 {
-	serdes0_usb3: phy@0 {
-		reg = <0>;
-		#phy-cells = <0>;
-		resets = <&serdes_wiz0 1>;
-		cdns,num-lanes = <1>;
-		cdns,phy-type = <PHY_TYPE_USB3>;
-	};
-};
-
-&serdes1 {
-	serdes1_pcie: phy@0 {
-		reg = <0>;
-		#phy-cells = <0>;
-		resets = <&serdes_wiz1 1>;
-		cdns,num-lanes = <1>;
-		cdns,phy-type = <PHY_TYPE_PCIE>;
-	};
-};
-
-&usb0 {
-	/* dual role is implemented but not a full featured OTG */
-	adp-disable;
-	hnp-disable;
-	srp-disable;
-	dr_mode = "otg";
-	usb-role-switch;
-	role-switch-default-mode = "peripheral";
-	status = "okay";
-
-	port {
-		usb0_hc: endpoint {
-			remote-endpoint = <&usb0_connector>;
-		};
-	};
-};
-
-&usb0_phy_ctrl {
-	/*
-	 * Keep this node in the SPL to be able to use the USB controller to
-	 * boot via DFU.
-	 */
-	bootph-all;
-};
-
-&usb1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&usb1_pins_default>;
-
-	dr_mode = "host";
-	maximum-speed = "super-speed";
-	phys = <&serdes0_usb3>;
-	phy-names = "cdns3,usb3-phy";
-};
-
-&usbss0 {
-	ti,vbus-divider;
-	status = "okay";
-};
-
-&usbss1 {
-	ti,vbus-divider;
-	status = "okay";
-};
-
-/* I2C_PM */
-&wkup_i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&wkup_i2c0_pins_default>;
-	clock-frequency = <100000>;
-	status = "okay";
-};
-
-/* SER3 */
-&wkup_uart0 {
-	/* WKUP UART0 is used by Device Manager firmware */
-	pinctrl-names = "default";
-	pinctrl-0 = <&wkup_uart0_pins_default>;
-	bootph-all;
-	status = "reserved";
-};
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
deleted file mode 100644
index 5dfb0b8f10d2..000000000000
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/*
- * Second ethernet port GBE1.
- *
- * Copyright (c) 2025 Kontron Europe GmbH
- */
-
-/dts-v1/;
-/plugin/;
-
-&cpsw3g_mdio {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	phy1: ethernet-phy@1 {
-		reg = <1>;
-	};
-};
-
-&cpsw_port2 {
-	phy-connection-type = "rgmii-id";
-	phy-handle = <&phy1>;
-	nvmem-cells = <&base_mac_address 1>;
-	nvmem-cell-names = "mac-address";
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
deleted file mode 100644
index a6ae758e0b3a..000000000000
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/*
- * SMARC GPIOs.
- *
- * Copyright (c) 2025 Kontron Europe GmbH
- */
-
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/gpio/gpio.h>
-#include "k3-pinctrl.h"
-
-&main_gpio0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_gpio0_pins_default>;
-};
-
-&main_gpio1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&main_gpio1_pins_default>;
-};
-
-&main_pmx0 {
-	main_gpio0_pins_default: main-gpio0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x0d0, PIN_INPUT, 7)	/* (Y26) VOUT0_DATA6.GPIO0_51 */
-			J722S_IOPAD(0x0d4, PIN_INPUT, 7)	/* (Y27) VOUT0_DATA7.GPIO0_52 */
-			J722S_IOPAD(0x118, PIN_INPUT, 7)	/* (H26) MMC2_CLK.GPIO0_69 */
-			J722S_IOPAD(0x120, PIN_INPUT, 7)	/* (F27) MMC2_CMD.GPIO0_70 */
-		>;
-	};
-
-	main_gpio1_pins_default: main-gpio1-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x194, PIN_INPUT, 7)	/* (A25) MCASP0_AXR3.GPIO1_7 */
-			J722S_IOPAD(0x198, PIN_INPUT, 7)	/* (A26) MCASP0_AXR2.GPIO1_8 */
-			J722S_IOPAD(0x1ac, PIN_INPUT, 7)	/* (C27) MCASP0_AFSR.GPIO1_13 */
-			J722S_IOPAD(0x1b0, PIN_INPUT, 7)	/* (F24) MCASP0_ACLKR.GPIO1_14 */
-			J722S_IOPAD(0x1d8, PIN_INPUT, 7)	/* (D22) MCAN0_TX.GPIO1_24 */
-			J722S_IOPAD(0x1dc, PIN_INPUT, 7)	/* (C22) MCAN0_RX.GPIO1_25 */
-			J722S_IOPAD(0x1e8, PIN_INPUT, 7)	/* (C24) I2C1_SCL.GPIO1_28 */
-			J722S_IOPAD(0x1ec, PIN_INPUT, 7)	/* (A22) I2C1_SDA.GPIO1_29 */
-		>;
-	};
-};
-
-&mcu_gpio0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mcu_gpio0_pins_default>;
-};
-
-&mcu_pmx0 {
-	mcu_gpio0_pins_default: mcu-gpio0-default-pins {
-		pinctrl-single,pins = <
-			J722S_IOPAD(0x02c, PIN_INPUT, 7)	/* (C4) WKUP_UART0_CTSn.MCU_GPIO0_11 */
-			J722S_IOPAD(0x084, PIN_INPUT, 7)	/* (F12) WKUP_CLKOUT0.MCU_GPIO0_23 */
-		>;
-	};
-
-};
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
deleted file mode 100644
index 0a3e9f614c4c..000000000000
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
+++ /dev/null
@@ -1,31 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only OR MIT
-/*
- * Microcrystal RV8263 RTC variant.
- *
- * Copyright (c) 2025 Kontron Europe GmbH
- */
-
-/dts-v1/;
-/plugin/;
-
-#include <dt-bindings/interrupt-controller/irq.h>
-
-&{/} {
-	aliases {
-		rtc0 = "/bus@f0000/i2c@20000000/rtc@51"; /* &rtc */
-		rtc1 = "/bus@f0000/bus@b00000/rtc@2b1f0000"; /* &wkup_rtc0 */
-	};
-};
-
-&main_i2c0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	rtc: rtc@51 {
-		compatible = "microcrystal,rv8263";
-		reg = <0x51>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&rtc_pins_default>;
-		interrupts-extended = <&main_gpio0 36 IRQ_TYPE_EDGE_FALLING>;
-	};
-};
-- 
2.47.3


