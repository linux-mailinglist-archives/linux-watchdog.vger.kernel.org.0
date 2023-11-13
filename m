Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2927C7E9EC0
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Nov 2023 15:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjKMObT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Nov 2023 09:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjKMObT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Nov 2023 09:31:19 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17716D59
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Nov 2023 06:31:16 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77896da2118so292622685a.1
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Nov 2023 06:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699885875; x=1700490675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8rnRPmPkUQ1v83ltxGmtO//1kNlrcWfJmIubhorQbs=;
        b=MbClw2CCPYH8fhe2AaQIEA6vFDeeo5aixHDWfJVUXTWT8HPyzxf6uKEejH9qV59WPy
         AggGxVe9J5sIA7TeuYsszGwRXPONcb/bJLQBURE/FhDMb6adZ1sSYHFFgeMA6St3rWz9
         iec0anrQQAMzWTfVdgss6orNU8vYtJaKEPLdXAHZwdNw36KqDiCdVxv3dl2OA9YYl/lg
         HGS7DyOdDWNmJuX270glr3Lmy86JGzn+RtOatAW/RbhS6KP+NB3EZnMTDl1QudMNkwR/
         RsRrP0GlTHkpd29KUIZEbP40ev41kZbotxrmGR/WTe/cjQm/hm7QPFHOlcZLvqMoGN+I
         XziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699885875; x=1700490675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8rnRPmPkUQ1v83ltxGmtO//1kNlrcWfJmIubhorQbs=;
        b=JqZZQH5BH+TFy8jhYdN5C0yIQ9Khg7vzyOJcKF720cL8PY/f+y0jnzR/4pAHQYGOST
         3Fjq6EeqY2ihg4p7tyiOiH9bxifiPMN9pm8SpqtNXj9qPSIKI6FpMr9/NBPPl8YDeIVg
         6ytSmfuqBqx9fkznMBQ3Nd7BL0fNUBUaxm4pxKlhZLY5fQPUTFDUgHaKxs76cDcJuRVE
         P69LOrb/px4Ip58CLD5CpcPUA2XlWdzg9c8PXIBCDdX028e4EFOLuI1fwPeW+We4TxCs
         IzxYMdkk/t9Xh587GV+eTLQfAvvx3V34dYcy/0HblNj8yMd4Zs5KYVJgY9bi9SjwRYO+
         GFxA==
X-Gm-Message-State: AOJu0YznlJNDx85+qc958GUGUkhdpIbSNXdQj2ZRthpxOrQhLZRNKmUh
        pDhSKftTRlBjCO/JoXyQ2So=
X-Google-Smtp-Source: AGHT+IHVnPHvd2OOP3k0CJ8oaFadRcPZmDkVx7FEoxTUNDcVyLNdaRXSGMXhm3glTzVy1ascCDtSLw==
X-Received: by 2002:ad4:5047:0:b0:671:365:14eb with SMTP id m7-20020ad45047000000b00671036514ebmr6570011qvq.52.1699885874883;
        Mon, 13 Nov 2023 06:31:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8-20020a0cf9c8000000b0063c71b62239sm2094182qvo.42.2023.11.13.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:31:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 13 Nov 2023 06:31:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Phil Elwell <phil@raspberrypi.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
Message-ID: <cce852fd-618c-44f5-aa86-1cd33bd97351@roeck-us.net>
References: <20231112173251.4827-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112173251.4827-1-wahrenst@gmx.net>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 12, 2023 at 06:32:51PM +0100, Stefan Wahren wrote:
> Users report about the unexpected behavior for setting timeouts above
> 15 sec on Raspberry Pi. According to watchdog-api.rst the ioctl
> WDIOC_SETTIMEOUT shouldn't fail because of hardware limitations.
> But looking at the code shows that max_timeout based on the
> register value PM_WDOG_TIME_SET, which is the maximum.
> 
> Since 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat
> in watchdog core") the watchdog core is able to handle this problem.
> 
> This fix has been tested with watchdog-test from selftests.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217374
> Fixes: 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm2835_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index 7a855289ff5e..bb001c5d7f17 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -42,6 +42,7 @@
> 
>  #define SECS_TO_WDOG_TICKS(x) ((x) << 16)
>  #define WDOG_TICKS_TO_SECS(x) ((x) >> 16)
> +#define WDOG_TICKS_TO_MSECS(x) ((x) * 1000 >> 16)
> 
>  struct bcm2835_wdt {
>  	void __iomem		*base;
> @@ -140,7 +141,7 @@ static struct watchdog_device bcm2835_wdt_wdd = {
>  	.info =		&bcm2835_wdt_info,
>  	.ops =		&bcm2835_wdt_ops,
>  	.min_timeout =	1,
> -	.max_timeout =	WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
> +	.max_hw_heartbeat_ms =	WDOG_TICKS_TO_MSECS(PM_WDOG_TIME_SET),
>  	.timeout =	WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
>  };
> 
> --
> 2.34.1
> 
