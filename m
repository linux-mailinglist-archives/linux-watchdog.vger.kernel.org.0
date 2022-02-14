Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54794B554E
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Feb 2022 16:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbiBNPu7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Feb 2022 10:50:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234841AbiBNPu7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Feb 2022 10:50:59 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7964C5FF0B;
        Mon, 14 Feb 2022 07:50:51 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id p190-20020a4a2fc7000000b0031820de484aso19718401oop.9;
        Mon, 14 Feb 2022 07:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ip8OUFOC+QQfZkTO8wkjCzFOKh1ma3GgYvGWr5tDs5w=;
        b=SIJ+vdbbAKHwkzK73EJ23NxPN8TBz9v5hqFW/dkplRRJ9ipTdV+aqEIAE8XU706pV1
         ILUDt46T0BBNwWq7G43KBEbrrQV7jfxqtm4RXWUP8pV1Mxdr+BwOYSEvEOrql/GYUmbE
         uvQrlKFRtvvB5H4+jN1drwpEQHxEYf/c7TMBXbxbfajQ/TmetOJ2MnFFGkqJjrJwzl3v
         DrHx6+ZCP9Ircu8P8jwJxhEVUPU9kv5jp3Y+t1Iktoz+VgHEXIHOHC2N+baD+7D8L70O
         fQHcMXwl3hPkjnOaZh0P1JF6f3OWAuzv6bXWPc/MhmqoJehiB536PbcDfwyKTBFO6WuT
         hlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ip8OUFOC+QQfZkTO8wkjCzFOKh1ma3GgYvGWr5tDs5w=;
        b=edZlJg1kL2/4rSjLtIvpZ1n+iG5sKN+x/eV25soy2Tkv3w1j9X/5oCFvFwu5P2ptzZ
         HsimrOHLoNH8KMZlXeiqpBQooSXamKBC3wkZab3rGcDxzKsNiLwlHApEa6RkfBbXZfNh
         qoIdUDZhN7kHwxwKHeSX0ZxznWKZu3NzvPYtALr9CNQnilQfg4AY//KYGIb8HVVdhG+z
         hYgt4DRu8QQLpdpdDCWJKapwcr++iqxf5tngQ/qd5a0dxl+CX29Eg9N2xaKbGv/Wq23v
         mOkTZcV6qHJFoymNtJLnc+yG9PkjBrhojlh+/jszdOc8WcTpl7mz9vztsmf4E2FF1INf
         eE1A==
X-Gm-Message-State: AOAM530ZE3dYfX/HgCJECLygHojjRwgD4324O7xUkDF3N6bTFJx2jBfq
        WujDLheDcxGlglrvFTm+FLM=
X-Google-Smtp-Source: ABdhPJzZRtNhR9zntREDVNntbwmQd4y4gF2J6WY3UxEH6j8JF/s9gtYSx6KqynJemRVGHMbfPWVTXg==
X-Received: by 2002:a05:6870:e28c:: with SMTP id v12mr42282oad.178.1644853850905;
        Mon, 14 Feb 2022 07:50:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k19sm12462718oot.41.2022.02.14.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:50:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Feb 2022 07:50:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: renesas: r8a779f0: Add WDT clock
Message-ID: <20220214155049.GA78279@roeck-us.net>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <8d9b280065a663f2cf31db7b21a010aa781a0af1.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d9b280065a663f2cf31db7b21a010aa781a0af1.1642525158.git.geert+renesas@glider.be>
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

On Tue, Jan 18, 2022 at 06:09:01PM +0100, Geert Uytterhoeven wrote:
> Add the module clock used by the RCLK Watchdog Timer (RWDT) on the
> Renesas R-Car S4-8 (r8a779f0) SoC.  Mark it as a critical clock, to
> ensure uninterrupted watchdog operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> index 4100078406d67073..e48c5af7341454a7 100644
> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -121,6 +121,11 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
>  	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
>  	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
>  	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
> +	DEF_MOD("wdt",		907,	R8A779F0_CLK_R),
> +};
> +
> +static const unsigned int r8a779f0_crit_mod_clks[] __initconst = {
> +	MOD_CLK_ID(907),	/* WDT */
>  };
>  
>  /*
> @@ -177,6 +182,10 @@ const struct cpg_mssr_info r8a779f0_cpg_mssr_info __initconst = {
>  	.num_mod_clks = ARRAY_SIZE(r8a779f0_mod_clks),
>  	.num_hw_mod_clks = 28 * 32,
>  
> +	/* Critical Module Clocks */
> +	.crit_mod_clks = r8a779f0_crit_mod_clks,
> +	.num_crit_mod_clks = ARRAY_SIZE(r8a779f0_crit_mod_clks),
> +
>  	/* Callbacks */
>  	.init = r8a779f0_cpg_mssr_init,
>  	.cpg_clk_register = rcar_gen4_cpg_clk_register,
