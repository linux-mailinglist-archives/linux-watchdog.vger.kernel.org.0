Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C7B6AAB6B
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCDRHv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRHu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:07:50 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A379C1E2B2
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:07:49 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id m22so2316737ioy.4
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fv+JyutgeQ1bSpfVYXVDkh/KUysmukRUbGQu5nizxdo=;
        b=cM74NgCtSwfMgJlX2On125bh0N/5lWowhMgS9iTIt5sHH0cvFRAdaMmS3Oq7qV4QQK
         5/R5vPfaLLGZKmtoY1TwNspCXeY3/6PqAk4GXuZdWBSuvo7+stHgZYYD08WWd7W6CM3e
         W4YNxt+KfYSeGA2MnZWjzMKgFSA2+Cqj8nUyblRJgKtUzFoOf4jwXrA7/xEfjdZUU6ST
         WHlj+VoAb5oZ/TVK3Ky9k4WSSAZBOC0fqv0/e3vh1M4IRZHGhGDmIStXCPlCu6ZjdZqr
         BNrytFVWy7EgAYPuSYDgxvjKO/og8S7V4wF9DMZdEuaLSMJ39XTqGtsc/2vOJtAWvKy7
         USBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv+JyutgeQ1bSpfVYXVDkh/KUysmukRUbGQu5nizxdo=;
        b=ERf8WpYDnlKYJyL4PFJo3L7FPbYRM6kCOMdG6YoWFiH0DNW0kiMtteecd2WSWN0Poc
         nrYqCQX60mfF4cXDg9B2Oi7TjwDu8cd09Qe8dDtAhxEm+Nzj1elPV8hHciWJwaLtuf7V
         v/tK09DTbC+lgJXTElxvXPh90pVYElkpfEfzFIH/HVGwbiBGNpjvAkhGrq9Qv3sJ/t8N
         vXAFrTGjJkd5pfDZFvplpC/6qUrUO75uOkj6tpXuF66/DuBk3UPBnajLkKLKfhr7etuT
         FQ1nswSF75Uup9wM0S4wNTX6YX4Pa+r37Yls0bxavdhCqfGe1Po+NhSEtZf4ksrCpoQF
         qEKQ==
X-Gm-Message-State: AO0yUKVH+L3s3eElORWmc7R2HE7yH9IWUcUG+sx7t1SPvsxeXil9PZAU
        6zH1MgNP3HeSt5aT087gnR+4R2SFFk0=
X-Google-Smtp-Source: AK7set+SNvLFzT8fS+gclwyXpm4VYdRv13Gz6/U5TXYrArmBiI54LHM4Ixb+m1m2UM+i0t4Bbr+b1A==
X-Received: by 2002:a5d:9497:0:b0:71a:1b72:5afc with SMTP id v23-20020a5d9497000000b0071a1b725afcmr4118181ioj.19.1677949669031;
        Sat, 04 Mar 2023 09:07:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k18-20020a6b3c12000000b0074c8295db0csm1715458iob.6.2023.03.04.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:07:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:07:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 15/34] watchdog: ie6xx: Convert to platform remove
 callback returning void
Message-ID: <a6a75a87-9fcf-463c-885b-29d7ec00cdae@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-16-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:57PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/ie6xx_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/ie6xx_wdt.c b/drivers/watchdog/ie6xx_wdt.c
> index 8f28993fab8b..e5cbb409df25 100644
> --- a/drivers/watchdog/ie6xx_wdt.c
> +++ b/drivers/watchdog/ie6xx_wdt.c
> @@ -266,7 +266,7 @@ static int ie6xx_wdt_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int ie6xx_wdt_remove(struct platform_device *pdev)
> +static void ie6xx_wdt_remove(struct platform_device *pdev)
>  {
>  	struct resource *res;
>  
> @@ -276,13 +276,11 @@ static int ie6xx_wdt_remove(struct platform_device *pdev)
>  	ie6xx_wdt_debugfs_exit();
>  	release_region(res->start, resource_size(res));
>  	ie6xx_wdt_data.sch_wdtba = 0;
> -
> -	return 0;
>  }
>  
>  static struct platform_driver ie6xx_wdt_driver = {
>  	.probe		= ie6xx_wdt_probe,
> -	.remove		= ie6xx_wdt_remove,
> +	.remove_new	= ie6xx_wdt_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
>  	},
> -- 
> 2.39.1
> 
