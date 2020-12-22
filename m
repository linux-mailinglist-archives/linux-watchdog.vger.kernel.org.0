Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9532E0729
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Dec 2020 09:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLVI1S (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Dec 2020 03:27:18 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35259 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVI1S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Dec 2020 03:27:18 -0500
Received: by mail-ot1-f54.google.com with SMTP id i6so11290281otr.2;
        Tue, 22 Dec 2020 00:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KHNVKftY48PjyeGHYfK+vLHEafMZdXMutCS+6rlBWJk=;
        b=rBr4Ns6n7htrXbf3hNQhyL6/gaIAiOTDXhsv1Yxkuy+Q1gzn/qhvAExpmlUjeMTB/1
         QmeYOFeQ7WLI6v+5Fj74PrC2yS7JlwsJEMHUhhuz9qj3GSYefpqBd1qFSHIodAQa5XFd
         e7+HlJbWSIRFmmgP6+m6A7I1hlmYmuyHg54Em7bs5Ow2ahcaTjRB5jOD8zKqdQs5+qFP
         FqMd8xOF/xYCT/U4uBwyom8LcTVH2dDx6o/nLxJFTOyd/fClZ4YDG45Q1dChPQJ+UW9a
         OOH9i+9LgJ/Jg5lkHwlid1wdbww0JyDWxyS0mzLve5ar6LT7HmMDFLi2Gan/JFcJw5Ps
         vZ6Q==
X-Gm-Message-State: AOAM530y6qCwK/DqaNEDp3t2ATiynffV4h3rFp0PxFJdXFC1VGSWyWr8
        wnOR+hYMJTZ6Mw0+qS7nuONEHZaefpNLXfZlSx+mb+Mf
X-Google-Smtp-Source: ABdhPJxzAJBHivxcUGyQbpokh/3pVGnEnrFqsE+3rgGYlRzK8MAW5zYyTV70+oczD506KLlhURNhIiAsUtmfnkzY0Do=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr400113otr.107.1608625597379;
 Tue, 22 Dec 2020 00:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201219173415.21848-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:26:26 +0100
Message-ID: <CAMuHMdUQFDCQaCFpa4xgnBvP0QmNfEabDn_J5rfyxPKi1GE3GQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: renesas_wdt: don't sleep in atomic context
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Dec 19, 2020 at 6:36 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> In the restart handler, we hit multiple OOPSes. One because of
> usleep_range() and one because of RPM. So, instead of re-using
> rwdt_start(), we implement an atomic version of it in the restart
> handler. As a little bonus, reboot will occur sooner because we can now
> use the smallest divider in the custom restart routine.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
