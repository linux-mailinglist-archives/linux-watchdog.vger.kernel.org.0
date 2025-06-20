Return-Path: <linux-watchdog+bounces-3692-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41CAE1F3C
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D688A1BC3CFC
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62B52E613A;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0cdnnRC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6B2E4241;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=or+h7u1WysKgmdf8IoB80y2Oj/0Se+7ZIG335Sl+PgQKWvZa8jzwgxpfeW8BFVg2mLBUN+m79yZPsM7sbnQwfAo/EhSmSfarMw28GgLcCTD+jDAkJvE9ud1bzOj+QvI0dPM7n1bG6LtAtNI3NyvMLVNdWw8P0p9VGvwZNb37da4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=n3mrHhbKnKUpC1kN1NJ7p70/oxST9+GlzZGgUiw5Xms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kO7Btjb5ySETZTtq5T3Qrw7aTSoq7SjyZHK+pMxGBNFDzHbI/Ih7QUMQ80h02T5nJT98diaTgwYqJ5ZKrGYIrLwDndiIttd7u5L3fA9w2NUeUPDF3iI4AlD+3MA4wKprs8aetgzs4KrNMAch2h3iDveV/Bmu9DFJRwO4Y7olzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0cdnnRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DF8FC4CEF0;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434234;
	bh=n3mrHhbKnKUpC1kN1NJ7p70/oxST9+GlzZGgUiw5Xms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c0cdnnRCMiUXGUWRZKXjuQmmed1u1TmtaK0z2m8n7D0R3KpYtieyKYq4ZU2adkxIK
	 v0XfH4uedfuYeKiHMFP/WclYAZhKY/C1gN9p58PpigwzJHHd4OF/t9QvlFAS7J6oAa
	 3Rny6oFVXm99QF49ZNpZXtJ45gqFsbi0fCk2G+AZw54v0yOYQKbYAgZeWodi+nx597
	 XHHwEhh31CO5H1aYuPX1V+6TOp63xuChlkMFwWYdzPAeV44NdUJ8RS00DqnEthGzBY
	 THsRre7+TYNJtEQumx0l1yeNmf43bLJKBWuVoH1BBgoaowhdSPy8WERy/YK3d1buPp
	 dIUXQ9PUJs8Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1343DC7115B;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:50 +0300
Subject: [PATCH 11/11] ARM: dts: mediatek: add basic support for Lenovo
 A369i board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-11-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=2299;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=lTjo3ihR3gUlpL1GW0vPSnD1O+oT6SyQn7cpI3Gt7SU=;
 b=AJjRsHDZP2J6V9EgEJwBSC0mqa9ApUP+Ke6oP/dYMgZ8GuD8lxcVsUuCuG0TjHk29w5JOc3sR
 L2O+R7DD6/3CnY8tLfMAxbq+ollMI5/867XTIes34t+guE0rQF2NjyT
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
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

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
index 0000000000000000000000000000000000000000..da8865a6b7e4f0e346f42504b3f8a4db61cb240e
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts
@@ -0,0 +1,57 @@
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
+			status = "okay";
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



