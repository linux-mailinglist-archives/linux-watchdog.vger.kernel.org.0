Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD6A4C4F77
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Feb 2022 21:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236202AbiBYUSQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Feb 2022 15:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiBYUSL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Feb 2022 15:18:11 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E700842EC1;
        Fri, 25 Feb 2022 12:17:37 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id j9-20020a9d7d89000000b005ad5525ba09so4385026otn.10;
        Fri, 25 Feb 2022 12:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sHTuUKEn0NkbYepLikrLppqapukEII+dDIPrJtJOGpk=;
        b=CWJVdZxup9mtm9HF9qJcE7IxWvlqp0gk/gI44DEGqhyssZ+6rRQoPfoShuMn8vwML3
         j2mJwgJxJrcAPnLsDq/mVFX/tx9PULhoW1KEfJerhHhbfM1UMLrmBR3ccwA3VO8zShW+
         QYEvSKycodIm/Z7RzekBDeqDg4E0VX/QaGwYjvbXKcbhJYygLs9XJMnAvoFeH2xXyllF
         Pw+M6WRLTeM1MW3BNIca9QGfyupqUDR6pUGUktKarcjjXxoL1hymnrydWFMZjYApXYXP
         ZRG2nqv1RXDSjU9U4/BAfQXbkQ5Wy1ru9Q+VEaWHy5NfMfk2YkhZSRn6tZqq8UN0p0IR
         HU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=sHTuUKEn0NkbYepLikrLppqapukEII+dDIPrJtJOGpk=;
        b=TJ6d8lxJdAqgnGC6citMv540z8rgdyk5LF5WqdLubpFSuP021qdN4/ZpPyY258kYfK
         CaqqiUKUojwYIVRfstjS3aQt66aB0n1LLehPVvgKR76rth634VhLsWRfJN8DR42yTHId
         kbNqPSFVy5ZBPx6LHYZxtu49VQxfmoYmsO/f4+3ggY604hIESuLEeFFQ2u8t/3oY7ia3
         +f+QJ/16u26c9bwUShB/tdFFcMlvq/CwR7VizgYjqNTqlACbOtonO9YAxCYAnLe28Jcu
         DPwZt8UNyf3Jb2tRYw7Kap4Wj7LINOOfUQiJUhakrWojrEcwmWeIjr9fefbsHOMYD9Sq
         2zDg==
X-Gm-Message-State: AOAM532jJojVSG6ReUWfZaO6NwsKqbcaXwtCPsSP/Hy/R90kXw0uguud
        7kULxwGpaaQNeU7fV/O6k8o=
X-Google-Smtp-Source: ABdhPJzjaXvCRjAJVqVGecohcD6DL5OmPOpguG4lmLK/2vj+6KT+LoqB8Q7NhIXB1RqL5aVRg2prZg==
X-Received: by 2002:a9d:721a:0:b0:5af:a50:eb65 with SMTP id u26-20020a9d721a000000b005af0a50eb65mr3511669otj.295.1645820257276;
        Fri, 25 Feb 2022 12:17:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w11-20020a056808140b00b002c0966d9521sm1973493oiv.10.2022.02.25.12.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 12:17:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Feb 2022 12:17:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/7] watchdog: rzg2l_wdt: Fix Runtime PM usage
Message-ID: <20220225201735.GA2900426@roeck-us.net>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225175320.11041-3-biju.das.jz@bp.renesas.com>
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

On Fri, Feb 25, 2022 at 05:53:15PM +0000, Biju Das wrote:
> Both rzg2l_wdt_probe() and rzg2l_wdt_start() calls pm_runtime_get() which
> results in a usage counter imbalance. This patch fixes this issue by
> removing pm_runtime_get() call from probe.
> 
> Fixes: 2cbc5cd0b55fa2 ("watchdog: Add Watchdog Timer driver for RZ/G2L")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V4->v5:
>  * Added Rb tag from Geert.
> V4:
>  * New patch
> ---
>  drivers/watchdog/rzg2l_wdt.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 96f2a018ab62..0fc73b8a9567 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -151,12 +151,11 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
>  	.restart = rzg2l_wdt_restart,
>  };
>  
> -static void rzg2l_wdt_reset_assert_pm_disable_put(void *data)
> +static void rzg2l_wdt_reset_assert_pm_disable(void *data)
>  {
>  	struct watchdog_device *wdev = data;
>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>  
> -	pm_runtime_put(wdev->parent);
>  	pm_runtime_disable(wdev->parent);
>  	reset_control_assert(priv->rstc);
>  }
> @@ -206,11 +205,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  
>  	reset_control_deassert(priv->rstc);
>  	pm_runtime_enable(&pdev->dev);
> -	ret = pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0) {
> -		dev_err(dev, "pm_runtime_resume_and_get failed ret=%pe", ERR_PTR(ret));
> -		goto out_pm_get;
> -	}
>  
>  	priv->wdev.info = &rzg2l_wdt_ident;
>  	priv->wdev.ops = &rzg2l_wdt_ops;
> @@ -222,7 +216,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_drvdata(&priv->wdev, priv);
>  	ret = devm_add_action_or_reset(&pdev->dev,
> -				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       rzg2l_wdt_reset_assert_pm_disable,
>  				       &priv->wdev);
>  	if (ret < 0)
>  		return ret;
> @@ -235,12 +229,6 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  		dev_warn(dev, "Specified timeout invalid, using default");
>  
>  	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> -
> -out_pm_get:
> -	pm_runtime_disable(dev);
> -	reset_control_assert(priv->rstc);
> -
> -	return ret;
>  }
>  
>  static const struct of_device_id rzg2l_wdt_ids[] = {
> -- 
> 2.17.1
> 
