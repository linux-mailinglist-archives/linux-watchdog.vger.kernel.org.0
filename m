Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246A545A3DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Nov 2021 14:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhKWNi5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Nov 2021 08:38:57 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:44715 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhKWNi4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Nov 2021 08:38:56 -0500
Received: by mail-ua1-f48.google.com with SMTP id p2so43715181uad.11;
        Tue, 23 Nov 2021 05:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mr0GSj97QxFZ8jPFcARWGg380tKcBhVAP9tk0gY8U4c=;
        b=JOsmuNSUIN9gIB1TmTgZwi0sfv2D0gStAyxRmy3lGfFmVPUjtKfbRj5+x1aDiFoO8f
         kZ0HN63MAqBx1hopy1mSwf0zA5ZrozVF/pEXMjfd0EiIvOw5crRGqL/NFY8d/I86rSWD
         iT8kc3aHFMQ8SEjexazRodkWljKdMr8ni6UQULVFEDPAAfWMxNh3nFJxXLhpjaCr+XC/
         4GGnABYFjJv4L2elkpbrUdYpKYBCinfYrOqUEIHlydmVuEsAg5bLOKeS4FAmht1+DHtg
         jZmREWfCDsPFq6MBgJGj9gxihDszuY2mUasweRB3WFJFvnPqlqDXdeXyX/5NGV1pSfg+
         +hnQ==
X-Gm-Message-State: AOAM531992aNNIr7ORTIvyTz7fjIo0ur1oNNHciTtF8RuuDfS/0auLXJ
        Y0NWz8nIgScmLc4i5ilzH26aQiSHsOkxqA==
X-Google-Smtp-Source: ABdhPJyld9W/AWDLq0lginzXTHLxj9prGJc4iFOkDLl1Oipvkl6SF/WCTkc6NyuJNfPT74ovzu6yNw==
X-Received: by 2002:a67:c982:: with SMTP id y2mr8995235vsk.15.1637674548024;
        Tue, 23 Nov 2021 05:35:48 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id d16sm6064113vko.29.2021.11.23.05.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:35:47 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id l24so43868754uak.2;
        Tue, 23 Nov 2021 05:35:47 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr8913374uaq.114.1637674547289;
 Tue, 23 Nov 2021 05:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20211122113554.15990-1-biju.das.jz@bp.renesas.com> <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211122113554.15990-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 14:35:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWX7aC2ktiiHJP=3rEcK1VpLYYSbdGz8k=-1_E7LaxoUw@mail.gmail.com>
Message-ID: <CAMuHMdWX7aC2ktiiHJP=3rEcK1VpLYYSbdGz8k=-1_E7LaxoUw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: renesas,wdt: Add support
 for RZ/G2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 22, 2021 at 12:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Describe the WDT hardware in the RZ/G2L series.
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
