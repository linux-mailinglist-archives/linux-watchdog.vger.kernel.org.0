Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CEB75C91F
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Jul 2023 16:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjGUOJI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Jul 2023 10:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbjGUOI5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Jul 2023 10:08:57 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B743AAE
        for <linux-watchdog@vger.kernel.org>; Fri, 21 Jul 2023 07:08:44 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b93fba1f62so28779261fa.1
        for <linux-watchdog@vger.kernel.org>; Fri, 21 Jul 2023 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689948523; x=1690553323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdCDvX2ENQQi+dpK3c6L7rSwh7ZxpQvyjeSTayf+l4A=;
        b=mKpa85MjZm0wM2/mDCVf9XYQEXqHnC0zrrCUULJJt2k97Ivcladhym49AqIJy7+Cl6
         M68rFARHi81TAQJXWEUS1FYzNXin0hZbhFEFSIzyz0akk/YVbt8GKI7i1JU6Wbhd2lqU
         QOxvFaJcPysmvURITXByzqQERED004zQDaoA/oKyBTElV1S52Qd2ZHxnkLx+wr7VyRv3
         Aw8GSkEJP3SExUtN/YZgkoBVcRyf5/bJ61snewbba4LU6Pe0oAAHNa6hFgRSvTV30hyz
         TujMWvjygIWFj2lESeXLXp5/tCCPHd4jXPTfUK933o8JRD3N8BQjMsDSwwNVnhYuu5Vs
         LxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689948523; x=1690553323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdCDvX2ENQQi+dpK3c6L7rSwh7ZxpQvyjeSTayf+l4A=;
        b=a2LT4yXsjiFxXSftoZE1HqezFinnR9I2pjwSrkcv7a//m2qQuPrbZpzCZHyJnHQIK6
         2yM+KGiInFxQ+z0xpg7JCxxdQlEjDKBzibEzYsPQeMkAAZjAp/KgFwupaOuSpk+CU4RI
         otiCF+GU0VyO7kdpw5Hnm+zIp3ZB5jZVr+gacPGeyMsEd+tmWm4B4e0suybHHKKgSYTl
         uBhtaTKnmanFseHLs60HUUdgCxvs/2ZeX+PTwL5Bh/v88h8zoRwj6C5dObZmIPe0Crbq
         A6tGb9fFxp6iKfgfE/NkjycA/gkdaszw7JeJow/oq9rbwzO4JJ+/QF4pDcaDEY9z4Ibr
         UMvA==
X-Gm-Message-State: ABy/qLaVq3pv0tpbADSSUfV3ePR9AaEOQLjopiIyqjTEwKlro9Gm8VNu
        3o45kh+tES2GQ0baTkr5N9uKdg==
X-Google-Smtp-Source: APBJJlGitP6YdoZI8bIFpNGAsIBqr0u+J3Lfy5UXxN6m18CjoA/M+91KX09TKjqALw4XfrZGY2rXuA==
X-Received: by 2002:a05:6512:3054:b0:4fb:b11:c99e with SMTP id b20-20020a056512305400b004fb0b11c99emr1401012lfb.56.1689948522863;
        Fri, 21 Jul 2023 07:08:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r1-20020adfce81000000b0031128382ed0sm4321269wrn.83.2023.07.21.07.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:08:41 -0700 (PDT)
Message-ID: <22521abf-db55-aec6-fb96-fdb585ef6132@linaro.org>
Date:   Fri, 21 Jul 2023 16:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 12/42] dt-bindings: watchdog: Add Cirrus EP93x
Content-Language: en-US
To:     nikita.shubin@maquefel.me,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Lukasz Majewski <lukma@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sebastian Reichel <sre@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Damien Le Moal <dlemoal@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Peters <mpeters@embeddedTS.com>,
        Kris Bahnsen <kris@embeddedTS.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
        netdev@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
        linux-input@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-12-3d63a5f1103e@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> This adds device tree bindings for the Cirrus Logic EP93xx

Every patch:

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Best regards,
Krzysztof

