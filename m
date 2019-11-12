Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BA5F90EF
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Nov 2019 14:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKLNrG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Nov 2019 08:47:06 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40362 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfKLNrG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Nov 2019 08:47:06 -0500
Received: by mail-pg1-f193.google.com with SMTP id 15so11875953pgt.7;
        Tue, 12 Nov 2019 05:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nbTKl7Y1bBMki5n9d7cr5r/s5MMepoc3ySY5hIEeh8E=;
        b=JsC3PmoMFimkZKGX3RAKlUpul6TsVS7JJG0wdvhG8MU7QtwRwvRI4w05oTUkQ9EH5+
         RT6AthZzJaskMmP4SOUbxmGJR38QaZ7K247F4eqboKdfNJ4uqqtQCm+hJyVH6sfIOA4K
         2QZrGuQD0rmKVEKon/Jurfo+D8n7/vlL0a1Fpn8Y/QtYP9RgowKc+Ig1sK1mq/CeFCPR
         eULUgJQyJih0WOe4tOzQAKV9MUUKFanZWVrso6VinWpMKNOdvpdpco3wvahP6giekQAR
         eQk6p1UyhetpVpcSOZOqSTR0RLyVkgvLGCIC7vRZIid9m6xtV3nbMQe+OuU6DJb4GGA0
         2i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nbTKl7Y1bBMki5n9d7cr5r/s5MMepoc3ySY5hIEeh8E=;
        b=hT21ZdPPwswwxnV3BJnmL95grniz31WwtgBOKyEsWwuDFQxChEVJy2z8jXqb1kOndJ
         i9Ur7E3tWtbQpJfeBM3y3Bhp6YeeaMmoyVnDtjHzD/DRg6KWVpydZwPMW6q7Pgr+SXPM
         bGRaVwI5zhgkMtsa9k67+2K+EtCEnCPUdT1G64OCn+w3suIYX10PT9YLDTm1hwiYZs4C
         ttlBGBBIh7CTGs3opZf/oiY6XW9OIEd54efHhuyxTAj0qQXNdZT2jG7+/AZT44n1o9xm
         mjcpfeMcx9RhnzGbwf9GZIoPoRk+C0klfTiPmmXZMnKKlj5y17LOl8sfAqAx6Wd2mF5c
         A8GQ==
X-Gm-Message-State: APjAAAXa1DgRPwWdhwHlR7AaDON/+UEId4OYw1W3tt3GoWuQE0DacGRk
        wIKoKbfoytMf1M6mNM2hCXOlIUMX
X-Google-Smtp-Source: APXvYqwbSI8pGLvGNXDQd4tRH7lluE7SbRFxEHFU+95NxxspJ5IdxgGPzQF6M74rrnLG4YgCPPvShw==
X-Received: by 2002:a62:140d:: with SMTP id 13mr35021203pfu.79.1573566425094;
        Tue, 12 Nov 2019 05:47:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10sm10156870pgg.39.2019.11.12.05.47.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 05:47:04 -0800 (PST)
Subject: Re: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
To:     Eugen.Hristev@microchip.com, robh+dt@kernel.org,
        wim@linux-watchdog.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e34df163-60f5-35c6-05c6-845d70143fd9@roeck-us.net>
Date:   Tue, 12 Nov 2019 05:47:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/11/19 4:13 AM, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Cleanup the macro definitions to use BIT and align with two spaces.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - new patch as requested from review on ML
> 
>   drivers/watchdog/at91sam9_wdt.h | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index 390941c..2ca5fc5 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -14,23 +14,23 @@
>   #define AT91_WDT_H
>   
>   #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
> -#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
> -#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
> +#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */

Using BIT() requires including linux/bits.h.

> +#define  AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
>   
>   #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
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
> +#define  AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
> +#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> +#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
> +#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
> +#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> +#define  AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
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
>   #endif
> 

