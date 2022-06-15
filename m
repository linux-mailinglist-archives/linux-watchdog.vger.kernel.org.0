Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E2054C4E5
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jun 2022 11:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346907AbiFOJlJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Jun 2022 05:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346980AbiFOJlE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Jun 2022 05:41:04 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E36E40E6B;
        Wed, 15 Jun 2022 02:41:01 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id o43so8440463qvo.4;
        Wed, 15 Jun 2022 02:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=02+nsEsQLvBL/Q4dC+CUWcVtjKMjSdq60fs4gtgfor4=;
        b=mblRgJdX375h/VzM5UWnwBcmUUnl2SRPVCzTAQjWeIKvXWHaUGuv+5tQOp4sQoewKS
         5TCaSaUMyLojBFyD5euGBOffwqODT+mJ3vGeS0JELfsfypOv/TJt4mEgD3TFNK/jbLzX
         iy+bTUnezMNkEb5prYcfYz/0K3lxfvbStUBv4V5b2OtXj/HjfSuZy2spgQ5eSMKzP3qE
         gzc5/Oye8wBKkYEGZjB1qIlRoMhTwXSXDBEdCPQENjUMP8WvluBop8EvisdKbWZ/KclO
         5nAd2FeziJ6PMDJ9eFCZgUOA943xG9h/jiaHsgwCM/u2Fx7F4glJMTis14ZZZCIwBARy
         rhoQ==
X-Gm-Message-State: AJIora/oPmtkPM2gXLQKvfCVcIY63gmoaz2gEzSPgJwbqLTGRovL1r+A
        bxH34UPyme4lFSoKElLvDYa3ZRn8KlVhAw==
X-Google-Smtp-Source: AGRyM1ur/k0gS6HNK4j1nVV5yZlYCT03L4YTfg4WYKeFFzkaGGLN6Y9O6eTEYw1pQd9/sicJQxI8TA==
X-Received: by 2002:a05:6214:29ca:b0:46b:92c5:9f3b with SMTP id gh10-20020a05621429ca00b0046b92c59f3bmr7051234qvb.20.1655286060564;
        Wed, 15 Jun 2022 02:41:00 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x5-20020a05620a448500b006a6be577535sm13119959qkp.85.2022.06.15.02.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 02:41:00 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id h27so19563347ybj.4;
        Wed, 15 Jun 2022 02:40:59 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr9245791ybc.380.1655286059740; Wed, 15
 Jun 2022 02:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220613150550.70334-1-phil.edworthy@renesas.com> <20220613150550.70334-3-phil.edworthy@renesas.com>
In-Reply-To: <20220613150550.70334-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 11:40:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
Message-ID: <CAMuHMdWhj8puZBBDS9256tW91z8Oh8-z_O_jbTgBsNtgeaS-pg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: rzg2l_wdt: Add rzv2m support
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Phil,

On Mon, Jun 13, 2022 at 5:06 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> the parity error registers. This means the driver has to reset the
> hardware plus set the minimum timeout in order to do a restart and has
> a single interrupt.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Replace use of parity error registers in restart
>  - Commit msg modified to reflect different contents

Thanks for the update!

> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c

> @@ -139,14 +146,25 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  {
>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>
> -       clk_prepare_enable(priv->pclk);
> -       clk_prepare_enable(priv->osc_clk);
> +       if (priv->devtype == I2C_RZG2L) {
> +               clk_prepare_enable(priv->pclk);
> +               clk_prepare_enable(priv->osc_clk);
>
> -       /* Generate Reset (WDTRSTB) Signal on parity error */
> -       rzg2l_wdt_write(priv, 0, PECR);
> +               /* Generate Reset (WDTRSTB) Signal on parity error */
> +               rzg2l_wdt_write(priv, 0, PECR);
>
> -       /* Force parity error */
> -       rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +               /* Force parity error */
> +               rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
> +       } else {
> +               /* RZ/V2M doesn't have parity error registers */
> +
> +               wdev->timeout = 0;
> +               rzg2l_wdt_start(wdev);

This will call pm_runtime_get_sync(), which is not allowed in this
context, cfr. commit e4cf89596c1f1e33 ("watchdog: rzg2l_wdt: Fix
'BUG: Invalid wait context'").
While you can call clk_prepare_enable() instead, that can only be
used as a temporary workaround, until you have implemented RZ/V2M
power domain support...

> +
> +               /* Wait 2 consecutive overflow cycles for reset */
> +               udelay(DIV64_U64_ROUND_UP(2 * 0xFFFFF * 1000000ULL,
> +                                         priv->osc_clk_rate));

DIV64_U64_ROUND_UP() does a 64-by-64 division, while priv->osc_clk_rate
is "unsigned long" (yes, that is 64-bit on RZ/G2L and RZ/V2M ;-)
Unfortunately there is no rounding version of div64_ul() yet.

However, there is no need to use a 64-bit dividend, as the resulting
delay will be multiple ms anyway, so you can just use mdelay() instead:

    mdelay(DIV_ROUNDUP(2 * 0xFFFFF * 1000, priv->osc_clk_rate));

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
