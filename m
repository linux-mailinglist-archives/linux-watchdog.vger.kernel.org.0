Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08CC96D19BF
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Mar 2023 10:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjCaIZd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 31 Mar 2023 04:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjCaIZK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 31 Mar 2023 04:25:10 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF771CBA2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 01:24:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y20so27934248lfj.2
        for <linux-watchdog@vger.kernel.org>; Fri, 31 Mar 2023 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCqsrf+amCp61+uBfIcb9Bn5gptsOotapM1kFsMUp4M=;
        b=O3LU+DDztntRytZGyI/5nUXmnSu9TL87HBVJgd/WC9Uaxd8GklpM5kHcNNlG0hzyZb
         9BRY2YU9Vr7lZBocH5ZMwzaUHJpJNantPTXVzj/uR6Y8fC4xToVc4BOB8CsuChFxiAW1
         kfFAjsBTIQIk+RId5nXjJqqHGz3V57mIc2VM334wcmurLqpRWoAUStmE4i/CpAoWEBR0
         Y5WLHbcV11TeR+PnvqLptz4LjZ30k00gqpq7UARRm0VSWl7YhilUcxj230i1ubT+iJhy
         jDIfgAPQ7D+4F6T239Uip48XvaLaYT3Kfgp93wbJc8bGwtKVVJxM8T4KG7sHF9fqzmXq
         7Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCqsrf+amCp61+uBfIcb9Bn5gptsOotapM1kFsMUp4M=;
        b=cKIrLJktoBDh61x36tq6BduKnC9FX9Os75/dNgpkUozLGwQBwi9tDDdqbiOK6gfube
         9hQtjGlT4TzbLk1Gn2JeCbKxcRRdzgOadB9X7+hdpzJ9gFIeT6plRcIPmy6PpZNYr/Vc
         XKjz/Fgqi5kjSK3roxSMeoP3Qfsnw29EQxnSYctxD6dOAF4ofvvl48cGIS7IzFi7hVQf
         kD1lWGPQYPKzCVKUAuf5AHSED9ZIjkNl1iABnZw7ziqC/OWNnfNjInuqyTTvsP+XJLsc
         vB6LiCsbRm6isQRTwsBB47QwxhEwvq8tDlUzAjPBB6+9G25WFmoQEMJEmX6wa4UE0X4x
         XMuw==
X-Gm-Message-State: AAQBX9f3TCxZqQKJXyly9PJnVOTzADArgUYp4kB/KvHZkNQc3CFNLMZW
        BHNfis4EAYaZBDBUiJgO52dJUQ==
X-Google-Smtp-Source: AKy350YN5Az0Bf5VilwIcM/jIg8J8ELErE9rowIgMHsZO2KQTkzjldPypIETiy8hY/yze5M8dQlwTA==
X-Received: by 2002:a19:f007:0:b0:4dc:8215:5531 with SMTP id p7-20020a19f007000000b004dc82155531mr7233300lfc.6.1680251090849;
        Fri, 31 Mar 2023 01:24:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v5-20020ac25605000000b004e845954a81sm277501lfd.296.2023.03.31.01.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:24:50 -0700 (PDT)
Message-ID: <8ba254ac-4df2-c17e-bf14-4cec4debcf36@linaro.org>
Date:   Fri, 31 Mar 2023 10:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 02/17] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v3-2-0003e80e0095@baylibre.com>
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

On 29/03/2023 10:54, Alexandre Mergnat wrote:
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


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

