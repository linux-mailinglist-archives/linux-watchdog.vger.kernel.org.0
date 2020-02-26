Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1CB170427
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2020 17:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBZQTX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Feb 2020 11:19:23 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39484 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbgBZQTX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Feb 2020 11:19:23 -0500
Received: by mail-ot1-f65.google.com with SMTP id 77so3466859oty.6;
        Wed, 26 Feb 2020 08:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iq1gbUbicwWjZGTfSmd7O+55owgAT9WeI6nbk/c4HNk=;
        b=C+XFzZzPkyt9q4sa/8fUmJynJ6UTHrSKg2h036Waiz/G29HWf2q1QLurGxkc0yeNmo
         31He1yk9fcK+SduR4qnkgGUY/+u7T1zXyzhk8xL7Q7WZYvJ89DNpYdr9/Xql+5VsE2eL
         WDt1GBfUNBj/6eTfprlAYDlGxeV6Zws38VbN6/tNY/XJ7zQ/D8pdI6pbpoLT8pPp9agA
         xtxjgx9dNksiagHQHIlhUnUSKS3dKVwU3RwwhS4dkxGdoDp1XchGr/msL3ozu4t1mDrL
         PzAAr5+IXyeuT1skRnMZmJs+17s7CS8dTZvbKKmKspHn4Wz5U+XfcPp+4Jt/SGyEXvFc
         YvaA==
X-Gm-Message-State: APjAAAU++pW2LfNjx6bm6qAXkI9cpyG4ROw2P5Aqe8CbhY3/k6WeRXyG
        8GV9CF56h0Pi5X1JcTFdcQ==
X-Google-Smtp-Source: APXvYqyHR0NUP/7cSA5BfCo4uueH3BGt5OoMOAwQVuY/hW6rWJffHJ3vOqNCOa5we8s17VfHesLB1w==
X-Received: by 2002:a9d:1c1:: with SMTP id e59mr1217368ote.150.1582733962049;
        Wed, 26 Feb 2020 08:19:22 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n22sm936425otj.36.2020.02.26.08.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:19:21 -0800 (PST)
Received: (nullmailer pid 10533 invoked by uid 1000);
        Wed, 26 Feb 2020 16:19:20 -0000
