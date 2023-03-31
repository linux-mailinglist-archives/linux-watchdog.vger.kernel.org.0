Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03D86D19DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjCaIaw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 04:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjCaIau (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 04:30:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22A61BEA
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 01:30:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j11so27883140lfg.13
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHrQkYwU28+YD0YgjEi8GJzUf2Kpg4wy4ZfXmfoC9os=;
        b=qQEa6Arqk2jHRxOPJwePLJZ0lVdGe1lzg6LAd4bLAmraUorwhqpU8J9TDdiaWsQIQy
         9ohcLaLbBecWH7LEUxZu2Z+aCgKgbyDlEWT87A52MBRV8Zalwj+0ShPvs904im8FpAhw
         RHXlw2MZut2MXwEQMWGWYrXo8QXxk3AbHT5lMBq+27IZEphLPdFPNRMxYr20xkAwlgGR
         L+Ea0ylBXOS1+HUyp40AHILesmnvUUyI8HUm201ZaEhb9YVC+OBShr/cAAKtbSVt+c5w
         WMDsX3czzZuPH411QFRS8LJJHksDXgp3sO9KfFV08AYYJ066qQQk3FgShmlYRyFOu55T
         I5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHrQkYwU28+YD0YgjEi8GJzUf2Kpg4wy4ZfXmfoC9os=;
        b=TOuVRTPMekFbcMQfc29KZikDHp9d8+XD96r8bMcaZmNErXb4JzDocDCokmaQmuGbEr
         zHU+TA13d3criiSxzyAAemebb1QXQ3bxMyeA9ic6lCvfqz6J0mq2pezqtj+soS5RbDwQ
         4IZIJrZNe8CSe4ftj4zLsnbfRuaEvXB/MuoG08qrDiZm5DA1tFX8MeRLfBWDzxpnKtw2
         AIYjdUuyQMm9bIh7kRadyguFL8USLSbSLqV1hwFwt8OGz7xPNSpCnQ4k8AeAoyHKtehQ
         +oJdJz9Svw2iLn0OlI/vU5eQ86P5VDVTy53isdqu67W0sYNd4NWcTzWuNmn3rzAdAx7p
         QDZQ==
X-Gm-Message-State: AAQBX9ciB8J/AvmXh//dC5zaANF0FuwBzEOSs67P/s/mivZwrMeEluRi
        UJFYsZ8a1A7sBhDabzSPpG6GNA==
X-Google-Smtp-Source: AKy350ZGTisHUdzdU2gV2A1Zc7DwpzW8O/gAkiAXLJ6ry1oPid6IBkMp3vxlSNHWH7lps6pU2KUhFA==
X-Received: by 2002:ac2:5a4e:0:b0:4a4:68b9:19f9 with SMTP id r14-20020ac25a4e000000b004a468b919f9mr7614294lfn.33.1680251445961;
        Fri, 31 Mar 2023 01:30:45 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id l9-20020ac25549000000b004d5a4f63402sm281893lfk.213.2023.03.31.01.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:30:45 -0700 (PDT)
Message-ID: <471dfaaa-8ca5-c4a0-471d-8e4b12ed355b@linaro.org>
Date:   Fri, 31 Mar 2023 10:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Convert brcm,kona-wdt.txt to brcm,kona-wdt.yaml
Content-Language: en-US
To:     Nikita Bondarenko <n2h9z4@gmail.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, f.fainelli@gmail.com,
        rjui@broadcom.com, sbranden@broadcom.com
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
References: <20230330182447.51674-1-n2h9z4@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330182447.51674-1-n2h9z4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 30/03/2023 20:24, Nikita Bondarenko wrote:
> Signed-off-by: Nikita Bondarenko <n2h9z4@gmail.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Missing commit msg.

> ---
>  .../bindings/watchdog/brcm,kona-wdt.txt       | 15 -------
>  .../bindings/watchdog/brcm,kona-wdt.yaml      | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
> deleted file mode 100644
> index 2b86a00e351d..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Broadcom Kona Family Watchdog Timer
> ------------------------------------
> -
> -This watchdog timer is used in the following Broadcom SoCs:
> -  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
> -
> -Required properties:
> -  - compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
> -  - reg: memory address & range
> -
> -Example:
> -	watchdog@35002f40 {
> -		compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
> -		reg = <0x35002f40 0x6c>;
> -	};
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
> new file mode 100644
> index 000000000000..ffc4870bdb57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/brcm,kona-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom Kona Family Watchdog Timer
> +
> +description: |
> +  This watchdog timer is used in the following Broadcom SoCs:
> +  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>

No, it should be device maintainer.

> +
> +allOf:
> +  - $ref: "watchdog.yaml#"

Drop quotes.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm11351-wdt
> +      - brcm,kona-wdt
> +
> +  reg:
> +    maxItems: 1
> +    description: memory address & range

Drop description.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog@35002f40 {
> +      compatible = "brcm,bcm11351-wdt";
> +      reg = <0x35002f40 0x6c>;
> +    };
> +  - |
> +    watchdog@35002f40 {

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +      compatible = "brcm,kona-wdt";
> +      reg = <0x35002f40 0x6c>;
> +    };

Keep only one example.


Best regards,
Krzysztof

