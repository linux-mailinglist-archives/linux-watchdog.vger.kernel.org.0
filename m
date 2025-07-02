Return-Path: <linux-watchdog+bounces-3803-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032BAF127C
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0CF174B4D
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CB626056A;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3I9HIK1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DBB25D219;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=stjly049RS2mAwv4nzskgqZz8AVFMOPoariZiWnxzA/SL84OaTbStAWJxTZRgOyqxCbXrqn67aqQ7x7eD2B4ZdW0zs8lYw9s4pY0fy5plswCYIzJjeT/pZC2fnNiifzRGNVNJBCohs84Qmt6kgHBP9/jsPn7c+X2b9ICKanZyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=NAnmolElyDCpJkSNtTehvivo19P65NrO8aIKT9sGSbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJ6G1N6mmMKbyps4xcoA7MpOBkUUDcImLCcVFfHQKTqGG/RmBPQnIL3aSMne7Ljt72La+P6w8OS2Lr64frkUQ47fzp+kQCDh2IojcdCldIu28s9nFa+S/bgdmsboMZ1/IW7I23w2GtQj0e7is4sib5gPpAopApuNi4n9MGZ17ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3I9HIK1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63001C4CEF8;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=NAnmolElyDCpJkSNtTehvivo19P65NrO8aIKT9sGSbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O3I9HIK1jmjBoYRLfHHTRaqG5yS8eGRSLk7Y+5LKYaA8sfMC/9O2q9BDs/9YyDdj/
	 EH+IaadbDLKpg3pCzz0R7wzNoI25U1dmIl8eOXsjzxrhSzQch5CRWquBM8mokXeZ3+
	 NDGFu7tF8rvJUnZtd37ZwYv+iaPB4Cvc4ABxQ6BdzYcDHfAyYqSaNCAGiGAhCTW/Oc
	 l6+EP7oID18WG/pyHPo8CtSyEKCL1CLJri4eZiryCPnZglEl9hRN5En9GYRaWzxwwU
	 woSV8rJtzlSZ6xh8wufe9jJxJV/SWTCD5MaQI8v8bvWhCagvplpU/v0hvPi18eJQ0T
	 JEkIRn2wOkY5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A203C8303F;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:47 +0300
Subject: [PATCH v4 10/11] ARM: dts: mediatek: add basic support for JTY
 D101 board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-10-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=2345;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=gnyj32TYdF8vP0Nle5TYvV7BzmqcgfdDRSNtPMJZy9s=;
 b=Ka1sdWGr6sf3jkaMsTTDsd6Mqoi/7e9IqAMiyPNc89+042YD0Oqhdr+J1cXzDxZV0czSsWevO
 2qoB1IZ+IqBD0XwAx3A97M++Q2lp9W6wW1/or5o01o5/JmuHtig2K+e
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

This tablet uses a MediaTek MT6572 system-on-chip with 1GB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/Makefile            |  1 +
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts | 61 ++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index 1957947cb41ce86ed101466bf822d4e2dfdfbb61..cb869a1aaec21a1d99f7f2a829b84672a3f52726 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
+	mt6572-jty-d101.dtb \
 	mt6580-evbp1.dtb \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts b/arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts
new file mode 100644
index 0000000000000000000000000000000000000000..18c3cab6b7a3cad8c69b890ec7a715373f50d8c4
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
+ */
+
+/dts-v1/;
+#include "mt6572.dtsi"
+
+/ {
+	model = "JTY D101";
+	compatible = "jty,d101", "mediatek,mt6572";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		stdout-path = "serial0:921600n8";
+
+		framebuffer: framebuffer@bf400000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <1024>;
+			height = <600>;
+			stride = <(1024 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		connsys@80000000 {
+			reg = <0x80000000 0x100000>;
+			no-map;
+		};
+
+		modem@be000000 {
+			reg = <0xbe000000 0x1400000>;
+			no-map;
+		};
+
+		framebuffer_reserved: framebuffer@bf400000 {
+			reg = <0xbf400000 0xc00000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.50.0



