Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90661650A4E
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Dec 2022 11:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbiLSKos (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Dec 2022 05:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiLSKor (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Dec 2022 05:44:47 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6FEDAE
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Dec 2022 02:44:45 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id s25so8659584lji.2
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Dec 2022 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmjevszxUCHQTpFoG42/dWmGvxvU2NY1rLLfgP/zAYQ=;
        b=xk6bLMxZNZBEzQrCU6p5cVw1ASvxpJqWRDfaGf+X56qYU19GLYXZBYPM0lH4Yxf8JL
         WdKiOqSDQVbRhc7Va39RDQC21wP+cBx2VqOQOWswUn3jMpH6qFZuBnYUjXn38HKk8Mfo
         z+eTjr0UhVr28cJsXjBrQ62bysYvDCjyLqa0RrvJJN/zJkODjvVD0xm1g3dfibJAYGKq
         dGBCrqZ4mKEfCZh9riBPZ2kg4JIFMnR6NbyB/A6FMessjnuiwmFM8wYC6ISbiJZIBH6D
         98OYIoIHmcVxTkC4W6BjbTjrZUzt3X8yQwHimgmy0O0wzYXSBEZXGttM03jGeMJ1TOTG
         ww0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmjevszxUCHQTpFoG42/dWmGvxvU2NY1rLLfgP/zAYQ=;
        b=I0lFtNNrGMNDDKWq/6K4KLPVe0kt/IYua2Oq+VfvJsXKlzUCcMPVK274HRCdMuQghc
         mAHeC6TOTWdGUOlEzLg5f57ZySmAwzN9CSwymAqn81W7YC+eddi9ClP7/Yd2kdza/j+d
         lKJl9uuvgxFjSFInpn7Fgs+22ftUB7GlPHNdHAVVCLVKviQ3tXKbxRT3c3kZ2RUNT3Wf
         r16fT38K6qT1JIJ3maSK2FZrXePcAEp4OooO3hNZ+iaqg533sG8ti1PGo8dccEUJ0axW
         SDPciA1RaKIREmiUC03ug2IFJiFK++yVJlf6M6m+nV9LoF2R44ug6mVBs9NKjx6umJxk
         YxTA==
X-Gm-Message-State: AFqh2koPzfYImQxl6v1k5I0mn3yrI6nzioTHMFsONUzJbd2mEdqKXoc2
        bOAnTFeVZ+vPB6tKh8zM3pjyag==
X-Google-Smtp-Source: AMrXdXs2ly9js0eSHV7X+rrGPhAfnPRWaalB/tSrvhSQbapLry3medMrQ2c5Xs+1XwcJCBV8NNeaIg==
X-Received: by 2002:a05:651c:54f:b0:27f:66ec:b5d with SMTP id q15-20020a05651c054f00b0027f66ec0b5dmr3509135ljp.33.1671446683970;
        Mon, 19 Dec 2022 02:44:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f2-20020a2e3802000000b0027a099ad7efsm714252lja.35.2022.12.19.02.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 02:44:43 -0800 (PST)
Message-ID: <c906603f-bf84-06d4-3e9c-bd4ab748591d@linaro.org>
Date:   Mon, 19 Dec 2022 11:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7110
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kernel@vger.kernel.org
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-2-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219094233.179153-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19/12/2022 10:42, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7110-wdt.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> new file mode 100644
> index 000000000000..a7bfe0751928
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/starfive,jh7110-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Watchdog
> +
> +maintainers:
> +  - Samin Guo <samin.guo@starfivetech.com>
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +

You miss watchdog.yaml. I asked to drop the quotes (so the " character),
not the $ref. Please keep the $ref: watchdog.yaml and use
unevaluatedProperties at the end (instead of additionalProperties).


Best regards,
Krzysztof

