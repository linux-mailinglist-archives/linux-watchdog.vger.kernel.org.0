Return-Path: <linux-watchdog+bounces-4048-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0599B32496
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 23:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F581B21837
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Aug 2025 21:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478CB33EB0D;
	Fri, 22 Aug 2025 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3/tgXbp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC73218AE;
	Fri, 22 Aug 2025 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755898060; cv=none; b=D0z6tMl7+xsNEj9P0BpXF7ml2bME7i094geGcq/zqgjWOPZ3v92jQHedB2SSySMjy35UDNY+qZtMc0rXsOaIYAYbq11zCi34Ge7eO1Y3/PQL1ECWYV5yret90BJkjRBJ0nTTjHsqJ+zyXpkzqlUg+3rjjjyqS59OAJp9eLaP2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755898060; c=relaxed/simple;
	bh=nkuC/QN2afmhmsTiI8HvmEF61S+v7E9xYf8SQ5cRt6M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mbEy4fZGGzyUTra8D8loK5LBrojJGNRbUx2D+Nvo7vfl7OqjUmb0anO5erIQhmON5rC3p36OgFAVIa8RKfvSRjwPyel8Wd1PZ1bGprQkn2lblaSPh4rL21SD1tfSP1y/ZMOY0ztImyENjmJcz0gAVh2PUKqRCnItMyUR5hrUt2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3/tgXbp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00515C4CEED;
	Fri, 22 Aug 2025 21:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755898058;
	bh=nkuC/QN2afmhmsTiI8HvmEF61S+v7E9xYf8SQ5cRt6M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=E3/tgXbpRMu3Jcn/e6bgT7QiCHcfx2wM4TCrsGb/8gZv5JDfPWyxwDMZ5ppT0xNvK
	 u4djSFIuLPt2BvQoIzHYeGHUMcDffld2eS2waOSvuesBgujMfAVOjT/ccIVv5zNjz/
	 tC0no6QO9MV1LSH35dzDZfgoMCYbZN1GPZs+M0VJJ2GcUZsCSVJepwXWj2brfUVP0h
	 PTynPT6mvCVuv0hvUBZzhsJED8Hl6OhWEo7SAPxlSCzSVS+MN/u3M4Hf9DNIfQObEq
	 GC5L4y733QqJF22tvgJMI6eF8rno+tO9NvO29zcimkkkP2RQvkVcZRoswmmDMJ0fzN
	 +7VxZ9LFNK17w==
Date: Fri, 22 Aug 2025 16:27:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-hwmon@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
Message-Id: <175589786195.518444.15005080125108403794.robh@kernel.org>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support


On Fri, 22 Aug 2025 15:15:24 +0200, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
> 
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
> 
> [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/
> 
> Michael Walle (7):
>   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
>   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
>   hwmon: sl28cpld: add SMARC-sAM67 support
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
>  .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
>  .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
>  .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
>  .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
>  arch/arm64/boot/dts/ti/Makefile               |    6 +
>  .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
>  .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
>  .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
>  drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
>  10 files changed, 1234 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
> 
> --
> 2.39.5
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250822 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250822131531.1366437-1-mwalle@kernel.org:

arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dtb: pmic@44 (ti,tps652g1): 'gpio-line-names' does not match any of the regexes: '^buck([1-5]|12|34|123|1234)-supply$', '^ldo[1-4]-supply$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#






