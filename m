Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A018A43CFBC
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 19:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbhJ0Rdn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 13:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbhJ0Rdm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 13:33:42 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C88C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:31:17 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so4597238otq.12
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ksexwST9qvDN27qOTH0J9Yh/ySFh1ON/feQFJjqLtaQ=;
        b=gQfO2S+1hPhLfGAdoibSdj0DZYNtd8wzumasWLGMhTxc/eygCIHlilGD/k1nskJWLM
         d3E5M+XmP23bOs9BPOfbbrB6WSO+xnDmGVOHoj8HvdaZoxSldp/+pZbD5tSmRyh9LAvw
         V7o65zK/F0YKeNprjKACwtDQkDmTPbHeoJJY/BXYzMchp8H7VXzzCjT62HPylgSz8G5v
         JgU13IqajqxITaaCBLS74JgnDBxdfRCJJJW0Q65Q8lSt91jz/Gpkul6aNJiGvXhPCK+e
         VwFgIvG/S/MoXClXlOUeifRgGS6FrltQrH+Q+nPQzWqHjZerwI4qVWW5/z03qlAjnGuL
         YGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ksexwST9qvDN27qOTH0J9Yh/ySFh1ON/feQFJjqLtaQ=;
        b=mxD50h9MI4wU1Y+EX7Sf8FvG2TSMnyowikMmd1XNcuv4nq37fFMq3PA++NpycAW8Y1
         iXo87UimW4xsdXdOH2ioU/koYfv8IInXPQkmlq4KyAIXhTOm1xdKmAvLrSW0Ju/Evx2M
         mGWTyUzSCEZbnGol66o4ffW1cRiN6TGcn1+riIcUdATjsHy8tn+xPozczCALEuxpaVZa
         cgLct5xWKML0+zQtFXpYPoCV3JgAUAC16n2687hYIvIGsrcmwrb+ZKvcFr2ubi68uzTM
         xQ/G53oAYqkmwCbByvxTnCC7cSvBuufc4PIf5z/rDf1nZOswA7EWTFZ2LXiJ5g1Ysl+S
         TMbQ==
X-Gm-Message-State: AOAM533TTi/rzXqkU+8G0cJPMceCsaFG85OfOOkvaKSqtEX2Acv9mAGU
        ZNedFULkiFzWXBRN9Oun5kLstnOjd9o=
X-Google-Smtp-Source: ABdhPJyRzF35cy3HgXrrMwQ4+8WxObDZ53yQIqHn8yhOFAWVT8NGjtRELy7W9uMENmIsx8WKCiS8Ug==
X-Received: by 2002:a05:6830:410e:: with SMTP id w14mr26287876ott.256.1635355876637;
        Wed, 27 Oct 2021 10:31:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x14sm191587oon.32.2021.10.27.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 10:31:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Oct 2021 10:31:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
Message-ID: <20211027173114.GA2327649@roeck-us.net>
References: <20211027123135.27458-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027123135.27458-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 27, 2021 at 02:31:35PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes:
> drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
> drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

[reluctantly]

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

... because the driver should really be converted to use the watchdog subsystem,
by someone with the necessary hardware to test it.

Guenter
> ---
>  drivers/watchdog/bcm63xx_wdt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/bcm63xx_wdt.c b/drivers/watchdog/bcm63xx_wdt.c
> index 7cdb25363ea0..56cc262571a5 100644
> --- a/drivers/watchdog/bcm63xx_wdt.c
> +++ b/drivers/watchdog/bcm63xx_wdt.c
> @@ -207,6 +207,8 @@ static long bcm63xx_wdt_ioctl(struct file *file, unsigned int cmd,
>  
>  		bcm63xx_wdt_pet();
>  
> +		fallthrough;
> +
>  	case WDIOC_GETTIMEOUT:
>  		return put_user(wdt_time, p);
>  
> -- 
> 2.31.1
> 
