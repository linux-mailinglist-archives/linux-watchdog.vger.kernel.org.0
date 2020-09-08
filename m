Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0022261723
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 19:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731849AbgIHR03 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 13:26:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731826AbgIHRZu (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 13:25:50 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAE0B21532;
        Tue,  8 Sep 2020 17:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599585950;
        bh=OkqeuIqrKR7bGs2ubOleM1hudzXsytRwrAN1s4XP4Ew=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0xHHYNITz4itRKxva3t4URtYS103wLewnyrgiygYiKvhKVI7JeZpkP/yX2GV4GX/2
         K4eQyyfFSccATam4yXejQzqCOWCX4Qw20q1/byuFbssHLnmIXN8zcZp/LGgZdCxAzc
         1U8AzrQ4EONXky+XP2je6zf3U6yBH8nplFaczOZs=
Received: by mail-oo1-f52.google.com with SMTP id z1so4124563ooj.3;
        Tue, 08 Sep 2020 10:25:49 -0700 (PDT)
X-Gm-Message-State: AOAM533c9Nco+s4z/pBgVg7SKB2T1vLRH4Stst9YKGZwU0/tmRRvi5ml
        hvR1/a/N1XoG8xTlv10GcmTTm+kzJYbJRAibVA==
X-Google-Smtp-Source: ABdhPJz3mC3Je19t37DdXhi+vmTjFLXH5RMTrow7KHwUv8p1SJN+XNllTeJU4l6nK8rRcXYxxrGxHfHxeWKrKZcLv8k=
X-Received: by 2002:a4a:9d48:: with SMTP id f8mr18836211ook.50.1599585949221;
 Tue, 08 Sep 2020 10:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <20200828130602.42203-2-andre.przywara@arm.com> <CAL_Jsq+jjzFR0ZdFO5dEp2w2D2uzSAB9tdih9tnuN987LABbiA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+jjzFR0ZdFO5dEp2w2D2uzSAB9tdih9tnuN987LABbiA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 8 Sep 2020 11:25:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJfY=DTKeuGmkwn-tcDG_SAbHJqASH2zKgwU-78qqwxOw@mail.gmail.com>
Message-ID: <CAL_JsqJfY=DTKeuGmkwn-tcDG_SAbHJqASH2zKgwU-78qqwxOw@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: watchdog: sp-805: Convert to Json-schema
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanho Min <chanho.min@lge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 8, 2020 at 11:20 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Aug 28, 2020 at 7:06 AM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > Convert the ARM SP-805 watchdog IP DT binding over to Json-schema.
> >
> > A straight-forward conversion, but the requirement for providing two
> > clocks got strengthened from "should" to "must".
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../bindings/watchdog/arm,sp805.txt           | 32 --------
> >  .../bindings/watchdog/arm,sp805.yaml          | 75 +++++++++++++++++++
> >  2 files changed, 75 insertions(+), 32 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> > deleted file mode 100644
> > index bee6f1f0e41b..000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -ARM AMBA Primecell SP805 Watchdog
> > -
> > -SP805 WDT is a ARM Primecell Peripheral and has a standard-id register that
> > -can be used to identify the peripheral type, vendor, and revision.
> > -This value can be used for driver matching.
> > -
> > -As SP805 WDT is a primecell IP, it follows the base bindings specified in
> > -'arm/primecell.txt'
> > -
> > -Required properties:
> > -- compatible:  Should be "arm,sp805" & "arm,primecell"
> > -- reg:         Should contain location and length for watchdog timer register
> > -- clocks:      Clocks driving the watchdog timer hardware. This list should be
> > -               2 clocks. With 2 clocks, the order is wdog_clk, apb_pclk
> > -               wdog_clk can be equal to or be a sub-multiple of the apb_pclk
> > -               frequency
> > -- clock-names: Shall be "wdog_clk" for first clock and "apb_pclk" for the
> > -               second one
> > -
> > -Optional properties:
> > -- interrupts:  Should specify WDT interrupt number
> > -- timeout-sec: Should specify default WDT timeout in seconds. If unset, the
> > -               default timeout is determined by the driver
> > -
> > -Example:
> > -       watchdog@66090000 {
> > -               compatible = "arm,sp805", "arm,primecell";
> > -               reg = <0x66090000 0x1000>;
> > -               interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> > -               clocks = <&wdt_clk>, <&apb_pclk>;
> > -               clock-names = "wdog_clk", "apb_pclk";
> > -       };
> > diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> > new file mode 100644
> > index 000000000000..980e155d3387
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM AMBA Primecell SP805 Watchdog
> > +
> > +maintainers:
> > +  - Viresh Kumar <vireshk@kernel.org>
> > +
> > +description: |+
> > +  The Arm SP805 IP implements a watchdog device, which triggers an interrupt
> > +  after a configurable time period. If that interrupt has not been serviced
> > +  when the next interrupt would be triggered, the reset signal is asserted.
> > +
> > +allOf:
> > +  - $ref: /schemas/arm/primecell.yaml#
>
> Should also ref watchdog.yaml here.

Actually, you should also drop primecell.yaml as that will get applied
already with the 'arm,primecell' compatible match.

Rob
