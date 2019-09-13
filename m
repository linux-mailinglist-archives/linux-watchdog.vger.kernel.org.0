Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96F3CB2228
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2019 16:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbfIMOgR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Sep 2019 10:36:17 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43671 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730683AbfIMOgR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Sep 2019 10:36:17 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so2781748oih.10;
        Fri, 13 Sep 2019 07:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IZweNP6pGhkpCVRU4pHgxO7MjDpvq1eLjI7vhm5/kwY=;
        b=VrVJ/QiL0oJazuvOOhvuEjxR3poSR7UE2Abaaqo65I944WigLPINq+FdC4TFouu1kS
         pY6kl/3Jta0kOAm2DHGZ04ZafjhChVhhD1yX8Df5wOu7fwT26ooDSsRSIFCD4hobJLAd
         hfYEHHQ5jRPOgOm4uAw5zNmGEsBhiPDBxxwnhIOGu4YJ+Wy7QGIZ/RMcIqU9gQ7nNk3e
         E9vyifCEg4dp2rZTOVVuBGSPekV8SD/XyesPKrGmsWKiJoDU4dgfF8de2s1g/xGzccSJ
         bK7UL0X3wl9l4wUYqDOsLt/f1rJuNs0Ra+uVGvGU8sdWY8DV6AaJqXIaVp1wzAiFZcqq
         T3Eg==
X-Gm-Message-State: APjAAAWr9/hNqScBpVhrOqFyh0nd3qWUb/eekCPzoQbwWJeh9mw0bBcd
        E7JfTppLB2kE4yRq7mOAbA==
X-Google-Smtp-Source: APXvYqxFO5cMX7VpsHLxNDMF4sPgkaqT/8XHmi68R3Ufb4qy9ll4kmCyy5XLZJXtKcoCrTHmfxEZOg==
X-Received: by 2002:aca:4ccd:: with SMTP id z196mr3508195oia.46.1568385376414;
        Fri, 13 Sep 2019 07:36:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b67sm962221oii.21.2019.09.13.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 07:36:15 -0700 (PDT)
Date:   Fri, 13 Sep 2019 15:36:15 +0100
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert Samsung SoC watchdog
 bindings to json-schema
Message-ID: <20190912170145.GA17889@bogus>
References: <20190907144541.16949-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190907144541.16949-1-krzk@kernel.org>
X-Mutt-References: <20190907144541.16949-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Sep 07, 2019 at 04:45:40PM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
>  .../bindings/watchdog/samsung-wdt.yaml        | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml


> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> new file mode 100644
> index 000000000000..39f1ca3bc4db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/samsung-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC Watchdog Timer Controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |+
> +  The Samsung's Watchdog controller is used for resuming system operation
> +  after a preset amount of time during which the WDT reset event has not
> +  occurred.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s3c2410-wdt                   # for S3C2410
> +      - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
> +      - samsung,exynos5250-wdt                # for Exynos5250
> +      - samsung,exynos5420-wdt                # for Exynos5420
> +      - samsung,exynos7-wdt                   # for Exynos7
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  samsung,syscon-phandle:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description:
> +      Phandle to the PMU system controller node (in case of Exynos5250
> +      and Exynos5420).
> +
> +  timeout-sec:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Watchdog timeout in seconds.

We need a common schema for this and the node name.

Also note that anything with a unit suffix already has a type 
definition, so we don't really need to define it again.

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos5250-wdt
> +              - samsung,exynos5420-wdt
> +    then:
> +      required:
> +        - samsung,syscon-phandle
> +
> +examples:
> +  - |
> +    watchdog@101d0000 {
> +      compatible = "samsung,exynos5250-wdt";
> +      reg = <0x101D0000 0x100>;
> +      interrupts = <0 42 0>;
> +      clocks = <&clock 336>;
> +      clock-names = "watchdog";
> +      samsung,syscon-phandle = <&pmu_syscon>;
> +    };
> -- 
> 2.17.1
> 

