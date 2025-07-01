Return-Path: <linux-watchdog+bounces-3772-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A8AEEE3B
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D30B3E0577
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F63525A351;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH8VpUaC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BB248866;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=C2IKziftJkgDNXauxDjjluZPLCkIc+jM5HhFgkAw3XRc2+AS+jqlMCTDdomX0JwEaQR3qBbum3QEhGtDFvTcdzatGb28PoJCxjq8PTzl868cKWowWStsyQVKS5PN2Rq4KOeaaufjc6SCFzE5b3po+6tO0Io1Cp2c88pR4jYDdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=pUnXGCRHe1PAu0P7R3hbtfyW7147Oqq1sb7DvZqbUgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUAqS12+3d2goswGCKQiZWdFgFulnBRa2Zi6iGlrXm1iV6wcm8dsyZ1IK2Tsb8MIhQjzBt+BWlBkq7JhwsPk20Nq/uma9QqexbXJjzQOKavZVS7hQdGYrA2Sbu3uWVpXf0DY0M/pdGS5xs33JMl0q7acPSueXfBwKzJvMrqssJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH8VpUaC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4B91C4AF0D;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=pUnXGCRHe1PAu0P7R3hbtfyW7147Oqq1sb7DvZqbUgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hH8VpUaCkMKyW9pDPAszC89p+2uaxKWyhuAEAa0qzlKzCTRqbDsq8opeNR1ahR6d3
	 PhYoVBhKAk+ZbPjF5iSkf8VYD/Ehv3+2fY2Ks0lwvpxfWJjHZARywDQwPBbRHJTRsh
	 jQ9GkTNHtXVfmRquCqM2qW7VBL2a/Cn1wxuqFw/szTJ+NmauSA9vrsnUrHFDZmel0A
	 EvuYKB54SYKwmhjEI4+a1es/jUCO2InLHi5O5iBiPn9nknbsEb+7T7z1NirWBeGSYh
	 SDU7XLyLGyLVR/i8ySQ1g8tuW2dzFOpzmiJzpU3vQ81gPOgLpN8KERHAWo40gvQPV5
	 IydaisVN33WgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB28DC8303C;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:59 +0300
Subject: [PATCH v3 05/11] dt-bindings: vendor-prefixes: add JTY
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-5-8937cfa33f95@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=984;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=szH3lFOduJEY4mq69Ikm7Luzlgze9u32D6UzfN8hmck=;
 b=KlWi/u1OEZ6NUMG56rOUWo/GTXVtXy1dVK8IsC4DSD0BMzEyuyOLcrKnrUIyx5PW93Pmo1SUj
 2Kj5iPOQw0mAaG4r7TbQEalf8Utut1jaMwQ6Sq6J20bFFDCw9grUIyT
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

JTY produced low-cost Android tablets based on various
MediaTek MT65xx SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae217643bf7a63a471f74819d18238..517bd129288c96483ffe358127ce8e16f60d902b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -782,6 +782,8 @@ patternProperties:
     description: Jide Tech
   "^joz,.*":
     description: JOZ BV
+  "^jty,.*":
+    description: JTY
   "^kam,.*":
     description: Kamstrup A/S
   "^karo,.*":

-- 
2.50.0



