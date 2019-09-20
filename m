Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CF0B945A
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 17:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403915AbfITPqk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 11:46:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403863AbfITPqk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 11:46:40 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8834420C01;
        Fri, 20 Sep 2019 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568994399;
        bh=elxWGloSRv3ASYlcXrPm+ppmMo+Ut4/gn4DAjWMrH+8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gAbZ+xqVIQY8UQnvHM0Wu7zBURBnoAwiPyPdCm9WaslO4NcbBFZuF2xjNYj2nG392
         jOasp2MzprS7AjbUUvWe3KWNmQ9j/pnfDgxHUkQw9b2sOw4o7F9nEw4NJTR1q1TSoo
         X4628ZPdLt7Eyt2tiP4CgoYkdr/Uy+14WbDPPlZg=
Received: by mail-qt1-f182.google.com with SMTP id d2so9194887qtr.4;
        Fri, 20 Sep 2019 08:46:39 -0700 (PDT)
X-Gm-Message-State: APjAAAVjdNCXA8u9bZjAe7acCb8fy8uHc9bJup0ZP+adDvO6/JAzfFVq
        5QyoEV6BCqVHUN0mFopThgOyrseIRhKcYzwkcg==
X-Google-Smtp-Source: APXvYqyQfvOnMUg4A6YlCf+5Uk3UhRnNI+FRe9Ei+U0WKO2ZEjIzOjqbEv8VKaVNXUB4GZ5R7ScuCd9eCddpc1VduXA=
X-Received: by 2002:ac8:31b3:: with SMTP id h48mr4141137qte.300.1568994398652;
 Fri, 20 Sep 2019 08:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190907144541.16949-1-krzk@kernel.org> <20190912170145.GA17889@bogus>
 <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
In-Reply-To: <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 20 Sep 2019 10:46:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
Message-ID: <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
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

On Wed, Sep 18, 2019 at 6:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
> >
> > On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > using json-schema.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > >  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
> > >  2 files changed, 69 insertions(+), 35 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> >
> >
> > > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > new file mode 100644
> > > index 000000000000..39f1ca3bc4db
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Samsung SoC Watchdog Timer Controller
> > > +
> > > +maintainers:
> > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > +
> > > +description: |+
> > > +  The Samsung's Watchdog controller is used for resuming system operation
> > > +  after a preset amount of time during which the WDT reset event has not
> > > +  occurred.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - samsung,s3c2410-wdt                   # for S3C2410
> > > +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> > > +      - samsung,exynos5250-wdt                # for Exynos5250
> > > +      - samsung,exynos5420-wdt                # for Exynos5420
> > > +      - samsung,exynos7-wdt                   # for Exynos7
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  samsung,syscon-phandle:
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > > +    description:
> > > +      Phandle to the PMU system controller node (in case of Exynos5250
> > > +      and Exynos5420).
> > > +
> > > +  timeout-sec:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Watchdog timeout in seconds.
> >
> > We need a common schema for this and the node name.
>
> Common schema in dt-schema or in Linux kernel bindings? If the latter,
> I can add it.

In the kernel is fine.

Rob
