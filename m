Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D60426B25
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 14:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbhJHMvb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 08:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhJHMvb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 08:51:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3ADC061570
        for <linux-watchdog@vger.kernel.org>; Fri,  8 Oct 2021 05:49:36 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso11466385otj.13
        for <linux-watchdog@vger.kernel.org>; Fri, 08 Oct 2021 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1chLWtKJD8BXAsMuB0RIbkqMJFtd4Jw4W408OXhMMXc=;
        b=Ppvjx6i5lcre0AJBh82z9WhdDCR+6UJcD2vDe22T0Wcr6ompJHieGkCRnkbIppBg3K
         oTw9E5VlxXa9ZFvQs6mpfnLaP4LxHWR+YlFIjnHyUgxy+2+5DorZtdym1cOElBKDwF3g
         dYC369/h1baxsi4jPq5Mdp+qomJv+mCdO7h0U/xOOz13MUOimGoNw7Idx7ge7rJjbwyL
         x5RSrMxQxGV4OwGE8naTSg37ff8w64dqPoR/+yB1AOtajNWsytD+6syR5Slwep/gU6ZM
         RbWsGBpUBhp5kNjO/YwZWsGTsecihvZ1H+7/UOqgLc+du6nsR3TPkS2EMITMEQlVngWF
         Q97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1chLWtKJD8BXAsMuB0RIbkqMJFtd4Jw4W408OXhMMXc=;
        b=cSkDL4tMT0YKJtbInHLj38WrERNDegrrEi5mf70UVDsY9ocm6YXUcarPwIjSbguQwj
         I+FlbWAZ1twOnLNecajMm8uQLA8QTJyYWA6btUPwMhYgCVucWZb0S0a6lF6A4TyZRR31
         LJeHt65hBet47AyKnu9fHF6Hz83m97EdkmLYgUEnqgmlj2FQiZ7sCmFsDbkJQxtmoQkz
         nJGD8YBB2TgNOp/6whO2bs1Knqmsl8QpyqpduHsph2w55upJz2nhCeLprJWq7F9qwwSU
         uQhavbxtqq4AVvEnFFze4DShHOICB4+O2xfiHbyVoPXUM2bULHQ/RWbcghql9qo2WhzM
         o5Vg==
X-Gm-Message-State: AOAM531G40rtEsJZSj5g2Vu1RNORR/1WisLPLddKXGoPeup2u1Km/Sb6
        wZPqxRMnyHC6Vq6U3r/ucM6Hyow5X+M=
X-Google-Smtp-Source: ABdhPJwTaarN1vFqmCXW0ra2/I94RuLbTYmwpwEgS7o3BM6PQAV2wY/1oDTk2Fhaz2w/Vne8hBRYRg==
X-Received: by 2002:a05:6830:16cd:: with SMTP id l13mr8355485otr.2.1633697375410;
        Fri, 08 Oct 2021 05:49:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f14sm174178oop.8.2021.10.08.05.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 05:49:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/3] watchdog: db8500_wdt: Rename driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20210922230947.1864357-2-linus.walleij@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <313ad71a-3993-3008-f512-45ffa06a0459@roeck-us.net>
Date:   Fri, 8 Oct 2021 05:49:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922230947.1864357-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/22/21 4:09 PM, Linus Walleij wrote:
> This driver is named after the ambition to support more SoCs than
> the DB8500. Those were never produced, so cut down the scope and
> rename the driver accordingly. Since the Kconfig for the watchdog
> defaults to y this will still be built by default.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/Kconfig                       | 8 ++++----
>   drivers/watchdog/Makefile                      | 2 +-
>   drivers/watchdog/{ux500_wdt.c => db8500_wdt.c} | 0
>   3 files changed, 5 insertions(+), 5 deletions(-)
>   rename drivers/watchdog/{ux500_wdt.c => db8500_wdt.c} (100%)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index b81fe4f7d434..b5fe869991f9 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -743,17 +743,17 @@ config IMX7ULP_WDT
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called imx7ulp_wdt.
>   
> -config UX500_WATCHDOG
> -	tristate "ST-Ericsson Ux500 watchdog"
> +config DB500_WATCHDOG
> +	tristate "ST-Ericsson DB800 watchdog"
>   	depends on MFD_DB8500_PRCMU
>   	select WATCHDOG_CORE
>   	default y
>   	help
>   	  Say Y here to include Watchdog timer support for the watchdog
> -	  existing in the prcmu of ST-Ericsson Ux500 series platforms.
> +	  existing in the prcmu of ST-Ericsson DB8500 platform.
>   
>   	  To compile this driver as a module, choose M here: the
> -	  module will be called ux500_wdt.
> +	  module will be called db500_wdt.
>   
>   config RETU_WATCHDOG
>   	tristate "Retu watchdog"
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 1bd2d6f37c53..f500f242f46b 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -69,7 +69,7 @@ obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
>   obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
>   obj-$(CONFIG_IMX_SC_WDT) += imx_sc_wdt.o
>   obj-$(CONFIG_IMX7ULP_WDT) += imx7ulp_wdt.o
> -obj-$(CONFIG_UX500_WATCHDOG) += ux500_wdt.o
> +obj-$(CONFIG_DB500_WATCHDOG) += db8500_wdt.o
>   obj-$(CONFIG_RETU_WATCHDOG) += retu_wdt.o
>   obj-$(CONFIG_BCM2835_WDT) += bcm2835_wdt.o
>   obj-$(CONFIG_MOXART_WDT) += moxart_wdt.o
> diff --git a/drivers/watchdog/ux500_wdt.c b/drivers/watchdog/db8500_wdt.c
> similarity index 100%
> rename from drivers/watchdog/ux500_wdt.c
> rename to drivers/watchdog/db8500_wdt.c
> 

