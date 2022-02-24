Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB17D4C2852
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbiBXJl7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiBXJl7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:41:59 -0500
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C749E27C22D;
        Thu, 24 Feb 2022 01:41:28 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id j5so837789vkc.12;
        Thu, 24 Feb 2022 01:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2n3djdD0ehpaitg5msUu5a73DQvGqwZBIb3uad9aDI0=;
        b=hSHGPvfd12HtgjOf29YNxRgLlgvR39fbX9soskizRLk5CpoL6kHuc+/1o2n5nBecKF
         sROHbnjZm/hGRLTuEI9+kZ2fZDZASu2YGI6FgHvcWy6fSiXKKD7vj5D6mk9vDUj8K+2v
         Zr7428zR75A6s5Y82SB3STh/2x36eIsNgE5UAv8ZXVwYCgs5zQwX5fKTkivQa7Htk88t
         Lb/aBvUwidJBp4BdjKXlH5+XUMoXv4Su8MJbFm6ofwroueTLviBFU71J4KgRZl35QkpE
         MxgKoaYr7bWUVSFTJ8dT8z81/dENfP57TTMVkYwHgJJb6x2onAuc2ctHA24g6BUtAS55
         ZR4Q==
X-Gm-Message-State: AOAM531GHgtwELpKxAAqZ1eYeYaadnpGZJm6Njk/TV7jpe7QvL02kXOG
        2ypFSBd3Q2397KyF/rSQ3m0QKGQ6ZgsMcA==
X-Google-Smtp-Source: ABdhPJyShob6ew6XZi0Fux4UljktNyJVtc37KmR1LIihgGtsBDBEB74VtOuoNc/OBp7gRdcqjA1wpw==
X-Received: by 2002:a1f:3f84:0:b0:32d:dad:6642 with SMTP id m126-20020a1f3f84000000b0032d0dad6642mr708641vka.4.1645695687748;
        Thu, 24 Feb 2022 01:41:27 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id t80sm314617vkt.26.2022.02.24.01.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:41:27 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id c23so604776uaq.7;
        Thu, 24 Feb 2022 01:41:27 -0800 (PST)
X-Received: by 2002:ab0:69d0:0:b0:345:72b0:ee12 with SMTP id
 u16-20020ab069d0000000b0034572b0ee12mr742915uaq.78.1645695686941; Thu, 24 Feb
 2022 01:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com> <20220223160100.23543-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220223160100.23543-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:41:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd-QuDBZuXxBECXwRd3jafbEs8Ub0s5cv0g4j-vc283w@mail.gmail.com>
Message-ID: <CAMuHMdXd-QuDBZuXxBECXwRd3jafbEs8Ub0s5cv0g4j-vc283w@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] watchdog: rzg2l_wdt: Add set_timeout callback
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
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

On Wed, Feb 23, 2022 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch adds support for set_timeout callback.
>
> Once WDT is started, the WDT cycle setting register(WDTSET) can be updated
> only after issuing a module reset. Otherwise, it will ignore the writes
> and will hold the previous value. This patch updates the WDTSET register
> if it is active.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
