Return-Path: <linux-watchdog+bounces-3688-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B99AE1F0F
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4E517B8E6
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB3C2E54AA;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gjvhrv7H"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C42E06C7;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=CMU2pOLiW2h20dGXY+QBsOPyR6IaS4uFZ324mKNoSbYdIEaY+in+SePk2+Hd3FXeVXDNMS/T1EEJEQ0Lk1JI2hQSpZ3XOW5MXN/BTYz75SNCYRw4t8EBmYTPfqsukfZqFUXPxWARZVcUDVOJeIOlTsB0hOGXabg54NOPzXGmeVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=3FBI0Jwg53Z+q657ZRTd9Kza++11o1eGhB+nORUB1cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXNTGIQ31W38w2XsHWfcxxSyA/jd4PsJLpbdZLT8DKyiy8+ja8xWlt4ODEMjtB4KKXxB3jOQ0uaqcKym0M3ky9MjiuaEJm0tjVU7JynBZrzFrGppkSoU1PIDzKrVhpFo9tresLG2eW5qu5qhRguLjIX4ZjUZs3JBgsKg7K5fmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gjvhrv7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07377C113CF;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434234;
	bh=3FBI0Jwg53Z+q657ZRTd9Kza++11o1eGhB+nORUB1cI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gjvhrv7HjrQ4v4aqIMxviFUFTCTY4GDzOfNBDprYAYl+TBrexIxB7HDQQNbENt5sv
	 BgAy8+GpK/WAAUieQSqS3GX+TT6yZwgvTpHPJjwbECJt44vNOlhtzEi38Gzl/77NK1
	 R36TtrHiKtt6npiOi76218owif+h7gidYVyIZUCsUwrPXMn/ESFe7SYGimrgN6a30c
	 yOEVOsQHHOPBDgsEGPMI1WgRZuBf1alZbaPl6IJbAiHLbB4q+N2FGIKnNNVASAKUKv
	 0V6pN4ffnKTSEIba/BI6JdtbBRvTKB5EuCRePtLQbIAXhbqAR+30lS9jjx9vCxbiLU
	 GdM5U9xoTwMUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE75EC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:48 +0300
Subject: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-9-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=3093;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=yLz+8+oRVysKR8AFBuER+Y8kTu+TRBNb+mijfqNvpZQ=;
 b=bCdHvRnt9g7pM6K/Ch8qxCTRPC38eiYofcpVy4YvxOPA4ID6G44+elWtfszhzVGa1ZXYT7DJs
 kT9NpWpkFrmDlt9SWyPb/lyzmJm32pt4TRwrG0EeUR4ebCiFm0wdJGp
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add basic support for the MediaTek MT6572 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 +++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..dd12231ca745be7455e99391abd2d708f2f1a8a9
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "mediatek,mt6572";
+	interrupt-parent = <&sysirq>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "mediatek,mt6589-smp";
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+	};
+
+	system_clk: dummy13m {
+		compatible = "fixed-clock";
+		clock-frequency = <13000000>;
+		#clock-cells = <0>;
+	};
+
+	rtc_clk: dummy32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32000>;
+		#clock-cells = <0>;
+	};
+
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	watchdog: watchdog@10007000 {
+		compatible = "mediatek,mt6572-wdt",
+			     "mediatek,mt6589-wdt";
+		reg = <0x10007000 0x100>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
+		timeout-sec = <15>;
+		#reset-cells = <1>;
+	};
+
+	timer: timer@10008000 {
+		compatible = "mediatek,mt6572-timer",
+			     "mediatek,mt6577-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc_clk>;
+		clock-names = "system-clk", "rtc-clk";
+	};
+
+	sysirq: interrupt-controller@10200100 {
+		compatible = "mediatek,mt6572-sysirq",
+			     "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10200100 0x1c>;
+	};
+
+	gic: interrupt-controller@10211000 {
+		compatible = "arm,cortex-a7-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10211000 0x1000>,
+		      <0x10212000 0x2000>,
+		      <0x10214000 0x2000>,
+		      <0x10216000 0x2000>;
+	};
+
+	uart0: serial@11005000 {
+		compatible = "mediatek,mt6572-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11005000 0x400>;
+		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart1: serial@11006000 {
+		compatible = "mediatek,mt6572-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11006000 0x400>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+};

-- 
2.50.0



