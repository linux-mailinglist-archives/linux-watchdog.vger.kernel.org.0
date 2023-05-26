Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A90712B27
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 May 2023 18:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237572AbjEZQz0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 May 2023 12:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbjEZQzY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 May 2023 12:55:24 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E289A3
        for <linux-watchdog@vger.kernel.org>; Fri, 26 May 2023 09:55:23 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d3fdcadb8so889109b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 26 May 2023 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685120123; x=1687712123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uonXW/UcZs9tQNTmmJxWHm9viTyN5jx7aNJnBKs03c=;
        b=gcJ0QzaAj5ZABxzFx0RfW6DZ24rDLF9B9PPbu7XJYk3AjmupZB+/Q+BrK4KZ8tHkyO
         ohidm9qi5YGd0FkZPfFYI9Vc9UoffuEc9m7QY2ECW1Zirwe7GueLKj3rtMX4uCSNPR0f
         DKD647n3jd+JAAnhya66UPlSnCuGwjwdBiEXf14HzsKSNpFlD6WNuKLh1Ws/ou/mUYae
         7uhH/r1YZozXcZbK4VvYwUSSU7leDB9S1Ho3RkfbtkamG2XOHKCXNp6cMqfdvb1zFN2Y
         ZcFKnqyampWDoJT8pGBwkbeHFWU9hxXAeh6wl3J7APYm0CQ6IL1wFK+aNx8fw7MCs8v6
         8bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685120123; x=1687712123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uonXW/UcZs9tQNTmmJxWHm9viTyN5jx7aNJnBKs03c=;
        b=A9LoUI74U7tdQvM4J0mN31bMNKgdVOvF2jjCF/1QzBdGGzDUy7cPZa6/E6ZOJbsoP4
         11KmyyDuMHeRpo0XgFnz4/sYdSQcBO725EJdNSl5pNc6fN8KSolYi177Xly85AZyn3iO
         c9kRLMjY/9xaSTnsWYBgaE5VgOB5tP2izrPnN2SlLgWTRnUrfj5+TouhMrf5wwXCS1UP
         6vAzGtZ7dkrPVVpwnGojkcG0+Jxx/Obj2oO5Jf4wvgcd/wtLN7PU5eE0oPVfEMs4BEVR
         WGJYhDf3HreKDHGhNKInRC4Y4PeCFFnKjAuCrLtQHiIVtyxs+/7OajeW2PffAr0hMkcu
         MolA==
X-Gm-Message-State: AC+VfDyBoQ4NITue8khDdL61z0+IbevCXPdRfx3lo89LM/LckMH6Eiyu
        ZKi7k2i4voqKETm6ikwzARCJAc4FhNc=
X-Google-Smtp-Source: ACHHUZ46RfwiYVoC3heCba437w+r8PetTpUcMAzUMGElGLgVP79qLnlGyGY6/4swhDC8W5w1A7BNYQ==
X-Received: by 2002:a05:6a00:23c4:b0:644:d775:60bb with SMTP id g4-20020a056a0023c400b00644d77560bbmr4494329pfc.20.1685120122452;
        Fri, 26 May 2023 09:55:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p24-20020a62ab18000000b0063b7b811ce8sm2889951pff.205.2023.05.26.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 09:55:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 May 2023 09:55:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use
 .probe()
Message-ID: <1a2f452a-14f4-4b29-b1c2-8e69d5d86814@roeck-us.net>
References: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 25, 2023 at 11:08:37PM +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/ziirave_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
> index 21ca08a694ee..5ed33df68e9a 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -731,7 +731,7 @@ static struct i2c_driver ziirave_wdt_driver = {
>  		.name = "ziirave_wdt",
>  		.of_match_table = zrv_wdt_of_match,
>  	},
> -	.probe_new = ziirave_wdt_probe,
> +	.probe = ziirave_wdt_probe,
>  	.remove = ziirave_wdt_remove,
>  	.id_table = ziirave_wdt_id,
>  };
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> -- 
> 2.39.2
> 
