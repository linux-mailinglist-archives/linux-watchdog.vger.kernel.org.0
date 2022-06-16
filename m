Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7DE54E23D
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jun 2022 15:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377188AbiFPNm4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jun 2022 09:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbiFPNmz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jun 2022 09:42:55 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663801583B
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jun 2022 06:42:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id a10so1460552pju.3
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jun 2022 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aNEeKuprTbTs5LWWfeMDjy1KZmrz1EiAxXm6JSqXnbU=;
        b=AtLPdduL5q5b2YWCXSxu/s0KWycSnUha2yes+KuNgoj+MI0badVhC6uG83O5867Yqq
         3Yf/wqsNPawZn2q34DI9FdzVHmnUMppElAyOKygqRFaNM4vpt3gvNjCdIesBdQb9lLWP
         OOjzODwWOx7k1tBExXpcJzf+ZULGERqNptgKw3xKFCKun6tEEsZQqErgxy+y9fbwRk+c
         Q1pLGwXF2mVxiuLfEbGgHQM68raYem8K8h8T9PhsWwOUB3qKn56p7Wafz0+YaQ48qL8U
         u9hcjHSRkMcRKB88ZXLfN1B4GkTDNCC689K8WcTHOLnr3S6ML111WPyr5DI31g2t/D2W
         5HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aNEeKuprTbTs5LWWfeMDjy1KZmrz1EiAxXm6JSqXnbU=;
        b=KY/0zLH0zuFn88WuBgvUHF8OeqZnEHJNt80+Icr8vF5FJMRWvgehfhsiBmgZWuBKe6
         daDXYg/te7kPB1lo41kEEfTA7Fh2iJCPwCuos7CvgajqZRN5ovWlvO6mQ5vB3Br6InhR
         Ta9bKTwni4AE0KAAinXlS59NIFNr+kVfDu7hW88CYrRWmVbDYFEjRUgztVVotolRR6x7
         CjeIf9OVaFOy2Sjb70PqYnglu1A1/H3hfMDgZFU1NnFy50emzxXOpK2x03Itn0wBIqgL
         5yyz7qynuZvzjl+WDIaadkbfAVlQ1grnZuBNRCzhazfIYMlN6V4pEgoU2P4BAAZVqicu
         ruZQ==
X-Gm-Message-State: AJIora9ZRfnfFQ2CgZUr+d6UvgMvsab2zgPFQbj8dSPt5JMWQDRm1v+Z
        mx73Ck5iTXC/VqwbWQP3Ui7pVg==
X-Google-Smtp-Source: AGRyM1uOiNZH9+Db6fJogZkx01+5krAEqlx/kpcj5J7iOOcLUTZi02KkxtOsyTtdg6Sg5lx9L6FqFw==
X-Received: by 2002:a17:90b:4c4e:b0:1e3:368b:c09c with SMTP id np14-20020a17090b4c4e00b001e3368bc09cmr5181474pjb.140.1655386971761;
        Thu, 16 Jun 2022 06:42:51 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id c2-20020a639602000000b003fb098151c9sm1775868pge.64.2022.06.16.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:42:51 -0700 (PDT)
Message-ID: <ff933448-433c-30a5-765b-4a86069c239c@linaro.org>
Date:   Thu, 16 Jun 2022 06:42:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 12/20] dt-bindings: reset: npcm: Add support for
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
 <20220608095623.22327-13-tmaimon77@gmail.com>
 <add025b6-c622-b204-d39e-67b31878d37f@linaro.org>
 <CAP6Zq1iDbB+X5QPE4Nsqk4nV41bZiVzQZExS1pQTuKEBz-iYew@mail.gmail.com>
 <381ff739-e898-8812-d549-df7101f0eaa2@linaro.org>
 <CAP6Zq1j=x3OcOPSOjJJmOcze7ziM=oWcKdbYzoHhGnvZipu_UQ@mail.gmail.com>
 <e6e478a5-9080-fb2f-9ccd-2490cdfab4c7@linaro.org>
 <CAP6Zq1gy=rj-wyqqNQF+Pt1dtHsf+90AnTGTqt-v9madj8tfGA@mail.gmail.com>
 <d3432cce-079e-3d6d-91df-6da10bd69d08@linaro.org>
 <CAP6Zq1jdMN_vB1Uoi6rb_E1DydS7+-A0sWMRNUhDPF4pzkr2kA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1jdMN_vB1Uoi6rb_E1DydS7+-A0sWMRNUhDPF4pzkr2kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 16/06/2022 06:41, Tomer Maimon wrote:

>>>> What is NPCM-ADC document file? What do you want to describe there?
>>>> Again - how is it different than interrupts?
>>> It is not different from the interrupts.
>>> I will remove the dt-binding reset include file, the reset property
>>> will use numbers and not macro's.
>>
>> I have no clue what are you referring now... This is NPCM8xx and it has
>> no binding header with reset values. What to remove then?
> I refer nuvoton,npcm8xx-reset.h file, we don't need it.

There is no such file in kernel, I believe. If you refer to the patchset
here, then of course it should not be sent.


Best regards,
Krzysztof
