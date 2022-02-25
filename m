Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573BD4C4F6A
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Feb 2022 21:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbiBYUT0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Feb 2022 15:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235940AbiBYUT0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Feb 2022 15:19:26 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA09E33AB;
        Fri, 25 Feb 2022 12:18:53 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id y7so8478281oih.5;
        Fri, 25 Feb 2022 12:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y7aesjg8ASPI1OTE5IesAxyPkyE9K/hsp3kbm5RihPs=;
        b=IH238Ar1Q6xT5BdmNxSwKTPluXKaJh5M8CAbe7N95duQxTCiYMo4um8qEiRP665sgv
         +hEvb5SwPiSsssJnrvnBcXChHTQQDEscO7Gb8pqYnsTkH+lR7893mS/usIb/Vq8kLiF5
         efUFiJcBoSCJ/RngmswAAHmMvJWe2RzQpXvpn4pcj8egIQ8iAGD1nLpZTC3WGT/zdVOL
         ut7mxGMfNiWQC6slDxYjgFuZ8R5S1Sdz2T3tLtnq0dc8rp6aXXmuzmV805H0o/D94oIO
         Xy/yOADEpQKcXtTGWOoP/Wl3JcI4RX80GnbFUj7YpyAWiptrfSNBx1hYRjbGAUY0ic3I
         ni9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=y7aesjg8ASPI1OTE5IesAxyPkyE9K/hsp3kbm5RihPs=;
        b=gH8ilRjEL+F3K5JPaMdjyWU6hiPJdTK3debAf9LD5Wn6jmyTwgJBplGz5aVXeLjb5B
         dn5S7YXLQ9alsnFIt4zQTKSmwgPvTn8fKBhdHGjBM++5gztFDh23uc4JZ8wWv3/pxsZ7
         kwTGzThy1UV/ZY3i9c6qzYURbi86kmOngIvdwVxSoSjx8qgcoztCjm5jKTxaLZUizl+H
         Ibe82xH3w+wFp8SmefzBhZt4fX+Wr6OAuHu/YqPdeJ35f0vuYc1bNqxdOBMeHlJiSFBj
         hFiZIrtnGYhwM9Oq+UfMBZ4UXLXlIsS7pUQKM8ffcS3yRxz349tWsXN+8hkGcvnVFhFy
         RzeA==
X-Gm-Message-State: AOAM531tp4ZBS9uJ3YTkED6bDMSU6KJadifBZE9yCuV2ZqkSIgHelvcM
        RwmQq7XHjGNPofzJDLZqBL0=
X-Google-Smtp-Source: ABdhPJx3jEjaii0zSh/nbcyMq/g3IHZ2QQ+OdZOL9M1gp3YVNAhlZk+758o5skEXupe1XzyBRLp7uA==
X-Received: by 2002:a05:6808:300b:b0:2d0:a492:e489 with SMTP id ay11-20020a056808300b00b002d0a492e489mr2647942oib.171.1645820332754;
        Fri, 25 Feb 2022 12:18:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a23-20020a056830101700b005ad0bd6fe0csm1677986otp.47.2022.02.25.12.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 12:18:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Feb 2022 12:18:51 -0800
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
Subject: Re: [PATCH v5 7/7] watchdog: rzg2l_wdt: Add set_timeout callback
Message-ID: <20220225201851.GD2900426@roeck-us.net>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-8-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225175320.11041-8-biju.das.jz@bp.renesas.com>
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

On Fri, Feb 25, 2022 at 05:53:20PM +0000, Biju Das wrote:
> This patch adds support for set_timeout callback.
> 
> Once WDT is started, the WDT cycle setting register(WDTSET) can be updated
> only after issuing a module reset. Otherwise, it will ignore the writes
> and will hold the previous value. This patch updates the WDTSET register
> if it is active.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V4->V5:
>  * Added Rb tag from Geert.
> V3->v4:
>  * Updated commit description
>  * Simplified the logic for updating timeout register, if wdt is active.
> v2->v3:
>  * Patch reodering Patch 3 -> patch 4
>  * Updated commit description.
> V1->V2:
>  * Updated commit description
>  * Removed stop/start and started using reset() instead.
>  * After reset, Start WDT based on watchdog timer state.
> ---
>  drivers/watchdog/rzg2l_wdt.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 4e7107655cc2..6eea0ee4af49 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -115,6 +115,25 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> +static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
> +{
> +	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
> +
> +	wdev->timeout = timeout;
> +
> +	/*
> +	 * If the watchdog is active, reset the module for updating the WDTSET
> +	 * register so that it is updated with new timeout values.
> +	 */
> +	if (watchdog_active(wdev)) {
> +		pm_runtime_put(wdev->parent);
> +		reset_control_reset(priv->rstc);
> +		rzg2l_wdt_start(wdev);
> +	}
> +
> +	return 0;
> +}
> +
>  static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  			     unsigned long action, void *data)
>  {
> @@ -151,6 +170,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
>  	.start = rzg2l_wdt_start,
>  	.stop = rzg2l_wdt_stop,
>  	.ping = rzg2l_wdt_ping,
> +	.set_timeout = rzg2l_wdt_set_timeout,
>  	.restart = rzg2l_wdt_restart,
>  };
>  
> -- 
> 2.17.1
> 
