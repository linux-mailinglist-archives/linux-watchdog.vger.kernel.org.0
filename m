Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3382A62F820
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Nov 2022 15:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235355AbiKROtJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Nov 2022 09:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241240AbiKROtG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Nov 2022 09:49:06 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B212607
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Nov 2022 06:49:05 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id j16so8525199lfe.12
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Nov 2022 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xECLjM+1wJ3tyU5u/WQawVGRXnB8gHjb6MLiqzOmuE=;
        b=Zs12YmMMSavyYzmNqKcCRYMCcx5tO7qpQ0VvE7hyvFNBku6wyFMWhXNVMlF+Sqg0KT
         WoIA+w4A8iuBJ/Z1AAHH4aIRydfpKhe7bF24gwy0bRzlEk0jYncnokHI+00AlKhVfGXV
         JIIp3E5uA+gM7soG5wopEU+Lv1q63Zy9Cg91suTl/dBPE5V24XVYczE01kWsKEHVfQGb
         dBT162Z4F1TG+7XSK0OcZOSsHy+CA846o55K/WA07GJriE9bcEJQUbPZyZbcV94cF4R/
         VfK+gBKT/TkzM9E9oq25330xsTCuei+8omVXqqLIW5R7KPXHwfeYtmnlKBMLd61OMOgq
         UpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xECLjM+1wJ3tyU5u/WQawVGRXnB8gHjb6MLiqzOmuE=;
        b=i7ppopBxoS7mqfZmaHdKgrPV+PH+7ZDs3MDAgWmX/3GQFk+XsSwCm7AMJuyFLLVojp
         sJR5pjw8hcaldZUul0YP/v3vB7wORbBzm/Mcl50mKsgA/eFJpxwwAL2DGQRZT5GLiK5n
         aAB2WP9sThh0nmvXY174B0cygKOQnE5M370QiCMDo+eLNUgARYu19+HGlKR4n+jCqCGF
         onGEOWXCMxAlcMG7pturrKhoxOcyAHN+uj3eT0YNc3+SJbe18BjeluDwK3pa/UQLeVM+
         5DnVOkb2lXSi4ilczfl2n/LkkUQI6pncyu/tnTOzCmBoWXXYU6/A2gh2NaFL0zGRbWKF
         ERZA==
X-Gm-Message-State: ANoB5pmoJXAetoYXVq/on7oRZa2Ybfpo6QOsCOcFpE2mkYv4gpxH8yq5
        BAHY0N+gDaopD929ymRyk8xfWg==
X-Google-Smtp-Source: AA0mqf7ZXIKPBh9Rz/8NI/J74R1K82UMSY4YzepugR6KIDjTrCZkpyZFe0babnYb4sjivNlfYP6QJQ==
X-Received: by 2002:a19:5019:0:b0:4b4:8d47:7057 with SMTP id e25-20020a195019000000b004b48d477057mr2868955lfb.376.1668782943480;
        Fri, 18 Nov 2022 06:49:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h3-20020ac250c3000000b00492c463526dsm685909lfm.186.2022.11.18.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:49:03 -0800 (PST)
Message-ID: <24296f7d-416d-e5f5-ef6a-c960b59513cb@linaro.org>
Date:   Fri, 18 Nov 2022 15:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/12] dt-bindings: watchdog: convert meson-wdt.txt to
 dt-schema
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
 <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
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

On 18/11/2022 15:33, Neil Armstrong wrote:
> Convert the Amlogic Meson6 SoCs Watchdog timer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

