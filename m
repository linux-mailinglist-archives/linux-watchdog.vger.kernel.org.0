Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA624B0A0E
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Feb 2022 10:56:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239214AbiBJJ43 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Feb 2022 04:56:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbiBJJ41 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Feb 2022 04:56:27 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E08DC64
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 01:56:28 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 939973FFFD
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644486986;
        bh=lQAi25ad0WedYqAR8W5lfFiy2PNOb0q0WyI0GNyN3vw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=avWfIgEZEWbOXpmfDOyIijAt9HPDnqbNhnTOERpfCP4cBDh1KhXl5aPL72rk3F5ff
         6lKJNoanffcNMioMY9iX2ZRRG2M3ZwuhQ2qqGsOJfulOCC9WXXx+csOx1YVk72M5Ly
         MEPWh7b7tGKq8gEFxG7gd2g9lDseKjF+bComyHYa3rxuCN8iqgV2o0LhNh/EJ8yttM
         0V8xjrpTL1llDc9NgOQ4Ss3mhGquiUB8+WtKHQnef5sd3o3QsYWyX2AeQA9tfG7/Ub
         5tL9E+Av/Utx+iYqCVZaNQK9bC75BTASbRelYuKKHezH7JgK3swYfIJ//pOh8kBKk+
         KDNeWRVDvFOdg==
Received: by mail-ed1-f72.google.com with SMTP id m4-20020a50cc04000000b0040edb9d147cso3041490edi.15
        for <linux-watchdog@vger.kernel.org>; Thu, 10 Feb 2022 01:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lQAi25ad0WedYqAR8W5lfFiy2PNOb0q0WyI0GNyN3vw=;
        b=cMFoaIc461pzZXHgBtRJ6KDctXQiMFNZXSVe7ImE8P/wkZIwlrxAC+lZugp43cT5fK
         3LrTKvZSJT09nqfwLnvHlKvoz+ePdELOApYXSh3r8ii7vRmLh/2X6jEPePgSzDGeQoiy
         1xb6iFqcWbBssx9MTPykIy1IcnP5GCfp58suyj/GKDBxnpCpufoCud3FfQxLliPxAYEv
         660M4l34/z2Mj5dGDlk/IIErPBF2tfkKz0dFuF2zWXvYjQ3gVQB2txNQzBnnq4L9Ubq+
         JFCjuD3sej2yMNKMyGdWG6/3J53EtC6Ry+tGjzPyZl/fLBGDqpn9h3Gi7uWsM0+p++KV
         /3GA==
X-Gm-Message-State: AOAM530z1OnPf2FmDkwVm9yEmc5QzG0hkdHuPpwPvL5Yl9As/6BqzIGQ
        9AgewB+vSfXZ94GR68pZ64UgypAOqoV2eIiTONe4lwaxQ8g3DguDRTY8PB6Zbc+jBAgDi6wUyu9
        DaucFWv/kObUIo14ePAJVs8snaflLlgQ6bFFQLbwuQZYt
X-Received: by 2002:a17:906:2ccc:: with SMTP id r12mr5545717ejr.549.1644486986321;
        Thu, 10 Feb 2022 01:56:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc52uTv0kpoyAJ0Kps4Wr6p3N4LOPiiiqved+a3jIg857MB5O1jSYCvd0RnB95/Rnk+wfurg==
X-Received: by 2002:a17:906:2ccc:: with SMTP id r12mr5545700ejr.549.1644486986041;
        Thu, 10 Feb 2022 01:56:26 -0800 (PST)
Received: from [192.168.0.97] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id wq18sm4370531ejb.149.2022.02.10.01.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 01:56:25 -0800 (PST)
Message-ID: <1c5b2019-2258-f95c-eee3-32cef1c98c7a@canonical.com>
Date:   Thu, 10 Feb 2022 10:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] dt-bindings: watchdog: convert faraday,ftwdt010 to
 yaml
Content-Language: en-US
To:     Corentin Labbe <clabbe@baylibre.com>, linux@roeck-us.net,
        robh+dt@kernel.org, wim@linux-watchdog.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220210093427.2813601-1-clabbe@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220210093427.2813601-1-clabbe@baylibre.com>
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

On 10/02/2022 10:34, Corentin Labbe wrote:
> Convert watchdog/faraday,ftwdt010.txt to yaml.
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
>  .../bindings/watchdog/faraday,ftwdt010.txt    | 22 ------
>  .../bindings/watchdog/faraday,ftwdt010.yaml   | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 22 deletions(-)
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
> index 000000000000..64e9c414cc60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/faraday,ftwdt010.yaml
> @@ -0,0 +1,67 @@
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
> +          - const: cortina,gemini-watchdog
> +          - const: faraday,ftwdt010
> +      - items:
> +          - const: moxa,moxart-watchdog
> +          - const: faraday,ftwdt010

It looks like you duplicated these two entries. This should be an enum
followed by a const.


Best regards,
Krzysztof
