Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B35311ED
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 18:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbiEWNpj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 09:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236499AbiEWNpi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 09:45:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82A955227
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 06:45:36 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w14so25614220lfl.13
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zc+H13M7Untcjwr72zICcQjR3S3/6AC2C3IvRsS1YwE=;
        b=z8izSdPl0Mu0tqiQDCU131vyaSxZTaquXhrE1uVwkbEE8mczLsr8wjL8/+YYtgKxIy
         QNYcFlVBCUPUH7rRRGQUGcdiQss40NqB1QxOCvv/+3RZkr0xBNt5zafpeBpj4/UGIaa9
         Bx+MN+htpLYPg4i8ASbECiSSSiokzLbPte2Cclf/rMOjuuYsH/TJIMNL4iOCUueEowQr
         qNsiZhJBxTBysmCTSxJw1jp8R051VVOf6ppv+wESpZqyMpF6FkZe304dAvZNJWXfMVSm
         QtZapxr3CD9mw8T8vWcJS5PTt9Dvj9BHU2idrV8uSN3DzfMsrgpmdrwoOjEbmP2t9DWF
         PUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zc+H13M7Untcjwr72zICcQjR3S3/6AC2C3IvRsS1YwE=;
        b=esbvq6sTysrQ01MtfFAoEL/m0CWpxrqQnIdcL/xhNainCpjY28x2j58w9KTEPS51j9
         A0rVWzMWOQCKdPgHMzT4Lzz1+rmwYCbHr5/D3qgF5kEFgLiz5vdpHSIrn9WlRDJLNyH5
         +eo/SUT9T1VCBAMrrT4aWFGR9mGquJCu6qs5z+/COqEhUasOhjgcC7N+WOG6VtbhOwOL
         2wewXZ8tOGcwajcqEPjrZ7bBVVNlmUTbBBy0+Q5iifccJky0OKB6MYwdqVbGhF0S7v19
         lK4F6UjsRfhMzt+gYDXRyVZWyanB960DYhjevtJIS+GxerVjRW2VPbhz1CzszNZcnegk
         SlPg==
X-Gm-Message-State: AOAM533j4lRQ3//S3gbXC0PhiAhCzUjA9GvBW7HKCsYOJ8YvvCaNN+py
        x+ePzp5XcY/3JOL3dZTU+38Y6A==
X-Google-Smtp-Source: ABdhPJxvtrvCzlWyYIRa7RH0L8nWT5DlujuzYkpsoahxhweS6xiwwYRH8VmTez+Udy3bnTWkvO6fUQ==
X-Received: by 2002:ac2:41cf:0:b0:478:69ce:f6ed with SMTP id d15-20020ac241cf000000b0047869cef6edmr5795048lfi.186.1653313535162;
        Mon, 23 May 2022 06:45:35 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a4-20020ac25204000000b00477a1b603basm1987170lfl.98.2022.05.23.06.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 06:45:34 -0700 (PDT)
Message-ID: <661ebb3d-f1c1-1a6a-8723-4d3dff2b92b4@linaro.org>
Date:   Mon, 23 May 2022 15:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 09/19] dt-bindings: reset: add syscon property
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, catalin.marinas@arm.com,
        will@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, jirislaby@kernel.org,
        shawnguo@kernel.org, bjorn.andersson@linaro.org,
        geert+renesas@glider.be, marcel.ziswiler@toradex.com,
        Vinod Koul <vkoul@kernel.org>, biju.das.jz@bp.renesas.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, robert.hancock@calian.com,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        lkundrak@v3.sk, soc@kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-10-tmaimon77@gmail.com>
 <d02b042c-7f6e-8d2b-a5eb-c7ac4a0eea7d@linaro.org>
 <CAP6Zq1gGZguC9h4A6KL8x1QLf3MAZvvBiA2nmcK_4PS7AdNa+Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1gGZguC9h4A6KL8x1QLf3MAZvvBiA2nmcK_4PS7AdNa+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 23/05/2022 15:44, Tomer Maimon wrote:
> On Mon, 23 May 2022 at 10:39, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org <mailto:krzysztof.kozlowski@linaro.org>>
> wrote:
> 
>     On 22/05/2022 17:50, Tomer Maimon wrote:
>     > Describe syscon property that handles GCR registers
>     > in Nuvoton BMC NPCM reset driver.
> 
>     Please wrap according to Linux standards:
>     https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
>     <https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586>
> 
> Which problem do you see with the commit explanation body?

It is wrapped not according to Linux standards.



Best regards,
Krzysztof
