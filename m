Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3291950C964
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Apr 2022 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbiDWKzE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Apr 2022 06:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbiDWKzD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Apr 2022 06:55:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464261FB0D1
        for <linux-watchdog@vger.kernel.org>; Sat, 23 Apr 2022 03:52:06 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id m20so102920ejj.10
        for <linux-watchdog@vger.kernel.org>; Sat, 23 Apr 2022 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yGPt/mNpWWrOQ8JYPp5zOeJM1AwLjJHd/VxeaRoxS/g=;
        b=FeMJBzVYJCu5iuakegHQoq7T1UjOgKxYLZFFM04aOBON6ouKF4bnGG7ZQo/H5hjAEJ
         f8r98k6BVN2PIt+uquahOGQaXsYqyZhCAvUM8nArvBjRO6VEABfiW+0iZVXcjvsduIQV
         o97CWrVW5DwXYw2IX+TDQDaIrTUZBycoBGs1ZT1PHI+q2pceXJMTexV1DwQO7QmQG1vL
         gaWFUCcQRRTkmaOholvifwz3lgga/JAZ+Y6ZooVWDTrVdHONgeQndyrVZVwsl+qwjoRd
         uR3jrtePUwKYuBm97v/jBzsjd5IbuO3zngfykL8+j3lTs38cEKZWQlWS+uLFhdy9hT1b
         U2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yGPt/mNpWWrOQ8JYPp5zOeJM1AwLjJHd/VxeaRoxS/g=;
        b=JUUIvRRqiEB3EEv6GS74PRaC5IRVhG+F/9ooAtWcrm6dXtMGJZ4ADAobVuZb8C9hXa
         DAGejuyq3FQgesWddUYFScoch935Gv7BcVZWQ7twryEzKHeWBcvMKoG2/dshyYsqJm4j
         eXxvzzqxT6CCK/rwg2sAOsHggmzYdAQ+9e+EFBekp7kn2CuQDCH0nZdJDvNypduXH6bd
         caGosXj1nm4RcLvwC3uVSfPFs9lrjjahxlWp5Mufugfr/gMnQSrT/UMc1SKCtO9VtyOy
         5GxHx8A0ZJMqif1xdHpX5Xv71AOEWINvLMisKA3fUOupjPrWeLoCV79vy4vtB5AlkM7W
         vsNQ==
X-Gm-Message-State: AOAM530DvBDtpn+ZNi6+z1ocRNAyNq+D9tcGNQ0JFVy1ZKot4/t1CLl2
        +Fk/yMvL6nJVYSI0t5Ip5oZM4A==
X-Google-Smtp-Source: ABdhPJzD3HJ7Q5n2ETTVurxNh/apy7DsoaCyPYbmEli1g0u6/qoBGi40V+p82qf13/UcXbuET4Qd/A==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id hp3-20020a1709073e0300b006da8c5a6d4amr8141145ejc.585.1650711124878;
        Sat, 23 Apr 2022 03:52:04 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b26-20020a1709062b5a00b006e8daae2359sm1565521ejg.95.2022.04.23.03.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 03:52:04 -0700 (PDT)
Message-ID: <8c565aa7-3b3b-3034-3301-c87c7265384b@linaro.org>
Date:   Sat, 23 Apr 2022 12:52:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 06/11] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, joel@jms.id.au,
        arnd@arndb.de, openbmc@lists.ozlabs.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-7-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220421192132.109954-7-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/04/2022 21:21, nick.hawkins@hpe.com wrote:
> ---
>  .../bindings/watchdog/hpe,gxp-wdt.yaml        | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> new file mode 100644
> index 000000000000..c20da146352f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
> @@ -0,0 +1,30 @@
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

allOf goes after maintainers, before properties.

> +
> +maintainers:
> +  - Nick Hawkins <nick.hawkins@hpe.com>
> +  - Jean-Marie Verdun <verdun@hpe.com>
> +
> +properties:
> +  compatible:
> +    const: hpe,gxp-wdt
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    watchdog0:  watchdog {

Doubled space.

> +      compatible = "hpe,gxp-wdt";
> +    };
> +


Best regards,
Krzysztof