Date:   Wed, 26 Feb 2020 10:19:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, mark.rutland@arm.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200226161920.GA22995@bogus>
References: <20200220152831.18614-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220152831.18614-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 20, 2020 at 04:28:31PM +0100, Benjamin Gaignard wrote:
> Convert stpmic1 bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 3:
> - put $erf under allOf keyword
> - for each regulator node add the list of supported regulator properties
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
>  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
>  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 354 +++++++++++++++++++++
>  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
>  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
>  5 files changed, 354 insertions(+), 164 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt b/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> deleted file mode 100644
> index eb8e83736c02..000000000000
> --- a/Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -STMicroelectronics STPMIC1 Onkey
> -
> -Required properties:
> -
> -- compatible = "st,stpmic1-onkey";
> -- interrupts: interrupt line to use
> -- interrupt-names = "onkey-falling", "onkey-rising"
> -	onkey-falling: happens when onkey is pressed; IT_PONKEY_F of pmic
> -	onkey-rising: happens when onkey is released; IT_PONKEY_R of pmic
> -
> -Optional properties:
> -
> -- st,onkey-clear-cc-flag: onkey is able power on after an
> -  over-current shutdown event.
> -- st,onkey-pu-inactive: onkey pull up is not active
> -- power-off-time-sec: Duration in seconds which the key should be kept
> -        pressed for device to power off automatically (from 1 to 16 seconds).
> -        see See Documentation/devicetree/bindings/input/input.yaml
> -
> -Example:
> -
> -onkey {
> -	compatible = "st,stpmic1-onkey";
> -	interrupt-parent = <&pmic>;
> -	interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
> -	interrupt-names = "onkey-falling", "onkey-rising";
> -	power-off-time-sec = <10>;
> -};
> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt b/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> deleted file mode 100644
> index afd45c089585..000000000000
> --- a/Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -* STMicroelectronics STPMIC1 Power Management IC
> -
> -Required properties:
> -- compatible:		: "st,stpmic1"
> -- reg:			: The I2C slave address for the STPMIC1 chip.
> -- interrupts:		: The interrupt line the device is connected to.
> -- #interrupt-cells:	: Should be 1.
> -- interrupt-controller:	: Marks the device node as an interrupt controller.
> -			    Interrupt numbers are defined at
> -			    dt-bindings/mfd/st,stpmic1.h.
> -
> -STPMIC1 consists in a varied group of sub-devices.
> -Each sub-device binding is be described in own documentation file.
> -
> -Device			 Description
> -------			------------
> -st,stpmic1-onkey	: Power on key, see ../input/st,stpmic1-onkey.txt
> -st,stpmic1-regulators	: Regulators, see ../regulator/st,stpmic1-regulator.txt
> -st,stpmic1-wdt		: Watchdog, see ../watchdog/st,stpmic1-wdt.txt
> -
> -Example:
> -
> -#include <dt-bindings/mfd/st,stpmic1.h>
> -
> -pmic: pmic@33 {
> -	compatible = "st,stpmic1";
> -	reg = <0x33>;
> -	interrupt-parent = <&gpioa>;
> -	interrupts = <0 2>;
> -
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -
> -	onkey {
> -		compatible = "st,stpmic1-onkey";
> -		interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
> -		interrupt-names = "onkey-falling", "onkey-rising";
> -		power-off-time-sec = <10>;
> -	};
> -
> -	watchdog {
> -		compatible = "st,stpmic1-wdt";
> -	};
> -
> -	regulators {
> -		compatible = "st,stpmic1-regulators";
> -
> -		vdd_core: buck1 {
> -			regulator-name = "vdd_core";
> -			regulator-boot-on;
> -			regulator-min-microvolt = <700000>;
> -			regulator-max-microvolt = <1200000>;
> -		};
> -		vdd: buck3 {
> -			regulator-name = "vdd";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-boot-on;
> -			regulator-pull-down;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> new file mode 100644
> index 000000000000..92b0ac8ddfde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> @@ -0,0 +1,354 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/st,stpmic1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectonics STPMIC1 Power Management IC bindings
> +
> +description: STMicroelectronics STPMIC1 Power Management IC
> +
> +maintainers:
> +  - pascal Paillet <p.paillet@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stpmic1
> +
> +  reg:
> +    const: 0x33
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  onkey:
> +    type: object
> +
> +    allOf:
> +      - $ref: ../input/input.yaml
> +
> +    properties:
> +      compatible:
> +        const: st,stpmic1-onkey
> +
> +      interrupts:
> +        items:
> +          - description: onkey-falling, happens when onkey is pressed. IT_PONKEY_F of pmic
> +          - description: onkey-rising, happens when onkey is released. IT_PONKEY_R of pmic
> +
> +      interrupt-names:
> +        items:
> +          - const: onkey-falling
> +          - const: onkey-rising
> +
> +      st,onkey-clear-cc-flag:
> +        description: onkey is able power on after an over-current shutdown event.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,onkey-pu-inactive:
> +        description: onkey pull up is not active
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      power-off-time-sec:
> +        minimum: 1
> +        maximum: 16
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - interrupt-names
> +
> +    additionalProperties: false
> +
> +  watchdog:
> +    type: object
> +
> +    allOf:
> +      - $ref: ../watchdog/watchdog.yaml
> +
> +    properties:
> +      compatible:
> +        const: st,stpmic1-wdt
> +
> +      timeout-sec: true
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  regulators:
> +    type: object
> +
> +    description: |
> +      Available Regulators in STPMIC1 device are:
> +        - buck1 for Buck BUCK1
> +        - buck2 for Buck BUCK2
> +        - buck3 for Buck BUCK3
> +        - buck4 for Buck BUCK4
> +        - ldo1 for LDO LDO1
> +        - ldo2 for LDO LDO2
> +        - ldo3 for LDO LDO3
> +        - ldo4 for LDO LDO4
> +        - ldo5 for LDO LDO5
> +        - ldo6 for LDO LDO6
> +        - vref_ddr for LDO Vref DDR
> +        - boost for Buck BOOST
> +        - pwr_sw1 for VBUS_OTG switch
> +        - pwr_sw2 for SW_OUT switch
> +      Switches are fixed voltage regulators with only enable/disable capability.
> +
> +    properties:
> +      compatible:
> +        const: st,stpmic1-regulators
> +
> +    patternProperties:
> +      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> +        description: STPMIC1 voltage regulators supplies
> +
> +      "^(ldo[1-2,5-6])$":

No need for the ().

> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml

These can be moved to the previous pattern prop and removed from each 
entry.

> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag

And this. And then just do 'st,mask-reset: true'.

> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-min-microvolt: true
> +          regulator-max-microvolt: true
> +          regulator-over-current-protection: true
> +          regulator-enable-ramp-delay: true
> +
> +        additionalProperties: false
> +
> +      "^(ldo3)$":

Fixed string, not a pattern.

> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-min-microvolt: true
> +          regulator-max-microvolt: true
> +          regulator-allow-bypass: true
> +          regulator-over-current-protection: true

Not sure this is worth its own entry just to exclude 
'regulator-enable-ramp-delay'.

> +
> +        additionalProperties: false
> +
> +      "^(ldo4)$":
> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-over-current-protection: true
> +
> +        additionalProperties: false
> +
> +      "^(buck[1-4])$":
> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-min-microvolt: true
> +          regulator-max-microvolt: true
> +          regulator-initial-mode: true
> +          regulator-pull-down: true
> +          regulator-over-current-protection: true
> +          regulator-enable-ramp-delay: true
> +
> +        additionalProperties: false
> +
> +      "^(vref_ddr)$":
> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +
> +        additionalProperties: false
> +
> +      "^(boost)$":
> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-over-current-protection: true
> +
> +        additionalProperties: false
> +
> +      "^(pwr_sw[1-2])$":
> +        type: object
> +
> +        allOf:
> +          - $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-over-current-protection: true
> +          regulator-active-discharge: true
> +
> +        additionalProperties: false
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/st,stpmic1.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pmic@33 {
> +        compatible = "st,stpmic1";
> +        reg = <0x33>;
> +        interrupt-parent = <&gpioa>;
> +        interrupts = <0 2>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        onkey {
> +          compatible = "st,stpmic1-onkey";
> +          interrupts = <IT_PONKEY_F 0>,<IT_PONKEY_R 1>;
> +          interrupt-names = "onkey-falling", "onkey-rising";
> +          power-off-time-sec = <10>;
> +        };
> +
> +        watchdog {
> +          compatible = "st,stpmic1-wdt";
> +        };
> +
> +        regulators {
> +          compatible = "st,stpmic1-regulators";
> +
> +          ldo6-supply = <&v3v3>;

Not documented. And didn't warn because an 'additionalProperties: false' 
is missing.

> +
> +          buck1 {
> +            regulator-name = "vdd_core";
> +            interrupts = <IT_CURLIM_BUCK1 0>;
> +            st,mask-reset;
> +            regulator-boot-on;
> +            regulator-min-microvolt = <700000>;
> +            regulator-max-microvolt = <1200000>;
> +          };
> +
> +          buck3 {
> +            regulator-name = "vdd";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-boot-on;
> +            regulator-pull-down;
> +          };
> +
> +          buck4 {
> +            regulator-name = "v3v3";
> +            interrupts = <IT_CURLIM_BUCK4 0>;
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +          };
> +
> +          ldo6 {
> +            regulator-name = "v1v8";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-over-current-protection;
> +          };
> +        };
> +      };
> +    };
> +
> +...
