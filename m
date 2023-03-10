Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358116B38BF
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Mar 2023 09:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbjCJIcs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Mar 2023 03:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCJIcm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Mar 2023 03:32:42 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6434210B1E2
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Mar 2023 00:32:37 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id ec29so17333326edb.6
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Mar 2023 00:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHBd3Y0VvrBuq7MZ50gDgjgTfAiwAuooNzx/I7JEUXw=;
        b=ZlWttD2E/fTc6sozsXYMOODaiBWhScr+YjJItVN2GefRH0xMUdqwOZf8mE7FjehfuQ
         9uTTkBaSBSi+znvYbHXEKAOvqQ7huiNNmdgyCuyC2J86I+9grR6wR6V/j+IU2reXffua
         RbLfMFlxGQNAU2knCQCVMa3Yp2rOhkmFhWdiOZaNg4oYsuQZWhjOzQu4ZBOBOtK4rSV6
         Js1mBHru/S7XfykzdxLGLlzwNXq5t5zIGEIlE7fcxAhjKseDLIjR+G9zLIqe4NvQ75Sp
         DmwySuInWyF9kLDeuhVoPKE+JphSSizzKcaAyNNzzKeiq5QiRRN7TVLz5yxJbdWTyJ8z
         8XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHBd3Y0VvrBuq7MZ50gDgjgTfAiwAuooNzx/I7JEUXw=;
        b=UCIifxlyMm4glcNafEV5PBYrzQ+JcM6ghZM4gP9IAqhsxaJVyjUz3aOP2SBecR/PL9
         ZykvEuclSmkHbFve+LNs278Z+8ICdoMONlwemy/hAtpu7GJjW/+58n7kAcFxMIh8Poif
         zi1CTy0coOvp4e0oMnbKIXfonsEknbul1IIB/PqbpeN/Xnq7XuzTz/k1+R2GhS5yGkwU
         Tg5lO5gpfyNw+CwTM67jMZnIZ/ORGDL/Cwm8eO8XhThgpNTPpOus7BpvfSuDBSgpigqf
         CcxEQKP6HQUuPdsUHuZENNpP5wj+JBl3WLkOS0uLkCrBf2efZerkd7V1+VVmb74/hTvl
         Kdcw==
X-Gm-Message-State: AO0yUKXn9VBHpL+JW1/JDLGsR32W1E3UFQ0tuIHgpPSb2D/lGOAiN7Mq
        DlcD+89hbGFXeorEU+AfObnFqA==
X-Google-Smtp-Source: AK7set97xnKWsVre6NDR3NC+jr6Wd86sRJG6DewHgTjoe4XcRjSjYtnBHv4PeuEjxhBj7P+etdDudw==
X-Received: by 2002:a17:907:608d:b0:88c:a43d:81bc with SMTP id ht13-20020a170907608d00b0088ca43d81bcmr28538165ejc.58.1678437155821;
        Fri, 10 Mar 2023 00:32:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id e11-20020a50a68b000000b004bb810e0b87sm539370edc.39.2023.03.10.00.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:32:35 -0800 (PST)
Message-ID: <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org>
Date:   Fri, 10 Mar 2023 09:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
        devicetree@vger.kernel.org,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07/03/2023 14:17, Alexandre Mergnat wrote:
> This SoC is able to drive the following output current:
> - 2 mA
> - 4 mA
> - 6 mA
> - 8 mA
> - 10 mA
> - 12 mA
> - 14 mA
> - 16 mA
> 
> Then drive-strength property is set with enum to reflect its HW capability.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> index 4b96884a1afc..101871ec6693 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> @@ -79,6 +79,9 @@ patternProperties:
>  
>            bias-pull-down: true
>  
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]

Isn't this conflicting with mediatek,drive-strength-adv? Your commit msg
suggests you add a missing property, but I would say nothing was missing
here.

You need review from (pinctrl) Mediatek maintainers how the bindings for
all Mediateks are organized.

Best regards,
Krzysztof

