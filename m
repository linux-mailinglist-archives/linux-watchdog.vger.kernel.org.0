Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5C8176A17
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2020 02:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCCBjv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 20:39:51 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40282 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgCCBju (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 20:39:50 -0500
Received: by mail-oi1-f194.google.com with SMTP id j80so1353989oih.7;
        Mon, 02 Mar 2020 17:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CAN7Awb4Suu0FczkP1+Oo6j/BOvber6nt3jFMF/4RqE=;
        b=hVQIs/lsla4F+mhejzL2Hzk8RhA8RKOpz4hphLL54zSr/iec8okhCSc6vTPi0ugciW
         WPcNRprb1jzcpciG6wkHI959mNcwOJpf3jJUF5zf9QJPrkmdM20X8P8MlA/3fvoqWXng
         2z2PIOFKI6Yer9nSPhUErHvGEuPKtev+HcLZRRq/zufowWHn04bBvoK7wl5HZCh98Kku
         2AnzO+peu506sFlv7ILQP+I38yJyL1o9nXIjukIVD/KTB0RBUhczzUn39y3063n7N6WP
         ZI9+CQo4ozEhcb4Znx6k/8p+mJktQm7pbHTFLDerB7DEeiA+F15QPJa4QSS0UljCfh/x
         /Wdw==
X-Gm-Message-State: ANhLgQ3vEcySRa7LcW43cytTGnPjY5rNU9ktvtMyH3gSHzvBNht/5TR0
        AuiOJRsiZHRcPrc/hEEdlg==
X-Google-Smtp-Source: ADFU+vtLO/gqzZ9qIsSpT8oI0pA2fSll8NR24JC/o3d6TAkBTcLxs9Py3ZJpqe7oBUHgvcVbW/QB5Q==
X-Received: by 2002:aca:ac86:: with SMTP id v128mr905861oie.178.1583199587464;
        Mon, 02 Mar 2020 17:39:47 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i185sm3367784oib.51.2020.03.02.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 17:39:46 -0800 (PST)
Received: (nullmailer pid 23500 invoked by uid 1000);
        Tue, 03 Mar 2020 01:39:45 -0000
Date:   Mon, 2 Mar 2020 19:39:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, mark.rutland@arm.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200303013945.GA8727@bogus>
References: <20200228105809.23254-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228105809.23254-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 28, 2020 at 11:58:09AM +0100, Benjamin Gaignard wrote:
> Convert stpmic1 bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 4:
> - move on uppder node $ref: ../regulator/regulator.yaml 
> - move fixed strings under properties field
> - remove unneeded () in patternProperties
> - keep ldo3 separate from other ldo properties
> Note:
> - 'st,mask-reset' property stay in each subnode, I don't find
>   the syntax to avoid dupliquate it. 
> - ldo6-supply and all possible *-supply are describe by this regular
>   expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> 
> version 3:
> - put $ref under allOf keyword
> - for each regulator node add the list of supported regulator properties
> 
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
>  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
>  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 338 +++++++++++++++++++++
>  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
>  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
>  5 files changed, 338 insertions(+), 164 deletions(-)
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
> index 000000000000..e9adcd04a48d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> @@ -0,0 +1,338 @@
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
> +    allOf:
> +      - $ref: ../regulator/regulator.yaml

Sigh. Haven't I already said this was at the wrong level once before?

My suggestion was to put this under 
"^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$".

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
> +      ldo3:
> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-min-microvolt: true
> +          regulator-max-microvolt: true
> +          regulator-allow-bypass: true
> +          regulator-over-current-protection: true
> +
> +        additionalProperties: false
> +
> +      ldo4:
> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-over-current-protection: true
> +
> +        additionalProperties: false
> +
> +    patternProperties:
> +      "^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> +        description: STPMIC1 voltage regulators supplies
> +
> +      "^ldo[1-2,5-6]$":
> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag

Move all these to a single definition under 
"^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$" and just do 
'st,mask-reset: true' here.

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
> +      "^buck[1-4]$":
> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
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
> +      "^vref_ddr$":

Not a pattern.

> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +
> +        additionalProperties: false
> +
> +      "^boost$":

And neither is this...

> +        type: object
> +
> +        properties:
> +          interrupts:
> +            maxItems: 1
> +
> +          st,mask-reset:
> +            description: mask reset for this regulator,
> +                         the regulator configuration is maintained during pmic reset.
> +            $ref: /schemas/types.yaml#/definitions/flag
> +
> +          regulator-name: true
> +          regulator-boot-on: true
> +          regulator-always-on: true
> +          regulator-over-current-protection: true
> +
> +        additionalProperties: false
> +
> +      "^pwr_sw[1-2]$":
> +        type: object
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
> +  additionalProperties: false
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
