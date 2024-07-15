Return-Path: <linux-watchdog+bounces-1387-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A99319ED
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 20:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B8A1C21E7C
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 18:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE9C4643B;
	Mon, 15 Jul 2024 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6QgUGDE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB933987;
	Mon, 15 Jul 2024 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066470; cv=none; b=Rmf7STuGcLE3cr1t6o3xrmfTfwnss+6dOVQzQ+NLPEhABykk6eDAHLstuIhr96UeN41T7oiBtsW7DlMS2bGFDkFD6Fh0Q4VnJ1M3BSWIgmP9L10FSRsXvRbMbXPOX4WuHMC6Bt5LpNTOfkKWzxz6N6IkQ/EUQ6bkaiymk6qopeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066470; c=relaxed/simple;
	bh=BcyPQ0Hj8u9GJvpamxo1r3Jm4m2qApmFxC5M2AK53WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNQ3rNR4CQjhzbAcRZUf8E41CPDS7zLJO6gpCLWbzlR+VadQ07TsUAowtLXv9E5tFd9O7QOOBVqO3b7lX6d0Hibs4eoljGGqyCeOXAG4cRtCTS7idkV8z/VSU/8fxsn2iSrRyG4FImgXsyCitxuzWwwgs54XdI1KtUNT/BGibQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6QgUGDE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70aec66c936so3345873b3a.0;
        Mon, 15 Jul 2024 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721066467; x=1721671267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+h7WH+E6mlrKsMBP9aO9Jw1AWxzVauLZHBjsy6ZfU0w=;
        b=P6QgUGDEyw7FP0zVGCdyI6VimD0oAq6d/WU4j33shu5cD6qM827jPhXOePAfao1Bid
         IX404O6DBBCbKxlN+SSqAXE7hFLLRr8CKj/81yOJV50Emxzr8ZiY0holzWymcafHnvBh
         aoUz61l0Y7Bv+mZtHE8+5R9NE1MV9p8puWogKmIuIYhyy7xyKTJtx/HGadkUg0yWIQ0S
         O1YSlu3zNk3OxPZiQYoSVJw9ilJKIdeDtuinZz8GYmmZh4RR2OQSjhLErJgyMvD73Ccw
         JEak01q1GQRajz6plfAWBM6tqrj95et5qyWvIvfe+zcP42TxgUQ+HjvuW+dGw/O0bY1D
         zREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721066467; x=1721671267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h7WH+E6mlrKsMBP9aO9Jw1AWxzVauLZHBjsy6ZfU0w=;
        b=OlpXuYcFD5hTKZWFzthemIQAuo+xoMhGYLT+WOVM5BTdoYlN7dMxkaOU9J8FKkpNdX
         jzX9NCpuXC3LXR7YEwMmgRapoMfJMayRjdySREOKdlCpY07/NopO+0yyC3UcBGvNFUJh
         RHfkNYKhaTykgwHF04tRRj5MQxkEOyGw7X267ihpdaSxwxPCfizyHd73LJNRRcdqZiyd
         rI57VT6NM4cLkvRuMXYR9pkitN9kfiP/8VxXYCg1sRY7kmfLfjDfB2lLEF1JihT7UxWI
         +UrGeshL5KxwBrH5q52YABOX8TY4B19jOvGWxCfsl8xBOQgTaMM8XFsRA+FeBf6KS53m
         loZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIMtJ+8cF9u01zcUpzRifmkRvlzU2zx8ALnTT9iRzPmyTIQRxVWh4Wv3MvEMg8A/+jzl1DysmDjOW3mpX5LWgYXi/vCkScovndoye1Tuu+vfCQRU6lwKG9SYhwxwT8sh0/aHjuXbNETj0lWtk=
X-Gm-Message-State: AOJu0YwdGwlitAjiOzoVr7GWuyKR48rmnr4Zwd8435RnHHY+U8UDMQdt
	MwwjPbDQCDJPHxirRlTo2DOXeBQ7tyBZMjDO9GDwPW1XfRcEJ5Wd
X-Google-Smtp-Source: AGHT+IHC5bMiW2MzoXPLdvYkW+PZnFqyLJJu7/s2px3zxWmln+cxA3JommrImWXDVcepOSrqpEBa6w==
X-Received: by 2002:a05:6a00:4b04:b0:70b:8190:d555 with SMTP id d2e1a72fcca58-70ba4925d8bmr488476b3a.32.1721066467301;
        Mon, 15 Jul 2024 11:01:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc988dsm4690746b3a.198.2024.07.15.11.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 11:01:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ae98ea1-23a4-4e0f-9a1c-62eed84b42ef@roeck-us.net>
Date: Mon, 15 Jul 2024 11:01:04 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
 ye.li@nxp.com
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240715170717.2490688-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/24 10:07, Frank Li wrote:
> Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
> for different compatible strings
> 
> i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
> done. Set post_rcs_wait to false explicitly to maintain code consistency.
> 

Why ? That is not necessary and typically frowned upon for static variables.

> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Please drop. I did not approve this change.

Guenter

> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - Set post_rcs_wait to false explicitly to maintain code consistency
> - Add Guenter review tag.
> Change from v1 to v2
> - Combine to one patch
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 94914a22daff7..a4aa02f388b15 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   
>   struct imx_wdt_hw_feature {
>   	bool prescaler_enable;
> +	bool post_rcs_wait;
>   	u32 wdog_clock_rate;
>   };
>   
> @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
>   	struct watchdog_device wdd;
>   	void __iomem *base;
>   	struct clk *clk;
> -	bool post_rcs_wait;
>   	bool ext_reset;
>   	const struct imx_wdt_hw_feature *hw;
>   };
> @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
>   		ret = -ETIMEDOUT;
>   
>   	/* Wait 2.5 clocks after RCS done */
> -	if (wdt->post_rcs_wait)
> +	if (wdt->hw->post_rcs_wait)
>   		usleep_range(wait_min, wait_min + 2000);
>   
>   	return ret;
> @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>   	/* The WDOG may need to do external reset through dedicated pin */
>   	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
>   
> -	imx7ulp_wdt->post_rcs_wait = true;
> -	if (of_device_is_compatible(dev->of_node,
> -				    "fsl,imx8ulp-wdt")) {
> -		dev_info(dev, "imx8ulp wdt probe\n");
> -		imx7ulp_wdt->post_rcs_wait = false;
> -	} else {
> -		dev_info(dev, "imx7ulp wdt probe\n");
> -	}
> -
>   	wdog = &imx7ulp_wdt->wdd;
>   	wdog->info = &imx7ulp_wdt_info;
>   	wdog->ops = &imx7ulp_wdt_ops;
> @@ -402,16 +393,24 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
>   
>   static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
>   	.prescaler_enable = false,
> +	.post_rcs_wait = true,
> +	.wdog_clock_rate = 1000,
> +};
> +
> +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> +	.prescaler_enable = false,
> +	.post_rcs_wait = false,
>   	.wdog_clock_rate = 1000,
>   };
>   
>   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>   	.prescaler_enable = true,
> +	.post_rcs_wait = false,
>   	.wdog_clock_rate = 125,
>   };
>   
>   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
> +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
>   	{ /* sentinel */ }


