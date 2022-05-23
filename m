Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D73530BE6
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 11:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiEWJCu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 05:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiEWJCm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 05:02:42 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5696C2251B
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 02:02:33 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q1so6723555ljb.5
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ljrd9sPBtTP1ZdWylTJaxJQwiOMaV0RsKrtAyaEmj6o=;
        b=Ufac/zzCH/P/QeskduOb3+8+mNnnrWiXQj/J0i5e/iKzzWXFcA/6bBNOr+FR1fVI4Z
         BCGaF65u3k7jqeSLd8BLX6uz0+HDNsh1yLh+AvjYj5rA42s6nb2uKrp6dKLMNaCLX/Xb
         N9A+ZX2U07Ftw5p1Vx0LT3suxVk9PVmPb3yM6taB53ffx0C8IH1GJgnyF67/Bq2I2n1f
         q+bMDPOvC5fkycgdlsg6KMRIfddk5qIRcVRo2PhzyxRuR6TaUAYE7QDPIbAOGzg/DNfh
         Ve+w7OMnushQgIM8vrvhjR+kNumnBMNIJ2jFamt0dU/8RTRTgg3zv/8brgAuTu/aSxSC
         +e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ljrd9sPBtTP1ZdWylTJaxJQwiOMaV0RsKrtAyaEmj6o=;
        b=cFKMWInpREm3ehuzI2u2P4xyBBi31mmfuvQ12bV0IJDBrJlby11MQH92hKHJxbIVkM
         RZRsXXNhvXmtiWr7DoIDl3Q5FtTCNHyvEnlGGhUR/QP49xLrcxxA0JagphNqfog8L2M6
         sA0KiMzj1OTNEW4HnliqTfDToE0NJD5cx3XP39uYN8+zfrOohD0quySY+pKXJUKAHr5M
         PLhy47Kt9sLKGFQvSswQCdZzlb7K6u1k26uHA8Y6GMh1QTBvHt1hcrSpIQ6rw8gl8Rqv
         r5HzITSa7+7PN9tekB5ZhTmFOqzAqH1OgLQozN6TiQ18x2zMeWFusJps0ic5eBeCaPtz
         auKw==
X-Gm-Message-State: AOAM533/fMp5jIqjSls6G9PuOp04lVqRWGgZ76oUyccCZCsg/TUkRTC9
        zfRkCqXuXixzZay2Ri0wQF36rA==
X-Google-Smtp-Source: ABdhPJypNw8ZqJ8C7Db1xwPEHrcAFbfCarFFD/xaG/JNVZP1XnFEmL+ADmOIzXWaBvyW+bXEriRUnA==
X-Received: by 2002:a2e:a26d:0:b0:253:d7b4:1d9a with SMTP id k13-20020a2ea26d000000b00253d7b41d9amr11109878ljm.203.1653296551485;
        Mon, 23 May 2022 02:02:31 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c6-20020ac24146000000b00477b0cfc990sm1864559lfi.30.2022.05.23.02.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 02:02:31 -0700 (PDT)
Message-ID: <3338df85-485d-25ac-e912-411e600ed851@linaro.org>
Date:   Mon, 23 May 2022 11:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 15/19] dt-bindings: arm: npcm: Add nuvoton,npcm845 GCR
 compatible string
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
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-16-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-16-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845
> global control registers (GCR).
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
