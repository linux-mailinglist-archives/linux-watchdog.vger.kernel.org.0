Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 218144B1281
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Feb 2022 17:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244103AbiBJQR3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Feb 2022 11:17:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243990AbiBJQR3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Feb 2022 11:17:29 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2874FC29
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 08:17:30 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E6CF8405EC
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644509848;
        bh=g6QE7ds2byVUPRAmXXnezb98jQ3Ciok2epjMz+QKaeU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dRZamUyrGx8NR+qUQf83iV2S7VF/EfDykN05GI2AC/z3iIx5D1/pRS/NghVPOpgkY
         XsYBdpJW8vBqUYXBsV5vdO/tLQHXNs/3GHTqvQ5YJnk5+AS0U1XrbB4qXnr9X8/Zsf
         erMKEBUo//CIq9gyLnu74WiNW0i36pUgAt6gx/stBJjXzHgOuSXZhS1EPs2sl0aQo1
         yxqm8PFcJVs1uWjl6g8O6wm51d+0s+5EMrDxqkiTlpqff+RNA7TJKHnrN5qLVqhm7K
         UMVTvidAy65U0KSV2kRNwkFxz3NWhISJd8GNtO6Zej1bN3Pn7Tj4qXugQZMQZc0gxA
         DCryOj2c0TEYw==
Received: by mail-ed1-f71.google.com with SMTP id dn20-20020a05640222f400b0040f8cdfb542so3613208edb.3
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 08:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g6QE7ds2byVUPRAmXXnezb98jQ3Ciok2epjMz+QKaeU=;
        b=mQYhvIRZOEc83KN58UNJatIPYJJaZfmCoc/L4d0pCWjBJy/AnACpzBSTpUleglO1PU
         YvDvOgr8eMolojANAA13V654serkM12s4WxEwcjZ8H2HfGJTH1Qgz3e9NlautqI/hMe7
         0rhKcJ2ePT3Uk3Rys5SNz9Yst3B9jRQqAD0ssNREALzWAF3ZZj+LHJ9anxrVWw+WDbTz
         U58+UpjIqzhKd3SfvmSueYRWvSsc22ceEv61fYeEeE1rIlSbZijstwo3B/Exzpz+fh0r
         b57PZIRZFsSiUt8IUdVx1a8dU7ESa+XafRdsGkOP5Hdp8pTbsXLJf92wLlaRjaRVafuC
         OdDQ==
X-Gm-Message-State: AOAM533JrJOKMSHp90wBpj0mN6zLi02/R9z85mbgJXe0NYg5eNKzagkJ
        V9LnoDK8evK+TU4gDouyOy/K26Ay5i+EvIfh1ZI91ToFIZVvaLaJraVxHA6g3JapiPRx/H0xAiL
        mp4Ecu41qXUAxiZzI2vvRznKSnCpacgOTvvRDn8qQmcp6
X-Received: by 2002:a05:6402:3492:: with SMTP id v18mr9198286edc.345.1644509846144;
        Thu, 10 Feb 2022 08:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz022B9e0ZAfVuWMzgucY3m74/1+NS8nZSUh8fsyf0+32xhVV6P2uT+MCE0To8/aXu94C79eA==
X-Received: by 2002:a05:6402:3492:: with SMTP id v18mr9198269edc.345.1644509845938;
        Thu, 10 Feb 2022 08:17:25 -0800 (PST)
Received: from [192.168.0.99] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h15sm3179019ejz.134.2022.02.10.08.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 08:17:25 -0800 (PST)
Message-ID: <373b87ad-8bcf-e3f3-60fd-14d933fb2f4f@canonical.com>
Date:   Thu, 10 Feb 2022 17:17:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] dt-bindings: watchdog: convert faraday,ftwdt010 to
 yaml
Content-Language: en-US
To:     Corentin Labbe <clabbe@baylibre.com>, linux@roeck-us.net,
        robh+dt@kernel.org, wim@linux-watchdog.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220210155450.2939129-1-clabbe@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220210155450.2939129-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/02/2022 16:54, Corentin Labbe wrote:
> Converts watchdog/faraday,ftwdt010.txt to yaml.
> This permits to detect missing properties like clocks and resets or
> compatible like moxa,moxart-watchdog.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Changes since v1:
> - Added myself as maintainer as requested by Linus
> - Added $ref to watchdog.yaml
> - Removed useless quotes
> - Added blank lines between properties
> - Removed timeout-sec as already provided by watchdog.yaml
> 
> Change since v2:
> - rewrite compatible section
> 
>  .../bindings/watchdog/faraday,ftwdt010.txt    | 22 -------
>  .../bindings/watchdog/faraday,ftwdt010.yaml   | 66 +++++++++++++++++++
>  2 files changed, 66 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
> deleted file mode 100644
> index 9ecdb502e605..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Faraday Technology FTWDT010 watchdog
> -
> -This is an IP part from Faraday Technology found in the Gemini
> -SoCs and others.
> -
> -Required properties:
> -- compatible : must be one of
> -  "faraday,ftwdt010"
> -  "cortina,gemini-watchdog", "faraday,ftwdt010"
> -- reg : shall contain base register location and length
> -- interrupts : shall contain the interrupt for the watchdog
> -
> -Optional properties:
> -- timeout-sec : the default watchdog timeout in seconds.
> -
> -Example:
> -
> -watchdog@41000000 {
> -	compatible = "faraday,ftwdt010";
> -	reg = <0x41000000 0x1000>;
> -	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
> new file mode 100644
> index 000000000000..e7b90ba41093
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/faraday,ftwdt010.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Faraday Technology FTWDT010 watchdog
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +  - Corentin Labbe <clabbe@baylibre.com>
> +
> +description: |
> +  This is an IP part from Faraday Technology found in the Gemini
> +  SoCs and others.
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: faraday,ftwdt010
> +      - items:
> +        - enum:
> +          - cortina,gemini-watchdog
> +          - moxa,moxart-watchdog
> +        - const: faraday,ftwdt010

I think you have indentation warnings.

> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: PCLK
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Are you sure your DTSes don't have warnings? You include watchdog.yaml
schema (good) so here should be unevaluatedProperties to accept ones
mentioned there.

Just add "timeout-sec" to example below to see the error.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    watchdog@41000000 {
> +      compatible = "faraday,ftwdt010";
> +      reg = <0x41000000 0x1000>;
> +      interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +  - |
> +    watchdog: watchdog@98500000 {
> +      compatible = "moxa,moxart-watchdog", "faraday,ftwdt010";
> +      reg = <0x98500000 0x10>;
> +      clocks = <&clk_apb>;
> +      clock-names = "PCLK";
> +    };
> +...


Best regards,
Krzysztof
