Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D76717E24
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 18:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfEHQeI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 May 2019 12:34:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33811 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbfEHQeI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 May 2019 12:34:08 -0400
Received: by mail-pl1-f195.google.com with SMTP id w7so1158873plz.1;
        Wed, 08 May 2019 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nZa/rVFqYlCABHsDIEvh0ySWcdIXBH3APQZbGajRFsw=;
        b=jn74uX0nUzJwU6Jzp61zr7oCaFQ0C9r23rG7FC5zV3amCN2DOojHeQ9KArVrenveGp
         iE85RZjJpuXu30Xc0kp7ftAQnQ7ha+tKh/myAtQKan+LzZ/wa10j/DLoROtoJxniFgyC
         ixMXiqRwmY6eWQBhcZMc7xw8gUAatIielF3dJW4CvZcF5m+hOkkN1S/GeXnYZSBB4Pms
         gsbkHS74yj1OZ6JWEQOHehT/r2ydBnNerXVmfN6gA2yGEVCX0mXbGerEZl9X883LpBj1
         63+8U0/qaEEjchfBEQRU0yjB38pXBqRZ/NJfL38KrdUK74U93mxcm3QZvNupIh5X71Gq
         p41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nZa/rVFqYlCABHsDIEvh0ySWcdIXBH3APQZbGajRFsw=;
        b=nzopndn7WAqs4MUDgqyXNF+/dvUqzOKFyXR3sUSFQ+hfRCTt5SqgQGSZwOT/zd30eX
         gwEo8w3wgxHMwcP+Gj7Y65VpPT4RjwFDK+p5boakpv6GKMzFAqzXiuaI2GAfgAaWnLH5
         gQmfmmb6ihhLvgQg3WKNL1ErIAVic5pkWkckTqS5WhjSyhsmHuxvFAM3yklNUUgQj5fu
         2EUw/NdGYIou0UXANSUiYnAzZgiPu+hDlP+FS+svqWCOt+8wvyqHatdIiPJef+h+7tLm
         bnmOm3HFh0Ooss8nlSam4tlFqqyEcf21pv2Hwh4CeRFW6Xq8nXdQBtYsSBAcym2Y3H4N
         mdyg==
X-Gm-Message-State: APjAAAXnB76B1xgSHDnDLuI9KOD95eaEMNuNzVpx6Lat+5SWeHCc+BiN
        MEQsKaxLnXZHJqrVptVKRaY=
X-Google-Smtp-Source: APXvYqyvnGvdh44Gnr++BrN+spWWXY1NLWiDeaNmB9lhagQVN2gQmVZ6rlhb+KR7+MvqWKVfqL1nBQ==
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr48746957pll.12.1557333247236;
        Wed, 08 May 2019 09:34:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h74sm29914217pfj.5.2019.05.08.09.34.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 09:34:06 -0700 (PDT)
Date:   Wed, 8 May 2019 09:34:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: sama5d4: fix WDD value to be always set to max
Message-ID: <20190508163405.GB5495@roeck-us.net>
References: <1557324535-9050-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557324535-9050-1-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 08, 2019 at 02:15:03PM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> WDD value must be always set to max (0xFFF) otherwise the hardware
> block will reset the board on the first ping of the watchdog.
> 
Not sure why setting WDD to the same value as WDV would do that,
but on the other side it looks like setting WDD to anything but
the maximum doesn't add any value either, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/watchdog/sama5d4_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
> index 1e93c1b..d495336 100644
> --- a/drivers/watchdog/sama5d4_wdt.c
> +++ b/drivers/watchdog/sama5d4_wdt.c
> @@ -111,9 +111,7 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
>  	u32 value = WDT_SEC2TICKS(timeout);
>  
>  	wdt->mr &= ~AT91_WDT_WDV;
> -	wdt->mr &= ~AT91_WDT_WDD;
>  	wdt->mr |= AT91_WDT_SET_WDV(value);
> -	wdt->mr |= AT91_WDT_SET_WDD(value);
>  
>  	/*
>  	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
> @@ -251,7 +249,7 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
>  
>  	timeout = WDT_SEC2TICKS(wdd->timeout);
>  
> -	wdt->mr |= AT91_WDT_SET_WDD(timeout);
> +	wdt->mr |= AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
>  	wdt->mr |= AT91_WDT_SET_WDV(timeout);
>  
>  	ret = sama5d4_wdt_init(wdt);
> -- 
> 2.7.4
> 
