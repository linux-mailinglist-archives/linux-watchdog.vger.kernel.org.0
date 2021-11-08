Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DEC44991C
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Nov 2021 17:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241170AbhKHQKw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Nov 2021 11:10:52 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:46657 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235799AbhKHQKw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Nov 2021 11:10:52 -0500
Received: by mail-ua1-f54.google.com with SMTP id az37so32489429uab.13;
        Mon, 08 Nov 2021 08:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1guUS2rE5b4UjdbPreB/LTbDFGmKIfPoVdUdqsaY5k=;
        b=EK8idvfU3T4JLQsR78BJgoUtf5zvMuHGtNJPGQfEChDfv43lfDsY1TqSdzVKOt8RQN
         y6Z7HxDvX5haJTQUyFednhHs0aBOsm9gCL+Bh7E48GPI4B+mig9SNWWVOUCfUcn535K9
         nayGyYTPQHFS8l71PyEfvlOh82TwK6XClMTBEnxuHm4OufnLLnegrYasPf6RPuun4vK3
         kF2Rtr29SlOC1O0hj0x507MJFUQd9SSSKd6g3Bcg8dnBgxbJLB9HTqFxghUH4hKWT7Yi
         yrTGVQaK/1Yt01j6slSS0cwxze/nzQGk5WVYpJhpgPEOThp3aFanYw6RtP5cC/LGDLuF
         dzZw==
X-Gm-Message-State: AOAM5329NdMINvMUveqJk0he4A12GhXS/QzebesPXp9IKQ6o2Teo8kmd
        3fTmS6rdqLyN5VZwe/Rc+Zt5xF+Phw0WuJ61
X-Google-Smtp-Source: ABdhPJyvihKNXbo2jHQj27t0VVFWT/2OjwTPdL1bpG69Qk5rn3dEhWjxmXQ1ctYo4NgYOqUTXXW+sg==
X-Received: by 2002:a05:6102:948:: with SMTP id a8mr81797vsi.51.1636387687076;
        Mon, 08 Nov 2021 08:08:07 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id v1sm2774841uac.18.2021.11.08.08.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:08:06 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id s13so16953139uaj.11;
        Mon, 08 Nov 2021 08:08:06 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr715081vsj.50.1636387686435;
 Mon, 08 Nov 2021 08:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20211104160858.15550-1-biju.das.jz@bp.renesas.com> <20211104160858.15550-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211104160858.15550-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:07:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCFLCfobzhMyOTNAF7C34BRJLDBasb+2v49Hfm2++FXg@mail.gmail.com>
Message-ID: <CAMuHMdXCFLCfobzhMyOTNAF7C34BRJLDBasb+2v49Hfm2++FXg@mail.gmail.com>
Subject: Re: [RFC 3/4] clk: renesas: r9a07g044: Add WDT clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 4, 2021 at 5:09 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add WDT{0,1,2} clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
