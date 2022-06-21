Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC82553675
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 17:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353202AbiFUPmA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 11:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353280AbiFUPlx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 11:41:53 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495402CDF4
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 08:41:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id mf9so8034187ejb.0
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RMRIR+HgYGPk4kqlGjQLW42tNRD3LRift0BoWoXmUl4=;
        b=PJhWavQQw1jz0WHXyX0ZMJ8eR94uUvT1OrTkOanzF8eCB9cRoiHlLFkzlXwgvLP1n3
         V+w0eQKQSencR01efMvM+CLx2hpLOKijSklYzMrRkzLvX77UTUutFGU6uJfiZB1pc98e
         VgYJdmbvnx1PUtVmTp+5NFI05o1TbHCDlbCQjnkikoTILqTKd6MV8Ho+yBGn8ZPN8hEJ
         sCMUvZdkn9wipxnotVkWIriVN5jdQ2mYy29rx649+igSQ202WUBmFIWDarvr2HGs4tJm
         xwmC6Jif32cg5AO1lfdsSE8Kh6DFfzyaj9s8iJixRwkpwtevMnkmSpC2/G3dP/aFLb1B
         NT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RMRIR+HgYGPk4kqlGjQLW42tNRD3LRift0BoWoXmUl4=;
        b=xDTeWHuTYkbQKknRHohzaZYPKAjwq/y0ziwkz0wd45Qo5av8HXCMcR9tvS3PLNa6kh
         g8Jek61GQ7ToYeEIRRaa3SlTonMmu5/G1ePKGtxZpOHRqPNF53rHrnxAoDtT6opHg8wO
         d3aCCjww4oGfJdib525HzPCsjsrr4jo83oGgTEcmQINlcxI5z0JiTSI3mwvSG+SbGlBX
         dC3Y+9xw/nc+XBzs9pDXc5A21yBn0LNul/79DOKcIJDna26+DCsC466IhwgvSIP9pICr
         RhcRrOs9LhF+Dnl+x565CdZQU4vMKKJq8Qxf8IxFFKQDWwI0V23sL9VjGQnit44vC+t5
         l2NA==
X-Gm-Message-State: AJIora8yMqVfk8XDDw9rD2aCEH/K2zAN0O1xq8vIvnGqNinmL+d10F90
        lGRWaBd/1OvcNJnsJv1xea0DuA==
X-Google-Smtp-Source: AGRyM1ukaYxWxV49I7X4K/AxawnLaQ11uVqfavd6zhGXdlYd80VACHz45P5IFtZP8yM2ASJC8c4z9Q==
X-Received: by 2002:a17:907:3f97:b0:711:d61d:df9 with SMTP id hr23-20020a1709073f9700b00711d61d0df9mr26593417ejc.644.1655826109691;
        Tue, 21 Jun 2022 08:41:49 -0700 (PDT)
Received: from [192.168.0.221] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l2-20020a056402124200b004357738e04esm6977188edw.21.2022.06.21.08.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:41:49 -0700 (PDT)
Message-ID: <b1472a38-75e5-9711-3e25-7ca9a74109e2@linaro.org>
Date:   Tue, 21 Jun 2022 17:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 07/18] dt-bindings: reset: npcm: add GCR syscon
 property
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220621131424.162355-1-tmaimon77@gmail.com>
 <20220621131424.162355-8-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621131424.162355-8-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 21/06/2022 15:14, Tomer Maimon wrote:
> Describe syscon property that handles general control registers (GCR) in
> Nuvoton BMC NPCM reset driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/reset/nuvoton,npcm750-reset.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
