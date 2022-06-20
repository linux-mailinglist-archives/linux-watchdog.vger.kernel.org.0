Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A74D5518CB
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 14:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241246AbiFTMZA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 08:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241814AbiFTMY7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 08:24:59 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBD817A91;
        Mon, 20 Jun 2022 05:24:58 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id g18so8095662qvn.2;
        Mon, 20 Jun 2022 05:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1GDSIQofcvuN8MBngISKHf3i/1+PL5wfbt53xdCYrSA=;
        b=HDT5bgzcQ9ZbJ7tc8KRjaALsAbz41qrCkmmb51cxVrG49EcAjW6aAG2KWWfdwG2Ykz
         jYgFglYlZUFStmns8VnVAjoV+lDR+EYlkl2u3kV1PlYQ1DlzdyzHWbgzZEP9g5vXhgXE
         39nlPbhb5pCg/9cieJhe9q/hUAwS0MMTsoz7b/JLAV9qhDIzYsUrENw8slzrKaq2rcPQ
         vdXZya2hBcm8jpM/Q58rVeMytXfWmdZ3tphlQM92u1FqX5v89KHP39jsOqrpG7DDXQb6
         z92N+7huBNgeL4zi38LCdBIMlSQUHAiOdbh2zxqz2xdqm/RULiz4wrlQWwRHeDXbE/wK
         /Uzg==
X-Gm-Message-State: AJIora/aq9PLk+o1t0DH7iw9Uvp6KfW7grf0zjY5b5jV3YOF2O6tQJVa
        EJX0doRtabb6xiCTPOf1D3zlMcqHB9EkxQ==
X-Google-Smtp-Source: AGRyM1t5EyR/BDF6p2ph1uQVbFqH0W6NQTyaY/LxsMWhA/g4QX4LEV5oUbxJTsBcKbJvQ1f76JZ6Ig==
X-Received: by 2002:a05:6214:21e6:b0:46e:4f35:b07c with SMTP id p6-20020a05621421e600b0046e4f35b07cmr18925460qvj.12.1655727897998;
        Mon, 20 Jun 2022 05:24:57 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id z22-20020ac81016000000b00307c87b8239sm8144767qti.46.2022.06.20.05.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:24:57 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3178acf2a92so64453837b3.6;
        Mon, 20 Jun 2022 05:24:57 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr27852569ywd.383.1655727897225; Mon, 20
 Jun 2022 05:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220620102600.52349-1-phil.edworthy@renesas.com> <20220620102600.52349-3-phil.edworthy@renesas.com>
In-Reply-To: <20220620102600.52349-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jun 2022 14:24:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7LYh_wuujgKcvKSjxqH-bhhhXgh45D2awoC4P0kxs4w@mail.gmail.com>
Message-ID: <CAMuHMdV7LYh_wuujgKcvKSjxqH-bhhhXgh45D2awoC4P0kxs4w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] watchdog: rzg2l_wdt: Add rzv2m support
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

On Mon, Jun 20, 2022 at 12:26 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> The WDT on RZ/V2M devices is basically the same as RZ/G2L, but without
> the parity error registers. This means the driver has to reset the
> hardware plus set the minimum timeout in order to do a restart and has
> a single interrupt.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  - Don't call pm_runtime_get_sync() in restart()
>  - Use mdelay instead of udelay, avoids DIV64_U64_ROUND_UP

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
