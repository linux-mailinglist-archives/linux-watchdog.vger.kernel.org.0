Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F212A45DC
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Nov 2020 14:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgKCNFs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Nov 2020 08:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729095AbgKCNFn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Nov 2020 08:05:43 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C22C0613D1;
        Tue,  3 Nov 2020 05:05:43 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id b2so15838320ots.5;
        Tue, 03 Nov 2020 05:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cIpaFkFp4++37tUYsl1oQTduHULdzmm6equ1s8NaxJ4=;
        b=myv4FyVsFmOcbT9NaT6D6F+mc2En+2qS4CMFpOKx1DhvcEvYYLmGBnAV9cLJ2twons
         kZAQTuZoWJuigde/HeO/nBh99h5EVBbp/v3umFcuoSuhyilddyxi9szlv+wDGZ8OdQr2
         e/2sfKX56vmWYFbEjjtuGwgfWR4gIxi0Xc33eFoBhKPI/JGIAA4V0fdIg/Y6mBHxmOoN
         iBWC5oN+g0DzqpRkMUenkQb6Me5y5rtJKqGvPq3xjlxlDtIPNq+ZhjiLosKp3APVsJmb
         7Vh9wYXCXPhvKE0NBgTgWhjGYIgTIY0KiSCzY1TgHr2njyxSQ8c3LXhvcF02OycVnO3S
         fykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cIpaFkFp4++37tUYsl1oQTduHULdzmm6equ1s8NaxJ4=;
        b=XEaxqoA1hSQyESgHNSC8AdxFmg1+mEHaM55dtxiOHQvPWW5y+I56TPa+OgSHk5Nts8
         fdjwCFKUzbB69j/dlG40XBRJWOCBADmRioeLqPHDRZ2Fq1iGLpznsKnssgZmPPmFQO4I
         4qweDRqbam0GAwQdgzPaPR+0Vjz+dE/0JtjiUt7ycwnysDQLE7ySC8vx786Lt/3Xsu0z
         Vb/MLz8YkN9Qk6fS/xPuOgvOL5ahXKQLzouAAQtjqO2i6MhiHN1hsJZatitRZTFCqFC1
         EtKayjyscY6SPinvDyIMaIHOKHCqVPYqlXdtstkIhNqxZl/1Uzswjb2bUEvz6xM55deW
         PDMQ==
X-Gm-Message-State: AOAM530mpLLrP2PmM0ELpvHbhvfuMPLEx9/ebROiglrDaMuwhFl+2X83
        88vc+kktDCiy4+Y6mOeuhS8=
X-Google-Smtp-Source: ABdhPJwPWtCL040f/8NER2Js7z9iFolAkLESdyHx8M6BGko59C1PT50VGEWHbHvVOzVgU+VTkOpZaQ==
X-Received: by 2002:a9d:4d09:: with SMTP id n9mr15516478otf.334.1604408741534;
        Tue, 03 Nov 2020 05:05:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11sm4396539otj.73.2020.11.03.05.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 05:05:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH -next v2 1/2] watchdog: Clean up error handlings of
 __watchdog_register_device
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Wang Wensheng <wangwensheng4@huawei.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rui.xiang@huawei.com, guohanjun@huawei.com
References: <20201103065217.67876-1-wangwensheng4@huawei.com>
 <11e45cab-108f-db0e-6350-82ae49ed6b23@csgroup.eu>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6b57c174-97d0-eb48-0a6e-a7af992c316f@roeck-us.net>
Date:   Tue, 3 Nov 2020 05:05:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11e45cab-108f-db0e-6350-82ae49ed6b23@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/2/20 11:05 PM, Christophe Leroy wrote:
> Hi,
> 
> Can you provide in the commit a description of what you are doing and why ?
> 

Also, I'd rather have this as second patch to make it easier (possible, actually)
to apply the first patch to -stable.

Guenter

> Christophe
> 
> Le 03/11/2020 à 07:52, Wang Wensheng a écrit :
>> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
>> ---
>>   drivers/watchdog/watchdog_core.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
>> index 423844757812..c73871f41142 100644
>> --- a/drivers/watchdog/watchdog_core.c
>> +++ b/drivers/watchdog/watchdog_core.c
>> @@ -252,10 +252,8 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>>           wdd->id = id;
>>             ret = watchdog_dev_register(wdd);
>> -        if (ret) {
>> -            ida_simple_remove(&watchdog_ida, id);
>> -            return ret;
>> -        }
>> +        if (ret)
>> +            goto id_remove;
>>       }
>>         /* Module parameter to force watchdog policy on reboot. */
>> @@ -273,9 +271,7 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>>           if (ret) {
>>               pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
>>                      wdd->id, ret);
>> -            watchdog_dev_unregister(wdd);
>> -            ida_simple_remove(&watchdog_ida, id);
>> -            return ret;
>> +            goto dev_unregister;
>>           }
>>       }
>>   @@ -289,6 +285,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>>       }
>>         return 0;
>> +
>> +dev_unregister:
>> +    watchdog_dev_unregister(wdd);
>> +id_remove:
>> +    ida_simple_remove(&watchdog_ida, id);
>> +
>> +    return ret;
>>   }
>>     /**
>>

