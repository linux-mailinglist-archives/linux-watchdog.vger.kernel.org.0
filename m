Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D29A663DB9
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Jan 2023 11:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237869AbjAJKQB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Jan 2023 05:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237968AbjAJKPk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Jan 2023 05:15:40 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF85551FA
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:15:11 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso5085154wms.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Jan 2023 02:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOaM9klxyd9oBpbyKATfQLn+xwTyF3728aG0uRNv66U=;
        b=yoUk4O+00nkGYkYXyiqjTxWK4c7uEc66lLsyapNN3lN4GWq40l5XLLk6lO9MKtmxLQ
         0mF0Rhs+YcdM7Am20PD9umvFqLKrgIs2WmrZqIoUhClE+yw2sEunnBBIg5tONlN8P8cg
         T/1xm7p/HoG0u7bVzXhlUjL5p8+Fvq6t2cK3PJCGiI7caXb7zzfRZcI4qprHbjxN3Gal
         hVatrgn4tWSnEMLt3nvou6IN6lw7QGsWFvZT88CEO87sTEeS8NAtT4PaEbRYqoFH/rKp
         gsFXYOEShYrosm9/rWZnYkZv6fcSTdHmPOYz9UXe0E+RXWhxZ3TWNIKjLHIFrlUHmJ/e
         RjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOaM9klxyd9oBpbyKATfQLn+xwTyF3728aG0uRNv66U=;
        b=LsO+ZGEoyjMelSUTv+YyUt4v2n7+zbW2i2KDbWGZuMdqPzztGN+uVghTOO3u0iEwe2
         u/l9LMpzY+O4QuMVO5BfDEKZiT7ixKj8ScgFlrpyANn+rMPqKStg+4nzxL8TQLQxmloF
         dKhj5nI7815A8LdaDLB2v+mEW38hQqDzM2k4tiNCibE7oSBIfj+rNVO0P9h4MkgYQW+U
         glZzIxyilAWGfJjCC0CHLq1ORlAfasA+MlyBFclRGhXoWHu8OQUsWmVCA0ZwXNGoDZZc
         kcx9varglitN2DVMPIoX+9T/hYtdmSF0TR6z8uglBMT87e2JEtQWbNux58hdy6MPaCv9
         QcWA==
X-Gm-Message-State: AFqh2kpiRic+Fmg4vo0a3XhSSwl9rYLoRr4cElDkZVue3h0lxRt41uP7
        UYAOLJkhWZGE0m43b7ZfxxfBPg==
X-Google-Smtp-Source: AMrXdXstKuMbnF6GLlV2QioeyL83rfUZ/PCM9H9gtVt4kpI2kfbu1FzMUYifSv02GGXMFgTeLR3h+Q==
X-Received: by 2002:a05:600c:3b02:b0:3c7:18:b339 with SMTP id m2-20020a05600c3b0200b003c70018b339mr58648300wms.37.1673345710203;
        Tue, 10 Jan 2023 02:15:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f19-20020a1c6a13000000b003d9fb04f658sm754592wmc.4.2023.01.10.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:15:09 -0800 (PST)
Message-ID: <2a0408ab-085b-c104-7e84-ce2fe1e6bea7@linaro.org>
Date:   Tue, 10 Jan 2023 11:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/11] dt-bindings: nvmem: convert amlogic-efuse.txt to
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
 <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-2-36ad050bb625@linaro.org>
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
> Convert the  Amlogic Meson GX eFuse bindings to dt-schema.
> 
> Take in account the used variant with amlogic,meson-gx-efuse.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

