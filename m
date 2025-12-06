Return-Path: <linux-watchdog+bounces-4652-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AB9CAA600
	for <lists+linux-watchdog@lfdr.de>; Sat, 06 Dec 2025 13:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5F33305EC1D
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Dec 2025 12:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E542F1FDC;
	Sat,  6 Dec 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="o37lrMgA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ADA7640E;
	Sat,  6 Dec 2025 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765023194; cv=none; b=J2nLNLqcBXWiJ27I6bHYQUeWFtHUs/CB6ueXtWO5kdpQ8AGdIX4XrWvjubfT1zYk2h8FKFG4LZpkL/ybBije5loNZAwWZp3wF28q5C2DnvefJcZa0Tpq9jT1UEH0wlTkTHc3o4nOOOeo16c0FJTiavp8CZ6SF7/Gb+4G+0sso/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765023194; c=relaxed/simple;
	bh=5M6AwtGlK9pkgul9Roa9ih4aulMvO27asjhtyNdHL78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJpT5/bEz/5VlnJuCVJFFJR/htL++3bPcEw4rKAAFpf74BeUb/fpCXnZSi0qfMAlI2ihU3F7bKeGplQtGP4GcxsBOOzAICUKtfPlAQDyhxzy11IXfdxoqvNB7lN9uxfnI6ynng84GRShqm9qnO0taznmW7HcnvOmD2w0HtHV4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=o37lrMgA; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 64632409F0; Sat,  6 Dec 2025 12:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 64632409F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1765019618;
	bh=5M6AwtGlK9pkgul9Roa9ih4aulMvO27asjhtyNdHL78=;
	h=Date:From:To:Cc:Subject:From;
	b=o37lrMgAEO2umE9ci9Wj3b99oLuDhdpAbmupCXXewBjLd83B6PfZHI8OtnoQH2QP0
	 Ppv+Oe2q466RptgX66t1ZHVyqzk2kBXFCS0Qzg4ND202h8ZcxKOj0aN6IUO2nvNhc9
	 9CXdlquUECA59fXP0rH/U2OQoCsPDWDG9E0In3wkNSywG/qpZIzfz9zmnBQf5IsQWe
	 X6vTHdQP8B+PUbIcqMIpenUFXWvSHBV2ZXjbH4HSgdC5cVFkPnW+hPQXMvSXeY1wp3
	 GvJRDcDe3z6WOZphcvdIYOuFH2c/fJRo6aIYhxCdGGJxt3ynZaFdXSnazVYSEMIkAQ
	 CES0Xvp9wjySQ==
Date: Sat, 6 Dec 2025 12:13:38 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Haotian Zhang <vulab@iscas.ac.cn>, Heiko Stuebner <heiko@sntech.de>,
	Jack Hsu <jh.hsu@mediatek.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Li Qiang <liqiang01@kylinos.cn>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Zoe Gates <zoe@zeocities.dev>
Subject: [GIT PULL REQUEST] watchdog - v6.19 release cycle.
Message-ID: <20251206111338.GA4014@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

Please pull following watchdog changes for the v6.19 release cycle.

This series contains:
* Add watchdog support for:
        - Renesas WWDT
	- AST2700 platform
	- MediaTek MT8189 SoC
	- Loongson-2k0300 watchdog
	- Qualcomm Kaanapali watchdog
	- RK3506 compatible
	- Airoha AN7583 SoC
* DT Schema conversions:
	- lantiq,wdt
	- TI OMAP
	- marvell,orion-wdt
* Several other fixes and improvements


The output from git request-pull:
----------------------------------------------------------------
The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.19-rc1

for you to fetch changes up to 5bcc5786a0cfa9249ccbe539833040a6285d0de3:

  watchdog: starfive: Fix resource leak in probe error path (2025-11-15 15:29:01 +0100)

----------------------------------------------------------------
linux-watchdog 6.19-rc1 tag

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      dt-bindings: watchdog: lantiq,wdt: convert bindings to dtschema

Binbin Zhou (5):
      watchdog: loongson1: Add missing MODULE_PARM_DESC
      watchdog: loongson1: Simplify ls1x_wdt_probe code
      watchdog: loongson1: Drop CONFIG_OF
      dt-bindings: watchdog: loongson,ls1x-wdt: Add ls2k0300-wdt compatible
      watchdog: loongson1: Add Loongson-2k0300 watchdog support

