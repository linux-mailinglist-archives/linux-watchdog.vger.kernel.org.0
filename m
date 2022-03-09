Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 036994D3D92
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Mar 2022 00:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238800AbiCIXbq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Mar 2022 18:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236932AbiCIXbq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Mar 2022 18:31:46 -0500
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Mar 2022 15:30:46 PST
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com [192.185.47.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77DB119413
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 15:30:46 -0800 (PST)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 5612A2CCB
        for <linux-watchdog@vger.kernel.org>; Wed,  9 Mar 2022 17:09:31 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id S5Qxn5lv2XvvJS5QxnR763; Wed, 09 Mar 2022 17:09:31 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Kmhf7fRM11s0PaTOIZ2VfUz7RIxiSMdFWm4G9ApkGN4=; b=ZgC59+JRTdxmj6Oc2KXyVLI7Zz
        g8hmu0KKHHXrgkEKMfn6afGR8OmYuoE7tzL5WoLpdpNvjXYgs+ijp+ktifiSsJfWBERMa3Jne11GI
        zpRDJhoSVCPUdAJ6bnfFa3N+XRnMCvo+m4mlMaAw59eiEbajjJG/f6ifTiFnBtP81QY44rUaT+5bz
        1YLktIRL+C3+Rh4QZ4QO5FmUexYVwTh/EBceTIZtvEkLSUvtEPlaO4L6PqYae7rfRJ6m+uggUpIIq
        zkJmeya4omxDfHtN4cYCicgux5VqNqfSyNjfTNak6IPjnzHALJVFpjQIulMVdFm1sKja2R4DgUKpq
        ydo4Q/IQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57408 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nS5Qw-000FSR-ML; Wed, 09 Mar 2022 23:09:30 +0000
Date:   Wed, 9 Mar 2022 15:09:29 -0800
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
Subject: Re: [PATCH v5 5/7] watchdog: rzg2l_wdt: Add error check for
 reset_control_deassert
Message-ID: <20220309230929.GA3802135@roeck-us.net>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
 <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nS5Qw-000FSR-ML
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57408
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 59
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 25, 2022 at 05:53:18PM +0000, Biju Das wrote:
> If reset_control_deassert() fails, then we won't be able to
> access the device registers. Therefore check the return code of
> reset_control_deassert() and bailout in case of error.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v4->v5:
>  * Updated commit description.
>  * Moved reset control imbalance to patch#4.
> v3->v4:
>  * Made reset usage counter balanced
>  * Updated commit description
> v2->v3:
>  * Patch reordering from Patch 2 -> Patch 3
>  * Updated commit description
> v1->v2:
>  * Updated commit description and removed Rb tag from Guenter,
>    since there is code change
>  * Replaced reset_control_assert with reset_control_reset in stop
>    and removed reset_control_deassert() from start.
> ---
>  drivers/watchdog/rzg2l_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 88274704b260..73b667ed3e99 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -203,7 +203,10 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
>  				     "failed to get cpg reset");
>  
> -	reset_control_deassert(priv->rstc);
> +	ret = reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert");
> +
>  	pm_runtime_enable(&pdev->dev);
>  
>  	priv->wdev.info = &rzg2l_wdt_ident;
