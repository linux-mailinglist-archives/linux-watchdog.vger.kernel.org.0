Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE548530C09
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbiEWJCg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 05:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbiEWJCb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 05:02:31 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFF022518
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 02:02:20 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 27so11454772ljw.0
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=KRLj4pXWt2o7W1VV0l/wVx0AcbODZvZ5qTc9IhTSoe9KF2JM0D3hmubFBImQ9psh3L
         QCeewgiYglpOJ6XSztimgmABmIIAfOHi9C6YCleGn0wOPmMKQiWDKYqQacc/mULtsGps
         bDztuXUAauEEaNTT6etJjzh4/o8foOV1NuPa+kw7djgPpD0VuAdoy1raZ+uhnoq2vYPj
         0CeJfrtNW/1enVLni8bcCj1MLozx1PuYxfhaJDQPucYewE+k+oXIyrdETEmvpNGlAi4G
         HFwV8opJshXqlZjjy8GbRXkO/cLzfXDloIKAqEhLEfwAfzO4ICqKJn8g8du4spdz3KVE
         vKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dlfET5UONJTRSOldsSXnP8VfMZiQfkrQWEQeer/UsdE=;
        b=6Inoazlim7m2Bwvr2pFM97jDFa+yw9FCVFlb0ad9ktKA15YFRksQW5m4fwjo1lYbU4
         XTepon6Sq/iuDq0CczdiE+B/zJC4fMo3YPTUhrpN5Bx6HtylmbG6pyEzgci0do+o1hwv
         nTrUuIIz2oFGfk8Ivk9sQiHiujO/ttzmM4fGS1x1pT722UAxN+cyBs5IzzSckqesP4J3
         W7oBywpmebaYQkzd9PZI4i707Bn+e5HRYCTQ0h07vghXCnp2k9lwtiANdkA0F54nGqgd
         cVvk/+0E4Z26x4GHm3Xgjd/I/F/tcujJF/VNGUvX580KiGsm3lYK0q85pmBJ2/Hx6gNw
         SnFQ==
X-Gm-Message-State: AOAM531x35nuy7cB99F1WoBX9X9Jii8SiAbeSzW0NJXbX6cBf44m09c3
        6Bv6ok+Mi8gewxibPWe/dhFFpw==
X-Google-Smtp-Source: ABdhPJxvLdpCyy9QQcDde8YxjJo46U2wGyCrj9zc+1giCC5FfKz0vl+qvRHh262fNGonLwftr8mNEA==
X-Received: by 2002:a05:651c:50c:b0:253:e168:f28e with SMTP id o12-20020a05651c050c00b00253e168f28emr6833169ljp.429.1653296538266;
        Mon, 23 May 2022 02:02:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9d43000000b00253dde4720esm1654866ljj.90.2022.05.23.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 02:02:17 -0700 (PDT)
Message-ID: <ec8cb01f-cf9b-2b2d-68ed-96b0b8465537@linaro.org>
Date:   Mon, 23 May 2022 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 14/19] dt-bindings: arm: npcm: Add nuvoton,npcm845
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
 <20220522155046.260146-15-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-15-tmaimon77@gmail.com>
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
> Add a compatible string for Nuvoton BMC NPCM845 SoC and a board
> specific device tree for the NPCM845 (Arbel) evaluation board.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
