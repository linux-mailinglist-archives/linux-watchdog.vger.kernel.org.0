Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A6F455776
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 09:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244903AbhKRI7m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 03:59:42 -0500
Received: from mail-ua1-f41.google.com ([209.85.222.41]:44902 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244881AbhKRI62 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 03:58:28 -0500
Received: by mail-ua1-f41.google.com with SMTP id p2so11981138uad.11;
        Thu, 18 Nov 2021 00:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOmh4NAexkt9kWz5Qwf9Sj7DdfWS748BS2ZhFDkB+f4=;
        b=Dq/nSAnZGUnXtJh62c5AcqQM9j0PTPBkyd403J5OqlQckZwQR7HlAGTEtNOjC+HcLm
         5ZzAjinS1sw91yUn0mt+QehKMNHoV2bJD4Nn2ssJZsipLDZBsJMAx8W25nzTYfefn88I
         FRrwrkGDvzpWHf6JB2PKGGQp0+zU+ek3GY/iepbYzy/fND1hNCsdlCHPp5pO3tzQR/WG
         RgOIsbZKvyU7E4YLY3ZTBwqw+7vr2kaDNTjOYfnnRz+JLaBkEMkqPUCdsQb0GvUO2PvY
         uxbs9xiGJM/0MGWGmJLpAeiBNhCTCinXo/BP+Vamzg8HTnayPAkaUKUCFvYhq1+LhBcM
         yJYg==
X-Gm-Message-State: AOAM531KfG+faSQwWSKgyFMp+zbXQiyktlWDzG5MUIXrzWJhMrW6sH5l
        q2kGfwUE1pPMw4nxBjZCbpEpUStQmWkHPw==
X-Google-Smtp-Source: ABdhPJwogE6Xv/0Ea8CccYwVe3NMBZ7ECCCduqaObZ2HvXG+Chn1XDS1QZ3QWYC/fM4uFOpNMd2/bQ==
X-Received: by 2002:ab0:2a10:: with SMTP id o16mr34054532uar.36.1637225728022;
        Thu, 18 Nov 2021 00:55:28 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id c11sm1253778vsh.22.2021.11.18.00.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 00:55:27 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id b17so12176745uas.0;
        Thu, 18 Nov 2021 00:55:27 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr78809125vsj.50.1637225727483;
 Thu, 18 Nov 2021 00:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com> <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 09:55:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com>
Message-ID: <CAMuHMdUmCCc3UCQe=b_GrFOkZW_tiL1bpsqiTcQRW5TU2GkDNA@mail.gmail.com>
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

On Wed, Nov 17, 2021 at 9:21 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On the, next version I am planning to introduce the below code for
> Reset selection based on device availability, instead of selecting
> all the channels. Is it the right way to do ? please let me know.
>
> node = of_find_node_by_name (NULL, NULL, "watchdog@12800800");
> if (node && of_device_is_available(node) {
>         // set reset selection for that channel
>         of_node_put(node);
> }
>
> node = of_find_node_by_name (NULL, NULL, "watchdog@12800c00");
> if (node && of_device_is_available(node) {
>         // set reset selection for that channel
>         of_node_put(node);
> }
>
> node = of_find_node_by_name (NULL, NULL, "watchdog@12800400");
> if (node && of_device_is_available(node) {
>         // set reset selection for that channel
>         of_node_put(node);
> }

Matching on node names is very fragile.  And what if the watchdog
node is enabled in DT, but the watchdog driver is not available?
Moreover, this looks like it should not be controlled from the clock
driver, but from the watchdog driver instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
