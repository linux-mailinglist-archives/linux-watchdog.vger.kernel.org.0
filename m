Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70AFA7A327D
	for <lists+linux-watchdog@lfdr.de>; Sat, 16 Sep 2023 22:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbjIPUiB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 16 Sep 2023 16:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjIPUhc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 16 Sep 2023 16:37:32 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4A1F7
        for <linux-watchdog@vger.kernel.org>; Sat, 16 Sep 2023 13:37:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9a648f9d8e3so426352166b.1
        for <linux-watchdog@vger.kernel.org>; Sat, 16 Sep 2023 13:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694896645; x=1695501445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gu0xrBA9e/3ScWNP+chjeCPq60bSd7X+az9Hsey0nCA=;
        b=Sf2yd5X504hJGjQ+aFJH0JoHFcQq66u7Zgj9Irc0orNF7LHRdzhgeFOSuRjI+E7Xp4
         vDQ8H1E29di59p0TCgChxBIB39Hhj8Sd7KYpLqGEmBYZTdDwGprZSpOo1B4aY0Fn/xPX
         qmZWKOFd1Gyo7hrsRKhrH9lTwWFD2hlAvrP4Q7PjYlkSRvSgxn3z64xrPhKTJOzik6+f
         oyQkuPQnfoIDa5uWRhNvWW7dwchvC41Hx+g2lhD9vZRjKdnZ/MdHWa2B7NTE+oWc5Zo4
         IKsEiy6a8fIlcubDS/ShQcbHMq23FrOa9gSWgmhWcQQ6Kmr/V0BOhG5uAuv4WnKR/iW7
         7yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694896645; x=1695501445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gu0xrBA9e/3ScWNP+chjeCPq60bSd7X+az9Hsey0nCA=;
        b=Lh0mhOSuYQOMqeAvxX5HdhTiDVLFYMS/c0uWPTv6jvAWy1HATZYTvVDkHVOYE0BI/e
         rFeVHJ+3CDsjKlHIT3DH8cA6Jc4eEBp0e7fR+PZMzfrI2sP6dORTJQTdX27DohtDqzPW
         3c/Ncr4US6zFBtTRovn8grnGDMS3X3PTHXTnAL9yEHVF+P/UEsPxAuG1wyXeVfrMayiT
         IQ277CaKR7I5yEHL57/D+nAGXGrPpCl3OBvBoBh/uMds3wtiilEHWvg4ww8O/D377CTL
         dGvhFMgi6ZqoNVEpNrw6Sz0do0ysgh2jp5V25wEkxbZSsxdehTp+z2dkmRaJS3GDY0ro
         zmyA==
X-Gm-Message-State: AOJu0YyXtKHNjgzNfgjN3nX8FoE1xtV7SKgVGSddG5CePEWpxwXdaBlT
        014/kB8BFA6mBTy/oZbwMPWM6Q==
X-Google-Smtp-Source: AGHT+IGb4kvGpJuIns3F9diBWd8z81LQpMGK9ZxmAGDOsFhjAZlsKWa9Z6zF37x/Y3GeHA2cPPqcEQ==
X-Received: by 2002:a17:906:2001:b0:9ad:e20f:142b with SMTP id 1-20020a170906200100b009ade20f142bmr2940270ejo.51.1694896644686;
        Sat, 16 Sep 2023 13:37:24 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id u26-20020a170906c41a00b00989828a42e8sm4142097ejz.154.2023.09.16.13.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 13:37:24 -0700 (PDT)
Message-ID: <c42f1653-caa8-731c-e4ef-2d5fe47adc8c@linaro.org>
Date:   Sat, 16 Sep 2023 22:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: watchdog: atmel,at91rm9200-wdt: convert txt
 to yaml
Content-Language: en-US
To:     Nik Bune <n3q5u8@yahoo.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230916154826.84925-1-n3q5u8.ref@yahoo.com>
 <20230916154826.84925-1-n3q5u8@yahoo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230916154826.84925-1-n3q5u8@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/09/2023 17:48, Nik Bune wrote:
> Convert txt file to yaml. 
> Add reg to the list of required properties.
> Add mainteiners from ./scripts/get_maintainer.pl output.
> 
> Signed-off-by: Nik Bune <n3q5u8@yahoo.com>
> ---
>  .../watchdog/atmel,at91rm9200-wdt.yaml        | 31 +++++++++++++++++++
>  .../watchdog/atmel-at91rm9200-wdt.txt         |  9 ------
>  2 files changed, 31 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,at91rm9200-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-at91rm9200-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel,at91rm9200-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,at91rm9200-wdt.yaml
> new file mode 100644
> index 000000000000..e9706b9c1e6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/atmel,at91rm9200-wdt.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 Microchip Technology, Inc. and its subsidiaries

How this copyright appeared here? Why are you adding some 2022
copyrights of someone else?

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/atmel,at91rm9200-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91RM9200 System Timer Watchdog
> +
> +maintainers:
> +  - Wim Van Sebroeck <wim@linux-watchdog.org>
> +  - Guenter Roeck <linux@roeck-us.net>
> +

Missing ref to watchdog.yaml. Please open existing files and take a look
how it is done.


> +properties:
> +  compatible:
> +    const: atmel,at91sam9260-wdt

Missing blank line

> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

This would not make sense without $ref...

Anyway, you need to also test the DTS.

Best regards,
Krzysztof

