Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C2B5462CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Jun 2022 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347164AbiFJJvp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Jun 2022 05:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346512AbiFJJvo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Jun 2022 05:51:44 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78488AEE38
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Jun 2022 02:51:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id v25so34550581eda.6
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Jun 2022 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Su/vdY6lGj+Pr3dmdikt3VdGnrhvMFnJcFP72Ow7dC4=;
        b=zgRwcmTAgD0viyAxwBer3iPOUi0MEbyLAPXlWR/pLQzcQhksejfo8DVt5Rp8mk8mkA
         mWFDWHE1c6WTvhN81Xke8gzP9TCiZyoJPZc+rwPr0H1yzVpPx88rLkPWHn8jRAqgvvuE
         2d17ZSiKC1ioFftJYlL+dL7TfeEfjY7PLCSdMuuSKxvSxPXAn/kYPRlfOmktVPXgNAu2
         InKcNJ9OgyscXNdxac+SDgTm8uQeGyJrdF5GqYQjWSjXhy8TMAkCriZwItIKBlMNuGm0
         Spjfvoscvy/uBhozkRybtDbBFL2Ws+ZfSlvv7KB3+OOOeTCh6eC4W85byY1xuRUIASIC
         TkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Su/vdY6lGj+Pr3dmdikt3VdGnrhvMFnJcFP72Ow7dC4=;
        b=gl/2D1LUaGSF/P3cSqwuHLO3j3s4nMiqcR8oMmDOx0ICs+GuxrAWV2vl5+DvGtJkLW
         9GHqm63vda1pvHI6LefsrOqSGPx7SyvZgvqULBDiV//YFwceZ2fGb/UvbPRg5JlcgmBW
         sjkw3GshEWSNCoT95aZHWaBxAyfVx3v7ol1E+y2QnGDbfVEs0jdhzXGAYMLCgnx+LjEl
         65By+irZkcfnzUJhRmbNNUeywIIeN4HeWOn55nLt0a++Ffh7MsA2JJ0dKoiqcHwy5UqM
         Xx9t0ylY/gJNplp4qXtQTSV199UWcjwipkymVypqMpi1ZzDFZF7+KtradfqvlUH9Vwm7
         /LjQ==
X-Gm-Message-State: AOAM532ezxFmEowEJ6vGPHt45+e35Egm7ivHA/Su2GG5Yakz6v9mXH05
        Hp4tOGE+/eu6qvHiFOHOakWtNA==
X-Google-Smtp-Source: ABdhPJyj6TklRqD3zDYQVccZ7hzIqwXHNLa/IvjlZmFFmrZBmG/TM9HKYw08cXo1RRXjvutTxqKtgA==
X-Received: by 2002:a05:6402:1907:b0:42d:e90e:337 with SMTP id e7-20020a056402190700b0042de90e0337mr51038751edz.405.1654854701058;
        Fri, 10 Jun 2022 02:51:41 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id de46-20020a1709069bee00b0070f6855b90bsm9492759ejc.170.2022.06.10.02.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 02:51:40 -0700 (PDT)
Message-ID: <80f9c2d5-52d9-b03d-c272-ac475ae8c69e@linaro.org>
Date:   Fri, 10 Jun 2022 11:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 10/20] ARM: dts: nuvoton: add reset syscon property
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Robert Hancock <robert.hancock@calian.com>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220608095623.22327-1-tmaimon77@gmail.com>
 <20220608095623.22327-11-tmaimon77@gmail.com>
 <3aa70c91-d6d7-e2eb-9c45-a1fb0a5751ca@linaro.org>
 <CAP6Zq1iCJO3AzHnG7RSQ1pyVwayxs+X3iVM4U=6j2k0EgR7psg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1iCJO3AzHnG7RSQ1pyVwayxs+X3iVM4U=6j2k0EgR7psg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 09/06/2022 23:30, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments
> 
> On Wed, 8 Jun 2022 at 13:07, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 08/06/2022 11:56, Tomer Maimon wrote:
>>> Add nuvoton,sysgcr syscon property to the reset
>>> node to handle the general control registers.
>>
>> Wrong wrapping.
> it will be very helpful if you could point me what wrong wrapped in
> the commit message, is it the explanation or the header? or something
> else?

I pointed you last time. I pointed the exact line, exact rule you need
to follow. I pointed it three times already and three times I said
wrapping is wrong:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

"The body of the explanation, line wrapped at 75 columns, which will be
copied to the permanent changelog to describe this patch."

Your wrapping is not at 75 columns and it causes the commit to be less
readable, without any reason. Please follow Linux kernel coding style/rules.


Best regards,
Krzysztof
