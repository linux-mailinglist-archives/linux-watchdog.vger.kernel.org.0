Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B87A2759ED
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Sep 2020 16:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgIWO1Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Sep 2020 10:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:34646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgIWO1Y (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Sep 2020 10:27:24 -0400
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 751E323772;
        Wed, 23 Sep 2020 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600871243;
        bh=pi/+5nDRkcxfTm2jn5nOSauI+FsVqWbO30qcgFTG248=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mY17aq3dJI8aIpX/xcAMQycrUYG36+II4NOhXrSfYdD9Do6twOn4mD30lVEoxR/AF
         DqbvappkTUlgztcXes3gBIQkZCa/HQ5aIJJqJH+JR8REIpsSh0Fs5q8LUo6AygLEG/
         NUqgTnrfDam68YrccAYdrrqNhj4kfjMFYpR7tIQI=
Received: by mail-oo1-f54.google.com with SMTP id c4so2606372oou.6;
        Wed, 23 Sep 2020 07:27:23 -0700 (PDT)
X-Gm-Message-State: AOAM5333G262marxkyyy++X6AbPwhLdbybn5r6Yq6A656FMnZYIRM6Co
        /HegxRMNN3JPzyZLzCqst5GcIRtbeWUvmKyX+A==
X-Google-Smtp-Source: ABdhPJy1wjB10AtEoz9fkxnAfi3ktZI/HbwPlqScoSgThEMaJ2Toc7AyO+mQAkYcSF9cm7R/tmKMhy71RM1nF7v6pfc=
X-Received: by 2002:a4a:d306:: with SMTP id g6mr7311oos.25.1600871242745; Wed,
 23 Sep 2020 07:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
 <434579d4cddf891f8fa0f50a152c098b113fa2fb.1600329307.git.matti.vaittinen@fi.rohmeurope.com>
 <20200918172834.GA3819336@bogus> <06961c1a52e7ed08b970745a64705df83bceeb31.camel@fi.rohmeurope.com>
In-Reply-To: <06961c1a52e7ed08b970745a64705df83bceeb31.camel@fi.rohmeurope.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 23 Sep 2020 08:27:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLj-JqnfH7eh=sR0=izK5NRBusXmwGiuDmX89cn3KA2+A@mail.gmail.com>
Message-ID: <CAL_JsqLj-JqnfH7eh=sR0=izK5NRBusXmwGiuDmX89cn3KA2+A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt_bindings: mfd: Add ROHM BD9576MUF and BD9573MUF PMICs
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Sep 19, 2020 at 5:46 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>
> Thanks Rob for taking a look at this!
>
> On Fri, 2020-09-18 at 11:28 -0600, Rob Herring wrote:
> > On Thu, Sep 17, 2020 at 11:01:52AM +0300, Matti Vaittinen wrote:
> > > Add bindings for ROHM BD9576MUF and BD9573MUF PMICs. These
> > > PMICs are primarily intended to be used to power the R-Car series
> > > processors. They provide 6 power outputs, safety features and a
> > > watchdog with two functional modes.
> > >
> > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > ---
> > >  .../bindings/mfd/rohm,bd9576-pmic.yaml        | 129
> > > ++++++++++++++++++
> > >  1 file changed, 129 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd9576-
> > > pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd9576-
> > > pmic.yaml
> > > new file mode 100644
> > > index 000000000000..f17d4d621585
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
> > > @@ -0,0 +1,129 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/rohm,bd9576-pmic.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ROHM BD9576MUF and BD9573MUF Power Management Integrated
> > > Circuit bindings
> > > +
> > > +maintainers:
> > > +  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > > +
> > > +description: |
> > > +  BD9576MUF and BD9573MUF are power management ICs primarily
> > > intended for
> > > +  powering the R-Car series processors.
> > > +  The IC provides 6 power outputs with configurable sequencing and
> > > safety
> > > +  monitoring. A watchdog logic with slow ping/windowed modes is
> > > also included.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rohm,bd9576
> > > +      - rohm,bd9573
> > > +
> > > +  reg:
> > > +    description:
> > > +      I2C slave address.
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  rohm,vout1-en-low:
> > > +    description:
> > > +      BD9576 and BD9573 VOUT1 regulator enable state can be
> > > individually
> > > +      controlled by a GPIO. This is dictated by state of vout1-en
> > > pin during
> > > +      the PMIC startup. If vout1-en is LOW during PMIC startup
> > > then the VOUT1
> > > +      enable sate is controlled via this pin. Set this property if
> > > vout1-en
> > > +      is wired to be down at PMIC start-up.
> > > +    type: boolean
> > > +
> > > +  rohm,vout1-en-gpios:
> > > +    description:
> > > +      GPIO specifier to specify the GPIO connected to vout1-en for
> > > vout1 ON/OFF
> > > +      state control.
> > > +    maxItems: 1
> > > +
> > > +  rohm,ddr-sel-low:
> > > +    description:
> > > +      The BD9576 and BD9573 output voltage for DDR can be selected
> > > by setting
> > > +      the ddr-sel pin low or high. Set this property if ddr-sel is
> > > grounded.
> > > +    type: boolean
> > > +
> > > +  rohm,watchdog-enable-gpios:
> > > +    description: The GPIO line used to enable the watchdog.
> > > +    maxItems: 1
> > > +
> > > +  rohm,watchdog-ping-gpios:
> > > +    description: The GPIO line used to ping the watchdog.
> > > +    maxItems: 1
> > > +
> > > +  hw_margin_ms:
> >
> > Needs a vendor prefix.
> >
> > s/_/-/
> >
> > > +    minimum: 4
> > > +    maximum: 4416
> > > +    description: Watchog timeout in milliseconds
> >
> > Maybe the words in the description should be in the property name as
> > I don't see how 'h/w margin' relates to 'watchdog timeout'.
>
> The hw_margin_ms is an existing property. As I wrote to Guenter:
> "hw_margin_ms" is an existing binding for specifying the maximum TMO in
> HW (if I understood it correctly). (It is used at least by the generig
> GPIO watchdog) I thought it's better to not invent a new vendor
> specific binding when we have a generic one.
>
> https://elixir.bootlin.com/linux/v5.9-rc2/source/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt

That one is odd and I haven't found an actual user of it. It would
make more sense as a collection of properties devices could use rather
than a virtual device.

I think I'd do something like 'watchdog-ping-time-msec' that can be
either '<min> <max>' or '<max>'.

Rob
