Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED79F344695
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Mar 2021 15:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhCVOFX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 10:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhCVOE5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 10:04:57 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A73C061574;
        Mon, 22 Mar 2021 07:04:56 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so16034409otn.1;
        Mon, 22 Mar 2021 07:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZsP09mXgTPYrnqWVKNxVWQlJdWWeKQfhRkaeDXk53/g=;
        b=XmTUBBhaUsPVPXeonzF9A2FIXjmKHRCi1wyL5usw8cbZlMhcqqZYgD9EANXP1C/Lc9
         AvGo3CEPbgheKTGPsz3nquTDEZRdfsj4Wr8RcCoweTgf0LV+YcFBB2+P171oAgEptMe2
         8KjHIlLV3tyfj+QiWQ1RSYlAffBVX3HO9IJ64GpB1NDpgWYT/Lyuamv1/MbtWmvpGMC9
         biLHatTLHX6aWOrccyI8TJS6np9Fk97JLkIpkM1wOw2hUeEikigZuT6nAnUHslk72Rt4
         fLUJtoCtjuUg8iLUtt3Dh3o+TEpc2AdkmKpneJqjXTKBgANn2qcE8RpQpCrNj4WHWXkh
         yY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZsP09mXgTPYrnqWVKNxVWQlJdWWeKQfhRkaeDXk53/g=;
        b=LHJ6f/RyX35tbUSQBME/Gm3Y/FjWthkwqRQgB48Im6tYOumwXOcnAxCe6TltT9Ymmq
         spJAzQWQeT9rUD1DVD9X8Ug2lV2Gy48c+skRR/7ZFwQqjjGT8+I2fcv3fhTa8DIIA8pY
         IstgXxWM4DI+L8AlKe3EXJgeb3KoUWnZ+WbSORmg1x7wKoaKflC21Ry/3fSlkidMFg6R
         amD3tudapoiBFsmWzWnelnTJkApLBwTkHYFxfDr9zlzPfS7ZrUDUVvmCpdoh5IkQ2p2B
         2K6CEWZH2ssCb45V0yyowtMKfx1Q4WS7jOU7gnNZPegT0cwYBiX2vTx4OfI4sWTFMMSE
         A+xg==
X-Gm-Message-State: AOAM530xsw719FKWumJ4BxYQqzbPYlvF8yJ74cbGXXP433J1yHZOej7J
        Jl8AtDLDhXcIidTDVgA6oj4=
X-Google-Smtp-Source: ABdhPJzrtBlFwIuoIPpBjzikUxHarxzxWjcqurc6tFJ8PMpI4FWIOrfzx6oWOTDdShS4D9wSZfREEA==
X-Received: by 2002:a05:6830:15c5:: with SMTP id j5mr117615otr.274.1616421895580;
        Mon, 22 Mar 2021 07:04:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l71sm3163245oib.30.2021.03.22.07.04.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 07:04:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 22 Mar 2021 07:04:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] watchdog: Fix a typo
Message-ID: <20210322140453.GA140507@roeck-us.net>
References: <20210320213301.8513-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320213301.8513-1-unixbhaskar@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Mar 21, 2021 at 03:03:01AM +0530, Bhaskar Chowdhury wrote:
> s/parmeter/parameter/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sl28cpld_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
> index a45047d8d9ab..2de93298475f 100644
> --- a/drivers/watchdog/sl28cpld_wdt.c
> +++ b/drivers/watchdog/sl28cpld_wdt.c
> @@ -164,7 +164,7 @@ static int sl28cpld_wdt_probe(struct platform_device *pdev)
> 
>  	/*
>  	 * Initial timeout value, may be overwritten by device tree or module
> -	 * parmeter in watchdog_init_timeout().
> +	 * parameter in watchdog_init_timeout().
>  	 *
>  	 * Reading a zero here means that either the hardware has a default
>  	 * value of zero (which is very unlikely and definitely a hardware
> --
> 2.26.2
> 
