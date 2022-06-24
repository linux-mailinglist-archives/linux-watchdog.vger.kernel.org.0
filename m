Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 802FB55977F
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Jun 2022 12:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiFXKQH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Jun 2022 06:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiFXKQG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Jun 2022 06:16:06 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B62D7A6F2
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Jun 2022 03:16:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id pk21so3763517ejb.2
        for <linux-watchdog@vger.kernel.org>; Fri, 24 Jun 2022 03:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kPraytMqpjSE6617/9alzyvnfSfmO7egX0oSB/3TeBc=;
        b=qr7bhiO6LG8GQbpknomfMk0pGirbyTBRkzseWD2vmjB1lGzGrvcz88U8tAAhxHqpis
         2TzOJzGbNYXbZAd4q4Po1BSpY7eeUOGsXkiLAc13AoyjubS9V72i7A3qZg4MtSZ/XGuT
         /Na9RVUjQu8t+tW8KAdeAhBstxtYdrLQDDeufndFGDpZ+o1tbr8XxCUS2+u9MOhxnMKb
         gPAnH2oi43n7BaBWQ264XxaivFKT9LV5RGCSUAxoGuhH4qHxZOhbJfH9zobiy+CwJRWJ
         SgXJfiy4A51EKN5NhH4gqt+Lo4qSr6380PY1Avd6b6P5yMTeOlbcoT3tWZO8c4X2lHu6
         34ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kPraytMqpjSE6617/9alzyvnfSfmO7egX0oSB/3TeBc=;
        b=GkboFv2fIvR2BuJC9a+8ZhCERriR6jn3NxpZ9bjwc9i59bEqKwZ7GnVkVrbxzrXWoO
         6VXS+PPQ8HdE3ckQDO1pBZ2uq8HkHVi+BRAt7nWmDqmMwgF9rBf0LdnY0XjfFCZuV2kG
         ymT9fC5qWzrRqikyBEqZlkreQVOitIO59xmTg2iptP+qS/e3eG5bsMlhWKUeOcgW49iS
         DsCczIP00CrytVkB2PuCvtOf+ul0F5HiRm8Co1+Uq6Mg3aHhxlLL9stpvYnKZgwzQcmr
         H9XOL/1w9MdXwIWdDL0/rTS2oFcwbhMlfe0mE7xF1KhoEPXvCKvUtZO/ST9uUJYvBqpr
         QDCw==
X-Gm-Message-State: AJIora8h+Mtav6oFpPsVu+uj+4hMbahMfqLX/ZmyAA/z0yaMLtMijwum
        rSBUc0zqfAPnPrBHO3HMQj7+vQ==
X-Google-Smtp-Source: AGRyM1vxM95fLi1k9A6wcpXz5ym37GnKISALQxzXatTwbNov1uqVqgBEGUf1FeW8Fww3o9MLsyzAsQ==
X-Received: by 2002:a17:907:1b0d:b0:6ff:22a1:d58a with SMTP id mp13-20020a1709071b0d00b006ff22a1d58amr12971080ejc.293.1656065761571;
        Fri, 24 Jun 2022 03:16:01 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709064e4600b007121b22b376sm841667ejw.105.2022.06.24.03.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:16:01 -0700 (PDT)
Message-ID: <d0868482-ad14-c684-0bfd-fcee8b54bd62@linaro.org>
Date:   Fri, 24 Jun 2022 12:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 05/14] dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
Content-Language: en-US
To:     Viorel Suman <viorel.suman@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Ming Qian <ming.qian@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Abel Vesa <abel.vesa@nxp.com>
References: <20220616164303.790379-1-viorel.suman@nxp.com>
 <20220616164303.790379-6-viorel.suman@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616164303.790379-6-viorel.suman@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/06/2022 18:42, Viorel Suman wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'ocotp' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../bindings/nvmem/fsl,scu-ocotp.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> new file mode 100644
> index 000000000000..071171e55218
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/fsl,scu-ocotp.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/fsl,scu-ocotp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX SCU Client Device Node - OCOTP bindings based on SCU Message Protocol
> +
> +maintainers:
> +  - Dong Aisheng <aisheng.dong@nxp.com>
> +
> +description: i.MX SCU Client Device Node
> +  Client nodes are maintained as children of the relevant IMX-SCU device node.
> +  Detailed bindings are described in bindings/nvmem/nvmem.txt
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-scu-ocotp
> +      - fsl,imx8qxp-scu-ocotp
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^mac@[0-9a-f]*$":

Use consistent quotes, either " or '.

> +    type: object
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +

missing allOf referencing nvmem. You can skip then address/size cells
and use unevaluatedProperties:false.

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imx8qx-ocotp {
> +             compatible = "fsl,imx8qxp-scu-ocotp";

Wrong indentation.

> +             #address-cells = <1>;
> +             #size-cells = <1>;
> +
> +             fec_mac0: mac@2c4 {
> +                    reg = <0x2c4 6>;
> +             };
> +    };


Best regards,
Krzysztof
