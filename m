Return-Path: <linux-watchdog+bounces-3799-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBAAF1273
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E7857A6965
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942C725E822;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP3z0U1O"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA0825BEF3;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=tDeQzZYHpqlnuzU0q2bJO68Bu+BbHQLfaBWfRf+QuPlx71NRDpeRn9ZnQdfkAdJbBefQ60LkdPdXtG3HRUhpe29bhvLtO8291HyAsna9YPkkGD8UWwVG9eqMlHNCb/nwh7f3rDW5MZLv1DA9EefB2rFeYRArTy55CiWT9/BGw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=pUnXGCRHe1PAu0P7R3hbtfyW7147Oqq1sb7DvZqbUgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDjOxArDDngdrFBBLJ5cDdCDg/Lxx7Qm5M5LGFx/17uWFniH/ovOyqzOiEC7D5K2NxGi58rOmL8c20IIriF4OxS5hzX5g9juVFeaeLU4F6aXccCR/33SoK91QKYv5HDDbtoS1wdlsIaSXy8ogqgoRXrO+OdDDr+kADBJ17/XuU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP3z0U1O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A1AEC4CEF4;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=pUnXGCRHe1PAu0P7R3hbtfyW7147Oqq1sb7DvZqbUgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VP3z0U1O95aUmON0gQo0v9tlnBAufd4wbt3vXlFZ1l4EISrWvTgwFD4DBk/re6a2B
	 ZyXcxKTOlNczh5imWwkyzkbpu/IX1FvrtiPdLxdasJYsUPAIAzSsHGJfq2Q+GrfKAE
	 JHrl86OYUAVKmgzttgJeU3BLugFAsIk/EMjLDbR7Onkxc29liA1wux0dpNSypyOCUk
	 2WskmHrLHQWfxzqQOxYqfWMgRbJBVGBEaLG4SMf9Z47Bhr41Adg5c4IDyYgdoLn9FK
	 Nrd59n4aTaD/ZBQxSAy0+DYA8CKH74C1A9xsbfnPKC2WEAqKEYn4O5JN2aJq4TKuyT
	 VQUYVRI1xQxJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F29C83F04;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:42 +0300
Subject: [PATCH v4 05/11] dt-bindings: vendor-prefixes: add JTY
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-5-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=984;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=szH3lFOduJEY4mq69Ikm7Luzlgze9u32D6UzfN8hmck=;
 b=ohLRp/s49PJzoKClPs4A+JYw3mqZ/6OoB5nCbkm6Dn5XWqBqrqfrGhCht6pdwjbJh+s+ab6ob
 cMCGyM5IhKTCfvrKEYh9SljpSUbf1SH8vLlhesc8gBR44igKg94m5R5
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

JTY produced low-cost Android tablets based on various
MediaTek MT65xx SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
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



