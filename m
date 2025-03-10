Return-Path: <linux-watchdog+bounces-3076-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1916A5A47A
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Mar 2025 21:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4A83AD459
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Mar 2025 20:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FBD1DE4C2;
	Mon, 10 Mar 2025 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvFJaMHd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994821DE3CA;
	Mon, 10 Mar 2025 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637587; cv=none; b=BeypKJx3iXkhjnu988qLr2tr63vlZU2Vf7Ez4L8//kHcJeDt2+k46xf5jiBM213D/XJurLjNASqV/U2opYH0eD8K+piPxPEFziiCLjmogjxeNpqy2JXfWwzoLuLiwFZMbnAPY562gt+LAMpueoX6js5HqV5PsCpgRlWhse9WUZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637587; c=relaxed/simple;
	bh=pwT39giEdOzrATke/Go754xjWmqpTejDczTvTc4LmLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ris8aekB42WerUuLGIAtF6H48NV8q1Lwi0EqLRmahOEdYRE7WX2kk9ZML4zuJBffPH2u6lGMU+5WtxQzVdiOt2LXnHC+otaBBcicDUxn3bp8M45znRkMuBEqGtRTiZfbI2jNbcOF3z0rQHKa4lxyFsseGJ1Xxg7LXBxOUEtl8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvFJaMHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E97C4CEEA;
	Mon, 10 Mar 2025 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741637587;
	bh=pwT39giEdOzrATke/Go754xjWmqpTejDczTvTc4LmLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PvFJaMHd1RdC/g5djtx22/46v3J0qj+Yc9d2cSCc5paDGT9IqCAr9+Qtb3VpOwbJP
	 qU/BwFi1nA67/u6vFnq63ncp06yks3dG7bCewpylTwre3m2YOSNYu5gNYy7rjdNI27
	 c/QGUicBRGAbxLi10hU+d7deZPr0mc56WF/HJNGE/U9kFPYzShWcPDyrqN6g5y47QV
	 nm8rftZFmJzaGo0vBPBSiH5JwBjYN5yD1b5uiwUf+X7Vt2oVI3v7IOmzwMVqo9glbL
	 aD8DtcoVJUQ/Um3KuV8e5DIcFJdcz1HvSr/pOjEjWeylgPZn3B27yxybGOVqZGS0J1
	 SR13cVMqi3FfQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v3 00/15] arm64: dts: allwinner: Add basic
 Allwinner A523 support
Message-Id: <174163758109.467704.5227333743858525157.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 01:43:01 +0530
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

Applied, thanks!

[07/15] dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
        commit: 1f7af7f3c353ae3b384a66a82c5074ac28901160

Best regards,
-- 
~Vinod



