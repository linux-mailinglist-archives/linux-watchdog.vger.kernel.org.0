Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B61177BF4
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2020 17:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgCCQbJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Mar 2020 11:31:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:43540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbgCCQbI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Mar 2020 11:31:08 -0500
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F881217F4;
        Tue,  3 Mar 2020 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583253067;
        bh=M4UUid7URLJzI65r89j9OlKfunud6VLBNpQJ5cIznLc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Q6/YYdyICjYQuGSUi71sQ7RNk8xBdEBtd5Ykq5D7G09n/jlRTu/AEWt0cxY3YhgW7
         zcXwrn8r2US8MV8k2RRTuaPiG5/V6F5dTsL8Bjn2XWrc9k9WOZo5OBQfj2nHYEndVd
         B8QewoodnSVx6hDuys5BCtt4Cw0nTj6WjmCwEvjE=
Received: by mail-qv1-f46.google.com with SMTP id r15so1952407qve.3;
        Tue, 03 Mar 2020 08:31:07 -0800 (PST)
X-Gm-Message-State: ANhLgQ0BoNAnJnWYcrrfa7B2wD7yLJzJzRg93TK4APW7zk08iZbcfghY
        IIDQFTkTNx23dJEKVN0ZBQrRJedsuJjL+3niMw==
X-Google-Smtp-Source: ADFU+vutKDjmsaxU5hYaSz/ewKlff3yc8qlL9gYjYDN0Waoeyc1JAUaPF7rmkKajIRf/6cL1e6hN3d6uUDM4FCUBeoA=
X-Received: by 2002:ad4:42cd:: with SMTP id f13mr4414134qvr.136.1583253066278;
 Tue, 03 Mar 2020 08:31:06 -0800 (PST)
MIME-Version: 1.0
References: <20200228105809.23254-1-benjamin.gaignard@st.com>
 <20200303013945.GA8727@bogus> <d54e7799-a092-63d5-01f1-907a9999a776@st.com>
