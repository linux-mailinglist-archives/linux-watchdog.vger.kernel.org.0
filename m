Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7182F5EFBF1
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Sep 2022 19:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbiI2R0U (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Sep 2022 13:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiI2R0R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Sep 2022 13:26:17 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CDD140F3B;
        Thu, 29 Sep 2022 10:26:16 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v130so2304786oie.2;
        Thu, 29 Sep 2022 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5Gar4+C0eGFH69sapndZst+svbVcL9Cfkjk8s1t/A8g=;
        b=ZuHKBL9yE0aehSZ+X1MMGjpUTHSzhGIIkrKJo9fiaC6RvZ1kVvSW8yDmtgPB3rtKZ5
         3Rw91axzb3kN5ec2JP/s1I2+HbseRsTlLeF05A3Acz7ibEWt4YvhZw9IMO6thRRpBd2Z
         hR0jOLSfuCYv2uHgF4elVg7kMKTehDui92MHM/64ODThXOod585ktaiQF/IE9zBQbU2i
         grTvFp6oItkZacNgipcZy5o6GE6zb5xdrO6gttme6fSXedEPg3DHFem/h6XNuYeOrwOY
         JLVq0aSuAElLjKwgT+3AnJ8YYBBoXFzqpUo1xKIMt6FvqaDWQxCH00XDMlbDq2apHt5X
         I54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5Gar4+C0eGFH69sapndZst+svbVcL9Cfkjk8s1t/A8g=;
        b=zxfoXpIhO+/F4veUuzaTHUjOgg/goAvkvqFicTGCpr96lDzVcziRjUOKsp4m2Id4aw
         bTTpoNQiRjmmw89G72DapP0qt+oMPnDR7gp2mZRPkonfHMc74NdT4HeQNpdzs/4Au4zo
         t02VQ94XsTYHIGIu07rwhNOL/8pALsyPEFn1DyFvr9usSCvp3kC0QdfCCJeEeoTEE64R
         yzMqXDnL0J0jCAQ5TgwB6ySY1EakPI5L9IO9Y+Z1S75y5H5+hq6aFozlLVn0JAbR5y4X
         pGCqmT6hgzurRDYRK2GOhxr1MLrurodCWxxiB2eypvCzuG/o0JU1X7T/P0tkWYlBa8FY
         rA/g==
X-Gm-Message-State: ACrzQf1wzl9+9SgAqMW8VNh5UV9hlP42D6eSRqwAdQbldOdKZpKjwYKu
        8BQe3UwATzrtA7iqMJ3o4wryx8uXG6bPPp8tP9cZMdhNwE0=
X-Google-Smtp-Source: AMsMyM4CPKrPbKrxfO2zRjo1Ek0WW8xrOER1sYPTpkRJMMSiDoEO0D7THZCRRXY5ajOdMNRed0uCH/36g9DBe8gC4IE=
X-Received: by 2002:a05:6808:23ca:b0:350:92c4:3422 with SMTP id
 bq10-20020a05680823ca00b0035092c43422mr2131069oib.144.1664472376352; Thu, 29
 Sep 2022 10:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220926162549.805108-1-sergio.paracuellos@gmail.com>
 <20220926211508.GA682626@roeck-us.net> <CAMhs-H-j34cfv1rJ=fUKhQrZ5FwSJezZFnw=esh4MPNw+zNUNA@mail.gmail.com>
In-Reply-To: <CAMhs-H-j34cfv1rJ=fUKhQrZ5FwSJezZFnw=esh4MPNw+zNUNA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 29 Sep 2022 19:26:04 +0200
Message-ID: <CAMhs-H_hPsLZh9YrckPzOqx4NOPKAc8OGeHmerpsHABs0L13Fw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] dt-bindings: watchdog: migrate mt7621 text
 bindings to YAML
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        wim@linux-watchdog.org, Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 27, 2022 at 10:24 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Mon, Sep 26, 2022 at 11:16 PM Guenter Roeck <linux@roeck-us.net> wrote=
:
> >
> > On Mon, Sep 26, 2022 at 06:25:49PM +0200, Sergio Paracuellos wrote:
> > > Soc Mt7621 Watchdog bindings used text format, so migrate them to YAM=
L.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks, Guenter!
>
> Rob, I don't know why this patch is not in devicetree patchwork list...
>
> Please let me know if you want me to resend this again.
>
> Thanks,
>    Sergio Paracuellos

I guess this patch is supposed to go through the watchdog tree??

Thanks in advance for clarification.

Best regards,
    Sergio Paracuellos

>
> >
> > > ---
> > > Changes in v2 RESEND:
> > > - Resent sending also to watchdog maintainers.
> > >
> > > Changes in v2:
> > >  - Rebase onto last kernel version.
> > >  - Add Krzysztof Reviewed-by tag.=C2=BA
> > >
> > >  .../watchdog/mediatek,mt7621-wdt.yaml         | 33 +++++++++++++++++=
++
> > >  .../bindings/watchdog/mt7621-wdt.txt          | 12 -------
> > >  2 files changed, 33 insertions(+), 12 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/mediat=
ek,mt7621-wdt.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/mt7621=
-wdt.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt76=
21-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wd=
t.yaml
> > > new file mode 100644
> > > index 000000000000..b2b17fdf4e39
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.=
yaml
> > > @@ -0,0 +1,33 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml=
#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Ralink Watchdog Timers
> > > +
> > > +maintainers:
> > > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: watchdog.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt7621-wdt
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    watchdog@100 {
> > > +      compatible =3D "mediatek,mt7621-wdt";
> > > +      reg =3D <0x100 0x100>;
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.tx=
t b/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> > > deleted file mode 100644
> > > index c15ef0ef609f..000000000000
> > > --- a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -Ralink Watchdog Timers
> > > -
> > > -Required properties:
> > > -- compatible: must be "mediatek,mt7621-wdt"
> > > -- reg: physical base address of the controller and length of the reg=
ister range
> > > -
> > > -Example:
> > > -
> > > -     watchdog@100 {
> > > -             compatible =3D "mediatek,mt7621-wdt";
> > > -             reg =3D <0x100 0x10>;
> > > -     };
