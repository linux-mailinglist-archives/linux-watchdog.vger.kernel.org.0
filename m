Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECF2691ED4
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Feb 2023 13:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbjBJMEd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Feb 2023 07:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjBJMEb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Feb 2023 07:04:31 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA52144A4
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 04:04:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so5515810wms.0
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Feb 2023 04:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NW4lRb3x8TNx1Gls/PFO5RtEAOnWrB+KO6v1IvaIkD0=;
        b=Yyf32YWMAGugyXZbUISG33prMvfHLEuWa0TtwnHpvxxHUhIT/hGEUBqWF6KpoP8b/I
         7uLPmVphkaPQoAmju5QEXmhqo5AxV3E0BUbyILPOjN0StI+FWfuzamFwMyg6jHVeelAQ
         lUBY+bwoD2Ry4LqyC828TuR10CXJC9Soj4I1EcQ+YY94HGIIfTyUiqb/rI8Y7j1AXhrg
         GgytlqlCkNFSSMTX6ZP6uZV72dl8jCvlXAJQCgCjVqkaA3YE4nNtz4a/yISwczMML1z9
         HkRpIe0SWCU7CoL5ZqPofr0Dw09eXiG6xA5wI2ntdtGR3OeamCFthW15aTpjHzI/Ytcb
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NW4lRb3x8TNx1Gls/PFO5RtEAOnWrB+KO6v1IvaIkD0=;
        b=BD121KHAqSwZto84AnTdPruNlL1I+OXxsGNGIJAvsm0JOekkccWVIafavBQ2LO3yu9
         rGE3bs4H1EH0K1qbf5EiCe7W9GU8DiJ0p0Ect/zwWCDZx0myv4zJ1TxEDTmI6R5H9LL0
         iFQrB84K0eXpwsGRZF9Ixq0xu9XXRUuH5ryGBYZl6cA0zBA4ljQA2/FC6n9mQmYUA3Oi
         4RyzsRgqup9v8327WRRnA+gMje/u3QJwFMkMgwKS0PDKKaJUNiVZTS8nwzKuuzzBhjg9
         wf0v+JXidCBSoRCCfS+vBZ7V//BeaGpbiUtnK483r1Y/PGBff/hUJKfjClGpTu48GpM3
         38Sg==
X-Gm-Message-State: AO0yUKVWMNx5QYgbJACHr6LKz4udJzDTFTYXuaBYkSlO/z1jCdDHKhPX
        QwQNaL3CLu+YsyB+w3HKUDU5tw==
X-Google-Smtp-Source: AK7set/mbNck+O74h+wNhQp30sLJ/+Jmho6eC2OYjrXdjxbmlhLi9yt7MySqAkMzWTXJLPVJT14z2A==
X-Received: by 2002:a05:600c:43d2:b0:3db:3e8:feca with SMTP id f18-20020a05600c43d200b003db03e8fecamr1887994wmn.15.1676030668173;
        Fri, 10 Feb 2023 04:04:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003daf6e3bc2fsm13251783wms.1.2023.02.10.04.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:04:27 -0800 (PST)
Message-ID: <6a87b6b7-2059-3b16-b592-ba2ac6e0e4e0@linaro.org>
Date:   Fri, 10 Feb 2023 13:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] watchdog: mt7621-wdt: avoid globals and arch
 dependencies
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-4-sergio.paracuellos@gmail.com>
 <21af8c63-f489-8c3f-e1e3-cf976b1d20d0@linaro.org>
 <CAMhs-H8O634ZbRW7BVkQmTA=B7p3Osu6d9hFGZ7DqXtXydkHBQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H8O634ZbRW7BVkQmTA=B7p3Osu6d9hFGZ7DqXtXydkHBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/02/2023 12:35, Sergio Paracuellos wrote:
>>> -     mt7621_wdt_reset = devm_reset_control_get_exclusive(dev, NULL);
>>> -     if (!IS_ERR(mt7621_wdt_reset))
>>> -             reset_control_deassert(mt7621_wdt_reset);
>>> +     drvdata->sysc = syscon_regmap_lookup_by_phandle(np, "ralink,sysctl");
>>> +     if (IS_ERR(drvdata->sysc))
>>> +             return PTR_ERR(drvdata->sysc);
>>
>> You claim in commit title that you remove some global usage, but you add
>> here several new features and refactor the code significantly. You need
>> to split refactorings, improvements from completely new features. The
>> entire patch is very difficult to understand in current form.
> 
> I am removing global usage and architecture dependencies using a
> watchdog driver data structure so I thought the changes were easy
> enough to review in this way. It seems they are not according to your
> reply :). If preferred I can split this in two commits:
> - Avoid globals using and introducing all the related new driver data
> structure.
> - Add request for regmap syscon from the phandle and remove the
> architecture dependent calls and includes.
> 

Yes, such split sounds better. Thanks.

Best regards,
Krzysztof

