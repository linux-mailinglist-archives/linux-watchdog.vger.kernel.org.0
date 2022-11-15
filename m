Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9702C629A3F
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Nov 2022 14:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbiKON37 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 15 Nov 2022 08:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238130AbiKON3v (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 15 Nov 2022 08:29:51 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A2F108B;
        Tue, 15 Nov 2022 05:29:49 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso16933413pjc.0;
        Tue, 15 Nov 2022 05:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xk+OpOZEAXUa3Tyg2mS46z4nyFJq+12Wxup6TV57oo=;
        b=Jwh3aB+V0BzxXaySqVdjDWDSrUrnMmOHgU1BcepLC9kdfOFndgdB4iv6uRFc7k+dNe
         YcvZ9NUT6NYQzq7NlAMqUMv0uHW4/zoxHr+4K1rcLVfTJaBR07Si4FHs10ipGtNryS8J
         E8t3gKTx0RgG/JVff4Ua56QCnkr6s3BEkNFdK6GKcYmvRBOKZIy25jLRj2T14bPIyHgZ
         rQLsQvwDLWyU4Mo3aq96VkeLWyCLl7E9GQZ+f1TPvtZU2uPiPtHxtLrxD1oKOMkBcTJg
         uylpUMUy1QfQIQGMkDXQT1rEehWS9hz7xPaaVqysAEWOVmuVPsl5z/+qE8cowIC/Dy1f
         uEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xk+OpOZEAXUa3Tyg2mS46z4nyFJq+12Wxup6TV57oo=;
        b=sdUBjX/LgnhyOmZZ8yOEO/4Gj4jkP29BxUS1VTIAsrez7m1aZ+6r2TEew78Lkexve9
         TLiuwhh3GUydrXXcxce0TmhSur1smLRlzvKqaO/cf09bRNxb7AlRHbZhna7v3Io4cWzk
         Kqot8h6PxRFiOgYHvAETnmv9+pbnjPKr1maNzgyD8Of0sqyasKaFBueHzTzsWVCxex/K
         U/nSNr/PpBNCwtxIiQcPVm5x6HaU5+D6DFKRwAJ7B0/JdU3KmMmIeyjh9VL8stP5g6mV
         h0EO14Ly9/+wmAAx+3LuqLfyCLeLH6y3FDgoiWVW2vPh1nj5ekdRvnHyebj8SrAFV4+e
         /SmA==
X-Gm-Message-State: ANoB5pkV4mga8Ksv77f3dkyAKt1rwntQa8ALJYl0oBfh+HH3lTw2yD/u
        PY0jI9wBnLMGb/41d3VdKs4=
X-Google-Smtp-Source: AA0mqf5odsnNn6PmZPgMQGKC1R7U+FfL4zlUUlWIDd5CUb3EUGbqei55Lf+V3rZ1sajQcAeYCJyhVw==
X-Received: by 2002:a17:90a:fd12:b0:218:494d:e9d2 with SMTP id cv18-20020a17090afd1200b00218494de9d2mr605916pjb.50.1668518988996;
        Tue, 15 Nov 2022 05:29:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902ce0d00b0017f5ad327casm9787344plg.103.2022.11.15.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:29:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 15 Nov 2022 05:29:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <20221115132947.GB4189373@roeck-us.net>
References: <20221107160338.27910-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107160338.27910-1-marex@denx.de>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 07, 2022 at 05:03:38PM +0100, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add missing required: properties
>     - Drop quotes around ref: referenced schema file name
> V3: - Add Guenter as maintainer of the bindings
>     - Add RB from Rob
> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 -----------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 47 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> deleted file mode 100644
> index 198794963786b..0000000000000
> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* GPIO-controlled Watchdog
> -
> -Required Properties:
> -- compatible: Should contain "linux,wdt-gpio".
> -- gpios: From common gpio binding; gpio connection to WDT reset pin.
> -- hw_algo: The algorithm used by the driver. Should be one of the
> -  following values:
> -  - toggle: Either a high-to-low or a low-to-high transition clears
> -    the WDT counter. The watchdog timer is disabled when GPIO is
> -    left floating or connected to a three-state buffer.
> -  - level: Low or high level starts counting WDT timeout,
> -    the opposite level disables the WDT. Active level is determined
> -    by the GPIO flags.
> -- hw_margin_ms: Maximum time to reset watchdog circuit (milliseconds).
> -
> -Optional Properties:
> -- always-running: If the watchdog timer cannot be disabled, add this flag to
> -  have the driver keep toggling the signal without a client. It will only cease
> -  to toggle the signal when the device is open and the timeout elapsed.
> -
> -Example:
> -	watchdog: watchdog {
> -		/* ADM706 */
> -		compatible = "linux,wdt-gpio";
> -		gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
> -		hw_algo = "toggle";
> -		hw_margin_ms = <1600>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> new file mode 100644
> index 0000000000000..c729c96a5dc75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO-controlled Watchdog
> +
> +maintainers:
> +  - Guenter Roeck <linux@roeck-us.net>
> +
> +properties:
> +  compatible:
> +    const: linux,wdt-gpio
> +
> +  gpios:
> +    description: gpio connection to WDT reset pin
> +    maxItems: 1
> +
> +  hw_algo:
> +    description: The algorithm used by the driver.
> +    enum: [ level, toggle ]
> +
> +  hw_margin_ms:
> +    description: Maximum time to reset watchdog circuit (milliseconds).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - gpios
> +  - hw_algo
> +  - hw_margin_ms
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    watchdog {
> +        compatible = "linux,wdt-gpio";
> +        gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
> +        hw_algo = "toggle";
> +        hw_margin_ms = <1600>;
> +    };
> -- 
> 2.35.1
> 
