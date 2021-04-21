Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71485367060
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 18:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241825AbhDUQnL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 12:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236214AbhDUQnE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 12:43:04 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA87C06174A;
        Wed, 21 Apr 2021 09:42:30 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso6514532otp.7;
        Wed, 21 Apr 2021 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+HMsZR01SUGrSKoyCPBgGVTfre4b5FPjtX+nOat0LfM=;
        b=q52eNNzYLmethgyacKl8edmlqufEtd/jQdcqujH8rlWgs0aJ3HGIxfKatO2hwVG87f
         elDi1Lf7RQiOHJSS1hwVn2frsRYKGLWwakfvGWk06fzkcwe8Ho8kvkKqBl/LEhsUNXR6
         1Ky6D2G3Q/UqXObse2fAKiLsnejLouhXQTF6bxst0EmlxieoksoME29+yFTdmWnLImh4
         N03UiaVR0vRqpD+VvwVw0Hb3gIiSehptHDWPuseU6v7Kz/ZGexJzOOwAUmNvBIGAMo31
         i6cATVYx95TsYqeJtMHFdWyXJAvWOwSbsT3ssVdoaHWQzDcYihn/EMt9qQafyoskY6uK
         lyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+HMsZR01SUGrSKoyCPBgGVTfre4b5FPjtX+nOat0LfM=;
        b=sknLVvgT2ItgAeV3knR/2nmDsFBmbsGevffU7ku+1cRpi0vst/Hu/JCD6ggeQehnaE
         HYKu/KnspEYO3MlR8cdam3mcz0nP80YBpi5exyxifqad+Syj3udqRlTWXwdSwGCiNQf8
         UFpqgQSM+ukGO5D3qa9/Ss3jAAwM0XTAZVZ8vtsx7digjhYNm1Kq6jd2iZk5l6WooBv1
         8dvO0erL41mJ+6RnQ8gQrBB+AO/OvnDRYJHThFTdirXvIlAZqficemPek5qEXi5/Eb48
         0y/k2aEzAJPeU3d0iHqftYuWkYApHqF7TSLTRU3hiksrFB4ue36Y6KhMpdWm2VAcVNPy
         4WXw==
X-Gm-Message-State: AOAM531QK2KdHDcJoAEOB4JYQKNO3KdFa3Ph2vZryP1oIoDMAmsg0Xos
        ksaX0LEy4BKCcdeC5n4oNXA=
X-Google-Smtp-Source: ABdhPJynyT8t8dhhtlf1I9iP2ifK685oycLgV9T9v/dz50dOYCDtHhrd2aVcaBcrxxovgrqN9VKYGQ==
X-Received: by 2002:a05:6830:1398:: with SMTP id d24mr24511988otq.281.1619023350064;
        Wed, 21 Apr 2021 09:42:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q189sm564750oih.25.2021.04.21.09.42.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 09:42:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Apr 2021 09:42:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Francesco Zanella <francesco.zanella@vimar.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
Message-ID: <20210421164228.GB110463@roeck-us.net>
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421162621.24910-3-francesco.zanella@vimar.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Apr 21, 2021 at 06:26:21PM +0200, Francesco Zanella wrote:
> If "start-at-boot" property is present in the device tree, start pinging
> hw watchdog at probe, in order to take advantage of kernel configs:
> - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
>   been enabled before the kernel (by uboot for example) and userspace
>   doesn't take control of /dev/watchdog in time;
> - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
>   /dev/watchdog within the timeout.
> 
> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
> ---
>  drivers/watchdog/gpio_wdt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index 0923201ce874..1e6f0322ab7a 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -31,6 +31,7 @@ struct gpio_wdt_priv {
>  	struct gpio_desc	*gpiod;
>  	bool			state;
>  	bool			always_running;
> +	bool			start_at_boot;
>  	unsigned int		hw_algo;
>  	struct watchdog_device	wdd;
>  };
> @@ -147,6 +148,9 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>  	priv->always_running = of_property_read_bool(np,
>  						     "always-running");
>  
> +	priv->start_at_boot = of_property_read_bool(np,
> +						    "start-at-boot");
> +
>  	watchdog_set_drvdata(&priv->wdd, priv);
>  
>  	priv->wdd.info		= &gpio_wdt_ident;
> @@ -161,7 +165,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_stop_on_reboot(&priv->wdd);
>  
> -	if (priv->always_running)
> +	if (priv->always_running || priv->start_at_boot)
>  		gpio_wdt_start(&priv->wdd);

So the only real difference to always_running is that always_running
doesn't stop the watchdog on close but keeps it running.

Does that really warrant another property ? Why not just use
always-running ?

The special use case of being able to stop the watchdog doesn't seem
to be worth the trouble. Please explain your use case.

Guenter
