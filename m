Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9157C5FA0
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Oct 2023 23:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235175AbjJKVyd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Oct 2023 17:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbjJKVyc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Oct 2023 17:54:32 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC8BDE
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:54:30 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso61675ad.0
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Oct 2023 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061269; x=1697666069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=MZq2/ZXK3OAgoGK3DU0A7DEr2DHEUTlXjmQgRKiKhvPeVtkU51WogMscOjQWSBWLno
         jY+L+F/NsejhVqHZx0IhodPdOMzUmG+6pB2bxe4u7TYHLViIUwfIs2rwTt1t3zq9HwF+
         XejtGRiZRFeXZ0l9a10MVdyFb1W07h97/RzWKd5kl4BCraUv9TzQjg/eMfhSNJhsn/k2
         X2sRYLjvOoFvU6zOs+Y3LZBkM741E/gb8tDuaZXxv5pOZdlXZldg7fd1bhuDF4c1OgDO
         /50YYsRrnmuxHKtf797lF6pFkF37GL6Qw0MFSxctkUxf3PddaImBZPW3oUJ9+z1LnUaZ
         H1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061269; x=1697666069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=D+GHCMehR9aU6JVLafnBAj5i9wBYpSeZpV1hQk5fBMl/ShbfZ32Gg2Sfv1leVPv9Un
         9gX6RVTZnVRJunhh52WllWZbPmGoIIv/p0gGY3C2/TvIGyWGp7yazz3BtFenHKaQokZj
         898BP9mW+PRR9d0ruzIt1nyYqd80T+O4RY+uhEhC7PiJ9cGhwdoItrjrzaEUzXC4k0qm
         nTkS1uTCjdyranjLR/GrH4DnkTx/ApGM4id1mvNJaCykm4lAfE1L1VdqUzWc54EEwi1k
         4c7A7LBr/FLQFv19UZmCJkY3BPxwxD1ojjIJWJSDCM23XE6L6ABh/MwwGsLTcg3vSjs3
         Hlyw==
X-Gm-Message-State: AOJu0YxqdvBmkjlLB5a7Zy+onO9XAO6P6UASY0uuWIRUT3y9/yF1pPSC
        af6uiiZdIPKy1M//9jFE5q9l8Q==
X-Google-Smtp-Source: AGHT+IESnmMbD2m86bsiGhw8JvUJbRSUCZ9voOyC7gGycNSvge5EBHqaFjy4tS+2pc3LAqrXcBMp8A==
X-Received: by 2002:a17:903:228f:b0:1c3:976e:22e6 with SMTP id b15-20020a170903228f00b001c3976e22e6mr363519plh.12.1697061269436;
        Wed, 11 Oct 2023 14:54:29 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id e19-20020aa78253000000b006950032f0c9sm10551259pfn.84.2023.10.11.14.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:54:28 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:54:25 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
Message-ID: <ZScZkWWATxdd4oqP@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 07fb8a9dac63..26bc52e681a4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
>  
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	/* rely on samsung,uart-fifosize DT property for fifosize */
> +	.fifosize = { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>  
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>  
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
>  	},
>  	{ },
>  };
> @@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>  		.data = EXYNOS850_SERIAL_DRV_DATA },
>  	{ .compatible = "axis,artpec8-uart",
>  		.data = ARTPEC8_SERIAL_DRV_DATA },
> +	{ .compatible = "google,gs101-uart",
> +		.data =  GS101_SERIAL_DRV_DATA },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> -- 
> 2.42.0.655.g421f12c284-goog
> 
