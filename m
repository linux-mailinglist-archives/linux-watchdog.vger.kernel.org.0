Return-Path: <linux-watchdog+bounces-2363-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D709B3777
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 18:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1271C21671
	for <lists+linux-watchdog@lfdr.de>; Mon, 28 Oct 2024 17:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B5D1DED5E;
	Mon, 28 Oct 2024 17:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWAOt+iN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAF188CD8;
	Mon, 28 Oct 2024 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135726; cv=none; b=IuN4BG6nNfxWeBr195LM5lak0irytMXp7acxJTxCJBYJFzuIMEykPUrEa1EDyccUQ4FERXcSKls5fAqzi1h81DGD/pIzjSSr/F4cPP8tHrPyADlDQZuOqMcLPe+M1lVyfP/WmKz1Dq2esmCeRzKnM8RfX02HuMAM3oQ7wvXxPT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135726; c=relaxed/simple;
	bh=SHA60aUVkHc5dOlticmp590SgsHwyopdCX3RsUQYjWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8qSIKKt4ZLwEEAaZbIDgA3+VRSYewjkkvNq28sRrgGUKMzRFkMB1NugQOQJMOnRyS0VWpjdcOyZ6pa6QNwRp+mWQSkACDHiI3wWMv4sB2/1IG7wcSFXgeEah1bVf+Wbo5wOB+ZNywObj+m9KFJHoPuATKB0cSD1BKEZ2y5t8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWAOt+iN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F54C4CEC3;
	Mon, 28 Oct 2024 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730135726;
	bh=SHA60aUVkHc5dOlticmp590SgsHwyopdCX3RsUQYjWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWAOt+iNqV10UbkGMm36iAkjcva/IcPN2CiH5/NaihQtNCvt2RzbFu8Z3qJejfR/Q
	 98AB7CAtGwicrznM29UzZtx5rnNHNFMdA+3xsHywrzFCo1yMoZfBcypBFW3cGCGzX3
	 jp9BqiggK9yw/A9paQ0uxWnhV5vZwe+v/SIAYcfIrWWQ1Omrtgx7Fy/KjGRXcYky9S
	 BaRi3qsuI14JxJiHm6H57dmVXxLmHwbfMfYlKBxnIbs+7CToaZIPAbEOJGmMRXegVS
	 AVuGchll3ZzAwXShS1RXO8r0Ur5pK71nmjuv57v+czwzRxMO6s+DsZVO46wUB0mf/0
	 atZrkOYxqzCsw==
Date: Mon, 28 Oct 2024 12:15:24 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and
 child txt to yaml format
Message-ID: <20241028171524.GA888974-robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>

On Thu, Oct 10, 2024 at 11:42:37AM -0400, Frank Li wrote:
> Fixed below warnings:
> 
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - change all maintainer to frank li.
> - Link to v1: https://lore.kernel.org/r/20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com
> 
> ---
> Frank Li (5):
>       dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
>       dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
>       dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
>       dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
>       dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

Applied 1 and 4 since they still haven't been picked up and linux-next 
is warning due to the whole series not being applied. Once again, these 
MFD bindings need to go in via 1 tree.

Rob

