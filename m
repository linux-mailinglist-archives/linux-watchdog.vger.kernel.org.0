Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C9074803E
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jul 2023 10:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjGEI6E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jul 2023 04:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjGEI6D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jul 2023 04:58:03 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D8A11F
        for <linux-watchdog@vger.kernel.org>; Wed,  5 Jul 2023 01:58:02 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69923a715so98991851fa.0
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Jul 2023 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688547480; x=1691139480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ooezHDISTP5WoI5HS8olj7QDU0KGHHznlF81+KKRE8=;
        b=D9oW1xTf7E2yR2lfWEkBLxQIxeRX5NbGf+W+mwDpumZSGHlgUzAYw2E9JDFQ76Gz4b
         Nqgocvgbdi0W2FS7g103lv8St7rSKonWGjTnnNJJSquoHazZr8364aksiBzWU52/Lgts
         gyqjIfSZPRdQ7CE/oR3UYkr8SYKPm4devgUNFx/A5MMZ3zkRSJfhRypvkV8eUgIikfbm
         3w1G0nGZEwJP1s3Y1ovJu1aPtvLY+ms4dAbVv0p9AFngiLE+oD0S67rYZiId+R/q7yHx
         UKUmjmkETZdczJ1xbX60oWshNi3KFel1qUcqjU6cFUJu6MltsHfAQQejRRj9JygzSy6U
         6xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547480; x=1691139480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ooezHDISTP5WoI5HS8olj7QDU0KGHHznlF81+KKRE8=;
        b=LSr2jNdrMzSJPkjYiXsZynWRnP3NDMXNtd25NavqB/p6tteHkbpmkRWC9pZ3QAR02a
         Z71QLia8JcuL/IpvdTpVoJsxyAC5fDV1Xa5Po1L4ahiLfuYLLbSntyM4Opk4+J/F2dvn
         t7b5UxTsUd+f4MBOR2rdZwfaixt4IZsqpnCfoJCIEhqaACF2nwUGdMVxSTYVXniz6VB9
         jkh50Oj+mCV/nxzYfIyLGUJiioqKKocpAdBDxdFN7d2QtzOc3MUQJYvNi3WUbk6kR8PR
         NSIIQNo/3viDH2ry/myZOk33c5F63IqO4PA96OZMkcwMuikMf1EZlG1blikLegJ7UyOH
         RnYw==
X-Gm-Message-State: ABy/qLZnGEaj9w37RvwW0qaij6wq5sdXY4vYRNWNkMVKnk9ch+tb8KOq
        NDShL9qu5d+6pVSetJTEEQfhrg==
X-Google-Smtp-Source: APBJJlFc17+4kniCtz+9dI4BXaX2+imC7dTdNItgNsm1bEK4fLRo3BnS/Cf8ScHAvr2uxbVirMO2eg==
X-Received: by 2002:a2e:991a:0:b0:2b6:e332:d089 with SMTP id v26-20020a2e991a000000b002b6e332d089mr8444815lji.41.1688547480509;
        Wed, 05 Jul 2023 01:58:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s21-20020a170906455500b00992b7ff3993sm7841810ejq.126.2023.07.05.01.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 01:58:00 -0700 (PDT)
Message-ID: <d15656f4-0d39-fbaf-884a-77935cd69e3f@linaro.org>
Date:   Wed, 5 Jul 2023 10:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] watchdog: s3c2410: Fix potential deadlock on
 &wdt->lock
Content-Language: en-US
To:     Chengfeng Ye <dg573847474@gmail.com>, alim.akhtar@samsung.com,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230705072304.37741-1-dg573847474@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705072304.37741-1-dg573847474@gmail.com>
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

On 05/07/2023 09:23, Chengfeng Ye wrote:
> As &wdt->lock is acquired by hard irq s3c2410wdt_irq(), other
> acquisition of the same lock under process context should
> disable irq, otherwise deadlock could happen if the irq preempt
> the execution while the lock is held in process context on the
> same CPU.
> 
> [Deadlock Scenario]
> s3c2410wdt_suspend()
>     -> s3c2410wdt_stop()
>     -> spin_lock(&wdt->lock)
>         <irq iterrupt>
>         -> s3c2410wdt_irq()
>         -> s3c2410wdt_keepalive()
>         -> spin_lock(&wdt->lock) (deadlock here)
> 
> [Deadlock Scenario]
> s3c2410wdt_probe()
>     -> s3c2410wdt_start()
>     -> spin_lock(&wdt->lock)
>         <irq iterrupt>
>         -> s3c2410wdt_irq()
>         -> s3c2410wdt_keepalive()
>         -> spin_lock(&wdt->lock) (deadlock here)
> 
> This flaw was found by an experimental static analysis tool I am
> developing for irq-related deadlock, which reported the above
> warning when analyzing the linux kernel 6.4-rc7 release.
> 
> The tentative patch fix the potential deadlock by spin_lock_irqsave()
> under process context.
> 
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 95416a9bdd4b..2dfc0d6a3004 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -399,10 +399,11 @@ static void __s3c2410wdt_stop(struct s3c2410_wdt *wdt)

Why you didn't update also s3c2410wdt_keepalive()?

Best regards,
Krzysztof

