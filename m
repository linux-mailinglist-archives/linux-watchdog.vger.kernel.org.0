Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDBFF164798
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Feb 2020 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgBSO7q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 09:59:46 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37941 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSO7q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 09:59:46 -0500
Received: by mail-oi1-f193.google.com with SMTP id r137so4490263oie.5;
        Wed, 19 Feb 2020 06:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b0M4AU/OktLu6nw7hjE6KvxeRkIXGUmWVLhDAqIZxis=;
        b=r4Ay4l6AfxX9LsfMruDoE3fRTYREJyByn1IWNm3gipbY9g1cpD2jEeuCtK05YQjWuO
         kpLP25ZIqIasi+1PSv6WbvB6ia+d4Dzj2nNJNpnLUVnXfrm2p+NvnF1xuLNLteQ3QiSm
         jMus3S92/kR4PYw6VTauXoRS08r3+jEPe0NJQZ5GTISJrXAqjrHRaKGTrVzkgE84Xbl4
         AECLXo0kC/tMc6JjXpCZl8Fi9Ukaw3Ptw9PpxxoG/EVaEzFEqfynEEGBp3JSY8ktGrD9
         SnH9Qda36eYdw/uaosDCfBZjwUBvVBHJiTD32XUJsaS3IYjIpq+ongIuewp+d/sOJtL+
         ilBw==
X-Gm-Message-State: APjAAAWyQ5b9usmW217/Pwd1VwGsVCxNuKizbiidGXQ2xsej6ecqMXxc
        iVX+q3MDwfjUrOnN7h0LJw==
X-Google-Smtp-Source: APXvYqyn7n3QHJiot9xZtfGrEy4dbgN3mat4XOKLFrgw1HpBASc/gh36XeFSUP+DCdg5Ex6R/6UXvg==
X-Received: by 2002:aca:b703:: with SMTP id h3mr4845658oif.148.1582124384158;
        Wed, 19 Feb 2020 06:59:44 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n17sm703996otq.46.2020.02.19.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 06:59:43 -0800 (PST)
Received: (nullmailer pid 14856 invoked by uid 1000);
        Wed, 19 Feb 2020 14:59:42 -0000
Date:   Wed, 19 Feb 2020 08:59:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, mark.rutland@arm.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200219145942.GA7517@bogus>
References: <20200207105135.25074-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207105135.25074-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 07, 2020 at 11:51:35AM +0100, Benjamin Gaignard wrote:
> Convert stpmic1 bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - document -supply properties
> - add $ref in nodes
> - move patternProperties under 'regulators' node
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 ---
>  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ------
>  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 214 +++++++++++++++++++++
>  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ------
>  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 --
>  5 files changed, 214 insertions(+), 164 deletions(-)
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
> index 000000000000..2d1c70512c42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> @@ -0,0 +1,214 @@
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
> +    $ref: ../input/input.yaml

Has to be under an 'allOf' or everything else here is ignored.

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
> +  watchdog:
> +    type: object
> +
> +    $ref: ../watchdog/watchdog.yaml

Same here.

> +
> +    properties:
> +      compatible:
> +        const: st,stpmic1-wdt
> +
> +    required:
> +      - compatible
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
> +      "^(buck[1-4]|ldo[1-6]|vref_ddr|boost)$":
> +        type: object
> +
> +        $ref: ../regulator/regulator.yaml
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
> +          regulator-over-current-protection: true
> +
> +      "^(pwr_sw[1-2])$":
> +        type: object
> +
> +        $ref: ../regulator/regulator.yaml
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          regulator-over-current-protection: true
> +          regulator-active-discharge: true

No regulator properties are required?

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
> diff --git a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt b/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> deleted file mode 100644
> index 6189df71ea98..000000000000
> --- a/Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -STMicroelectronics STPMIC1 Voltage regulators
> -
> -Regulator Nodes are optional depending on needs.
> -
> -Available Regulators in STPMIC1 device are:
> -  - buck1 for Buck BUCK1
> -  - buck2 for Buck BUCK2
> -  - buck3 for Buck BUCK3
> -  - buck4 for Buck BUCK4
> -  - ldo1 for LDO LDO1
> -  - ldo2 for LDO LDO2
> -  - ldo3 for LDO LDO3
> -  - ldo4 for LDO LDO4
> -  - ldo5 for LDO LDO5
> -  - ldo6 for LDO LDO6
> -  - vref_ddr for LDO Vref DDR
> -  - boost for Buck BOOST
> -  - pwr_sw1 for VBUS_OTG switch
> -  - pwr_sw2 for SW_OUT switch
> -
> -Switches are fixed voltage regulators with only enable/disable capability.
> -
> -Optional properties:
> -- st,mask-reset: mask reset for this regulator: the regulator configuration
> -  is maintained during pmic reset.
> -- regulator-over-current-protection:
> -    if set, all regulators are switched off in case of over-current detection
> -    on this regulator,
> -    if not set, the driver only sends an over-current event.
> -- interrupts: index of current limit detection interrupt
> -- <regulator>-supply: phandle to the parent supply/regulator node
> -	each regulator supply can be described except vref_ddr.
> -- regulator-active-discharge: can be used on pwr_sw1 and pwr_sw2.
> -
> -Example:
> -regulators {
> -	compatible = "st,stpmic1-regulators";
> -
> -	ldo6-supply = <&v3v3>;
> -
> -	vdd_core: buck1 {
> -		regulator-name = "vdd_core";
> -		interrupts = <IT_CURLIM_BUCK1 0>;
> -		st,mask-reset;
> -		regulator-pull-down;
> -		regulator-min-microvolt = <700000>;
> -		regulator-max-microvolt = <1200000>;
> -	};
> -
> -	v3v3: buck4 {
> -		regulator-name = "v3v3";
> -		interrupts = <IT_CURLIM_BUCK4 0>;
> -
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -	};
> -
> -	v1v8: ldo6 {
> -		regulator-name = "v1v8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -		regulator-over-current-protection;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt b/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> deleted file mode 100644
> index 7cc1407f15cb..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -STMicroelectronics STPMIC1 Watchdog
> -
> -Required properties:
> -
> -- compatible : should be "st,stpmic1-wdt"
> -
> -Example:
> -
> -watchdog {
> -	compatible = "st,stpmic1-wdt";
> -};
> -- 
> 2.15.0
> 
