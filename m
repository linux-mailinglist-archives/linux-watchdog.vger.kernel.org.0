Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F88B9483
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 17:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404538AbfITPxJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 11:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404366AbfITPxJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 11:53:09 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ADD2217F5;
        Fri, 20 Sep 2019 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568994788;
        bh=DnNPO0Bm6cf5uP0Phh9xo03Tv4I8GA36vQzLn5XPS+I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=USdc3b5dBNuE2tUBlJkqzhPUlhx+/dM/Zbwp63jm5AFOzCNoyLU4toYw7EU44aUPD
         j/DBPb8k3c7hRPqL58jsL1petw96ggTbBIU9DhmlH4jZyk/lhzJ6KE6zMbl+6WP8uP
         N6FdYLB+Pk9jlEowuD9hPVvz/uksP7u1T18tQEHA=
Received: by mail-qt1-f170.google.com with SMTP id x4so9176467qtq.8;
        Fri, 20 Sep 2019 08:53:08 -0700 (PDT)
X-Gm-Message-State: APjAAAWtJ1HYal9dIN0vp4XzOEmRTBs3flVRwQwWxhlrksXBP5u+iqnB
        ySrNuXMCF3JTKyCEd/WFQADSva6u13luYoczqQ==
X-Google-Smtp-Source: APXvYqyyrPJlCj4Q7kj2a7cMioGzT2L9LdiXqMWsJXPs/ZezedDCcpdJP0b1VEdxKQTLWsRBFB1VjMgCUW/V9SvlNRQ=
X-Received: by 2002:ad4:5221:: with SMTP id r1mr7431473qvq.148.1568994787709;
 Fri, 20 Sep 2019 08:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190907144541.16949-1-krzk@kernel.org> <20190912170145.GA17889@bogus>
 <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com> <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 20 Sep 2019 10:52:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
Message-ID: <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 20, 2019 at 10:46 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 18, 2019 at 6:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> > > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > > using json-schema.
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > ---
> > > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > > >  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
> > > >  2 files changed, 69 insertions(+), 35 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > >
> > >
> > > > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > new file mode 100644
> > > > index 000000000000..39f1ca3bc4db
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > @@ -0,0 +1,69 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Samsung SoC Watchdog Timer Controller
> > > > +
> > > > +maintainers:
> > > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > > +
> > > > +description: |+
> > > > +  The Samsung's Watchdog controller is used for resuming system operation
> > > > +  after a preset amount of time during which the WDT reset event has not
> > > > +  occurred.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - samsung,s3c2410-wdt                   # for S3C2410
> > > > +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> > > > +      - samsung,exynos5250-wdt                # for Exynos5250
> > > > +      - samsung,exynos5420-wdt                # for Exynos5420
> > > > +      - samsung,exynos7-wdt                   # for Exynos7
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  samsung,syscon-phandle:
> > > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > > > +    description:
> > > > +      Phandle to the PMU system controller node (in case of Exynos5250
> > > > +      and Exynos5420).
> > > > +
> > > > +  timeout-sec:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description:
> > > > +      Watchdog timeout in seconds.
> > >
> > > We need a common schema for this and the node name.
> >
> > Common schema in dt-schema or in Linux kernel bindings? If the latter,
> > I can add it.
>
> In the kernel is fine.

Actually, Maxime has already done one.

Rob
