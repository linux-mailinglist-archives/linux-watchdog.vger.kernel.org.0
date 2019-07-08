Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7A0627E4
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Jul 2019 20:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732111AbfGHSGG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Jul 2019 14:06:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36485 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfGHSGF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Jul 2019 14:06:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id r7so7982300pfl.3
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Jul 2019 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o5jp33+e9XFNsq5NqjPh6VWgO/KNU7UaHVvjk1B02Oc=;
        b=PBos0Xcf4Wi6b/Glj2RCCQQ/EWYdgxCEcweWqstS1MGDt08/gGaaaRC3+6gjTLNWfS
         Dxw2c8uEw51oRgDdj2UQkQJSFetKSnzV+4YGsV17c+uKmEZFEQ+Jt3Rp9WlG2J/sKjnm
         h9K4SnECAV4eAQdu6eEu5Ly9m6YKm0HILPY15rH6u6UAvCFL0rVPnpIN9zRXHrDvJOAD
         sjueuPDFuBNK0QgVCVgW59i6KIgHBRaJ568pG7L5Y2Uh4eXXuiy7PmBXuL01S8TG7OwB
         xEkuL/592qlJjUgdvlrHUoIzFFXQdnN40jQRVhxXNqB3wP53tARDgJGEWEoeowjfZhj7
         /LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=o5jp33+e9XFNsq5NqjPh6VWgO/KNU7UaHVvjk1B02Oc=;
        b=tPjmfgqbeovNw9rUkUwxncaHQwqZEhFTBLshksFbhuHoypbET4ybE08mAGLv60OADg
         r3f43/LgDjptbIxPv6vlrLow2O5Uv6yWz4ZfdvpF37P0w9ei4Q3cPbQgjXE71Yfiop+Q
         rvtKNmgadFzthVDFJVmmDjuwb/v0e2Wme4jZUGj8gh1UAGbUgtbZRifd0ctxm3jxhIdS
         Fbc4El1ttb6BN/EiudvA4InhVv8s3u36n/B8roVU/kHPz4smIj03VRAMGqFUq+/yoGKd
         8zFSvO0neE0opX9a4GV2XtFMvXbwo4K0OrMuuo4VjujB31GxxhRxDYHR3mEsMyJioK2F
         semw==
X-Gm-Message-State: APjAAAXO1bPhaigerk3Bq/jibNiO4xCfAjTHmi/cRUuso+TKfLv2n+Go
        rZvQBv4aa02SMVUCgDT24z0=
X-Google-Smtp-Source: APXvYqyHI2gmLG3saBPnQiQYE1Mw0telrVLytiQmZ7U4MmbiZmhH7z7G4GWcYIhnJ1vnBe+LRhebyg==
X-Received: by 2002:a17:90a:2343:: with SMTP id f61mr27836080pje.130.1562609165059;
        Mon, 08 Jul 2019 11:06:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k184sm16958847pgk.7.2019.07.08.11.06.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:06:04 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:06:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Melin Tomas <tomas.melin@vaisala.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] watchdog: cadence_wdt: Calculate actual timeout
 limits
Message-ID: <20190708180603.GA14509@roeck-us.net>
References: <20190705114522.42565-1-tomas.melin@vaisala.com>
 <20190705114522.42565-3-tomas.melin@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705114522.42565-3-tomas.melin@vaisala.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 05, 2019 at 11:46:02AM +0000, Melin Tomas wrote:
> Maximum and minimum timeout values depend on the actual input clock
> frequency and prescaler selection.
> 
> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
> ---
>  drivers/watchdog/cadence_wdt.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index 415bd6dd1edb..87b767c87bb6 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -18,9 +18,6 @@
>  #include <linux/watchdog.h>
>  
>  #define CDNS_WDT_DEFAULT_TIMEOUT	10
> -/* Supports 1 - 516 sec */
> -#define CDNS_WDT_MIN_TIMEOUT	1
> -#define CDNS_WDT_MAX_TIMEOUT	516
>  
>  /* Restart key */
>  #define CDNS_WDT_RESTART_KEY 0x00001999
> @@ -28,6 +25,10 @@
>  /* Counter register access key */
>  #define CDNS_WDT_REGISTER_ACCESS_KEY 0x00920000
>  
> +/* Counter control register, counter restart values */
> +#define CDNS_WDT_CCR_CRV_MIN 0xFFF
> +#define CDNS_WDT_CCR_CRV_MAX 0xFFFFFF
> +
>  /* Counter value divisor */
>  #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
>  
> @@ -315,8 +316,10 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	cdns_wdt_device->info = &cdns_wdt_info;
>  	cdns_wdt_device->ops = &cdns_wdt_ops;
>  	cdns_wdt_device->timeout = CDNS_WDT_DEFAULT_TIMEOUT;
> -	cdns_wdt_device->min_timeout = CDNS_WDT_MIN_TIMEOUT;
> -	cdns_wdt_device->max_timeout = CDNS_WDT_MAX_TIMEOUT;
> +	cdns_wdt_device->min_timeout =
> +		CDNS_WDT_CCR_CRV_MIN * wdt->prescaler / clock_f;
> +	cdns_wdt_device->max_timeout =
> +		CDNS_WDT_CCR_CRV_MAX * wdt->prescaler / clock_f;

clock_f can at least in theory be 0. So far that didn't matter as
much, but now it would crash the kernel. Please add a respective
check into the code.

>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	wdt->regs = devm_ioremap_resource(&pdev->dev, res);
