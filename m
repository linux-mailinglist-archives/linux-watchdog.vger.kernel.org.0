Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A786E38B261
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 May 2021 17:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhETPDI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 11:03:08 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:46986 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhETPDH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 11:03:07 -0400
Received: by mail-vs1-f54.google.com with SMTP id q6so4490171vsp.13;
        Thu, 20 May 2021 08:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90v/0p7/QeqsVm7sdtO9eTLLi/cOP7TH9xelXYgqHPI=;
        b=PvnB74FX7Mg98K15lWC+ZZSU7wQfl4K6OUkGDLo9mAdrN1RKWiic5g0+sTixNpdB0g
         YmsXn9qwoFqA4HO7U44BtnReNrL2SDhMsUUy2gdXQmVUWcPj/bVbDVZveeDnXkLApdWs
         pVFZxug136WOXfuQ3jowzEZoqx6YX3XQj2osuvM78YOeqNItpO80MjdbsiEavcPg4Jb4
         X36F84KKzLm1u/GrjCg/VELKlMpnNQ56/JjS665Ias5PIBGcuFaBcKC1t0OGPdjw0Y1N
         bm+BIGex5liF1eIo94d+TImihEw1hiostEBgt5wUA1VufhED02FOyEiqoWOaEEZJY6SU
         7gAw==
X-Gm-Message-State: AOAM531X3e4R7u6l1wNaZ2I8040HmLkLz0qgpA7EK6K/luqYGUYjPFJ7
        LhHi5m9bbb00eLHfQozkqT6L3C7M2Wo/K4VJGlM=
X-Google-Smtp-Source: ABdhPJzjHxh5zy1BiXpMwHIh1Fk3akLbzGJK4h7jyM1wblAEyFSKkG+uSCDAZFFQ7yOQSCFfSFTKHvcynXaK4GxQXNQ=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr4592452vsq.40.1621522904921;
 Thu, 20 May 2021 08:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <3ccc0cf5319f56e230ee3b8a009f8d63afb114c1.1621521847.git.geert+renesas@glider.be>
In-Reply-To: <3ccc0cf5319f56e230ee3b8a009f8d63afb114c1.1621521847.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 May 2021 17:01:33 +0200
Message-ID: <CAMuHMdUwOMZy_vFH8QwCxuhy7UCvOX8sw_87CLLueiJdfbkuFw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: arm,twd: Convert to json-schema
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 20, 2021 at 4:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Convert the ARM Timer-Watchdog Device Tree binding documentation to
> json-schema.  As the old binding document actually contained two
> bindings, it is split in two document: one for the timer part, and one
> for the watchdog part.
>
> Document missing properties.
> Update examples to match reality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Marc as the maintainer, as he wrote the original bindings.
> Marc: Please scream if this is inappropriate ;-)
> ---
>  .../bindings/timer/arm,twd-timer.yaml         | 56 +++++++++++++++++++
>  .../devicetree/bindings/timer/arm,twd.txt     | 53 ------------------
>  .../bindings/watchdog/arm,twd-wdt.yaml        | 50 +++++++++++++++++

Bummer, forgot to update a reference.  Feel free to apply this fix

--- a/Documentation/devicetree/bindings/arm/ux500/boards.txt
+++ b/Documentation/devicetree/bindings/arm/ux500/boards.txt
@@ -26,7 +26,7 @@ interrupt-controller:
        see binding for interrupt-controller/arm,gic.txt

 timer:
-       see binding for timer/arm,twd.txt
+       see binding for timer/arm,twd-timer.yaml

 clocks:
        see binding for clocks/ux500.txt

or wait for v2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
