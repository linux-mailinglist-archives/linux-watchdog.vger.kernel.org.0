Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC1B104F83
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 10:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUJpN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 04:45:13 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46563 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfKUJpN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 04:45:13 -0500
Received: by mail-pl1-f196.google.com with SMTP id l4so1301422plt.13;
        Thu, 21 Nov 2019 01:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ASxIbDgZPzjpEeQAS60aSTYiSJ47wEPcbtoAyJxV1I=;
        b=bEbUF9lMdvlVPkRLX3v5XpRyzMUUn4lP7if0rzHhSFjhwTinaGQxOK9/69n/VhuLKY
         /SzI5l+Y7om7EUR7OlEg8Eqipiep8zQdCr4XSNPdVMpasCwdsIFAVp1giqgiz/khmNVv
         fl5iRQJSl99NJjFoMmCVoNAQR22F5iynNI6mnyhXCDzSTOcjb8TVnpozcuiv3ac9EgQM
         Ux451YOdfd9zDUFD/dKNikmlO61Bv6D2BxEQcJY7kU0AejFGgKBUzjm3b5Z1y+nHtm9/
         SJdIS1dfPT8Vv7T7LiMZwZZJ04kVWd3mhURMeXoIAyt8iQ/k89ASbZmd004/DxlBXag7
         gGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ASxIbDgZPzjpEeQAS60aSTYiSJ47wEPcbtoAyJxV1I=;
        b=FGrst/8y6kKOE0hs/N31rfoo/d5YJmjj8aACJ3bjAzCKPQIqZE1BuCHQNexWWDr8nN
         UoGt2MmuoidtbKNZah66KlFhtwreYJlsR2WsfIVie+d3lkWRl96MZ22Os4zHzRfS39Ol
         QWID9Eg+POPk8e+65Le8a3mmt67RMp1YKxc+rOLNI9xRWoCJYGs1Jk/W0uLY5Idmw0SW
         iMAQLgKjxtA+79TbJs88rZKZP5oKwTzetzoLYhlfUugSw0NdDjwMN7c6JaWP4YI8LY43
         QMvFiID7PHojzJ0mxC1P5NufbU5mc2K/fbLqg1xf0pSklPeRSiTdCzsVKZ/q1P+2zaz+
         2A3Q==
X-Gm-Message-State: APjAAAUe9QZqMOpKM5FKP15yUiCNbpjn7gwT/6fCdLp5p3KikEFECkxT
        UJGMn4ehSOr4lkAIllWPCmUzXpBw
X-Google-Smtp-Source: APXvYqz2pCtYH4yADufGtyDF3nMKzWAlEbR9Vq7cut3R0CBn8yhtcpgMNMollgpDpo8dyXBDHtiovg==
X-Received: by 2002:a17:902:9344:: with SMTP id g4mr8062166plp.16.1574329511726;
        Thu, 21 Nov 2019 01:45:11 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o16sm2292208pjp.23.2019.11.21.01.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 01:45:10 -0800 (PST)
Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <13477f08400047c1b32030b2680a4241@nokia-sbell.com>
 <20191120171512.GA28255@roeck-us.net>
 <9128f42a3e4347f2adfccb8aa2833e2e@nokia-sbell.com>
 <b0fcaae6-c9da-f551-5af4-ff112b08e851@roeck-us.net>
 <2ba1cd4773c84ce28512aacde17034ed@nokia-sbell.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <685f5142-06a9-062d-b6d9-1d522c3923f8@roeck-us.net>
Date:   Thu, 21 Nov 2019 01:45:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ba1cd4773c84ce28512aacde17034ed@nokia-sbell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/19 12:07 AM, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
> Actually, this function is used by watchdog_dev.c, the timeout value in wdd is already modified there.
> but yes, you are right, decide the actual timeout value here is more reasonable. :)
> 

Please avoid top-posting.

watchdog_dev.c only sets wdd->timeout if there is no driver function
to set it.

Guenter

> thanks,
> Peng Wang
> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter Roeck
> Sent: Thursday, November 21, 2019 11:41 AM
> To: Wang, Peng 1. (NSB - CN/Hangzhou) <peng.1.wang@nokia-sbell.com>
> Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger timeout value
> 
> On 11/20/19 5:29 PM, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>> Hi Guenter,
>>
>> Thank you for your time.
>> - I will remove the unnecessary {}
>> - wdd->max_hw_heartbeat_ms is the max timeout value which HW can support, this value is limited according to the input clock, say. It only supports 20 seconds, if users requires to set timeout to be say. 60 seconds, the watchdog device driver 'watchdog_dev.c' checks if wdd->timeout is bigger than wdd->max_hw_heartbeat_ms, if yes, watchdog_dev.c feeds the watchdog by a worker queue itself to help to feed the watchdog before 60 seconds elapse. Here the issue of dw_wdt.c is that, the original codes update wdd->timeout to the value which HW can support, which means if users requires 60 seconds to be the timeout, then dw_wdt.c updates the timeout value to 20 seconds, this makes the "feeding helper" mechanism in watchdog_dev.c not take effect. That's why I add this check.
>>
> 
> Yes, I understand you need a check. What I am saying is that the check is wrong.
> 
> You need something like
> 
> 	if (top_s > DW_WDT_MAX_TOP)
> 		wdt->timeout = top_s;
> 	else
> 		wdt->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> 
> Guenter
> 
>> Thanks,
>> Peng Wang
>>
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
>> Roeck
>> Sent: Thursday, November 21, 2019 1:15 AM
>> To: Wang, Peng 1. (NSB - CN/Hangzhou) <peng.1.wang@nokia-sbell.com>
>> Cc: wim@linux-watchdog.org; linux-watchdog@vger.kernel.org;
>> linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH] watchdog: make DesignWare watchdog allow users to
>> set bigger timeout value
>>
>> On Wed, Nov 20, 2019 at 10:07:57AM +0000, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>>>   From 1d051b7c081083751dc0bab97d3ab9efbba0f4a7 Mon Sep 17 00:00:00
>>> 2001
>>> From: Peng Wang <peng.1.wang@nokia-sbell.com>
>>> Date: Wed, 20 Nov 2019 15:12:59 +0800
>>> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to
>>> set bigger  timeout value
>>>
>>> watchdog_dev.c provides means to allow users to set bigger timeout
>>> value than HW can support, make DesignWare watchdog align with this.
>>>
>>> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>
>>> ---
>>>    drivers/watchdog/dw_wdt.c | 11 +++++++++--
>>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
>>> index fef7c61..8911e5e 100644
>>> --- a/drivers/watchdog/dw_wdt.c
>>> +++ b/drivers/watchdog/dw_wdt.c
>>> @@ -113,8 +113,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>>>    	 */
>>>    	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>>>    	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>>> -
>>> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
>>> +
>>> +    /*
>>> +     * In case users set bigger timeout value than HW can support,
>>> +     * kernel(watchdog_dev.c) helps to feed watchdog before
>>> +     * wdd->timeout
>>> +     */
>>> +    if ( wdd->timeout * 1000 <= wdd->max_hw_heartbeat_ms ) {
>>> +	    wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
>>> +    }
>>
>> { } is unnecessary here. Also, the above code compares the _old_ timeout againt the maximum supported timeout, which doesn't look correct.
>>
>> Thanks,
>> Guenter
>>
>>>    
>>>    	return 0;
>>>    }
>>> --
>>> 1.8.3.1
>>>
>>
> 

