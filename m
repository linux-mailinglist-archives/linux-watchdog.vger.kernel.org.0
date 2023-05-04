Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544386F698F
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 May 2023 13:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjEDLIw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 May 2023 07:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjEDLIv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 May 2023 07:08:51 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BF4358A
        for <linux-watchdog@vger.kernel.org>; Thu,  4 May 2023 04:08:50 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so499233a12.0
        for <linux-watchdog@vger.kernel.org>; Thu, 04 May 2023 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683198528; x=1685790528;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGU2jbPQn6t2sze0AsSE9JK2oVMBpoZVTCCBJWP0I9E=;
        b=xoNxjMC0KmOHPsAl76qpFcoXrns5TB9wWi6GV8NCJ0ovgsmZfS/5lsZZvey19iZ0nO
         qK3sFFio/0uMiAeiYxfx6Yj0Mg6lnH/YTus1bN8H82A+f39qWTpXsy0xl5dJ5pxkZsOv
         PjY1RBI7iCmTekUnGE5m6j1h2WykO6c0srXtE4+UrylakGSbXF8bwYgUgfhh38WJvEqL
         FZF2ELPCaaA4/19MGS1Fcw7UfEjljsWs+hVwp7a8yOA0f3v05FzWW5fuBFc9npKRJ8zB
         LzAvfAVDKZyMIifP+X9aKyC5uP96u6fKHUEBs7tn6ljEVBAGpyY35epppMOXFmW2A8he
         t/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198528; x=1685790528;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGU2jbPQn6t2sze0AsSE9JK2oVMBpoZVTCCBJWP0I9E=;
        b=YuJC1sNbSq4lyk8BFxuxxBB0/tVTgLqQS/IfgMugIfAizoFQjisplmTqCN2mWgGtx+
         Vo6rgsgMZEeDKmib0rsWV6P598Ke7i6JhR8Ow7g9j0D0LtyM1VNBYLGpq7To/KHXt6u1
         t9ERo0kv/Dl8b9z5xZ32s0o9sYRVDWvJWCfJDr4gNJxvE4ii2SgnE0zsSMYwKYKUzNj5
         OujDjGue3oTaw/H7SKdxGhDF9Yk4QRyUkDBZ49zLKruzEDTBkGm+EVUQeykNDZDnHJvh
         Oah0vXPBhFVDETyf9Ls1Kkn11NVZOKTL3R5YazPzglOij8kWLKQr2d+dc8yH6Jfpjauv
         rmUg==
X-Gm-Message-State: AC+VfDwim2uNXmcv0Ua/ZRsYlNz8PVT8ThppWvYS9HA4WDkAEflt722a
        5SiJ3ITk22CzbJ4PeJfeuqBUdA==
X-Google-Smtp-Source: ACHHUZ4QQdpUK7oj9UoJ4UfdVPyMjWPBgMfVs/DMbYC+OTthReBajhWNR1Mp5i2gBTajr16BjQIXkA==
X-Received: by 2002:a17:906:4791:b0:965:a00d:ab1e with SMTP id cw17-20020a170906479100b00965a00dab1emr2585563ejc.8.1683198528458;
        Thu, 04 May 2023 04:08:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id lh11-20020a170906f8cb00b0094a789256dcsm18662059ejb.111.2023.05.04.04.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:08:47 -0700 (PDT)
Message-ID: <c6df0d21-21bb-0fb2-a91f-dec9ab46b1ac@linaro.org>
Date:   Thu, 4 May 2023 13:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2 v6] dt-bindings: watchdog: marvell GTI system watchdog
 driver
Content-Language: en-US
To:     Bharat Bhushan <bbhushan2@marvell.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sgoutham@marvell.com
References: <20230504105439.18261-1-bbhushan2@marvell.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230504105439.18261-1-bbhushan2@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/05/2023 12:54, Bharat Bhushan wrote:
> Add binding documentation for the Marvell GTI system
> watchdog driver.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
> v6:
>  - Added missed clocks/clock-name device tree property
>  - wdt-timer-index changed to marvell,wdt-timer-index, added "type"
>    and added more detail to discription
> 
>  .../bindings/watchdog/marvell,gti-wdt.yaml    | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/marvell,gti-wdt.yaml

We did not finish discussion and you immediately send new version. Wait
for review and comments.

The patch has unresolved comments, so to be clear: NAK for now.

Best regards,
Krzysztof

