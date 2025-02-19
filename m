Return-Path: <linux-watchdog+bounces-2962-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33397A3AD46
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 01:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5AA18973FB
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2025 00:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115B0187553;
	Wed, 19 Feb 2025 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ilbw/hED"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC303180A80;
	Wed, 19 Feb 2025 00:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925744; cv=none; b=OhCH4r/MzgNn7vexdYvEgghHA1DFVnuFzIqlNEY0uUbneSL+aokrbUX0k+EcAHkE7qOh+Pxd9fnJ8ZWbGajX6TTMX8QJnReA6er1wJOzk/3F9j41WxMDuamicjy7mmnP1KvPwZHrgpGmSNFK4OYAp0hxJuSrfrllXlVS4OU0Lhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925744; c=relaxed/simple;
	bh=BwGnr0m0xhmBvURW6iahNgzC2tdJQtDHH3iqzOTLvFI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Yt7RmKDFs1q7gC56LbzrfGie76fqhJi+6/DngW4yg6jpEkpovgrnVwivvBhG4eLtyVDdso1yv5FPkTA1+IxjJYhuh2cXxXnioyjQU0ImGsCr1QgEIkiDg7+5OsF42t21rNddjbfQNwwSt7b54MpH2/qSQFNEfMqC0maU7q7BN9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ilbw/hED; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9352BC4CEE6;
	Wed, 19 Feb 2025 00:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925743;
	bh=BwGnr0m0xhmBvURW6iahNgzC2tdJQtDHH3iqzOTLvFI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ilbw/hEDJPwc1Sh+JkMlQA5h+OID6m/Osf++dMsXsuSDlpKfnk/r28dj1vugS7fBp
	 dDtlMtOciF380qWvnfEDLW0fjc2wqFx86/wlSOUAkpNkoTH0hSa9/jS9rT1QnFYxFq
	 1nmIrnKUda3u8qXJCcixgyrDY3w5AtOBds1/1XS3EH6mjmIBo8WfszmAnJWKg/oA4b
	 77mB4vBkxGzHtPo5pUv7S/RCP7e65yokhXWy22pBk4lb5XNEsvCN+ecBn62Mvb1DjT
	 k6VYLbGR2vbsFvGQ8pvJCrG0e2gEIr2dAFItnO0j88+jtPhaujY/8l7yX821F+XO5l
	 8xOIQ5Y5OiTcA==
Date: Tue, 18 Feb 2025 18:42:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Eddie James <eajames@linux.ibm.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org
To: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Message-Id: <173992516523.2065435.15405371370616212583.robh@kernel.org>
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting
 down logic


On Tue, 18 Feb 2025 11:16:58 +0800, Heyi Guo wrote:
> Aspeed watchdog uses counting down logic, so the value set to register
> should be the value of subtracting pretimeout from total timeout.
> 
> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250218031709.103823-1-guoheyi@linux.alibaba.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#






