Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC76AAB50
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Mar 2023 17:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjCDQ6e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Mar 2023 11:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjCDQ6d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Mar 2023 11:58:33 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4B6F949;
        Sat,  4 Mar 2023 08:58:32 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id y9so2779428ill.3;
        Sat, 04 Mar 2023 08:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677949112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mXHMxKiQpdEvBUwTK84G4qisqUbRdyy0vBr1OD0jAO8=;
        b=DCbyVZFRxYhq0P/1hugd/seYAeM309dEZ44jzhtCo/17mmbgeyGLtiHikjq/bz4Uaz
         ShiDqzyioZI3nKijZSW4xg4bTZ3ruqEOFeSZvXPBrlfsg2k0BcRV+pRVzeGYJNXjWP0E
         mYu9OBZfyRqdPa4gse8KZmpM+rjjCh6YYAEBjbvRR7G6AnBxxGz5R2LvQwL2UN3Y1ZCn
         NkAYnh7bmTQn7VDBMPBAM+RpwgCNFbqh71SL6Dej4VBXUzqT8zrGFxD+f5pzhbCyqD2P
         8WknMdXYVjdc45T/mS9wCzeQmV2j1sGerlaIUdt4tZeLIUDUKgzMlVcUX9rKSHmLuxCp
         oN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXHMxKiQpdEvBUwTK84G4qisqUbRdyy0vBr1OD0jAO8=;
        b=xYoiHjtaGCPKCNmniQoLwq2D6cBRuZS+BA67BOBBuHc5uowhE/JlqUOo37LRmboE5C
         J6w6CJRSh1/KCZUw2jvZvbUlVZtpbz0FSe0O9V8bM/kdZn2vaUfYTcPyLQ4cVg2hB8Pj
         GsnH2z2CcTLz9J82IKqNGgSBektp8HsCGa1IVGYrrhNW0pCci7gMf+I9mL5B3war476e
         UaiQESnxUJMllHIdblkJhm0z7NYOfJZkJF1fXSXjfH0gy+8zip1Y0oZ9S9dM9FetTCxg
         AbzvGqyHjarkrWN9RgL8MLL5Mf5zxY6ozsqLvk5/kkVISFHun6SuYXZhvLEPhoGUEcwa
         1ZKw==
X-Gm-Message-State: AO0yUKXqEFna2cZTAvzfyLBZDJnuEoBo+WiqxLAvlugObqrdXXmT6cyS
        QDWAn5d7kEZv7H+bPdp+QNP7LXIdxC8=
X-Google-Smtp-Source: AK7set/SStAzUz+j2lIMM7yJ9JxoIUo2sZueKu/5sxIAlTxQrCRv0IKdJxRjrPfG/HluOCL3h8hV3A==
X-Received: by 2002:a05:6e02:16ca:b0:316:ecbf:5573 with SMTP id 10-20020a056e0216ca00b00316ecbf5573mr5737636ilx.12.1677949112150;
        Sat, 04 Mar 2023 08:58:32 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j17-20020a02a691000000b0039deb26853csm1737823jam.10.2023.03.04.08.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 08:58:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8a618518-ce20-9244-19ab-6badcd3cdf12@roeck-us.net>
Date:   Sat, 4 Mar 2023 08:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/34] watchdog: s3c2410: Don't skip cleanup in remove's
 error path
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Doug Anderson <dianders@chromium.org>,
        Leela Krishna Amudala <leela.krishna@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-2-u.kleine-koenig@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230303213716.2123717-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Uwe,

On 3/3/23 13:36, Uwe Kleine-König wrote:
> Returning early in a platform driver's remove callback is wrong. In this
> case the watchdog device is never removed although it's parent is gone
> which likely can trigger a use-after-free in sysfs. Also the two used
> clocks will never be disabled.
> 
> Instead only warn if s3c2410wdt_enable() fails and cleanup. Note that
> returning 0 is the right thing to do then to suppress another warning
> message by the driver core.
> 
> Fixes: 4f1f653a68d6 ("watchdog: s3c2410_wdt: use syscon regmap interface to configure pmu register")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/watchdog/s3c2410_wdt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 200ba236a72e..cf104a844a43 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -782,7 +782,8 @@ static int s3c2410wdt_remove(struct platform_device *dev)
>   
>   	ret = s3c2410wdt_enable(wdt, false);
>   	if (ret < 0)
> -		return ret;
> +		dev_warn(&dev->dev,
> +			 "Failed to disable watchdog (%pe)\n", ERR_PTR(ret));
>   
>   	watchdog_unregister_device(&wdt->wdt_device);
>   

I sent out two patches a minute ago which should make this patch
as well as the use of the remove_new callback unnecessary.

Guenter

