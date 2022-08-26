Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D7A5A30AC
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 22:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbiHZUxt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 16:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiHZUxr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 16:53:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5273ED419C
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 13:53:47 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m2so2581680pls.4
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=aOuhh1IVT9RctYT6PeOVRDFwVslsuQKhnvqoAT1Z9P8=;
        b=Ac6xtQEwWOaVaRb91C9g4HOJrh2XS1ZLKjXoyRZv2A+hWTeNeSItU9tYq5C5CDplrr
         /XzcGu18WgunLz4Z/xK348vBsdZibfmSOphhki4CqBAXqnId444ivS5bENaufTiw97of
         9cipGgSG5uEYV2GkxH0Sf+VTMtKhshRBMA9vmvJ7U7YI2QfDhA13kMuZeQtE84P/aG4C
         Ld7imqhFR1TPkqjzqiPSh7unpc+LuRs8Iul609p48XPzf0+eT4zZTbm32lDXgFew+CDb
         VNwd9WZSQftVYIxnP8u12+udm4mj0DQa3Ri1ZR81xmnVZiFrzDTdQrBcIQtDWUiszYcx
         SCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=aOuhh1IVT9RctYT6PeOVRDFwVslsuQKhnvqoAT1Z9P8=;
        b=CFfiRBJ3SBHM6yChX/pG9wG1efFRmWDTTEBE8WX4eApib59tLGx2bWQJrW+0SWBkYg
         gJ3DeE4ef7Nz/SE/MIqTPeuJ2W8gYnNUy8MNt2Rjz6NVq/tC/mYb45Y2HoN+Gu54hNU7
         CW25smRhs/1gGHCtQQJplDqhnzvjObwkgxQICBC4NOkbwfIDlWtDXok8y8tIQPOUD/BL
         PueCavzw32Tv4KjouxbP4JDbp9TWljIvekQPQk+z43VekMSf/epaKpre1NYLIe6B2sqJ
         RwSxha8OWB1ZU14C5JcCQnFALtJi6jyvz/222fBbMkfeIB+UCjueMpQFLSbWwsPqFgxR
         FzXA==
X-Gm-Message-State: ACgBeo3wDj+fiduNYLvcjmTgzp2+tHG1lsePnszUS+447wq1Scinsn4u
        HcWsZqPvhIf/hccrLiAtJwjZW4bB33JYLg==
X-Google-Smtp-Source: AA6agR5kEnxkQdSYUOuNH+hEml52EmOto87GwabPPsQnIihmI+aQGu++lZv01E7OY6Z1WwR/gme38A==
X-Received: by 2002:a17:90b:4c02:b0:1fb:7cc:6022 with SMTP id na2-20020a17090b4c0200b001fb07cc6022mr6308198pjb.6.1661547226767;
        Fri, 26 Aug 2022 13:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t18-20020aa79472000000b00537e1b30793sm453789pfq.11.2022.08.26.13.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:53:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 Aug 2022 13:53:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sergei Antonov <saproj@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog: ftwdt010_wdt: implement _restart() function
Message-ID: <20220826205343.GA2909643@roeck-us.net>
References: <20220826181921.3899603-1-saproj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826181921.3899603-1-saproj@gmail.com>
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

On Fri, Aug 26, 2022 at 09:19:21PM +0300, Sergei Antonov wrote:
> Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
> and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
> add a new function ftwdt010_enable() and move common code there.
> 
> Signed-off-by: Sergei Antonov <saproj@gmail.com>

v2 ? Change log ?

Guenter

> ---
>  drivers/watchdog/ftwdt010_wdt.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
> index 21dcc7765688..0a5bbfd2823f 100644
> --- a/drivers/watchdog/ftwdt010_wdt.c
> +++ b/drivers/watchdog/ftwdt010_wdt.c
> @@ -47,21 +47,28 @@ struct ftwdt010_wdt *to_ftwdt010_wdt(struct watchdog_device *wdd)
>  	return container_of(wdd, struct ftwdt010_wdt, wdd);
>  }
>  
> -static int ftwdt010_wdt_start(struct watchdog_device *wdd)
> +static void ftwdt010_enable(struct ftwdt010_wdt *gwdt,
> +			    unsigned int timeout,
> +			    bool need_irq)
>  {
> -	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
>  	u32 enable;
>  
> -	writel(wdd->timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
> +	writel(timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
>  	writel(WDRESTART_MAGIC, gwdt->base + FTWDT010_WDRESTART);
>  	/* set clock before enabling */
>  	enable = WDCR_CLOCK_5MHZ | WDCR_SYS_RST;
>  	writel(enable, gwdt->base + FTWDT010_WDCR);
> -	if (gwdt->has_irq)
> +	if (need_irq)
>  		enable |= WDCR_WDINTR;
>  	enable |= WDCR_ENABLE;
>  	writel(enable, gwdt->base + FTWDT010_WDCR);
> +}
>  
> +static int ftwdt010_wdt_start(struct watchdog_device *wdd)
> +{
> +	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
> +
> +	ftwdt010_enable(gwdt, wdd->timeout, gwdt->has_irq);
>  	return 0;
>  }
>  
> @@ -93,6 +100,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
> +				unsigned long action, void *data)
> +{
> +	ftwdt010_enable(to_ftwdt010_wdt(wdd), 0, false);
> +	return 0;
> +}
> +
>  static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
>  {
>  	struct ftwdt010_wdt *gwdt = data;
> @@ -107,6 +121,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
>  	.stop		= ftwdt010_wdt_stop,
>  	.ping		= ftwdt010_wdt_ping,
>  	.set_timeout	= ftwdt010_wdt_set_timeout,
> +	.restart	= ftwdt010_wdt_restart,
>  	.owner		= THIS_MODULE,
>  };
>  
> -- 
> 2.34.1
> 
