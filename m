Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A5EB6239
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Sep 2019 13:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730083AbfIRL0o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Sep 2019 07:26:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730065AbfIRL0o (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Sep 2019 07:26:44 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D18321924;
        Wed, 18 Sep 2019 11:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568806002;
        bh=3pmcbb5IGNv6UVVCEUYcu4A9L8uAUcH4rxuI8B/12LY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LjbE/Ir0aZZYCh9MO2PZBxyrtu7b0gHWAfhLJPjbNBGxiwaxl9qv8RDXxU2iq/Zmp
         mYFteaCPua5j4OI0VN17o4QHyaRlwYo+LqCULMvbMsM9wwMMXPft5Nm/jEEl5ZYu91
         S6mVIjlDvjE2hZMUuyADh002Fyk1Ew2hFSj60fF8=
Received: by mail-lj1-f169.google.com with SMTP id m7so6163528lji.2;
        Wed, 18 Sep 2019 04:26:42 -0700 (PDT)
X-Gm-Message-State: APjAAAU/lWS08tv0DxuGxB2rAwEObyPiD+o4wZVo4cMyiegmkkG/MAgw
        MIv+Ovku5T93HHEg9arIfPUAlg5S0g6AzGKMCp0=
X-Google-Smtp-Source: APXvYqxLQFwGNOEyIWCb1AqfUIXqxWQhby8CiTgWvnzCEPxUQnhdtdDF3pzXyGJO5Yg7Zv4E9iuuS9SzIFnvci+Qqe4=
X-Received: by 2002:a2e:9608:: with SMTP id v8mr1979111ljh.40.1568806000442;
 Wed, 18 Sep 2019 04:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190907144541.16949-1-krzk@kernel.org> <20190912170145.GA17889@bogus>
In-Reply-To: <20190912170145.GA17889@bogus>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 18 Sep 2019 13:26:29 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
Message-ID: <CAJKOXPfsUw-+yRc=GF+t=1pE7D3dF_wpRUwZpmfLnRbDyEmKeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > using json-schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> >  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
> >  2 files changed, 69 insertions(+), 35 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
>
>
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > new file mode 100644
> > index 000000000000..39f1ca3bc4db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung SoC Watchdog Timer Controller
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +description: |+
> > +  The Samsung's Watchdog controller is used for resuming system operation
> > +  after a preset amount of time during which the WDT reset event has not
> > +  occurred.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - samsung,s3c2410-wdt                   # for S3C2410
> > +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> > +      - samsung,exynos5250-wdt                # for Exynos5250
> > +      - samsung,exynos5420-wdt                # for Exynos5420
> > +      - samsung,exynos7-wdt                   # for Exynos7
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  samsung,syscon-phandle:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > +    description:
> > +      Phandle to the PMU system controller node (in case of Exynos5250
> > +      and Exynos5420).
> > +
> > +  timeout-sec:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Watchdog timeout in seconds.
>
> We need a common schema for this and the node name.

Common schema in dt-schema or in Linux kernel bindings? If the latter,
I can add it.

> Also note that anything with a unit suffix already has a type
> definition, so we don't really need to define it again.

Right.

Best regards,
Krzysztof
