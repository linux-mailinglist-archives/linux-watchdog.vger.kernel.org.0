Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AF6EDF44
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Apr 2023 11:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjDYJbQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 Apr 2023 05:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbjDYJbP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 Apr 2023 05:31:15 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C96546B0
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Apr 2023 02:31:12 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94f6c285d22so1019756366b.2
        for <linux-watchdog@vger.kernel.org>; Tue, 25 Apr 2023 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682415070; x=1685007070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwWxlVAE64QyKAHWdVa5oyI5Ulq8wY4rHvPDJEXAm7Y=;
        b=LRzd+mfBaB5cb3nrvkDgSPydK+33bf870a/de9VnTLbRJYShha7mfO6UBxDC0w0ZtR
         vsEQ9HW0wOp9RbE3x0cR0GWfm653sIkiJ7WNsYukZVN46UogY52MpIBBLkHj94oride8
         5nAt/cQrvPjEDFxHGx3g5gWvk0WTaafb7mhwTX8WatxCEdyQ07BzV3QzstMofYaTWEs8
         xAuvH7mQ2A0Bz2Gfbw5RDmuHrozhiCxt9n4EcVpwLcgdCpNzQoX0ORMqqFOxpB0dFXwe
         2S3ZfM2O59jTqR+negPmxjnOB95uGX+qrwCntOHQehcKtiTm499So0J3LMSlmQnyztto
         j+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682415070; x=1685007070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwWxlVAE64QyKAHWdVa5oyI5Ulq8wY4rHvPDJEXAm7Y=;
        b=XGofOvMEWDHz7SUiBnqLLPYnXt/oQNsIkfNnIbWtV4Aui8p24DZk7eKEsedKfsn7XN
         2xOI4oQIJFspEZgUSLEodgYiDTc5GdvHgKRwIHrjseqWjnMu4pabTVIv4XR8e+oIqo6C
         Tnohp7eeSamvAWCTa2WFGzUyvbwAg4fGzNykCgo24IP7CovAe1wISutmQ3oNIxgte6Kt
         3iXB9qRYQwkCP9JFSbfUminhNpjF5FIPI2mrlE5R0iOBP/IEXYX5i9oxjCme1HaH3mKK
         3m/4k6Lx09nbxqCFdkWYiF37KhDngkwPeBNITPacRGpYZTlTAZtfo20x6fjAVnDgSbK0
         cPcA==
X-Gm-Message-State: AAQBX9c1oN8t/x8vpBQzUkHeDzTnwWYGYB9f0jucMDROALaqkQCeSSvK
        6ZzK58v2TEC3PvJRskeDKtrvdg==
X-Google-Smtp-Source: AKy350aI5ZiisfoEWF2G9ZhvNJ5Va8E/s2wNj46/QHj3C8uWArAO0RbEGQNYWe3qSlkMYu65cgyIDw==
X-Received: by 2002:a17:906:52cc:b0:94e:6504:d134 with SMTP id w12-20020a17090652cc00b0094e6504d134mr13139141ejn.42.1682415070499;
        Tue, 25 Apr 2023 02:31:10 -0700 (PDT)
Received: from [192.168.9.102] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090676ce00b00932ba722482sm6683443ejn.149.2023.04.25.02.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 02:31:09 -0700 (PDT)
Message-ID: <00882340-477b-dc0b-d489-94efdf045f1c@linaro.org>
Date:   Tue, 25 Apr 2023 11:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 09/43] dt-bindings: watchdog: add DT bindings for Cirrus
 EP93x
Content-Language: en-US
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <20230424123522.18302-10-nikita.shubin@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230424123522.18302-10-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 24/04/2023 14:34, Nikita Shubin wrote:
> This adds device tree bindings for the Cirrus Logic EP93xx
> watchdog block used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  .../bindings/watchdog/cirrus,ep93xx-wdt.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/cirrus,ep93xx-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/cirrus,ep93xx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/cirrus,ep93xx-wdt.yaml
> new file mode 100644
> index 000000000000..f39d6b14062d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/cirrus,ep93xx-wdt.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/cirrus,ep93xx-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic EP93xx Watchdog Timer

EP93xx is no EP9301. This does not match your compatible list. You
should probably list all of your devices. With or without compatibility
between them (so with a generic fallback for example).

> +
> +maintainers:
> +  - Wim Van Sebroeck <wim@linux-watchdog.org>
> +
> +description:
> +  Watchdog driver for Cirrus Logic EP93xx family of devices.

Drop "driver for" and instead describe the hardware.

> +
> +allOf:
> +  - $ref: "watchdog.yaml#"

Drop quotes.
Best regards,
Krzysztof

