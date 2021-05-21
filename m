Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8313738C569
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 May 2021 13:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbhEULJN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 May 2021 07:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233969AbhEULJL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 May 2021 07:09:11 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E89C061574
        for <linux-watchdog@vger.kernel.org>; Fri, 21 May 2021 04:07:49 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so17667887otc.6
        for <linux-watchdog@vger.kernel.org>; Fri, 21 May 2021 04:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vYyzijE4ZufWYLa1oXEkqIpJ+syCx7ODkHC+mjty7O8=;
        b=Q7iQhFIx6YulZBRYR6Q2Bf0X42RdCEjw3emAsr38Q6hgek0AjmJYmIXxu7KIw4zCTQ
         qg2jjimP1HvW+5KThWSmJM1K+9K9ee8jdF6/IfPSyW8i2o2fEP/nMzuuiL2At0sFCUUG
         vHhtVreNr3g5fRkRvv+hNZhDu/VvfgHJXMjL6u4+WBQKA+c4vZfzLCeiDVHubOlCj+XQ
         CnfMmrcJ0qrNQ/jLjrZTC+t8ZMDeq/+Na7CcO8sh1p2aYwz9EDyXsSPMNuM5zCc6sn+z
         C8Kja4I9yQDbeKWW94rScqpu2Oebf+X3mQ8KuUThIxSJiCH0s6c6OOV4i82r/6iai/Mg
         5jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vYyzijE4ZufWYLa1oXEkqIpJ+syCx7ODkHC+mjty7O8=;
        b=CM6rgtFQOXflQE20O3TpVJ7CAk7sjjhE7uewz1BE20ytsCcTtBIDy+p06trRC6nT8a
         82eSqBVeI1d4qXl1mmf+8XbJNelPqJ+B4qLFhxV7kncimJBQbcdB12WwvMsiyPBah2Zx
         BrFhNyISxiANJYrJDJk0fUcz776lb4VYAubw/p9XpqT1q5pxcmwfC6VdzVyVKHcMWr2O
         Js51BvAOEqqkRA9LtooIFR6SGcG0AtTm5a285gHPOW/2qZvRNRjcOOkm6aOu/O/UXRLe
         j41pfvKZCgowhduUJ08ztNV2gC29Von8TFKEM1pco/dULd2h923AH78fWCuWJVHDTzda
         RnSg==
X-Gm-Message-State: AOAM532A/RZnBvpgfMVl7LDOJbVm+/h1Ekom/tcM6EH64Eedg4yLVoWu
        vVBctXnd03dKhrfq8m4RnADmMB5dbvE=
X-Google-Smtp-Source: ABdhPJwij9mNj8EGDaiN6svE+Z8W3P2AkSb9COtcwzzkUF/gheY3iONZ8tYnBI7OAv6OPyOz9VnHzQ==
X-Received: by 2002:a05:6830:22d3:: with SMTP id q19mr5136603otc.258.1621595268495;
        Fri, 21 May 2021 04:07:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p3sm1119486oov.2.2021.05.21.04.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 04:07:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RESEND 1/1] watchdog: simplify devm_watchdog_register_device
To:     Tian Tao <tiantao6@hisilicon.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org,
        Yicong Yang <yangyicong@hisilicon.com>
References: <1621581364-31734-1-git-send-email-tiantao6@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1652dd02-1fcd-43fa-46ee-308e80b1a018@roeck-us.net>
Date:   Fri, 21 May 2021 04:07:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621581364-31734-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/21/21 12:16 AM, Tian Tao wrote:
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

There is a functional change: With this patch applied, the watchdog
is registered first, before allocating memory, and then unregistered
if allocating that memory failed. I do not like that change,
and I think the code should remain as-is.

Guenter

> ---
>   drivers/watchdog/watchdog_core.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 5df0a22..cea6080 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -364,9 +364,9 @@ void watchdog_unregister_device(struct watchdog_device *wdd)
>   
>   EXPORT_SYMBOL_GPL(watchdog_unregister_device);
>   
> -static void devm_watchdog_unregister_device(struct device *dev, void *res)
> +static void devm_watchdog_unregister_device(void *wdd)
>   {
> -	watchdog_unregister_device(*(struct watchdog_device **)res);
> +	watchdog_unregister_device(wdd);
>   }
>   
>   /**
> @@ -381,23 +381,14 @@ static void devm_watchdog_unregister_device(struct device *dev, void *res)
>   int devm_watchdog_register_device(struct device *dev,
>   				struct watchdog_device *wdd)
>   {
> -	struct watchdog_device **rcwdd;
>   	int ret;
>   
> -	rcwdd = devres_alloc(devm_watchdog_unregister_device, sizeof(*rcwdd),
> -			     GFP_KERNEL);
> -	if (!rcwdd)
> -		return -ENOMEM;
> -
>   	ret = watchdog_register_device(wdd);
> -	if (!ret) {
> -		*rcwdd = wdd;
> -		devres_add(dev, rcwdd);
> -	} else {
> -		devres_free(rcwdd);
> -	}
> +	if (ret)
> +		return ret;
>   
> -	return ret;
> +	return devm_add_action_or_reset(dev, devm_watchdog_unregister_device,
> +					wdd);
>   }
>   EXPORT_SYMBOL_GPL(devm_watchdog_register_device);
>   
> 

