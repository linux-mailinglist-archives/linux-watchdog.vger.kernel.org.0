Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64106B94C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 18:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbfITQAu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 12:00:50 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55329 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfITQAu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 12:00:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id a6so3065090wma.5;
        Fri, 20 Sep 2019 09:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zm58YNY6Dy+Y0x1r7jLVH4bkhWKD3Gwt53hXtKO8kq8=;
        b=PA5SoWs5YJ+mR1VNHbFtFU5u1HRpQcwttSgksag3UkYq/nWLYBtPTGIr4ii4OUrF0K
         JSrTZo7JEJ1HQ9tyNk2rBgAB2hpJvLPH9KFKWGKRElT2xVO3TM1oTp37CisknRvQ4qZ2
         CouMnFj8dC7Cj+O4s3Vaid0yR8vBw9tJjWZzt4giywTL5plWfjrVgudITYX7cokpq907
         3aufnatdsqrHdj2x+Zt8eo4+3W4uDYgdc7TBTOJd3xZO1/bPywCOLltHTdh7TuL9vKge
         s1LfFdjMzzTQxXTbopwl50bDYbr4LbQEz1Uf+t5kgjNWW0tlosSt68Zf2+z4d93a/2H+
         dtcA==
X-Gm-Message-State: APjAAAWGO2MY3x2GkzfIMSNJrHSm0u4rtxrxMsXZuYbwKTYkT4Gnxnia
        HErktLDuD1xMulTwT37oecM=
X-Google-Smtp-Source: APXvYqw5RsD4Q4Q/FLEEgM3Of3VABy7B6J+NrKyPTgMB+TInjENdG+0BV+2fXjhurlW8C7a/bE4Ueg==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr2801780wmb.35.1568995246746;
        Fri, 20 Sep 2019 09:00:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id g11sm2832677wmh.45.2019.09.20.09.00.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 09:00:45 -0700 (PDT)
Date:   Fri, 20 Sep 2019 18:00:43 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
Message-ID: <20190920160043.GA3928@kozik-lap>
References: <20190907144541.16949-1-krzk@kernel.org>
 <20190912170145.GA17889@bogus>
 <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
 <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 20, 2019 at 10:46:27AM -0500, Rob Herring wrote:
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

I'll add it in next version then.

Best regards,
Krzysztof

