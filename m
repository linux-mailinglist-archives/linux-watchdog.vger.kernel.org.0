Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF66F3E9
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2019 17:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfGUPTY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Jul 2019 11:19:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37958 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfGUPTX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Jul 2019 11:19:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id f5so7619069pgu.5;
        Sun, 21 Jul 2019 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HWUpf5n6BT75EgrtR4vkz5jvkG3u8a63LBQZj2895v0=;
        b=Br+hA1JP8DlF7u70kkUcHa/RBwheh/d/ck/0aKlmQOonObVISlpG5IHJCdh6m5Ni5B
         GYsvU7s9t0X7XRmESook+70Y/MCanzmrELkC66QDM+rB+fjZ2vDJIVLwRzSE4g1bCzFh
         8hOO+LsP0TH9475NopSnlB7RApNVmg4UddQM8Luq9ajTuoNLC59lI12XJpYL+P0uD8sP
         dn4mAw1uplncHrJDvtY/wjgTLhqx7EgULlvJdWM96HNpHTdoXpsIML0pNMbSqp6P3939
         f2rOu/xfzuTNaT1LE+eCixut4M/ek8DhYNJdo+7yB4M2bO9pFB0F7ewpNG+f8SOwFNwE
         Lrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HWUpf5n6BT75EgrtR4vkz5jvkG3u8a63LBQZj2895v0=;
        b=HhkDgGlD48QhWROtHHV2+tibyAt+ozF3ttZRo13dkkZDbXondD5sk0lUpUIMbCKFUW
         2jgEYJDHeNqCVLMgXNz/r5T8FZYPDDgeGmM9k9SlF2hNg7SurIZ7Ew9RnJxVpYuie0Di
         OGufmSxANdeMXkf621royd7BPWkpKvPWmy9DhETv55oXbiyARUEgAQJNlzoLEvkT1Jur
         uYmydxukE8O1sX2A6KLIE86lTT8NMFD7qZqE8MGJtyDLoAKGsnpQ0g9zrxVksmrtAzgL
         fL7rP7oWJgUcHNCMe86X/WdxeLNP5eyYX6g2UzgWcY2I54s3dKOZGcHtvDzo2CCDfOtV
         pNdA==
X-Gm-Message-State: APjAAAVQJtinNrkkHiAWGcLez8lwyrzlm3/Hpev6rtKZN5zZR25vItOJ
        fCu5jwUfu6ofHVGpglAKfRjMfZUn
X-Google-Smtp-Source: APXvYqxEqmoBL8grGcSx0rcKo/+jPNqOGDT7UCNza6Wl2LVpdI8wwSPK6lnA82SZ56xvJQo1gPeUKA==
X-Received: by 2002:a63:1f03:: with SMTP id f3mr38980074pgf.249.1563722362657;
        Sun, 21 Jul 2019 08:19:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w16sm44242276pfj.85.2019.07.21.08.19.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 08:19:21 -0700 (PDT)
Subject: Re: [PATCH] watchdog: ath79_wdt: fix a typo in the name of a function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190721125547.13473-1-christophe.jaillet@wanadoo.fr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <38306b92-4251-44ec-b083-e41046112a17@roeck-us.net>
Date:   Sun, 21 Jul 2019 08:19:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190721125547.13473-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/21/19 5:55 AM, Christophe JAILLET wrote:
> It is likely that 'ath97_wdt_shutdown()' should be 'ath79_wdt_shutdown()'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/ath79_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
> index 02234c254b10..436cdb4f0392 100644
> --- a/drivers/watchdog/ath79_wdt.c
> +++ b/drivers/watchdog/ath79_wdt.c
> @@ -306,7 +306,7 @@ static int ath79_wdt_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static void ath97_wdt_shutdown(struct platform_device *pdev)
> +static void ath79_wdt_shutdown(struct platform_device *pdev)
>   {
>   	ath79_wdt_disable();
>   }
> @@ -322,7 +322,7 @@ MODULE_DEVICE_TABLE(of, ath79_wdt_match);
>   static struct platform_driver ath79_wdt_driver = {
>   	.probe		= ath79_wdt_probe,
>   	.remove		= ath79_wdt_remove,
> -	.shutdown	= ath97_wdt_shutdown,
> +	.shutdown	= ath79_wdt_shutdown,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
>   		.of_match_table = of_match_ptr(ath79_wdt_match),
> 

