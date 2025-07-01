Return-Path: <linux-watchdog+bounces-3776-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A159AEEE44
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC7D441D9C
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C24125B31D;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIH/O6Hv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154C2580E7;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=HT+XDJjwgSc0U2VWTcUJ9k0WyAPe8ayPONIbWXRsa3m/XRMc0UlTXBfYRHYgfS32cTgWs5meggqTiq+V+Hw0cbQPlQS1yAfF+vd3wXErcofdrcmPbU9PdRaC+TkJtkHv9yPaXUyakeS8xPl4ss33lLCYJPuNuRqHWlHAYv0YQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=xF9OJWGVVMiNOy5F5fuhXYNqCNOpvXwuxrNpQnAjFoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiZch+7QEwfvyKmUkSL7TZoOq/wyV6ITZwhc4KWQT7GM6NFn9Aihri/e99TwundncYk8DAnLutpb+6C+fx2O5uoPFNdZxaSwq3EbKV8bWW5ygLIC3ZD0gzTmmG5f4xGEHAY3pJ0WjC5xLLuc2HSOTtMZlfCyToIsX/PmJx0J3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIH/O6Hv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 026EBC19422;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350019;
	bh=xF9OJWGVVMiNOy5F5fuhXYNqCNOpvXwuxrNpQnAjFoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TIH/O6Hv3bRtf9iDuDtLMrXuPgvcgW0PgvJAz3hOHC7iOWqaYwnMsWFEH8qQn9/OK
	 vCKxorkkdHNNjDYoOGoo8GrTOkPu4lte9YL+fVTbgXOZuh0kok2BCXTLVf/RRJ5Xx7
	 Pdsc/vZ3ncDcfMLNzc3DIY3qwl0Uot/C0/k6eR/DqgFuoqj2okbS2gCo0O8CawTk6C
	 KYcbgzV6BxvbJb3ch1lNjaBLG5094XKbRmYMx8xf1U2RCNr3/zqbu0JsCzRDFRtaxn
	 JulEZ2LMtaH0A9lpJt/Q1DF8zL1+oxSUIVpO4HGjYGkmfQeGQNMvo1eRpew8heMPsQ
	 Bas7kS3VBnOgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0233C83038;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:03 +0300
Subject: [PATCH v3 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-9-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=3300;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=Xzi5mW5J7bGwfKfJ6p/3cXr1VKlZLnEwbR0SOET4e6Y=;
 b=0G8DqWEYuBOAPFdLOj5IjWqVIBjAFf5/xN5AVTTv3FczGTbIm+7XxyC0yMxXD9FHOSExDxrFt
 t/22ZkyhrT1DNjxLmtX4ge5oDfFi9ztC81IZe/dMZK4AGa+Yv6SzRiK
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add basic support for the MediaTek MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/mt6572.dtsi | 108 +++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ac70f266d698d3dafb51b22021bd6615124a7416
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
@@ -0,0 +1,108 @@
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
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
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
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges;
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";
+			reg = <0x10007000 0x100>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
+			timeout-sec = <15>;
+			#reset-cells = <1>;
+		};
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt6572-timer", "mediatek,mt6577-timer";
+			reg = <0x10008000 0x80>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		sysirq: interrupt-controller@10200100 {
+			compatible = "mediatek,mt6572-sysirq", "mediatek,mt6577-sysirq";
+			reg = <0x10200100 0x1c>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
+
+		gic: interrupt-controller@10211000 {
+			compatible = "arm,cortex-a7-gic";
+			reg = <0x10211000 0x1000>,
+			      <0x10212000 0x2000>,
+			      <0x10214000 0x2000>,
+			      <0x10216000 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+		};
+
+		uart0: serial@11005000 {
+			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
+			reg = <0x11005000 0x400>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+
+		uart1: serial@11006000 {
+			compatible = "mediatek,mt6572-uart", "mediatek,mt6577-uart";
+			reg = <0x11006000 0x400>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&uart_clk>;
+			clock-names = "baud";
+			status = "disabled";
+		};
+	};
+};

-- 
2.50.0



