Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB466E3FC2
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Apr 2023 08:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjDQG0F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Apr 2023 02:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDQG0E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Apr 2023 02:26:04 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C7D3590
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Apr 2023 23:26:02 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id xd13so27335063ejb.4
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Apr 2023 23:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712760; x=1684304760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8005m9JW0vGW0UfCMKyUcDD6dIBBZcS5nNmkKpBmKk=;
        b=K7frBaGavpTkAbOifHAXYz5WPLPNbjOOV6Gx+7zpGOVB898DE8zbSaxXsQUOlGr7jX
         uNACbAlpPPEgU5pVShJ8EC6LHSE+5RenE1wEXEU+MhF65Y/PLSmZQ8NrN+rMLmqQlG0C
         s02VwQkOzukKCRtmz9UXSYos5rl0TdrF+LR9UPcxszr237kO1khn6/j0INUeXtBDM4WK
         Z5XBO8sgjLtJ/UMHUtEgAwqZu7O3Yq2pVaDqImSmt1jiqGbVKT4GQGD7k+sviIyjnkAN
         UFbcOK7tArFOOInvF+Ar5qkUtk1xgri/aWjVbsDYqu8Dxin7MwHWRQhdoVq2KwuOiX8v
         tooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712761; x=1684304761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8005m9JW0vGW0UfCMKyUcDD6dIBBZcS5nNmkKpBmKk=;
        b=ftfgbWAfkaSR5t836F1ZrkuuuZK+6/SVZ0hKRDfgszscXaqgs9zmVi8Mlf+XTrz7MW
         89p/EnfZ/OFyOz4GV3asO6BpZyEZgz81+DMnH2rpLKxkzfl81JEFgdCJtZ4TBqRLC62v
         ovRg1wKd+losE9Ylk8CbCoEO6IZbDtFubIYSmWUPncU8g0V7X2HjWCXPKB+VFqPBHtJy
         tK3Y0YvfAO+e9W9m01+L4tkZWTqIme08o8yTd0Xoen3XIX03tUL6J4PSpw/86LfKvclY
         RjD3qXVQTuS8HGtO8bSzf5lNc+NHKd95TgRI5nbhsTdcdPvK5IjYNDQK6X4Ng/o6z0lm
         wbVA==
X-Gm-Message-State: AAQBX9f8G9e/KukGGpAAP5MDnkpF3/IRmOm+9hewQsSGDI5QDYfuWvcp
        BHJN6lGdCcGw4NPi5NqfwRbBig==
X-Google-Smtp-Source: AKy350aKPDBA32s5V1FjgWFbfXT4gDhhqE0AzgOMSi01OXFPFf/ADNi8xJi/XfHr+oF6OGclDLlVSA==
X-Received: by 2002:a17:906:16c4:b0:94f:3338:12a2 with SMTP id t4-20020a17090616c400b0094f333812a2mr4923166ejd.33.1681712760724;
        Sun, 16 Apr 2023 23:26:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906c18400b0094c3ac3c2bbsm6100573ejz.212.2023.04.16.23.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:26:00 -0700 (PDT)
Message-ID: <0e5b1bcf-21c2-d446-6fd9-5516af417e8d@linaro.org>
Date:   Mon, 17 Apr 2023 08:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] dt-bindings: watchdog: alphascale-asm9260: convert to
 DT schema
Content-Language: en-US
To:     Om Parikh <hack3r-0m@proton.me>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417051641.3832314-1-hack3r-0m@proton.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417051641.3832314-1-hack3r-0m@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 17/04/2023 07:17, Om Parikh wrote:
> Makes alphascale-asm9260 dt bindings adhere to the dt json-schema
> by replacing txt file with yaml file.
> 
> CHANGELOG from v1:

Changelog goes after ---

> - drop quotes in "$ref" value
> - update compatible string from board name to node name
> - drop "Olof Johansson" from maintainers
> - update "compatible" property from enum to const
> - drop generic reset description
> 
> Signed-off-by: Om Parikh <hack3r-0m@proton.me>
> ---
>  .../watchdog/alphascale,asm9260-wdt.yaml      | 69 +++++++++++++++++++
>  .../bindings/watchdog/alphascale-asm9260.txt  | 35 ----------
>  2 files changed, 69 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml b/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
> new file mode 100644
> index 000000000000..aefcb0cf3e3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/alphascale,asm9260-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Alphascale asm9260 Watchdog timer
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +maintainers:
> +  - Oleksij Rempel <linux@rempel-privat.de>
> +
> +properties:
> +  compatible:
> +    const: alphascale,asm9260-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: source clock, used for tick counter
> +      - description: ahb gate
> +
> +  clock-names:
> +    items:
> +      - const: mod
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: wdt_rst
> +
> +  timeout-sec: true

Drop this one, not needed as it comes from watchdog.yaml.

> +
> +  alphascale,mode:
> +    description: to specify the reset mode of operation

You miss some explanation what is debug for example.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [hw, sw, debug]

default: hw

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false


Best regards,
Krzysztof

