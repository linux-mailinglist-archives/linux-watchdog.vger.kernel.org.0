Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1C955D357
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 15:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbiF0OOP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 10:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235197AbiF0OOJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 10:14:09 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C8013F0B;
        Mon, 27 Jun 2022 07:14:08 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so12594508pjl.5;
        Mon, 27 Jun 2022 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=D2fXQFLsJVAcBgMEt3yT1lBwvHim1hrBDYQFMHHCf6I=;
        b=R0NoBHCVLGgRWLJK5tkso72jC2UtI8jXH7htp/jURZtSP9Qir4JKjx8l+lYC2BIau/
         VStN9dmUDpuWHWAZnyB/a6ygEFfd9X/G5LZi5Ri+oNo5YLLm8erDyEKlKIWph2Uq9aSL
         7dAlUcjJ/XZUID/hf1OH6JQg/V5XOOURmejIYN7FsuoRNWtUG+NgHmIQQqzaMxL3aMpz
         EM8OoIcYTyltRmXRSgw1rJ+JYO9kBNk5a1slTTnaU5v68uKR8E67ip6xiYr0tAlJKJox
         lS5KaicoJE9a+rYqjmjzQ2iTa5mBtQzHTolWutg2NqyLloFoOOeNweJ+cNdk/fFMBsiN
         xbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=D2fXQFLsJVAcBgMEt3yT1lBwvHim1hrBDYQFMHHCf6I=;
        b=HZJEqeP1g32BUP7dDmDhH2TZh3pQgLJTpL91iyF3L7BeB0w4xeOMzTTvifeEfaIWzz
         NpKaRdrJ8XubPwY+E/kczhSLYgJBEon+3np0hkmdzhVO/uCobCnZq+qcCAnJCIvYJF5T
         HNHdAl1OjpeWW04FFcRrRbd9SMVX4QJdcv8yKpyVusuqbj6ng5eIi4QYjVqAuZblmlXZ
         chTKpec861+XXy1fK5ZyWodXEep0KwOre+cBvyfcRK+Iwkkt4G3BN+1kDpHFHGiDmx0G
         QQqHIB0K3pAqvwGER9V4HvjiY+Qsg5hzmBvsyiy5dRzA7izP3ZA4GcbAH5gC6/oH3ZGv
         CF3w==
X-Gm-Message-State: AJIora9lI1M6DvDexGAmcUJTMfbqkHO44+RkcuudpxMyrn9FRrvMnKwa
        2skySaP/koxxVNi7FftRcQs=
X-Google-Smtp-Source: AGRyM1vhMRQZFzY1hOYKZ5DnRWehhtvlJ+UVxkwFO+jcKIq6pUkQay+4+JCOLP/CufNjKHR582EYVQ==
X-Received: by 2002:a17:90b:1e0e:b0:1ec:ac5b:ddca with SMTP id pg14-20020a17090b1e0e00b001ecac5bddcamr15548304pjb.97.1656339248135;
        Mon, 27 Jun 2022 07:14:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u27-20020a62d45b000000b0050dc7628148sm7419022pfl.34.2022.06.27.07.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:14:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d7d9c8a-5cad-a180-bc2b-825ddb8a3f7d@roeck-us.net>
Date:   Mon, 27 Jun 2022 07:14:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
 <20220627111432.2625168-2-stephan.gerhold@kernkonzept.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] watchdog: pm8916_wdt: Avoid read of write-only PET
 register
In-Reply-To: <20220627111432.2625168-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/27/22 04:14, Stephan Gerhold wrote:
> PMIC_WD_RESET_PET is a write-only register that is used to ping
> the watchdog. It does not make sense to use read-modify-write
> for it: a register read will never return anything but zero.
> (And actually even if it did we would still want to write again
> to ensure the watchdog is pinged.)
> 
> Reduce the overhead for the watchdog ping a bit by using
> regmap_write() directly instead.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/pm8916_wdt.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index 0937b8d33104..670cd79f4cf9 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -58,9 +58,8 @@ static int pm8916_wdt_ping(struct watchdog_device *wdev)
>   {
>   	struct pm8916_wdt *wdt = watchdog_get_drvdata(wdev);
>   
> -	return regmap_update_bits(wdt->regmap,
> -				  wdt->baseaddr + PON_PMIC_WD_RESET_PET,
> -				  WATCHDOG_PET_BIT, WATCHDOG_PET_BIT);
> +	return regmap_write(wdt->regmap, wdt->baseaddr + PON_PMIC_WD_RESET_PET,
> +			    WATCHDOG_PET_BIT);
>   }
>   
>   static int pm8916_wdt_configure_timers(struct watchdog_device *wdev)

