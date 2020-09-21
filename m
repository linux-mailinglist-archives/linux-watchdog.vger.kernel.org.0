Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D6A271E42
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Sep 2020 10:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIUIoL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Sep 2020 04:44:11 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:51040 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUIoL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Sep 2020 04:44:11 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 08L8hZVw015874; Mon, 21 Sep 2020 17:43:35 +0900
X-Iguazu-Qid: 2wHHQUhUGzlPXFlqCn
X-Iguazu-QSIG: v=2; s=0; t=1600677814; q=2wHHQUhUGzlPXFlqCn; m=uWsECvD7k5SclOllLgby+rfkOFk1s2Cy2s7kJLaK2Zs=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1112) id 08L8hWVd012577;
        Mon, 21 Sep 2020 17:43:32 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 08L8hV2t016932;
        Mon, 21 Sep 2020 17:43:31 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 08L8hVR7008130;
        Mon, 21 Sep 2020 17:43:31 +0900
Date:   Mon, 21 Sep 2020 17:43:30 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] watchdog: bindings: Add binding documentation for
 Toshiba Visconti watchdog device
X-TSB-HOP: ON
Message-ID: <20200921084330.6cqci4oit6fdzgis@toshiba.co.jp>
References: <20200920051807.288034-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200920051807.288034-2-nobuhiro1.iwamatsu@toshiba.co.jp>
 <878sd3lhcy.fsf@kokedama.swc.toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sd3lhcy.fsf@kokedama.swc.toshiba.co.jp>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Thanks for you review.

On Mon, Sep 21, 2020 at 04:27:25PM +0900, Punit Agrawal wrote:
> Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp> writes:
> 
> > Add documentation for the binding of Toshiba Visconti SoC's watchdog.
> >
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  .../watchdog/toshiba,visconti-wdt.yaml        | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> > new file mode 100644
> > index 000000000000..721e38fa5a0f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2020 Toshiba Electronic Devices & Storage Corporation
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Toshiba Visconti SoCs PIUWDT Watchdog timer
> > +
> > +maintainers:
> > +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - toshiba,visconti-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        wdt_clk: wdt-clk {
> > +            compatible = "fixed-clock";
> > +            clock-frequency = <150000000>;
> > +            #clock-cells = <0>;
> > +        };
> > +
> > +        watchdog@28330000 {
> > +            compatible = "toshiba,visconti-wdt";
> > +            reg = <0 0x28330000 0 0x1000>;
> > +            clocks = <&wdt_clk>;
> > +        };
> 
> I was going to suggest adding the "timeout-sec" property as described in
> watchdog.yaml but both code and usage seems to suggest it is optional.
> 

I see. I will add about timeout-sec property. 


> > +    };
> 
> So,
> 
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> 

Thanks!


> Thanks.
>

Best regards,
  Nobuhiro
