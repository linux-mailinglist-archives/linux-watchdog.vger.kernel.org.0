Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C371AEC1F
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Apr 2020 13:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgDRLp6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 Apr 2020 07:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgDRLp5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 Apr 2020 07:45:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D83CC061A0C;
        Sat, 18 Apr 2020 04:45:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d17so2497520pgo.0;
        Sat, 18 Apr 2020 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ylc5M7sw+HWiIs0q6fyrt/to4HU1Qc4sKAQcHensuj8=;
        b=UH6w1nvLI4IwQ05+BUW7RuAytUKZYaDSeYmYl1Cy1tPmsLfShtQm5x3c6e4iK/fy4t
         uv2Avp3gfGZuqmF1zbyNPBNfoFb/rDOSBp3QO4uL6qFKHKSfvOyH7EmPi6CWuNdrNH+k
         kUmj4Ncu38khFi8gaXfBOqkNVRlhShEr8rysUJwPsnNfypWRir8JM8IbmN6wsb7l54NT
         qe9COPMNicEWFBvLbSxEzIwGd20s19CiCZ4m32HimZl9Bw3FeP3L4JbV0sELhGNRK4qC
         kFkvY9iC9wJQ0oRQ5BZfgJY8a272YLiju0fGjBdUHyK2X6dZrYmxkneHhUTyotA7Ui7R
         DnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ylc5M7sw+HWiIs0q6fyrt/to4HU1Qc4sKAQcHensuj8=;
        b=NnAnk0zmxDdRNs+Mjptmwyyxsi/8GEGLP4zvfFRm+vsrb6SqAYudu8+mUKmkVmSq2b
         Wu86ljy/HM33HAhh8gdE4Bn5j7jMvB+8vx3x0hYrtvABx2AvHnvwZrL0hiTWXOPB6T4Y
         9raQGXF6OPLPY2OG3IY0S+nfZrJ1ZZR+Md/+7kCC3aMV7QtTUjeURsbvltZ+rcnNZxeJ
         0r+K7NFTgiu1bpZPXaja4Ar3SI5jbQtznh2AZLnPq7vCJjQbizSK6zWfBPAAee8FrHtx
         2qynLOwwT0bqwhMCExWlPORvX1ysEuk53xNJEmr62wcAW4c0Ru5JKprtvi4YFwaGGCIv
         V4nQ==
X-Gm-Message-State: AGi0PuZUh9+JaSast3udkwaQZjZPN3VkEv3dq9+Es3kbj0ER+vUoE6XN
        xUBJuzGr0/i18JALoyob9xHJII9m
X-Google-Smtp-Source: APiQypJQYNnayE4a3+w8IRr0noorqwFC6t/WdIIgbmiZgXD7W0qQe4bCUNktWwwRIWY1UKKjxWu24A==
X-Received: by 2002:a63:e942:: with SMTP id q2mr7511050pgj.34.1587210356961;
        Sat, 18 Apr 2020 04:45:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15sm10238171pfe.92.2020.04.18.04.45.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Apr 2020 04:45:56 -0700 (PDT)
Date:   Sat, 18 Apr 2020 04:45:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@mellanox.com
Cc:     wim@linux-watchdog.org, andy@infradead.org, dvhart@infradead.org,
        linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com
Subject: Re: [PATCH v1 3/4] watchdog: mlx-wdt: support new watchdog type with
 longer timeout period
Message-ID: <20200418114555.GA103392@roeck-us.net>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
 <20200416163514.7334-4-michaelsh@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416163514.7334-4-michaelsh@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Apr 16, 2020 at 07:35:13PM +0300, michaelsh@mellanox.com wrote:
> From: Michael Shych <michaelsh@mellanox.com>
> 
> New programmable logic device can have watchdog type 3 implementation.
> It's same as Type 2 with extended maximum timeout period.
> Maximum timeout is up-to 65535 sec.
> Type 3 HW watchdog implementation can exist on all Mellanox systems.
> It is differentiated by WD capability bit.
> 
> Signed-off-by: Michael Shych <michaelsh@mellanox.com>
> 
Stray empty line.

> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/watchdog/mlx_wdt.c | 75 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
> index 03b9ac4b99af..c6d81a3d4587 100644
> --- a/drivers/watchdog/mlx_wdt.c
> +++ b/drivers/watchdog/mlx_wdt.c
> @@ -21,6 +21,7 @@
>  #define MLXREG_WDT_CLOCK_SCALE		1000
>  #define MLXREG_WDT_MAX_TIMEOUT_TYPE1	32
>  #define MLXREG_WDT_MAX_TIMEOUT_TYPE2	255
> +#define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
>  #define MLXREG_WDT_MIN_TIMEOUT		1
>  #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
>  				 WDIOF_SETTIMEOUT)
> @@ -49,6 +50,7 @@ struct mlxreg_wdt {
>  	int tleft_idx;
>  	int ping_idx;
>  	int reset_idx;
> +	int regmap_val_sz;
>  	enum mlxreg_wdt_type wdt_type;
>  };
>  
> @@ -111,7 +113,8 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
>  	u32 regval, set_time, hw_timeout;
>  	int rc;
>  
> -	if (wdt->wdt_type == MLX_WDT_TYPE1) {
> +	switch (wdt->wdt_type) {
> +	case MLX_WDT_TYPE1:
>  		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
>  		if (rc)
>  			return rc;
> @@ -120,14 +123,33 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
>  		regval = (regval & reg_data->mask) | hw_timeout;
>  		/* Rowndown to actual closest number of sec. */
>  		set_time = BIT(hw_timeout) / MLXREG_WDT_CLOCK_SCALE;
> -	} else {
> +		rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> +		break;
> +	case MLX_WDT_TYPE2:
> +		set_time = timeout;
> +		rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
> +		break;
> +	case MLX_WDT_TYPE3:
> +		/* WD_TYPE3 has 2B set time register */
>  		set_time = timeout;
> -		regval = timeout;
> +		if (wdt->regmap_val_sz == 1) {
> +			timeout = cpu_to_le16(timeout);
> +			regval = timeout & GENMASK(7, 0);
> +			rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> +			if (!rc) {
> +				regval = ror32((timeout & GENMASK(15, 8)), 8);
> +				rc = regmap_write(wdt->regmap,
> +						reg_data->reg + 1, regval);
> +			}

This code seems odd. I can understand if the destination is of fixed endianness,
ie either little or big ended. If that was the case, writing timeout & 0xff into
data->reg and then writing timeout >> 8 into reg_data->reg+1 would make sense.
But that isn't what is done here. On a big endian system, data->reg will get
the upper 8 bit and data->reg+1 will get the lower 8 bit. This implies that
the target would in that case be big endian. Is this really what is intended ?
Is it guaranteed that the host byte order always matches the device byte order ?

Also, why use something as complicated as ror32 instead of a simple >> 8 ?
And using "GENMASK(7,0)" for 0xff is for sure possible but seems overly
complicated to me.

> +		} else {
> +			rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
>  	}
>  
>  	wdd->timeout = set_time;
> -	rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> -
>  	if (!rc) {
>  		/*
>  		 * Restart watchdog with new timeout period
> @@ -147,10 +169,26 @@ static unsigned int mlxreg_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
>  	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
>  	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->tleft_idx];
> -	u32 regval;
> +	u32 regval, msb, lsb, reg = reg_data->reg;
>  	int rc;
>  
> -	rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
> +	if (wdt->wdt_type == MLX_WDT_TYPE2) {
> +		rc = regmap_read(wdt->regmap, reg, &regval);
> +	} else {
> +		/* WD_TYPE3 has 2 byte timeleft register */
> +		if (wdt->regmap_val_sz == 1) {
> +			rc = regmap_read(wdt->regmap, reg, &lsb);
> +			if (!rc) {
> +				rc = regmap_read(wdt->regmap, ++reg, &msb);

FWIW, incrementing reg only serves a purpose if the incremented value is
actually used. That is not the case here, so this only makes the code
more complicated and risky. Besides, it is inconsistent with the code
above which directly uses reg_data->reg.

> +				regval = rol32((msb & GENMASK(7, 0)), 8) |
> +						(lsb & GENMASK(7, 0));
> +				regval = le16_to_cpu(regval);

Same question as above. Worse, this code explicitly puts "lsb" into bit 0..7
of regval, and msb into bit 8..15. Then it takes that value as little endian
value (even though, at least according to lsb/msb variable names, it is
already in host byte order) and swaps the two bytes.

I'd really like to see this code tested on a big endian system.

> +			}
> +		} else {
> +			rc = regmap_read(wdt->regmap, reg, &regval);

... or maybe someone can point me to a regmap definition with 16-bit value
size for comparison/validation.

> +		}
> +	}
> +
>  	/* Return 0 timeleft in case of failure register read. */
>  	return rc == 0 ? regval : 0;
>  }
> @@ -212,13 +250,23 @@ static void mlxreg_wdt_config(struct mlxreg_wdt *wdt,
>  		wdt->wdd.info = &mlxreg_wdt_aux_info;
>  
>  	wdt->wdt_type = pdata->version;
> -	if (wdt->wdt_type == MLX_WDT_TYPE2) {
> -		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> -		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
> -	} else {
> +	switch (wdt->wdt_type) {
> +	case MLX_WDT_TYPE1:
>  		wdt->wdd.ops = &mlxreg_wdt_ops_type1;
>  		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE1;
> +		break;
> +	case MLX_WDT_TYPE2:
> +		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> +		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
> +		break;
> +	case MLX_WDT_TYPE3:
> +		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> +		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE3;
> +		break;
> +	default:
> +		break;
>  	}
> +
>  	wdt->wdd.min_timeout = MLXREG_WDT_MIN_TIMEOUT;
>  }
>  
> @@ -249,6 +297,11 @@ static int mlxreg_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->wdd.parent = dev;
>  	wdt->regmap = pdata->regmap;
> +	rc = regmap_get_val_bytes(wdt->regmap);
> +	if (rc <= 0)
> +		return -EINVAL;

It seems to me that val_bytes == 0 does not really make any sense.
Does it really add value to check for that instead of just returning
any errors ?

> +
> +	wdt->regmap_val_sz = rc;
>  	mlxreg_wdt_config(wdt, pdata);
>  
>  	if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
> -- 
> 2.11.0
> 
