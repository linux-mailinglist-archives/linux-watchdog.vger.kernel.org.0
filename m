Return-Path: <linux-watchdog+bounces-3691-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09EAE1F39
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825561BC25DA
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DA52E6124;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oibj5AUU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC952E3B18;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=Vvrk2zwpzYteMH/4v5BEdlHhWLU1HGAFktMAdPq+svR3l5Kaaf/YcUIUsEYsB0CcTfsp4Go6xenxuPWVOLZTjtk6zf76tDzfYSjrb8MwZo3xtijoNlbokEPqP8Fa1S1uPJ0YhUyfOTY3l9b/vpRHy2t61oRbFZzAZzXE6EcexLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=JRA+0OlnUj5dL3Gg9wNBfV4MEgqiibfc5y/swMwEpNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFLm7DdHzRpw9GpG6noQlBgXbdjWn11gj/mf9qsugdfk5jPc6ABkIjL2augcA/Ken+IFrMxLnnhZysI/kk6uFQDHMDqf/n3JmPXkpzODFG60ynun3ZeZlyi/KwUYtSzRqXm/kC3bN5fDR6y/Z5ka9fTMzZYt/+rmeMHmniIYYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oibj5AUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F260C116D0;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434234;
	bh=JRA+0OlnUj5dL3Gg9wNBfV4MEgqiibfc5y/swMwEpNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oibj5AUUVtxRNoR5qlIYqblBoNYAZQM/T4vR+znZMfpWFHBqUuxywUX0mjUIQ5O2s
	 9vVBOEj+4OmlGbZBrZ9mZWMvGSOaz7Ml5ecSRa/rVz9Vm0ukkdU/OyVLt4P/tmSpX8
	 N1uxb4mxBkT69zp+U/fSxqjEjWv0chdDuly6K49OMMnonuLLl31saXYpRRd1s+Tz1e
	 uutNg6T4Rmc2qNpBteLkER1bLIM//vBnJ62RzOLguVrJj1UinmESL37vlth4iryGC1
	 mPrHfZ/1U2cAhsJVWeq959mcutlMIeHgPiwpVxc0u/+sPdnbxchurEiVvk1EhhqIF0
	 9Dnaz9EhtzdhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C3DC7EE2A;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:49 +0300
Subject: [PATCH 10/11] ARM: dts: mediatek: add basic support for JTY D101
 board
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-10-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=2358;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=okQp4pzksQbwAVarYxmDvovk3WSeUiFA8NPTsCwIRQ0=;
 b=fy95bpb/Xfh299fxSxNw8c1epXw9BD3oGxi84uIgIUG+mRzRw4pvGhKR1ZNV7Fz/xBLHtN265
 qO6IJAcAL/+AYjI8b3yFJW3xVHFJVFrQz+znwamwN1vv0l6wwSrCsUQ
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
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts | 62 ++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

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
index 0000000000000000000000000000000000000000..5c3b9833073e43fb42e28719c1f206e8884b5f6a
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts
@@ -0,0 +1,62 @@
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
+			status = "okay";
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



