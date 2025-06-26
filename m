Return-Path: <linux-watchdog+bounces-3734-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C6AE992D
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 10:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1AD1893C6F
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 08:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E9B2C08BB;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNf0qHuz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECB2BF012;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928038; cv=none; b=dwUIb5kKQZovqQWv46hadGl/3SZ54m6iy2o/fVtYp6l7LAvA+yRZnmOzaeyKq/PjRxus084IdNPno2gdl8//Lt6YYwzIP7tHV9WFYAxyE04tg2DBix5fBcAH/C/4jFF4W5B6y72em/ni20P/OZCtSAOWUJ0fFGpZwHqqyLroMQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928038; c=relaxed/simple;
	bh=AUPv/TDoKd6ieMqlLaY3QqCSEU6AU3dk77+aCznD0MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3GjfvD3OH5VIWgO7Mi8ZVS58+3KsEJtBMnkaos0E8CZ3vpxmR0p5rpu8K1Fe7ymXEO8q+JbU4MyyiEncSOURxJo83VPvMVbiBDsFJkGNUQkeW+2jhhzfeTniJq0wQqHJOaxlhwrQWpZCgbJwAO/AP4eItdoHW64ujtcPvb2wU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNf0qHuz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8559CC4CEEF;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=AUPv/TDoKd6ieMqlLaY3QqCSEU6AU3dk77+aCznD0MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bNf0qHuzlOTME1/ZyXjCOKVbVbEwW4ZIxWyH8XRH0GWib2bAXYlKHU+YBlLhbJl/y
	 mCxaoHpN8Dc0D4V0LHXvD2WCQnZ3GTGsAsNQtOgOtpxw0fq/jXSvRdbe1KHGg7VNXL
	 6O7UXVAKO5zqNgxzq1uzXG2V5S2v6vdIfA6IzWVSk3qlqWZH/5xd/9deWSBriK8/QP
	 Kyp+F4Qqv2hHE/6i0YXZYX1V9HyTn8rQV/y30L+JsHkT6bWDkUJb+0K54qeQ+XRSYj
	 208RgUMlWa9NovWKRI/6hCWm871a5uPO4CfQKqg45b/aH+fwm2Vto+jbDfxLYKaIcS
	 5U7cle6hlq90g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4B2C7EE32;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:54:04 +0300
Subject: [PATCH v2 11/11] ARM: dts: mediatek: add basic support for Lenovo
 A369i board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-11-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=2277;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=4u8PvwUsCoKzaBq7UBptniJ7BDz8n6fIUr+Q5q3mwbA=;
 b=6BJCGc3Gmadj8FKTlSidHgR6LDm1JQJ/jIN9Jxg9QoZsRESehd/TP2FEDngEU+/DeEuAB1dAR
 Jo7d1iH5euHDHqA9HYXYhU+TtU9YnbApJ0MU+NUKwkWHPiiOyPDWo5A
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

This smartphone uses a MediaTek MT6572 system-on-chip with 512MB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index cb869a1aaec21a1d99f7f2a829b84672a3f52726..e48de3efeb3b9ab00108cc28afa8da525d0ec14a 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt2701-evb.dtb \
 	mt6572-jty-d101.dtb \
+	mt6572-lenovo-a369i.dtb \
 	mt6580-evbp1.dtb \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts b/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
new file mode 100644
index 0000000000000000000000000000000000000000..523e93647fdcf564404b720abe35ec7322cffa1e
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
+ */
+
+/dts-v1/;
+#include "mt6572.dtsi"
+
+/ {
+	model = "Lenovo A369i";
+	compatible = "lenovo,a369i", "mediatek,mt6572";
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
+		framebuffer: framebuffer@9fa00000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <480>;
+			height = <800>;
+			stride = <(480 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
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
+		framebuffer_reserved: framebuffer@9fa00000 {
+			reg = <0x9fa00000 0x600000>;
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



