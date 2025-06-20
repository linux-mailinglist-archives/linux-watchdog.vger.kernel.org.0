Return-Path: <linux-watchdog+bounces-3686-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8319AE1F34
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22511889A90
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9422E06EF;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Re3c5ByU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753D2DBF45;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=AzT3Da+9hyYbynftR86pfLudxw4LDVKNa3gF9Tf3vbFGnNWt+pCAMG+vWXQoqKtLkssaCKpSayxyxabOyJrGdKunaqiUBrruhvpO7JAHNiqav99KUswL2O+/StHSjSPG2jkJd90r1cL1mZV3+jazxMgobsiI5pTQkvLZPMihhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=Uybg34ONCi1PiPWXXJtnORZRidX9fKV+ZB6A14EWDK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0atXJOs5Te72+QWxNgXfdYutDXc4DS98UiY6ujLaj3HlkTp+jarh8OgCIK4BbzKbNXBRC7z+VJAEl+qqfRkgZMcwB3XWhyMmAp9h2vBx9s1o13uvFS7OoHNdQ3Bk3VWInRStOUsX5/IgIau/Rli4M26fus3AolTp+7offMDBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Re3c5ByU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5B1EC4CEF5;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=Uybg34ONCi1PiPWXXJtnORZRidX9fKV+ZB6A14EWDK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Re3c5ByU3H94DFDU+2m3umuAWviPlxWbcL2f9gkwtla2KeJuYCIBJZdFRf6hZGyFP
	 mAxAXCP7RIqBv+stJfkEGZ8t+MvPNeeczipVQ8i8+tNhPOd26CUhurJDCvorT59JuN
	 a8lomXo6PcNwxSlXCoYPtRNP7/XnqPPgEzAgJuanSJQT3F6J0re/fAZMPJI2/9tiBJ
	 nuWgvKrFIXPCC7HkCZzNZEKPJefrqxVRQUTaLznsKBaI+No7gKX6/yw+e5xsJLEjS0
	 muDxc8bqewjR6kAsuabgUg78nP5LDiuPvmOSCrTqwZouMnxTxIjosL5SFUl64A2UO0
	 cfZENJKZcGZOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC88AC7115B;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:44 +0300
Subject: [PATCH 05/11] dt-bindings: vendor-prefixes: add JTY
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-5-e2d47820f042@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=808;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=qkgh9NSe5C5X30r4tLops4d54dSNCo6iOJTAIZMBoyI=;
 b=kO4OmP4BxOqIVa2atkaH6K79hBsbJY9G6vCDkKW5XfQA11HDIqxK22P0FfCRaTbVk7LvAnXjC
 T6elsaqLM2LC8784F08bgPT0g4HnsRkftkaSst2AdhRmqxy/yCoc4+V
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

JTY produced low-cost Android tablets based on various
MediaTek MT65xx SoCs.

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



