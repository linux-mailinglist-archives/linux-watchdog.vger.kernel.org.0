Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB92454779
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 14:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbhKQNin (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 08:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237733AbhKQNif (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 08:38:35 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E26C061570;
        Wed, 17 Nov 2021 05:35:37 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso4703607otj.11;
        Wed, 17 Nov 2021 05:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yU6J6b4I0GnzSkJyPIBqg7t1SiLgsK7hY4lpYo1B90g=;
        b=j8PxxmJnLl5UmLSbjAPHfXh55JGCbGIkF+nr+BvR8loMUowF2ih8ZTzs5L/WWfHiLC
         HJVpjux79EsPpbEkBzudUkZC3FAfUlJorfg594toAcbw7McBjhRvmrQ9V7s+4wog80Md
         tCvNgM34QyyEaGQthBq5wSYmknhcIZB9DhQbs2w5rrYkXBcgoLEU1mN2qp0Ga+hq0OT+
         s0KBx6bFvP6mF4T062RWJrhQhqqGBVXE12YHxrtYGAYSn85mBdq4YEJT8gQHfQaQBAXh
         nsfGHEmVUAL5XPiCiJIiT9xOx4p3PxBJNshF1jnBaVheipgC6d+uFkekZMad2gG08TGO
         ywSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yU6J6b4I0GnzSkJyPIBqg7t1SiLgsK7hY4lpYo1B90g=;
        b=uDjW5a3r3nLaIJp098jXmIUxWixyk2obSQP5fn3/lRDEKPpcKKnEOGqzRx0lxno51M
         S5C6C4hlEIde8E5jpFsuZ0DQ9szDzZZGB0XZ3WdvvrFO7l5Fq2X+Y/yEc6nbQ0+/RRCP
         luUy9un7YCENQ6yakwAhWIYJT/uMVvDNNTqbQQcvrES4NSWankU5q93rN2H0eXlr3o/T
         xgz5hOVrVj49yDsOLlqEc3bdFWAVs89AnWjdl+MnZ8RnZSBfTZqKqyN9FVhBCxfjjdcc
         njEpLYgEXjbIgEkunRkaGt3Zt2o1kXOvZwIQdbi0GSSMiPHBl9H1D+t8yGZWndGpE3vK
         f3bA==
X-Gm-Message-State: AOAM530yWRrh+0LqVHm3S/VmyZ9t3KnIbW9spRuCNF5AYFiMMzbVIglI
        Pr/7bTSgv0D9ISnVLIMPC1U=
X-Google-Smtp-Source: ABdhPJzZ8toWxFYlnqdPfYBpEdQQOIdqBTBrdoKSjaxwAsXxrGB+KxZy+H4QfDCD1o49jgOAuZjGeg==
X-Received: by 2002:a9d:61d4:: with SMTP id h20mr13663068otk.202.1637156136712;
        Wed, 17 Nov 2021 05:35:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2sm4255407oik.11.2021.11.17.05.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 05:35:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 Nov 2021 05:35:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 06/12] watchdog: s3c2410: Extract disable and mask
 code into separate functions
Message-ID: <20211117133535.GF2435591@roeck-us.net>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-7-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211107202943.8859-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 07, 2021 at 10:29:37PM +0200, Sam Protsenko wrote:
> The s3c2410wdt_mask_and_disable_reset() function content is bound to be
> changed further. Prepare it for upcoming changes by splitting into
> separate "mask reset" and "disable reset" functions. But keep
> s3c2410wdt_mask_and_disable_reset() function present as a facade.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v3:
>   - Added R-b tag by Krzysztof Kozlowski
> 
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 54 ++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 2cc4923a98a5..4ac0a30e835e 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -202,37 +202,53 @@ static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
>  	return container_of(nb, struct s3c2410_wdt, freq_transition);
>  }
>  
> -static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> +static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
>  {
> +	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
> +	const u32 val = mask ? mask_val : 0;
>  	int ret;
> -	u32 mask_val = 1 << wdt->drv_data->mask_bit;
> -	u32 val = 0;
>  
> -	/* No need to do anything if no PMU CONFIG needed */
> -	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG))
> -		return 0;
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->disable_reg,
> +				 mask_val, val);
> +	if (ret < 0)
> +		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
>  
> -	if (mask)
> -		val = mask_val;
> +	return ret;
> +}
>  
> -	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> -		ret = regmap_update_bits(wdt->pmureg,
> -					 wdt->drv_data->disable_reg, mask_val,
> -					 val);
> -		if (ret < 0)
> -			goto error;
> -	}
> +static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
> +{
> +	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
> +	const u32 val = mask ? mask_val : 0;
> +	int ret;
>  
> -	ret = regmap_update_bits(wdt->pmureg,
> -			wdt->drv_data->mask_reset_reg,
> -			mask_val, val);
> - error:
> +	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
> +				 mask_val, val);
>  	if (ret < 0)
>  		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
>  
>  	return ret;
>  }
>  
> +static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
> +{
> +	int ret;
> +
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
> +		ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
> +		ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> -- 
> 2.30.2
> 
