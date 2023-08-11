Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80FC2778F42
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Aug 2023 14:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235733AbjHKMVz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Aug 2023 08:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjHKMVy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Aug 2023 08:21:54 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8515019E
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Aug 2023 05:21:54 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-34914684b62so6890495ab.3
        for <linux-watchdog@vger.kernel.org>; Fri, 11 Aug 2023 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691756514; x=1692361314;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf3LAHgsmpuoSPu9jH7OskaQzJ3HX2ZrTwSruvwIxfc=;
        b=D3sSvrYAKtYJVkc3IusKZEEGiJdfKf8V/BufnHHa2lRNijVh9SfRo8e1GLC1mDb5ZF
         ouzlg3mtBYzTzxpYpG4cMp59GdR2Lxbp38jgVEnwLI0Hl4z58l+pm3UmJWqVdtIOlBgI
         RZSCs6dzmu8dxUoqKO2fwTNDs0DmxEVaqQLwiqGYM1QLrKBREphtfjqew1pQY5DthgOT
         yMTeSKQMuwFzMuhFtVvmXUJocegDUds8vjBmYl+S8dcROSu9sMf6c2RLSqXq4U9y43iH
         sVyIXBEgA+E17n7G6kIrTv8GFfSiIAOyJ9ZmDuFwSUz1AFdvLMzlcS0E1LESCDaHAsXX
         BnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691756514; x=1692361314;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf3LAHgsmpuoSPu9jH7OskaQzJ3HX2ZrTwSruvwIxfc=;
        b=HNC5yUL40AtRSPGpHXiLZM6yGXyfKx/SIMBX/R4j+NzY2Z5k4Br+Q/VILxq8Mzr3ub
         +OGMO+lCMihxwqGG/xxu6DjVj4C9f2mIEY0ZupweCcPZTufMUv+8PlLLpLZjBOPnOV7W
         etKP3RFW2W3V1cc5IUSIFawO4IxnSK+2CqfK8nndpcz0ZJ8slKfYFDjfI0aynnS1NZRv
         FjpN3nkfH2Rw41KzhObomC6ogRBL7ZAjGkgxLMCnm5iIAxwiQqZWXJKDbAWK6s5ge/ZT
         fZby6lSz4VF1ZWKNWYOHVKBgvdkyp1vB84MynIUrcuwRuRyFehuHHrkAl3Wjn53xqEec
         1eqg==
X-Gm-Message-State: AOJu0YyGZNrdB6Q7uutcL08dKxdO7h3VzdcphYCMfShEykmy83N+9Msd
        G5mMh8KgnCYVKruVn0oQbfKbs81jAF4=
X-Google-Smtp-Source: AGHT+IGkzoKAipIOqJqZY48D7UxmAFFDkwJk1P203aKK5fjV1iE5Fo+vuMU3pF9oyH80UMK7kq9LSw==
X-Received: by 2002:a05:6e02:1bcd:b0:349:7832:5d8 with SMTP id x13-20020a056e021bcd00b00349783205d8mr2283297ilv.5.1691756513825;
        Fri, 11 Aug 2023 05:21:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c18-20020a92cf52000000b00348d2e9701csm1088674ilr.63.2023.08.11.05.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 05:21:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3a663190-155e-af5d-22b9-fa13da5f972e@roeck-us.net>
Date:   Fri, 11 Aug 2023 05:21:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] watchdog: pm8916_wdt: Remove redundant
 of_match_ptr()
Content-Language: en-US
To:     Ruan Jinjie <ruanjinjie@huawei.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20230811062707.2301583-1-ruanjinjie@huawei.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230811062707.2301583-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/10/23 23:27, Ruan Jinjie wrote:
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/pm8916_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index f4bfbffaf49c..f3fcbeb0852c 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -266,7 +266,7 @@ static struct platform_driver pm8916_wdt_driver = {
>   	.probe = pm8916_wdt_probe,
>   	.driver = {
>   		.name = "pm8916-wdt",
> -		.of_match_table = of_match_ptr(pm8916_wdt_id_table),
> +		.of_match_table = pm8916_wdt_id_table,
>   		.pm = &pm8916_wdt_pm_ops,
>   	},
>   };

