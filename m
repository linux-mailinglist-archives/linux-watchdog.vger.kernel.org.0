Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05FD4729BB
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Dec 2021 11:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242763AbhLMKYN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Dec 2021 05:24:13 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:36601 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245064AbhLMKVq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Dec 2021 05:21:46 -0500
Received: by mail-vk1-f172.google.com with SMTP id b192so10058125vkf.3;
        Mon, 13 Dec 2021 02:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VWiyJhQSLDtfV5u6dnGa8mJ9e45sI54iCH3u9ONS/1Q=;
        b=WWkfQSlbmnxy/bBWi3e0BCp1Xmde/24Er0TM/iORFXZeFFFSaap+V6lN0MWqp3s3xU
         FeJHp7s2aGNmrGr4pSwhEj7AAxmtVC7umJiF6qEhkFbMQ1wLBhtCy6inPw69yyfNdqOn
         GNElZHwV7X0eTOpY7DjtmTz8CUL2t241UGARJOzjQrBAlxMM5M5K179U4TxWnK9c2KAF
         AeaBy2RG9olfBOlUPWo5MjbUO8+P6Nmmw+pqdWGbEqdpWUlrl85qf2VmMN1nbyRMGHK3
         4OWw+VssUexs2HL+DjemwfVpnCazm7037KallEkowuMe4qaKug4RN28w97EJN7YtF9JK
         cNiQ==
X-Gm-Message-State: AOAM530eR85tgMnntznwEZMozliqoLqv0OYlvKX/+WCb0JEiv8Ypxpcu
        Nvc53SEs4WQ5HvElGqZ8oIsFI4zqbYnNlA==
X-Google-Smtp-Source: ABdhPJw1+q9EC6p2AQdcNoZdTEO9aThA2NMwwBHZmBP9ytIsRJT1cf7V7utuLzqKbZCWG0b93RxqVg==
X-Received: by 2002:a1f:a556:: with SMTP id o83mr30299514vke.9.1639390904533;
        Mon, 13 Dec 2021 02:21:44 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id g28sm3811333vkl.16.2021.12.13.02.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 02:21:44 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 70so10043118vkx.7;
        Mon, 13 Dec 2021 02:21:43 -0800 (PST)
X-Received: by 2002:a05:6122:920:: with SMTP id j32mr31530370vka.20.1639390903821;
 Mon, 13 Dec 2021 02:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Dec 2021 11:21:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ=HjRbdfWdwuLAZogg2zeuNZbAePdnrKOTEBKQgr-=w@mail.gmail.com>
Message-ID: <CAMuHMdWJ=HjRbdfWdwuLAZogg2zeuNZbAePdnrKOTEBKQgr-=w@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: rzg2l_wdt: Fix 32bit overflow issue
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Dec 11, 2021 at 10:26 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The value of timer_cycle_us can be 0 due to 32bit overflow.
> For eg:- If we assign the counter value "0xfff" for computing
> maxval.
>
> This patch fixes this issue by appending ULL to 1024, so that
> it is promoted to 64bit.
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
