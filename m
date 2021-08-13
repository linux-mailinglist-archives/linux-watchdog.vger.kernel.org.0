Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470373EBBA7
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Aug 2021 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhHMRrY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Aug 2021 13:47:24 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43763 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhHMRrS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Aug 2021 13:47:18 -0400
Received: by mail-oi1-f179.google.com with SMTP id bf25so8229272oib.10;
        Fri, 13 Aug 2021 10:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nruG5wbXF+Ql+fb23mE0km1GyZSsSCOkm8QTSIH25Qs=;
        b=mtu10bz6s35Vjd5OjTN703PWOVwXwmRnTe3CvkOmc2/CDzw6ZS/KNGp2xDvCMmXryk
         EYHYFoairDqeO5Kx3BnSMzWv3f/fHRLs7dj8tYu4JAUn9lYJSBpo6scWoZbcwm2GGg8c
         RXGaDs2mjcgoKW67UoPbRQcyuBpLlwjchHlX2lE3jEZlzMnArOGsTjdAsStQzWBb+KLm
         nb0IRfP3FQcMa8QFY7J6Z73rwt/Oalmb2X8mClo7FNfLXsswHH0mGjbQwlTKxFdX/tN4
         uZvu0Szfek1bZMHTMtr4ytqav1x6qJm8TttBRs/nqaukzU8iPRsFnbAMio2/o4OZIRAj
         LQmQ==
X-Gm-Message-State: AOAM531rw/CawjRF8hjCvVmbeluIlqgCxdJDYjiHZo+1actyC+iJNqWy
        oMq2a0HUjYUQu7hEBz67DQ==
X-Google-Smtp-Source: ABdhPJwmioe5mchEce3/NXdPmIyIO3ho3zWNNzXefOSZaEwZx1f/l2+dUrbHFkGd9aBwM/Xzf4ogsA==
X-Received: by 2002:a05:6808:6cc:: with SMTP id m12mr3167933oih.51.1628876811264;
        Fri, 13 Aug 2021 10:46:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g13sm206497oos.39.2021.08.13.10.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:46:50 -0700 (PDT)
Received: (nullmailer pid 3746395 invoked by uid 1000);
        Fri, 13 Aug 2021 17:46:49 -0000
Date:   Fri, 13 Aug 2021 12:46:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: sunxi: Add compatible for
 R329
Message-ID: <YRawCZ0BWEzTE4El@robh.at.kernel.org>
References: <20210805045716.46141-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 04, 2021 at 11:57:14PM -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
> 
> Since 24 MHz / 750 == 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
> 
> R329 also adds two new registers, to allow software to immediately drive
> the SoC reset signal.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v1 to v2:
>  - Switch from enum to const
>  - Add descriptions to "clocks" items
> 
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 9aa3c313c49f..8fa5b0d32381 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -24,6 +24,7 @@ properties:
>                - allwinner,sun50i-a100-wdt
>                - allwinner,sun50i-h6-wdt
>                - allwinner,sun50i-h616-wdt
> +              - allwinner,sun50i-r329-wdt
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
> @@ -33,7 +34,18 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: High-frequency oscillator input, divided internally
> +      - description: Low-frequency oscillator input, only found on some variants
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: hosc
> +      - const: losc
>  
>    interrupts:
>      maxItems: 1
> @@ -44,6 +56,24 @@ required:
>    - clocks
>    - interrupts
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun50i-r329-wdt
> +
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +
> +    clock-names:
> +      minItems: 2
> +
> +  required:
> +    - clock-names

Needs an else clause with 'maxItems: 1' or is the 2nd clock now valid 
for all?

> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.31.1
> 
> 
