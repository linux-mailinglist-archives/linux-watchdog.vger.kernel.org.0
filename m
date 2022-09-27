Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C4B5EBD2E
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Sep 2022 10:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbiI0IYd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Sep 2022 04:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbiI0IYc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Sep 2022 04:24:32 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57073B248E;
        Tue, 27 Sep 2022 01:24:29 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w22-20020a056830061600b006546deda3f9so5934528oti.4;
        Tue, 27 Sep 2022 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=gQ+wC3gDGV3yuaRddBzFSqfasdF4aPIO41dI/GPBHP0=;
        b=f1JxDVnXxsZi9PYT3F3kM+EVQHsVqccvhRg+nven8l+zIOUwN6genHxiKz0kl2VkH0
         n1q2wz5JGSFZovqkk7Wbbt/TnF2Vd3+Ugm/FpH+WVpH9RCtpRvloK2nlo3QOpXjWwOKP
         JnNjIqvuSxekdKc3a3DARoYSkdo/qgDTGtPAL5H/RzzjUOM+YA1dsmCakLWHs66kO/ra
         ATpuJpA+KFrh7tMP/7KUf9nJ/d2ZSv0JaQ+HUtFl3+DK1jupnUTfDqrKcin1o/GS9+iB
         kvPCHk7bghtJUi8CAzS9IJNR2qHxRTAuh1pw99qSIiTquazsSUuu2k6LEwvsKyDA54jo
         sYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gQ+wC3gDGV3yuaRddBzFSqfasdF4aPIO41dI/GPBHP0=;
        b=jJYFolay1ER8qCiFCWWIqm00brcmsZXEco9UEggIpVAzAGwmBi3XMjKT1pReaLfa1j
         2P9/OI9zamzwTQ1iPaxhz1gN1Fh4ncdonlTPcbX0Yp9r174Q8U6K1X+iRIRrwdz6sFT4
         C9LmVdMpV4fs8P/pJSUo5oDEyHP4GSL2a46vRgwDzSVe+TdDnj7UC63M4d4RVMWyKu3x
         d8sCyFxvPonhCzmb+qh8ZpufVjqFQgKnrcIBXFPdhMIl7sPG1LoudWUL2G3dMLeXjlaL
         hjQeVy6QdLw34/PqNHNtIo/BZOxX8xp3wQZRO8QyYTYSzH5JrLhkNbQBGB039ZlZHFkC
         /oJg==
X-Gm-Message-State: ACrzQf0ssNdlSyJ/YVoxmDft62oL2UWyXq6uZz4NIURARtV2q0+FRz1d
        lbeVRQTQyor6ILTiNY+dk7rf+Q9CSrGsE96NzI8=
X-Google-Smtp-Source: AMsMyM59clMaaD9rBZgKpedRbCzWNYmvRcTCevA4HPUI6z4ozlznlTp38zuFMk9oysvJ5O9bvU2nrRhGFl6MWVjj3DE=
X-Received: by 2002:a05:6830:150e:b0:655:bc7d:1e5d with SMTP id
 k14-20020a056830150e00b00655bc7d1e5dmr11648947otp.272.1664267068174; Tue, 27
 Sep 2022 01:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220926162549.805108-1-sergio.paracuellos@gmail.com> <20220926211508.GA682626@roeck-us.net>
In-Reply-To: <20220926211508.GA682626@roeck-us.net>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 27 Sep 2022 10:24:16 +0200
Message-ID: <CAMhs-H-j34cfv1rJ=fUKhQrZ5FwSJezZFnw=esh4MPNw+zNUNA@mail.gmail.com>
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

On Mon, Sep 26, 2022 at 11:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Sep 26, 2022 at 06:25:49PM +0200, Sergio Paracuellos wrote:
> > Soc Mt7621 Watchdog bindings used text format, so migrate them to YAML.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks, Guenter!

Rob, I don't know why this patch is not in devicetree patchwork list...

Please let me know if you want me to resend this again.

Thanks,
   Sergio Paracuellos

>
> > ---
> > Changes in v2 RESEND:
> > - Resent sending also to watchdog maintainers.
> >
> > Changes in v2:
> >  - Rebase onto last kernel version.
> >  - Add Krzysztof Reviewed-by tag.=C2=BA
> >
> >  .../watchdog/mediatek,mt7621-wdt.yaml         | 33 +++++++++++++++++++
> >  .../bindings/watchdog/mt7621-wdt.txt          | 12 -------
> >  2 files changed, 33 insertions(+), 12 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek=
,mt7621-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/mt7621-w=
dt.txt
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621=
-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.=
yaml
> > new file mode 100644
> > index 000000000000..b2b17fdf4e39
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.ya=
ml
> > @@ -0,0 +1,33 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ralink Watchdog Timers
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7621-wdt
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    watchdog@100 {
> > +      compatible =3D "mediatek,mt7621-wdt";
> > +      reg =3D <0x100 0x100>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> > deleted file mode 100644
> > index c15ef0ef609f..000000000000
> > --- a/Documentation/devicetree/bindings/watchdog/mt7621-wdt.txt
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -Ralink Watchdog Timers
> > -
> > -Required properties:
> > -- compatible: must be "mediatek,mt7621-wdt"
> > -- reg: physical base address of the controller and length of the regis=
ter range
> > -
> > -Example:
> > -
> > -     watchdog@100 {
> > -             compatible =3D "mediatek,mt7621-wdt";
> > -             reg =3D <0x100 0x10>;
> > -     };
