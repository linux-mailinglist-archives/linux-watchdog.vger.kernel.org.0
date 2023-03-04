Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD606AAB6F
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjCDRJZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRJY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:09:24 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5318EE065
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:09:20 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id l2so3846158ilg.7
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+B6XVbbe7FFeNPmseK4OtETOoWgwZpM6QC94j616ryI=;
        b=nzP/Qc0V970VmtQfg8mGouAWuNeofc3eF+KXS8eMXd00Bz1ETk1x7vmg+yUHhl7Cck
         lefm9B5AL61FDLFegwSbksx08MKxZwgbo5846uhh4Mmf/89f9+VnEU5w9zxInC6Ltsb+
         nRH7lHBQ0GoUbZwAy8+iKVeZsH3VCi4nR8U115l5NEU4c7xm00Aub/q62sxKg1RD81I4
         T9scsfP16ohcq9WacXUFGl5R6jfHvc6w6IYhNQxQ9B2ZCZUbmYwVzliaQR2Fvfnm5YP3
         aqnmnrZGFp1XsCOAHRl7pUMSXXp6/T5PwMKGxwMWsR33sMgyuMIkK1vrYWg6vDJJN1R7
         LtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+B6XVbbe7FFeNPmseK4OtETOoWgwZpM6QC94j616ryI=;
        b=We9IrfzsFZlnoOGxJ3JE1gDE1Q7lYXv9G7Sv8tdV+RHD6roAsgwYHxwJVHlDIgI3CD
         7n5PcDeOD2h94zY/O0I/g3kohHaR7MnliCv4NqUgRKxDL8G/YwKpQyapz8/WwmwbGlek
         SviOGAeDg8LtWstzdNQt4oi+8yJLGE2bmDtqMtCGdqsdbr09S3He/z4gsLD3LxI9XbF/
         n4Yr0/fqcvfYRWswIJ5FlfCHp/2tsSJ0CHhMfjxbns2+ICkOozcq32HfqEaNq+6hBj7s
         0Q3+4dCr7QIAm16bTfo9R6G0SGQjCc7BAgY/pgq5OFdST8yeIaNFuK3h/zEncIw6wXWr
         jmZw==
X-Gm-Message-State: AO0yUKUuQ6aAWnz56My+a8kOc0h22IhPZIPbUxhPhnlzHOhIR5CUakPt
        99rRPdSHlpWCIGXmyti/tiB/qgIPVwo=
X-Google-Smtp-Source: AK7set+UiPghzjcNdGg/klHEuKjUjwcgf5XfH5OCHQdM07SFPUizOWMzlSEWH9g7yhwZ8fOO1xMsZw==
X-Received: by 2002:a05:6e02:1b87:b0:310:d294:1664 with SMTP id h7-20020a056e021b8700b00310d2941664mr5337283ili.7.1677949759710;
        Sat, 04 Mar 2023 09:09:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dj15-20020a0566384b8f00b003c86e420f9fsm1735778jab.100.2023.03.04.09.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:09:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:09:17 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 18/34] watchdog: nic7018: Convert to platform remove
 callback returning void
Message-ID: <f7484d63-e351-4256-a1a1-2bc099feeea2@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-19-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-19-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:00PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/nic7018_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/nic7018_wdt.c b/drivers/watchdog/nic7018_wdt.c
> index 2a46cc662943..c3f0a4926667 100644
> --- a/drivers/watchdog/nic7018_wdt.c
> +++ b/drivers/watchdog/nic7018_wdt.c
> @@ -218,7 +218,7 @@ static int nic7018_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int nic7018_remove(struct platform_device *pdev)
> +static void nic7018_remove(struct platform_device *pdev)
>  {
>  	struct nic7018_wdt *wdt = platform_get_drvdata(pdev);
>  
> @@ -226,8 +226,6 @@ static int nic7018_remove(struct platform_device *pdev)
>  
>  	/* Lock WDT register */
>  	outb(LOCK, wdt->io_base + WDT_REG_LOCK);
> -
> -	return 0;
>  }
>  
>  static const struct acpi_device_id nic7018_device_ids[] = {
> @@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(acpi, nic7018_device_ids);
>  
>  static struct platform_driver watchdog_driver = {
>  	.probe = nic7018_probe,
> -	.remove = nic7018_remove,
> +	.remove_new = nic7018_remove,
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.acpi_match_table = ACPI_PTR(nic7018_device_ids),
> -- 
> 2.39.1
> 
