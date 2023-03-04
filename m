Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEEA6AAB63
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjCDREP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDREO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:04:14 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354C7113F7
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:04:11 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id l2so3838875ilg.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ICo7QzFzv93b/QKnAE5vAa3fTCFRiSH/41KBvlxxZs=;
        b=kRZZgfB0CGQapVETacF77c4Nrb0b0i38+D1lIwSk3Dl/jUB+6tsLblIi4VFGw29I6d
         /xepGjM6g9pMbLVnUnEL3IdnadWGbWdIJ07T1TZ/dgasqYePkBu/EH8a6B1UbQepJbju
         avMq+4WyAz/9rdfqjyDcguihaoO7BR8Rbd1vC9TQxr26+jwftIFWr/SBUVTB2/gGxMCQ
         tQVMfBZhoWj15RzYiA8WiYeg3JLDJeKAWOUTVn4Afs1N2seYtVRsPWEHz6IOAZzCnOp7
         WYtwJUsuRzfVukzcKC8lGdCV74tqy3Lbi6EOEHpT+fNQVQKkrzsVY8ugdsdfa9X6C5GQ
         qX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ICo7QzFzv93b/QKnAE5vAa3fTCFRiSH/41KBvlxxZs=;
        b=GNZbpklcOZk5gbRPeyEoIg2OpI7ASdjAuOeLkKDTdszOUa9ILbme0OJjlE6m85LX+u
         bkLz86SrsqnTJx3zO5kEDJMTIkMs5f7v3zbeRENrWjoyVwqzNS/NoNOLAkKW95DhCRFL
         vLyNQff72R+GWmHG16cV7+A1RUJkyPhdy9RHjUXTwGYmYFNRyzk/j0+pTFA35yEK2kC+
         W6HMIkpmC+99BerPFrP+A3CEMay2qzpR/Wh6tR4WrJKEqiprqmWWNM3i6S65mYuR8WfL
         TOd2Vd26ms1UXnExEM0y/ztM1nBH4ZLrjp8jXr8Tr1dSHMxg+/EmMji49chtR+TCPJBK
         jIRQ==
X-Gm-Message-State: AO0yUKUYGrb9JP2rf9nnygnhp0W9wHv1HtQfQklSOboRzd+47kHpGiq1
        hGdNJRck6VQuIrEopLlcYiY=
X-Google-Smtp-Source: AK7set+5NUuVjjXv8qSQ3HH710uFyOU71LuzhiXkET6RxrKfaTq1sNH1LZc59ck1qST6HNHzj/jxsw==
X-Received: by 2002:a05:6e02:188f:b0:315:9452:2822 with SMTP id o15-20020a056e02188f00b0031594522822mr5808058ilu.0.1677949450621;
        Sat, 04 Mar 2023 09:04:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j16-20020a02cb10000000b003aef8fded9asm1689945jap.127.2023.03.04.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:04:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:04:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 07/34] watchdog: bcm2835: Convert to platform remove
 callback returning void
Message-ID: <a1bcf8fe-ef3e-45e5-a3ac-fa9a503efae0@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-8-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Mar 03, 2023 at 10:36:49PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm2835_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index 94907176a0e4..7a855289ff5e 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -218,17 +218,15 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int bcm2835_wdt_remove(struct platform_device *pdev)
> +static void bcm2835_wdt_remove(struct platform_device *pdev)
>  {
>  	if (pm_power_off == bcm2835_power_off)
>  		pm_power_off = NULL;
> -
> -	return 0;
>  }
>  
>  static struct platform_driver bcm2835_wdt_driver = {
>  	.probe		= bcm2835_wdt_probe,
> -	.remove		= bcm2835_wdt_remove,
> +	.remove_new	= bcm2835_wdt_remove,
>  	.driver = {
>  		.name =		"bcm2835-wdt",
>  	},
> -- 
> 2.39.1
> 
