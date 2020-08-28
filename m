Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89001255CE8
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Aug 2020 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgH1Ope (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Aug 2020 10:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgH1Opc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Aug 2020 10:45:32 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3D0C06121B
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 07:45:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d2so856893lfj.1
        for <linux-watchdog@vger.kernel.org>; Fri, 28 Aug 2020 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vp97yrSpR+OTzyZcNc9C0oseKakFgiDLfmVqjpmNJf8=;
        b=zX1fH0mQLlsOsTkogRPuQVazxLuvENgLGP+kJnv3g7XwwBkQ9LwPr6KCqTPSyamL3z
         U+ae7wn4s7H9Vzjo3mh56JDMvY1fDhnXioztSrabgO8Z9W3tkgxjYtb0swHQNeqRQ6hq
         DPiTqMgLwChxwCwItaY/EVXAD4nMXqzMVU8urFXOlw3E2lHCRx1YPFJerTVC7FWVctIJ
         ZzHutDEnHuGvz2Cs/uV0b89yvMUSuHuGPt9EBQtCfjqb0bblSGtZba5BM1UkTVxYbBNY
         DkAlccyj3nqVIMBdNZmven7zz1wB3TouEjPDLPOoe9e1qnWbZ5HefJ5G3eH8alDRvByi
         rH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vp97yrSpR+OTzyZcNc9C0oseKakFgiDLfmVqjpmNJf8=;
        b=LVx0jPss8hOYeTgWjI7u2PeBaOcAGFlcPIx5BzXhyknp7/1zlaqIEsEOc+A1cQqCJj
         HZ1SYOdYvHMIubqLWgkjpeZpAuMfmnzsEH9FtBsFjOzNQp3mZ8/w0qbnCGTyzIdoOMos
         4rvEwaHgjV/ufqcDFsmFw7DMyO4rXm7D1NzmGKYwyzTIHRzGIMqQ7pObOl/rgzEWjZG8
         5OcscC2b6NoqeZHK9Ap21n0MoUpV0nUD88a7fwq5Nw43HHYt6sC64SFI9o+7f85QYF2M
         STSxaNeESB+tCTQ2Wf4Nv2pM54pxr+qJpqFwFXdnbTdN0Byps3A/CqrkKJSCT0HuI5vr
         G5sQ==
X-Gm-Message-State: AOAM5324DFwVAzfEChzUnTgAcO+d/GZ5kRaTDkVHutHnjNUz9bGXlmgp
        +7IR+wVCJ7pDv9FzDiZQMeHVU0Sq+rEQDtUsmaX2Sg==
X-Google-Smtp-Source: ABdhPJx+CL6vs2cc7cG2OqOnis0aSEP4pn2vlz9pcsjIjwaB64AYzwUnTUOBlVOHMmWmYhWcLF5+RGBhHe1v7dy2JVo=
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr977971lfq.89.1598625930235;
 Fri, 28 Aug 2020 07:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200828130602.42203-1-andre.przywara@arm.com> <20200828130602.42203-8-andre.przywara@arm.com>
In-Reply-To: <20200828130602.42203-8-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:45:19 +0200
Message-ID: <CACRpkdZ5er1MBiyYBNBG=7CfDyWv83GJtEURyBKbOHxSNP_GBA@mail.gmail.com>
Subject: Re: [PATCH 07/10] ARM: dts: arm: Fix SP805 clocks
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 28, 2020 at 3:06 PM Andre Przywara <andre.przywara@arm.com> wrote:

> The SP805 binding sets the name for the actual watchdog clock to
> "wdog_clk" (with an underscore).
>
> Change the name in the DTs for ARM Ltd. platforms to match that. The
> Linux and U-Boot driver use the *first* clock for this purpose anyway,
> so it does not break anything.
>
> For MPS2 we only specify one clock so far, but the binding requires
> two clocks to be named.
>
> In practice, Linux would pick a clock named "apb_pclk" for the bus
> clock, and the Linux and U-Boot SP805 driver would use the first clock
> to derive the actual watchdog counter frequency. So since currently both
> are the very same clock, we can just double the clock reference, and add
> the correct clock-names, to match the binding.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
