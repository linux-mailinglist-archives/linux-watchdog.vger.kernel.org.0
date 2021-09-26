Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA31341888F
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Sep 2021 14:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhIZMP3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 26 Sep 2021 08:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhIZMP2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 26 Sep 2021 08:15:28 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A66C061570;
        Sun, 26 Sep 2021 05:13:52 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id z11so21633358oih.1;
        Sun, 26 Sep 2021 05:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Pf5rU/TB/BW2ajTVjYWCJhuzdNpYKVst0ZSbg4WjX0=;
        b=Kev7foseiXhcccruFzCzWbqnt/nsv0uHCpvE0dQDu7iJzyBuIV1iYpanAaJT22iWNB
         4Q+z4EDr11ihcgv4MSTnxm2Vis4dIG8ub79lA7s4z6rZQUbaQMl8dp3Sbr5+6EaL28+E
         LNkPgWOID13CjiFB34mcXjIZ8efFKUbqTJoOHW1tW5Enk+qGh0MKp85ErS6sqAzi1XfB
         vvV9xOv64F5hx0LMdXYrZkkLaYsb1QDIsDZw7VvxvWizX+23NlChmAW92+jJPbXr1ZSc
         gKoy3NldeJKwGloeIJ7OV4MRRnWqyI4V6cU3kAcGRvK50i6qvTZiV+FE429uTLgUpFpp
         hcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3Pf5rU/TB/BW2ajTVjYWCJhuzdNpYKVst0ZSbg4WjX0=;
        b=ncKWSZ5L4uax6F7ylpzLfhxpmeUeqryHh5lYT1NB5qDVFnv3MhXIAO9KsbQI8rLnY5
         5KXBT4+AoUldONDyPp8KR7TC3EoUTJNF/VW5GxjAqqQcwJHXFgWP2BWCNthgDnBrpMgB
         pfj+ftMOPqhR2VfMvqMaYrZol4pmBUBclRAW4WBzHqYLXL3tnPxjZtNpiATzPdlCHOj4
         jZk1wXZglE/2wjWGQbGXDDtD7ImNspSBvcSlK4siImojwfgfx09tOGFryt6LEFb8Xs43
         NXwoFc08YE0l8DNNP8s0x+DbAajjZnH+yrv9iuj0v7zSp0EXYSqi3LE7JdKLzAESw7AG
         nYEA==
X-Gm-Message-State: AOAM533/PjgU4ot96O3swyCiqGyOcLGYNR4k0wuiXu/WsKuFE9JshCI6
        7jRbdWyFhk8B6Vzy0ObTJoovbR+Lr+k=
X-Google-Smtp-Source: ABdhPJwAa//K6Y7U71YSn4FZ+9A9LY11mS6IHLh9n+yS2sdRbI3E6yBmIp4Z4k4xHnPoGv3cZZGVRA==
X-Received: by 2002:a05:6808:2016:: with SMTP id q22mr8231106oiw.19.1632658432046;
        Sun, 26 Sep 2021 05:13:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i23sm3229040oof.4.2021.09.26.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 05:13:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 26 Sep 2021 05:13:50 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: s3c2410: describe driver in KConfig
Message-ID: <20210926121350.GA3174183@roeck-us.net>
References: <20210924132930.111443-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924132930.111443-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 24, 2021 at 03:29:30PM +0200, Krzysztof Kozlowski wrote:
> Describe better which driver applies to which SoC, to make configuring
> kernel for Samsung SoC easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b81fe4f7d434..75591ba261e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -496,16 +496,18 @@ config S3C2410_WATCHDOG
>  	select WATCHDOG_CORE
>  	select MFD_SYSCON if ARCH_EXYNOS
>  	help
> -	  Watchdog timer block in the Samsung SoCs. This will reboot
> -	  the system when the timer expires with the watchdog enabled.
> +	  Watchdog timer block in the Samsung S3C24xx, S3C64xx, S5Pv210 and
> +	  Exynos SoCs. This will reboot the system when the timer expires with
> +	  the watchdog enabled.
>  
>  	  The driver is limited by the speed of the system's PCLK
>  	  signal, so with reasonably fast systems (PCLK around 50-66MHz)
>  	  then watchdog intervals of over approximately 20seconds are
>  	  unavailable.
>  
> +	  Choose Y/M here only if you build for such Samsung SoC.
>  	  The driver can be built as a module by choosing M, and will
> -	  be called s3c2410_wdt
> +	  be called s3c2410_wdt.
>  
>  config SA1100_WATCHDOG
>  	tristate "SA1100/PXA2xx watchdog"
> -- 
> 2.30.2
> 
