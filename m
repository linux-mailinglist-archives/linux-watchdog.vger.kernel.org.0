Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02912605FAB
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Oct 2022 14:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiJTMEY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Oct 2022 08:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiJTMET (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Oct 2022 08:04:19 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CBC180584
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Oct 2022 05:04:17 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id mx8so13316884qvb.8
        for <linux-watchdog@vger.kernel.org>; Thu, 20 Oct 2022 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIjHgbekdrLhXaNX8sPMK+VMNRdE5UzPgT2D3wtyzRQ=;
        b=qyIbV0EcV9VezHle3vZHJnj4em1DDdeqMex30KkmXi6+sRdr2rEIssIhQg4FXhZ9u9
         8Slj2qKuAm2606gsoi3o8ytUf0wXf0tF/Es8iWkLVJh+z0fM0AdeKW9gzYlzrb6IeVF9
         UDR9saj1ulerQQovuuArtWp99kiuwBjLuaK1DKBuzkfJdgiaXIit+JuoN1Ydbsw8xUP0
         wNCU7Dras7o7Mxy3+BykRsnqMXZZqa4zDLI+sI60oJsvC682gq5+z+NCEFK5o8A4azwh
         k4WtRbeyrK9KnQIP5RIK/dNshyD7ZGVRU0vs/RzzgrD+R6fh4R1rBmQ1UOxs9DD5o+Nc
         FUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIjHgbekdrLhXaNX8sPMK+VMNRdE5UzPgT2D3wtyzRQ=;
        b=BRVgkLqQrApYHxWxvck3cXlnmBmBKvK/9toe6sL+LkMiNCMv8eJYl5lmnTQls3WBJA
         6OKIk7WOdE/V8SCFcrLJH5F269T2Vc92aItMAyhIFb2nsiVBZQCIqUu55X2acrKyO/TL
         gaaaHSCfYzKcdR8ARSqcrTyeIk4uhZ/hfw2DbPDh4wjigipKpMVNcO8Se865QvmAsDtj
         f/d9B6qqYa+U9irw7vznGwlb0omxMf34p1Hk3VmGGPgUwcspdB0keCdCpud1+phvYyUY
         RvJHtBys5Pls3aI+gd4NWdVq7yhHvvYE1fler02p7cL0EVC23tMRS2/w8rXz1v7h5ggx
         lwKw==
X-Gm-Message-State: ACrzQf1ff0ZlTP2FBaac765VAeJP9XDRR7bfi4tDLvotL1LffyllLUyc
        3LeOq2gsvC62vjwSPCeaF+UWLA==
X-Google-Smtp-Source: AMsMyM6jEfplEuwXQfOfvIt5JgKv1oNIDJQs9EXcWJ+jPPAtGVT2PmC+CDmJ24XbDVtY2o/jPTeXfg==
X-Received: by 2002:a0c:f348:0:b0:4b6:8abb:aa44 with SMTP id e8-20020a0cf348000000b004b68abbaa44mr5259490qvm.24.1666267456509;
        Thu, 20 Oct 2022 05:04:16 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id l13-20020ac84a8d000000b00342f8d4d0basm5982148qtq.43.2022.10.20.05.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 05:04:15 -0700 (PDT)
Message-ID: <77b2cb61-2a31-39aa-69fe-a323a5e91b8d@linaro.org>
Date:   Thu, 20 Oct 2022 08:04:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 0/3] Suspending i.MX watchdog in WAIT mode
Content-Language: en-US
To:     Andrej Picej <andrej.picej@norik.com>,
        linux-watchdog@vger.kernel.org
Cc:     shawnguo@kernel.org, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com, festevam@gmail.com,
        kernel@pengutronix.de, s.hauer@pengutronix.de,
        wim@linux-watchdog.org, robh+dt@kernel.org
References: <20221019111714.1953262-1-andrej.picej@norik.com>
 <5bf984f4-681c-7001-281f-f35bb7fdfc8b@linaro.org>
 <7b3bc437-6b92-4691-fd95-08e408b1c962@norik.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7b3bc437-6b92-4691-fd95-08e408b1c962@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/10/2022 01:49, Andrej Picej wrote:
> Hi Krzysztof,
> 
> On 19. 10. 22 17:46, Krzysztof Kozlowski wrote:
>> On 19/10/2022 07:17, Andrej Picej wrote:
>>> The i.MX6 watchdog can't be stopped once started. This means that
>>> special hardware suspend needs to be configured when the device enters
>>> low-power modes.
>>> Usually i.MX devices have two bits which deal with this:
>>> - WDZST bit disables the timer in "deeper" low power modes and
>>> - WDW bit disables the timer in "WAIT" mode which corresponds with
>>> Linux's "freeze" low-power mode.
>>>
>>> WDZST bit support is already in place since 1a9c5efa576e ("watchdog: imx2_wdt: disable watchdog timer during low power mode").
>>> WDW bit is not common for all imx2-wdt supported devices, therefore use
>>> a new device-tree property "fsl,suspend-in-wait" which suspends the
>>> watchdog in "WAIT" mode.
>>>
>>> Andrej Picej (3):
>>>    watchdog: imx2_wdg: suspend watchdog in WAIT mode
>>>    dt-bindings: watchdog: fsl-imx: document suspend in wait mode
>>>    ARM: dts: imx6ul/ull: suspend i.MX6UL watchdog in wait mode
>>>
>>>   .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 5 +++++
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
> 
> I thought I did. I run that script on linux-watchdog.git, master branch.
> I thought I should base my patches meant for watchdog subsystem there?

Maintainer's tree should be fine, but then the issue is somewhere else,
because your CC list was not complete.


Best regards,
Krzysztof

