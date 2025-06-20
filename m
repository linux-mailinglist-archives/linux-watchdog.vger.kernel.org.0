Return-Path: <linux-watchdog+bounces-3683-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E809AE1F06
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C35287AA404
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469572DCC13;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLqfmE8c"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448A2D1907;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=mBfCLZ8uKOrOhRUtVQbNyfUJMMcsYWByeMSlwVEj83xv/pSh8dgOJX66YAMZOQakjkiVpKKUhLQAGB9lGfh8haICHeXXyvgitsWbshZan2g7ZS45Krh/6sGDVRGZd2YwVqO4vo5g2ee2nSdc5tCRn9yw5wxxwDSCCmrx25mBih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=tgeUc/R0j8CCfUmJ61OgWYWQK00MbN2CJigikfkHJcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDnI8q9RASDlcX3k2y6DJFUh42X1Vo0PrQKnatoN5U91TUhnLxV77ipbTr6H0oCIfXHSiu0qZDObr5X23mot4dmi4CMKXibnfCLYTlO2wfjz6UWcTZZ6DTh0UzS7LT51IcmOtUOHphGN0NqGubOzJ4PGT1MOwT4KXDHVQyWWgIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLqfmE8c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B19FDC4CEF4;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=tgeUc/R0j8CCfUmJ61OgWYWQK00MbN2CJigikfkHJcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pLqfmE8cipKfWGwV2MWoYWWATbSj4JnUCQpFZ91ftMLWmlxmmSFthIpljIzyuGDcy
	 mqrNHR/ftard0xaw0j1srYwyzzH15eBzuCGQN1Bxutf9qIhO2p1+SyjuSiJxu2kTYU
	 SmYGjo66g+Vxbf+aRD9XmEX4LPiD7Rj81FddeskmVxwmAzC48Z6gqZAto6aWsjOnre
	 reOVecduG3Iyh0bAnHQ1ZFK6nSRVMLiHYIASZ5henUg9oTxcpwWFwxr3zhhZKuIWXo
	 NddbcbSI0TPCphFLDgQxI+T3qTrKqq0TYe8DVnhwWjtOfVme/Y9lL34Gx/w4hw60Wl
	 Xhw87zcjIgcig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C5EC7EE24;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:42 +0300
Subject: [PATCH 03/11] dt-bindings: timer: mediatek: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-3-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=863;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=jfWrM+VUxPi/ZeXkkUEtr7J/dcx3RptmZFz1Koou0n8=;
 b=R9TJ0i7RRdU0W01c8l4gIY9VoQjSb+IBn8JhR1M6WYHc2pOOjVoC5BkFSroR1mAZqrJaAJHXV
 XPKoNiFMURoDCVE+YuHip4+ANo6elHZ10+r9Y9nRLHAp/oarf11NJOS
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for timer on the MT6572 SoC.

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



