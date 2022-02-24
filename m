Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E79E4C284A
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiBXJif (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbiBXJia (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:38:30 -0500
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C183F27AA31;
        Thu, 24 Feb 2022 01:38:00 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id y4so1446224vsd.11;
        Thu, 24 Feb 2022 01:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NkiPKWL2DYT9Xb29beY6JtzlhRGsFPJr2sVrGZy28c=;
        b=MdBj5HlQB6qWch8EsdMNOPIjgeyNx3NyoUeixMS9uD5tfcf5FG4L5b34JwmnDKcGEq
         BkYonNJmL/YmjlHtAhFnps+zoUMWpoLgensGkr6MNN4kmxBKv5pZDTiRvSwNKdIspAWn
         3HcFtFLD0B3uOsRdcYHlgO6Aya4tS3DDK8tM1MvxucrnSX8JUjDak8ATZvq/V7muQCyZ
         gk/uAS0j0WMAnhV34yZdxaGR6kgBcM1BoLmzEcUpi69xFlCVy/nTYnoxhRfZdS40rHUb
         T3TBAj/LDvJgXJngH+JSm/8X7l/VMeTo49cPLYog5jWbgvIHCQMzQHXCx5hnw5SDIVm9
         sGNA==
X-Gm-Message-State: AOAM533XeA2VQsN15foj2GwK+lfXnRegCRklYNIdjM7SOE7R7Ji95zPv
        AxvlxiRqexnUsh4UfcsxYTcsorMa4XkTSA==
X-Google-Smtp-Source: ABdhPJw2tLnaR9wtewctfCkckqTZjQA3paM+cUNPvigK4QgMzHTCDfLznNpYFaF/Daal5Mys/V48/g==
X-Received: by 2002:a67:d98f:0:b0:31b:65c3:765b with SMTP id u15-20020a67d98f000000b0031b65c3765bmr626148vsj.69.1645695479864;
        Thu, 24 Feb 2022 01:37:59 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id bk26sm325811vkb.3.2022.02.24.01.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:37:59 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id q9so1499310vsg.2;
        Thu, 24 Feb 2022 01:37:59 -0800 (PST)
X-Received: by 2002:a67:af08:0:b0:31b:9451:bc39 with SMTP id
 v8-20020a67af08000000b0031b9451bc39mr638958vsl.68.1645695479083; Thu, 24 Feb
 2022 01:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com> <20220223160100.23543-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220223160100.23543-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:37:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnLOVSi62_kiZBr2Fze_jr2wNxLfz3ZC8SXU1ei3yecw@mail.gmail.com>
Message-ID: <CAMuHMdXnLOVSi62_kiZBr2Fze_jr2wNxLfz3ZC8SXU1ei3yecw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] watchdog: rzg2l_wdt: Use force reset for WDT reset
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
> This patch uses the force reset(WDTRSTB) for triggering WDT reset for
> restart callback. This method(ie, Generate Reset (WDTRSTB) Signal on
> parity error)is faster compared to the overflow method for triggering
> watchdog reset.
>
> Overflow method:
>         reboot: Restarting system
>         Reboot failed -- System halted
>         NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
>
> Parity error method:
>         reboot: Restarting system
>         NOTICE:  BL2: v2.5(release):v2.5/rzg2l-1.00-27-gf48f1440c
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c

> @@ -117,17 +120,14 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  {
>         struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>
> -       /* Reset the module before we modify any register */
> -       reset_control_reset(priv->rstc);
> -

I think this part belongs in patch 4/6.

>         clk_prepare_enable(priv->pclk);
>         clk_prepare_enable(priv->osc_clk);
>
> -       /* smallest counter value to reboot soon */
> -       rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> +       /* Generate Reset (WDTRSTB) Signal on parity error */
> +       rzg2l_wdt_write(priv, 0, PECR);
>
> -       /* Enable watchdog timer*/
> -       rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +       /* Force parity error */
> +       rzg2l_wdt_write(priv, PEEN_FORCE, PEEN);
>
>         return 0;

The rest LGTM, to
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
