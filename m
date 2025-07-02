Return-Path: <linux-watchdog+bounces-3807-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E7AF1284
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA63172EE7
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6F22620D5;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGpiaEQL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941FE25E817;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=kPSA1PUNlpKrxlJGKglkVaMcKHUiH3LHgcETvRcZGbKlzVCpcpdgdP6qFYVQz1AjoPlHDgzLE+TSbOxvNn3PhKr/SHOUP7IAX3Nl0Tc3ApytIBW1NtdDfGX+b5clmNi8X2VRq523raoM9d9miRdkgfmLUDktmAdsq6JSUSrVsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=bYnxcYigwW1jh8IHlbwiN0cEWWvV/TsKQlKUrg5GZ/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQvN7Shd0oX6lXdZibMWKRgRHqtio0FzACEKw8blRAyjCp0WjbC4SUfTgy8Z85YoD++TmMWHqJ2f2KXp1GjszK+7Ybr7UbruFYA+JuY76pTIpYgk/jsTokrU/bsETUkxU+PknCT1XtDqMSoJdRdLlgk5q4GoFVBkxok3jgbpqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGpiaEQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 723C9C4AF0C;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=bYnxcYigwW1jh8IHlbwiN0cEWWvV/TsKQlKUrg5GZ/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RGpiaEQLrwv6OoOu3ZCxZDDL+BfBpcMTHcOeJ5r8PQLizWyO/vCTGyAOx+iJvwkgJ
	 FFQTpTJvaPM9UATdJ3x1BLCzXM7FkNcroH95QBXUhS/4e09OdKnkZ5ePZBvxCE1zDA
	 1wepElWGKRei8jtJHAxhYUTpCh4HHRCpcbCu6mvzmVY5nv9Ue/NHWcV9XnTKZmA7qv
	 4ig6SWsqn/ot2uJV6vwbSPVu/z6yWDpSU/fjikxCQSrgpFnXr7bxry4LNV0qSg4Rek
	 MW70q+o0TKb0qrkpzTm6lkDxrXMZ4VYQmFnNCPi5Zsg0I2FWZYu49ZRLnlwAn+S5j0
	 lp50rXbHkYCeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A29C83F04;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:48 +0300
Subject: [PATCH v4 11/11] ARM: dts: mediatek: add basic support for Lenovo
 A369i board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-11-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=2286;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=cSF9eZIt0ahAcZ8kbC8s+MIavsF7xQD8XUFp0/jFhXo=;
 b=/UEsSb1IOhetvvsPFiJD6SfiHCFEL5djSc+n11Xf9gq2rvx8j5dJmu1ik2vqtj1UdXXa8DQAn
 g9TCyjSOuNqD1AI+7FERwQAMV0ja031hm52qk8N5Q4BSid9bsMLWMPn
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
index 0000000000000000000000000000000000000000..c2f0c60ea777432f19d51ec7d0038bfa05d7170f
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
+	memory@80000000 {
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



