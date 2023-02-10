Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7C3691D7F
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 12:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjBJLCr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 06:02:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjBJLCq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 06:02:46 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84E717168
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 03:02:44 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o18so4699117wrj.3
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 03:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EnqTz1YFzzm355lric6PP3Xk3l60GjJs6A/Opi0T5A=;
        b=ZXaq5KdSHlBXKfBrRY6zyvMfZ3KaFxSBYA99mbg9F/SU1qO2oVTyR8+2ueUD/DhQf0
         lKWXiUL709Htq6HKwxPA0yHNZOqmDV6GJnFYWyIP5LvhopWfoI/t8DPfSuLg4Ys8ykWK
         JA3MMsbWJSNJXg2zPAAl9QZ2QYGEulElXq5JXMFws1lsyFuLIXh4ShIi/qmbNtshI0AQ
         Xowd4+00/LL86CodqQk4slCCIhvB/FSdpRLGrgy1gy1hmFYJKZ/UdeOO3u+O/ES2PVxq
         V/tQCvkfmisOE8kIEiSLDbkc/LH1TsG6xu3EIkpmX8zjv+MZ49mOq7rsl888/MyBVTh4
         542w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EnqTz1YFzzm355lric6PP3Xk3l60GjJs6A/Opi0T5A=;
        b=g2Cip6fDfQNBXIA/To2FtYNDz+YENPUwMwxmiIXUZMhX8RH5A9Ndd7VJfoIWD9W6Gg
         EMYvefLuMrqPIy3WXvOLWk8BavWHC9AfkKCdOxiJXjtFfkUDoJbQEB1HocFX+2f+9t2J
         aw74T34T8lniegENXqG0kwJvrc5KlL7u9Vh2WHvtb4G7kBmEpmdhQhlg7imicvIOIXAu
         X/OklOUUyYemdOzgDjcUH0T4Q3yIpPl/fVozxJ3FUvTfMiGGiM+Y9kpvSmyGrVMN9cgt
         3VtrpQgp5S77mxZDW1u4JA+9PDgj3j9HNdVwXeuLD+kQBoVdaac9RHU5xl0um3IUJ7Nh
         nBog==
X-Gm-Message-State: AO0yUKW3cO4kzIGoFmu/D8/wF+DbuxMeq7lpBvM6qqUDZ9jBXdvkeC5X
        b+Hr2cl7RYJyJuJKUx/J43NCHg==
X-Google-Smtp-Source: AK7set9xnP131W6BXBX3n7EiErBvLgvay/AsVe09DA7FZSxUa2WHmsg0LQjhBIdoU1pd90N59kMalA==
X-Received: by 2002:adf:ee52:0:b0:2bd:e7a0:6b5e with SMTP id w18-20020adfee52000000b002bde7a06b5emr16104273wro.40.1676026963167;
        Fri, 10 Feb 2023 03:02:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d608d000000b002c54b6382c8sm811552wrt.82.2023.02.10.03.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:02:42 -0800 (PST)
Message-ID: <21af8c63-f489-8c3f-e1e3-cf976b1d20d0@linaro.org>
Date:   Fri, 10 Feb 2023 12:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] watchdog: mt7621-wdt: avoid globals and arch
 dependencies
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-4-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210065621.598120-4-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/02/2023 07:56, Sergio Paracuellos wrote:
> MT7621 SoC has a system controller node. Watchdog need to access to reset
> status register. Ralink architecture and related driver are old and from
> the beggining they ar providing some architecture dependent operations
> for accessing this shared registers through 'asm/mach-ralink/ralink_regs.h'
> header file. However this is not ideal from a driver perspective which can
> just access to the system controller registers in am arch independent way
> using regmap syscon APIs. Hence, add a new structure for driver data and
> use it along the code. This way architecture dependencies and global vars
> are not needed anymore. Update Kconfig accordingly to select new added
> dependencies and allow driver to be compile tested.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/watchdog/Kconfig      |   4 +-
>  drivers/watchdog/mt7621_wdt.c | 121 ++++++++++++++++++++++------------
>  2 files changed, 83 insertions(+), 42 deletions(-)
> 


> -
>  static int mt7621_wdt_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
> -	mt7621_wdt_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mt7621_wdt_base))
> -		return PTR_ERR(mt7621_wdt_base);
> +	struct watchdog_device *mt7621_wdt;
> +	struct mt7621_wdt_data *drvdata;
> +	int err;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
>  
> -	mt7621_wdt_reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (!IS_ERR(mt7621_wdt_reset))
> -		reset_control_deassert(mt7621_wdt_reset);
> +	drvdata->sysc = syscon_regmap_lookup_by_phandle(np, "ralink,sysctl");
> +	if (IS_ERR(drvdata->sysc))
> +		return PTR_ERR(drvdata->sysc);

You claim in commit title that you remove some global usage, but you add
here several new features and refactor the code significantly. You need
to split refactorings, improvements from completely new features. The
entire patch is very difficult to understand in current form.

Best regards,
Krzysztof

