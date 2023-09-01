Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6156C78FE35
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Sep 2023 15:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236890AbjIANSI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 1 Sep 2023 09:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbjIANSI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 1 Sep 2023 09:18:08 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 908DA94
        for <linux-watchdog@vger.kernel.org>; Fri,  1 Sep 2023 06:18:02 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-34ca860051fso6609565ab.2
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Sep 2023 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693574282; x=1694179082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FjJeN/ixdh/X5nVc3h69p2f2h/7o4LWY9E1n9J10nvY=;
        b=W8T6cbABkP1y1MSrG/5hk2etoz+TyopLaBj/kkOrkaD7bK92dxzR1Y2g8Bvb9ZlJw0
         xaZG+aMeffOAbqMPa3zV0gD4KQbbNzugeP/MGC7GQL6Mn9P4bxgYmRI7sBT3MEdCtorg
         On3M3BiOjJ+pAQ8PqOOklH2290mu4cAA5JSnJZ1cUVW2/ofLnGQ7x7YIneudhV/v/YK1
         iixVcp6iveSJwUeCGF+lYnyDcM3Kzx/PuzOR3AzxvRb/P41B+lbB6k7yFgk9Se3oG8LI
         0P5LgjoQp9yfabYBqrsyimpH1o1tkgTcvFCjLxNL9jhiMMwnZh7PxxdavCZypgTdqTVY
         kWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693574282; x=1694179082;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjJeN/ixdh/X5nVc3h69p2f2h/7o4LWY9E1n9J10nvY=;
        b=VxlIrjTIv3P/maA5xHaHzayj7n2pn0uL1k9GIk1wI0ly2sVKDeu37f3csz/++7YTWA
         eDCJwQD4doSqSZwqKiGhs/0FsLZJm/duIljX1cADRZnI8gPVatpSGfNpROJAEVoFE1B+
         jO6F2tMYkiM6A5t24xamNOUFYUs5e/WenztL4jAOrmWUw+kCtRDCKTLofuv0rrOo9Fuk
         Drd6h1kjU6/9TFx+F7K3Di9/Pdup530wLkacDDI81/SPIpn/f0n4nckRSblzIcG5XxQW
         dd7mxkuDPIz0NSZtxkboJ2ACAjO+GSy4ybjsq5byQEOt5jS2mtrYe18w92tu4a/DqtaM
         rTOw==
X-Gm-Message-State: AOJu0YzlQgcNwE8p9VyLMOKcplaSa5Bf+8wCXCSVBL1SYs9qqFA0b7Nh
        5lOGorXP/dK6E+kYdcYxwFE=
X-Google-Smtp-Source: AGHT+IE2N+Sz+V5NJ9eBx7mhZqJg4HaXPGu0fWdRIjjW5zcCfitKvBnMlY5NmF0UrSlhbrKqq7xBJw==
X-Received: by 2002:a92:ce4a:0:b0:34d:ed6e:ca5b with SMTP id a10-20020a92ce4a000000b0034ded6eca5bmr2499341ilr.20.1693574281630;
        Fri, 01 Sep 2023 06:18:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b18-20020a920b12000000b0034baea55c00sm1043620ilf.68.2023.09.01.06.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 06:18:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ad08f17d-3f7e-c778-9385-4cf753362d94@roeck-us.net>
Date:   Fri, 1 Sep 2023 06:17:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] Watchdog: Remove redundant dev_err_probe() for
 platform_get_irq()
Content-Language: en-US
To:     Jinjie Ruan <ruanjinjie@huawei.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Bharat Bhushan <bbhushan2@marvell.com>
References: <20230901070929.1317982-1-ruanjinjie@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230901070929.1317982-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/1/23 00:09, Jinjie Ruan wrote:
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
> to platform_get_irq*()"), there is no need to call the dev_err_probe()
> function directly to print a custom message when handling an error
> from platform_get_irq() function as it is going to display an appropriate
> error message in case of a failure.
> 
> Fixes: ef9e7fe2c890 ("Watchdog: Add marvell GTI watchdog driver")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Please always include the driver name in the subject of a patch.

Otherwise

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/watchdog/marvell_gti_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/marvell_gti_wdt.c b/drivers/watchdog/marvell_gti_wdt.c
> index d7eb8286e11e..d5a1ff91d423 100644
> --- a/drivers/watchdog/marvell_gti_wdt.c
> +++ b/drivers/watchdog/marvell_gti_wdt.c
> @@ -308,7 +308,7 @@ static int gti_wdt_probe(struct platform_device *pdev)
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)
> -		return dev_err_probe(&pdev->dev, irq, "IRQ resource not found\n");
> +		return irq;
>   
>   	err = devm_request_irq(dev, irq, gti_wdt_interrupt, 0,
>   			       pdev->name, &priv->wdev);

