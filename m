Return-Path: <linux-watchdog+bounces-3684-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA70AE1F46
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138963B5890
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3C12DE200;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUNZJO6O"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044ED2D29CF;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=SJ9RU7XgoNUFTzzNV2OO3TB77LCy1CakhIFzGj9aVosEnDXR4vjmgNjOR+HV3eLPkgaNhR/wbDmke7b/NBfJ0bdzcPE+9ZJ710tdftwjZjVlYRsfEp9CStlxVHrK1kydaiXVI7jJ4C6gf8za0mxL/JaQEdHTDaX6hREzXrSeWnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=7Cz9DeYbJNfdxqyC5I/LakjQd58o56ZwWd4MumaDT84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USWukcYLmAcpIg+d5VVSkuMU8tKL8cAtqRuwNhX5NoeluS5yNRA6yE0J+HdnM1i0iYUo2X0cWJotf39mAZ29qlRexZpc3qqWQ29PFsdrFFduAT+Y/ryJClnNlfja/UnJy1ECZ3LnG6I6HnAE93N0ZMrYnbfnF1kPgH8SIzjP2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUNZJO6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96F22C4CEEF;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=7Cz9DeYbJNfdxqyC5I/LakjQd58o56ZwWd4MumaDT84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iUNZJO6O210/UFXdJnkMzN3jEh572jNTT9CA+bJlgZPecXkOEXKIWALsnO22GafiD
	 iwLEwD25S2oc3NDAZSIbrSz4d6oaTBYLhIGG3JBbfXvsFZQeyWOHLKygYN3kI+ZGU2
	 Urp1PqGcPHimYUaKZ2qhqVZBdHqzSCuOqSh0ik8DuijpsNYBzdGrc+iUtO0nGIvfeO
	 5ZfIoDRbF4WH2cFDPRKd9aA/Y3jsbRb5l0ia0WXc1QfKMxCk228wsfJ8/xJ73ix3bw
	 qmcx/MyfAhA3qNxER5yuUJRqaWOyTlJZ09s9k5nsyoYkVxSt7WKZrNYShq51i3DFKs
	 H+5zsB7z4e5Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8653FC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:40 +0300
Subject: [PATCH 01/11] dt-bindings: serial: mediatek,uart: add MT6572
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-1-e2d47820f042@proton.me>
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
 bh=V5vXqZRhKe/QPDs6cq0TFRVUVaBGJI2I3Hr9UkPlHFc=;
 b=vQ6ta+L0cSyrNmAT6pH6n2zLB7oXQGEryTst+S7AsWcfCTKZG8qHMy2e8vJCnnwrSNdSGQ89l
 2Gsid+w4Fr/DaCDCS8FA2rfQ6IzGdhG94i/Dl1O9e8ML0+x+9zqmQkF
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Add a compatible string for serial on the MT6572 SoC.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff46e3530372d1d9303210cca9c2d5..fe283494188dea64bdfdd34a781bf54c8cbc1f05 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - mediatek,mt2701-uart
               - mediatek,mt2712-uart
+              - mediatek,mt6572-uart
               - mediatek,mt6580-uart
               - mediatek,mt6582-uart
               - mediatek,mt6589-uart

-- 
2.50.0



