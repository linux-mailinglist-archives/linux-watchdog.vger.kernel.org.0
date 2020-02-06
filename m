Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0537154D1D
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 21:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBFUpd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 15:45:33 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41709 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgBFUpd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 15:45:33 -0500
Received: by mail-pg1-f196.google.com with SMTP id l3so3337590pgi.8;
        Thu, 06 Feb 2020 12:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qIQ8hjlDUhZcArK+Q5WsTl5GNAhaa++UBQ6Modhac+E=;
        b=kGXdVo1CwnaIsuzelyXAq3wU52Wy+xu8e8AniD53tA++AtdgqX9lM8WkZ/NU2azDTW
         Fc7QMKKtkYl0Ng5dSyE0kV45Ear9kYfRDvtBbV5U7qWNitUeY9rG9SNq565eq4tzmqfi
         XJ0pDI55OXmA8T5pV0+X8uV5FX9lx2oIMI133wKCENPRFEvb/Anax4IOi/iCBRvq2yzI
         5WWZwjFIQRadR04VR/pxPEiRaJRy5PRzxaChuBGeH96fSjc5hUUTSnxzy7wjPSAPXd6B
         brRaggwlPb14D/UKBlBhxyZzkq2MdAT9wBcHTAOL376vEG0tuNLwMc52HBGBXnw/eRb3
         SCsg==
X-Gm-Message-State: APjAAAVltdXATsmB11FQJsxbcN5Yem9qKBOL7DGufTiL0QQc/fD+wwaJ
        8VxG59Eukk+zZByPh279zA==
X-Google-Smtp-Source: APXvYqxp0gb4DCovJEikyOC6US+MZnvndVVAY5P6ZUyW0coT14JeNLGYWiVC5j97cQxJXe5/sJ3gbQ==
X-Received: by 2002:a62:78c1:: with SMTP id t184mr5777570pfc.222.1581021932559;
        Thu, 06 Feb 2020 12:45:32 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id e84sm262700pfh.149.2020.02.06.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:31 -0800 (PST)
Received: (nullmailer pid 22868 invoked by uid 1000);
        Thu, 06 Feb 2020 18:28:20 -0000
Date:   Thu, 6 Feb 2020 18:28:20 +0000
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, mark.rutland@arm.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Convert stpmic1 bindings to json-schema
Message-ID: <20200206182820.GA12162@bogus>
References: <20200130154315.6260-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130154315.6260-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 30, 2020 at 04:43:15PM +0100, Benjamin Gaignard wrote:
> Convert stpmic1 bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 ---
>  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ------
>  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 205 +++++++++++++++++++++
>  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 -------
>  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 --
>  5 files changed, 205 insertions(+), 164 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt


> diff --git a/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> new file mode 100644
> index 000000000000..5db86be683dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> @@ -0,0 +1,205 @@
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
> +allOf:
> +  - $ref: ../input/input.yaml
> +  - $ref: ../regulator/regulator.yaml

The properties these define don't apply to the parent node here.

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

input.yaml goes here.

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

watchdog.yaml here.

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
> +    required:
> +      - compatible
> +
> +patternProperties:
> +  "^(buck[1-4]|ldo[1-6]|vref_ddr|boost|)$":

Should be a child of 'regulators'

> +    type: object
> +
> +    properties:
> +      st,mask-reset:
> +        description: mask reset for this regulator,
> +                     the regulator configuration is maintained during pmic reset.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      regulator-over-current-protection: true
> +
> +  "^(pwr_sw[1-2])$":
> +    type: object
> +
> +    properties:
> +      interrupts:
> +        maxItems: 1
> +
> +      regulator-over-current-protection: true
> +      regulator-active-discharge: true
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

Not documented.

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
