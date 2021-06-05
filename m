Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26A639C9F4
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Jun 2021 18:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFEQ5U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Jun 2021 12:57:20 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:37591 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhFEQ5U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Jun 2021 12:57:20 -0400
Received: by mail-oi1-f177.google.com with SMTP id h9so13202400oih.4;
        Sat, 05 Jun 2021 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=em0XmateqEJVk5W5pCUdx68KEKOouTKTxSBDpQ3H04k=;
        b=KTQxxWcWzKevbvFbYASY/oD6B62LuYdLpfPtP2/3NlQlzt+wyq+lrdwoA+CexsMt6a
         PzEjcQwSnV5AME7WJeUoVEbYnbYr4Ct8ESoudSMOj0hvz/zijkUsISIpWWfdAcq+M+2q
         J94BIBarJ0/6Y1JlLLasSZCEf2/zWxMNoXoHkqfSHL+Bf0ad5AXT1iLS9FR7rpG6zY4R
         dWvhkta6NOoZXlOXUiTpgYR2WAHxVS0zF+y9UZCyrWvDa8524619lL1GELfE4Oef/9fo
         mSaOkza6+idxEKgaw/1v727h40+EFmnY+5/grZNiucnSq6DlS+1aS3b8Q4zz7p6dAxki
         vvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=em0XmateqEJVk5W5pCUdx68KEKOouTKTxSBDpQ3H04k=;
        b=sXQt1wuumb2Ub+bzmk6l7DFs97Ahxsr5Pv/tQS58ghMT6gqFU0+fuLMcQlCxgmxdsJ
         +NIwAMx5Us/6HCDwcOQSsfZ8arTMqOKI7MUILtGt2256AS2a8xxjpc8TR4TRYQomcU4L
         VvebyHNkqxmHsqOuvm0YePp5tS1kU3dG92vmZfFyH8+Xr0DlfQY5wIezugDrdkwUX47n
         klJZh+3SmjngjKN+hSHYQ3dZ95tXq9NnS/QuZgpjiLG6K5GYehsWrq5PyDXaUh/8c23x
         8At+WI0b0bnKOCL0Cm0S6MTgVo5NOpOcZW6mDx1EMZN0PK+Ax7kxl6ZDHjs/usJpo7H7
         h8hg==
X-Gm-Message-State: AOAM531p0P95OcnTGGRQWqZnGNBSr6TSKubYIhjHD8AWonyIhk6iCkX2
        Cnw3eqAtt/FqGOEASMN2cIyEJAUFyhD7WNYHZKs=
X-Google-Smtp-Source: ABdhPJwg1Cyh/hYO/hX2t66nO0UJrxONqHEj3nn0tKXc2CCuVJkdTDq+ns/H52MzLHABYZP5kxk6IvTCip+tPSuwNnA=
X-Received: by 2002:a05:6808:bd4:: with SMTP id o20mr14441019oik.68.1622912059420;
 Sat, 05 Jun 2021 09:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210530072645.10379-1-romain.perier@gmail.com>
 <20210530072645.10379-2-romain.perier@gmail.com> <20210604213028.GA3941849@robh.at.kernel.org>
In-Reply-To: <20210604213028.GA3941849@robh.at.kernel.org>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Sat, 5 Jun 2021 18:54:08 +0200
Message-ID: <CABgxDoKQF2KHoQZwXm-Zo+EUE3T9_uT1tFk8F5F5WoZNWDd4MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Documentation: watchdog: Add Mstar MSC313e WDT
 devicetree bindings documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le ven. 4 juin 2021 =C3=A0 23:30, Rob Herring <robh@kernel.org> a =C3=A9cri=
t :
>
> On Sun, May 30, 2021 at 09:26:43AM +0200, Romain Perier wrote:
> > This adds the documentation for the devicetree bindings of the Mstar
> > MSC313e watchdog driver, found from MSC313e SoCs and newer.
>
> 'dt-bindings: watchdog: ...' for the subject.
>
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >  .../bindings/watchdog/msc313e-wdt.yaml        | 40 +++++++++++++++++++
>
> mstar,msc313e-wdt.yaml
>
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-=
wdt.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yam=
l b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
> > new file mode 100644
> > index 000000000000..70b8e1be5e8e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/msc313e-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MStar Watchdog Device Tree Bindings
> > +
> > +maintainers:
> > +  - Daniel Palmer <daniel@0x0f.com>
> > +  - Romain Perier <romain.perier@gmail.com>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mstar,msc313e-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    watchdog: watchdog@6000 {
>
> Drop unused labels.
>
> > +        compatible =3D "mstar,msc313e-wdt";
> > +        reg =3D <0x6000 0x1f>;
> > +        clocks =3D <&xtal_div2>;
> > +    };
> > --
> > 2.30.2

Hi,

Ok I will send a v3

Regards,
Romain
