Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E7730171E
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 18:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbhAWRSo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 12:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbhAWRSn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 12:18:43 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4F0C06174A;
        Sat, 23 Jan 2021 09:18:02 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id s2so6232353otp.5;
        Sat, 23 Jan 2021 09:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vxje5HFtKBXBK9qDlHfB6ZBP4bIRVgYVUANhRt6Vho0=;
        b=CSiBnf56sat39TnjzDEjTwpTTYgF3Zw6qVsxfoo2/VLBnUPpNzm2QKEqJMwoojV2YM
         npop06VNXmXEboy9lFpa10uULKmtmuFdq+sYdG+WwdEgwiGXE+bM1xErsq+Vm06TfFmO
         6spOAyJILL+1mjZqMiv/MebEZY5yAnl0OKnOQCfAkb5bNaKaiYqUchDiyc7p1clXxVUQ
         pxoLvFbKRxxlwPrTFCFJRLV8mbO168BUBCMmlGFFCKlApnoB2IYVzIYd12sHD3pRFKp0
         VP6cOwsEPJ0ZiWJnkwkJ5mj9YRQyu4309fbggFZWP48vmKf1Q8z1GVf3scCO6kdp5eNa
         hX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vxje5HFtKBXBK9qDlHfB6ZBP4bIRVgYVUANhRt6Vho0=;
        b=C4UkXwySb+TGsrP+Ii275tw/7BAHVziFbQfHQvNHvcbi36k0SaRajKD7lI2N+Z8iOv
         14i4ZSC62g2Cp3vrecuSu34t1QuKg/p/aGhyF+n5clxFcDKZct+DVo9tt8ramjBJALSM
         8X8aBN0FAB8SEICCLVAt97pX9wq4CnEHYqNvH/2KVSMn/Rz5jva4sLmAu1QXMr9w2Kfi
         h+mHaB9oowZBdeId/jjR0BLU2sGBUnR0fPCxHUHYvfVqiREn5fyCQok/gn70aEY4z1Jq
         Esfh7UStoL4EcRgPYzK3A+P4WkA+jU+Wshamx7GF1w4Wo65rJ3aLYI7RZjr9wvRNuv5u
         1BPQ==
X-Gm-Message-State: AOAM5328MolUof9d+c7dAi5c1QK5GYYo2XJkyiU4kITsub7NnW96EhAU
        8PFrW7D3D8Hk97R7q7DbKdI=
X-Google-Smtp-Source: ABdhPJxCd/0VdCwlgACGAFc6RTPsxxsRIvYlcJ+RmP1RoaXKUhhwkpnfz8fSy/OlP5E4JpNWeqK/7g==
X-Received: by 2002:a9d:1925:: with SMTP id j37mr7346181ota.42.1611422282278;
        Sat, 23 Jan 2021 09:18:02 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k15sm2402023otp.10.2021.01.23.09.18.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 09:18:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 09:18:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mgross@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com, chen.yong.seow@intel.com
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: Add bindings for Intel
 Keem Bay SoC
Message-ID: <20210123171800.GA55726@roeck-us.net>
References: <cover.1608141131.git.vijayakannan.ayyathurai@intel.com>
 <8c4dad4fb8ba644607aa9379d5ec70d8707d7e75.1608141131.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4dad4fb8ba644607aa9379d5ec70d8707d7e75.1608141131.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Dec 17, 2020 at 02:32:47AM +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Add Device Tree binding document for Watchdog IP in the Intel Keem Bay SoC.
> 
> Acked-by: Mark Gross <mgross@linux.intel.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/intel,keembay-wdt.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> new file mode 100644
> index 000000000000..1437ff8a122f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/intel,keembay-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel Keem Bay SoC non-secure Watchdog Timer
> +
> +maintainers:
> +  - Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - intel,keembay-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: interrupt specifier for threshold interrupt line
> +      - description: interrupt specifier for timeout interrupt line
> +
> +  interrupt-names:
> +    items:
> +      - const: threshold
> +      - const: timeout
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #define KEEM_BAY_A53_TIM
> +
> +    watchdog: watchdog@2033009c {
> +        compatible = "intel,keembay-wdt";
> +        reg = <0x2033009c 0x10>;
> +        interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "threshold", "timeout";
> +        clocks = <&scmi_clk KEEM_BAY_A53_TIM>;
> +    };
> +
> +...
