Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E9073C8FA
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Jun 2023 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbjFXIXn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Jun 2023 04:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbjFXIXV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Jun 2023 04:23:21 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B90A2709
        for <linux-watchdog@vger.kernel.org>; Sat, 24 Jun 2023 01:23:17 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9896216338cso133534566b.3
        for <linux-watchdog@vger.kernel.org>; Sat, 24 Jun 2023 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594995; x=1690186995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jOoygUb7kSHIpN5lybNjJ7pb4+07CvDFGFSEAWg/P0=;
        b=ec6K00Eu52RtxLZxjW0JYHaWOW05eAsNVQa3fbURmfvLxhhHUsL/vo+XD7IxNtRePh
         JohCb25+mAcVfKb/YN+guqWWxbVhqnLzklgOO9uFtKw0RFBC9yJxxzNgOi64QyaM424F
         RmiT8u2UwuPuUSUhHwPnSkycYDe+tBDbBvQp175h0ZlO4sGNgoJ9Sm36oSmG+y+1oCJq
         Ugd5MdJ3J7yzVkB1/2PMhMutGJmMM9irNZzcvCrhMFIsCDDstLxTvOX/LT/6WMSzis7L
         OQQHj9eqbdo2ie5+OJ+eMrmXU3Nh/xq85pZkXhCa41L8Y3noqh8aZ2h4igPYT3ZoBtgo
         n7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594995; x=1690186995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jOoygUb7kSHIpN5lybNjJ7pb4+07CvDFGFSEAWg/P0=;
        b=aQM0i7n8j23NLnM4+t0tSbqANbl+LF8abf7OdWpcG6f7QwGpSn8P320TRkJ4/NicUJ
         diycFkZPIAzncsWXllmr2Ze0suKmtEstxtac8KNr3CX4BOkn6spLRzR6UisVN9G+I5E8
         HJYoIhO1ide0nVgZGW1RIvXHmmwMb2mie9q+W3Gl5ohrTVSK/jNjN8lmVI7U8bxWk9Gn
         Dtp5Qxd1TccRSniOKB/brKzaIQ2De1N49lxXU8bE/cOYNBkrflrm9Ti3fY8QfVI6Qa/F
         Lg2052vLed0xE4H71ZP4Y9mVN4rd0aukcml9FMvDMhWfh/1tOoRP7ZOfA7AuWwrIMudh
         /t4A==
X-Gm-Message-State: AC+VfDwS99lX2sxDjAtNjO23JW+MZg3U6EDHJ+E6vZD5Ns4Rp3ntMgz2
        ZX32zrg2e6NVR4qjnAqHTPvKVg==
X-Google-Smtp-Source: ACHHUZ7wgj4gsi8hg4wR0wtrFMRanc+m7UZMBoLi+JkS2EAGQsWnYXwufugaxa43LtT20lkJlSWblw==
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b8a with SMTP id du7-20020a17090772c700b0098ce72c6b8amr7272419ejc.10.1687594995603;
        Sat, 24 Jun 2023 01:23:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qo5-20020a170907212500b00988c93c85a5sm599842ejb.183.2023.06.24.01.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:15 -0700 (PDT)
Message-ID: <6e95fe03-9e35-a237-0392-8eef9c7e4cec@linaro.org>
Date:   Sat, 24 Jun 2023 10:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 33/45] dt-bindings: usb: atmel: Update DT bindings
 documentation for sam9x7
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
 <20230623203056.689705-34-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-34-varshini.rajendran@microchip.com>
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
> Add sam9x7 bindings.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index 12183ef47ee4..6359af0123bf 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -3,8 +3,8 @@ Atmel SOC USB controllers
>  OHCI
>  
>  Required properties:
> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> -   used in host mode.
> + - compatible: Should be "atmel,at91rm9200-ohci" or "microchip,sam9x7-ohci"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

