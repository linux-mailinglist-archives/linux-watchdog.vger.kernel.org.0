Return-Path: <linux-watchdog+bounces-3681-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2FAE1F42
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 17:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066CA3B3B66
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Jun 2025 15:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C72D541C;
	Fri, 20 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnep2/Mv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043B319A297;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434234; cv=none; b=dhyI/Ldd+scYEUSD8waaFxe19dPnj+fOkCp3P6BEbHXUmaihDqE/Y1ej3/PE0RXg87CogsdBIo54Kc1PL24OZeEdjR68NQa6YgXc1NtDIDyfbFR+E45lcayQYIRtpvVF0YebFxNBkr3UsylOmEIZOTK2hsNPemFbU2/quAGis5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434234; c=relaxed/simple;
	bh=1gkbm0Ahe3s4IB6dtM7/gc/Nr6esMFpIeX5/yPsyc1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XwYlYDg7Cz1o/0aJwsDSfR2GbhMcomSrWmd6yMSgAoum+vIYRwU9foV2biSbGD4Y3tklKs7kYx2zDS1PRODU8agkAIsOuHuTdaMVzfXgmJ6ZfRJyMX2/+2Yo51q3O4ZzgxjcfdKxM0dqlvfxssRr+p7nLQZHGGzSpvjBS+lSKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnep2/Mv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B5A1C4CEE3;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=1gkbm0Ahe3s4IB6dtM7/gc/Nr6esMFpIeX5/yPsyc1Y=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Xnep2/MvdKDz/fdHmq2XY10w5uvObo11RdsEiCdlf+obnwW/860uuf3r37MAGFKxQ
	 28faH4Z2e2Ptr2+nKQdmpSEtkpqcc73fjncWeDQU8mjP9JxE17VvVAXfcvU87ZHFi/
	 EDVN5fOOCcaEIvW2Vmk+8RmJUj9eoPxOpjW694/0xfsyxyfkqyMfzw1Kp6lyWofRIr
	 Mamo+p+0rRaXS9YrZT9VoTEQtpYPab2mTrORYIw9PD16sjtR9Ti7K0RUfhKVD0qwpN
	 jTTa04qD7Z3YxDhGTguvgckMT6RewnkFOlBmbb83DYyNFKBJxs/hC+2jHTI/BuN1Mu
	 KMVbaFFySn9oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76497C7115B;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH 00/11] ASoC: mediatek: Add support for MT6572 SoC
Date: Fri, 20 Jun 2025 18:40:39 +0300
Message-Id: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPeAVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0NL3dwSM1NzI93UNHOLROMUE1NDMwsloOKCotS0zAqwQdGxtbUASpa
 sVlgAAAA=
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
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=1888;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=1gkbm0Ahe3s4IB6dtM7/gc/Nr6esMFpIeX5/yPsyc1Y=;
 b=3AEld+8wk5+1U1fLhIXFcIWHi3wiF54pBxW8LeyFpiSwe5e/VCsRfBazfxNwxh67svgValpwe
 WLwLty6rQADAqyZaM7c8c8wsEzl+0990wJFZUTgodCzBj5BoVIqNY1r
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
Max Shevchenko (11):
      dt-bindings: serial: mediatek,uart: add MT6572
      dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: add MT6572
      dt-bindings: timer: mediatek: add MT6572
      dt-bindings: watchdog: mediatek,mtk-wdt: add MT6572
      dt-bindings: vendor-prefixes: add JTY
      dt-bindings: arm: mediatek: add boards based on the MT6572 SoC
      ARM: mediatek: show the hardware name for the MT6572
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
 arch/arm/boot/dts/mediatek/mt6572-jty-d101.dts     |  62 ++++++++++++
 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts |  57 +++++++++++
 arch/arm/boot/dts/mediatek/mt6572.dtsi             | 105 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   7 ++
 13 files changed, 249 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250619-mt6572-ef78a3d45168

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



