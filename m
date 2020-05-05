Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39CD1C5CFA
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 18:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgEEQH1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 12:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgEEQH1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 12:07:27 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A21AC061A0F;
        Tue,  5 May 2020 09:07:27 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so1365579pjb.3;
        Tue, 05 May 2020 09:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jmQbNiJc4Rt7W+n9x3IKtdD5p4Uz4lxzRqmcMyvQAOc=;
        b=EKYHfM0W5nbH/CN2y59v8WgMXSLwr5dY5zl5WgdL4s37QGSLZxsAeG2NkjitAcfKg+
         jk27p0A+bZA4WoqUxGokpLvssmAGsP4P74y1MNSxVGILCk+9nil7QimPm2QmLmUT6QFb
         w+bS4J023InaZBOUdcYm8IfqsWQH5ahFH3iVTFfHICm+bh9bL5yjGcMnmFqRSsHi2ilN
         iuONDcz6dA9YZvjqaArC0uDcDRk+WdC4ZNwQgcj2y9TSDB0svXH8ErDqURy2zxrPOUYc
         aU/NonfUGRFACsuzbQWY5aljijIQk7E/+bZaAix/RC8/VCYUA5KWORg44vpw+DXC7CxM
         cm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jmQbNiJc4Rt7W+n9x3IKtdD5p4Uz4lxzRqmcMyvQAOc=;
        b=JPvo2z7wBtV0JuLC8ZlP4YQuciOPR8ObaKu27fiFfAEei6oUGC1jtAcg1dHc+Zcga/
         fzrcn4AiassSZYP4Ii/MR+DOIiS6y/xpupeX4zlTlE5t+oznbjk7Rj+rOXS+ubWXGNVY
         5ewI8X4c/S2YxMajPAcPKRWe2OEi7lqela0dERoJtjHsLKD4YHWo/yBoqZoAZcgD+pVT
         9I1u6CEg2sb/BuX6M10yTwcTQN7xBr7Me7iRbMlXFGqwIHA37iK6QNdgjZdTcI8uTF0R
         YESmqj9j5cWyxKkXHS/jf1/8PMxHgfusRNvWYyjFTbOdKM3VqiqK9CTPf2obM1OgRzbO
         N08Q==
X-Gm-Message-State: AGi0PuYtKEv1mVYxVSAtGjiLboVD+ANZZsW5RgCojuRJBQ9aCVvx5Lud
        YHb2MPczICpRrc+MsVGCK8Q=
X-Google-Smtp-Source: APiQypLJeVmZrmmGnBtcok3OQ1MW3t4M+5OK0UnluK2XMGwVYRBx0RfEIaRHEOjLQDneiz7Flh8Kvg==
X-Received: by 2002:a17:902:eb43:: with SMTP id i3mr3273707pli.299.1588694846521;
        Tue, 05 May 2020 09:07:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 138sm2388782pfz.31.2020.05.05.09.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 09:07:25 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] watchdog: mlx-wdt: support new watchdog type with
 longer timeout period
To:     michaelsh@mellanox.com, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com
References: <20200504141427.17685-1-michaelsh@mellanox.com>
 <20200504141427.17685-4-michaelsh@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <366b5f85-9468-44ac-ece9-da21ae4b55e5@roeck-us.net>
Date:   Tue, 5 May 2020 09:07:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504141427.17685-4-michaelsh@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/4/20 7:14 AM, michaelsh@mellanox.com wrote:
> From: Michael Shych <michaelsh@mellanox.com>
> 
> New programmable logic device can have watchdog type 3 implementation.
> It's same as Type 2 with extended maximum timeout period.
> Maximum timeout is up-to 65535 sec.
> Type 3 HW watchdog implementation can exist on all Mellanox systems.
> It is differentiated by WD capability bit.
> 
> Signed-off-by: Michael Shych <michaelsh@mellanox.com>
> Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1-v2:
> Make changes pointed out by Guenter:
> -Simplify bit operations
> -Consistency in registers access
> -Don't check irrelevant return code
> ---
> v2-v3
> Remove unnecessary cpu_to_le16 and vice versa conversions
> ---
>  drivers/watchdog/mlx_wdt.c | 73 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
> index 03b9ac4b99af..54193369e85c 100644
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
> @@ -120,14 +123,32 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
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
> +			regval = timeout & 0xff;
> +			rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> +			if (!rc) {
> +				regval = (timeout & 0xff00) >> 8;
> +				rc = regmap_write(wdt->regmap,
> +						reg_data->reg + 1, regval);
> +			}
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
> @@ -147,10 +168,25 @@ static unsigned int mlxreg_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
>  	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
>  	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->tleft_idx];
> -	u32 regval;
> +	u32 regval, msb, lsb;
>  	int rc;
>  
> -	rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
> +	if (wdt->wdt_type == MLX_WDT_TYPE2) {
> +		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
> +	} else {
> +		/* WD_TYPE3 has 2 byte timeleft register */
> +		if (wdt->regmap_val_sz == 1) {
> +			rc = regmap_read(wdt->regmap, reg_data->reg, &lsb);
> +			if (!rc) {
> +				rc = regmap_read(wdt->regmap,
> +						reg_data->reg + 1, &msb);
> +				regval = (msb & 0xff) << 8 | (lsb & 0xff);
> +			}
> +		} else {
> +			rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
> +		}
> +	}
> +
>  	/* Return 0 timeleft in case of failure register read. */
>  	return rc == 0 ? regval : 0;
>  }
> @@ -212,13 +248,23 @@ static void mlxreg_wdt_config(struct mlxreg_wdt *wdt,
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
> @@ -249,6 +295,11 @@ static int mlxreg_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->wdd.parent = dev;
>  	wdt->regmap = pdata->regmap;
> +	rc = regmap_get_val_bytes(wdt->regmap);
> +	if (rc < 0)
> +		return -EINVAL;
> +
> +	wdt->regmap_val_sz = rc;
>  	mlxreg_wdt_config(wdt, pdata);
>  
>  	if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
> 

