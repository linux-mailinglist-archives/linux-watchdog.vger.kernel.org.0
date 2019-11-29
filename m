Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC4F310D81C
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Nov 2019 16:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfK2Pvy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Nov 2019 10:51:54 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45169 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfK2Pvy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Nov 2019 10:51:54 -0500
Received: by mail-ot1-f67.google.com with SMTP id r24so25189254otk.12
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Nov 2019 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/rATKnYRlmtBKnlUbn37MG305MkWqN7D0GE87Tbmc4c=;
        b=ZrZuXCSixAU8pQMfpNly0dW4DGPh1wqa4iZnvXDmPmac9PIcSrAYA4P79WbcpPelGt
         5J0n2qi/kAKm5P1I5EODPoeF7OcoMcIwkf10huEJs+X2Kiy7gE9oKlK2QGYtvaN7hMP4
         FnO1oStAGrYe7y6vsCDNmYWDlt6e/KdZOwrDtCmC5aRe2c+Jf36SXK4rLzjbyGzRPPrc
         cGcrpzkgDedNuRM1qjEdVcLyfXHxmcIndI/8J1JYGqGAoElE5gB/TF4Gn9/PasQgTRWD
         HYMRiP1mawYtOqPljLo1+HoIBinRbYhbnsR967McldZh/1L3fmveMyu3o2NphWDYjsK6
         lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/rATKnYRlmtBKnlUbn37MG305MkWqN7D0GE87Tbmc4c=;
        b=tH2KW7ZNrnv837Hi4GKmQwj86qPEDjQcInjtTbWPpqYHsKcodipI+OcMoM+YDksnCT
         b133gAZ2MFDDpi739+8p8Y6/fKYJUYjpxmOr7JUlDKROw4vJ0SyOBO79Ak07fGzKu9fY
         /RHYcP1kI7d8+QmLkw+p5ydilIlO1OwkuaQdJwm1GQEt+Tf0tsu1IfuKjV4S1BoWQFL7
         jnydO7TwU5tnsXGd2VoEBRXN42562MmTywwkj5gYKgN5ZpspB70uE7ndNdGb4nVVN9o2
         5P+70q1EKgS+jotTMj5dDuNX0OCortlcA80R6RpKaen6zd6ADqj/PIbFWlMvZvIh5VRa
         seRQ==
X-Gm-Message-State: APjAAAV6PLy46GgKpQ2+TTFBhSV3ldbA+TrqObwMlD0XbbS2zdWNnmxP
        /GNYn7VszNQMPDHPWS1POyErbs0k
X-Google-Smtp-Source: APXvYqwoJ5NbMzvKZ9Gi3srDepBae7qKHKJq0112NP6JvoL2sRbCiHM08Ao2WeJ5O6a9X3SHXjIUlw==
X-Received: by 2002:a05:6830:578:: with SMTP id f24mr11215317otc.113.1575042712815;
        Fri, 29 Nov 2019 07:51:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k9sm7409563oik.18.2019.11.29.07.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2019 07:51:51 -0800 (PST)
Subject: Re: [PATCH] watchdog: orion: fix platform_get_irq() complaints
To:     Russell King <rmk+kernel@armlinux.org.uk>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <E1iahcN-0000AT-Co@rmk-PC.armlinux.org.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <998b6a1b-7232-7f2e-2c63-48c5f74dab3e@roeck-us.net>
Date:   Fri, 29 Nov 2019 07:51:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <E1iahcN-0000AT-Co@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/29/19 6:51 AM, Russell King wrote:
> Fix:
> 
> orion_wdt f1020300.watchdog: IRQ index 1 not found
> 
> which is caused by platform_get_irq() now complaining when optional
> IRQs are not found.  Neither interrupt for orion is required, so
> make them both optional.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/orion_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 1cccf8eb1c5d..8e6dfe76f9c9 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -602,7 +602,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   		set_bit(WDOG_HW_RUNNING, &dev->wdt.status);
>   
>   	/* Request the IRQ only after the watchdog is disabled */
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq > 0) {
>   		/*
>   		 * Not all supported platforms specify an interrupt for the
> @@ -617,7 +617,7 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Optional 2nd interrupt for pretimeout */
> -	irq = platform_get_irq(pdev, 1);
> +	irq = platform_get_irq_optional(pdev, 1);
>   	if (irq > 0) {
>   		orion_wdt_info.options |= WDIOF_PRETIMEOUT;
>   		ret = devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
> 

