Return-Path: <linux-watchdog+bounces-3726-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26FAE9919
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 10:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4271B7A73CF
	for <lists+linux-watchdog@lfdr.de>; Thu, 26 Jun 2025 08:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A846296163;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKMrfeFU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89A295DB2;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928038; cv=none; b=UTNpKMyCDF5838DHFx8Oq8yyIRAgjiNauOoo6SgP0slE9kLkamrNHNZopVRm7I2ejP+Gc2W/M/e6sAI1PagoPYZQFJe4NR7Z7D1NNa7IBCcwHKQtLd+JeeJiuYLAqH9VmSskDDizYgtUEoBpqVztw4qqaqmn7R1NbxdunMOAs7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928038; c=relaxed/simple;
	bh=OwU7D8PADIgeGXWG37O9GOsus96bJ6yiGEjt9OCGGg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q7kNzV0UV1g5yDrXwx1XvHFfqgciauKbs0ClPrt4/HfaDa3Xcj1RKavZPGfDnnFGpVX3v7cchi5l6x5Z9e10i20WxIVU+Bb7D5NleQYJODLgdzwcwOME0b9Fb5DQ0NMu2ZFGpgNwTTyrLBqaZLQhwVQJcUzJTy9gtaJl9GCg96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKMrfeFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0B46C4CEEB;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928037;
	bh=OwU7D8PADIgeGXWG37O9GOsus96bJ6yiGEjt9OCGGg4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DKMrfeFUOrzQ+q2EjnOdTN75U7ouLUQ/xGrr0CJQ1ZSQNT/f3MPL+kKaCiJMvSUaZ
	 8VFZvHva0c1Wt48gaqJzxTgM2bccFrcvtdGSIXFBwUrk3P90kqm0GaaF7fWOKcyUP8
	 /2yh0oiAQ+EXezl/oOzS2tydyd+/xn2kwJk1sPM3UUnRmgpIBFpWRjvk9+ctLt241K
	 tLnselK0Og2mQVFgpfAMFLIUwW8zT0MI2QqFcbeXM/0jR7pZkd2f90zzvz4GO4bDXf
	 55o0XKyqY4DSLizwSQK1mVMeaIE8NbrXxQzN9+JVmX4xK7c/GzEQR0PFZATLuT8ptb
	 SX2JZ7sFv5bzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD3C7EE32;
	Thu, 26 Jun 2025 08:53:57 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v2 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Thu, 26 Jun 2025 11:53:53 +0300
Message-Id: <20250626-mt6572-v2-0-f7f842196986@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEKXWgC/zXMSw7CIBSF4a00dywGrrzsyH2YDhq5WAaFBhqia
 bp3sdHhf3LybVAoByrQdxtkqqGEFFvgqYPHNMYnseBaA3JUXIsrm1etDDLyxo4XJ5XQFtp5yeT
 D64DuQ+splDXl9+FW8V1/BPI/UQXjjNBJY5F7LvG25LSmeJ4Jhn3fP/dlbN+cAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=2226;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=OwU7D8PADIgeGXWG37O9GOsus96bJ6yiGEjt9OCGGg4=;
 b=baIgSdGhRpPQDRrIAAZqPHxm2ghrGJjBIImam6uwo0RV19u1bA8Bu0NK72e5cy9k8IIzWH1kz
 Jy6jsC+ed2PBY0D7f7rUV2LakXFzOBxjLQCNTbuWlHUPAtXa2IdsUgK
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
 arch/arm/boot/dts/mediatek/mt6572.dtsi             | 109 +++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   7 ++
 13 files changed, 251 insertions(+)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250619-mt6572-ef78a3d45168

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



