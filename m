Return-Path: <linux-watchdog+bounces-3797-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97228AF126C
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2803AA029
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7436325CC78;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG7QNvW/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818C25A2A2;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=lvCBOyshKFdvOTAe2avoyL3NQK8EsZY7hYLmPAF58lt+xZVOhBi+dA2LmKy9tQqAcrshDe0w8/ausUff9LmiRCm2PwXD+MtOpYGzMQ2E/Q/6ks4pbo9Bf1W2z/zugWMTR8v7av+UMAAat9E/nouXZnR3fqOyS7addjmd/2SVRoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=+2XzKppmwhQYzDFY8gVFCwStqrtJMEoTwOQNBbMYX/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8ApSEH4E3CG1opJ8D7wRZBsTAHvcwNNB2w+W4GfxcuRg4y6HY7wTn4yM32U1NnS/+0z+57Eeyu40x6/is24waQkd8sLkvA+iLWAnoArn27MEUU5hTKyAyfdakV+hQUiPgca0bkgs28kShluL2EIHqQhytujfTZjHOYcyace8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG7QNvW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7EA9C4CEF0;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=+2XzKppmwhQYzDFY8gVFCwStqrtJMEoTwOQNBbMYX/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fG7QNvW/hpPcBygZdsXHywQgu2PN4mjiSzQJsc/eBww186il93wr7o4rJoOf5nbQI
	 tNWrNMSbkTiFScstek/0H/IcN45b4FF79+5MDAs1ezUfs5LdGVTVuj95cLtWb11K/L
	 ZFBCRP9kwml9+ryaQpzF8/OHQZzapN9gXSBbj89tCM7YDxT6fLmBrNpYOpFICAAu1/
	 vhW5fvjdW+ETDXIUIws6AXf8niHqIC4XkLqLH8eAuqjc6F4bPvtLHlRbm+gukilFgl
	 H4QF1Iif5b4WRwhCRLit5nCQYML639Bikeuz0GEpk2F0J/4XiHVzi2YC8AXkjACrV/
	 HOgAFvZXh3z8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86A0C83F04;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:39 +0300
Subject: [PATCH v4 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-2-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1128;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=ctmiRMyUECT6RxIRfZlrUhBmOSzsSLv8C2rWtsE6Z0w=;
 b=U2rD1Db76tUh0loLEQuBHItVbuPV3gX9NmgbpztFUtZbhmIJHx2Xo80+cYkvgOU9Lp3qT+uNS
 dcf8/MbMbEZDUkNmElIDDTcV1+ejOdqjS9ixQ8XP5dD06oG5nEogOfb
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for sysirq on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



