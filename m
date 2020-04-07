Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A901D1A12EF
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Apr 2020 19:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgDGRry (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Apr 2020 13:47:54 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:54036 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGRrx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Apr 2020 13:47:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id C9BCE803078C;
        Tue,  7 Apr 2020 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ym6rrVGUgDYk; Tue,  7 Apr 2020 20:47:44 +0300 (MSK)
Date:   Tue, 7 Apr 2020 20:48:06 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: watchdog: dw-wdt: Replace legacy
 bindings file with YAML-based one
Message-ID: <20200407174805.cbpufcyimt5daycp@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132803.770DC8030792@mail.baikalelectronics.ru>
 <20200306151839.374AA80307C2@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200306151839.374AA80307C2@mail.baikalelectronics.ru>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Fri, Mar 06, 2020 at 07:18:35AM -0800, Guenter Roeck wrote:
> On 3/6/20 5:27 AM, Sergey.Semin@baikalelectronics.ru wrote:
> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > Modern device tree bindings are supposed to be created as YAML-files
> > in accordane with dt-schema. This commit replaces the DW Watchdog
> > legacy bare text bindings with YAML file. As before the the bindings
> > states that the corresponding dts node is supposed to have a registers
> > range reference, at least one clocks phandle reference, optional reset
> > lines. Seeing all the platforms with DW Watchdog provide the watchdog
> > interrupt property and since in further commit we'll alter the driver
> > to use it for pre-timeout functionality implementation, lets declare
> > the IRQ property to be required.
> > 
> 
> First, this is not just a replacement - it changes semantics.
> 
> Second, I disagree with making interrupts mandatory. They are only needed
> for pretimeout functionality, and not everyone may want to enable that.
> I don't see the point of forcing everyone to enable and provide functionality
> that is neither wanted or needed for a given use case. Yes, the interrupt
> is provided by all users today, but we may have one coming up tomorrow
> where the interrupt line is not even wired up. What then ?

Ok. I'll leave the interrupts optional, though I would have to implement
it in the driver as well. Is this all semantic changes you were referring to?

There is one more change, which you may have also considered as semantic
update. It's async clocks support - "pclk" clock. Would you like me to
unpin this alteration into an additional patch? Rob?

I'll also provide the next fixes in v2:
- single license with GPL-2.0-only,
- remove copyrights (it's not right to add our copyrights here),
- replace "additionalProperties: false" with "unevaluatedProperties: false"
- Remove "assigned-clocks" and "assigned-clock-rates" properties

Regards,
-Sergey

> 
> Guenter
> 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> > ---
> >  .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 -------
> >  .../bindings/watchdog/snps,dw-wdt.yaml        | 66 +++++++++++++++++++
> >  2 files changed, 66 insertions(+), 24 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> > deleted file mode 100644
> > index eb0914420c7c..000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -Synopsys Designware Watchdog Timer
> > -
> > -Required Properties:
> > -
> > -- compatible	: Should contain "snps,dw-wdt"
> > -- reg		: Base address and size of the watchdog timer registers.
> > -- clocks	: phandle + clock-specifier for the clock that drives the
> > -		watchdog timer.
> > -
> > -Optional Properties:
> > -
> > -- interrupts	: The interrupt used for the watchdog timeout warning.
> > -- resets	: phandle pointing to the system reset controller with
> > -		line index for the watchdog.
> > -
> > -Example:
> > -
> > -	watchdog0: wd@ffd02000 {
> > -		compatible = "snps,dw-wdt";
> > -		reg = <0xffd02000 0x1000>;
> > -		interrupts = <0 171 4>;
> > -		clocks = <&per_base_clk>;
> > -		resets = <&rst WDT0_RESET>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > new file mode 100644
> > index 000000000000..8b30f9601c38
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Copyright (C) 2019 BAIKAL ELECTRONICS, JSC
> > +#
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys Designware Watchdog Timer
> > +
> > +allOf:
> > +  - $ref: "watchdog.yaml#"
> > +
> > +maintainers:
> > +  - Jamie Iles <jamie@jamieiles.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: snps,dw-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: DW Watchdog pre-timeout interrupts.
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: Watchdog timer reference clock.
> > +      - description: APB3 interface clock.
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: tclk
> > +      - const: pclk
> > +
> > +  assigned-clocks: true
> > +
> > +  assigned-clock-rates: true
> > +
> > +  resets:
> > +    description: Phandle to the DW Watchdog reset lane.
> > +    maxItems: 1
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +examples:
> > +  - |
> > +    watchdog0: watchdog@ffd02000 {
> > +      compatible = "snps,dw-wdt";
> > +      reg = <0xffd02000 0x1000>;
> > +      interrupts = <0 171 4>;
> > +      clocks = <&per_base_clk>;
> > +      resets = <&wdt_rst>;
> > +    };
> > +...
> > 
> 
