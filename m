Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CC250E0E9
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Apr 2022 14:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiDYNCP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Apr 2022 09:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbiDYNCI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Apr 2022 09:02:08 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA4B13E0F;
        Mon, 25 Apr 2022 05:59:04 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 1so748185qvs.8;
        Mon, 25 Apr 2022 05:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JB++HHixpMbVXdyIxnEMYdSRqEP4yJ8nG/W+yr9eIiY=;
        b=u9E2baQcMVEjdTVZ1kLHPWba84PVeTx9FvodqNjYMj4VwX6PsWxsAQChy6dqk6lcie
         TMGOkNUNxvUO1eUBsarBvQXc5AFr6JpQDQNNBfAI3xZPNtLH/G622KR9zhSEgAnGKngN
         Y5BJjAx/wIQDWg6laJQFeEm8Lid63C5KHDInZgNXCig8FEipLoRcYE0c4NumfKapkFdc
         jwLP1w3aWqgT37I3WOW181OwU4+w04s//x6jnKRI+lpyhSKnCCBGddgPTTxW5vfNUBMY
         9WTg3pCzbrUCta77c14GbVeFsT4sqUDQ8CS4TeuzoQty9AP918a5Kqcr5ilmo8Klsqil
         Lqqw==
X-Gm-Message-State: AOAM5311/ju5af8jzAQt/KFpU5+dhyWqVH3dfmNmtNLA0JMgK539I64t
        +vHeTudEM9HX0IEIwayCbqw9wniMd3dwoA==
X-Google-Smtp-Source: ABdhPJx5sFxqWvmufJCQ2/de1sDu7XifrAhEr9WVr3XD9cvRaHTegbDXGlgtvKvMPkC/UMKDDOz02w==
X-Received: by 2002:ad4:5bc1:0:b0:42c:37be:6ac3 with SMTP id t1-20020ad45bc1000000b0042c37be6ac3mr12407384qvt.18.1650891543865;
        Mon, 25 Apr 2022 05:59:03 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id cr24-20020a05622a429800b002ed12cea2cdsm5712876qtb.96.2022.04.25.05.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 05:59:03 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ef5380669cso146954277b3.9;
        Mon, 25 Apr 2022 05:59:03 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr15462018ywa.479.1650891543057; Mon, 25
 Apr 2022 05:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 14:58:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCHubUkubji=_-uXhpHSmfcf3SrhBTjjCuU_Lr5_9E5g@mail.gmail.com>
Message-ID: <CAMuHMdVCHubUkubji=_-uXhpHSmfcf3SrhBTjjCuU_Lr5_9E5g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G2UL SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Apr 24, 2022 at 9:13 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document RZ/G2UL WDT bindings. RZ/G2UL WDT is similar to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-wdt" will be used as a fallback.
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
