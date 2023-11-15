Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6691C7E8146
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Nov 2023 19:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344969AbjKJS1J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Nov 2023 13:27:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346059AbjKJS0C (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Nov 2023 13:26:02 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC313A23E
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Nov 2023 07:21:38 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so3445831a12.2
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Nov 2023 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699629697; x=1700234497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lgAp/YVFkVwtZv/LqmHLoLVlAzO8LyeFE07Q6BM+XMc=;
        b=ijoVc6BTKnQrDI5ka9JYmmnxg1oTlCJQUYykYnFMsVAn5hDQUFUTY3UBQ2pyMuA5Xz
         /QM1k7PA9oZhUkpz/v4fEgJzI63RKh6Bq24CcwBZrMW0aMO3Tisrish4nEX8axJZzeRX
         V09HXfsZzD3vP+P6zIoTwQArDWH8w2t3gQ2MBl7rGvC6A4chnfIGcIOfTOU39SnOJZSC
         LO8SlQdwIUozWtkPcnNHHUw3l0jAFnwazvPYPXQfewIncL7Zfw3IuzwlB3X/HF038z61
         PUb6X7IiTRS4ua4PU+rIwMbq4DhouQHrIaVsLXuYwUzmIqm00BHspdSZ/BuQU2QMQHqF
         wn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699629697; x=1700234497;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgAp/YVFkVwtZv/LqmHLoLVlAzO8LyeFE07Q6BM+XMc=;
        b=WGPG2urqvzmJpNIkDYfXGhZKyFoYLeqNXPdDfTYaQP9rIeOmxrSbII93tBppE1qGZC
         dSoDBDPO2EjogFVA/cSp08i0NnmnvnxWOxLgHSHWMtot2cHm1D5c0oJHAtaP4ESdyeZN
         Mz7gXyDtUo7Q6LEGBFaY2kvEjG+bNKjbwzNtPwcUnfWcsDfQthF88zaQmHQfZV5Cl4Wm
         S1boE7eEXpS48JnGkYAa95SPeq1ics21wV1p83EC/rGO3kLpF/d0/2JslOx7X082OQfw
         prDGpV5bZ8XCkxdZwCSNpWDMmPgLnDc1Or2xTvyW18fdaqWhDkneOewUc8wBBzM3QiPU
         ubZQ==
X-Gm-Message-State: AOJu0YweyZwH0qZXsClYO2UBIMxAJ+oDrJrHWhPfgiGhYBnGK6BFqXXR
        MeGKJBKcI1hXzGJmEaSuKKtltw==
X-Google-Smtp-Source: AGHT+IGooRa4Eacb+PACup9i9FXQTW0pXertiNesbXr+sFtKENyq6faKsME0vus2OdZuDJYpgzmEHQ==
X-Received: by 2002:a50:c00a:0:b0:53d:bb21:4d90 with SMTP id r10-20020a50c00a000000b0053dbb214d90mr6641933edb.40.1699629697324;
        Fri, 10 Nov 2023 07:21:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id b98-20020a509f6b000000b00533dd4d2947sm1287058edf.74.2023.11.10.07.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 07:21:36 -0800 (PST)
Message-ID: <bb0ed593-082b-4edd-9a1e-78cccf796677@linaro.org>
Date:   Fri, 10 Nov 2023 16:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <2678cb48-1d2b-47bc-9272-06d9aa140c58@collabora.com>
 <ZU47hV1i66WN8nZJ@makrotopia.org>
 <d7b72b3e-c8f4-4675-ae62-26f5ae576f0a@linaro.org>
 <ZU5A59KO8Y_Q97IG@makrotopia.org>
 <a56cfe76-ab03-4187-b6f1-04a5c3414e64@linaro.org>
 <ZU5DVNOmtyFwUTdC@makrotopia.org>
 <708046ae-a821-420c-959a-ab5cb712aa9e@linaro.org>
 <ZU5IcrjqQpwMopJC@makrotopia.org>
 <6576d4a6-31fa-4780-9a8a-5a1d1974836f@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6576d4a6-31fa-4780-9a8a-5a1d1974836f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/11/2023 16:15, Krzysztof Kozlowski wrote:
>>>> So adding the file to include/dt-bindings/reset/ should go into a
>>>> seperate patch? Because including it with the driver itself gave me
>>>> a checkpath warning telling me that dt-bindings should go seperate,
>>>> which is why I included it with the binding docs.
>>>
>>> No, I said the hunk should be dropped. Removed.
>>
>> I guess we are somehow misunderstanding each other.
>> Lets go with an example. I can put the header into a commit of its own,
>> just like commit
>> 5794dda109fc8 dt-bindings: reset: mt7986: Add reset-controller header file
>> https://lore.kernel.org/r/20220105100456.7126-2-sam.shih@mediatek.com
>>
>> Would that be acceptable? And if not, why?
> 
> ...this question.
> 
> Again, whether this is separate patch - it is still hunk which I think
> should be removed. I gave the reason "why" in this mail thread and in
> multiple other discussions.

I gave you clear reasoning 7 hours ago:
https://lore.kernel.org/all/59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linaro.org/
to which you did not respond.

Best regards,
Krzysztof

