Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CFD105EAF
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 03:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVClP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 21:41:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37834 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKVClP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 21:41:15 -0500
Received: by mail-pf1-f195.google.com with SMTP id p24so2739091pfn.4;
        Thu, 21 Nov 2019 18:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dv1bxAvHpHd/W1kU7AoVueS3lUuNaiq9DlOEZQ0S9UI=;
        b=Ck5RoPazJp2/Fe93Xp/p3B+Tf1cJhqLlqrJt7AyPUyfWbnJKO44BDgNd7jL+o38yV6
         MhP8c1OW5EHyjRDQJC4/0b+GzdxXn7+pkqo8yYQFJqc0A87Xd3A4GbqzYC6kuXDZ1o/d
         Zp57fo+9lFG6HahMFJKt7iL85ZqrD4jrIayWabtyVkRvqRKrxB2xokPhND6x0SGHnrbq
         NQGZFRrly3NIveJfdOK7BAQ2sHTpv+Vz/lAx0adHAuRcxiBiHsRsLc5v9ywLLdNOpbsQ
         Rmd6BnkFq8g1uZw5gJn2BnJwDRvN8rd3/39TUgq9PKaPiVJFZ+hiJE3P5mMOYiGmOACN
         +fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dv1bxAvHpHd/W1kU7AoVueS3lUuNaiq9DlOEZQ0S9UI=;
        b=hg77QTwBsVdvCCWokgl8I77oTxl/53ZA2MsA+Qirb00JmOHHTDFIrQ7k1Bza7lU+Ou
         geBpButrZQkUxzU/z0j5NS1brSIR/5ueBWInfuyb4t1XJ8OF1bGmbqODXBJ6VlW6j7T9
         Z9JDM0MqgUg/KNsgoNkLqe4ubRu1plLVOG0WCxPfnN2qbS2547BklSDP3XMv0Ul/NPDp
         l1rMGTsE65fHy6TGVS5R/0tk3D1bkhJwQtlDjBLvoU4Oj2O8awPGBsslCAPzavV5cVai
         01zbxwYd0RiWwOgwK0MSun62KXdTqrXWIQqcLLYiJ4zPT4nUbX0pXOaQojfigBAGnAoj
         WquQ==
X-Gm-Message-State: APjAAAVExqW6bpiVwTQb9MbJTG4dIfigrSKDsvPQOrh1fvmAbPWKWLPw
        SWveaohvMsWlW3XXIzkEEZv9YWQJ
X-Google-Smtp-Source: APXvYqwYjk/0lIGQRIcZ8ZEoYk1ifrJ/FSFARppLkcdhtuRCyYMgzQ2zUh7gQdp+kxZtPwFXybTSUA==
X-Received: by 2002:aa7:9189:: with SMTP id x9mr14884350pfa.41.1574390473807;
        Thu, 21 Nov 2019 18:41:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6sm5180464pfd.24.2019.11.21.18.41.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 18:41:12 -0800 (PST)
Subject: Re: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
Cc:     Guenter Roeck <groeck7@gmail.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
 <20191121141508.GA13249@roeck-us.net>
 <a66f73ba253b41f8956eb85e3cc67a4a@nokia-sbell.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8c198e4e-488b-efd0-4caf-b2dddb830ea3@roeck-us.net>
Date:   Thu, 21 Nov 2019 18:41:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a66f73ba253b41f8956eb85e3cc67a4a@nokia-sbell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/19 5:16 PM, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Roeck, thanks for your time to guide me to finish the review. Do I need to re-send a mail with your sign?
> 

No, that won't be necessary.

Guenter

> Peng Wang
> 
> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter Roeck
> Sent: Thursday, November 21, 2019 10:15 PM
> To: Wang, Peng 1. (NSB - CN/Hangzhou) <peng.1.wang@nokia-sbell.com>
> Cc: Guenter Roeck <groeck7@gmail.com>; wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] watchdog: make DesignWare watchdog allow users to set bigger timeout value
> 
> On Thu, Nov 21, 2019 at 10:35:12AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>>  From aabaa4b709bd451e566c906e8d1dca48f92f9b12 Mon Sep 17 00:00:00 2001
>> From: Peng Wang <peng.1.wang@nokia-sbell.com>
>> Date: Wed, 20 Nov 2019 15:12:59 +0800
>> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set
>> bigger  timeout value
>>
>> watchdog_dev.c provides means to allow users to set bigger timeout
>> value than HW can support, make DesignWare watchdog align with this.
>>
>> ---
>>
>> v2 -> v1:
>>         - use top_s to compare with wdd->max_hw_heartbeat_ms
>>         - update wdd->timeout in case it's greater than HW supports
>>         - fix comments error
>>
>> v1: initial version
>>
>> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
>> ---
>>   drivers/watchdog/dw_wdt.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
>> index fef7c61..12c116e 100644
>> --- a/drivers/watchdog/dw_wdt.c
>> +++ b/drivers/watchdog/dw_wdt.c
>> @@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>>   	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>>   	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>>   
>> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
>> +	/*
>> +	 * In case users set bigger timeout value than HW can support,
>> +	 * kernel(watchdog_dev.c) helps to feed watchdog before
>> +	 * wdd->max_hw_heartbeat_ms
>> +	 */
>> +	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
>> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
>> +	else
>> +		wdd->timeout = top_s;
>>   
>>   	return 0;
>>   }
>> --
>> 1.8.3.1
>>
> 

