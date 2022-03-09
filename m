Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13F04D3D93
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 00:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236932AbiCIXcS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Mar 2022 18:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiCIXcS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Mar 2022 18:32:18 -0500
X-Greylist: delayed 1347 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 15:31:19 PST
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.51.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CCC11940F
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 15:31:19 -0800 (PST)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 21AAC8333
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 17:08:52 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id S5QJnM0r59AGSS5QKnc72C; Wed, 09 Mar 2022 17:08:52 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PhC+sm1AV0gyJFgueb6QLolZ6coytguNF1V5dBMs25M=; b=DtJRGtXILcauGHpl554QZP/WH5
        /vX9czKkQc3GhG2FUyBtzxDFTbKTxWzhuAwPFuJdXQQZGcdR/bzt5gUSgDscUOBTWAdWPWQEPrI06
        NnG0zqJ+oudERJO8femg1SlMxYSvcZ0ZE1qXMF8X4ZsVX1Hn/Ku2RkQ7fUoihMspYHSZEgwfiou3F
        dS+/dbEMrzzpGM/NxAC5N6CJKwU2xZI2EkiZ6/r/bAWInVr1rwwuxPo9nLG3e37lR0WKEdfrKvidT
        RNtVetOu2HYwNCmc+GzMRsuiXOJ0Tx4bRlulfaJqqC8vwih89DZbm93re3nUXdACn8NKx/InTDvvT
        RyUOmNvA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57406 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nS5QJ-000F9p-Dr; Wed, 09 Mar 2022 23:08:51 +0000
Date:   Wed, 9 Mar 2022 15:08:50 -0800
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
Subject: Re: [PATCH v5 4/7] watchdog: rzg2l_wdt: Fix reset control imbalance
Message-ID: <20220309230850.GA3802020@roeck-us.net>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225175320.11041-5-biju.das.jz@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5QJ-000F9p-Dr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57406
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 50
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 25, 2022 at 05:53:17PM +0000, Biju Das wrote:
> Both rzg2l_wdt_probe() and rzg2l_wdt_start() calls reset_control_
> deassert() which results in a reset control imbalance.
> 
> This patch fixes reset control imbalance by removing reset_control_
> deassert() from rzg2l_wdt_start() and replaces reset_control_assert with
> reset_control_reset in rzg2l_wdt_stop() as watchdog module can be stopped
> only by a module reset. This change will allow us to restart WDT after
> stop() by configuring WDT timeout and enable registers.
> 
> Fixes: 2cbc5cd0b55fa2 ("watchdog: Add Watchdog Timer driver for RZ/G2L")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v5:
>  * New patch
> ---
>  drivers/watchdog/rzg2l_wdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 48dfe6e5e64f..88274704b260 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -88,7 +88,6 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
>  {
>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>  
> -	reset_control_deassert(priv->rstc);
>  	pm_runtime_get_sync(wdev->parent);
>  
>  	/* Initialize time out */
> @@ -108,7 +107,7 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>  
>  	pm_runtime_put(wdev->parent);
> -	reset_control_assert(priv->rstc);
> +	reset_control_reset(priv->rstc);
>  
>  	return 0;
>  }
