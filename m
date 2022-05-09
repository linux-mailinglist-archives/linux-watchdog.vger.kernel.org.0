Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F099C51FACF
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 13:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiEILJB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 07:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbiEILI5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 07:08:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DBE21B173
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 04:04:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id c12so8356673edv.10
        for <linux-watchdog@vger.kernel.org>; Mon, 09 May 2022 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dQ5umuSq8436wMlByf3kCIwoDGKknSMhF7YGPaWnD5Q=;
        b=P918v6KNlN6ZBDoI40HJCoLnkIPWXEkCer/teM8h/OUrpY7z1E3G/VMjK9HBTnmvZ1
         uONlkyyb9jVC8SX0sQeT9q8IgrvyVcgQ9PrkUt6YwY1Cd3hWr00/gw/7JDU9SAL6wkgd
         n6F9aFh6/UKbE0o4HjSBa+h/5zOkxHEL+7tlHIKZ+gSz/4xK57lGZM+uFD00VykENOiB
         YIHdSJcNvmdM+DWwsvMCemwEzjgswVNlSc0i9aQby3gXK3p4L9f9bKg+PkxWHqgdtobB
         gBTmV1BLFdXIaJkrW3R4FfHoPDx8YCb32tRG2MXxN9ebsvYsS1TxGLARva3QkGMmCasW
         lyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dQ5umuSq8436wMlByf3kCIwoDGKknSMhF7YGPaWnD5Q=;
        b=20O3ZCj+E341AfmyVdJ0CXonWAT4QmceNsBadDaCl6IS5+cATIXnuqeCTsrcFZ5gHq
         GxJ+rhkav6gLnu7S0veIVuHKClPqwb64Nm3/3wT+HKhD6KrrSi/TklRgUGKhkl9n83Ec
         qBYCXyfOSLDbqpIr9YuUUylKglAQbTyijHwTuot8Z0xqvHkXTrm7OJR/CnOojT0KtGxY
         K7dhEtoQiVlopxluK3PIu0Ivg20VniyqXFr2t6eUCR1rH7uXfGR7Rrly/Gz5oDaPPN0E
         GezWDJOYg9YgkL+L36xwADQGKW1g2ca1jU8DHehOLbJj1K1j9wxx9u5TuEtJYFkOn/si
         CYSw==
X-Gm-Message-State: AOAM531qZd2ssbX++refGLDjdZmI35SpVEpuYbcrPwEu83Pm2H6YBKxn
        RH+s9sNAOjCVgnmWIg1iemODCQ==
X-Google-Smtp-Source: ABdhPJyok0JCAmWum5YMK2Jp0fCntZVRddOmnf5WAtdyyX6FN/oe8WKs2CFIdBNBFVf9ElllHcNDoA==
X-Received: by 2002:a05:6402:190a:b0:427:efb7:bd81 with SMTP id e10-20020a056402190a00b00427efb7bd81mr16739822edz.63.1652094289727;
        Mon, 09 May 2022 04:04:49 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c88-20020a509fe1000000b0042617ba63aasm6011106edf.52.2022.05.09.04.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 04:04:49 -0700 (PDT)
Message-ID: <701b1b81-ef45-e161-056d-38ef92b80765@linaro.org>
Date:   Mon, 9 May 2022 13:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
Content-Language: en-US
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
 <20220508194333.2170161-5-j.neuschaefer@gmx.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220508194333.2170161-5-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08/05/2022 21:43, Jonathan Neuschäfer wrote:
> The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> Add a devicetree binding for it, as well as definitions for the bit
> numbers used by it.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v3:
> - Change clock-output-names and clock-names from "refclk" to "ref", suggested
>   by Krzysztof Kozlowski


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
