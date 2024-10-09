Return-Path: <linux-watchdog+bounces-2152-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC2996F23
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 17:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC5DB27EA4
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EB8161313;
	Wed,  9 Oct 2024 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOM32IBO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1D64084D;
	Wed,  9 Oct 2024 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728486151; cv=none; b=MRf7KkvFVdMnIsKQ7Q21Y8Yff9OZOpPqQh2tFWYwa7nXpyo6z3iTqPym6aMn5ENki6zq3fQn5z+9IqgI9j20Q7qyZaY4XLisFhG/v3luSxXOwOb8aQASmly5+ooNhvyOXyrXl1aBwrlnRXazFpIYt2KnDaKJsgkdA+8lAXgsoiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728486151; c=relaxed/simple;
	bh=YijPQnFRilQWRtLvvdo5y8s95IoL47EEoI6aPDUbRg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7RcxjsotHMQxPMeMUCGBaVz7xBG8A56TTG4+3Zm48rHL7lq7ClAiYi7vOUkUubO1lTaZlQa/7cO19Tc5S7tIWt2d5hSxl4JxChQimd/9ErtKRzf7jN1Ldb6H7fVVGxM/qXRK5vrWs1nwA3fNIU83WiM/B9dBVudQ9rrfv1WmYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOM32IBO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F2AC4CEC3;
	Wed,  9 Oct 2024 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728486150;
	bh=YijPQnFRilQWRtLvvdo5y8s95IoL47EEoI6aPDUbRg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOM32IBOekQCh583Xv7JBTXXjGSGt2wiWSi5G5Vm0PCPDbsJolFYePCS0OVH04/Ni
	 ftaxp2RWcWQ/fUzPu5bG2JHkteD4AmFOv07W9KmW5z2aUcWgZKqKvlYJcDXMlrCOsH
	 hgc7i291Q3Eev3H2ywjGqVu2JrFRHOsyggEqwp3rOu7LQ69CRg5AZvGHam08EGbbHM
	 UTtOVbLFRE0ZQF0XRYj6XsgW1q+5a+7+duAyfl6UjcCUqa87iUc8xGXEVZ8oaDUHT9
	 1AdY46RGoiD4S08D4n6SA6O8LCxnjkSc/Af91uZuqzwPJmeFl+i3c9LT6Pj7LCn/sj
	 jdwilatPoP4WQ==
Date: Wed, 9 Oct 2024 10:02:28 -0500
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
Subject: Re: [PATCH 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and child
 txt to yaml format
Message-ID: <20241009150228.GB465237-robh@kernel.org>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>

On Tue, Oct 08, 2024 at 06:00:56PM -0400, Frank Li wrote:
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
> Frank Li (5):
>       dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
>       dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
>       dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
>       dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
>       dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

All looks fine except for the maintainers.

Rob

