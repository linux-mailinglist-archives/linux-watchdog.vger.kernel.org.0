Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE40FF171
	for <lists+linux-watchdog@lfdr.de>; Sat, 16 Nov 2019 17:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731229AbfKPQMI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 16 Nov 2019 11:12:08 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46399 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfKPQMH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 16 Nov 2019 11:12:07 -0500
Received: by mail-pf1-f193.google.com with SMTP id 193so8111751pfc.13;
        Sat, 16 Nov 2019 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DLBwNS04s3vTncd8h6wYjqP9/zqj5Hw6C3ovDZPMJNw=;
        b=aWDwUslpmIQVa4GYtfBvd2CMsrtdrtzAXSurvFxn9mgpdxN5BKh64sYvKAAbYDKfSj
         4YMXLI9Fua6OvuYxk9aWHHjKqdWTtquxgyU2Ekugjx0AhH0B2lhuJMJVRi+yk65QDRdh
         CoQCd0F3l4D53DhJkRKl2tlal42XOJ5NtiyXPDIMbxtijjHPxUlqeCwzdUwgjDihryL/
         CJ5cwucFeg0xSf4TYkBeyf3doCOFGOg+Q1odrSMKSHCCaWOwWiJ4brhdjJUtyYBT8cDS
         0TMlKeK9t/aA+6JqhkkAPhqn1+7XTFmvaVvt4Y/wY6Y5CY47hgLvCakN7MxAv9gtLu9L
         ul6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DLBwNS04s3vTncd8h6wYjqP9/zqj5Hw6C3ovDZPMJNw=;
        b=cfeqYPL+SoFf8U+8bvoEg5s0TeoI9o4k36GLDONPzR0BwGYnJP7nmBFUu0erfxWaQ+
         8pLM0Xmey4i3Uod/d29auQhK+IJqeJb+Z+UHlFFh681PzBaW9IF1dUgPD5RYMQJPSzdV
         cEx+DOX66IiHJrGt0vGXZhBNAc6EcDsSojlQ/p5jHJ9vmLOk6YKUsa9kcjpRuLaHwzjq
         39Db13FJAzWbpdPp0u/uITIUlOWcgoG5Y3bq+oO97SNAUCPylU1366HeT02bNMFjMpHm
         uNMWsjC4C47WzxLfIzFdJUzlLx+Ztwcu946HDTp8vW1ts2s0niEW3lapdy8l0pVzyfDi
         k2Zg==
X-Gm-Message-State: APjAAAXOf5eyRQ09S+fFTmZjGRMvwZrOeq3U8Qjr50yeJoz9Yw9t0ARm
        Ss8ZZf1YHbMDweYoB9Z91yeJvutk
X-Google-Smtp-Source: APXvYqyUjaIuhyaRHuw7HuQ7JdypEFfmmQ6CWLzYfMZsoL54sdj1Me9cxMFnQnrWwYl56ebRbcqIPA==
X-Received: by 2002:a63:e156:: with SMTP id h22mr7865038pgk.266.1573920726128;
        Sat, 16 Nov 2019 08:12:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 83sm14198063pgh.86.2019.11.16.08.12.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Nov 2019 08:12:05 -0800 (PST)
Date:   Sat, 16 Nov 2019 08:12:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
Message-ID: <20191116161204.GA22568@roeck-us.net>
References: <1573806579-7981-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573806579-7981-1-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 15, 2019 at 08:30:13AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Cleanup the macro definitions to use BIT and align with two spaces.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v4:
> - added UL suffix to value macros to avoid compile warnings
> - modified file header to include new copyright and datasheet
> - include linux/bits.h
> 
> Changes in v3:
> - new patch as requested from review on ML
> 
>  drivers/watchdog/at91sam9_wdt.h | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 390941c..abfe34d 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -4,33 +4,37 @@
>   *
>   * Copyright (C) 2007 Andrew Victor
>   * Copyright (C) 2007 Atmel Corporation.
> + * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
>   *
>   * Watchdog Timer (WDT) - System peripherals regsters.
>   * Based on AT91SAM9261 datasheet revision D.
> + * Based on SAM9X60 datasheet.
>   *
>   */
>  
>  #ifndef AT91_WDT_H
>  #define AT91_WDT_H
>  
> +#include <linux/bits.h>
> +
>  #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
> -#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
> -#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
> +#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
> +#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
>  
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
> -#define		AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
> -#define			AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> -#define		AT91_WDT_WDFIEN		(1     << 12)		/* Fault Interrupt Enable */
> -#define		AT91_WDT_WDRSTEN	(1     << 13)		/* Reset Processor */
> -#define		AT91_WDT_WDRPROC	(1     << 14)		/* Timer Restart */
> -#define		AT91_WDT_WDDIS		(1     << 15)		/* Watchdog Disable */
> -#define		AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
> -#define			AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
> -#define		AT91_WDT_WDDBGHLT	(1     << 28)		/* Debug Halt */
> -#define		AT91_WDT_WDIDLEHLT	(1     << 29)		/* Idle Halt */
> +#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
> +#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> +#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
> +#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> +#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> +#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
> +#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
> +#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
> +#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
>  
> -#define AT91_WDT_SR		0x08			/* Watchdog Status Register */
> -#define		AT91_WDT_WDUNF		(1 << 0)		/* Watchdog Underflow */
> -#define		AT91_WDT_WDERR		(1 << 1)		/* Watchdog Error */
> +#define AT91_WDT_SR		0x08		/* Watchdog Status Register */
> +#define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
> +#define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
>  #endif
