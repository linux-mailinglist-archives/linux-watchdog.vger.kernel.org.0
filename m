Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CA250D24E
	for <lists+linux-watchdog@lfdr.de>; Sun, 24 Apr 2022 16:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239372AbiDXOiK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 24 Apr 2022 10:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239390AbiDXOiI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 24 Apr 2022 10:38:08 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBF525E9
        for <linux-watchdog@vger.kernel.org>; Sun, 24 Apr 2022 07:35:06 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id g6so2200927ejw.1
        for <linux-watchdog@vger.kernel.org>; Sun, 24 Apr 2022 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p1y92a0ys+8BlMzltV+6PRIoIaIyS44PSnqPymzsofQ=;
        b=AxiFwcakAZ85Cx/Vk+IkgBSKmvjbjzXleCHVk+Xgs+rds5tu0BvlrNLokAKjHndSpj
         4BA43JSPLn4/ZMIRDgXoOPvtoH87VTZGDI4QpP06U+yQHfdT20zc5A6oYSd9nuc13s2B
         chq7cZLR5t7jUQ9XCuld83N9MfAi6OIsaKPq/+5PW5zQJoNxsYXHrtLgG4U0r6JLRVf2
         krwg6PB88AzCd8UxIQEvEcrF/XIODEHHJHamnicXzzPglOyXbKD2Gi5RifUoIZHqovVv
         vXke64PJqQHGwsW/JGnwVHi2sCmivqZYTqi9+Y4IbmcdkLxDPMKsUr7xFS9vsrdzGf32
         iA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p1y92a0ys+8BlMzltV+6PRIoIaIyS44PSnqPymzsofQ=;
        b=mzYQxb7wX/IWulnTdk/8zxv6A+z9JJB8ZVi3H56RjiJ1xalQQy4GxwWjdZqgST0vW3
         sYdsoaLDrKNf4tMgPkLzeGr3oUMlzwxMVKb0SSoXD3B0QjmpeJzA6zs/n/pNEn75DZTk
         3e5iuK+m2xx/OD0f8KKuewjVPXXRpDGwRlB9Ci3RQuDXv7SOvae/UDiKS7Wlo32+r3i0
         SyaE6mQimmovaBmtwL6Szou1zT6uMLkWN4aBLdTDz2zXOTW53Nf/Nv6IPrAVgF6TudCl
         3aR70glsFzg0pzFxUnHGx+Uh9vHFG/ZdGo2z/ge5+AidIpqWppZgLo0mHLHCvNbKKneQ
         DebQ==
X-Gm-Message-State: AOAM531X7ENnczpuJg4kDZExYlcg5/2u2ixjCvtTgbXuIhZ25yepc8YX
        rYn62NvLmOJdrVQsIv049LNMNQ==
X-Google-Smtp-Source: ABdhPJwUNA/D4wNods/8Z3rAYGlxdB6I9sADPoEXHCjRgzVW2s7MzjjbBg48uChf5qMNZ/g7HSouhQ==
X-Received: by 2002:a17:906:6a11:b0:6e8:d248:f8ea with SMTP id qw17-20020a1709066a1100b006e8d248f8eamr12181727ejc.500.1650810905208;
        Sun, 24 Apr 2022 07:35:05 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b00418b0c7fbbfsm3328532edb.32.2022.04.24.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 07:35:04 -0700 (PDT)
Message-ID: <a1a03326-0c7f-5478-2493-326cae0fa7d9@linaro.org>
Date:   Sun, 24 Apr 2022 16:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: watchdog: renesas,wdt: Document RZ/G2UL SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424071323.151757-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 24/04/2022 09:13, Biju Das wrote:
> Document RZ/G2UL WDT bindings. RZ/G2UL WDT is similar to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-wdt" will be used as a fallback.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
