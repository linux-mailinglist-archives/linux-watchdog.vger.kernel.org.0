Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383D81BB574
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 06:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1Ete (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 00:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgD1Ete (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 00:49:34 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDFBC03C1A9
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Apr 2020 21:49:33 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so7853840plk.10
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Apr 2020 21:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MzIVWZpSVCHDb5pf6WQNcJ/ckZ7Y5e/ESVb+fFzIZA=;
        b=WD0Vdo9P4/N4GSEpKAhopNTQVyTrPiPKK3hWvrtsiHMzebOMrruO2aJX9wZe95BGHj
         XGk8c62wFBqDPwNbo61yYZGaWDExozBcGqaTvzvhgue/6PH25ZdF3jIcE9D0iv7XULGu
         hc0qeug7S/R/21XHC27bLSFzxUVEnjHArDV38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MzIVWZpSVCHDb5pf6WQNcJ/ckZ7Y5e/ESVb+fFzIZA=;
        b=mtE2BfDSfLygiAvK5aUqQsdsCk5CQMeh0nxxS4JR6VDQzylkcZHqXLv+/OOCzGYjHx
         3wo09fzGAyvuJ5ZUmnx1k2Om4H1CqD4j0RsokcXYn3cYTvN1OBV8YQ9oSUDhT6SfrKAJ
         lvIKytxz9n8GDbJRxHqCwJ19QircbK7Mr+PCkJL+jS9KsXBLDBUCgu50lpPTBO9Y+pfq
         KsvnPrOXOwXmWrLMD7ciyyaXEzod7hB4a1PG5HXqBt55t1DeX/ruybPRYp/Z2kK2fQT8
         +xZx9pSKA79OfvF8qdfweNpXiCBTqm2jwkRo80XxRv6mDUvYaWlFjAPTJt0xly6IRm4Q
         wdQw==
X-Gm-Message-State: AGi0Pua9y3eY5zceZ9ZZ0VfpgviRxTQsb0pLZpnrMwuDPgS3Z3uey/8u
        3z2hk1T6x+NHkGi1a5Qex0EVGTqVpxo=
X-Google-Smtp-Source: APiQypK1Bd0IbK88YRWj/CkXjQeGMpUHqa+xmVF0n0ZxVT/Wpf8itw5l+GYRdf7YXWwy4B7yU+KOAQ==
X-Received: by 2002:a17:90a:25ea:: with SMTP id k97mr2778584pje.122.1588049373206;
        Mon, 27 Apr 2020 21:49:33 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id c59sm867859pje.10.2020.04.27.21.49.32
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 21:49:33 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id e6so586249pjt.4
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Apr 2020 21:49:32 -0700 (PDT)
X-Received: by 2002:a67:f9d0:: with SMTP id c16mr19912596vsq.53.1588048997072;
 Mon, 27 Apr 2020 21:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org>
 <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid> <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
In-Reply-To: <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Tue, 28 Apr 2020 14:42:50 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
Message-ID: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Julius Werner <jwerner@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Apr 24, 2020 at 8:17 AM Julius Werner <jwerner@chromium.org> wrote:
>
> > +       err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
> > +                                  &smc_func_id);
> > +       if (err < 0)
> > +               return err;
> > +       watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);
>
> Your device tree binding says there's a default and this is optional.
> I think you need to change the code so that that's actually true.

I think I have misunderstood the device tree json-schema spec.
My intention was for the device tree to fill in a default value in the dtb for
arm,smc-id if it was omitted in the dts. But now I see that does not seem to
happen, I cannot really find any documentation of `default`, so I will just put
a documentation string in instead and force the default in the driver.
