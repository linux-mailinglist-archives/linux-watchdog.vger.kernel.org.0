Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C16354D5E7D
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Mar 2022 10:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347525AbiCKJfU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Mar 2022 04:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343854AbiCKJfT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Mar 2022 04:35:19 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A1A1BE0E3
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Mar 2022 01:34:17 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E26CF3F499
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Mar 2022 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646991255;
        bh=TipXjTJr6+EeQa1Bn0UjvOBERTURaDG374mBi9nTu7o=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=uifZArCv0iwnkHdcXum0bCTJVN8oMWgw/8wRlvJyNtAgnyYa2+whlNOOSxZ3Q/Tgo
         +eJ6K8KOE7r6g9bjgSuZS4t3VzlCWErJcZPZyeZlsJScyqFh7vmNjZSm8rETMRMeek
         PmF7acPBHphdp1MWEHkA5YW3Va6Tv1BLrlmfS5HWVOouk/foINRTqhJEt9shG9AX7F
         uvmD+OemuOB3nJdQLZ+b4QlNOEUz0O3RrQrYOlJ8DrX3YKjMa684RCT6yHk+zPRHKd
         KrNfPOFQfxT+GZHIQ1F9Apjb/jm4d9UPTF1DpM5hEUUSC7ESF8KSTkCIsDTG8BNJ2c
         3GbePv2lh7S5Q==
Received: by mail-ej1-f72.google.com with SMTP id q22-20020a1709064cd600b006db14922f93so4643795ejt.7
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Mar 2022 01:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TipXjTJr6+EeQa1Bn0UjvOBERTURaDG374mBi9nTu7o=;
        b=57ocOKSCTk7C5YZW8/4/Vwf6GoG2GVGfKAV1BSLW7QuYKJwgXtFzlr5ebOU5koq0t2
         NpmNXMOfGgAiYTmIzgNfS4KV+rNUi3vg3LiarqwcrbM65oRuVjTt6QVEi1/S7Mu5NzUh
         ui35W3jD46n0d0b5ybubxjyl3hXNyl3WPyZoxpNsbYKfJvUmxQbqyc6z0CTZBdEoWz1/
         pgd9kCEZNDzlDYEBvC3t0+Q9ElProNLfWQ8FPLxAS1+TOCM6Uf0jfncaivPGpDlUnZHP
         4ZDHIbnPWeF1BLQo3DFBeylOGBFOf6lT2B7BoGweZHiotSAuODjY5v/PK0Zej7fDrZ+I
         BBng==
X-Gm-Message-State: AOAM531+rg/XY32Ofph24Lu+Ekvk8dsYCciuG0/qZii2XB+deIu7C0ii
        F8OYVfNGOvWDCTolIMGYGcD+9Ee3MMunoZdqh0SvgppBLBvYis2aaxlQ2nsuGrpdN/GYEDba29j
        pQAsGV+D4GIWKw5HYVIAFgmaeQd7kdQaGMCbWT+joVmFZ
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id q7-20020a1709064cc700b006d07efb049fmr7590408ejt.639.1646991255642;
        Fri, 11 Mar 2022 01:34:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwilYeVFSbzYfGvwO8uQk/e6hBMqrA9GTqbIJ9dpK4F5E1UIJiiyc95/4j9Z0RvNcy8yn3Q2A==
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id q7-20020a1709064cc700b006d07efb049fmr7590387ejt.639.1646991255451;
        Fri, 11 Mar 2022 01:34:15 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b006cf61dfb03esm2718313ejc.62.2022.03.11.01.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:34:14 -0800 (PST)
Message-ID: <c6309ed8-6e74-67d3-304a-f5399d16cc37@canonical.com>
Date:   Fri, 11 Mar 2022 10:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 06/10] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220310195229.109477-1-nick.hawkins@hpe.com>
 <20220310195229.109477-6-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220310195229.109477-6-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/03/2022 20:52, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the hpe gxp watchdog timer binding hpe,gxp-wdt.
> This will enable support for the HPE GXP Watchdog
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  .../bindings/watchdog/hpe,gxp-wdt.yaml        | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> new file mode 100644
> index 000000000000..6044496b4968
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/hpe,gxp-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HPE GXP Controlled Watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +  - Jean-Marie Verdun <verdun@hpe.com>
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-wdt
> +
> +  reg:
> +    items:
> +      - description: WDGRST register
> +      - description: WDGCS register

Why are you mapping each register instead of entire address space? It
won't scale if your new design comes with 10 registers...

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog0:  watchdog@c0000090 {

Skip the label. You also have there double space between label and node
name.

Best regards,
Krzysztof
