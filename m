Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817C74C8A90
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Mar 2022 12:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbiCALVj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Mar 2022 06:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiCALVi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Mar 2022 06:21:38 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F7C92D05;
        Tue,  1 Mar 2022 03:20:57 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id e5so16126120vsg.12;
        Tue, 01 Mar 2022 03:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=egZzuenQ++aNBR+f3SCfK5DI8vnz/ZKAh8WVc7onvMA=;
        b=bMpNnaObUftZXuvgZj0IqcOZOcK3+xSQYkUmw8cVeC8LULd0fs4hNeH0sNUCFdnw/6
         oN7GWcVQQb7WeGUSq9oDmzXY0c/ckHZyscBba2Z3DvCmUdrQv1VMyjvCIrNI02alPa3d
         Z6K6mI+HsoCyFkCf9VqaqTctgubI5WDuiLJnk5jRfjyZDEcy6BCPyhqrvu4+wLOFtv6E
         KxbqYE4U1d7Tgg7tbir2+3pbuih6fZcQh/lYm4Q91lvB7X107D7Qp/kIwh6dYm3P0r14
         kAK9mq+351EUlAn8FiDnBPz1Q8ukEr1RBmBmkywG9sxPBP6YCbA9eOWjUDNju1TiYz0F
         9dNw==
X-Gm-Message-State: AOAM532rImPEwVrjjMUXf6pOkwLcLokqb6NPdD1zYHiwswcIJTiJ2rPv
        cwYQL31GuFAPU9EQI+VfEfwPqmlxbB4Llg==
X-Google-Smtp-Source: ABdhPJzLZY9701yRJwih/FMaYUGdJJPu97dFP0SWxP8hSIc99tGHoHF9Sx3f7jLd48BpZ0FiuXkWMw==
X-Received: by 2002:a67:4285:0:b0:31b:717b:c4a with SMTP id p127-20020a674285000000b0031b717b0c4amr9495901vsa.58.1646133656409;
        Tue, 01 Mar 2022 03:20:56 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id j8-20020ac5ce08000000b00333295130d5sm1571484vki.0.2022.03.01.03.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 03:20:55 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id f12so6681591vkl.2;
        Tue, 01 Mar 2022 03:20:55 -0800 (PST)
X-Received: by 2002:a05:6122:114e:b0:32d:4662:65a8 with SMTP id
 p14-20020a056122114e00b0032d466265a8mr9796453vko.0.1646133655547; Tue, 01 Mar
 2022 03:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com> <20220225175320.11041-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220225175320.11041-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Mar 2022 12:20:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWan4gFG3Hi01C9+2q=sntYuxbMYtaJOAGo0DWFRt2HPg@mail.gmail.com>
Message-ID: <CAMuHMdWan4gFG3Hi01C9+2q=sntYuxbMYtaJOAGo0DWFRt2HPg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] watchdog: rzg2l_wdt: Fix reset control imbalance
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

On Fri, Feb 25, 2022 at 6:53 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
