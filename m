Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38CF616FC6
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Nov 2022 22:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbiKBVaX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 17:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbiKBVaS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 17:30:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDE865EE;
        Wed,  2 Nov 2022 14:30:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0BDF861C35;
        Wed,  2 Nov 2022 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE2CC433C1;
        Wed,  2 Nov 2022 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667424616;
        bh=T3mJmhSAuT7wBGow+rimgDEfkaf+AtaXS+wjdVZAWpY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ugk8JScx/1xcMRGpQ6MuVKfbLOM9maaGPP7V8GwC4FjONW9jrgLtgcmKWJ7r118xH
         JTNddBLr4SxSJf8kZkg1Q94gwAN4LIfcg1urR8x+8GdM1kgAhaaEp5jqwd8ZMtjOTu
         ap1JaToLYpiNIrEcUTrKbV1jdjZBqbm2nkndLWiAikXNmSaE/zJ+BNhJxxg8Q9fz/p
         1WeSXsOTnboVn4ujPEGOiXyyoyGKbMkpUgIhH7FI7+jKeK36rVQ2gExdVg/dIU3gTg
         TIvhKBusGtwhrQ8bkdh1GeuaN2ZyRynzIKucKviOAyIBnnH+sOI+3iWjRiGcPGouFm
         C22lcsJREaztw==
Message-ID: <5cb7cad9-bd58-ad5b-0a0c-eb2f879663c4@kernel.org>
Date:   Wed, 2 Nov 2022 17:30:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RESEND] dt-bindings: watchdog: gpio: Convert bindings to
 YAML
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20221102194436.123316-1-marex@denx.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221102194436.123316-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/11/2022 15:44, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> NOTE: The Maintainer entry should likely be changed, although it seems
>       like this driver and its matching bindings are now unmaintained.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Even if driver does not have updated maintainers entry, generic rules apply.


> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt | 28 ------------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 28 deletions(-)
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
> index 0000000000000..6b014d60c9471
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/linux,wdt-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO-controlled Watchdog
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
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

Several other properties were required.

> +
> +allOf:
> +  - $ref: "watchdog.yaml#"

Drop quotes


Best regards,
Krzysztof

