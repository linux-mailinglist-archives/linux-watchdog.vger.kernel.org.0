Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68756D5841
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Apr 2023 07:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjDDFyl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Apr 2023 01:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbjDDFyj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Apr 2023 01:54:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E392713
        for <linux-watchdog@vger.kernel.org>; Mon,  3 Apr 2023 22:54:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id t10so125821626edd.12
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Apr 2023 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680587676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JYftsXhC1HlJf5hn91ov8niN90wVvfkqT+woZX4vRJQ=;
        b=YjTqz+FV29I4cIj4K64Ymc/XuFW02eB4EfUcOAB+zEYBBqCz8YuHSlp67Sw4ltyXoG
         uEmNdMZYF9zZaygT+i02TZ8LcSn6w348Mxz/f5VczdwbL3TXS02Rv7P4opqAL/naLB82
         Nruo/TC0fKWG0/iUsF52Z/6sHzSe49P4NQZIaMMoVFUHLaAopAjrV+1A4W2PQWpHmE70
         sHDue9wSkiMtfMGJA/ZCXj6uHj34SnGkXLpnbV2A4ZMsdfSttKHu4kGBxhDghnDCfvPb
         E+XATqbbP2gj6m6byh4m2tPRtr/DEygysugpyAUaJAioC+xZ1Y5aBcs541yTPd7JEF5N
         XIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680587676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYftsXhC1HlJf5hn91ov8niN90wVvfkqT+woZX4vRJQ=;
        b=SpcTvAzmxynwWwDfvSr3JXVPS+5VMXJd3tR+VJALmzFgwtkugc6sDDhwbOX4YqBYgQ
         BDi8hayHpq+kGzvRgtBcLo6tI6bdFkFISI8f2WOxitWDlTghN+Rk4axN48E4mXoFT/zM
         NZ2yRKjUsO1Mp+4+0ojA+ozbTLqjKSUIzzyVMvQfEJLxPnctH8Nhe10ZtEHphfFvxsMP
         hlyv5FMQ5iEyhZ83Zq0nB5JBipi1IIMCEHQdVWAZ0Mw2MBpxK+ZBpb0f1HRXREb2ASeG
         WfX69ck6muWoa1+aknoPQn8upCOKWgv23febrcI+FibIzV1n1fhliCEMQp8gs9rjo5Lh
         cL0w==
X-Gm-Message-State: AAQBX9eq9Wk1leJJ3PyjSJjUyDdf2Bhh3928NuwskZ9cvNHyLKW4v4Pc
        lwBZoj9C0dEuGAPlnIlKG8P3MA==
X-Google-Smtp-Source: AKy350aojCzjyRrbaIydSiYdeKAJkJwokjgct9kDO5bQ4DhN3A6YUlRJlb26IFTmEAmcKqA+q7Xppw==
X-Received: by 2002:a17:907:7752:b0:948:aae5:e3bd with SMTP id kx18-20020a170907775200b00948aae5e3bdmr1121770ejc.41.1680587676290;
        Mon, 03 Apr 2023 22:54:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e? ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id d20-20020a170906c21400b00947792df079sm5426899ejz.115.2023.04.03.22.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 22:54:36 -0700 (PDT)
Message-ID: <3ac02bdb-8a1d-d72e-c9c9-1526e1fdd81b@linaro.org>
Date:   Tue, 4 Apr 2023 07:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] watchdog: dt-bindings: atmel-at91rm9200-wdt convert to
 json-schema
Content-Language: en-US
To:     Otabek Nazrullaev <otabeknazrullaev1998@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230404054642.5691-1-otabeknazrullaev1998@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404054642.5691-1-otabeknazrullaev1998@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/04/2023 07:46, Otabek Nazrullaev wrote:
> Convert atmel AT91RM9200 system timer watchdog from text bindings
> to YAML format
> 

Same comments apply as other patch.

Also - subject has missing colon.

...

> +  compatible:
> +    const: atmel,at91sam9260-wdt
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false

Why doing it here correctly but in the other patch differently?

Best regards,
Krzysztof

