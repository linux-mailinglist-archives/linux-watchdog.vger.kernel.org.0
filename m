Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B016A7C75
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Mar 2023 09:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCBIWV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Mar 2023 03:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjCBIWU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Mar 2023 03:22:20 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E264432502
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Mar 2023 00:22:18 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id eg37so64182360edb.12
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Mar 2023 00:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677745337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQkFiCGrNnQkWtgw7qzycgixCypKYWTeHdnNYRv+yvc=;
        b=NPJ/4jZAZsaYRcdPalUd0zftkNmzx+zmNbzqj27PNtMNGhnzL0UXklYr1oasj7IgW/
         nrzCfBiSX8htFVpMo+NejHspmjwaJXeSBYAPnYiOiianqv5hg4nze024+Y8zpel/UrPy
         sVgi4D5IoaLvHper1k/AiRjaT/4F5HQ3qnz4TVQ9LvsuR+SqB7OADmwvKeO1zYH+prAi
         Z8o0cTAZO/2+6CwAAKlNHnN0oX1Mv9ajutGnFMKGRa4AtFBVrwumqpYxwBqY0RmLtWKj
         j4grcD0r5rYOZV0UNnaAH9A35wzVYYaA6wUT7MvK///iMrm8rGYaSXFeu8HDwlf/0xNd
         S46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677745337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQkFiCGrNnQkWtgw7qzycgixCypKYWTeHdnNYRv+yvc=;
        b=4+HhtzdipjFtJWKvJTosdcaYTTCf6tnxlsEeRi6EuX2WgO1c3lI6QyCk43+6PFVy+v
         VFrIrb8+5g7rQKFo5VneT0i34W6+dnih2IcZ+hU7hKsdryJ6P7RlPIbVPFPvctVYyP9a
         eEG4LEh/9p0CEQ5waQjZK8wLzUaFvLSw1pOZmSd7UGn11yuKcA18tEhlCdhGKJJB8WBb
         yRVid91eC3wk8ghmAOUzbjV/Bt1aVDF35YdE5BxAozRaL8NNGFI85VmB/NXCek/ZRQ51
         07/P1wfYM2U2O6e8xyyemx2nc20+g4tX6/5KqA22X/wZkJbWUe36WDhZfCjV5QCQ22mU
         J4aw==
X-Gm-Message-State: AO0yUKUmztbQgAj8djL25ipj8J5qJybR2L3cqucuNr64TDNDUBVe9zGa
        9xc2iL0dp71cknicfNBfeIBJ5A==
X-Google-Smtp-Source: AK7set/RI4RWdLwfaaaMIzk7fQfHWivqF+t8SrEiYFFLJicH287e5t09jelLb3TUeCEuPPiE9JJOWw==
X-Received: by 2002:a17:906:d290:b0:8f4:86a9:748d with SMTP id ay16-20020a170906d29000b008f486a9748dmr1231069ejb.12.1677745337377;
        Thu, 02 Mar 2023 00:22:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id gv28-20020a1709072bdc00b008b8ae79a72bsm6859783ejc.135.2023.03.02.00.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 00:22:16 -0800 (PST)
Message-ID: <d6bf51f9-ef5e-910a-1b75-7c168746dd5c@linaro.org>
Date:   Thu, 2 Mar 2023 09:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: watchdog: migrate rt2880 text bindings to
 YAML
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230301091957.2824172-1-sergio.paracuellos@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230301091957.2824172-1-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 01/03/2023 10:19, Sergio Paracuellos wrote:
> Ralink RT2880 Watchdog bindings used text format, so migrate them to YAML.
> There are some additions to the binding that were not in the original
> txt file. This binding is used in RT2880, RT3050, RT3352, RT3883, RT5350,
> and MT7620 SoCs. To properly match all dts nodes included in openWRT git
> trees we need to add to the schema 'reset' and 'reset-names'. 'reset-names'

Sorry, but out of tree undocumented properties cannot be added just
"because they exist". Otherwise what would be the point of
documentation? It would be enough to add any stuff anywhere and claim -
it's used in my xxxyyyzzz, so we must support it".

> property is always string 'wdt' so maintain that as const in the schema.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/watchdog/ralink,rt2880-wdt.yaml  | 47 +++++++++++++++++++
>  .../bindings/watchdog/rt2880-wdt.txt          | 18 -------
>  2 files changed, 47 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/rt2880-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> new file mode 100644
> index 000000000000..c96bf2e61364
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/ralink,rt2880-wdt.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/ralink,rt2880-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ralink Watchdog Timers
> +
> +maintainers:
> +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +properties:
> +  compatible:
> +    const: ralink,rt2880-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: wdt

Drop reset names.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

unevaluatedProperties instead, because you want properties from
watchdog.yaml.



Best regards,
Krzysztof

