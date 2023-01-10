Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AAA663DB4
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jan 2023 11:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbjAJKO2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Jan 2023 05:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237809AbjAJKOR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Jan 2023 05:14:17 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E65517CF
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:14:07 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id bk16so11151405wrb.11
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jojCCGfavVKv5imMe2sO0IZFTAm6Qt+UkX8aAOYmM8Q=;
        b=bbhb/M2Tbo7P6JQFLKz1c0s92pip1LUY/qoQtVnezlvmXlve3kgyeNba8+WtmX4t2D
         Dqs5HvWz9j8ad8G7zjQAKt2OUhJ5oPpmAugq792ubXvNuvlNgx12r2eNxoiWtfJtAgkc
         ln8dRvw1xf/0keWdYbSaNriNWp27rABFZucUCHjhkgOSv2oYBu+gDWHpRQmu7nuZYux/
         Ch1A4NbCcbmL1JAXJRKL58l8adrR3ecbI+lYW+4ObQNnSVJc2XVqhStvYLd1MguXeStw
         ks3SHXuek07nXLDarhxwAioHsl5xyI708nCoT8Z6Vdq/Uf2JhdoccDoTWgGesRpg8BQ0
         zb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jojCCGfavVKv5imMe2sO0IZFTAm6Qt+UkX8aAOYmM8Q=;
        b=2d5arPfizCaQah+DN0CobN66WNq5/Gwt9MVJyRX8l0aJzkmSIQaXtyf5g8Z1s2nYLl
         32rX8x93NqfDsKWQLZqjaIjf1OWwPgr2d1iHzCQcxMZbqzv0SZoPE8cNchfCjv0/LsVM
         AyeatMAGJXJ5F7W9UazaginAqnGru/jOpbpzasWQ5OUexyaLbB1K8ORaD8SHAUUXnoJp
         9onq4kqFoxUPFZ0SMmvTLix8oEscwzAAkm503Wo3Y50+uWBaG1IcI2uoZMl97aMsuOlv
         /V9Ouy95+kUCzZL8IknQ+QW+SEoveYNn2GrSUa9fDFXhVJShi/ZENyRnNfA2j7uPfkiG
         SjaA==
X-Gm-Message-State: AFqh2kpb4v95WszfQixbdGmwGCk+Ajnw6csJt+lJRyushPGAj3d+LhyQ
        kaGOzHmJeH17UB45xqIboWWQVA==
X-Google-Smtp-Source: AMrXdXsns+wODkeVA+eyVg6DWDP7h4ZsUK2KoND8WPXo2OLQMg/ZUcoSsqQ0z3Y2wBq+9Yj/x0NG4A==
X-Received: by 2002:a05:6000:16cb:b0:242:1b0d:9c58 with SMTP id h11-20020a05600016cb00b002421b0d9c58mr50376842wrf.69.1673345645653;
        Tue, 10 Jan 2023 02:14:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b002bb6b45ab57sm8867372wrm.85.2023.01.10.02.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:14:04 -0800 (PST)
Message-ID: <6044f85b-93f2-fe2e-68b5-9912836f4a38@linaro.org>
Date:   Tue, 10 Jan 2023 11:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/11] dt-bindings: firmware: convert meson_sm.txt to
 dt-schema
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
 <20221117-b4-amlogic-bindings-convert-v2-1-36ad050bb625@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-1-36ad050bb625@linaro.org>
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
> Convert the Amlogic Secure Monitor bindings to dt-schema.
> 
> Take in account usage the used variant with amlogic,meson-gx-sm.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

