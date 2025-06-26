Return-Path: <linux-watchdog+bounces-3732-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEFAE991C
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 10:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C448817A974
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 08:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41F12BF3D3;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akJGCetT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB929CB32;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928038; cv=none; b=COvDOcfQ6UtIqjaSkWG+3aznNN67DMsigSamJfAHJ8vkXiI0V/P3mKf8VblVWm1XkTH7FRcqITNiwpfQvmLrHwfDCOioiZGqc0b/rxps81I5jr7GJHsPHDmlGGgq4R+7YX+ZZSm/9PABk/Fidqc4UDf0IQzicJAhxuQWLoAcGmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928038; c=relaxed/simple;
	bh=1uKs+XDDqrpUqn/1Z/qWj+WCvNbk1VITw3tdl0xPaOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL2PVJX8Qu3Vylsr5dH2tNRdXOMuxD/xAqxmtj7S8+1P7GtIms3vs2X4Y2vcd4BaTCMU/Z80LOSkdAIfGQog3Y06/Agzb55AqX2T41PKal0XjheYwXc/gOrQ9/DOapm5wPlPqe2wj9hXb/b/0xwqNHijcweALJI+d944XPF41eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akJGCetT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36AEDC4CEFB;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=1uKs+XDDqrpUqn/1Z/qWj+WCvNbk1VITw3tdl0xPaOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=akJGCetTIYGTBrocZjBvs4n2bAkD6nWVsAtQWLv5hevXgB7ol8dBUPKuFzomrXwgT
	 67+4v23hDPGn1VwMKvZXQt4vPhi1DYTZH0ETFGhzh11yfPP/mv2yFrEgnR7sLB3IEh
	 OUyNd66o8VFTeXVvuLrNGt5YkVPNaXt3cTrQOzNLjHer8LSuosbSklUjh1qvSfUPaN
	 kWXboZilVq0loosnwkcKZBfLmCOMCkob+4T4ib0SuloVQFKmpfvuLa9G775qIRLM5V
	 ts8tcRYm563eA2c9jsqQpU6ils2J21ex7n3bCtR3A651kZ7e4BVaE8DnOHokdIx+Fo
	 XD8+vmAfTpk5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F498C77B7F;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:59 +0300
Subject: [PATCH v2 06/11] dt-bindings: arm: mediatek: add boards based on
 the MT6572 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-6-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=995;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=9aUXHuNvHaXvQkrisfy954nmLPBRtgbu4/kIQzXjqPk=;
 b=zitJojHs4XEqtVPoIFwkaqtXDGM6igKRes//Su7pRROBXjAlIhPy5GXXTGx7+tOTYYBzFat6C
 luBZ8jHjoCfDs3TaOOTppEuSnJswvMrX/cqUN/aUi4MOqZGuy19FEfu
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d93976556a03768595961961bcc33..d5cb133b8a75fb5325f201f10c83bbe434a1da89 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -27,6 +27,11 @@ properties:
           - enum:
               - mediatek,mt2712-evb
           - const: mediatek,mt2712
+      - items:
+          - enum:
+              - jty,d101
+              - lenovo,a369i
+          - const: mediatek,mt6572
       - items:
           - enum:
               - mediatek,mt6580-evbp1

-- 
2.50.0



