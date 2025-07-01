Return-Path: <linux-watchdog+bounces-3773-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BCAEEE38
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 032AA3BD419
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8793825A655;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6Cwxjt3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32558248F42;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=ArLY//5ZOPmHJJwRIRQTaqnPFQ+RJ/hGbUHTSAQaQA6Ece8tFTgJSPVrD5BuPoO2mQge7Gc5ZPGZiqQBxQiRUgQn/7KqJ/039KV+4HrG1aLdctEyvVCrkxOn3DVv0lOZU4QcrRkxLUAcpvbA4okNO1F7+VF7vhM/ppUtn5ERCeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=+qw9STpx921ZvRbNnhmcwiGWbXEwmuoqRUHJicA/m+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTZemxwhTYN98zhoF3+LkewphRXeA4v3v3RAcO5Qq/Jn94F1dv1Z70j7PaszcujhSRoJSF9Wu8Gl4BJJN0mksdOap81qUgwRw/uphoueK1X4r8LoA6394416rrii7+NwrGEOrhRAoU8cQgl0gmVAsyHr/p1n9zYRoi1OobuPSMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6Cwxjt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADDAC4CEF1;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=+qw9STpx921ZvRbNnhmcwiGWbXEwmuoqRUHJicA/m+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6Cwxjt316ZGig1tlGw7ch9m216TRj+9exZ9GVKgPHfddW6UpBwgZLffWnV6DSW0C
	 y7q9AdXkpNjPMMii+5mYDR1bH3SJ3sUHogrnOLGzRNxZddKRuY+pCJy60J1mu6DRhI
	 pE/NuSPIQkiUVjwGrHFYfQlSgjz46NOYwAxJi9pXO7OypiDixVuOtnzhkCtqI1jQ5V
	 uxXyc0gNig0+0sXwI3k64F1EYFOfQpxdoo7vKUivK3a63CKLHXecikpYakhvAg1axj
	 GLQItRIOUyJWmNseOqgO0i7qYR/cuF6D9F5Aa6UnC0Wi7FhYEs72Ub8yEVtGU2zGg0
	 yBpX3ZawhRR2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1233C8303B;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:57 +0300
Subject: [PATCH v3 03/11] dt-bindings: timer: mediatek: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-3-8937cfa33f95@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=993;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=o0ix7fgxDyGX/dNwoXME14P/IebZ5vKxE9iUMbF1tQw=;
 b=bMmAZgKeoncqK29G1cdfBQz+qO+g6RH0tldg21aARRClvtL9nleKHUfrB5cL3Q/BqgD7NqkNf
 W4HhlKJOZsBDd6Sbx3fQbfEqixpfbnaUIw3APZAoQ63fuJDz7OQxwW6
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for timer on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index f68fc7050c5687930e2ca6b6fa8f0b7a208803da..d5b574bfd2caad1bc54ef6bd1768d94055383727 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-timer
+              - mediatek,mt6572-timer
               - mediatek,mt6580-timer
               - mediatek,mt6582-timer
               - mediatek,mt6589-timer

-- 
2.50.0



