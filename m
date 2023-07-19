Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D50758F67
	for <lists+linux-watchdog@lfdr.de>; Wed, 19 Jul 2023 09:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjGSHrK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Jul 2023 03:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjGSHql (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Jul 2023 03:46:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01272685
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Jul 2023 00:46:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b8392076c9so84975111fa.1
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Jul 2023 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689752785; x=1692344785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gA99ih2FnRCOXCq5xoPhBdPBEfSv+wq4btoWQwv8pf8=;
        b=B7DUTOqJ5kHVkpfy7suxLj1l4s7ROhUxM7lqJdK2OKeYAP9o3KEr6p1USORehmQkmF
         XqOeePO46XFFvZFjqPM9qIqhTAHmJNB8RQhx/njhjA1U1ulTtlKjNGrghGkb8f7jZDN6
         MVEII7pGn3VAoXsR/MulkiOhcvFCr3aVT+LhL9fgWLqdM4ApK101CX0c4LzxoSb1Pc2d
         B+625o8usu6TBvO5zO7KZuRb/0K2NSK2//su6U6CfRuomTe0NMPUBzSRasD5RRri/yAx
         D7L4y6PxtmnP6798wIu1PlbEli0I9DJFaa7tPVHcaHs/pdy5akiE9pti6pt1mcOB2k+5
         5pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752785; x=1692344785;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gA99ih2FnRCOXCq5xoPhBdPBEfSv+wq4btoWQwv8pf8=;
        b=Tmju/kcj4R121OlEf/D2TctlIUIe24nYLosqeQ9x7gBIQ/zts0si81ocRk9RrzTGSR
         Shl4hrK2/21g4JqH4ddC01NAjQJtcKH8u20Joz8xFRCDf77kVa3klC5t24CQ9ZtqK0U2
         hCeLfwKg41CRB6LHj6NYn4nPGn7vNEm/3000ieZZJEcm/kkHkonxVY5CwCCfdm2wox2f
         m0yoWkUKKV4c4A2CBxEwI0pMhiwOHWjzO39kb2AdTng9xNI/20+Q2gSbG1S3PwF7JXrn
         4Gu7bw+DBX7LEIRsI5dI7y4mhV9y4a51axf9l4mJRkzWHW/Prz7oUeq6nXOs7KyAJTKV
         zfHw==
X-Gm-Message-State: ABy/qLb9qiquDSSo/TGEFp42gDx4j0Huws3pSGQq8YcM1LUJLM6RIAe1
        tgnHqafEmx/ljdOEN5yaZSUYKw==
X-Google-Smtp-Source: APBJJlECCKaqB9v8tHPR8n2BKeGIOTR9AOa5V66EyZtfbU/OWVj5YRmUaKSKwIDLFx/eHm9Qwr8lgA==
X-Received: by 2002:a2e:8945:0:b0:2b9:48f1:b195 with SMTP id b5-20020a2e8945000000b002b948f1b195mr4909958ljk.44.1689752785115;
        Wed, 19 Jul 2023 00:46:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dk9-20020a170906f0c900b00988a0765e29sm1965303ejb.104.2023.07.19.00.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:46:24 -0700 (PDT)
Message-ID: <2fe453af-320b-4eba-e8d8-9a7461185276@linaro.org>
Date:   Wed, 19 Jul 2023 09:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/3] dt-bindings: watchdog: ti,rti-wdt: Add support for
 WDIOF_CARDRESET
Content-Language: en-US
To:     huaqian.li@siemens.com, wim@linux-watchdog.org, linux@roeck-us.net,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     huaqianlee@gmail.com, nm@ti.com, vigneshr@ti.com,
        kristo@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jan.kiszka@siemens.com,
        baocheng.su@siemens.com
References: <20230718021007.1338761-1-huaqian.li@siemens.com>
 <20230718021007.1338761-2-huaqian.li@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718021007.1338761-2-huaqian.li@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18/07/2023 04:10, huaqian.li@siemens.com wrote:
> From: Li Hua Qian <huaqian.li@siemens.com>
> 
> TI RTI (Real Time Interrupt) Watchdog doesn't support to record the
> watchdog cause. Add a reserved memory to know the last reboot was caused
> by the watchdog card. In the reserved memory, some specific info will be
> saved to indicate whether the watchdog reset was triggered in last
> boot.
> 
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags you received, when
posting new versions, under or above your Signed-off-by tag. Tools like
b4 can help here. However, there's no need to repost patches *only* to
add the tags. The upstream maintainer will do that for acks received on
the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

