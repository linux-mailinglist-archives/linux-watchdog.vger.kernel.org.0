Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10BD1531283
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 18:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbiEWOXt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 10:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiEWOXs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 10:23:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B4D62F2
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 07:23:46 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a23so17383152ljd.9
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OyHM0isO5wTAezh/ODRy2XOY7z3TjUO73U16dlah2Lg=;
        b=D+KH/MbaKM1Om37PloyJ8FEP0G0r8HIIgD1a9k9OJsHUHaBc52/jowGD5pw4CYYN8h
         oIWc704WFK7X3+KVKTS1IAGeWcURqmYZKUcDkHuV4mP1DWL6bb04ECgHFPfIeCBw8CJX
         iZMDqlRMytJ7AkpEn0hcqSyvj+5fLmxWDEXPRkGBkVsPkGrcDwMJieeJxl/47Xktpi3E
         rQPyyVvtPzNpE6w0ZIIahgxyc+DrCYm8LKL9UfxvD3hwOKByGv0Tq35FHfKxnxM1ReXJ
         ieCsXLForVSIkGc4vUYq7iQp7IctkU6bNYVy8TKA4H/TkDRENjsRNyMrAb6ErPakBDAu
         Uexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OyHM0isO5wTAezh/ODRy2XOY7z3TjUO73U16dlah2Lg=;
        b=MO9Bc4n5PEh1PskXnevBgXRrnZKPcBcHI0l4ytGxgkYMQTJGa4W4peG7qz9FW2z4ry
         eIl0dJJL8qWMSJ7WoXN2izX+qsambWeCL0cKSgpux27jqO2MetK31ICmQlRYZriaJ06o
         WxSeKNgedUjf3hUjuYO5msyzZDhwfbErhEkRVf0Wies+usyHXyj4G3L0krNWngC539EO
         pmUFUmISnDXLEcP3gvBcaGPE5ZguFBWyHf4JEmb9m9T4BRhwZjxAWoScBRNo4Ty51NIl
         yvY8GN4p/JyvygLTG5KDIMOcvAjFwQLG9ZjQyZrINnhsGPnu2Xv5gRerR/sU/3Yem6J0
         HqKg==
X-Gm-Message-State: AOAM533hR1+VyD/6aJza2KnjRasc/FwQ9Bt+bhhIl9L1PO8PpQK5C2HR
        V+Cb5J+/99lhKttre6XUvq6aXA==
X-Google-Smtp-Source: ABdhPJzfE9KcPqVU5FLAVn8vclloK7K7k3tlIOfGkMLVado59PwidM8O718jmHMHm8H4Z2C7TU4JXQ==
X-Received: by 2002:a05:651c:1792:b0:235:1df3:7b8e with SMTP id bn18-20020a05651c179200b002351df37b8emr13338743ljb.464.1653315824311;
        Mon, 23 May 2022 07:23:44 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s9-20020ac25fa9000000b0047255d211ffsm1996118lfe.302.2022.05.23.07.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 07:23:43 -0700 (PDT)
Message-ID: <96ab5563-ea03-806b-f38e-39ef1ed04093@linaro.org>
Date:   Mon, 23 May 2022 16:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for
 NPCM8XX
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
 <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org>
 <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 23/05/2022 16:03, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments.

Please stop replying in HTML. It's not the format of emails used in the
Linux. It makes very difficult to read your replies.

