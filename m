Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D997F73C996
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Jun 2023 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjFXIaw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Jun 2023 04:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232995AbjFXIaW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Jun 2023 04:30:22 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986044229
        for <linux-watchdog@vger.kernel.org>; Sat, 24 Jun 2023 01:27:12 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-987a977f62aso150638466b.1
        for <linux-watchdog@vger.kernel.org>; Sat, 24 Jun 2023 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595231; x=1690187231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJlPeAcJkflrsYHeqhAxG1xpnKkKctKx9VK4XOcUSNU=;
        b=Kkt2tu0fZVyjdnIT+9aWz+2dC0xTVD3lu4yLwV0kQqZHuhz8Ro07GQdKqy6N1bU9f6
         pQSHbTPMPW6t676hrqq5z5c4/jC1zAayJMvQIsQvygTbtQ1Ast7+Cs+Sp/qYXZDLJHWw
         XBE4dYbEQtIeIRkumTncrrM+RY7bqG5QLJTYAogks8em7F36iQZDlMeHdRvWBibNfJyB
         5GEQ4ZMC7udapD1WxMM6AWpT4cPZ2HWl0da/r/wrXgxUiY6gz4DHtTZ2kx7RHe9LGGjI
         QKd+aWA5QHSnmV6Qgt2UIMZ5Ylb44sRp4CxcC3kLBCXNXnUnEVR8y9x1idlk9Lr31Gd9
         XPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595231; x=1690187231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJlPeAcJkflrsYHeqhAxG1xpnKkKctKx9VK4XOcUSNU=;
        b=RTjE0jDiwTgXwL90Fu+aheR7K96fDU7gEpiCbuHZTqwahupicT7o358CadvPg812v6
         wLqotP+T7Ucml1CBPYfJuqAkdYAXnKtsBpVLGE1g1jWeU4NHH30DF/nhO1BzGvx+ge7l
         lmdS9qEytwriHfjuV/t+w1+OShbzHachObr1CHTdEgy+3j02D55KOyLFL8sAnhmlQb2P
         2cnfZOQd5sHQuYQPU5JJLvnOqVCRh9vrui2Fj0Y7YyBFJTYHHOGZJPN75YKkmVpbO3Dj
         SBWoLEmeewWw+8juz020+ilkz5Jx4fIFxYGMXSENYyQYt2ZDIK1f/kHZONsSQXbXMG88
         28Gw==
X-Gm-Message-State: AC+VfDxK1F5H8cq3I6rGFoYZcuwSpV78e+GjAzJJUYKsKLoxfPBfmJ8B
        Io2tQAVmyN2P0B5w0zbZHDC2Zg==
X-Google-Smtp-Source: ACHHUZ5t7epZFC28S4hxtPyy+RCHfLvODV3nPC4aL8/psJFMdpVy5ABk2SDosvlu0zr3308+wJnq2w==
X-Received: by 2002:a17:907:8a03:b0:988:acb4:f63 with SMTP id sc3-20020a1709078a0300b00988acb40f63mr12986422ejc.74.1687595230874;
        Sat, 24 Jun 2023 01:27:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709060c4600b0098654d3c270sm635400ejf.52.2023.06.24.01.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:27:10 -0700 (PDT)
Message-ID: <caff28bc-8824-f173-99ea-267dd26e5cbc@linaro.org>
Date:   Sat, 24 Jun 2023 10:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/45] dt-bindings: dmaengine: at_xdmac: add compatible
 with microchip,sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        olivia@selenic.com, a.zummo@towertech.it,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        gregkh@linuxfoundation.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
        horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
        andrew@lunn.ch, alain.volmat@foss.st.com,
        neil.armstrong@linaro.org, mihai.sain@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        balamanikandan.gunasundar@microchip.com,
        manikandan.m@microchip.com, dharma.b@microchip.com,
        nayabbasha.sayed@microchip.com, balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-18-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-18-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatible for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> index 510b7f25ba24..f672556ea715 100644
> --- a/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> +++ b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
> @@ -2,8 +2,8 @@
>  
>  * XDMA Controller
>  Required properties:
> -- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma" or
> -  "microchip,sama7g5-dma".
> +- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma",
> +  "microchip,sam9x7-dma" or "microchip,sama7g5-dma".

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

