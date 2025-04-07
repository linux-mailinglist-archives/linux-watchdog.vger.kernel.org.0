Return-Path: <linux-watchdog+bounces-3216-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60EA7E529
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 17:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0FB77A36CC
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Apr 2025 15:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB7204F9D;
	Mon,  7 Apr 2025 15:49:31 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4FF204F87;
	Mon,  7 Apr 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040971; cv=none; b=r2I0tiBtJ+PE7BG8pnzHCh89H1JSgyTiNjf2+f0kKIodM1kLrRhtGUZoNq+d84ZFj1MM5KnwR3ZwzAFlSkQB+IBvGlZGlzlykIeWeV0QUVspeWQOC+wO2dO56GyNsnQSTJ9odyYj7suyEC+wfbbU2kCjZXeu58sUe1WUNWYbJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040971; c=relaxed/simple;
	bh=z1Vo+dwaof12v9FJV1zldoq4gxlfm8goG7zQDI0UfYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQcSCpEr/dkk9E9jxqMv/UZC4HJPDW8lQ28tdpkhnBQfUT/GGV2f9Dulx4Bu0aoHHBkbRm9JchE08GbEHkNqCRsIMK4KIDJTe/05435WSr3nRaE2pjGLam64RNYG8mYShMpdTxxOvtoqSFshM185pwUeouPriKtjH59ZmooJoSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824D1C4CEDD;
	Mon,  7 Apr 2025 15:49:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C8D385F9F2;
	Mon,  7 Apr 2025 23:49:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v3 00/15] arm64: dts: allwinner: Add basic
 Allwinner A523 support
Message-Id: <174404096879.829294.8545896192881134098.b4-ty@csie.org>
Date: Mon, 07 Apr 2025 23:49:28 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 07 Mar 2025 00:56:57 +0000, Andre Przywara wrote:
> this in an update to the series introducing the basic DT support for the
> Allwinner A523 SoC. It now comes with DTs for three boards, using
> slightly different packages of that SoC.[1]
> Functionality-wise it relies on the pinctrl[2] and clock[3] support
> series, though there are no direct code dependency series between the
> series. Two binding patches from there are required to pass dtbs_check,
> git put their patch IDs in the footer below.
> Compared to v2 only small fixes in the NMI controller driver: renaming
> the struct to better reflect its new usage, add adding the DS pin to
> the eMMC pingroup list. Adding accrued tags on the way, many thanks to
> the diligent reviewers! More detailed changelog below.
> 
> [...]

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[08/15] arm64: dts: allwinner: Add Allwinner A523 .dtsi file
        commit: 35ac96f796649346c9b0440413dc6c5138249b3e
[09/15] dt-bindings: vendor-prefixes: Add YuzukiHD name
        commit: acf5b947cff1b991ceb7fa53c66555242ff4c87b
[10/15] dt-bindings: arm: sunxi: Add new board names for A523 generation
        commit: f9d55227839199e928a41574e41089288a43a2d6
[11/15] arm64: dts: allwinner: a523: add Avaota-A1 router support
        commit: 3a1883f32b9b5083883624f9b39a3c6edfa6d490
[12/15] arm64: dts: allwinner: a523: add X96Q-Pro+ support
        commit: 66611715c473a9820b65322c94401a367711acd7
[13/15] arm64: dts: allwinner: a523: add Radxa A5E support
        commit: 80e0fb4e491b4994434e42c33c1387a46b7986bc
[14/15] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
        commit: 7273c0e2e4229bca42c70e6f3c33f1756902301a
[15/15] arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
        commit: 6d1cb8de157382facedf50f1a80ee033243b8494

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


