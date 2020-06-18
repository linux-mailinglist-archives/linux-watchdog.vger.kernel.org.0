Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF47F1FF8F6
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Jun 2020 18:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgFRQPz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Jun 2020 12:15:55 -0400
Received: from david.siemens.de ([192.35.17.14]:37673 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728169AbgFRQPz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Jun 2020 12:15:55 -0400
X-Greylist: delayed 317 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jun 2020 12:15:53 EDT
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05IG9r1B018927
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Jun 2020 18:09:54 +0200
Received: from [167.87.74.25] ([167.87.74.25])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05IG9p9m011107;
        Thu, 18 Jun 2020 18:09:51 +0200
Subject: Re: [PATCHv4 1/4] dt-bindings: watchdog: Add support for TI K3 RTI
 watchdog
To:     Tero Kristo <t-kristo@ti.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org
References: <20200312095808.19907-1-t-kristo@ti.com>
 <20200312095808.19907-2-t-kristo@ti.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d576a40f-46fb-7ad9-7bfe-11891f9867a6@siemens.com>
Date:   Thu, 18 Jun 2020 18:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200312095808.19907-2-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12.03.20 10:58, Tero Kristo wrote:
> TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
> used to implement a windowed watchdog functionality. Windowed watchdog
> will generate an error if it is petted outside the time window, either
> too early or too late.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v4:
>   * changed license to dual
>   * added documentation for missing properties
>   * added ref to watchdog.yaml
>   * renamed main_rti0 to watchdog0 in example
> 
>  .../bindings/watchdog/ti,rti-wdt.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> new file mode 100644
> index 000000000000..e83026fef2e9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/ti,rti-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 SoC Watchdog Timer
> +
> +maintainers:
> +  - Tero Kristo <t-kristo@ti.com>
> +
> +description:
> +  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
> +  Interrupt) IP module. This timer adds a support for windowed watchdog
> +  mode, which will signal an error if it is pinged outside the watchdog
> +  time window, meaning either too early or too late. The error signal
> +  generated can be routed to either interrupt a safety controller or
> +  to directly reset the SoC.
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,j7-rti-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clocks-parents:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +
> +examples:
> +  - |
> +    /*
> +     * RTI WDT in main domain on J721e SoC. Assigned clocks are used to
> +     * select the source clock for the watchdog, forcing it to tick with
> +     * a 32kHz clock in this case.
> +     */
> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
> +
> +    watchdog0: rti@2200000 {
> +        compatible = "ti,rti-wdt";

At some stage, you changed the compatible string to something
J721e-specific. This one wasn't updated.

> +        reg = <0x0 0x2200000 0x0 0x100>;
> +        clocks = <&k3_clks 252 1>;
> +        power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
> +        assigned-clocks = <&k3_clks 252 1>;
> +        assigned-clock-parents = <&k3_clks 252 5>;
> +    };
> 

And where is the binding for the AM65x? I know that PG1 has nice
erratum, but I would expect PG2 to be fine and register-wise compatible, no?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
