Return-Path: <linux-watchdog+bounces-3685-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA685AE1F09
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DAC179CD2
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5946C2DFF22;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1tI9B8a"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE882D3A6A;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=Cok8l+L6tPlMWkm85QIJACqzM/Re+djKGr4TwCHoQaoTs8yIWd6TW8v/HB/iJNdyUK8YxvX7ITQyw57eCkTHTY0Bo16vbK+SAwfh7k+lkVdtd8W61pvT5Mpbvv/3ve/vsV3hY/ueI1JN8pZ4Vq4N2xZrG/whUqssBocLaWcb7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=AKOrhyhs2Jj2qtskUhWdE0HhaacmNbXHMWZUaVDZHf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xn0G1wF/fFOyIxsU2jzSxwyoma/OXeTGnTR9+7xXAKzq2E/j/Ur40ZB/wMPE/35itDgHyaaRH+E1TwQjlw9YoOhr6NRCvx/Ci4NebcO5VnjREFh6SbJVW6rVRKndPspDaEeSUkGh1x6Mz9HcP1ebXnvZLul+v49og78kwTzBiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1tI9B8a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7A6DC4AF0E;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=AKOrhyhs2Jj2qtskUhWdE0HhaacmNbXHMWZUaVDZHf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y1tI9B8aTdZmMnHtUDS4XuLokim9DOH61d6g51rDgeeHWIVxFrv5P+1JRWfbQ67gl
	 9NnR6IglFDKSBNB3yKbXpyNsq0Sys6f0ZflVwUR3vNKLUwVDGZvHXXxQfJwXVvmsmV
	 gsx5EjvWjWyyW5QvrqZ1V+eRABNOvTfwy8fVUZOtErqvrJZbIJmbPjXqfNoZYo3FT7
	 UcIv7fAd4mYX5K6NIq7vBx/f/zH7Dw1mdbYfuWQjFeUckRlUaRtlSPrbUxU+XI8n4i
	 9uIIy6xqHCau7ZZhh/7t2puvFiCgqHh4rTmCsgEdXpE/4jTHOxDR1MxR5p0H34GdrF
	 rJuU0vRSsnfmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF78DC7115D;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:43 +0300
Subject: [PATCH 04/11] dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-4-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=881;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=s3g6y7Ip5di5tGuKT51vAjlshignLWNLLW032LmZfM0=;
 b=O/Con1noqgqEZtt1wb1XezpXnaB4pJD6KMWQwX/Xyjbf76wPwnXrXJn5UytbNK8mrtp9nngbK
 QXRKEDV+93iDfQveEO4tyYy2CXwzLTI7Nu9DKsdAKiuyqOJPUrRZnCN
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for watchdog on the MT6572 SoC.

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



