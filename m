Return-Path: <linux-watchdog+bounces-2569-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F420D9F14A7
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 19:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F85D280A9B
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 18:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A2C18A6D5;
	Fri, 13 Dec 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3CWLe/u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18DC18660F;
	Fri, 13 Dec 2024 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734113001; cv=none; b=cQZlmNaXDTp4kkgCM1eWRL7sfcENjmsXV4RHtLMlPjpAx8F8hcjdJHlHX342IpBdHrzSX9MpJM7B3TNsMuXTRsvWAHJ91uUfUPXYMP1UBsGMFiYmTdW/9wYZM/heZvsgx1naA5R7gYbt401brS2n3vU5GJ/zm+YTwmAIzNE6bUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734113001; c=relaxed/simple;
	bh=g0f2r9DOolk30FSnQ+OAzCzM/b34pc0RljcoApfTC4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkf58EwAxzrILwFi/to/bSYK91xtQfXDN60tGcdFV6Vhr564bwhCURDWueN/EZ/+4jrp9sP0FXjqjLQMrJrMEvOkhiYevbRuspOQ0y+ctcCVAoAxg8A4U25J5XTeN+SO67XebaXJkHc+mz3zmyFzucht7f9FNPRJYqAAG3Rgvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3CWLe/u; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd49d85f82so1673246a12.3;
        Fri, 13 Dec 2024 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112999; x=1734717799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=F6jMM81flLKy4QRMajRgWR11Tzbfd+NW69qafUSop9c=;
        b=P3CWLe/uhCVOFAkT5Z5ZHHhg6ky5HXoDvAP6GIKltSdIvy8IKWlUD8rfSy8pNBI9/P
         aE4FnSZI9tb+GnpXkCUtfJkHXoYdKhYLxKwrPOjwPnsWtk3DPmfJi6bSor5hRlQf5YS0
         AZIvRxHJWBR5Wj0RHgP2fCXcyWtGp7WLD93yklByd9KJtbFbxUq95L1fsY1lXzHcKD02
         51SdZZ0WqkRcmk4thcY3p3s+WHqs/wmsDTD7kHadNoXprqrVRZRZK6JPK5XOLx6J/RKW
         y2dXf80iM0c3wvz8+debV1qAj9bA/1W8UjYSnquWXase11GjoEykj71AD1t8SFLf4T/X
         v0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112999; x=1734717799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6jMM81flLKy4QRMajRgWR11Tzbfd+NW69qafUSop9c=;
        b=OsBCHsUuJFEEzxrocPEp5qy7x6TRKua072VvNKXebPMr6Q0ki39xzIRu4W0uO/yZqC
         bYMNaDBdu7d9g5+8TeH+f+mO6VsKQftXk0d7xMuAwGNDnoQ6JFVSqILbVDnNdsvetQrg
         b8hE8DaivuEJOcGpY+ssxkDm33HntDtyBQNTb+fMIujkHBSaymet59vlTnHhPCA33bCf
         rntrMTl2uZ5f835Vn1sm9a4JRwcfk+FB0Ss4COAnZRR7EYKaa1ws9OFb4xTS1zEklW9r
         0SliunU11nVKLYyynWAnkw1kprRdqgJTJwX0UfPHdDk8ks/C08fkfIgo2Y21O6JqkLqd
         KxpA==
X-Forwarded-Encrypted: i=1; AJvYcCVRZyRcLqEZkMi5YtTxeVfzCMhnyKNc4llk7fIJv8pfulsh8seqnUEso4ftjTHIdoXDY3w03/1EDqwB23+6iog=@vger.kernel.org, AJvYcCWPz7pBhXFl/2WNaIP1rBIIsGn+5mtguYi/QxBFVTQ9L2N3XQWB5BiYNPSXX/utL5nVl+4yotoMGn7dSss=@vger.kernel.org, AJvYcCXIRP2Elh/Xb2HhqfJYfk9OC3mMUbsgE2zNUY8T6jqxy1F0JEsXp2mWHaSuhB3UADjtKxE6F7wkePd1rot+hX3WCvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPu1PV1yO3A7PRLqQpUrXJJ19b22+DJk8bQExMpcRl4lVvgdgn
	Ww12Yd74dIXvdn+jh4/x6raV8DACeKA1vTo3XSzbHp41pr+txeMR
X-Gm-Gg: ASbGnct+Y5dITwmbF6rS0zwolYuIU3rWLb2qv7ciZ+efPFQkjfJ/0tf2xazcYNeb/Rm
	w67FV5XHAB+o/AI6ZXRrl2j91nE0KHyDvuPwt8gYQByvWEgqol37ELzaQIu2kREjjrNlbtz4tg0
	Cv9wrbbsCJ2SlRjOFcCCRBLmt/puZT452y4U28NeU7QY45QqkFaZS0whPNKQzMYy9IgeP4fXGob
	DF5azDFHHZ+L3vkfWxGPFayIy4Tx/fWoegOJrcB7UBaTjuEBUot/ZbebAt8tG1nfpkz/KeAhcQu
	rsmndPyTUCwRx9vYwXxQS1jtgn6hFQ==
X-Google-Smtp-Source: AGHT+IG7A7M3YjX6+06+tv2Zfdp1aGAJkbcwwTaLRtBDDGmepQ2IUkuXRqoHUrmq9sEkhz+1WcWPCA==
X-Received: by 2002:a17:90b:5284:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f28fa54f36mr5120363a91.6.1734112998960;
        Fri, 13 Dec 2024 10:03:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e705f0sm442915ad.265.2024.12.13.10.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 10:03:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d3e6f12-7cea-45ce-b1e2-c1fda94b92cd@roeck-us.net>
