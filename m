Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6EF454029
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 06:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhKQF1t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 00:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhKQF1s (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 00:27:48 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97E9C061570;
        Tue, 16 Nov 2021 21:24:50 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id v30-20020a4a315e000000b002c52d555875so615522oog.12;
        Tue, 16 Nov 2021 21:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pzND+g9ePgCLKa8kP/JODvmaRY06knIDXo8zBx6RHwg=;
        b=Qrp1cdZLIW0wk6S9Au0xuw9JzbL3uO6HXNORkqQTLO8BXzEKVKVwjQTCpq6RkWTXns
         MBW1UUwZXr7aIToYUTcNn/CSrc9Vzi7zuZmfS1MKddS5NmWm9W7j+PErLkGiXf7A1QYx
         VrtOyI1f5jmghaXd5BTfrzAHR1cSP6sws9YkdJMM+WVBJYyDBLJhbqlHu9G3JlAFQHE6
         HsdXzGyN1cRF/K7XhHfw9jcSRl/B1GesjJfiggwdjsoVNEjeLED4RdzJPK2do0sPGu8A
         pamouxVBeRtNfnzgoVEY5Yz2jwQXEacOJoSrXWYJ/TcbY6O7hD1xuC/pANlLh84S2phK
         PSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=pzND+g9ePgCLKa8kP/JODvmaRY06knIDXo8zBx6RHwg=;
        b=lZaKypxGO7/EZQSeYi0xJx/mYkFmRjGrd9u68izBlD/JhvMWoA0lFbiBXEwY9v4kND
         CzLKH1MfNd/Wt5Ym9FDwjK61SnhF27N2iezRc8DL6c69BLOXjk5sjok5QfhtJBJ3M+GD
         iqiiTiUFzhbbr+G9ZDbcJ1zxZdER2uLY8VbsZPgv1nj7R6RNYw+Fg8+bxHIjTn5qNjNK
         x98ne46T3I+/5hC+j5R2cAln1SZvMLrIZ6EMISfuuVr61TOiG10GSF5Cc6KsZO6JOZ1T
         hGke6YyuMauof+0m5YezW0FR0YJHylKgbyuXwjGytVhwSVaAFmHh1j3be99PxpPO91xG
         Kteg==
X-Gm-Message-State: AOAM5327My0//DSU1upkCF2bo900YbBDLu5O5mtGZJlKmqvLflqh2Xe/
        6ptJZLPFPM0aTJjUgoUuyVXSAfITEto=
X-Google-Smtp-Source: ABdhPJyd3I6kwvSW2vAkn9kC3Yf7QNDBQrka8GdDVF7Q949feqkLgm1/rQliEHjiD3vLG/IAktZuUg==
X-Received: by 2002:a4a:e096:: with SMTP id w22mr6982384oos.14.1637126690034;
        Tue, 16 Nov 2021 21:24:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j187sm4379804oih.5.2021.11.16.21.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 21:24:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 16 Nov 2021 21:24:48 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     AceLan Kao <acelan.kao@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        SophieHu <sophiehu@aaeon.com.tw>
Subject: Re: [PATCH] watchdog: f71808e_wdt: Add F81966 support
Message-ID: <20211117052448.GE215087@roeck-us.net>
References: <20211117024052.2427539-1-acelan.kao@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117024052.2427539-1-acelan.kao@canonical.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 17, 2021 at 10:40:52AM +0800, AceLan Kao wrote:
> From: AaeonIot <sophiehu@aaeon.com.tw>
> 
> This adds watchdog support the Fintek F81966 Super I/O chip.
> Testing was done on the Aaeon SSE-OPTI
> 
> Signed-off-by: AaeonIot <sophiehu@aaeon.com.tw>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/f71808e_wdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index ee90c5f943f9..7f59c680de25 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -49,6 +49,7 @@
>  #define SIO_F81803_ID		0x1210	/* Chipset ID */
>  #define SIO_F81865_ID		0x0704	/* Chipset ID */
>  #define SIO_F81866_ID		0x1010	/* Chipset ID */
> +#define SIO_F81966_ID		0x1502  /* F81804 chipset ID, same for f81966 */
>  
>  #define F71808FG_REG_WDO_CONF		0xf0
>  #define F71808FG_REG_WDT_CONF		0xf5
> @@ -105,7 +106,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>  	" given initial timeout. Zero (default) disables this feature.");
>  
>  enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
> -	     f81803, f81865, f81866};
> +	     f81803, f81865, f81866, f81966};
>  
>  static const char * const fintek_wdt_names[] = {
>  	"f71808fg",
> @@ -118,6 +119,7 @@ static const char * const fintek_wdt_names[] = {
>  	"f81803",
>  	"f81865",
>  	"f81866",
> +	"f81966"
>  };
>  
>  /* Super-I/O Function prototypes */
> @@ -347,6 +349,7 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
>  		break;
>  
>  	case f81866:
> +	case f81966:
>  		/*
>  		 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
>  		 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
> @@ -373,7 +376,7 @@ static int fintek_wdt_start(struct watchdog_device *wdd)
>  	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  	superio_set_bit(wd->sioaddr, SIO_REG_ENABLE, 0);
>  
> -	if (wd->type == f81865 || wd->type == f81866)
> +	if (wd->type == f81865 || wd->type == f81866 || wd->type == f81966)
>  		superio_set_bit(wd->sioaddr, F81865_REG_WDO_CONF,
>  				F81865_FLAG_WDOUT_EN);
>  	else
> @@ -580,6 +583,9 @@ static int __init fintek_wdt_find(int sioaddr)
>  	case SIO_F81866_ID:
>  		type = f81866;
>  		break;
> +	case SIO_F81966_ID:
> +		type = f81966;
> +		break;
>  	default:
>  		pr_info("Unrecognized Fintek device: %04x\n",
>  			(unsigned int)devid);
> -- 
> 2.25.1
> 
