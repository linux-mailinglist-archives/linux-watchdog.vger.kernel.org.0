Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A88E551127
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Jun 2022 09:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbiFTHOc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Jun 2022 03:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239159AbiFTHOb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Jun 2022 03:14:31 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6651AE08A;
        Mon, 20 Jun 2022 00:14:30 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id n197so7248497qke.1;
        Mon, 20 Jun 2022 00:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZvFgGmRSKV3ViC+lYOiHtpp+gueqKdAasj4tjVN6ZM=;
        b=MtTbXQeCzvoa8gMsLbH3LjmgIqNXbgbvrf3JNhm8PLuWvAtddmKDaZucVfrY2KFUvT
         0LBhFFzoqPWxRrwipnKUYQ9e1I1kE/nygHcW27ysfNfvxJfttWLcX7vdBFY/WvC6rkwQ
         3shJV0briQcF5XviRLdvyFNdlY5BRZu/TA+wTWD5JlqnZl5hgFhTt1szFwr5dUGZ0k4u
         mPyXjjFn07AsiNxh8k5RhfyC6hgFXuHNICAO+Q+X/+im6O7LPB1WF5SxNn+KV6KavT1M
         e6LtWR5ef92HULiHrapnWgbrFoHZOBKcyDinBuzXi57Q3zN1gJYcRLcz5NntY64SJQRW
         z1TQ==
X-Gm-Message-State: AJIora+scZHBsIrwVcFUWiZchkGw4D1b4AQc+mio0wP0DgCkf5TWIa3L
        S6RXvC0Bzl95rKsDL7WSaruJb3UYMtbJjg==
X-Google-Smtp-Source: AGRyM1vA1xX9s1j7h4sfCHlwewpIEy9yKBsxeKph00cn1xrFPXnzYIQ9fzAPg7aKy4k5ARK7EQIaGA==
X-Received: by 2002:a37:98b:0:b0:6a6:b2ca:194c with SMTP id 133-20020a37098b000000b006a6b2ca194cmr15575165qkj.470.1655709269051;
        Mon, 20 Jun 2022 00:14:29 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id bs36-20020a05620a472400b006a353b7bf78sm11072852qkb.122.2022.06.20.00.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 00:14:28 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i15so12540754ybp.1;
        Mon, 20 Jun 2022 00:14:27 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr24423394ybu.604.1655709267584; Mon, 20
 Jun 2022 00:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220613150550.70334-1-phil.edworthy@renesas.com> <20220613150550.70334-2-phil.edworthy@renesas.com>
In-Reply-To: <20220613150550.70334-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Jun 2022 09:14:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiXh3duootbNXKE0aWRAGZwOHx63PZN4c0tPT8TLGcvg@mail.gmail.com>
Message-ID: <CAMuHMdUiXh3duootbNXKE0aWRAGZwOHx63PZN4c0tPT8TLGcvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: renesas,wdt: Add r9a09g011
 (RZ/V2M) support
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

Hi Phil,

On Mon, Jun 13, 2022 at 5:06 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add the documentation for the r9a09g011 SoC, but in doing so also
> reorganise the doc to make it easier to read.
> Additionally, make the binding require an interrupt to be specified.
> Whilst the driver does not need an interrupt, all of the SoCs that use
> this binding actually provide one.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  - Added minItems for interrupt-names and clock-names

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One minor nit: you have lost the check that there is only one interrupt
on e.g. R-Car H3, so "make dtbs_check" no longer complains if I add
a second interrupt to the wdt node in r8a77951.dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
