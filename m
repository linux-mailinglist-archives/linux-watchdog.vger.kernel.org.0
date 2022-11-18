Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 755EF62F84A
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Nov 2022 15:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241647AbiKROxv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Nov 2022 09:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235355AbiKROxs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Nov 2022 09:53:48 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377E7DFC6
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Nov 2022 06:53:46 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id d6so8561766lfs.10
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Nov 2022 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1tEkG622nl9sahUZlEsZMDSytRMxlyYKVto7odTkwcs=;
        b=mvWELOZg6+Dtx2T6DISq6t8ODYmZVcRawE8A56kfYSw0cPQlGvMuVCOJ3cg6NfGkVT
         5V6SgNrBfktRz4VIlTyQLyYeEuOwRvcEKxub+XIbBDo3/BNXdMjL50Y8eUl88MaESAv3
         FsalQj/pSpzzjdfOlRvNr+9Mwcu6V1tUwHonVSvE5ixbWmdfxsGSPRxB+QIUwz2eTPMm
         QxCLWm7EbCukdXkMvG/MwXSurd0S5fykOOeF0v8p6q8vCtqXOs6zx7vC5V9iBx7P4gYC
         ugBEPzTwfm3HsNH1bmefO7W62iRU0hElHiohaaKI8n9eWVhYrTIuco3IXYv3eVoAE+y3
         xQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tEkG622nl9sahUZlEsZMDSytRMxlyYKVto7odTkwcs=;
        b=FSYEr23zylKYpX19hqvrqBcd8765+UDPuCYQr8x1eJSrqdLPnCYZzwaZn9aJfkAUUW
         DIomxfHp8mMScLrtbAjEtWjG8pFRzyWAR/2G7xJV97EIU8iunsg0ZMfQ7WjlakPjcl28
         ygYWSZm488nzbBqIGUO+jLRO98u2Ny1oJdDyJ37+2fR6585Jjj6d5OLelHiEa2jDOsOH
         952lpPSsqs34AszFjGBEccCg0Tnz2umxXP1QS3M5DD24xYs/FrBrVsJTnQhX1n/2/E/3
         sZfk/wm4WmxMZg+pC/u2o53pZOa1D925qGEKGDvazJtd7rdPjEouHC6qRXJVSa3Hjz8T
         tvXg==
X-Gm-Message-State: ANoB5pn2tMMudlsJgJCVZnBIRMeWFhTHVJgQHXDqfk+dg+5XKNpv55mM
        TAP9kBtkzeO1f5rR8XLwBzaP+A==
X-Google-Smtp-Source: AA0mqf62tdo4/gtJCMpEvCmDknR2gWTfsM6qNACTGALCUmV2wU+z03KWct99eh09aEGoFcKqZ7HiEA==
X-Received: by 2002:a19:f014:0:b0:4b4:a27e:c491 with SMTP id p20-20020a19f014000000b004b4a27ec491mr2675719lfc.479.1668783224568;
        Fri, 18 Nov 2022 06:53:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e12-20020a05651c110c00b002777a07f48esm684674ljo.12.2022.11.18.06.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:53:43 -0800 (PST)
Message-ID: <3b7fbbb4-f79d-f195-612f-4dfd40a66e34@linaro.org>
Date:   Fri, 18 Nov 2022 15:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/12] dt-bindings: timer: convert
 timer/amlogic,meson7-timer.txt to dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Eric Dumazet <edumazet@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-8-3f025599b968@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-8-3f025599b968@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18/11/2022 15:33, Neil Armstrong wrote:
> Convert the Amlogic Meson6 SoCs Timer Controller bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/timer/amlogic,meson6-timer.txt        | 22 ---------
>  .../bindings/timer/amlogic,meson6-timer.yaml       | 53 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
> deleted file mode 100644
> index a9da22bda912..000000000000
> --- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Amlogic Meson6 SoCs Timer Controller
> -
> -Required properties:
> -
> -- compatible : should be "amlogic,meson6-timer"
> -- reg : Specifies base physical address and size of the registers.
> -- interrupts : The four interrupts, one for each timer event
> -- clocks : phandles to the pclk (system clock) and XTAL clocks
> -- clock-names : must contain "pclk" and "xtal"
> -
> -Example:
> -
> -timer@c1109940 {
> -	compatible = "amlogic,meson6-timer";
> -	reg = <0xc1109940 0x14>;
> -	interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
> -		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
> -		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
> -		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&xtal>, <&clk81>;
> -	clock-names = "xtal", "pclk";
> -};
> diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
> new file mode 100644
> index 000000000000..ffcb137e720e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/amlogic,meson6-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson6 SoCs Timer Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,meson6-timer
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:

I think it is worth to add here description, that these are per-timer
interrupts.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

