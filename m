Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB03111C3E6
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 04:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfLLDic (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 22:38:32 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39934 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfLLDib (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 22:38:31 -0500
Received: by mail-pg1-f193.google.com with SMTP id b137so406633pga.6;
        Wed, 11 Dec 2019 19:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZRyM8vqFAeXNEEkflUNLvEoDK86LaNGE46fG0ac6og0=;
        b=UXP+XXKOa/c94TpkEggFBROby717qqBC4K8QVM4BLHn6vfAJASo2EmI8X4EtkuApkE
         in1BujpkqXqeo45TonWoC/BFfDsTxNPZMOeu6YrnI/JiiAJ57xlo8G6NYl7e9KO66LwA
         VBaToGjj8tkvsDHm1xDD7Azn/tg1RquPR3wdLs7aSmgLF8IV06v5FV+wEobN1LdYDZvI
         UWdQWW6G5fy9pXhob2ZXd/9NVpdBntqmgGc7PNhLIdCHRpPMgnC/tMowc2fF3Dvmh52Q
         vCOb7iDr5Mxv/khg4hA1V/XR6Ghaauv2LbYi4iXSU6+O7X6IMtcIsU9yT0JvjDdWuzpa
         7XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZRyM8vqFAeXNEEkflUNLvEoDK86LaNGE46fG0ac6og0=;
        b=Pq/0CpIjD5q/9r6rPZnmxwb0OmHv4+QIJMDb/Lt89aqEPt0l38i3N+DHVNAZKEgcBb
         K+96zNv3hpDXUqKi9q+n8a6a6wKtZ3Y8yiK3QhPQv3NHPzEQfglsTuPvM7DlFdno2BFg
         9zTnu3UydvjT/0FXlGRLKZxJh/X8+laK00182Tvi0inIPlLTTa1JisRSxzKlrKK25sx6
         wGYsdrZ5gbZ4fNyWAikuwXYqtAGooD2BXDygBXTOKPYT8l2xRCgx6fZFRVeQ/xebO8SA
         MQFzohwRSgFLAxQ0mTpmWxtx3WB11vWdHKRj0V77TCK5OnkfpufezwTCorjy6AXUzdXH
         zhXg==
X-Gm-Message-State: APjAAAUXmHIQmRfWS1iIvC1miK2JnNSQcnnnnDUY9f/rU0WJvQikk2Rf
        dTGMJBOsC6h2qV0VAwB1j14=
X-Google-Smtp-Source: APXvYqx1JwoWiU0d6Vk8gb9OfVJ6bvzaIUQPjw34Lg2vajFDQ3vCrVmqIK88C1KR7yoHMs88XN1Etw==
X-Received: by 2002:a62:33c6:: with SMTP id z189mr7617287pfz.246.1576121910704;
        Wed, 11 Dec 2019 19:38:30 -0800 (PST)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id b4sm4956339pfd.18.2019.12.11.19.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 19:38:30 -0800 (PST)
Subject: Re: [PATCH 1/2] watchdog: mtx-1: Drop au1000.h header inclusion
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>,
        Denis Efremov <efremov@linux.com>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
 <20191211210204.31579-2-f.fainelli@gmail.com>
 <21b7be75-db61-3b14-c57c-04af0b78b347@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 a9BQwACgnzGuH1BVeT2J0Ra+ZYgkx7DaPR0=
Message-ID: <3fdc99fa-f75c-33d4-e1c4-ec8ad185e2cd@gmail.com>
Date:   Wed, 11 Dec 2019 19:38:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <21b7be75-db61-3b14-c57c-04af0b78b347@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 12/11/2019 5:35 PM, Guenter Roeck wrote:
> On 12/11/19 1:02 PM, Florian Fainelli wrote:
>> Including au1000.h from the machine specific header directory prevents
>> this driver from being built on any other platforms (MIPS included).
>> Since we do not use any definitions, drop it.
>>
>> Reported-by: Denis Efremov <efremov@linux.com>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/watchdog/mtx-1_wdt.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
>> index 25a92857b217..aeca22f7450e 100644
>> --- a/drivers/watchdog/mtx-1_wdt.c
>> +++ b/drivers/watchdog/mtx-1_wdt.c
>> @@ -41,8 +41,6 @@
>>   #include <linux/uaccess.h>
>>   #include <linux/gpio/consumer.h>
>>   -#include <asm/mach-au1x00/au1000.h>
>> -
>>   #define MTX1_WDT_INTERVAL    (5 * HZ)
>>     static int ticks = 100 * HZ;
>>
> 
> Given that this is nothing but yet another gpio watchdog driver, I'd
> personally rather have it merged with gpio_wdt.c. On a higher level,
> cleaning up old-style watchdog drivers, without converting them to
> using the watchdog core, is a waste of time.

If that makes you feel any better, I was not planning on going further
than that, and yes, removing this driver and using gpio_wdt.c would be
the way to go, this driver greatly predates gpio_wdt.c and I have since
then not had access to my MTX-1 platforms which is why this did not
happen. We can attempt a "blind conversion" without testing, but what
good would that make, not sure.

> 
> Wim, should we make it a policy to reject patches into old-style drivers
> unless they fix a real bug ? It is getting a pain to have to review those
> patches.
> 
> Thanks,
> Guenter

-- 
Florian
