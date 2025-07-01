Return-Path: <linux-watchdog+bounces-3779-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F97AEEE49
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77221BC41F7
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB60E25D216;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwI7rKGa"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898FE25B1D2;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=hj45VyRZNEAKqxTBlBgMFFPTuBkoGlzcKD9wvc9QTOotu49Uykhp5SjTkVLtYPjhg4xpnYUyEbdmAuPMxVFsoy/MszDkXZXqfmu/8bkHjQc6WJZYxQqEfdu0yR+LGeEpUmuPhlZAc8NIOdVtIO/ssIPjG1bBW9GGTTTaFqFenw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=MpQ2gtnaw7N9SW/uFQ+s6QcBME/V8/ZonAnCkD0MPhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbAvRbeG7Dl7Vl6yumoNDyidj/1AWSrmDAJZc/ZpsDbaZO0XWMO6XWf1J1jWi3MBCIU7Z6kue8TC1Phnprj+dWflID6xhI/6WPWHnEIwBcjlI+5UrYm01Nj0cZMOdKule/GXE3OYPtWEsshGjiPOK8Tn416/6jxVE3tnf7HPjHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwI7rKGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13CEFC19424;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350019;
	bh=MpQ2gtnaw7N9SW/uFQ+s6QcBME/V8/ZonAnCkD0MPhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uwI7rKGa5rpwZ/nuxg1gcQoK7jsHPe62bNoMtW8oGFVmVH5KP+slyesEMuitvtRik
	 OY3rDA+3uc30QeCr8DB3xpgy/Kjs+hZG5yJ1B3+++YLzDELoiaadB85BXYWgSxew1t
	 oGvvz5aPtWDdnVEQWoW937xn/Z9K+4nfwKXP6V5k6AHJX++WSMDvqV9/fKUL8cTXtN
	 lc3bnTESs+M6gLjhdpzBMie1I0GSAHLslq8QNxgAOiB6hpD/nHtBJRu49qd9LiYfJf
	 i8riGO+fTNjR6rX21Nz1v8t3s6c615O68+5gRafD1UfxdSeWbdKDKwlmF+nzWrTU4R
	 qX38oN3nBAaBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0890CC7EE30;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:04 +0300
Subject: [PATCH v3 10/11] ARM: dts: mediatek: add basic support for JTY
 D101 board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-10-8937cfa33f95@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=2336;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=NU9J2QXI2zRB0vLkzxM/enp+SQ7Qa7xpupUaXf5gGMs=;
 b=DeRfXDHWdmrD+XFAuIlfxZdTytZOL+RVl23BgxYNuHaQI6SGGWFnsONt8TOAROQNBN4cx+WnC
 S91BJcpk6pNDFU3Sw3CLDHDmqd4vu28l3S9GUI5I9Ar1M/teklRNHwQ
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
index 0000000000000000000000000000000000000000..68c432cb38700939102b1186c8f5bca4c5140831
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
+	memory {
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



