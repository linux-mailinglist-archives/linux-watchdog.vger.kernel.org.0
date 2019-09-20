Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68953B950C
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Sep 2019 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393150AbfITQP1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Sep 2019 12:15:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39509 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387398AbfITQP1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Sep 2019 12:15:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id r3so7344457wrj.6;
        Fri, 20 Sep 2019 09:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mZnFO9Ewh2eNA3kI4bmGo64jHJtIOUeAunxMfA3rJR0=;
        b=DCPL56qummiSkGb2pFXl4RuXOW8tRZ/HZQATdC6kmaExQn878P9ehhGzPRrNLGRHia
         Ta0XiDT5HaUaTZcKzrpMLfeOD3kkhhdKhuePtRpSGx/pHKnhXoyQNnc9gZidt3gncLjC
         xSocYARlUJh+lD2bIbVVvfxCnrdrmyRpAB5I8gyUgHnPYRO6mOHHy6ukmpCU6U1x9c8Z
         voBqvN+Nur4+fSJe1A0WhCQoLkf7oqRjRbTiH2ESRQitfr/ve8ammTsLZ28mgtnFnJo+
         3R9YiiKBDu8r0RwotkE0DiGXGn7UQAaLeR7ytSW/RqqErfNrsEK/1K2njtbHxzPbxYd+
         zd5A==
X-Gm-Message-State: APjAAAX30OUnVnPhEzkd+xQW70JM3B8io5szzAIvd4FfE0ZnafAm+Gma
        byJXS4arrD0q7XrB+IcSYL3MPb6U
X-Google-Smtp-Source: APXvYqwub7RCds9mJxkWGp0upNTTjKyrnJAsYwMTzC3Lz+vJzLAKvve0lx0GcT4jcO2IZKwg04pt9g==
X-Received: by 2002:adf:b648:: with SMTP id i8mr181221wre.372.1568996124939;
        Fri, 20 Sep 2019 09:15:24 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id h125sm3279449wmf.31.2019.09.20.09.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 09:15:24 -0700 (PDT)
Date:   Fri, 20 Sep 2019 18:15:21 +0200
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
Message-ID: <20190920161521.GA6004@kozik-lap>
References: <20190907144541.16949-1-krzk@kernel.org>
 <20190912170145.GA17889@bogus>
 <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
 <CAL_JsqLtQ4yYJJiUcBrje+6SKiaXTmF-Cej_=ykeWKO+9ytM4Q@mail.gmail.com>
 <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJcE4+3gxoBAeKH1w=4+QFEaR9axqgBqLb=eW8jJqT1YQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 20, 2019 at 10:52:56AM -0500, Rob Herring wrote:
> On Fri, Sep 20, 2019 at 10:46 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 18, 2019 at 6:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> > > > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > > > using json-schema.
> > > > >
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > ---
> > > > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > > > >  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
> > > > >  2 files changed, 69 insertions(+), 35 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > >
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..39f1ca3bc4db
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > > > > @@ -0,0 +1,69 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Samsung SoC Watchdog Timer Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > > > > +
> > > > > +description: |+
> > > > > +  The Samsung's Watchdog controller is used for resuming system operation
> > > > > +  after a preset amount of time during which the WDT reset event has not
> > > > > +  occurred.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - samsung,s3c2410-wdt                   # for S3C2410
> > > > > +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> > > > > +      - samsung,exynos5250-wdt                # for Exynos5250
> > > > > +      - samsung,exynos5420-wdt                # for Exynos5420
> > > > > +      - samsung,exynos7-wdt                   # for Exynos7
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  samsung,syscon-phandle:
> > > > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > > > > +    description:
> > > > > +      Phandle to the PMU system controller node (in case of Exynos5250
> > > > > +      and Exynos5420).
> > > > > +
> > > > > +  timeout-sec:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description:
> > > > > +      Watchdog timeout in seconds.
> > > >
> > > > We need a common schema for this and the node name.
> > >
> > > Common schema in dt-schema or in Linux kernel bindings? If the latter,
> > > I can add it.
> >
> > In the kernel is fine.
> 
> Actually, Maxime has already done one.

I see. I'll use them then.


Best regards,
Krzysztof

