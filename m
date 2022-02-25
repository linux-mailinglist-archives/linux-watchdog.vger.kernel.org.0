Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0A14C4F74
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Feb 2022 21:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236249AbiBYUTL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Feb 2022 15:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236066AbiBYUTK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Feb 2022 15:19:10 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64356E33AD;
        Fri, 25 Feb 2022 12:18:37 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id x6-20020a4a4106000000b003193022319cso7923815ooa.4;
        Fri, 25 Feb 2022 12:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0EfTradp/or9/LcFmgpTDwAxz/5jI3Vj5FXoeVCUTU0=;
        b=Ewbxua+JPzn1iEu/+GSO0VpVSRQJ+DVG/LoEJ+V86couQEN7XJggejVEPj2cG+wbiD
         udXp0e6/lc5LFxb8EI+Q8QxEjauE3w7VeZ7pZRNqE/aMc21pf6cAXsT+Vu1KMM1O02b/
         cwURfgJ1aWv7ojk4mQEv/kNWizyen61uOxEpxo7gIM+PZB2ef4nhkWQu4UesBtkkJb6C
         TF20laNX59F/rk7otSDzof+o0En2gtjpgXzuQjgKdvQrFYf26s9nJO1yv7GzXW/BwQXv
         Awk6Pup3IPcdCBdyqHnHrhWDShlVueN4gcMBjutaU/9JrZ081NklxEzbV4TZ9E1Vfwey
         P5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0EfTradp/or9/LcFmgpTDwAxz/5jI3Vj5FXoeVCUTU0=;
        b=YY/VBwzNoZWFykgpHGe2EkAL7+EiYEzfUJS6N6xtptRB+13iX6OdELRjzJhZ8O/3AK
         PgvpdXK3c0I6Kd2e1uGoBrLtbqAmiB/R8QM0oykfHZtOReVGks7StyHRnUyuyuLzJDh9
         AGkmxPKXJiCWhEKIEK5ZjdxCzJ8ewMYGPw0ZbkSau1PLOx2o+bCxHo99hk51gNTZHd2Z
         TgnfVz+j7l66WLQlgiCu9TnCxx29A8Z6JnWJyTfPuBJY1g/OaZB0GbPypfVvdTGyOZ6J
         W7baPn1U6LePgRcHNQw0ZA4fktspHNcur+7pDBeR3g9Z07V/GanCiuHlw1QLKWvdvX3j
         5X2g==
X-Gm-Message-State: AOAM530ugLc2Y3eYs7pXfpnQERuL/ZLkQwO0urB6wCsJ7T+P/ukjnpHQ
        BMYrHvucO97x+XsrYY2pvN0=
X-Google-Smtp-Source: ABdhPJzclNsDrQxFqwOQGxqKb3i5PWCSrG39I87dQPIu/+LAfkUb/XA1Gb9m0hYs/L4dszXBUAat+w==
X-Received: by 2002:a05:6870:450d:b0:d3:973f:4189 with SMTP id e13-20020a056870450d00b000d3973f4189mr2129824oao.95.1645820316750;
        Fri, 25 Feb 2022 12:18:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 60-20020a9d0f42000000b005ad59a0fe01sm1611562ott.35.2022.02.25.12.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 12:18:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Feb 2022 12:18:35 -0800
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
Subject: Re: [PATCH v5 6/7] watchdog: rzg2l_wdt: Use force reset for WDT reset
Message-ID: <20220225201835.GC2900426@roeck-us.net>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-7-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225175320.11041-7-biju.das.jz@bp.renesas.com>
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

On Fri, Feb 25, 2022 at 05:53:19PM +0000, Biju Das wrote:
> This patch uses the force reset(WDTRSTB) for triggering WDT reset for
> restart callback. This method(ie, Generate Reset (WDTRSTB) Signal on
> parity error)is faster compared to the overflow method for triggering
> watchdog reset.
> 
> Overflow method:
> 	reboot: Restarting system
> 	Reboot failed -- System halted
> 	NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
> 
> Parity error method:
> 	reboot: Restarting system
> 	NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V4->V5:
>  * Added Rb tag from Geert.
> V3->V4:
>  * Renamed PEEN_FORCE_RST->PEEN_FORCE
>  * Updated comments with parity error description
>  * Updated commit description
> V2->v3:
>  * Patch reordering from patch 4->patch 2
>  * Updated the commit description.
> V1->V2:
>  * Updated the commit description.
> ---
>  drivers/watchdog/rzg2l_wdt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 73b667ed3e99..4e7107655cc2 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -21,8 +21,11 @@
>  #define WDTSET		0x04
>  #define WDTTIM		0x08
>  #define WDTINT		0x0C
> +#define PECR		0x10
> +#define PEEN		0x14
>  #define WDTCNT_WDTEN	BIT(0)
>  #define WDTINT_INTDISP	BIT(0)
> +#define PEEN_FORCE	BIT(0)
>  
>  #define WDT_DEFAULT_TIMEOUT		60U
>  
> @@ -117,17 +120,14 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  {
>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>  
> -	/* Reset the module before we modify any register */
> -	reset_control_reset(priv->rstc);
> -
>  	clk_prepare_enable(priv->pclk);
>  	clk_prepare_enable(priv->osc_clk);
>  
> -	/* smallest counter value to reboot soon */
> -	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> +	/* Generate Reset (WDTRSTB) Signal on parity error */
> +	rzg2l_wdt_write(priv, 0, PECR);
>  
> -	/* Enable watchdog timer*/
> -	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +	/* Force parity error */
> +	rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
