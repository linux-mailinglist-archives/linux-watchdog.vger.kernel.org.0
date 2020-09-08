Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA426170B
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Sep 2020 19:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgIHRV2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Sep 2020 13:21:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:56412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728643AbgIHRUw (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Sep 2020 13:20:52 -0400
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C697221924;
        Tue,  8 Sep 2020 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599585651;
        bh=qJw7qTW8sm4UzUgyNcs+J5DGwug32eonDnzevDjI8II=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PO5JNwXw5QbIuu/2RcDr0bbx7ZRzu2Y5qqEYxKk+cMJTbCZWGXrXryK1XiV7DO/h2
         yEMYiTExVead0rncQ7oGzITXa9RgcVq1Z0JbOVxzCJnJ3swB/L3W0vpZTp8TzB9RxE
         mLxcAmKAl3SfFk1rGVjQzGNsblf9wGM/uW0mjJv4=
Received: by mail-ot1-f45.google.com with SMTP id c10so15495951otm.13;
        Tue, 08 Sep 2020 10:20:51 -0700 (PDT)
X-Gm-Message-State: AOAM532/4o/0A5g0Z73XgdibTZm+WXuKTX2jtGL/CYvgJAJrkQwA8hlH
        uwVs8vYhkXso+sTbl/4c1367IVb3ugnvyqKKUA==
X-Google-Smtp-Source: ABdhPJyvfyNrPjsoWHvCG23p12ZjQDxYACacWE/DdrBGJM1e/5IFpmq/yWxgunlZEazC1D1a52yjOXSbSDklAC/HUH0=
X-Received: by 2002:a9d:411:: with SMTP id 17mr84031otc.192.1599585651032;
 Tue, 08 Sep 2020 10:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200828130602.42203-1-andre.przywara@arm.com> <20200828130602.42203-2-andre.przywara@arm.com>
In-Reply-To: <20200828130602.42203-2-andre.przywara@arm.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 8 Sep 2020 11:20:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jjzFR0ZdFO5dEp2w2D2uzSAB9tdih9tnuN987LABbiA@mail.gmail.com>
Message-ID: <CAL_Jsq+jjzFR0ZdFO5dEp2w2D2uzSAB9tdih9tnuN987LABbiA@mail.gmail.com>
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

On Fri, Aug 28, 2020 at 7:06 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> Convert the ARM SP-805 watchdog IP DT binding over to Json-schema.
>
> A straight-forward conversion, but the requirement for providing two
> clocks got strengthened from "should" to "must".
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/watchdog/arm,sp805.txt           | 32 --------
>  .../bindings/watchdog/arm,sp805.yaml          | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
>
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> deleted file mode 100644
> index bee6f1f0e41b..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -ARM AMBA Primecell SP805 Watchdog
> -
> -SP805 WDT is a ARM Primecell Peripheral and has a standard-id register that
> -can be used to identify the peripheral type, vendor, and revision.
> -This value can be used for driver matching.
> -
> -As SP805 WDT is a primecell IP, it follows the base bindings specified in
> -'arm/primecell.txt'
> -
> -Required properties:
> -- compatible:  Should be "arm,sp805" & "arm,primecell"
> -- reg:         Should contain location and length for watchdog timer register
> -- clocks:      Clocks driving the watchdog timer hardware. This list should be
> -               2 clocks. With 2 clocks, the order is wdog_clk, apb_pclk
> -               wdog_clk can be equal to or be a sub-multiple of the apb_pclk
> -               frequency
> -- clock-names: Shall be "wdog_clk" for first clock and "apb_pclk" for the
> -               second one
> -
> -Optional properties:
> -- interrupts:  Should specify WDT interrupt number
> -- timeout-sec: Should specify default WDT timeout in seconds. If unset, the
> -               default timeout is determined by the driver
> -
> -Example:
> -       watchdog@66090000 {
> -               compatible = "arm,sp805", "arm,primecell";
> -               reg = <0x66090000 0x1000>;
> -               interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> -               clocks = <&wdt_clk>, <&apb_pclk>;
> -               clock-names = "wdog_clk", "apb_pclk";
> -       };
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> new file mode 100644
> index 000000000000..980e155d3387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM AMBA Primecell SP805 Watchdog
> +
> +maintainers:
> +  - Viresh Kumar <vireshk@kernel.org>
> +
> +description: |+
> +  The Arm SP805 IP implements a watchdog device, which triggers an interrupt
> +  after a configurable time period. If that interrupt has not been serviced
> +  when the next interrupt would be triggered, the reset signal is asserted.
> +
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#

Should also ref watchdog.yaml here.

> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: arm,sp805
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,sp805
> +      - const: arm,primecell
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Clocks driving the watchdog timer hardware. The first clock is used
> +      for the actual watchdog counter. The second clock drives the register
> +      interface.
> +    minItems: 2
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: wdog_clk
> +      - const: apb_pclk
> +
> +  timeout-sec:
> +    description: |
> +      Should specify default WDT timeout in seconds. If unset, the default
> +      timeout is determined by the driver.
> +    $ref: /schemas/types.yaml#/definitions/uint32

You can drop this as it is part of watchdog.yaml.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Add:

unevaluatedProperties: false


> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    watchdog@66090000 {
> +        compatible = "arm,sp805", "arm,primecell";
> +        reg = <0x66090000 0x1000>;
> +        interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&wdt_clk>, <&apb_pclk>;
> +        clock-names = "wdog_clk", "apb_pclk";
> +    };
> --
> 2.17.1
>
