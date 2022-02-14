Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6A04B5543
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Feb 2022 16:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345298AbiBNPtz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Feb 2022 10:49:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbiBNPty (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Feb 2022 10:49:54 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B675FF0B;
        Mon, 14 Feb 2022 07:49:47 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id o192-20020a4a2cc9000000b00300af40d795so19743267ooo.13;
        Mon, 14 Feb 2022 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KNFJV6080Jn6whwG9Bz1Jg2iUV2oCpRRgQ+jDUhbSX0=;
        b=AVukeHUeaiDQUixdsdplAp7hR/5RdmYk8tJAy6rvL3R5soJ+jLze9WpfF+WdLj2q2E
         +iQLID0DBR78PDfnSroI9lDJy0o1F3OjgCF+5u3GkP8VEG4x017m+Dc1BSyArPmO7NzM
         pGhd+YjP4VLmufjJAG9dNF0P8yiHm8t6hTjLxu/bH2fIM3bLEaS2m9Ltm98dX17vh3xT
         F5NWK/oTVjfd0vvU5Etvkz0vtz4FaimVDEObgd3Uv8O1vnH4eMbMhcu+UxH64Y5Jnwch
         EIWTBdbYx+2D3RkQ/ZzlyFI9zx5vVXPe7uH+fDoGenzMF7hRxfN0jEngpBbbOFGgpdLb
         hE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KNFJV6080Jn6whwG9Bz1Jg2iUV2oCpRRgQ+jDUhbSX0=;
        b=vaOQXprlGJO6rplrRnFZ+aIWR+xN8sZUWc2zC8ZOqkTqROQlcf3P0gamCRrDYHz1mV
         HPlSyxSdY3nBctHMtxcvd3JIHa3DgWy4EEA2bG8aBHtw62wD6U2GOg7ajr0I6JBW/Cqa
         XmqIoZLgj8W8mujCpBYtihDmjdESG72rPo+uj1kgcahKLK3W2+NzqN9wkBx/+mW+pV3a
         aPXIzEgWFB3y//raoxXTz2usj413ipNn2hSIFhhXWinkgtEftMXL3BBa71SWX3cxhEDO
         K6oUB4EVc1NdNjdJci6sRLIqq4yzm1uidV0GUzzz9HHi1JL07uMi6N/rChvc0e4sMCV1
         wudA==
X-Gm-Message-State: AOAM532ZjTT6pTgIw5gcCLseGNQVIKCwSCJmE3EksBbtMQTOWQ/ahMfR
        VLogb/DyxahzL4O3RDFb59E=
X-Google-Smtp-Source: ABdhPJyRtsnz7eDZMaEUOdgtcl6dAdY3iGBQRuNgxACOzPPiTtflMr3QFiRoDO5RzSFsI4SQZzIdog==
X-Received: by 2002:a05:6870:1294:: with SMTP id 20mr4163808oal.292.1644853786351;
        Mon, 14 Feb 2022 07:49:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v45sm7622646ooj.47.2022.02.14.07.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 07:49:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Feb 2022 07:49:44 -0800
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
        linux-renesas-soc@vger.kernel.org,
        Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [PATCH 3/5] watchdog: renesas_wdt: Add R-Car Gen4 support
Message-ID: <20220214154944.GA19600@roeck-us.net>
References: <cover.1642525158.git.geert+renesas@glider.be>
 <cc395105e1d34aab2c076d368c0737833970b9d2.1642525158.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc395105e1d34aab2c076d368c0737833970b9d2.1642525158.git.geert+renesas@glider.be>
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

On Tue, Jan 18, 2022 at 06:09:03PM +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Add the compatible string for the R-Car Gen4 family.
> No further driver changes are needed.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/renesas_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
> index 5791198960e6c5bf..41d58ea5eb2f40fd 100644
> --- a/drivers/watchdog/renesas_wdt.c
> +++ b/drivers/watchdog/renesas_wdt.c
> @@ -327,6 +327,7 @@ static SIMPLE_DEV_PM_OPS(rwdt_pm_ops, rwdt_suspend, rwdt_resume);
>  static const struct of_device_id rwdt_ids[] = {
>  	{ .compatible = "renesas,rcar-gen2-wdt", },
>  	{ .compatible = "renesas,rcar-gen3-wdt", },
> +	{ .compatible = "renesas,rcar-gen4-wdt", },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rwdt_ids);
