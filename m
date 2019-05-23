Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1327BBB
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 13:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730519AbfEWL0U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 07:26:20 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:35223 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbfEWL0U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 07:26:20 -0400
Received: by mail-vk1-f195.google.com with SMTP id k1so1275313vkb.2;
        Thu, 23 May 2019 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9M1Q/18bMOxXAFcUWm9FFtZY2S5AMqHXp/QrrMgUcKU=;
        b=ImLy1icdjwE4xL016rCAxUwXAF2zyKmYysWInYd+m6GtKX0dJZaPkslubYCtuWaZoc
         MEmsIAt116O3vee4A5bhUYyNzF2ofGjmEm+aJAzyqao1WyEhhEkqopE4Mkw1F9P976Hp
         KZooUEWTkTOPex0Q48WW6kJZ1Q0ts/AzVclCp6uFXTwpgMzBIYMQucMr9CzDdY9tQNey
         askItGzxRe7zRxFqZCyC9YrEEVTrnP9OI580B5BHBxraNr64JH7oSIRQ1Pu3x8gnZj9p
         zs6yiTOU6An8DzeM/4H9QK4C3XQvqMRR9aoxeAlRh/k6pM3FxCpfUW2zqx9R4zbWCKwH
         kknw==
X-Gm-Message-State: APjAAAXT56X/+k1NnweBO2Q3akDnCCJ4SnMDMgMym+53K4JFAdCDriJa
        c1jqKbHhSJq7c8hYMclwaaFVaxooUdV04Kzz+5w=
X-Google-Smtp-Source: APXvYqyNDKWfLtKYBG3qX16musbNBl1CNetH5JO5LOVb5jxSLa0nL5ANb2p1QHKOkgim8WcmdOTBAFKgSMCuVEr143o=
X-Received: by 2002:a1f:62c7:: with SMTP id w190mr1308273vkb.72.1558610779191;
 Thu, 23 May 2019 04:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp> <20190523110451.GA3979@kunai>
In-Reply-To: <20190523110451.GA3979@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 May 2019 13:26:07 +0200
Message-ID: <CAMuHMdVMzMUM08aRWH=Sx+hmO7Woiqz-QmZ-Rrzk2wtExw=XsA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: Fix interrupt enable for timer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Nguyen An Hoan <na-hoan@jinso.co.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On Thu, May 23, 2019 at 1:04 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, May 23, 2019 at 06:29:37PM +0900, Nguyen An Hoan wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >
> > Fix setting for bit WOVFE of RWTCSRA. Keep it enable follow hardware document.

> >       rwdt_write(priv, 0, RWTCSRB);
> >
> >       while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
> >               cpu_relax();
> > -
> > -     rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> > +     /* Enable interrupt and timer */
> > +     rwdt_write(priv, val | RWTCSRA_WOVFE | RWTCSRA_TME, RWTCSRA);
>
> What is the use of enabling an interrupt without having an interrupt
> handler?

Exactly.

> (And I never understood why there is an interrupt for an
> overflowing watchdog. We won't have time to serve it, or am I
> overlooking something obvious?)

I guess it (the hardware, not the Linux watchdog driver) might be used
as a generic timer? Or the interrupt may signal the RT core that the
application cores have been restarted?

But in the context of (the current) Linux watchdog driver, this doesn't
make much sense.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
