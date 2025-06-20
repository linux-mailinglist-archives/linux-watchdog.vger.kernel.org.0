Return-Path: <linux-watchdog+bounces-3682-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A9AE1F44
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F404B3B4B5A
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D46C2D8DBD;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZWfJ0zI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044252BFC9B;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=bF6/I+BgupyYD8vk7kD9iJyzCAmKc+2TBm1jv0mZUAiuUIWb4lSmxzHx0f6PpDJY/fqaPW1WSI/50EvwCWiZo2im4001p7C0Kc80UY9glGlkQk4FAhDHcqO2R+b3UNYZ0svuC6uoi95eoo011CSGfuJuuERjARFXYgmnPzEFjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=sB9kezbWpaBzm1JwrpLpRJGauW2ueeGuwl6H3UvueCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fybNBDr5SzbIaRH1iY1wSjySWN7nblbX63fQWJoPMX2EjobZ8dQv5yO06sOFa5OdXL4/dkTWWOu44ESGhYMX8fMR4an9Pz2tlQBb2PRmNByXctmKobSGg6d09HQSwool7fNv9WwIatFGbjKDPPx6CnKhD1iCl53E5MAMiPocGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZWfJ0zI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3C2CC4CEF1;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=sB9kezbWpaBzm1JwrpLpRJGauW2ueeGuwl6H3UvueCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TZWfJ0zI1hmhT99Bw+qS/GgwqP652tp37gv1WAMx/tJeXOz7PVrzpG1LOKmy3XmJy
	 uZQqZJpJ/qLWT4/I5E6/hla8bRgi176dwuqSHMRMoJfpP+mp+0WMz0M4aDppgRIqRa
	 ADYP2aclWKT6qtACbDO3XkUyScd+pukKIFLS9zoHNR9AdPrwr4KXFCyKglZftyzIDF
	 v4WcBGtgBdiSdr897+6jTR3AnrXO66BS4RD0xc/71k3gX0qiYqGRd07Aa9HfBxLXRy
	 +e0ItdCf5nKzwnqIyS1T8AHkoU3rdOP1Cp397zd97HK9sfq2U7EJUWXyfv4QLbvu2h
	 z2lWi8nLoJLKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952A6C71155;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:41 +0300
Subject: [PATCH 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-2-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=998;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=LTaDM1ASAk29cOczyQS5+5QLERyCDpWfkV8wKfcyu+4=;
 b=cfoECoWfVD/bdfIanl6XpU0sBEjXg1AF0oUPK3MKQiSDX3DgRrpKlvqfE29APWVsm2s6jlr+4
 5dAktWoh+njALkh+MTgio3XmaoT/2Q0ZePqEAWu9UFiJJLcbfbMNT8j
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for sysirq on the MT6572 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 123d24b05556c67374fbb87abe5e16c65031d2ed..30d76692ca87b507900076cd2f7d2e7ed2605b33 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt2701-sysirq
               - mediatek,mt2712-sysirq
+              - mediatek,mt6572-sysirq
               - mediatek,mt6580-sysirq
               - mediatek,mt6582-sysirq
               - mediatek,mt6589-sysirq

-- 
2.50.0



