Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38424C2801
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Feb 2022 10:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiBXJZ3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Feb 2022 04:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbiBXJZ0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Feb 2022 04:25:26 -0500
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92720279912;
        Thu, 24 Feb 2022 01:24:57 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id l42so835841vkd.7;
        Thu, 24 Feb 2022 01:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N397e3DDR01i8v1XVO2BlHMODOBnikSYeJJWf5YLK/0=;
        b=57g3h9KyK0RL0DpDEHNA8/IPb37hlUyM7eo4YxWgs2DtcZwFLjYHpfTDrJ3sexgwjS
         QJjGzFgMJUF1rlvv79XvLJV1hz5bEjLC3pS0omOFl3trL9m3WjaP44iT8IZSMF5BX+6h
         0NcLbUlv4vgmLoYyOArX4Z9J02TouF8dUrDyWx9dhbYIBstUyR51tSUDGnyYEGfWBF2e
         lLxB4IRjw3jf2NtplYRKytt3Bu9mN9ortiSkMuy/VdgInmbDR5rl2c7M1er6RmXVbx+z
         IjV0q6pTgtKstfY49ris8SREOh/dziAQCOSqos74xUUxD/8bdnwsHkyxLByBCH5U7bo8
         q84g==
X-Gm-Message-State: AOAM5312GVNPKtnlUUWtBD/Dyne3K89ALxnsE+Q38MmV5daV9TpZm+uF
        aBYoLIg6GBW7OF66TQyNcJ2utFqAyQ+HgQ==
X-Google-Smtp-Source: ABdhPJxLc++ZFsFd7E2gmTiZeCuU60JwGPN6Xw2WayUEIpg4s1bi9Z7EdUNtF/wmLXAcMQSwUAkbsw==
X-Received: by 2002:a05:6122:511:b0:331:13b8:b2c5 with SMTP id x17-20020a056122051100b0033113b8b2c5mr674748vko.4.1645694696676;
        Thu, 24 Feb 2022 01:24:56 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id bk26sm322858vkb.3.2022.02.24.01.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 01:24:56 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id g20so1431398vsb.9;
        Thu, 24 Feb 2022 01:24:56 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr690005vsl.38.1645694696001; Thu, 24 Feb
 2022 01:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20220223160100.23543-1-biju.das.jz@bp.renesas.com> <20220223160100.23543-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220223160100.23543-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 10:24:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS6Djz3NtiYv-wLRKyEYhpHRzuCrZ7cSk7gdK7Uc1wWA@mail.gmail.com>
Message-ID: <CAMuHMdWS6Djz3NtiYv-wLRKyEYhpHRzuCrZ7cSk7gdK7Uc1wWA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] watchdog: rzg2l_wdt: Fix Runtime PM usage
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
> Both rzg2l_wdt_probe() and rzg2l_wdt_start() calls pm_runtime_get() which
> results in a usage counter imbalance. This patch fixes this issue by
> removing pm_runtime_get() call from probe.
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
