Return-Path: <linux-watchdog+bounces-3800-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662E0AF1270
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C11F3ACFEA
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9535E25E824;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOuRzwf2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FACF25BF13;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=b5lHprcmxdG3sXskOIaM9Hcgr4ZVADFFXLCsiu8M7+/kGUvQG7CSI1yihloWCf/mx7rgmpMq3IrLhbRBrBh7VfEXVbFBASHcJ263cZ8rZAmFbHY13X3/a+VjHwqsxuycbdBgIg5nTGR9oRg2Kc8EOLuh294wk8bU4rTkDQUFpOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=DxOrqNd9oLxm5FY8Ovl6KbdgdkoW49USz3S5Sld0MXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=er/yo/tsRwsG3ePCv6tkS0LyzqVnxuBNJRveqosa6bkGatHXG+LEggwmSWAwESgnhqFvZmJhcISUYOHXVNxgAHfAa2f9b3ZuxbSxh0PR43eSP+myNaclPj9WxxQpc5TIKhxAdj63X+VHZWoZWG5QuS+5yXVpAOBZ1FkbwpLit4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOuRzwf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C28CC4CEF9;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=DxOrqNd9oLxm5FY8Ovl6KbdgdkoW49USz3S5Sld0MXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aOuRzwf2PEmzFRj75TO6aBcFBZfkcH4PYTs3ZqHT3tYfqF+DELK7eW8xTfagn4Zgj
	 0FKiTCH/RQ1XlAf6mD/pyZHyEKjP6nthwxfsfD8o0Pc1t7b7icg1p3OVcOa6SRnzsr
	 TSi4JYjr40rpHFVkYPWdZOA4sYmzKeYM7XAoMlwWcJ1hRXwsO41C+Km02VklhWSRuu
	 vZCysKpBX4AyvC8QSFlNmAxzx1DmIv8CL9Jn/BD10KpfM11AtX4BwQEhp/+cF6KoRs
	 I036ZemkdgHIMTRn6+pBZjBR9I2hWbt9ZNGacVDnWZl2CVQPug56Wby7mnjMCuRBeH
	 Tx2hatlGLGksg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037E0C83013;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:41 +0300
Subject: [PATCH v4 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-4-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1060;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=Kx6Ejx/Cft8/1a8kT4GCe+0clOZmBvvSMcY6Pz+w9ns=;
 b=AZP21JjPvCISZGZjX1qyKkhhLBxQQwgOH+z0TIUIG9ahFKql6YFoig37lshBVbGsC4xAWQvbC
 JOLFrYQDjk1BWkpaA8qo4r8yeY72ZHU1HHzSECHF4VDgDm2oHBC8JkN
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for watchdog on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37f0e8a7526cbc99d5aa0d4edc9a55..ba0bfd73ab62a86befead007d4b7d2a870b81a0c 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-wdt
+              - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
               - mediatek,mt7622-wdt

-- 
2.50.0



