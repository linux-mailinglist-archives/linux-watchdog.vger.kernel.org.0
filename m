Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1F167A3281
	for <lists+linux-watchdog@lfdr.de>; Sat, 16 Sep 2023 22:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbjIPUid (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 16 Sep 2023 16:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236879AbjIPUiX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 16 Sep 2023 16:38:23 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24FFCEC
        for <linux-watchdog@vger.kernel.org>; Sat, 16 Sep 2023 13:38:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so3752044a12.0
        for <linux-watchdog@vger.kernel.org>; Sat, 16 Sep 2023 13:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694896695; x=1695501495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5mtdsABJYkZ37qC2C38/N7zHZsWwIrfw/Qhh3bbiuw=;
        b=fZkprpac8Xgd50UnERGh/62V0LjoPca569fSU/oAHN2mYMyeficxFY3MdBJjZsDAuv
         3rAHM5OzEvxU2vb/lCPsJr4k2R0zEVGk1F4KAiixzY/VPBIKiHWRZRVIZFL/vE57NzG3
         R4Dq0kEygYPy41OcOjAc6OTdeFUFQeaxFJCEfyrvtMLCwnu7Mg4KwkUy2mm+QgEhBpqs
         V9hBoT6l4e4R3rr6kjLMDXITxoYH04Xf1ybflyU0t4oi5ON0PcQJoNXgdxpbGM3vS0RK
         YBT9ONVNFgs8lLxYwjjSuM8l4JVpuBUvE12NQirxk+ZTanTnANMrV9rV7WKIaT0nONYp
         fBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694896695; x=1695501495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5mtdsABJYkZ37qC2C38/N7zHZsWwIrfw/Qhh3bbiuw=;
        b=aISSISvPS/oyugVuQ67vjolug4sGQUyd3xVDt8tQUjIxTh/fjgjShIfN3/1SU8bQLE
         kA0C5WeYK1oSJPXqXX4VNDWNG1Q95RuSK0R72Uz5h6eFuM3jvIhdZk1DQVa3WiNwkvq5
         5yyzyH+sCSSAeV04pDVmLWyPL19FrJuzJiP8X3A+IzONFbNuG4JLRm1oaFli5yIA5S0B
         syn5vbul4knJ0IVtY84FS99rldIiHAJLW8DEIASWwFOhlgsPb1tVK/CbPZN8ULXyem6G
         6MYx7onTGjPKbdDF92BrbJZigTG5LjtWlesqKoxMqaqru9pRYMZmZRYPs09CoIfl14pF
         VJ9Q==
X-Gm-Message-State: AOJu0YxQ+fQJHQSyfh5HGwWGGwZtkuKWafEn6VJizasTeWOxwVyAeTfA
        DNGRNe55Pc34YolGNIg6hhN3WQ==
X-Google-Smtp-Source: AGHT+IHbchk3PUwrMNToUoM+pJOEkNiQ+H/1dUMlTy+kuUA3vXvlD49RNngPnzeYAHP3oG9NtQoigQ==
X-Received: by 2002:a05:6402:409:b0:525:4c2b:b87b with SMTP id q9-20020a056402040900b005254c2bb87bmr4286627edv.22.1694896695225;
        Sat, 16 Sep 2023 13:38:15 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id fd14-20020a056402388e00b005307e75d24dsm2625322edb.17.2023.09.16.13.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 13:38:14 -0700 (PDT)
Message-ID: <8c46b45e-2127-346c-0584-54b06a8a343a@linaro.org>
Date:   Sat, 16 Sep 2023 22:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: watchdog: atmel,at91rm9200-wdt: convert txt
 to yaml
Content-Language: en-US
To:     Nik Bune <n3q5u8@yahoo.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230916154826.84925-1-n3q5u8.ref@yahoo.com>
 <20230916154826.84925-1-n3q5u8@yahoo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230916154826.84925-1-n3q5u8@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/09/2023 17:48, Nik Bune wrote:
> Convert txt file to yaml. 
> Add reg to the list of required properties.
> Add mainteiners from ./scripts/get_maintainer.pl output.


...

> +---
> +$id: http://devicetree.org/schemas/watchdog/atmel,at91rm9200-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91RM9200 System Timer Watchdog
> +
> +maintainers:
> +  - Wim Van Sebroeck <wim@linux-watchdog.org>
> +  - Guenter Roeck <linux@roeck-us.net>

No, these should be maintainer of device or subarch, not subsystem.

Best regards,
Krzysztof

