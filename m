Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0375F39B92
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Jun 2019 09:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfFHHvs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Jun 2019 03:51:48 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:60844 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726700AbfFHHvs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Jun 2019 03:51:48 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 45LWnF1CmBz9v162;
        Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=lSyF+ktH; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id jcVg9OjwFRFl; Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 45LWnF00Dnz9v0tx;
        Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1559980305; bh=f3XQg0S0tVNIvajavdwOdzIVoAQI/mHI+P6rO41trUE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lSyF+ktHFuNuRrUbgTbgHUB5jXAoRAScVnhiLml29E6EsYgj0b/a1CK+31q4HWaIY
         E+QZ6p3qN3S2y0QcSGywuliz6m90XQM4RWK4iiJqCAT/rvzpJNI73p44N1jU09kV07
         RlmV42GCsFzpUoPX3ckN9x7nO/Kp4TwaVZzGa6tI=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id EF5058B792;
        Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 6hOE7BMvbzJt; Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E36F8B78B;
        Sat,  8 Jun 2019 09:51:45 +0200 (CEST)
Subject: Re: [PATCH v2 4/4] watchdog: jz4740: Make probe function
 __init_or_module
To:     Paul Cercueil <paul@crapouillou.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190607162429.17915-1-paul@crapouillou.net>
 <20190607162429.17915-5-paul@crapouillou.net>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0dc0fd0a-54fc-5d70-af78-1874b5ece418@c-s.fr>
Date:   Sat, 8 Jun 2019 09:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607162429.17915-5-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Paul,

Le 07/06/2019 à 18:24, Paul Cercueil a écrit :
> This allows the probe function to be dropped after the kernel finished
> its initialization, in the case where the driver was not compiled as a
> module.

I'm not sure that's what  __init_or_module flag does.

As far as I understand, this flag makes the function being dropped only 
when the kernel is built without modules support, ie without 
CONFIG_MODULES. See 
https://elixir.bootlin.com/linux/latest/source/include/linux/module.h#L145

In addition, I'm not sure you can simply define a probe function as 
__init. What if someone tries to unbind and rebind the device through 
sysfs for instance ?

It seems there is a special function called __platform_driver_probe() 
for registering devices when the probe function is to be in __init, see 
https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L684

Christophe

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>      v2: New patch
> 
>   drivers/watchdog/jz4740_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index 7519d80c5d05..2061788c1939 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -157,7 +157,7 @@ static const struct of_device_id jz4740_wdt_of_matches[] = {
>   MODULE_DEVICE_TABLE(of, jz4740_wdt_of_matches);
>   #endif
>   
> -static int jz4740_wdt_probe(struct platform_device *pdev)
> +static int __init_or_module jz4740_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct jz4740_wdt_drvdata *drvdata;
> 
