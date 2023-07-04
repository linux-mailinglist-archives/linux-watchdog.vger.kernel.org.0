Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAAD746B30
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jul 2023 09:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjGDHyM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jul 2023 03:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjGDHyH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jul 2023 03:54:07 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7F3173E
        for <linux-watchdog@vger.kernel.org>; Tue,  4 Jul 2023 00:53:32 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992ca792065so549121766b.2
        for <linux-watchdog@vger.kernel.org>; Tue, 04 Jul 2023 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688457208; x=1691049208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrXqUlrBpP30rY5ycLmE0WvwHXAB0h27Bdu5zKC2Elg=;
        b=bCW7pqOJ64xhF0HIEPsHvQ+0+7BWUlVlL1e7z1GGz58BneMnJccND5zP0pNu+jZoNq
         RChj7ohW528rLmyIYzBbvoihB8D3WM04s3IO9ruW/unYLeD6+xi1tBmjQxsQpoGUnb2K
         L54mD+Cy3JttcFFuV1GJ2wtHFTZPAjTwkEafXNme5vNllaltQpGZdGOdMOXhoGoBkrPr
         g2zoolXgnZU1tHiSaglE2nYJX20xuGjrzljbC3iWP7broCuJSxurXCqDczYhhzs0LRbw
         sF2ZHd6i32PioLWh804whUOTJM5EWRoLmz3aCG+BF8kWe/o+pxE7vNI1PAkTEhMigMZi
         gpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457208; x=1691049208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrXqUlrBpP30rY5ycLmE0WvwHXAB0h27Bdu5zKC2Elg=;
        b=dDChX0M4U1atp49AJEhJrHK3a6xr6VWuv4wBb9Lst11r3t2bkuqmUieNI9K9TQA3bG
         OqIEQf56bd9O1od1EJ4NPGjQf8RlOI9MW7GpUHvQsIcZGTU+/u9g8aUmnlxrF10i5PK+
         Eg12ut6AQwfTu8y/jfrnG3UtgBSdN5ykSCiXzfC9MV9JFcweKdnC+mfLBnhyfER6gRss
         kknwO55ttaWr3uY6JQhonyCWCuSH5ppLJRN8hfluzp12UqUK/4OZqNtsnwbzibbHCyok
         umn18nGKhqpeHTQCrz6SglkEGPcxz6Gwrukwcr+tSRLE1P8od6pI2Hw1T+Hj4NiMUUf3
         6D+g==
X-Gm-Message-State: ABy/qLYFb8UHMRS+dZHRQPeVwJDPaLmRYpHoHlO1F7aX2KQYqDBBJh6i
        5Bu17CXE0e2vCG8BzwrF+uzZog==
X-Google-Smtp-Source: APBJJlFWLYHbDmuyT7EitO1lmZ66TFGNuZz7Pz9jO+RKjMKBFNB9oSWYbE0oFCtgp7d5u+4mwtlvUA==
X-Received: by 2002:a17:906:8315:b0:98e:1484:5954 with SMTP id j21-20020a170906831500b0098e14845954mr10230260ejx.71.1688457208285;
        Tue, 04 Jul 2023 00:53:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w10-20020a170906130a00b00992b50fbbe9sm6651031ejb.90.2023.07.04.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:53:27 -0700 (PDT)
Message-ID: <b6d3a872-f32e-bfcd-b603-c08339737045@linaro.org>
Date:   Tue, 4 Jul 2023 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] watchdog: s3c2410: Fix potential deadlock on &wdt->lock
Content-Language: en-US
To:     Chengfeng Ye <dg573847474@gmail.com>, alim.akhtar@samsung.com,
        wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230628164759.67594-1-dg573847474@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628164759.67594-1-dg573847474@gmail.com>
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

On 28/06/2023 18:47, Chengfeng Ye wrote:
> As &wdt->lock is acquired by hard irq s3c2410wdt_irq(),
> other acquisition of the same lock under process context should
> disable irq, otherwise deadlock could happen if the
> irq preempt the execution while the lock is held in process context
> on the same CPU.
> 
>   [Interrupt]: s3c2410wdt_irq
>     -->/root/linux/drivers/watchdog/s3c2410_wdt.c:547
>     -->/root/linux/drivers/watchdog/s3c2410_wdt.c:383
>     -->spin_lock(&wdt->lock);

This interrupt is a threaded interrupt. Therefore the
s3c2410wdt_keepalive() will be called again from process thread. Are you
sure there is deadlock?

Anyway, please also strip unrelated paths and rather use function names,
not references to lines, because these might be not accurate.


Best regards,
Krzysztof

