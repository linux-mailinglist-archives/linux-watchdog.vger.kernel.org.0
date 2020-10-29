Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE44629EC62
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Oct 2020 14:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJ2NCr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Oct 2020 09:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ2NCq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Oct 2020 09:02:46 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71D5C0613CF;
        Thu, 29 Oct 2020 06:02:46 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x1so3039806oic.13;
        Thu, 29 Oct 2020 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/zj6CLJMyIB00YI+FnhcR6EiceS6PTlSxzmJoiVm518=;
        b=PU41YRUrVJy+mt7xG5ul3Wuwt5gsihr3AhIGQmdvng+I08gi+Jtk2pR0aqfmfRJltK
         0R2HzYvpr5BlMR8lb66sXy+ZoXWxZnhsI3e8lvrXri+OV+Um/lBgrZdovHGxnDEVxOOg
         43CVYwf5qzSGMoFq+ZWkBsVxVvx2XEKQGAhMnP6aQNpRcMqJpQshIo0v0wO9Euay5GZj
         R+M50MpjUfAghAIPiSuTW7XhMWQIXidw3pLVht+I1ZGDMC8F+kPzYrXDV1Nl90nrs8aU
         dsJfbSjmVYAzfSoafmy7fACHNVv1lqhz2qQdqH1Dz36OtGbTBC7iS+0OiEYOIkEFke3F
         3XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/zj6CLJMyIB00YI+FnhcR6EiceS6PTlSxzmJoiVm518=;
        b=Mo0C2GFH6qOIl1SzAebuYNBXGDCbOajRp1x2ebVGD5loeG65Za8kQmbiu96jQ76Ax1
         p+mrE5dyilT8hk+yg26ixCK+yeOVZOplaOFz0/Py2DgrCMKTsGuVW76aGnbwNHeh8k6V
         MMifb5Mon/VzMABvCxROkYYhGv+sokvotva6vU2+eTflrM2x7PotRJZwJnrgsdMWP0IX
         nuQEao5osfoTBe/HyQWTkeZgVF3IpjJMuchQIj2T2DWp+mGwXcquUZX2z93fbo5vK6oO
         mGZ4n0PvM57cgHXYFVHZM9hRsmqMCWVHSOD4iTvsMze6CMZYjBfCp2ZIJ8Q19V3F8jMi
         rvXA==
X-Gm-Message-State: AOAM533+OQaalTrrde7PpNkAZFgboJCU4wWD9PHzATNHaOMhTAw+Fxhe
        0rt5Dd+Fmqw9wjbDDkFH8x6Ge/Oi+M8=
X-Google-Smtp-Source: ABdhPJy3mLt9OWijcM3S2F8UQkq7bYvNLHy8gfKFNrVf9aJ2pg+AK1jhQR9aGSQ+jHVvCM+5T6tKwg==
X-Received: by 2002:aca:d941:: with SMTP id q62mr2968241oig.33.1603976565915;
        Thu, 29 Oct 2020 06:02:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t4sm568957oov.15.2020.10.29.06.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 06:02:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/3] ACPI: watchdog: remove unnecessary CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201029075327.228570-1-coiby.xu@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d5a5453e-3223-ddf5-9913-b958a0722369@roeck-us.net>
Date:   Thu, 29 Oct 2020 06:02:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029075327.228570-1-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/29/20 12:53 AM, Coiby Xu wrote:
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
Not really.

> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/watchdog/wdat_wdt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index 3065dd670a18..0d912ceb2ecd 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -465,7 +465,6 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &wdat->wdd);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int wdat_wdt_suspend_noirq(struct device *dev)

You would have to add __maybe_unused here for this to work as intended.

Guenter

>  {
>  	struct wdat_wdt *wdat = dev_get_drvdata(dev);
> @@ -526,7 +525,6 @@ static int wdat_wdt_resume_noirq(struct device *dev)
>  
>  	return wdat_wdt_start(&wdat->wdd);
>  }
> -#endif
>  
>  static const struct dev_pm_ops wdat_wdt_pm_ops = {
>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(wdat_wdt_suspend_noirq,
> 

