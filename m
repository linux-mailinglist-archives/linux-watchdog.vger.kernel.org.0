Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211B94AB2CA
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Feb 2022 00:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242045AbiBFXLf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Feb 2022 18:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241365AbiBFXLf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Feb 2022 18:11:35 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33930C06173B
        for <linux-watchdog@vger.kernel.org>; Sun,  6 Feb 2022 15:11:34 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m10so15283971oie.2
        for <linux-watchdog@vger.kernel.org>; Sun, 06 Feb 2022 15:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y9Ixb7wfwlvY4ho2usowUZhPiouFqL11p6YsSs3ZWQA=;
        b=j5qG181j/lg2eQLOTzB2FGPLAQe9MUXowYkZghSYkVfvvLQ+cQL+FzrSr/+ZKUxopY
         hz83ZqT1iNXthAOLv1vbbt+3GRBKrgWnk9gaHI+vC9pv3UNrMg5VeiGJ0a68nfWyPgoH
         iejNKKno8+UfWjQSr9DnulGYlwwY1yFaRxQQqLkkYkO/2RI7vlL5Edggf0dxW26/WAHj
         3IUxNWrKDyyEt7Ed3S9V0TiiZ2OrU0bc5v5RbP/daZ5aBTTdeBo8Hkg2O275ATXGdpUZ
         hu5ODOShtcMzicbCs9RmS3Bv3XSFZhEublRivAG65hoJSTnVQ4BYcx8dwFTVxD9noBYs
         kr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=y9Ixb7wfwlvY4ho2usowUZhPiouFqL11p6YsSs3ZWQA=;
        b=jEE1GOuhHfgGxiii8/dWgVSGs5FFXPIP7lWeNI64ybgSXExE22pMSAXzs1pLCzA2eU
         WhrnPpnJjhiwFQYDU0CF0hIBu0Q6VV4kucL/jdD77JaRUnWxuzUObMHElqArcS4HrzSR
         zQfmh8AGvi+dzs9XliQUYSTtahWwvj1/xhs8PqW+X1cCpAX2zZVHKWfbP0GajDBjngXJ
         rn4Fvvzh8geeYpD2NX/0m+w5/c7B88UKJHt92e3GnRpoBGDziST5i/K6WDHhefAUUMvF
         5QwZ2qlnMJXFO2KKzW3mqMwJ82rQ9zFwZFUgdjn073lpRS10g+lzamZ7Gj8vZtgoxE2a
         quHg==
X-Gm-Message-State: AOAM530umhKmxDgP13FnUI8xBR1J2DMDQmapHYaj8xdNEgCE8mSXJ4TU
        SZYRTX4yP3oaXxVF4uqjsjObsJd2NDKN2w==
X-Google-Smtp-Source: ABdhPJyivsk2ENEPx0ZK5nx9lO8b6FcGxv2jeCkB/+yg5tLgyfnVsqllEFX1pVn+l2bvhd9JeDNYTg==
X-Received: by 2002:a05:6808:10d2:: with SMTP id s18mr4213728ois.25.1644189093552;
        Sun, 06 Feb 2022 15:11:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z17sm3244680otk.62.2022.02.06.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 15:11:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 6 Feb 2022 15:11:31 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: ixp4xx: Implement restart
Message-ID: <20220206231131.GA1617114@roeck-us.net>
References: <20220206230028.476659-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220206230028.476659-1-linus.walleij@linaro.org>
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

On Mon, Feb 07, 2022 at 12:00:28AM +0100, Linus Walleij wrote:
> Implement watchdog restart in the IXP4xx watchdog timer.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> ChangeLog v1->v2:
> - Drop the msleep(1000) - it works fine without!
> ---
>  drivers/watchdog/ixp4xx_wdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
> index 31b03fa71341..281a48d9889f 100644
> --- a/drivers/watchdog/ixp4xx_wdt.c
> +++ b/drivers/watchdog/ixp4xx_wdt.c
> @@ -84,10 +84,24 @@ static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static int ixp4xx_wdt_restart(struct watchdog_device *wdd,
> +                              unsigned long action, void *data)
> +{
> +	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
> +
> +	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
> +	__raw_writel(0, iwdt->base + IXP4XX_OSWT_OFFSET);
> +	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
> +		     iwdt->base + IXP4XX_OSWE_OFFSET);
> +
> +	return 0;
> +}
> +
>  static const struct watchdog_ops ixp4xx_wdt_ops = {
>  	.start = ixp4xx_wdt_start,
>  	.stop = ixp4xx_wdt_stop,
>  	.set_timeout = ixp4xx_wdt_set_timeout,
> +	.restart = ixp4xx_wdt_restart,
>  	.owner = THIS_MODULE,
>  };
>  
> -- 
> 2.34.1
> 
