Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9696FF2B3
	for <lists+linux-watchdog@lfdr.de>; Sat, 16 Nov 2019 17:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfKPQU4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 16 Nov 2019 11:20:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33654 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbfKPQUx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 16 Nov 2019 11:20:53 -0500
Received: by mail-pg1-f194.google.com with SMTP id h27so7430030pgn.0;
        Sat, 16 Nov 2019 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3ThCOn+QwgspJ3kxAATKe5mgdC4dFBHT7/R2+FrM5uE=;
        b=Ydq+ryFHXyCcCndRf0G9/AN0hFrn0rS9hynpb848hB82abgjXFz2z4BqEgRkNB9xXP
         Ob7eqFO/Xq8K6kEL6fRe6Hc1dPEmOsQRmAby1ZRPGsNckUFgRusxiNKgizyKLm02Yxjq
         iQwbo5HmHuT/iIlj/nGvHRgATRwG8PzwQpp0yT0WfqBlMhOiEclEC/gpEKQr52HlAJZ3
         +Hq9I4na89H0lpGnirkHvAUIEole4l1UnFUE12jNCVFWEulvMT1wPRyjvOOacmaPnuwd
         DXyYCwz/a9FToDYFTJJODt3VvIsxakpbROqhhyc3I4RJph+XpkV7wfGv1JhfTbzdFX/j
         GidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3ThCOn+QwgspJ3kxAATKe5mgdC4dFBHT7/R2+FrM5uE=;
        b=fZDHWvAmusrKa6WejNPXltzVdQ0uhgWrTvtjOIdT3wZWGYtH94SyiAu91vS/IqGtxa
         bHymMpu2ou12vp1dGhL3Zeu3mj4IyoPom8WybMNH/O4pjZ6Xwk9t1kduCa1O22sk7Mi8
         P2fsmclwThL3Fcb3Lz7cUSst+nvYuUwccmFc4k7WKpkUCURSC2xsylVMPaD6NhemEbTU
         fa70C3+CmVk1vXIUB4B+b81UDJQ4IcPHVG3S3W+f8u9CiV8yJJqCG2v9aNPwv56ANqar
         mDuw3k+Pl5luirfgtRnUnGbliOcGVG+tza4ZuNFoQaxeplSP7W68GRG8/QHAucTV6s57
         NiGw==
X-Gm-Message-State: APjAAAVy5qQn63u/k+a7qU/yz3VCdfgeyi8PyOTeooGlplbIgukbGWvz
        BxenY1BTgdqu+p7QsQe54HZmwer3
X-Google-Smtp-Source: APXvYqw8+YtA13X+2DcbFCm2WNiq/03l8qtmNPUJkbuUIVpNhKs1oVxFoW7yPNZWmSTRPhkaZHB4YA==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr22797805pgi.116.1573921252799;
        Sat, 16 Nov 2019 08:20:52 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id em16sm12577766pjb.21.2019.11.16.08.20.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Nov 2019 08:20:52 -0800 (PST)
Date:   Sat, 16 Nov 2019 08:20:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas.Ferre@microchip.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 3/3] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Message-ID: <20191116162051.GA23056@roeck-us.net>
References: <1573806579-7981-1-git-send-email-eugen.hristev@microchip.com>
 <1573806579-7981-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573806579-7981-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 15, 2019 at 08:30:18AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Add support for SAM9X60 WDT into sama5d4_wdt.
> This means that this driver gets a flag inside the data struct
> that represents the sam9x60 support.
> This flag differentiates between the two hardware blocks, and is set
> according to the compatible of the driver instantiation.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v4:
> - check compatible with different of_ function
> - call irq parse and map only if need_irq
> - changed tabbing in struct defintion
> 
> Changes in v3:
> - changed need_irq to bool, instead of a single bit variable.
> - the platform data config struct is gone now, changed to a pointer to a bool
> to have the sam9x60_support as 'true', pointing to a static bool with true value.
> Can have a better solution than this ?
> - the specific sam9x60_support flag is assigned at probe time, corresponding
> to the flag value in .data
> 
>  drivers/watchdog/at91sam9_wdt.h |  14 ++++++
>  drivers/watchdog/sama5d4_wdt.c  | 109 +++++++++++++++++++++++++++++++---------
>  2 files changed, 98 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
> index abfe34d..4b3bd1d 100644
> --- a/drivers/watchdog/at91sam9_wdt.h
> +++ b/drivers/watchdog/at91sam9_wdt.h
> @@ -24,7 +24,10 @@
>  #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
>  #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
>  #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
> +#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
> +#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
>  #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
> +#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
>  #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
>  #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
>  #define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
> @@ -37,4 +40,15 @@
>  #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
>  #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
>  
> +#define AT91_SAM9X60_VR		0x08			/* Watchdog Timer Value Register */
> +
> +#define AT91_SAM9X60_WLR		0x0c
> +#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)		/* Watchdog Period Value */
> +#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
> +
> +#define AT91_SAM9X60_IER		0x14		/* Interrupt Enable Register */
> +#define  AT91_SAM9X60_PERINT		BIT(0)		/* Period Interrupt Enable */
> +#define AT91_SAM9X60_IDR		0x18		/* Interrupt Disable Register */
> +#define AT91_SAM9X60_ISR		0x1c		/* Interrupt Status Register */
> +

Lots of line-too-long checkpatch warnings. Please avoid.

Thanks,
Guenter
