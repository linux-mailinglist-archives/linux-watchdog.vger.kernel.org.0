Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8EE4895B2
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jan 2022 10:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243278AbiAJJvo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jan 2022 04:51:44 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:34658 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243319AbiAJJvo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jan 2022 04:51:44 -0500
Received: by mail-ua1-f47.google.com with SMTP id y4so22391647uad.1;
        Mon, 10 Jan 2022 01:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qd6wvXlawcNgcy1EVtGWbQcMf+35s16SS0EMotVrcqs=;
        b=XWznAewQ82PAIbURXshfb7h2OwMjOkv9xnaeZ2W9lGqqT6Nq7wvJkUvvO2tQ5ZwjUZ
         Oi8NDSilyEKmT9nFY6G05KTaiRA0lFqN2xZnMINw5m6rn29zw/MT5M3gpfmaYWqzVFuJ
         x5vgtMGML6Oz6GUpTlHQe0oBJYKfVotkEkp/rdzFWj41AeLMG/7t+Ac24Meko/s1cQAX
         Q+hvqUtTMuLCmGKym6yVSgDnRn3w+dg8GOhs3zQ1d+KmsA6XmCR0jmi5XAKyPUoyr6ji
         MWLbVfIpbSM1g/eDm1PqHDnKcN9OS8CCHBmXE4pbXM5caVRoFYUzGPUvx4nK9AFffzsq
         BJvw==
X-Gm-Message-State: AOAM5326GHi8D2LS4ugfBdnf//kkJakv6xbBNxsRELIG+WP1uUHeARFI
        cnYDhFg/7Lez8qwLFaH8orpoKWQWXpEt4w==
X-Google-Smtp-Source: ABdhPJyrJivNVVv50S0ECykDdBuwZKVrp9JtAjOhAoKD05i1s7kmK4mPar7tMLM6Aq/HzD/OgRzglw==
X-Received: by 2002:a67:d485:: with SMTP id g5mr25528315vsj.14.1641808303141;
        Mon, 10 Jan 2022 01:51:43 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id m8sm3444828uae.8.2022.01.10.01.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 01:51:42 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id y4so22391601uad.1;
        Mon, 10 Jan 2022 01:51:42 -0800 (PST)
X-Received: by 2002:a9f:3e09:: with SMTP id o9mr1690817uai.114.1641808302517;
 Mon, 10 Jan 2022 01:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20220104181249.3174-1-biju.das.jz@bp.renesas.com> <20220104181249.3174-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220104181249.3174-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 10:51:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
Message-ID: <CAMuHMdWYQXsiik3z63UX4fXNfOFqGFt4VnkwOzr9mHkPMZiyWA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Tue, Jan 4, 2022 at 7:12 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch uses the force reset(WDTRSTB) for triggering WDT reset for
> restart callback. This method is faster compared to the overflow method
> for triggering watchdog reset.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -21,8 +21,11 @@
>  #define WDTSET         0x04
>  #define WDTTIM         0x08
>  #define WDTINT         0x0C
> +#define PECR           0x10
> +#define PEEN           0x14
>  #define WDTCNT_WDTEN   BIT(0)
>  #define WDTINT_INTDISP BIT(0)
> +#define PEEN_FORCE_RST BIT(0)

PEEN_FORCE, as this can trigger either a reset or interrupt?

>
>  #define WDT_DEFAULT_TIMEOUT            60U
>
> @@ -116,15 +119,11 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  {
>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>
> -       /* Reset the module before we modify any register */
> -       reset_control_reset(priv->rstc);
> -       pm_runtime_get_sync(wdev->parent);

Why are these no longer needed?
Because .probe() takes care of that? Then why do .start() and .stop()
have reset and Runtime PM handling, too?

> -
> -       /* smallest counter value to reboot soon */
> -       rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> +       /* Generate Reset (WDTRSTB) Signal */

... on parity error

> +       rzg2l_wdt_write(priv, 0, PECR);
>
> -       /* Enable watchdog timer*/
> -       rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +       /* Force reset (WDTRSTB) */

s/reset/parity error/

> +       rzg2l_wdt_write(priv, PEEN_FORCE_RST, PEEN);
>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