Chin-Ting Kuo (3):
      dt-bindings: watchdog: aspeed,ast2400-wdt: Add support for AST2700
      watchdog: aspeed: Support variable number of reset mask registers
      watchdog: aspeed: Add support for AST2700 platform

Christian Marangi (1):
      dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC

Haotian Zhang (2):
      watchdog: wdat_wdt: Fix ACPI table leak in probe function
      watchdog: starfive: Fix resource leak in probe error path

Heiko Stuebner (1):
      dt-bindings: watchdog: Add RK3506 compatible

Jack Hsu (1):
      dt-bindings: watchdog: Support MediaTek MT8189 wdt

Jingyi Wang (1):
      dt-bindings: watchdog: Document Qualcomm Kaanapali watchdog

Krzysztof Kozlowski (3):
      dt-bindings: watchdog: Restrict timeout-sec to one number
      dt-bindings: watchdog: Allow node names named 'pmic'
      dt-bindings: mfd: rohm,bd96801-pmic: Correct timeout-sec length and reference watchdog schema

Li Qiang (1):
      via_wdt: fix critical boot hang due to unnamed resource allocation

Louis-Alexis Eyraud (1):
      dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8189 SoC

Rob Herring (Arm) (2):
      dt-bindings: watchdog: Convert TI OMAP to DT schema
      dt-bindings: watchdog: Convert marvell,orion-wdt to DT schema

Wolfram Sang (7):
      dt-bindings: watchdog: factor out RZ/A watchdog
      dt-bindings: watchdog: factor out RZ/N1 watchdog
      dt-bindings: watchdog: factor out RZ/G2L watchdog
      dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
      dt-bindings: watchdog: renesas,wdt: add SWDT exception for V3H
      dt-bindings: watchdog: Add Renesas WWDT
      watchdog: renesas_wwdt: add driver

Zoe Gates (1):
      watchdog/diag288: Fix module comment typos

 .../devicetree/bindings/mfd/rohm,bd96801-pmic.yaml |   8 +-
 .../bindings/watchdog/airoha,en7581-wdt.yaml       |   6 +-
 .../bindings/watchdog/aspeed,ast2400-wdt.yaml      |   8 +-
 .../devicetree/bindings/watchdog/lantiq,wdt.yaml   |  57 +++++++
 .../devicetree/bindings/watchdog/lantiq-wdt.txt    |  24 ---
 .../bindings/watchdog/loongson,ls1x-wdt.yaml       |   3 +-
 .../devicetree/bindings/watchdog/marvel.txt        |  45 ------
 .../bindings/watchdog/marvell,orion-wdt.yaml       | 100 +++++++++++++
 .../bindings/watchdog/mediatek,mtk-wdt.yaml        |   2 +
 .../devicetree/bindings/watchdog/omap-wdt.txt      |  15 --
 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
 .../bindings/watchdog/renesas,r9a09g057-wdt.yaml   |  99 +++++++++++++
 .../bindings/watchdog/renesas,rcar-gen3-wwdt.yaml  | 114 ++++++++++++++
 .../bindings/watchdog/renesas,rza-wdt.yaml         |  51 +++++++
 .../bindings/watchdog/renesas,rzg2l-wdt.yaml       | 111 ++++++++++++++
 .../bindings/watchdog/renesas,rzn1-wdt.yaml        |  50 +++++++
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  | 146 +-----------------
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   1 +
 .../devicetree/bindings/watchdog/ti,omap2-wdt.yaml |  51 +++++++
 .../devicetree/bindings/watchdog/watchdog.yaml     |   3 +-
 drivers/watchdog/Kconfig                           |  12 +-
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aspeed_wdt.c                      |  30 +++-
 drivers/watchdog/diag288_wdt.c                     |   6 +-
 drivers/watchdog/loongson1_wdt.c                   |  89 ++++++++---
 drivers/watchdog/renesas_wwdt.c                    | 163 +++++++++++++++++++++
 drivers/watchdog/starfive-wdt.c                    |   4 +-
 drivers/watchdog/via_wdt.c                         |   1 +
 drivers/watchdog/wdat_wdt.c                        |  64 +++++---
 include/dt-bindings/watchdog/aspeed-wdt.h          | 138 +++++++++++++++++
 30 files changed, 1113 insertions(+), 290 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/lantiq,wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/lantiq-wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/marvel.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,orion-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/omap-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rcar-gen3-wwdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,omap2-wdt.yaml
 create mode 100644 drivers/watchdog/renesas_wwdt.c
----------------------------------------------------------------

Kind regards,
Wim.


