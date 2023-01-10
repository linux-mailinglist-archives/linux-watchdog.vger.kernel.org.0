Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E57663DE6
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jan 2023 11:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjAJKTy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Jan 2023 05:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjAJKTc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Jan 2023 05:19:32 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C397F76219
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:18:04 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p3-20020a05600c1d8300b003d9ee5f125bso4919840wms.4
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PM3i+83BPLCvCkjcHeSsVRsAE5H2Nw7gtRNrJCRY2Ks=;
        b=dCctDUIS0wC58/aHLK5o+YpcliPRN6sleu5Xkbclt/zqSjkzezo8juF4OGzlLsvyGf
         tUK3Rkiu727qQvxILep6HVoaAKnbkXRJxXvgarWY5BU8gAhVnxynCpG6cAqFAtwFfQan
         3pwJ3RN0AT5mFJYR+byVFD9HC1x7kN8/SimGHmYJMdTQmmPWlFJml+nBX3qwrwOyQ0L2
         UvUktrvtRBUHh2RAj9it+AGiFB2eOiNTbZqual4iMCHAWr+CVeoF7M3ea+Zyeosp0P2O
         Fta/A301YwGUtq0CiX/gKZAwpIxyloMcGasDLKovqyrb3C28XcQSXdlOKbYVcLBa90Gh
         bQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PM3i+83BPLCvCkjcHeSsVRsAE5H2Nw7gtRNrJCRY2Ks=;
        b=AJ85HWqFPhDgdvQ7ewOpX6fJycn7hgFjDD/SRqCKr+beP+Oy/Pprdo0M/nFC9gshMW
         CJXYRlw/zZpKQ+h0OCRMw4Cl3tMA01LEzFDWoy+HcL1FrukBrgetezlJ8slZNYHHUwma
         7lk2TsiXyyljl29dy40f9rQrrVfOC/qjqoU9imEmBGTUrKpOYM7a7gA8zbNAxoy7X704
         K4tG2kn64+W50Q8M2kP1zLu8RYoWw7kLwT7kKDF1Ssl3RuiCzZxlDElnnqAIPxDCG84h
         ELtNDMLVY41ICeB8gTwBGGGUeFe2g3LQ0v2W+1UktFMMljA1332o5T5560MUE72eODP+
         MvHA==
X-Gm-Message-State: AFqh2krOQWtC7LGpeyjZsBlf8DRxQUr2pVq1rI0i+xBcKoPQfRctIgCm
        91pnfOICgHji80y+ZoGhCFfSnA==
X-Google-Smtp-Source: AMrXdXvxClrR4BtCis3ALpFrfvnnBH5INQXfgVxgssgGc8gS8VU+28Qjf2O0/5xOZ+1CSwryJpUEpQ==
X-Received: by 2002:a05:600c:48a1:b0:3d1:f270:a81e with SMTP id j33-20020a05600c48a100b003d1f270a81emr48836013wmp.17.1673345883348;
        Tue, 10 Jan 2023 02:18:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z9-20020a7bc7c9000000b003d9ef37ec1bsm8484251wmk.5.2023.01.10.02.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:18:02 -0800 (PST)
Message-ID: <e3d32fe1-9f2b-09fb-d7e0-2c8f42e5365c@linaro.org>
Date:   Tue, 10 Jan 2023 11:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/11] dt-bindings: mmc: convert amlogic,meson-gx.txt
 to dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v2-9-36ad050bb625@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-9-36ad050bb625@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 09/01/2023 13:53, Neil Armstrong wrote:
> Convert the Amlogic SD / eMMC controller for S905/GXBB family SoCs
> to dt-schema.
> 
> Take in account the used variant with amlogic,meson-gx-mmc.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml         | 75 ++++++++++++++++++++++
>  .../devicetree/bindings/mmc/amlogic,meson-gx.txt   | 39 -----------
>  2 files changed, 75 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> new file mode 100644
> index 000000000000..30228964fd9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-gx-mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic SD / eMMC controller for S905/GXBB family SoCs
> +
> +description:
> +  The MMC 5.1 compliant host controller on Amlogic provides the
> +  interface for SD, eMMC and SDIO devices
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: mmc-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - amlogic,meson-gx-mmc
> +          - amlogic,meson-axg-mmc
> +      - items:
> +          - const: amlogic,meson-gx-mmc

This does not look correct. Either gx is alone (not compatible with
gxbb) or it is compatible with gxbb. Cannot be both.



Best regards,
Krzysztof

