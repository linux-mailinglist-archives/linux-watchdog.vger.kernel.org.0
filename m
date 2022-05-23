Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9679D5310C5
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 15:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbiEWLrC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 07:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234998AbiEWLqz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 07:46:55 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8578445799
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 04:46:45 -0700 (PDT)
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Msqty-1nZNqW0hXU-00tALn for <linux-watchdog@vger.kernel.org>; Mon, 23 May
 2022 13:46:44 +0200
Received: by mail-ot1-f41.google.com with SMTP id s23-20020a9d7597000000b0060ae566f9a1so7370862otk.1
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 04:46:43 -0700 (PDT)
X-Gm-Message-State: AOAM531wVSAIspUgFKcPy76smS2uvQmUL36Cc0w1bWAC7Rj3mdh86Z0q
        O94FgHOA8J6ZSVr5R83TzzMk3HyDIG5Zcparl8c=
X-Google-Smtp-Source: ABdhPJzbbTU7bxyEy+V6QZ7ro2Wti/wri258NXrp2iXt1Owp7jIbpPdzCSwsk8vjZl8l7XWvxC1S+1Cf8oUw+fAt8d0=
X-Received: by 2002:a81:6283:0:b0:2ff:2443:6f3c with SMTP id
 w125-20020a816283000000b002ff24436f3cmr22577090ywb.135.1653302662526; Mon, 23
 May 2022 03:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-13-tmaimon77@gmail.com>
In-Reply-To: <20220522155046.260146-13-tmaimon77@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 23 May 2022 12:44:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Message-ID: <CAK8P3a0PKvqpTjNeKUm6EnxpmJAtmk1jv+b4YXxr+fXFpsWXtw@mail.gmail.com>
Subject: Re: [PATCH v1 12/19] reset: npcm: Add NPCM8XX support
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        gregkh <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        robert.hancock@calian.com,
        "nathan=20Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/rqEHSZBryOAZIcGpbPDUOTvgdhFBkb4tPsOhONXALjIy7Jx950
 +6FcyyUEDmn0TAxqc0FXC+vDFlCSLa7soeIGmi9ER4FtE4yH3JXCm8odVA/iiTDXYxT+fYh
 PzDYDSEaUqXs+NsfWtgVIV4mCyOIlHBRTpKWpApkAJreoCK8mHW+Nk2kZceb0+lmWCb1/ec
 0Hw8nh2K3Z69BdTtYciWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b6T8hTIycB0=:wX4m5/Gup648wakltuv3lP
 Z6qSBFLiW94aw/yyXM/OImNWzS7EeU2gpmj9ysyEKUMbn6cTFwCSRz9xN87wFLAfUMHVL7t6j
 qILJ5aBu/G+QFGlL319+y+JSoFhsWhs4sB6r3l3OKO9G8w/j9Y7V7/5oxMCEWkOprbiJD/w/q
 yXZeiEns9XGsGNLZyqTO6H/wN4NqOxu/4yagRGFjRcEm4UNdoOCKC4zHkpQhHXwcDe8F2vc9A
 3pLaX7LNivkpDczvv88GGaBF7slyhqIHPdeXLz4X87t7VQjQ14kn/cmdf3WyjmCdeCzA9HLei
 432JVTVPAut6BNUbMKtU2jLUdD6WDV+7wEcvT1ZMmHntPwvfaFPxLHWiTbkDWdvyoDoK5kmjc
 D2QA/muoPh/XVKbhvxbs021EQK5kPqs1MWXjiEeyWAC3ALX3utR/5svfnEK9MqQWBJ1ihsS8Y
 Rg8+eow/EjhxefBgmfqmndBN1rCnJsoIVmQX4cmFKPLmolCJm8/egUj79WbNkz8QIOT7TVg/3
 aPwVBkp7HxUld7svz7Qn9W7uKDXc2AvOkyEBniizQ42pj2Y5ms7FXHksY5BylUUGnZ49Dq9l9
 WVcrzaVFpAsJ8gSX4eRTVnj1eVO1z+vPbcZRC4ufV88fTXh772ykxbxB4PfZ4cZx0Cw8eLQ9w
 NRU/vFIExQ1TAnIcOm0CNVC93U9izwYIrUUPvr36AxCeSddHmk559HH2ZU7WeLQwJaijE+Qw0
 UhYQZRBgwvkEs2zWrFnPIS6a0YPwmq4eQuuhhMEsWyuK68SiDIFbjlX94yyR7yShbTnJcq4Ns
 nAAiTZuDwHTZBrt5HrRZl5UYZBFXxA+DJA/mz+vpHw98ExmljOkuH8ydF7++Exbc9hZn476EW
 VW30arubeGctZgSxX6Uw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 22, 2022 at 5:50 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

>  static const struct of_device_id npcm_rc_match[] = {
>         { .compatible = "nuvoton,npcm750-reset"},
> +       { .compatible = "nuvoton,npcm845-reset"},
>         { }
>  };
> +/*
> + *  The following procedure should be observed in USB PHY, USB device and
> + *  USB host initialization at BMC boot
> + */
> +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +
> +       rc->gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +       if (IS_ERR(rc->gcr_regmap)) {
> +               dev_err(&pdev->dev, "Failed to find gcr syscon");
> +               return PTR_ERR(rc->gcr_regmap);
> +       }
> +
> +       if (of_device_is_compatible(np, "nuvoton,npcm750-reset"))
> +               npcm_usb_reset_npcm7xx(rc);
> +       else if (of_device_is_compatible(np, "nuvoton,npcm845-reset"))
> +               npcm_usb_reset_npcm8xx(rc);
> +       else
> +               return -ENODEV;
>

In place of the string comparison in of_device_is_compatible(), maybe just use
the .data field of the of_device_id structure to point to the actual
reset function.

Alternatively, register two separate platform_driver instances here and
use separate probe functions that do the soc specific bits and call into
shared functions for the bits that are the same.

       Arnd
