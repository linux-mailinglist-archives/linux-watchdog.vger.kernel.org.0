Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D6F6AAB75
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCDRKT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRKT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:10:19 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D2212BF4
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:10:17 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id b12so250711ilf.9
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ne5H2BkGXj6dAoH7jJjW3kPHbJh98vzB4LIbgv18Uys=;
        b=cWMP8fR0nBI/lUNm0vdJVnkhO/j49Jv+wLCTJNN7JwvRuIPdcDJ3lWXgJlfSxR2l7l
         MLkvFDWnyukpmn79u5VxUeHS+8u35QVrjjyBUn9CmvNodv19DiQUbaEz5jug73Mhf6gI
         c8n7nqKc2itM1In7yynyCTM1FHp6aJxtJQ74x3gPibhjaI8vE4MaaHI1TNcA1B1Eboa2
         +Rg4GMAJDX9REGNsSqjn7317sFhLF0DntgRX85Ob+G7yLl+xgiWMVcYs6JfmjVy0s6A4
         KyIF5pG1kV4A5SENiN0kuiJYVwPODg2Lj4EH3i4G6GhFECW5DSH1VEYkHgMcNcTftARl
         9FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ne5H2BkGXj6dAoH7jJjW3kPHbJh98vzB4LIbgv18Uys=;
        b=k6d3C0AdxTGsprtQGBra/UVDJVVwsnKLHRXX/ILfdIhhw/b6VN/6bfBn9NxvaIPhdp
         7rFSRgvrCLyckEsxFp7upBCGXBBFieOw/Nkdq8Kyr/IlTtqMbva/IscQiwD9N1kfhINw
         dwzPKibhqChInGOs1CmeZ1gzH74y8Cs8FF7zQk168qn7zFLumiJw2iVqFzypRoWBnIBV
         TQ2uOiRF8yKXJXBAB5fpuCtGL++KUCSKigD0ZCZ6vVFPAC/cXe/l37yOJM7xEce9zujx
         fjAPrIlsm0kW9Nrqd/lKkvBAwkftGHcth0Sp79auRdUU6eN2gfVusdtQLhWlbqcXlbNf
         7UKw==
X-Gm-Message-State: AO0yUKUv5B9+igkQBgQzV5IGXmrc9XpUVQ2yaoxa0B7ilbmSthERL7m6
        cvBsjDJZGMHgjbn7G2snf00=
X-Google-Smtp-Source: AK7set8LJBCGJNTKHW/E+O4b6yvDfByHSlfsunKdmb8YkxZP/A85ZMWLLeyddrxXicn5446WZuko1g==
X-Received: by 2002:a05:6e02:1b09:b0:315:90a1:a8f7 with SMTP id i9-20020a056e021b0900b0031590a1a8f7mr4968953ilv.25.1677949817270;
        Sat, 04 Mar 2023 09:10:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12-20020a02a90c000000b0039df8e7af39sm1759234jam.41.2023.03.04.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:10:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:10:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 22/34] watchdog: rc32434: Convert to platform remove
 callback returning void
Message-ID: <6d750902-c0f3-4650-a6a5-0d8630d5fce4@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-23-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-23-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:04PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/rc32434_wdt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/rc32434_wdt.c b/drivers/watchdog/rc32434_wdt.c
> index e74802f3a32e..417f9b75679c 100644
> --- a/drivers/watchdog/rc32434_wdt.c
> +++ b/drivers/watchdog/rc32434_wdt.c
> @@ -298,10 +298,9 @@ static int rc32434_wdt_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rc32434_wdt_remove(struct platform_device *pdev)
> +static void rc32434_wdt_remove(struct platform_device *pdev)
>  {
>  	misc_deregister(&rc32434_wdt_miscdev);
> -	return 0;
>  }
>  
>  static void rc32434_wdt_shutdown(struct platform_device *pdev)
> @@ -311,7 +310,7 @@ static void rc32434_wdt_shutdown(struct platform_device *pdev)
>  
>  static struct platform_driver rc32434_wdt_driver = {
>  	.probe		= rc32434_wdt_probe,
> -	.remove		= rc32434_wdt_remove,
> +	.remove_new	= rc32434_wdt_remove,
>  	.shutdown	= rc32434_wdt_shutdown,
>  	.driver		= {
>  			.name = "rc32434_wdt",
> -- 
> 2.39.1
> 
