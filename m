Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2B718083B
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Mar 2020 20:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgCJThX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Mar 2020 15:37:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42116 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgCJThX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Mar 2020 15:37:23 -0400
Received: by mail-ot1-f68.google.com with SMTP id 66so14355725otd.9;
        Tue, 10 Mar 2020 12:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GiGH+kf0e9zr45mlrfM5b4we/G65q5yAgOGauiL01s8=;
        b=orJ7y28PBh3tnG+gW30KFDbE8+U/WQYpKyD84eAJSVugVPRz9AflrpOk4FJnskML++
         rFBA9VvsimnBkXlypLnlQXB2YrX48/z22Y31z+95jnhum/QWApIOqUwNCKERD4eA9iYI
         OISu2YT8xKb46QhQ/3bl303nWr3BNgFFODVvCid6VaUnY5Nnr4RoTaGgkr9FOLfJV5U2
         E3iOTAsJ7RdfBkiEB6Ypoo7INbvCDXzlAj9ZygESzkOLH0ofHs+XyhBYNX94zB1RaOCP
         RnRoEdtQ2aqK0UbOv8LA/TWUS37r2MFE1xmuDMSWC/Et+8KGy5BpLcBimzhwvkOsIRBp
         9SDw==
X-Gm-Message-State: ANhLgQ1AT8IGt2skk8oEBWm0pXI4zJVa7hPjz0EfyaYdCMf/WyTYR+pP
        0E/9dDp5Lo3+VbeKYf9blNIfZ+U=
X-Google-Smtp-Source: ADFU+vv5Ufou1gAlKDX6XtyEl/Yqxyi6/Ef2fceOO2APym87C2PtkEFkU+SgtAU4IcyOIenAnsywvQ==
X-Received: by 2002:a05:6830:1581:: with SMTP id i1mr4949574otr.349.1583869042434;
        Tue, 10 Mar 2020 12:37:22 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v2sm3574361oiv.41.2020.03.10.12.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:37:21 -0700 (PDT)
Received: (nullmailer pid 30746 invoked by uid 1000);
        Tue, 10 Mar 2020 19:37:21 -0000
Date:   Tue, 10 Mar 2020 14:37:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv2 1/4] dt-bindings: watchdog: Add support for TI K3 RTI
 watchdog
Message-ID: <20200310193721.GA24150@bogus>
References: <20200302200426.6492-1-t-kristo@ti.com>
 <20200302200426.6492-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302200426.6492-2-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Mar 02, 2020 at 10:04:23PM +0200, Tero Kristo wrote:
> TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
> used to implement a windowed watchdog functionality. Windowed watchdog
> will generate an error if it is petted outside the time window, either
> too early or too late.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  .../bindings/watchdog/ti,rti-wdt.yaml         | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> new file mode 100644
> index 000000000000..3813f59fb6c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

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
> +description: |+

You can drop '|+' as there's no formatting to preserve.

> +  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
> +  Interrupt) IP module. This timer adds a support for windowed watchdog
> +  mode, which will signal an error if it is pinged outside the watchdog
> +  time window, meaning either too early or too late. The error signal
> +  generated can be routed to either interrupt a safety controller or
> +  to directly reset the SoC.
> +

Reference the common watchdog.yaml schema.

> +properties:
> +  compatible:
> +    enum:
> +      - ti,rti-wdt

Should be SoC specific possibly with a fallback.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
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
> +    main_rti0: rti@2200000 {

watchdog@...

> +        compatible = "ti,rti-wdt";
> +        reg = <0x0 0x2200000 0x0 0x100>;
> +        clocks = <&k3_clks 252 1>;
> +        power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;

Not documented.

> +        assigned-clocks = <&k3_clks 252 1>;
> +        assigned-clock-parents = <&k3_clks 252 5>;

Not documented.

> +    };
> -- 
> 2.17.1
> 
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
