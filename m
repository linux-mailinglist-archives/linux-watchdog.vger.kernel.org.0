Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28AFF7161DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 May 2023 15:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjE3NaC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 May 2023 09:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbjE3N32 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 May 2023 09:29:28 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F64310DE
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 06:28:44 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f7bf3cf9eso867456966b.0
        for <linux-watchdog@vger.kernel.org>; Tue, 30 May 2023 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685453320; x=1688045320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6A+xXqLFRW5fPXvfVtMkX6LKKLoRKsjcMfJO7DhUdik=;
        b=rGjo7SPzrKSY6EqsgQVRt48TIldoTaPYWqJ4d8AGd3N/7kXcz3IVtfw90c0acOKck1
         geEzvO4vKhrbosBH9t63C/h+4PL7LLjLpAwiaYpvbzOBVYhrLk4dCH6Vs2pBKgdb/Sab
         owcB4U6XZjeVvPzSJaKDXrTbYY6wEI0JbKtutAu/SARMLZES4bPop97ma5vG2Ou5/2WJ
         B6HnwEqrZP3i28mC2ZvmLDEJyBSAaXiLwcoNvq12sRCoKV+iLRuuPL4xgQ2QnEuPNJu3
         EYrNOYTSY7pbMBiglG+Ab8iR5J0RPhV/8q7Qe1JUoTHWrZXMY9CV7U1tEJsYDAEs6LQs
         45hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685453320; x=1688045320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6A+xXqLFRW5fPXvfVtMkX6LKKLoRKsjcMfJO7DhUdik=;
        b=OyBGuDF0n9urYkKkx6DdquQeFvK+p16lhVuesCLAq6Ar8lahWE+sFnKx7/RN+5GdWM
         8PDQwnfnZC2sSSdqGkHBDezppJLBAtDTsv/dssKCRgicx9ZEti1VlfA8roh97Sl0KP5W
         9nF6GubvFnffRp/v7pQSiUB2R7+XgdZ7073ypEc9OPzc7bCT3m6Wky6MgnqHhqOC3hcc
         4kHb6SoKQul9q8f9gCdvoXbfw+DBllbBOtpHtKU9q7l4++JS7wNoBxVX5sTbC2Bi1tkj
         r6xRtkW3cm7PM2GavUgxTF3j6P/mHkrojqRxsW1y+B98NlMhToIyHpKzfpdhZhQ4kRfx
         Zl6w==
X-Gm-Message-State: AC+VfDwYMjZXIFIdzkfMV88UQK0Wzb63qyy4ebTX48I+NEzNOHQ+Divi
        fV+Oc2cWgrJRt1LIKeuJQJZy2w==
X-Google-Smtp-Source: ACHHUZ5uWXFecH4hpqdfYXssIU+Y9H1eIyhmt9oBeAgqCNlcWe46eAJq7azf0oz4fVbkd7+2dwimlg==
X-Received: by 2002:a17:907:720c:b0:96f:a190:8381 with SMTP id dr12-20020a170907720c00b0096fa1908381mr2171472ejc.10.1685453319750;
        Tue, 30 May 2023 06:28:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906490b00b00965cfc209d5sm7329293ejq.8.2023.05.30.06.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:28:39 -0700 (PDT)
Message-ID: <0ef5b9dc-0c01-2a36-533f-4959e2e870ca@linaro.org>
Date:   Tue, 30 May 2023 15:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 01/10] arm64: defconfig: enable MT6357 regulator
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
References: <20230203-evk-board-support-v8-0-7019f3fd0adf@baylibre.com>
 <20230203-evk-board-support-v8-1-7019f3fd0adf@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203-evk-board-support-v8-1-7019f3fd0adf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 25/05/2023 10:33, Alexandre Mergnat wrote:
> Enable the power regulator support of MediaTek MT6357 PMIC. This driver
> supports the control of different power rails of device through
> regulator interface.
> 

It's nice to say which boards/SoCs use it which would justify why we
want it in defconfig.

Your last sentence brings no new information - it's kind of obvious for
every PMIC. Instead of redundant information add something actually
missing - why do we need it in defconfig, IOW, what platform needs it?

Best regards,
Krzysztof

