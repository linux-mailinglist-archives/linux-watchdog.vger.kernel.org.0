Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B326AAB78
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCDRLC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDRLB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:11:01 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3A113510
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:11:00 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id 4so3857115ilz.6
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wpQINzxq3dPsn3B4tqJ00jgDqN9SsTnp4sqKQle58A=;
        b=oot7eXuKbqq7xFeiAshmWghEPCxUQzEgMjNBK4PnKHGtL/y16sdHnRj/h+n5mDkQtE
         WB/cgo3H8NOx3u6VfKhUdaH0geo6Commc8XCjXfowonZ8Xt6r1xPa87GkIWcNmIpwG8c
         Nb8FXwHvGlsnXMCIUqbVCu1aUZhxUWssgzMJKeG9o8vF12QBDWuGuS0JMGbYWC3Ydb0y
         VpWz8+r+X0QCY297UJnMWG8kTdpfBQeU7c1V/L2ag/AeZArH6o1Fo2wNNREwI8P5Y50Q
         OTUmXCBIO1LSh2nTiI39A7gAFG+mu83iy+ggWQ7/WposaMqmTDx7P4R2E4dyWG5yZ6XS
         GjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wpQINzxq3dPsn3B4tqJ00jgDqN9SsTnp4sqKQle58A=;
        b=qa+t+2AaFGd+Hkaf/HWXrw4Y9BjRLR7YISLkd6Zv71WkEJazsOJxFZ+tw6ReV43Y8D
         rLdl2uJq+/vuYmLxIQVQ2FNrHORrXcmN6O96UD31y1HmH7SXNSxXP9pfTvRz2LMLLqbk
         91Mj8eGQlxQbU+IrSk1+LFAroOKcEecDOW/ThO08qRKFNtwpDeBtq7BNSmv16456xHp3
         dPiRT3FoPm58Qhgy0nEES362DaCNvwQM+64I46jqeqtnVy4GJYHlMGhTVtblu+LeAtra
         SvMRkqmf/mvLS7oO67Xpdef44p/XymriQLS5/YaUeZpydXrI660qQFKosFlXx3IYFkmp
         DgUA==
X-Gm-Message-State: AO0yUKVjKkzgNu8hJq6PHtN+DG5cpritT0QOIxLk1P4JCpjCkZrKvsUW
        UVOLQoya4OiOMcTIEHDv3kI=
X-Google-Smtp-Source: AK7set8HblHt+nWAFytfTPD0mZP4CcZ70lg6lHNu6pcEiNUn+A7vRynRg/mbdM5XMiPVw064QZunDQ==
X-Received: by 2002:a05:6e02:1527:b0:316:e6e5:f0db with SMTP id i7-20020a056e02152700b00316e6e5f0dbmr4972219ilu.0.1677949859568;
        Sat, 04 Mar 2023 09:10:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o16-20020a92d4d0000000b003179b34916dsm1528714ilm.0.2023.03.04.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:10:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:10:58 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 25/34] watchdog: riowd: Convert to platform remove
 callback returning void
Message-ID: <a4a65706-fae7-4b66-b134-ee89db61d0b7@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-26-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-26-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:37:07PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/riowd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
> index 747e346ed06c..c04b383e1712 100644
> --- a/drivers/watchdog/riowd.c
> +++ b/drivers/watchdog/riowd.c
> @@ -217,14 +217,12 @@ static int riowd_probe(struct platform_device *op)
>  	return err;
>  }
>  
> -static int riowd_remove(struct platform_device *op)
> +static void riowd_remove(struct platform_device *op)
>  {
>  	struct riowd *p = platform_get_drvdata(op);
>  
>  	misc_deregister(&riowd_miscdev);
>  	of_iounmap(&op->resource[0], p->regs, 2);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id riowd_match[] = {
> @@ -241,7 +239,7 @@ static struct platform_driver riowd_driver = {
>  		.of_match_table = riowd_match,
>  	},
>  	.probe		= riowd_probe,
> -	.remove		= riowd_remove,
> +	.remove_new	= riowd_remove,
>  };
>  
>  module_platform_driver(riowd_driver);
> -- 
> 2.39.1
> 
