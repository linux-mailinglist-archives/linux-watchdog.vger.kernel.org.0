Return-Path: <linux-watchdog+bounces-3769-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92545AEEE2D
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 08:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 513D71BC4278
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 06:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FF524E4A1;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgUIu8ex"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126D4246BAF;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350019; cv=none; b=rPK6jwmD6oB01iQWVZbZB831ADFGSBI7EuwnMpebWx1TSHj2BV2xUKyh+DSpDt9YAPMpXCLyl7d/f5HXGCwXqzBcxcTC9p6eMtejKetcKRxwP/rGH+KL2aMzSFL9gJFQnentm5COCSgAZtARTvnDwd+zlPyhc2fChFzmeh7LBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350019; c=relaxed/simple;
	bh=oZcqmmBHgzf7bA0rusgFoUD24PExreWRsI+j45s8cvY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fp8KU4dXjy1TQI8xQNPaHxdfslbRMGl+Yv0DuhYnaNSGIXU40akd/WPEp1KMXNMsY/YtA5pOchDeDEB8E5Df1pt0KQDuTy9fyIOiP6KwtPcWZmNTuC0QqaDMVh2CsvOhp+RREne8f4akV8Udv8RSwk8r4hbp2OGPIPzAMy73g0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgUIu8ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85FDBC4CEEE;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=oZcqmmBHgzf7bA0rusgFoUD24PExreWRsI+j45s8cvY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QgUIu8exZ5q2zYmj1Bu2+77/1WGjQpzHDPZ5IANy4QUALX1p35z3cq/bJWUiYMwPV
	 5awZszFcghn9kNKoZYmTdghdK6AFWyEnc5x9bB9giUR+MwpyPVdZ+zqFW1LaATdWTP
	 6UiELPMCVkaRt1AKpLM9k2ksdt6zAWe4u6IYXJxjLXeQmYTrmWrNSelpA0TKQdoiQx
	 O2f3XHOgPDdscz/Xl5EV/j4n0SUA4OEGDb+hdYBUSed577rLzbSL0JjAJxHHeSMxM8
	 JXa7r96hyae0lz0t7PX+F2hyDQtglkx8jVPJ3BARUgvYKlM/7/R84iqAX4gM2VSqIh
	 NJVaSTJZZqC0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75091C83038;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Subject: [PATCH v3 00/11] ARM: Add support for MediaTek MT6572 SoC
Date: Tue, 01 Jul 2025 09:06:54 +0300
Message-Id: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP56Y2gC/02MwQ6DIBAFf8XsuTSwImBP/Y+mB1OWykExYEgb4
 78XTdt4nJc3s0Ci6CnBpVogUvbJh7FAfarg0Xfjk5i3hQE5NlyJlg2zajQyctp0tZWNUAbKeYr
 k/GsP3e6Fe5/mEN97N4tt/SaQ/xJZMM4IrdQGueMSr1MMcxjPA8GWyHjU1F/DojntjETRqtaoo
 7au6wdlvVtY0wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=2387;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=oZcqmmBHgzf7bA0rusgFoUD24PExreWRsI+j45s8cvY=;
 b=2KhKXVehntkb4Wh+h+vs9QAsxwTRPHmCMXW1qrDVrttOmhLUQv4ciyxG1hFdZA/zQMzd8OqAh
 YTAHYVURzLSD7a+Ag2fTJq4Jck+JvIdjNrp0WNDF3MwY1qYz8yz7igK
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



