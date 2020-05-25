Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF9A1E0FC6
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 May 2020 15:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403851AbgEYNrz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 May 2020 09:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbgEYNry (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 May 2020 09:47:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF54BC061A0E;
        Mon, 25 May 2020 06:47:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n15so8877864pfd.0;
        Mon, 25 May 2020 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VcGafp8vYz7TvTuBeeeP/O5YdWrMHPjkDw/pJSuJQfI=;
        b=IH94MBuj777Z55q239PkDGqWzRH08hPpb57jTzEWpS9G9mc9Jhjq8zpJoJENDHm4U9
         3zB6M4GEbcpfGJ0NBXu8CAS22ZcFTVV4HFEjSeZRj2R24oN5cQAo9xldE4tUvktX+0TW
         8YMk02GUa1JVqu2jwOZxOLCweFPOykcWAPF9lM/Hb1OSsrQtdQUs4Ury7apsc8KvofnK
         UXDa1NJ8NLO7ZukKMgqjMSmPs1w+fR6ZJtroVf5n0sxpATI38f/fjQAgwH6NpyzUs5Ue
         dwc4EC6AbOGxvpRJLCMe/KDvIKYoFGF4b/Rsxaljz+eLNL3ypZh5vJ95TJ1WX4G1N/W0
         q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VcGafp8vYz7TvTuBeeeP/O5YdWrMHPjkDw/pJSuJQfI=;
        b=CNRzVcckjvjoZm22eaidiePlnkkIyx8BAMgYkFhMqPhmqa1U561UI5OvBYrQUhN2Nn
         xUHgkHxnECMplptsO4sKX8T1zA8K/inHVBoCuQ86zFyQIfVvbC5//B8HhCRl5+EMNedt
         EMZ2QxsQ9Qs+YKw6R47BPBm48hK4udq2PQb/CgizsxVrD/D2OqcJYjLhTsuyGCbmX8Go
         fs/OFEmYNKDApVEDML2VUqDsEM6lyOOdoLTijVcl140dDoiB0KX7zBNb8dausrE27sDO
         6J98Jj4oeE6ri2E3ImJijFL1Rj5qLwCtxrGqyKDJsfHlfUYj9jcFqh/wnZDICgm0NWC+
         D5RA==
X-Gm-Message-State: AOAM5323QH0SctVzSrHpFKmP+T0dZEEjQymR6hinLiGoLuXg0yOfcYmj
        l14BdLjCbP5cDg64pq/sodA=
X-Google-Smtp-Source: ABdhPJw7Pg6kCi1qdVbUPYeIonnpWCkLyPvKrko13ySTvzyksbjZ/hbYRG4JVPibw9vVkbBXrq4MFw==
X-Received: by 2002:a63:f959:: with SMTP id q25mr25821977pgk.137.1590414474376;
        Mon, 25 May 2020 06:47:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w69sm13551316pff.168.2020.05.25.06.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 06:47:53 -0700 (PDT)
Subject: Re: [PATCH] watchdog: bcm_kona_wdt: Use correct return value for
 bcm_kona_wdt_probe()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1590391864-308-1-git-send-email-yangtiezhu@loongson.cn>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <99e82049-2d99-9a8e-4023-96f585b47e30@roeck-us.net>
Date:   Mon, 25 May 2020 06:47:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1590391864-308-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/25/20 12:31 AM, Tiezhu Yang wrote:
> When call function devm_platform_ioremap_resource(), we should use IS_ERR()
> to check the return value and return PTR_ERR() if failed.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm_kona_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
> index eb850a8..8237c4e 100644
> --- a/drivers/watchdog/bcm_kona_wdt.c
> +++ b/drivers/watchdog/bcm_kona_wdt.c
> @@ -279,7 +279,7 @@ static int bcm_kona_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(wdt->base))
> -		return -ENODEV;
> +		return PTR_ERR(wdt->base);
>  
>  	wdt->resolution = SECWDOG_DEFAULT_RESOLUTION;
>  	ret = bcm_kona_wdt_set_resolution_reg(wdt);
> 

