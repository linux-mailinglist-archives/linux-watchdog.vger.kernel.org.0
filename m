Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40BBE4AFDF9
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Feb 2022 21:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiBIUDU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Feb 2022 15:03:20 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbiBIUDT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Feb 2022 15:03:19 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842BCE06C424;
        Wed,  9 Feb 2022 12:03:14 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id q8so3659072oiw.7;
        Wed, 09 Feb 2022 12:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uN6+PRmPc/49F6WOV3zu54SlBZGz2+tDnDSPMlVZhUI=;
        b=z6rexH6HfpCD38it7SDsdhVVnmcHlGsE5FMaL7VZUmB91eD3xQeK4w9tnIL1+yCyDX
         RnLMvgvXHBr2byoSqGgVaHFzF6/QzcGltISdG0UmaqPaazj5TLTxjyOjgGqbmH801NEo
         O4q8a5DXWP60u5SkaMvioEmIjVi+zsFcYKtV4wdnRZ+BPdasuWHEoIkGN4XTxEWqeYNW
         DpH8yvW+ZLPLybk/twVHlp53xRjeTOb3HKNQ5hljlIQkI+XXkX6e8HSY7RZhKwgOMGNk
         f6/IwocKc2d9+IO8FNmsgy5/oacZSB9idaof1eVQotS+L4W20tFfyTuUqYrFc8Vv0jMG
         1SNA==
X-Gm-Message-State: AOAM532LiWqTkqW44BA4fcb50bjhTEEQNy/LGzBGMmb9lHB5wWTpERFK
        a4+2lXbX6Cb7+mJxNtOehA/OKWGdQw==
X-Google-Smtp-Source: ABdhPJziENkuR5Hv3Ho/13HaMJGMlyAZdyehvKAGGuXRAMKaAoQVYtg3uMwhc2w654GqogYY6HhTqg==
X-Received: by 2002:a05:6808:120c:: with SMTP id a12mr2286954oil.118.1644436958092;
        Wed, 09 Feb 2022 12:02:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bq16sm2050694oib.33.2022.02.09.12.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 12:02:36 -0800 (PST)
Received: (nullmailer pid 799522 invoked by uid 1000);
        Wed, 09 Feb 2022 20:02:35 -0000
Date:   Wed, 9 Feb 2022 14:02:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: watchdog: brcm,bcm7038: add more
 compatible strings
Message-ID: <YgQd25G0UROyTMA9@robh.at.kernel.org>
References: <20220126132116.11070-1-zajec5@gmail.com>
 <20220126222034.16889-1-zajec5@gmail.com>
 <YgQRam1RFim1AMMf@robh.at.kernel.org>
 <7b60d62b-9828-cc74-8d03-64ef5f722661@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b60d62b-9828-cc74-8d03-64ef5f722661@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Feb 09, 2022 at 08:26:00PM +0100, Rafał Miłecki wrote:
> On 9.02.2022 20:09, Rob Herring wrote:
> > On Wed, Jan 26, 2022 at 11:20:34PM +0100, Rafał Miłecki wrote:
> > > From: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > This hardware block is used on almost all BCM63xx family chipsets and
> > > BCM4908 which reuses a lot of BCM63xx parts. Add relevant compatible
> > > strings and also include a generic one.
> > > 
> > > The only SoC with a different block I found is BCM6838 (thus not included
> > > in this change).
> > > 
> > > It may be worth noting that BCM6338, BCM6345, BCM6348 and BCM63268 don't
> > > include "SoftRst" register but that can be handled by drivers based on
> > > precise compatible string.
> > > 
> > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > ---
> > > V2: Sort enum entries & update brcm,twd.yaml
> > > ---
> > >   .../devicetree/bindings/mfd/brcm,twd.yaml     |  2 +-
> > >   .../bindings/watchdog/brcm,bcm7038-wdt.yaml   | 21 +++++++++++++++----
> > >   2 files changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> > > index 634526f790b8..3f5db1990aba 100644
> > > --- a/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/brcm,twd.yaml
> > > @@ -55,7 +55,7 @@ examples:
> > >           #size-cells = <1>;
> > >           watchdog@28 {
> > > -            compatible = "brcm,bcm7038-wdt";
> > > +            compatible = "brcm,bcm4908-wdt", "brcm,bcm63xx-wdt";
> > >               reg = <0x28 0x8>;
> > >           };
> > >       };
> > > diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> > > index a926809352b8..4d848442913c 100644
> > > --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> > > +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> > > @@ -16,9 +16,22 @@ maintainers:
> > >   properties:
> > >     compatible:
> > > -    enum:
> > > -      - brcm,bcm6345-wdt
> > > -      - brcm,bcm7038-wdt
> > > +    items:
> > > +      - enum:
> > > +          - brcm,bcm4908-wdt
> > > +          - brcm,bcm6338-wdt
> > > +          - brcm,bcm6345-wdt
> > > +          - brcm,bcm6348-wdt
> > > +          - brcm,bcm6848-wdt
> > > +          - brcm,bcm6858-wdt
> > > +          - brcm,bcm7038-wdt
> > > +          - brcm,bcm60333-wdt
> > > +          - brcm,bcm63138-wdt
> > > +          - brcm,bcm63148-wdt
> > > +          - brcm,bcm63268-wdt
> > > +          - brcm,bcm63381-wdt
> > > +          - brcm,bcm68360-wdt
> > > +      - const: brcm,bcm63xx-wdt
> > 
> > Is it really worthwhile to update all these DTs?:
> > 
> > arch/mips/boot/dts/brcm/bcm63268.dtsi:                  compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm6328.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm6358.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm6362.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm6368.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7125.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7346.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7358.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7360.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7362.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7420.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7425.dtsi:                   compatible = "brcm,bcm7038-wdt";
> > arch/mips/boot/dts/brcm/bcm7435.dtsi:                   compatible = "brcm,bcm7038-wdt";
> 
> I don't have problem handling that.

Even if the dts files above are updated, the driver still has to support 
the above case.

It's pointless to change this. We've already got 1000s of warnings to 
fix and 2000 bindings still to convert if you need something to do.

> > I don't think so.
> So what's the policy for such bindings then? How to select SoCs that
> should have their own bindings? How can I tell which should /borrow/ a
> binding instead?

The way it is supposed to work is the first implementation gets 
'soc1-block'. When the 2nd implementation comes about, it gets 
'soc2-block'. If soc2 implementation is 'the same' or a superset, then 
it should have a fallback to 'soc1-block'. Another way to test that is, 
"I want my existing s/w to work as-is with this new h/w". The process 
repeats on the next SoC, but you could be backwards compatible with 
soc1, soc2, both or none. Is that what you are asking?

If you are doing all this after the fact at once, then it can be a 
bit different in how you do compatibles.

In this case, I would make "brcm,bcm7038-wdt" the fallback to the rest 
(granted, I know nothing about these chips or the relationship between 
them), but you have to keep supporting "brcm,bcm7038-wdt". 6345 is up 
to you I guess as there aren't any upstream dts files using it. Florian 
might care.

Rob
