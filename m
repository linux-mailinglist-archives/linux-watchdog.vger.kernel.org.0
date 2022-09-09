Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572945B33B8
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Sep 2022 11:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbiIIJYQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Sep 2022 05:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiIIJX7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Sep 2022 05:23:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D692710F8C4
        for <linux-watchdog@vger.kernel.org>; Fri,  9 Sep 2022 02:22:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z25so1697378lfr.2
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Sep 2022 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KGUotyk0+3mB90b6qE0KMVHCCytV9D9kNWTKQrpG1k8=;
        b=LqIZ0l30YbyTsjxMZ8GGEWCMlOFYD0gzwDwqsaxrCH44HUvuznp/BNnP3DGoqNrsQq
         o/Dyxu+B01yLZJblkL3jVEutYom8BWB9vlyWttCJ6yGZmbzet8ozB9F7976ZhQES9osq
         FMR0z5z97WPEsZiv9wZ8qUvRiCyo+060FJQNcZrj9Z2oS+IbNc86i0BHA6lDNfGKbHo5
         /Aq+TDqMXrfIqPmxWTMlRkChxoYTkWhwVKT5SsREnmW1Imx94v8P72P7MWTUTx79T3bl
         lLkcf608A3bR20kiS2OB48B1oOBIVq2ihiIKdI0svhpxEdsGT9l4o9mtgkKMC8PonNoW
         qkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KGUotyk0+3mB90b6qE0KMVHCCytV9D9kNWTKQrpG1k8=;
        b=xPhmQ+MSL7kPcFLt+jJf3+RgZoN7EhLWromhKrzodOaX1QaHoEYK4n/UEvkIxdydFH
         Imqn2QXMKLnu/qe8ZDATMW4KkGUC2zo3b/ff9S1anwGLt7w/CzHSCjDJs3YJSCWH97VF
         11ECsty41TfUHa8ix3KDj07fp0EidzLYsgSIiMsTpjloLsQ1DFX/hbrhAIeQlphNVbsy
         kv6ZyQ4lUV2D92/hY2flJ7ftJ29frXv8irb1K+PhmtRFYyveaC43rPFaa2+R+ZigqXcT
         S0kcG46b4w/qbqXsnfRlDOBaPd+5DEOGjAKcG6QeAEiQOh2OfqRR6j9bj0BeUTuzCxsS
         0xiw==
X-Gm-Message-State: ACgBeo0R+oI1mTB+E901W1nZm5tQ/4B3lSjjcxIHyxYHVrF+Du+GqEO4
        Tpc3WSntVpp2EIB0pvQV4UjULQ==
X-Google-Smtp-Source: AA6agR6PtvePLlFa8morK6nEKwrtTUgq18iH8IUuZvZrP2tC5bDa9yjdx9DuJOlxYOZaFY5oQSBgcA==
X-Received: by 2002:a19:491e:0:b0:498:f63a:26a8 with SMTP id w30-20020a19491e000000b00498f63a26a8mr1047944lfa.400.1662715330295;
        Fri, 09 Sep 2022 02:22:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t10-20020a05651c204a00b00261eb75fa5dsm3929ljo.41.2022.09.09.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:22:09 -0700 (PDT)
Message-ID: <5621190b-3a1f-b32f-b742-e95b8922bc05@linaro.org>
Date:   Fri, 9 Sep 2022 11:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Add r8a779g0 support
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Thanh Quan <thanh.quan.xn@renesas.com>
References: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e3a246be066d5e9c2231285bc1488fc12866cf5d.1662714387.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 09/09/2022 11:08, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Watchdog Timer (WDT) Controller in the Renesas
> R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