In-Reply-To: <d54e7799-a092-63d5-01f1-907a9999a776@st.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 3 Mar 2020 10:30:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+G=E48MCp3X=dknF=4sETSt2VCkNvvKdo1o7wjcDF+zw@mail.gmail.com>
Message-ID: <CAL_Jsq+G=E48MCp3X=dknF=4sETSt2VCkNvvKdo1o7wjcDF+zw@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: mfd: Convert stpmic1 bindings to json-schema
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Mar 3, 2020 at 2:17 AM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 3/3/20 2:39 AM, Rob Herring wrote:
> > On Fri, Feb 28, 2020 at 11:58:09AM +0100, Benjamin Gaignard wrote:
> >> Convert stpmic1 bindings to json-schema.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> >> ---
> >> version 4:
> >> - move on uppder node $ref: ../regulator/regulator.yaml
> >> - move fixed strings under properties field
> >> - remove unneeded () in patternProperties
> >> - keep ldo3 separate from other ldo properties
> >> Note:
> >> - 'st,mask-reset' property stay in each subnode, I don't find
> >>    the syntax to avoid dupliquate it.
> >> - ldo6-supply and all possible *-supply are describe by this regular
> >>    expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> >>
> >> version 3:
> >> - put $ref under allOf keyword
> >> - for each regulator node add the list of supported regulator properties
> >>
> >>   .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
> >>   .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
> >>   .../devicetree/bindings/mfd/st,stpmic1.yaml        | 338 +++++++++++++++++++++
> >>   .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
> >>   .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
> >>   5 files changed, 338 insertions(+), 164 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> >>   delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> >>   create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> >>   delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> >>   delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt b/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> >> deleted file mode 100644
> >> index eb8e83736c02..000000000000
> >> --- a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> >> +++ /dev/null
> >> @@ -1,28 +0,0 @@
> >> -STMicroelectronics STPMIC1 Onkey
> >> -
> >> -Required properties:
> >> -
> >> -- compatible = "st,stpmic1-onkey";
> >> -- interrupts: interrupt line to use
> >> -- interrupt-names = "onkey-falling", "onkey-rising"
> >> -    onkey-falling: happens when onkey is pressed; IT_PONKEY_F of pmic
> >> -    onkey-rising: happens when onkey is released; IT_PONKEY_R of pmic
> >> -
> >> -Optional properties:
> >> -
> >> -- st,onkey-clear-cc-flag: onkey is able power on after an
> >> -  over-current shutdown event.
> >> -- st,onkey-pu-inactive: onkey pull up is not active
> >> -- power-off-time-sec: Duration in seconds which the key should be kept
> >> -        pressed for device to power off automatically (from 1 to 16 seconds).
> >> -        see See Documentation/devicetree/bindings/input/input.yaml
> >> -
> >> -Example:
> >> -
> >> -onkey {
> >> -    compatible = "st,stpmic1-onkey";
> >> -    interrupt-parent = <&pmic>;
> >> -    interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
> >> -    interrupt-names = "onkey-falling", "onkey-rising";
> >> -    power-off-time-sec = <10>;
> >> -};
> >> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt b/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> >> deleted file mode 100644
> >> index afd45c089585..000000000000
> >> --- a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> >> +++ /dev/null
> >> @@ -1,61 +0,0 @@
> >> -* STMicroelectronics STPMIC1 Power Management IC
> >> -
> >> -Required properties:
> >> -- compatible:               : "st,stpmic1"
> >> -- reg:                      : The I2C slave address for the STPMIC1 chip.
> >> -- interrupts:               : The interrupt line the device is connected to.
> >> -- #interrupt-cells: : Should be 1.
> >> -- interrupt-controller:     : Marks the device node as an interrupt controller.
> >> -                        Interrupt numbers are defined at
> >> -                        dt-bindings/mfd/st,stpmic1.h.
> >> -
> >> -STPMIC1 consists in a varied group of sub-devices.
> >> -Each sub-device binding is be described in own documentation file.
> >> -
> >> -Device                       Description
> >> -------                      ------------
> >> -st,stpmic1-onkey    : Power on key, see ../input/st,stpmic1-onkey.txt
> >> -st,stpmic1-regulators       : Regulators, see ../regulator/st,stpmic1-regulator.txt
> >> -st,stpmic1-wdt              : Watchdog, see ../watchdog/st,stpmic1-wdt.txt
> >> -
> >> -Example:
> >> -
> >> -#include <dt-bindings/mfd/st,stpmic1.h>
> >> -
> >> -pmic: pmic@33 {
> >> -    compatible = "st,stpmic1";
> >> -    reg = <0x33>;
> >> -    interrupt-parent = <&gpioa>;
> >> -    interrupts = <0 2>;
> >> -
> >> -    interrupt-controller;
> >> -    #interrupt-cells = <2>;
> >> -
> >> -    onkey {
> >> -            compatible = "st,stpmic1-onkey";
> >> -            interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
> >> -            interrupt-names = "onkey-falling", "onkey-rising";
> >> -            power-off-time-sec = <10>;
> >> -    };
> >> -
> >> -    watchdog {
> >> -            compatible = "st,stpmic1-wdt";
> >> -    };
> >> -
> >> -    regulators {
> >> -            compatible = "st,stpmic1-regulators";
> >> -
> >> -            vdd_core: buck1 {
> >> -                    regulator-name = "vdd_core";
> >> -                    regulator-boot-on;
> >> -                    regulator-min-microvolt = <700000>;
> >> -                    regulator-max-microvolt = <1200000>;
> >> -            };
> >> -            vdd: buck3 {
> >> -                    regulator-name = "vdd";
> >> -                    regulator-min-microvolt = <3300000>;
> >> -                    regulator-max-microvolt = <3300000>;
> >> -                    regulator-boot-on;
> >> -                    regulator-pull-down;
> >> -            };
> >> -    };
> >> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> >> new file mode 100644
> >> index 000000000000..e9adcd04a48d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> >> @@ -0,0 +1,338 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/mfd/st,stpmic1.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: STMicroelectonics STPMIC1 Power Management IC bindings
> >> +
> >> +description: STMicroelectronics STPMIC1 Power Management IC
> >> +
> >> +maintainers:
> >> +  - pascal Paillet <p.paillet@st.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: st,stpmic1
> >> +
> >> +  reg:
> >> +    const: 0x33
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  onkey:
> >> +    type: object
> >> +
> >> +    allOf:
> >> +      - $ref: ../input/input.yaml
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        const: st,stpmic1-onkey
> >> +
> >> +      interrupts:
> >> +        items:
> >> +          - description: onkey-falling, happens when onkey is pressed. IT_PONKEY_F of pmic
> >> +          - description: onkey-rising, happens when onkey is released. IT_PONKEY_R of pmic
> >> +
> >> +      interrupt-names:
> >> +        items:
> >> +          - const: onkey-falling
> >> +          - const: onkey-rising
> >> +
> >> +      st,onkey-clear-cc-flag:
> >> +        description: onkey is able power on after an over-current shutdown event.
> >> +        $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >> +      st,onkey-pu-inactive:
> >> +        description: onkey pull up is not active
> >> +        $ref: /schemas/types.yaml#/definitions/flag
> >> +
> >> +      power-off-time-sec:
> >> +        minimum: 1
> >> +        maximum: 16
> >> +
> >> +    required:
> >> +      - compatible
> >> +      - interrupts
> >> +      - interrupt-names
> >> +
> >> +    additionalProperties: false
> >> +
> >> +  watchdog:
> >> +    type: object
> >> +
> >> +    allOf:
> >> +      - $ref: ../watchdog/watchdog.yaml
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        const: st,stpmic1-wdt
> >> +
> >> +      timeout-sec: true
> >> +
> >> +    required:
> >> +      - compatible
> >> +
> >> +    additionalProperties: false
> >> +
> >> +  regulators:
> >> +    type: object
> >> +
> >> +    allOf:
> >> +      - $ref: ../regulator/regulator.yaml
> > Sigh. Haven't I already said this was at the wrong level once before?
> >
> > My suggestion was to put this under
> > "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$".
> Yes but "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$" node doesn't
> need regulators properties.
> Only the nodes without '-supply' need these properties and they are at
> the same level than the -supply nodes.
> I have put the reference to the regulator upper as I can.

Sorry, I meant they should be under a
"^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])$" property.

Rob
