Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510E7456031
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 17:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbhKRQOA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 11:14:00 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:45982 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbhKRQOA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 11:14:00 -0500
Received: by mail-ua1-f48.google.com with SMTP id ay21so14741080uab.12;
        Thu, 18 Nov 2021 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYIzwdfhqzZc1u+wwwb6SMoTmsEojJZErBmzLNZT13U=;
        b=0C1ENxOrotxagWDlmO8XUjHctB2zjnpiwMSuKeIwJNM3HLNGX4OujZK6hXQGJyUOtf
         py641wF3CxnGaOkrWxQf4kWHNuB3VGdtN0a+dFXBKYynlS7Pl59UXldi9VuQiasPWDu/
         tmP6Ke0KP/y0ket7ytdz3L/d2EPKQWttwU82Kwfbu4eTUYAiJ+Lv88Z7sD3G06uGEh2S
         /iuuXNXeg8y7NO4Wgi5O8Yv7oGCIK5Z4curHI6kKO1wOaa7YnYihvkAcSBOUEyg3qclJ
         q3ih/RTtbnTU+ftsM6A+NV8ft0ptki5gWQ5X0fo+ArnGuaHO6B42TywPNc/iGmPV/o4k
         XyOg==
X-Gm-Message-State: AOAM531yy8KkWmRN7iEwsn/UhSndBoEhdp4JPglt75z12bTCik68ueF8
        0QkmNGK9yntmUnP8YdFsw3kqq7ZJDRtBaw==
X-Google-Smtp-Source: ABdhPJzag+fnKTQ/7IpUO/hA3FVaK5g1T2LhUTlCV3KcQauEF/P0+LTYwTJX6cGOtmoRd5pI7XlDkg==
X-Received: by 2002:a67:c90a:: with SMTP id w10mr83043947vsk.56.1637251859123;
        Thu, 18 Nov 2021 08:10:59 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id f26sm97479vkl.51.2021.11.18.08.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 08:10:58 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id k83so4091089vke.7;
        Thu, 18 Nov 2021 08:10:58 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr105621256vko.7.1637251858538;
 Thu, 18 Nov 2021 08:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com> <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com> <OS0PR01MB592263674F271F4B58B9BFF7869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592263674F271F4B58B9BFF7869B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 17:10:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVzADe1zGoQgWXGJG7uDvAt9o+0C074HkN7EPp+7Mf6Og@mail.gmail.com>
Message-ID: <CAMuHMdVzADe1zGoQgWXGJG7uDvAt9o+0C074HkN7EPp+7Mf6Og@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

On Thu, Nov 18, 2021 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
> > reset selection
> > On Wed, Nov 17, 2021 at 9:21 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > On the, next version I am planning to introduce the below code for
> > > Reset selection based on device availability, instead of selecting all
> > > the channels. Is it the right way to do ? please let me know.
> > >
> > > node = of_find_node_by_name (NULL, NULL, "watchdog@12800800"); if
> > > (node && of_device_is_available(node) {
> > >         // set reset selection for that channel
> > >         of_node_put(node);
> > > }
> > >
> > > node = of_find_node_by_name (NULL, NULL, "watchdog@12800c00"); if
> > > (node && of_device_is_available(node) {
> > >         // set reset selection for that channel
> > >         of_node_put(node);
> > > }
> > >
> > > node = of_find_node_by_name (NULL, NULL, "watchdog@12800400"); if
> > > (node && of_device_is_available(node) {
> > >         // set reset selection for that channel
> > >         of_node_put(node);
> > > }
> >
> > Matching on node names is very fragile.
>
> Agreed.
>
>   And what if the watchdog node is
> > enabled in DT, but the watchdog driver is not available?
> We will just configure, but since there is no watch driver available.
> I guess nothing will happen.
>
> > Moreover, this looks like it should not be controlled from the clock
> > driver, but from the watchdog driver instead.
>
> I have referred configure option from reset driver for R-Car, where WDT is configured
> in reset block as similar register is located in reset block rather the watchdog driver.
>
> May be I should not use Matching on node names, rather use bitmask of bits as you suggested.
>
> Please share your views.

On R-Car Gen2 and RZ/G1 SoCs, this is indeed configured by the
rcar-rst driver, because the support was added later. Initial R-Car
Gen2 revisions had hardware quirks preventing proper operation.
On R-Car Gen3 and other RZ/G2 SoCs, this is configured by the boot
loader, and it would be great if new SoCs (R-Car V3U, R-Car S4-8,
and RZ/G2L) would handle this the same way.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