> 
> 
> On Mon, 23 May 2022 at 12:01, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org <mailto:krzysztof.kozlowski@linaro.org>>
> wrote:
> 
>     On 22/05/2022 17:50, Tomer Maimon wrote:
>     > Add binding document and device tree binding
>     > constants for Nuvoton BMC NPCM8XX reset controller.
>     >
>     > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com
>     <mailto:tmaimon77@gmail.com>>
>     > ---
>     >  .../bindings/reset/nuvoton,npcm-reset.txt     |  17 ++-
>     >  .../dt-bindings/reset/nuvoton,npcm8xx-reset.h | 124
>     ++++++++++++++++++
>     >  2 files changed, 139 insertions(+), 2 deletions(-)
>     >  create mode 100644 include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>     >
>     > diff --git
>     a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
>     b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
>     > index cb1613092ee7..b7eb8615b68b 100644
>     > --- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
>     > +++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
>     > @@ -1,14 +1,15 @@
>     >  Nuvoton NPCM Reset controller
>     > 
>     >  Required properties:
>     > -- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
>     > +- compatible : "nuvoton,npcm750-reset" for Poleg NPCM7XX BMC.
>     > +               "nuvoton,npcm845-reset" for Arbel NPCM8XX BMC.
>     >  - reg : specifies physical base address and size of the register.
>     >  - #reset-cells: must be set to 2
>     >  - syscon: a phandle to access GCR registers.
>     > 
>     >  Optional property:
>     >  - nuvoton,sw-reset-number - Contains the software reset number to
>     restart the SoC.
>     > -  NPCM7xx contain four software reset that represent numbers 1 to 4.
>     > +  NPCM7xx and NPCM8xx contain four software reset that represent
>     numbers 1 to 4.
>     > 
>     >    If 'nuvoton,sw-reset-number' is not specified software reset is
>     disabled.
>     > 
>     > @@ -32,3 +33,15 @@ example:
>     >          };
>     > 
>     >  The index could be found in
>     <dt-bindings/reset/nuvoton,npcm7xx-reset.h>.
>     > +
>     > +Specifying reset lines connected to IP NPCM8XX modules
>     > +======================================================
> 
> we prefer to use the same explanation as the NPCM7XX reset explanation
> in the reset binding document.

??

> 
>     No need to document consumers. Just mention the header.

What explanation? Consumers are trivial. Once you convert it to DT
schema there should be no such code at all.

> 
>     > +example:
>     > +
>     > +        spi0: spi@..... {
>     > +                ...
>     > +                resets = <&rstc NPCM8XX_RESET_IPSRST2
>     NPCM8XX_RESET_PSPI1>;
>     > +                ...
>     > +        };
>     > +
>     > +The index could be found in
>     <dt-bindings/reset/nuvoton,npcm8xx-reset.h>.
>     > diff --git a/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>     b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>     > new file mode 100644
>     > index 000000000000..4b832a0fd1dd
>     > --- /dev/null
>     > +++ b/include/dt-bindings/reset/nuvoton,npcm8xx-reset.h
>     > @@ -0,0 +1,124 @@
>     > +/* SPDX-License-Identifier: GPL-2.0 */
> 
>     Dual license.
> 
> O.K. 
> 
> 
>     > +// Copyright (c) 2022 Nuvoton Technology corporation.
>     > +
>     > +#ifndef _DT_BINDINGS_NPCM8XX_RESET_H
>     > +#define _DT_BINDINGS_NPCM8XX_RESET_H
>     > +
>     > +#define NPCM8XX_RESET_IPSRST1                0x20
>     > +#define NPCM8XX_RESET_IPSRST2                0x24
>     > +#define NPCM8XX_RESET_IPSRST3                0x34
>     > +#define NPCM8XX_RESET_IPSRST4                0x74
> 
>     What are these? All IDs should be incremental, decimal and start from 0.
> 
> Register offset, we use the same method in NPCM7xx. please refer
> https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> <https://elixir.bootlin.com/linux/v5.18/source/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h>
> 
> and the driver asserts the reset according to the reset include definitions 

Register offsets, a device programming model, are not part of bindings.
 Bindings should be independent of programming model, so only IDs are
allowed.

Why did you add register offsets to bindings at the first place?

> 
> 
>     > +
>     > +/* Reset lines on IP1 reset module (NPCM8XX_RESET_IPSRST1) */
>     > +#define NPCM8XX_RESET_GDMA0          3
> 
>     IDs start from 0 and do not have holes.
> 
> This represents the reset BIT in the reset register. 

Again, not programming model in the bindings. No bits, not register
values, no register offsets.


Best regards,
Krzysztof
