Return-Path: <linux-watchdog+bounces-3705-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A204BAE388E
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEE61894C49
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B45B2367DF;
	Mon, 23 Jun 2025 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cDPA0C7F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574822F16C;
	Mon, 23 Jun 2025 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667725; cv=none; b=hb/vR4O2kOdYRysvdXSmzWEZXY/BkT7jq0OdUYVADVeC4dFnbYBOozjlWEzGY81+5afjy+7A9OVAkwczliaOrNRwCRlR6TZyLZccOiKLtHvRjSXvmbxqzZ7Ia2tQ/AbzthPJKp85JjIeiFipuYJjdVbpVMUZhWwL4lVErF6gnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667725; c=relaxed/simple;
	bh=47EqE7bU1EPZXo/pjpY2FIwSnKhw6fXy7NDRDFk7+i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzMunMy6wQt/nTCS50Vq7412yhzCDYrgzwXrAvPm+uCRhHmu2JDj4tclwuq8v0uz5i6kKqBI9+MXUfLsfgmDHHLM3ot+4sjN/xdNIV6/Bts9yGX98TSv9fsRDwqSKAl7IsfNiulyFsSrFqxMgttVWzxWtCQVSWLZbflNQ5yVpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cDPA0C7F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667721;
	bh=47EqE7bU1EPZXo/pjpY2FIwSnKhw6fXy7NDRDFk7+i8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDPA0C7Fwu1zSbSbKN6+YeyJ4ftsnw094NVThPnQOfnjq0UHZHC6wSM/Xl+jk7uct
	 upVXYPCwrYn4q/AlcmHCYvJPHZs9QgIMvjnq1hXuXUStPv5Ot0OMw+RrGWQixzP6m1
	 UvRv6+iiT5rCMw7RiDDLiIxqBOPDV/CbW28cLAUNzK5+iZr1KtzPRWHQgdB1T0iF1s
	 5IiUEiE2v1JVo21plMvLDw5KIHgpG/+wNjuXe9H2hS9cFmM+kdd/KSKhxg9IE4/dEz
	 wPodhUPTHknLwzQcWPuHXBfoqIfagzS2nPp/L/N23jxpc6sTkzmi6EJxGAtDLttVMF
	 pmi48CZbLnNPA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C25AF17E159C;
	Mon, 23 Jun 2025 10:35:20 +0200 (CEST)
Message-ID: <94fd71e6-0f09-42d0-94ef-1ff111daac9f@collabora.com>
Date: Mon, 23 Jun 2025 10:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ARM: dts: mediatek: add basic support for MT6572
 SoC
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-9-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-9-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add basic support for the MediaTek MT6572 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/boot/dts/mediatek/mt6572.dtsi | 105 +++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt6572.dtsi b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd12231ca745be7455e99391abd2d708f2f1a8a9
> --- /dev/null
> +++ b/arch/arm/boot/dts/mediatek/mt6572.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Max Shevchenko <wctrl@proton.me>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "mediatek,mt6572";
> +	interrupt-parent = <&sysirq>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		enable-method = "mediatek,mt6589-smp";
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +		};
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x1>;
> +		};
> +	};
> +
> +	system_clk: dummy13m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <13000000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	rtc_clk: dummy32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32000>;
> +		#clock-cells = <0>;
> +	};
> +
> +	uart_clk: dummy26m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <26000000>;
> +		#clock-cells = <0>;
> +	};
> +

Anything that has an MMIO address shall be child of "soc".

soc {
	watchdog@....

	timer@....

	etc.
};

> +	watchdog: watchdog@10007000 {
> +		compatible = "mediatek,mt6572-wdt",
> +			     "mediatek,mt6589-wdt";

those fit in one line:

compatible = "mediatek,mt6572-wdt", "mediatek,mt6589-wdt";

> +		reg = <0x10007000 0x100>;
> +		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_LOW>;
> +		timeout-sec = <15>;
> +		#reset-cells = <1>;
> +	};
> +
> +	timer: timer@10008000 {
> +		compatible = "mediatek,mt6572-timer",
> +			     "mediatek,mt6577-timer";

same

> +		reg = <0x10008000 0x80>;
> +		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&system_clk>, <&rtc_clk>;
> +		clock-names = "system-clk", "rtc-clk";
> +	};
> +
> +	sysirq: interrupt-controller@10200100 {
> +		compatible = "mediatek,mt6572-sysirq",
> +			     "mediatek,mt6577-sysirq";

same; and reg goes after compatible.

> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;

are you sure that interrupt-parent is gic?

> +		reg = <0x10200100 0x1c>;
> +	};
> +
> +	gic: interrupt-controller@10211000 {
> +		compatible = "arm,cortex-a7-gic";

reg here.


> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;

are you sure that the interrupt parent isn't sysirq here? :-)

> +		reg = <0x10211000 0x1000>,
> +		      <0x10212000 0x2000>,
> +		      <0x10214000 0x2000>,
> +		      <0x10216000 0x2000>;
> +	};
> +
> +	uart0: serial@11005000 {
> +		compatible = "mediatek,mt6572-uart",
> +			     "mediatek,mt6577-uart";

fits in one line

> +		reg = <0x11005000 0x400>;
> +		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;

clock-names = .....

> +		status = "disabled";
> +	};
> +
> +	uart1: serial@11006000 {
> +		compatible = "mediatek,mt6572-uart",

...again.

> +			     "mediatek,mt6577-uart";
> +		reg = <0x11006000 0x400>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&uart_clk>;
> +		status = "disabled";
> +	};
> +};
> 

Cheers,
Angelo

