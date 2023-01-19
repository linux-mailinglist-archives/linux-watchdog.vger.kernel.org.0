Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B68673A87
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jan 2023 14:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbjASNkM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 19 Jan 2023 08:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjASNj7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 19 Jan 2023 08:39:59 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C7A78577
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Jan 2023 05:39:46 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2818717wmq.1
        for <linux-watchdog@vger.kernel.org>; Thu, 19 Jan 2023 05:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x54PsvSJrUWZ3Ays1aCH/IdM2LqEGA4QmPi7yM4uHbw=;
        b=eYJ6mVKq92zjp4Lwqch+2Z4Od7QIHCJSfOhBQALZzLgkSQuGCZJnz1ZuWgoKJI9/1q
         0tReaXQeZbB2Uz6etKEkx3VIDWaDXt1lcUKdRlF1GEWHJNkrNZvk6KBijxSq6w4PhREd
         VmFAslg5rdTTovAhj9Tilah5+05w2gY7UI4LkkBzgvc+LnfuuhWkdmOiHiGAzYpkc7UP
         2lTjc7mtYFaT03m7nrrDjEmUEQ6wgllkrXHHT2LTuVaUQJNKvsDbAvTVmxuePXJuxV1t
         KRYepocEZ7hBlZTpfZKS9nA1q91oirZQNF5Vnm/ELPgYppivjwqRgpMO0MmOSzEkhgXj
         xmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x54PsvSJrUWZ3Ays1aCH/IdM2LqEGA4QmPi7yM4uHbw=;
        b=EI+O2Huh1irTuBFo7Zrqb8InLknjUnMPExaYoWgqLy8HWQSURqdXGGQOuikJCP+r0G
         nCH287rkzhXBKhhwIVUQY4MgsyVxlo06qNjZu8Q04opzQNZprOjBuYiep6l0bZ88xCiz
         85Pb55EKJb5pzTuw3k2lkMamhEJiFe6dT2TKRk23CfL/wE9+5sn2U4gPU8kyw23dawV9
         iYomARbf3cyA1RZj1pugBfSdw3kYULa/EPqu0A7Qu1QhM2NxjArXLp3nusI6bHKslEVT
         8APVctKr9tbnAlV4c+M72mH7U2PkoUD3PNPn1Gde23lFOt+TYrYQS3dfB4XgNp8mseW3
         EPGw==
X-Gm-Message-State: AFqh2kp8jn7kiqoPdFsncoa0ctFFyZfn54w6+wRvvcA3RyxgpV4kPzyy
        XQHBFFeIC+3BT3pm9p4cMhOyvw==
X-Google-Smtp-Source: AMrXdXtAYO2zZFbWI/J9FVL9WKGDPFAVxXccI6pDOpc6BAXq78jkPzq/Htgf+9XwXAolkaQh9eqHOg==
X-Received: by 2002:a05:600c:1c83:b0:3da:fbd8:59a0 with SMTP id k3-20020a05600c1c8300b003dafbd859a0mr10403875wms.11.1674135584797;
        Thu, 19 Jan 2023 05:39:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m13-20020adfe94d000000b002714b3d2348sm33875086wrn.25.2023.01.19.05.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:39:43 -0800 (PST)
Message-ID: <6e335ddf-01eb-56e7-8bff-cebcfe4936ee@linaro.org>
Date:   Thu, 19 Jan 2023 14:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: watchdog: Add binding for Qualcomm SM6115
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, agross@kernel.org, andersson@kernel.org,
        saiprakash.ranjan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230119122619.1020908-1-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119122619.1020908-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 19/01/2023 13:26, Bhupesh Sharma wrote:
> Add devicetree binding for watchdog present on Qualcomm
> SM6115 SoC.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.

With above:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

