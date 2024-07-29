Return-Path: <linux-watchdog+bounces-1439-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF26940034
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 23:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 133E8B20FE5
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2024 21:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A048A18C35F;
	Mon, 29 Jul 2024 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gWSBo/Lr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CED18757E;
	Mon, 29 Jul 2024 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722287546; cv=none; b=GGbBJyFrSe5GFJRiPJme/NuoowzEWCb86yjM2+GyDyYiw6ZoUoj2PuP2A9T7xjzCfI1PGbhODePHqZOrK7eTi9GdzcJacOFprRqMnC0jxDA4kkQOcGCICpFE/yKWJz9nHwNzhl2XqMER3er7nuXNLDyaBjugj8ftl4q7dMuRy/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722287546; c=relaxed/simple;
	bh=qlcx5W/hA/5ds8eayzREuqxkMSTiTYrLEf7wdSsA3b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qowt9EWSdzifWvFbkmmi9u5tThYYebICX1AC58Z8MkvjBqPthiUijHH1HBqT5Fx9fNM7WJe6KCMhkZ9CARPvJwrr0daQCXJyXZysRLxE9ARy0xrnePcsN5EODnJEca6YKkn4qr76jmSuinMHkEa2GK1tsmOcjm3PVuTqrIWHFpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gWSBo/Lr; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id YXfBsaOw3HEYLYXfBsmtfD; Mon, 29 Jul 2024 23:12:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722287535;
	bh=2c3r0TGUUeWE1cSnwvw2dWtfrpEhdSnXNu8hNYYGVVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gWSBo/LrvBODA1zB8pA0yfgOhrJ8pPtlV6rQUvfYnXuKwmwKXSOFAxlRkGAcDiAnZ
	 Z33mciV9iOcNzQ3e+xBjMu4UxYKkIccuQlrNf15e7Hd7J8PHLAxKev1bciftqoUM0D
	 ZvS3VxzoDXRqKVvRk85Kynh0V9AD3AYUSVKsrCW/hXMQTf7GkU92wi9ytT8rCt7NZp
	 whVzBPMMd1d4tgcBjohcwf0PUXBbWVyxVAMstPs/vjgPW+jAG0Xj2DcDYxiMRCf1U1
	 wF1Zk83ec2Q6d7va8CWLm1sc1JcBwCZ6UGLRQmYSWDQvqQP4CoIj+sYragualFDOeF
	 Ryy1/3fTV40tw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 29 Jul 2024 23:12:15 +0200
X-ME-IP: 90.11.132.44
Message-ID: <716b9d31-f978-4384-b605-64896f8b2643@wanadoo.fr>
Date: Mon, 29 Jul 2024 23:12:13 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux@roeck-us.net, s.hauer@pengutronix.de, shawnguo@kernel.org,
 wim@linux-watchdog.org, ye.li@nxp.com
References: <20240729200601.1995387-1-Frank.Li@nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240729200601.1995387-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/07/2024 à 22:06, Frank Li a écrit :
> Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> difference compatible string.
> 
> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> post_rcs_wait.
> 
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Signed-off-by: Alice Guo <alice.guo-3arQi8VN3Tc@public.gmane.org>
> Reviewed-by: Ye Li <ye.li-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Frank Li <Frank.Li-3arQi8VN3Tc@public.gmane.org>
> ---
> Chagne from v3 to v4:
> - Go back to v2 according to Guenter's feedback
> Change from v2 to v3:
> - Set post_rcs_wait to false explicitly to maintain code consistency
> - Add Guenter review tag.
> Change from v1 to v2:
> - Combine to one patch
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 94914a22daff7..3a75a6f98f8f0 100644
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
> @@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
>   static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
>   	.prescaler_enable = false,
>   	.wdog_clock_rate = 1000,
> +	.post_rcs_wait = true,
> +};
> +
> +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> +	.prescaler_enable = false,
> +	.wdog_clock_rate = 1000,
>   };
>   
>   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> @@ -411,7 +408,7 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>   };
>   
>   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
> +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },

Nitpick: while touching something here, should imx8ulp be after imx7ulp?

CJ

>   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
>   	{ /* sentinel */ }


