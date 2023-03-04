Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C126AAB6C
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 18:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjCDRIy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 12:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjCDRIx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 12:08:53 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCC1DBEB
        for <linux-watchdog@vger.kernel.org>; Sat,  4 Mar 2023 09:08:52 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id 4so3854912ilz.6
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Mar 2023 09:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLGiNX2IVvo7sWW7y6dXTRFPR9i8Ugah/vV4Vzj43hA=;
        b=PTmLOPrt5BPgKqPcYeMPB7xtXA+69Jw3TxqxWR9Ha5T/yBNuzZ2xflRm6104PZ3E18
         JzzyGuo4ZyKtWRtnvQdrcg7sXYcWfbvZrwXlB9u58vG/BxqQNhqNMltn4nBnfVdF/pVk
         PVJri9b0bUjzDakBCI6PdkyJ6PptAiJogx0l/kcIPgW0E0p4milv31x5CudR6JgEv6M1
         yL7PrqYQ4MzB3CO1Y7sKxmtLZPPPDYU+h6heEiKFLVyLDAF64JD5xpg4FsabOraWEjNY
         ob92Uijol6O5sqNLRLBeKBhSGCcItLX5OICJw8I7kYNprqS8h1akK7q6bp/BlXkkYm9F
         VmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLGiNX2IVvo7sWW7y6dXTRFPR9i8Ugah/vV4Vzj43hA=;
        b=YI3hJ+cp52bbY7H5FTFGBLldvPlg0+yPEIVKrEMxNW2rdhH85hZBL/udkTbQgQshrF
         J26JAOE3JMlKEfTBIEorhElc/TrT6ObfRyrVzwjmWptNoLG3dO/8P73HTzoGea/cOxe0
         fO8HdkDuTT5W0IuPezp8g65HnBPD5bOI//0UzqPh3+5SYjgjhrKfZ3O270gSCc5veHME
         SLpiopS8tUf3FLVH4Tstv400nioKQB+kdlAYQZy26aa0AJQTVTcrrRjR7cUJK+m/SF7R
         86pjxUOkY6xV1nSO5pLPKcixAtQRBaS2MHcsLlCwFimtCwgKpG4xd4337l2Jl9pvjMsA
         wHyw==
X-Gm-Message-State: AO0yUKXD48lE0ZiX3jTzJNzJGd631TL4JAxITFKBI/Pfr3IF3KxeXpRb
        GMJ/jelkoYBvNoyKo6iEg6+xB/2nwl4=
X-Google-Smtp-Source: AK7set8+u+Ork9/P9fl0NHqHCZfx/XsroEAr3JaUrR+E2s3dR9pT/BZk72gqtp10RXwDQQAYLNIacg==
X-Received: by 2002:a92:c542:0:b0:317:9945:6058 with SMTP id a2-20020a92c542000000b0031799456058mr4980396ilj.9.1677949732097;
        Sat, 04 Mar 2023 09:08:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x14-20020a02970e000000b003c51840bc35sm1730695jai.146.2023.03.04.09.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 09:08:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Mar 2023 09:08:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 16/34] watchdog: lpc18xx: Convert to platform remove
 callback returning void
Message-ID: <c03b73df-fa61-40ef-893a-20a25fc8c80d@roeck-us.net>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-17-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303213716.2123717-17-u.kleine-koenig@pengutronix.de>
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

On Fri, Mar 03, 2023 at 10:36:58PM +0100, Uwe Kleine-König wrote:
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
>  drivers/watchdog/lpc18xx_wdt.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
> index 1b9b5f21a0df..19535f4a2fd2 100644
> --- a/drivers/watchdog/lpc18xx_wdt.c
> +++ b/drivers/watchdog/lpc18xx_wdt.c
> @@ -261,14 +261,12 @@ static int lpc18xx_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &lpc18xx_wdt->wdt_dev);
>  }
>  
> -static int lpc18xx_wdt_remove(struct platform_device *pdev)
> +static void lpc18xx_wdt_remove(struct platform_device *pdev)
>  {
>  	struct lpc18xx_wdt_dev *lpc18xx_wdt = platform_get_drvdata(pdev);
>  
>  	dev_warn(&pdev->dev, "I quit now, hardware will probably reboot!\n");
>  	del_timer_sync(&lpc18xx_wdt->timer);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id lpc18xx_wdt_match[] = {
> @@ -283,7 +281,7 @@ static struct platform_driver lpc18xx_wdt_driver = {
>  		.of_match_table	= lpc18xx_wdt_match,
>  	},
>  	.probe = lpc18xx_wdt_probe,
> -	.remove = lpc18xx_wdt_remove,
> +	.remove_new = lpc18xx_wdt_remove,
>  };
>  module_platform_driver(lpc18xx_wdt_driver);
>  
> -- 
> 2.39.1
> 
