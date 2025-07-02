Return-Path: <linux-watchdog+bounces-3796-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CECAF1267
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EEAA16E7B5
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 10:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305CA25A338;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lwy074kL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019642571D4;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453488; cv=none; b=ANo3v+15D80JtHLwSnYpxF5DR8V4hX6UOun/RHPLhGGJFUG7BBgOLWG4KJ2ENlALfx29t9xpGDkcpzdALzgqj4PGDBU4WqmloZtCdiZqVJa8Yd7n+BIoFkws+idkzqnB6aMmONBDGxfAVDIVIpsp0GkKsxm6TDNr/c8OY1KwO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453488; c=relaxed/simple;
	bh=MV2mMqrsywSQ8XEX8eIYyfXz5q6RId1u/Dc6AHhTFO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sHEjmt82uw5lYt6tynzMNs+qud8Pp2W25Zl3Y2QKdsQNjjbpREJP64DQJejSUeAqYLCNLxvwrIzFIRD34wq1Bq0Fijh/L0fWB6UdUgEJ27HWtSA/40KfJGc/ZxeBwUpqlQFBuGcenp9/y0bv9B/iDBS2oItn+i6tGoDBGQ93Hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lwy074kL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C621BC4CEED;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453487;
	bh=MV2mMqrsywSQ8XEX8eIYyfXz5q6RId1u/Dc6AHhTFO4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Lwy074kLgKo/DrcGKqhjxzinwCdvqlTScrd4/lL/hkuiuq27kbp3wf7tDVxqS7B+x
	 F+XIwBuG/JNeZh/w3fGbBta11+p1xzPd8G/E6vQd2caDQZFb6H++s+GaR3QTN4Jvfc
	 Cqh+cnB7jKQ4uA7VRNhDQZsI2LGbE3eSue0Tb85QXukmUSAItBP66RNAjwOWHY2f9Z
	 Xc13pOljho4d3qkXGjRQ43gQ4o0uBm9Y0Nc2Z7q81a7mcivZjJ+oHHP4K7AaDN9Qic
	 t60X5d9+Zw+tsT7s2rXmrVbEYVtH9d7DzguErD1Z4QMc3XWOTOeEL6/DwZ0xWOfJ7L
	 5jkoa8zN8r7dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9256C8303C;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v4 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Wed, 02 Jul 2025 13:50:37 +0300
Message-Id: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0OZWgC/13MTQ6CMBCG4auQrq1pp/+uvIdxQaCVLqCkJY2Gc
 HcLUSQuv8k874ySjd4mdKlmFG32yYehDH6qUNPVw8Ni35aNgIAgkhrcT1IowNYpXbOWCyo1Ks9
 jtM4/t9DtXnbn0xTia+tmul4/CSDfRKaYYAstVxqIIxyuYwxTGM69RWsiw5HJnUFhTjnNgRppt
 Pxn7McUoTtjhWnDVONqxpwRR7YsyxtVyahhCgEAAA==
X-Change-ID: 20250619-mt6572-ef78a3d45168
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
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=2538;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=MV2mMqrsywSQ8XEX8eIYyfXz5q6RId1u/Dc6AHhTFO4=;
 b=fx0ojaT7IM1H7gtp9SN7htFt8MTf0CWYRzHJOJDypSd22BTlhRLBTF3nK1kDkThQVJtwPe6NQ
 ZpJ1aDGzhChBGaSPTPEeodQlvmGW1xp9P/foi8vLGauPHKdJ3Z6AVpF
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

This series of patches adds support for the MT6572 SoC and
the JTY D101 tablet and Lenovo A369i smartphone based on it.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
Changes in v4:
- Specify the unit-address for the memory node
- Link to v3: https://lore.kernel.org/r/20250701-mt6572-v3-0-8937cfa33f95@proton.me

Changes in v3:
- Remove the compatible property from the SoC devicetree
- Link to v2: https://lore.kernel.org/r/20250626-mt6572-v2-0-f7f842196986@proton.me

Changes in v2:
- Drop the status property for the board devicetrees
- Add an soc node for the MT6572 and reorder the nodes and properties
- Change the commit title to a more descriptive one
- Change the cover title to the correct one
- Link to v1: https://lore.kernel.org/r/20250620-mt6572-v1-0-e2d47820f042@proton.me

---
Max Shevchenko (11):
      dt-bindings: serial: mediatek,uart: add MT6572
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
      dt-bindings: timer: mediatek: add MT6572
      dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
      dt-bindings: vendor-prefixes: add JTY
      dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
      ARM: mediatek: add board_dt_compat entry for the MT6572 SoC
      ARM: mediatek: add MT6572 smp bring up code
      ARM: dts: mediatek: add basic support for MT6572 SoC
      ARM: dts: mediatek: add basic support for JTY D101 board
      ARM: dts: mediatek: add basic support for Lenovo A369i board

 .../devicetree/bindings/arm/mediatek.yaml          |   5 +
 .../mediatek,mt6577-sysirq.yaml                    |   1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |   1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   1 +
 arch/arm/boot/dts/mediatek/Makefile                |   2 +
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  61 ++++++++++++
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  56 +++++++++++
 arch/arm/boot/dts/mediatek/mt6572.dtsi             | 108 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   7 ++
 13 files changed, 250 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250619-mt6572-ef78a3d45168

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



