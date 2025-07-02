Return-Path: <linux-watchdog+bounces-3806-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0CAF1285
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B1BA174E1F
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE962620E5;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx6/qc80"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302725DD12;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=FASymjdF0PgOfE2PwE4jaWl8MPUt2l5+UvaYxIy7lCRzV2FRB7zR6ug3exYHYMsI8z/8o6Js6D0igWoFHLKBhPr7zEe+nMZCOUX0ZYT6ItGTku49JUNZvvb/r33snZ8y3sQ9M9vu8nEsa2Oh0bnhmQmlWlGCEeyfrTS29BWvGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=xF9OJWGVVMiNOy5F5fuhXYNqCNOpvXwuxrNpQnAjFoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hn8letig+bgx+KJRY69Y3lBoTidwAzKgA9nHBvDKZc0MSvFant3Nl33BOJd6QtJxzfDIFPMYCsdS55z8ly6q/KY/oeTCli/kdMCAwxz9xN26OTm7owsgD5+sQgm/rKSGRPHYNa5GmO8lXUvNNldMDOgAOJcdRWJHK+BDGY6So1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx6/qc80; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 550D3C4CEFA;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=xF9OJWGVVMiNOy5F5fuhXYNqCNOpvXwuxrNpQnAjFoA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Bx6/qc80vQyJvURLfMqv7WjZDLgcNX57rZNlk1SSZN3G9h8JiNASmUF5l66eag/om
	 zqBf5d8lSqtB31B9AdrhbRyQLMECUlVG1hpX/zaUnK4pnNkxyH3s5PZMhNZ5ld6GKL
	 d8B/Tx5EX+qZ+k9xK8I166zmjRnSE7NNYheCxbrQpTSaUxwfTiptfY+TXHFcwbuL7A
	 wEZ15HUzBcHK/zjwYpJ7ggXT/wn/sJojeWna7c2YMcfm6NdvrHVKRYlfiwILy+O9No
	 VX1/WU5gulbunx9z9Q604anOypq4a3p3oa0wbbrfBozQ4QLyqOgnB9OZoDrIBwcX8R
	 nObq5a72C+w8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B691C8303C;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:46 +0300
Subject: [PATCH v4 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-9-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=3300;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=Xzi5mW5J7bGwfKfJ6p/3cXr1VKlZLnEwbR0SOET4e6Y=;
 b=Zt6UCSCrLh9n69t36LkTOtpq6BpalA3Cuoapidyqrtc2/Y8pa69I6zftvEqQTirnEl0bRtcxz
 tnBk24DQC7iDEkaLfa/4Q4plVzfQx8e/6HjXOziX56vd8xF6JgJB72H
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



