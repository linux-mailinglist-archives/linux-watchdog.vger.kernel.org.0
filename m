Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A08D2E07A7
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Dec 2020 10:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLVJCF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Dec 2020 04:02:05 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:32996 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVJCE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Dec 2020 04:02:04 -0500
Received: by mail-oi1-f173.google.com with SMTP id d203so14124673oia.0;
        Tue, 22 Dec 2020 01:01:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y9WlW2Avtag9Qm3VK0vnp3R6KYKb/1vJdl41RqUJ06k=;
        b=ebo1n1RZNV/xCJYbYE0cdSNnmS8ADUwO5XzIIUsmUrniM76PZsc6QEfogh1FZV5RdB
         wJprGsFLcRBfu7S0Los25zQbgL9sbfLQfgbcCVRyKeH0yg0tkjLh1j++bwWY9RBUyxfR
         jkkc2/Gf/bpsxaTVWDDgY2XeTyWTV4SpNLFpwX2zGvF3qpR9Rgn7wpdFeCjiQnKnugQE
         tuPsfJsF3g26KyXPK7SUnbVxtbW8ZinFqnS5GnUyaS/+svyKt3e2pyewRt0lbjb52Lm7
         Ne7Krq+Xt9AJWIWLUQiPc9HR9MBQeY88dQQHoitdK729qXCeWM1yWh6FpM0WTojRVHLS
         wQhQ==
X-Gm-Message-State: AOAM533WiYtA4X1UpV4W4RBw/4k0tVBGRRWzXJl9cIa62ZY++bvR+lL+
        r0e+YKKk043PhP5uI53WiQ2MY/VlIg3HRrdIPBD1aFiq
X-Google-Smtp-Source: ABdhPJwwWwtLC3UDR0Y3UYECvlOD7gmE/qGsn9MnVjTSUHVTCx9RFThqzVUiTKjM1K0oxBHbik8ojacyRuDoXZo2XX4=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr12386697oia.54.1608627684015;
 Tue, 22 Dec 2020 01:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com> <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201218173731.12839-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:01:13 +0100
Message-ID: <CAMuHMdUALPtX4bLteJps8eBa3+ne3Hwu4rP5ZKJuXs_xYDCvpA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: add r8a779a0
 (V3U) support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Dec 18, 2020 at 6:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