Date: Fri, 13 Dec 2024 10:03:14 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] watchdog: rzv2h_wdt: Add support to retrieve the
 bootstatus information
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241213174419.908525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 09:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the RZ/V2H(P) SoC we can determine if the current boot is due to
> `Power-on-Reset` or due to the `Watchdog`. The information used to
> determine this is present on the CPG block.
> 
> The CPG_ERROR_RSTm(m = 2 -8 ) registers are set in response to an error
> interrupt causing an reset. CPG_ERROR_RST2[ERROR_RST1] is set if there
> was an underflow/overflow on WDT1 causing an error interrupt.
> 
> To fetch this information from CPG block `syscon` is used and bootstatus
> field in the watchdog device is updated based on the
> CPG_ERROR_RST2[ERROR_RST1] bit. Upon consumig CPG_ERROR_RST2[ERROR_RST1]
> bit we are also clearing it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> @Geert, I intend to drop WDT0/2/3 nodes (and related clocks) as HW manual
> says WDT1 is for CA55 (I'll first confirm this internally)
> 
> Hi Geert/Rob,
> 
> I havent included a binding changes as part of the RFC as I wanted to get
> some initial feedback on the implementation. Currently CPG block doesnt
> have the "syscon" this patch has been tested with below diff to SoC DTSI
> 
> Cheers,
> Prabhakar
> 
> Changes to SoC DTSI:
> @@ -243,7 +243,7 @@ pinctrl: pinctrl@10410000 {
>                  };
> 
>                  cpg: clock-controller@10420000 {
> -                       compatible = "renesas,r9a09g057-cpg";
> +                       compatible = "renesas,r9a09g057-cpg", "syscon";
>                          reg = <0 0x10420000 0 0x10000>;
>                          clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
>                          clock-names = "audio_extal", "rtxin", "qextal";
> @@ -455,6 +456,7 @@ wdt1: watchdog@14400000 {
>                          clock-names = "pclk", "oscclk";
>                          resets = <&cpg 0x76>;
>                          power-domains = <&cpg>;
> +                       syscon = <&cpg>;
>                          status = "disabled";
>                  };
> 
> ---
>   drivers/watchdog/rzv2h_wdt.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 8defd0241213..8e0901bb7d2b 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -4,14 +4,17 @@
>    *
>    * Copyright (C) 2024 Renesas Electronics Corporation.
>    */
> +#include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>   #include <linux/reset.h>
>   #include <linux/units.h>
>   #include <linux/watchdog.h>
> @@ -40,6 +43,10 @@
>   
>   #define WDT_DEFAULT_TIMEOUT	60U
>   
> +#define CPG_ERROR_RST2			0xb40
> +#define CPG_ERROR_RST2_ERR_RST1		BIT(1)
> +#define CPG_ERROR_RST2_ERR_RST1_WEN	(BIT(1) << 16)

I could understand BIT(17) or BIT(1 + 16) or

#define CPG_ERROR_RST2_ERR_RST1_BIT	1
#define CPG_ERROR_RST2_ERR_RST1		BIT(CPG_ERROR_RST2_ERR_RST1_BIT)
#define CPG_ERROR_RST2_ERR_RST1_WEN	BIT(CPG_ERROR_RST2_ERR_RST1_BIT + 16)

but "BIT(1) << 16" really does not add value.

> +
>   static bool nowayout = WATCHDOG_NOWAYOUT;
>   module_param(nowayout, bool, 0);
>   MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> @@ -135,7 +142,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
>   }
>   
>   static const struct watchdog_info rzv2h_wdt_ident = {
> -	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT,
> +	.options = WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_CARDRESET,
>   	.identity = "Renesas RZ/V2H WDT Watchdog",
>   };
>   
> @@ -207,12 +214,29 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct rzv2h_wdt_priv *priv;
> +	struct regmap *regmap;
> +	unsigned int buf;

That is a bad variable name since it suggests a buffer, not some
register content.

>   	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>   
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +

That is a change in behavior. Up to now the syscon phandle did not have to exist
for the driver to work. Is it guaranteed to not result in regressions on systems
where it doesn't ? Also, is this documented ? I don't seem to be able to find it.

> +	ret = regmap_read(regmap, CPG_ERROR_RST2, &buf);
> +	if (ret)
> +		return -EINVAL;

Pass error codes back to caller. This is most definitely not an
"Invalid argument".

"
> +
> +	if (buf & CPG_ERROR_RST2_ERR_RST1) {
> +		ret = regmap_write(regmap, CPG_ERROR_RST2,
> +				   CPG_ERROR_RST2_ERR_RST1_WEN | CPG_ERROR_RST2_ERR_RST1);
> +		if (ret)
> +			return -EINVAL;

Same as above.

> +	}
> +
>   	priv->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->base))
>   		return PTR_ERR(priv->base);
> @@ -243,6 +267,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
>   	priv->wdev.info = &rzv2h_wdt_ident;
>   	priv->wdev.ops = &rzv2h_wdt_ops;
>   	priv->wdev.parent = dev;
> +	priv->wdev.bootstatus = buf & CPG_ERROR_RST2_ERR_RST1 ? WDIOF_CARDRESET : 0;
>   	watchdog_set_drvdata(&priv->wdev, priv);
>   	watchdog_set_nowayout(&priv->wdev, nowayout);
>   	watchdog_stop_on_unregister(&priv->wdev);


