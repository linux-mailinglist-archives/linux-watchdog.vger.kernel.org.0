Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA95B455761
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 09:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244921AbhKRI4T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 03:56:19 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34695 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244812AbhKRIz2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 03:55:28 -0500
Received: by mail-ua1-f52.google.com with SMTP id n6so12100754uak.1;
        Thu, 18 Nov 2021 00:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sG7wL8TsbltsCDKNOjp/aOqgHWLi22mmX04ZIv1op4w=;
        b=DQGxo71X8TsIkNx+s1YqlxD5vvZjZRCdkP5Qx9ZfueDtHG8USQ6ArP91Wn6x0IuddO
         FKgsHiyx1QdeWRGzgPBhmvtNpkY2rqYNsqAhR6mWjYupnoADqwoshpke6hd7NxTXOYPb
         io5IeL+nmbFq+RZU/i2OrpWfqs4aMJYUHdsjUvnlXgjzwv+CqY0BoSqcHAbiGPbdj65u
         2Rljesxa/+UFq7YuIBi5fC5TzcmSN9dD4uY5jI6/4OCg3mnQ9JjRoV5oB0xVxPmS/DtE
         0QWAb2qoZmS7zziFSuimoi54++o5uedEdzggBAzAPcG0Cy1fdJ7enB45aiBSocHV+Px/
         5kFQ==
X-Gm-Message-State: AOAM530O5DOFbfVNTyT6OEMEoL+s0P5TIrWQgcHSq+OljOcsJWqCXpgn
        Fpx0rEq2YCEK5ZhRs+mnpsmTaGiAE/JXnw==
X-Google-Smtp-Source: ABdhPJwMUFr/XOZVDWcK9nmoRxXYa36qERqYhkI6DGF+3yxdwuUc6KhFR/EuhG4PdrtJYxDFXnDRng==
X-Received: by 2002:a9f:21d7:: with SMTP id 81mr34036907uac.39.1637225548394;
        Thu, 18 Nov 2021 00:52:28 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id r2sm1219305vsk.28.2021.11.18.00.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 00:52:28 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id o1so12069139uap.4;
        Thu, 18 Nov 2021 00:52:27 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr78881504vsl.35.1637225547663;
 Thu, 18 Nov 2021 00:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com> <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxNFamJznWVrFNNm21P=hP9btibSN7NSh43O8AK4MLOQ@mail.gmail.com>
Message-ID: <CAMuHMdUxNFamJznWVrFNNm21P=hP9btibSN7NSh43O8AK4MLOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

Thanks for your patch!

On Thu, Nov 11, 2021 at 12:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch adds support for watchdog reset selection.

Please explain what this patch really does, and why it is needed,
instead of repeating the one-line summary.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c

> @@ -295,7 +296,28 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
>  };
>
> +#define CPG_WDTRST_SEL                 0xb14
> +#define CPG_WDTRST_SEL_WDTRSTSEL(n)    BIT(n)
> +
> +#define CPG_WDTRST_SEL_WDTRST  (CPG_WDTRST_SEL_WDTRSTSEL(0) | \
> +                                CPG_WDTRST_SEL_WDTRSTSEL(1) | \
> +                                CPG_WDTRST_SEL_WDTRSTSEL(2))

You might as well use BIT() directly. Or GENMASK().

> +
> +int r9a07g044_wdt_rst_setect(void __iomem *base)
> +{
> +       writel((CPG_WDTRST_SEL_WDTRST << 16) | CPG_WDTRST_SEL_WDTRST,
> +              base + CPG_WDTRST_SEL);
> +
> +       return 0;
> +}
> +
> +static const struct rzg2l_cpg_soc_operations r9a07g044_cpg_ops = {
> +       .wdt_rst_setect = r9a07g044_wdt_rst_setect,

As you use a function pointer, I assume different SoCs need different
handling, and you can't just store e.g. a bitmask of bits to set in info?


> +};
> +
>  const struct rzg2l_cpg_info r9a07g044_cpg_info = {
> +       .ops = &r9a07g044_cpg_ops,
> +
>         /* Core Clocks */
>         .core_clks = r9a07g044_core_clks,
>         .num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index a77cb47b75e7..f9dfee14a33e 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -932,6 +932,12 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>         if (error)
>                 return error;
>
> +       if (info->ops && info->ops->wdt_rst_setect) {
> +               error = info->ops->wdt_rst_setect(priv->base);
> +               if (error)
> +                       return error;
> +       }
> +
>         return 0;
>  }
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
> index 484c7cee2629..e1b1497002ed 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -156,9 +156,20 @@ struct rzg2l_reset {
>                 .bit = (_bit) \
>         }
>
> +/**
> + * struct rzg2l_cpg_soc_operations - SoC-specific CPG Operations
> + *
> + * @wdt_rst_setect: WDT reset selection
> + */
> +struct rzg2l_cpg_soc_operations {
> +       int (*wdt_rst_setect)(void __iomem *base); /* Platform specific WDT reset selection */

Do you plan to add more operations?

> +};
> +
>  /**
>   * struct rzg2l_cpg_info - SoC-specific CPG Description
>   *
> + * @ops: SoC-specific CPG Operations
> + *
>   * @core_clks: Array of Core Clock definitions
>   * @num_core_clks: Number of entries in core_clks[]
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> @@ -176,6 +187,9 @@ struct rzg2l_reset {
>   * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
>   */
>  struct rzg2l_cpg_info {
> +       /* CPG Operations */
> +       const struct rzg2l_cpg_soc_operations *ops;
> +
>         /* Core Clocks */
>         const struct cpg_core_clk *core_clks;
>         unsigned int num_core_clks;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
