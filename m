Return-Path: <linux-watchdog+bounces-3687-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F22AE1F10
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 351DE7AC0C9
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995082E6111;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awf61NZz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1372DFF33;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=pT36CkciIUpaxr5MkYdcYJV3EZfVOIi7a+HhST3ZTK33cNfE3EmYNuvAn1r07FY6JNFTeNuKtdiOinQQJRFk7Tdh+ka5Y9pbS/NNnnYN1oWWAfLiVNaaLpZBrFpd5Tj2JGaIrRmL7NCRZLULCm3How19MgqPdPGvHYFsVrx5Uxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=//PkLi9LdDjqJt/DZwax1qBAWo9WVdYtWxQpcLyBWFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idVRFYNuwbgVE5MwavSjNS57hDiVs7s/aI8e18I0FAYFxfzniBNo2L0rZVN7ReLyg14N+nk3MKOKcVfML4bluc4pagWCcBNOAbq8REd6ggJD9x9qmuxmJw3divxqvKjQy8PFmbidCBDv38zpeH8tty2gZunRLrSmSiHNFgheeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Awf61NZz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1B81C4CEF8;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=//PkLi9LdDjqJt/DZwax1qBAWo9WVdYtWxQpcLyBWFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Awf61NZzabibO2UxGbcD2FGXDrmyxNubicR22c0vAS24alvP4qu7T9g3rPtb1g+u2
	 Zwa2jE5/MoU1xoDSRPBMdwoKpJttgSnajeSoukbfc66KgccsFsWj1vmz9V+st7i+kh
	 ZN/Mt7Ps3Lf6EFW7VSiBIRo+sqlDykLOfC2RKF5xcr78B5vezjJhRomQDokE6nbksi
	 hX44ww3+PlVlFkM4D46eLZg7DlQDsjlYE4JEPBLvOi66f73MYHebht0YDz3OI2ReRM
	 2IaG1gU0Fc9cIcH1qf/hKf3D2LJbMg2w/h+7NWcOQf46pFRY5E3mFMc8Zx2qS9ob9v
	 0e756yZ27y1pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92ACC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:45 +0300
Subject: [PATCH 06/11] dt-bindings: arm: mediatek: add boards based on the
 MT6572 SoC
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-6-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=912;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=lqjHr0IWB35a+PzYE/4juId1C200yBp5ifX7vZ1Nro8=;
 b=qu0EtiEcIQbUl7GN4XSsS2ncetX4//ZSpmm+Nh9zwFaCPypCSoFS3TYMOib/n3rcoKGpiz/Le
 IBQDy3VDZmBA48DbaASHmJPlDQvBqq8W8jD2zOVZkmdE9uOFq9rfFv7
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.

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



