Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8DE34C8A96
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Mar 2022 12:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbiCALWr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Mar 2022 06:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiCALWr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Mar 2022 06:22:47 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EF292D05;
        Tue,  1 Mar 2022 03:22:06 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id 10so7260039uar.9;
        Tue, 01 Mar 2022 03:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kzejyFiuehXRIUWS8u53+gnAL1CBx8p9s9qE6MLQuI=;
        b=f0Er7mSFG+hIXM9Xei37OLo6Hy+4pwkP3k2TBoaWnNSEow7VwZ11907vb19bmtSAqB
         d07+VJYj2RP4xqRGAkLrVwtnhkhQmnYyFUaZeEry9if5ALRTcWsDDyVnTLZm5eE3NCZO
         shDnraOdAH5GF3Nwd9SJILrRWNLZEp9y4bRmGoMs2FlnOTxnrkIjShy1p7+rXGUQZ+CJ
         lPKNBhYBYCKBPFWMxyqoZoxvNJCK4LEA3H+jKo8By3unHcJrObw52FOkVcQeFqnAhwdZ
         VXoFv2Rmj+fdbSmezsPOeOxslT+wVzkM5seAGHVe0ySnWZCQhtI//hOfwZ08mixUCyMn
         M39Q==
X-Gm-Message-State: AOAM53163tOzj6pzVfHtbdb9fn1rTjj+NXXge1MaLm8KkVkAOd9VZmYN
        MhwOBpsU1k8o2ISzlWARpKPjM9wXmcHQuA==
X-Google-Smtp-Source: ABdhPJxQdLGvwl0KFc7rQw6T48UtdfZ+Ub0hUUZCd9GeYfKzUsebdgXwj3amTJDE6q+HbmLdOciXRA==
X-Received: by 2002:ab0:2506:0:b0:346:90f8:52a with SMTP id j6-20020ab02506000000b0034690f8052amr7210747uan.3.1646133725881;
        Tue, 01 Mar 2022 03:22:05 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id i16-20020a056122129000b003314c50d705sm2174108vkp.22.2022.03.01.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 03:22:05 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id q9so16185418vsg.2;
        Tue, 01 Mar 2022 03:22:05 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr9723748vsl.77.1646133725272; Tue, 01
 Mar 2022 03:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com> <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220225175320.11041-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Mar 2022 12:21:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKMNcTOGZkRqnGPyrq2fdQSLMFj0xd=wDf812TyVqY_A@mail.gmail.com>
Message-ID: <CAMuHMdWKMNcTOGZkRqnGPyrq2fdQSLMFj0xd=wDf812TyVqY_A@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] watchdog: rzg2l_wdt: Add error check for reset_control_deassert
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

On Fri, Feb 25, 2022 at 6:53 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> If reset_control_deassert() fails, then we won't be able to
> access the device registers. Therefore check the return code of
> reset_control_deassert() and bailout in case of error.
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
