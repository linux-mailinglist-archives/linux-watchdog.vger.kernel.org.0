Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D48D350FF24
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Apr 2022 15:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351005AbiDZNhv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Apr 2022 09:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242642AbiDZNhu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Apr 2022 09:37:50 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6AC3D1E1
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Apr 2022 06:34:42 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z19so9104240edx.9
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Apr 2022 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5zRT5sllSsaGeFvu1yaUlRoHxNiWR89igSrOyjo1FG4=;
        b=AfK1/zrk/APNctf5T9jianFlu/dOwBeL60VvN0e/AUy20xraPdotq4gHXNjA82CwJr
         ASxbJYqu/egWXvhpdKoCATOneKWXEB28QPFqU/ljIv7xIVAyep8++QsrKalLELi38q10
         K0gVVa4FyK1t8583z4ZcRnHTJDFCo4aXPEOnCMQPKOVFVeYZy3rM/h2kAQSa7PPkoHke
         gXsnm8Yy78EAhDlPM8YcMa30cLGqmBSUZGqsijkjXNayacWiKkU1T55DciCPfdIoS15v
         /r8zAhYkcEExrX6vnIyglxCze6PJY288k25AKszUJPG1oADUV5q4y7/jD/hKEuA12URa
         AyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5zRT5sllSsaGeFvu1yaUlRoHxNiWR89igSrOyjo1FG4=;
        b=0mk/JSwjLdK9/2zSvxUs2PfoSv+HTAApr0IP4nHy9e9KTBO/VAtzU6tc9mJM2g1SZs
         71I6JTRycpEGEBe9VsWbIFCs5TH+1uD2IPt3yMr2Ptrik/XCyCE80u0NpNyBV1+JHnIk
         FjE4BdtuGg02Vg2QRus4D9+7WRSmf/kSK5/lq64cJF4cDeUZDpgznEh5k4SxsGIvChBH
         QjRnwuNhFgQ5GV4SWDNDAVsq8xRMlTU8QdOoq1h6wT/gD5GWo2hTbll+H8cZyLxHtgNs
         RDmBfGh8b9svgXdRzdv62iNCi1JTf0fAN1dXGzmTRey1cXJzRK3LjsyV8enRpobw2fYW
         rPCQ==
X-Gm-Message-State: AOAM532DL7E+CBU5amIMXldD3for0tFXieRQR44tqehYNt7d82hInK+8
        x7Ta1B5z8qItr854TNiFzvNI8djrMERuJg==
X-Google-Smtp-Source: ABdhPJxrkUCfsREmZu2hMfXwSgf00eMictV7sH2Jynsq9vkfWIIiY5pr9thcID2PxdIUiCu86TY+jQ==
X-Received: by 2002:a05:6402:27cb:b0:423:d386:42be with SMTP id c11-20020a05640227cb00b00423d38642bemr24839191ede.227.1650980081504;
        Tue, 26 Apr 2022 06:34:41 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lf5-20020a170907174500b006f3806fc9cdsm3416854ejc.39.2022.04.26.06.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 06:34:40 -0700 (PDT)
Message-ID: <b9d68100-c6f3-4f58-fe42-63f4cdf1dc50@linaro.org>
Date:   Tue, 26 Apr 2022 15:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 06/11] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Content-Language: en-US
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>,
        Rob Herring <robh@kernel.org>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "joel@jms.id.au" <joel@jms.id.au>, "arnd@arndb.de" <arnd@arndb.de>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-7-nick.hawkins@hpe.com>
 <YmcbCgjD85lIRMSf@robh.at.kernel.org>
 <PH0PR84MB171845F606BC40AD653BEC8888FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR84MB171845F606BC40AD653BEC8888FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26/04/2022 15:21, Hawkins, Nick wrote:
>> How is this h/w controlled? I'm guessing it's part of the timer? If so, you don't need this node. A single node can implement multiple functions.
> 
> It is associated with the timer because of the shared register set. Based on feedback from Krzysztof I need to create a child node for gxp-timer. I therefore will remove this file and move gxp-wdt to the hpe,gxp-timer.yaml as a child node.

I have impression my feedback was about mapping entire address space,
not few registers of watchdog:
https://lore.kernel.org/all/c6309ed8-6e74-67d3-304a-f5399d16cc37@canonical.com/

However later during talks it turned out that the address space is
heavily shared.

Nick,
BTW, do you see my comments in the email I linked above? This v5 makes
the same mistake. We talked about this already, so please make note of
comments you receive and implement them.

Best regards,
Krzysztof
