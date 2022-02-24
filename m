Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2278E4C2828
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiBXJfg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbiBXJff (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:35:35 -0500
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 415BB27AFFB;
        Thu, 24 Feb 2022 01:34:56 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id l42so846669vkd.7;
        Thu, 24 Feb 2022 01:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wyjbz4XhiO4ffL5jyK5bZEf+e5lTiC1fLwLtqpE7a4=;
        b=XT5JtJkip1eeD7Bret6h8/H+p9hdXs5eL5tRW3ruwym0iILS/AzBzHmYQ3z0pGWmSP
         VhlYTrId8ev2I1nACepO6yDJ0yPnd2A3HmrUPwYcswjVVC+NFJQwYfqJ6gFW51yHit1i
         II/sDInt17TW5C0QOU62cPRj971uj2cJhqwSqT8l4cHefKybUG6ccFmJYBT2FatwlXJt
         G7MFY/MtjNfVuD+EOWj3IterjbXQEWxVHGQivgZ+te9Ft4Avo7qSbm0u6TCt1KAMdXMt
         IOTJWLJNkeoPGo3UKJlLJyv2XOWMjVncoeriTF7qM7xx2q7s2TeAZMdHcl0ZDyuxykuL
         2WYQ==
X-Gm-Message-State: AOAM531vpknGnla6eNfgCMAym6fgmxQ0Cj0QSi48GjZD9wvD7n2Ix5fZ
        c0Gg7NLNp/7mncBFBtxaQz8OON8kyJN2+Q==
X-Google-Smtp-Source: ABdhPJxeCyt+Scg1Y82VUL0vFGWa/tS0AigZU2TWej2nvjiVkGi6bo1qo3oiLYCDvvtFXhczZOsCSw==
X-Received: by 2002:a1f:a8d8:0:b0:32f:7362:c169 with SMTP id r207-20020a1fa8d8000000b0032f7362c169mr720247vke.16.1645695294825;
        Thu, 24 Feb 2022 01:34:54 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id n77sm313502vkn.29.2022.02.24.01.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:34:54 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id d26so1526182vsh.0;
        Thu, 24 Feb 2022 01:34:54 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr702091vsl.38.1645695293897; Thu, 24 Feb
 2022 01:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com> <20220223160100.23543-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220223160100.23543-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:34:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV80cvBCP-zOH-opy5hviXZiO6Xf43RCF-ah9kZXgPdAQ@mail.gmail.com>
Message-ID: <CAMuHMdV80cvBCP-zOH-opy5hviXZiO6Xf43RCF-ah9kZXgPdAQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] watchdog: rzg2l_wdt: Add error check for reset_control_deassert
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Biju,

On Wed, Feb 23, 2022 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> If reset_control_deassert() fails, then we won't be able to
> access the device registers. Therefore check the return code of
> reset_control_deassert() and bailout in case of error.
>
> While at it change reset_control_assert->reset_control_reset in
> rzg2l_wdt_stop() and remove unnecessary reset_control_deassert()
> from rzg2l_wdt_start().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -88,7 +88,6 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev)
>  {
>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>
> -       reset_control_deassert(priv->rstc);

So before, we had a reset control imbalance?
  - After probe, reset was deasserted.
  - After start, reset was deasserted twice. Oops.
You probably want to mention this in the commit description, too.

>         pm_runtime_get_sync(wdev->parent);
>
>         /* Initialize time out */
> @@ -108,7 +107,7 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>
>         pm_runtime_put(wdev->parent);
> -       reset_control_assert(priv->rstc);
> +       reset_control_reset(priv->rstc);

As the reset is now deasserted after probe(), stop(), and start(),
I think the reset_control_reset() in .restart() can now be removed?

>
>         return 0;
>  }
> @@ -204,7 +203,10 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
>                                      "failed to get cpg reset");
>
> -       reset_control_deassert(priv->rstc);
> +       ret = reset_control_deassert(priv->rstc);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to deassert");
> +
>         pm_runtime_enable(&pdev->dev);
>
>         priv->wdev.info = &rzg2l_wdt_ident;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
