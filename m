Return-Path: <linux-watchdog+bounces-1339-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B192B4EB
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 12:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE4B283B7A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848E7156C6F;
	Tue,  9 Jul 2024 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="A6ZRVjgq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mxout1.routing.net (mxout1.routing.net [134.0.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91F156863;
	Tue,  9 Jul 2024 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520030; cv=none; b=W0WWe0VHZwjh+w6uK69p2u6B0m3I9fzxp6IvT8wKGTY/8SX5bTrsq5CD35+HMYbtpLJQb6esr3znm4o1KcknhWK9iDnNCevxmC8SU1hTSdp2OABEjtZnQWHuAPO2Zl6UhktuWCnTI5Z7SNz+pk7tJbV9G/3UkOvOxwxKf7lqljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520030; c=relaxed/simple;
	bh=D+41rSntOtrWaCDgDpOU9msElMlPyKTfEYT0iDtDNZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXnjuDFvJ6YYfxDZiv1vceaAlB63iIUbBC8BPnQedBcWrmRYm8o/ZeYu3uSgeIEJnSYYVyIq8q9lxh3w/kzIxmQP+i+w7R1PK5f0aBpzJZvk4rmPvDH7DWlXxS8jD04kvtuctkgA746h2I5/uHl0om198Gh8sLPdLC6tCe12u2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=A6ZRVjgq; arc=none smtp.client-ip=134.0.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 3068941A4E;
	Tue,  9 Jul 2024 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yClmM7FbG+STkiGlvMKHgaKsALit4BWDuDxsq4NcyT4=;
	b=A6ZRVjgq+lUCXTIvq4zWCVXaAZ9zBGsOK+rd5onPZSJHomzYjSZX3BXDWCeIVWam/Cilhi
	0XsRS810PkUcOM3ytWAJ5D3dXECmZcFb181ayp0HpvV0jfx1x0PrV70klhin6gA3QW0BJV
	xWQXHRosK4XK0jiyR/sfQrImp24LoYM=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EABB9100756;
	Tue,  9 Jul 2024 10:13:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 4/4] arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and ethwarp
Date: Tue,  9 Jul 2024 12:13:26 +0200
Message-ID: <20240709101328.102969-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a9a804e3-baad-4dc7-95ce-a21e05282f94

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 9ced005b1595..abde2719c34d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -93,7 +93,7 @@ topckgen: clock-controller@1001b000 {
 		};
 
 		watchdog: watchdog@1001c000 {
-			compatible = "mediatek,mt7988-wdt";
+			compatible = "mediatek,mt7988-wdt", "syscon";
 			reg = <0 0x1001c000 0 0x1000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			#reset-cells = <1>;
@@ -192,7 +192,7 @@ ssusb1: usb@11200000 {
 		};
 
 		xfi_pll: clock-controller@11f40000 {
-			compatible = "mediatek,mt7988-xfi-pll";
+			compatible = "mediatek,mt7988-xfi-pll", "syscon";
 			reg = <0 0x11f40000 0 0x1000>;
 			resets = <&watchdog 16>;
 			#clock-cells = <1>;
@@ -206,7 +206,7 @@ ethsys: clock-controller@15000000 {
 		};
 
 		ethwarp: clock-controller@15031000 {
-			compatible = "mediatek,mt7988-ethwarp";
+			compatible = "mediatek,mt7988-ethwarp", "syscon";
 			reg = <0 0x15031000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0


