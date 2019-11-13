Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30908FAC78
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Nov 2019 10:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfKMJAB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Nov 2019 04:00:01 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38610 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfKMJAB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Nov 2019 04:00:01 -0500
Received: by mail-qk1-f193.google.com with SMTP id e2so1054261qkn.5
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Nov 2019 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zriSzR1A7PY8VkXg8BzENfmEpX+OltCL/F/xWpeuul4=;
        b=my0U+qCLomIt6E1rAcdLE1Id6S8BuETSIIYtZIcmh2johk6LY+sQR3OjPubPjNOZQ8
         6NQNnX9pWKlZ9SNfJx5VIdEc09EjWpcwRbHBiPDehzm8+sJMUnGQ74CAgqKMhdkC/VH4
         b1XyxWzrZDwZ3bRb95XyDevdiw+hY/azHEjwrCyWCCuwB1vT2kWfJyP39J6X9zDbTJ+s
         CYquB2V7jcS3H3bMbcuOynmxubakIWY2jmDQ+nt1XaAS4CB5W/aCDQFC1jMbCliAN/ZG
         07AFzKV3bl6HOxccM/iSQ8WklrCXO932AMgXydPNhtOyLKIA29nq16WU2NALw4A/rO+I
         ck+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zriSzR1A7PY8VkXg8BzENfmEpX+OltCL/F/xWpeuul4=;
        b=ANkSqdaVHjlAL9CA3cAaqxv1XArdQyL427o2fkIGGvuB/dbDbT02f+O9nFKik4QARj
         gYgBMI9vBEEOHeswyHTUfcyQiP8jIIcgLpZQpooBAdrRjyADCYcZG6xqV17s8rdf1wbt
         EIDhbZPlK9mgpHsfdo8rHwWfYzOIx6ZD4JNfBluMBbIIMOuoFwgt8N7Iq5M8eYPGyugf
         RgXLeNNYSGyZKmjcyj2zSFn0il4Mxv4UKPJfMlKfZ+S7YsjIDvVWtfH20xZjUzyIIb2v
         t+uNjLfrSQIxwh87NItY4ioRQJzc69fZVeEG9tyl6epZJgbL4HOB8trs/PJ2h3uZiTjV
         v5lQ==
X-Gm-Message-State: APjAAAVVywJpwICr+v7mNb2YM1MnCraf/x2Z8Kt29vF1JS67GDxYOwTc
        olrlg6QRPCZVpM+Ed+CRpCVyBhq1mkGbzX/b55T85Q==
X-Google-Smtp-Source: APXvYqwsCmN6s9RnJjvaofrXiIJk06TaVDlS+MgGGZe8uV9Y2XokAVivNi+UmgCV28MIMFtKMGxwIn9ktjfr5qd7u6s=
X-Received: by 2002:ae9:e885:: with SMTP id a127mr1321564qkg.427.1573635599889;
 Wed, 13 Nov 2019 00:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20191017124159.13869-1-benjamin.gaignard@st.com>
 <63f96a2f-78c0-21ae-781b-e52068f57103@st.com> <6597f899-f049-02dc-de59-07a0f23a88b8@st.com>
 <d0c1af15-a647-8d80-81c9-fc07b926856c@roeck-us.net>
In-Reply-To: <d0c1af15-a647-8d80-81c9-fc07b926856c@roeck-us.net>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 13 Nov 2019 09:59:48 +0100
Message-ID: <CA+M3ks633VNnc9UPDVq9w68pc3EPcff69UxvsggfUvtRCUJwVw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert stm32 watchdog bindings to json-schema
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le jeu. 17 oct. 2019 =C3=A0 15:31, Guenter Roeck <linux@roeck-us.net> a =C3=
=A9crit :
>
> On 10/17/19 6:17 AM, Benjamin GAIGNARD wrote:
> >
> > On 10/17/19 3:06 PM, Alexandre Torgue wrote:
> >> Hi Benjamin
> >>
> >> On 10/17/19 2:41 PM, Benjamin Gaignard wrote:
> >>> Convert the STM32 watchdog binding to DT schema format using json-sch=
ema
> >>>
> >>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >>> ---
> >>>    .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 ----------=
-
> >>>    .../bindings/watchdog/st,stm32-iwdg.yaml           | 54
> >>> ++++++++++++++++++++++
> >>>    2 files changed, 54 insertions(+), 26 deletions(-)
> >>>    delete mode 100644
> >>> Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> >>>    create mode 100644
> >>> Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> >>> b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> >>> deleted file mode 100644
> >>> index d8f4430b0a13..000000000000
> >>> --- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> >>> +++ /dev/null
> >>> @@ -1,26 +0,0 @@
> >>> -STM32 Independent WatchDoG (IWDG)
> >>> ----------------------------------
> >>> -
> >>> -Required properties:
> >>> -- compatible: Should be either:
> >>> -  - "st,stm32-iwdg"
> >>> -  - "st,stm32mp1-iwdg"
> >>> -- reg: Physical base address and length of the registers set for the
> >>> device
> >>> -- clocks: Reference to the clock entry lsi. Additional pclk clock en=
try
> >>> -  is required only for st,stm32mp1-iwdg.
> >>> -- clock-names: Name of the clocks used.
> >>> -  "lsi" for st,stm32-iwdg
> >>> -  "lsi", "pclk" for st,stm32mp1-iwdg
> >>> -
> >>> -Optional Properties:
> >>> -- timeout-sec: Watchdog timeout value in seconds.
> >>> -
> >>> -Example:
> >>> -
> >>> -iwdg: watchdog@40003000 {
> >>> -    compatible =3D "st,stm32-iwdg";
> >>> -    reg =3D <0x40003000 0x400>;
> >>> -    clocks =3D <&clk_lsi>;
> >>> -    clock-names =3D "lsi";
> >>> -    timeout-sec =3D <32>;
> >>> -};
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> >>> b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> >>> new file mode 100644
> >>> index 000000000000..edec96d53e6b
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> >>> @@ -0,0 +1,54 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
> >>> +
> >>> +maintainers:
> >>> +  - Yannick Fertre <yannick.fertre@st.com>
> >>
> >> Yannick is still working on this driver ?
> >
> > That is a good question.
> >
> > Rob, can we use the STM32 dedicated mailing list address for this
> > mainteners field ?
> >
> > maintainers:
> >
> > - linux STM32 <linux-stm32@st-md-mailman.stormreply.com>
> >
>
>
> I'd rather wonder who is going to maintain this secondary distributed
> maintainers list, but I guess that is a different question.
>

Gentle ping to reviewers on this patch.

Thanks,
Benjamin

> Guenter
>
> > Regards,
> >
> > Benjamin
> >
> >>
> >>> +
> >>> +allOf:
> >>> +  - $ref: "watchdog.yaml#"
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - st,stm32-iwdg
> >>> +      - st,stm32mp1-iwdg
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: Low speed clock
> >>> +      - description: Optional peripheral clock
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      enums: [ lsi, pclk ]
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - clocks
> >>> +  - clock-names
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> >>> +    watchdog@5a002000 {
> >>> +      compatible =3D "st,stm32mp1-iwdg";
> >>> +      reg =3D <0x5a002000 0x400>;
> >>> +      clocks =3D <&rcc IWDG2>, <&rcc CK_LSI>;
> >>> +      clock-names =3D "pclk", "lsi";
> >>> +      timeout-sec =3D <32>;
> >>> +    };
> >>> +
> >>> +...
> >> >
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
