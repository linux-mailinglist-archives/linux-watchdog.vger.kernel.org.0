Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860A823201C
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 16:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgG2ON2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 10:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgG2ON1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 10:13:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B644BC061794;
        Wed, 29 Jul 2020 07:13:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f193so2590081pfa.12;
        Wed, 29 Jul 2020 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nV4YN/dLjAONm1QhoydYK1B7TYuCyvgjOkW8X9Cld4U=;
        b=CwCvU6Ku4GnfZWPNKQSggQSI4YicRXI1EKfMK8i7IWCl30EZtwO1BERFAZnICfrC88
         k1RnXx3qWYJkFNJy4TlpcBbBn2xqDE5mo16g6dRK3MwmF8ct4IxwqiWHjyPe1K34DsB0
         IOSOvEkYpmGMSm4EVJorM7zA5lZ+UU6dxuI8d8LM/NA0hMXddmK9SAL9qTDwYAjsfba6
         t+McJ8eg1rTuLFGAwZgOjQ3DMhd2IOdDPFcmrsWAfgI3izy/xbDzEzF+povJEJI0+GTE
         R6PneTMBtSpJkBQ5KYIOsD6DOa6iyl2a39HOVK9DQHdR3ze2xVpfWRU5TuNTg3XSziCE
         jOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nV4YN/dLjAONm1QhoydYK1B7TYuCyvgjOkW8X9Cld4U=;
        b=SaqvQ+1ebeVi1Qu5vZjYdz+UaucbeD8ChH2Icj5NxFwJ4xIxQMaTIYmBeHDKMmCzwh
         ZZb6gMVOUAQ71D1k1J0RbpKNk121qJ6o/yNwsa8ZIVzp13IcmHduh/ysIXsbINd6UVUO
         CeWgVREwGVk4qo6FgyQioXX2oX7klItawNYtAExKWurfZSsqHqvqZskMgAFyOrzzOkI8
         rDBgkWO10dR9ICFc6YG321mXF6J2a8SI3+wKMPk4Tl/Ddq1KEDD0AeM9XL7T37Qc7ZHL
         Oir7kdwpX+o7V6M3eWbji0D9um6aeWfC/6SoYzApYxgywJZbjTPI3wN3EXwt+ocdoGOg
         IpFg==
X-Gm-Message-State: AOAM533o3E6NKEU1DspRVawp1aFjBSecjCtzo7FB8MioXgKVPzMsCym5
        Kcb4Bx3zL0+oMk8N23uOZhM=
X-Google-Smtp-Source: ABdhPJyCXzGK2Ao7mMyI2xq1z7/3bkUGawYV7avLV9LlngyLeELVBBfzNrXEP/n7exC1Ppgfg692/A==
X-Received: by 2002:aa7:83c9:: with SMTP id j9mr18263798pfn.151.1596032007218;
        Wed, 29 Jul 2020 07:13:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c132sm2635965pfb.112.2020.07.29.07.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 07:13:26 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
To:     Anson Huang <anson.huang@nxp.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <00587a78-8069-4fbd-7e02-b774d541f75a@roeck-us.net>
 <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6ac07203-a966-f985-52ae-b3dd264b3786@roeck-us.net>
Date:   Wed, 29 Jul 2020 07:13:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB3916C412DE1E83A2D40B2341F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/28/20 9:50 PM, Anson Huang wrote:
> Hi, Guenter
> 
> 
>> Subject: Re: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
>> for wdog operations
>>
>> On 7/28/20 7:20 PM, Anson Huang wrote:
>>> According to reference manual, the i.MX7ULP WDOG's operations should
>>> follow below sequence:
>>>
>>> 1. disable global interrupts;
>>> 2. unlock the wdog and wait unlock bit set; 3. reconfigure the wdog
>>> and wait for reconfiguration bit set; 4. enabel global interrupts.
>>>
>>> Strictly follow the recommended sequence can make it more robust.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> Changes since V1:
>>> 	- use readl_poll_timeout_atomic() instead of usleep_ranges() since IRQ is
>> disabled.
>>> ---
>>>  drivers/watchdog/imx7ulp_wdt.c | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>>> b/drivers/watchdog/imx7ulp_wdt.c index 7993c8c..7d2b12e 100644
>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>> @@ -5,6 +5,7 @@
>>>
>>>  #include <linux/clk.h>
>>>  #include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>>  #include <linux/of.h>
>>> @@ -36,6 +37,7 @@
>>>  #define DEFAULT_TIMEOUT	60
>>>  #define MAX_TIMEOUT	128
>>>  #define WDOG_CLOCK_RATE	1000
>>> +#define WDOG_WAIT_TIMEOUT	10000
>>>
>>>  static bool nowayout = WATCHDOG_NOWAYOUT;
>> module_param(nowayout,
>>> bool, 0000); @@ -48,17 +50,31 @@ struct imx7ulp_wdt_device {
>>>  	struct clk *clk;
>>>  };
>>>
>>> +static inline void imx7ulp_wdt_wait(void __iomem *base, u32 mask) {
>>> +	u32 val = readl(base + WDOG_CS);
>>> +
>>> +	if (!(val & mask))
>>> +		WARN_ON(readl_poll_timeout_atomic(base + WDOG_CS, val,
>>> +						  val & mask, 0,
>>> +						  WDOG_WAIT_TIMEOUT));
>>
>> I am not a friend of WARN_ON, especially in situations like this.
>> Please explain why this is needed, and why a return of -ETIMEDOUT is not
>> feasible.
> 
> OK, I will use return value of -ETIMEOUT and handle it in the caller.
> 
>>
>> Also, I do not believe that a 10 milli-second timeout is warranted.
>> This will need to be backed up by the datasheet.
>>
> 
> There is no such info provided in reference manual or datasheet, but I just did
> an experiment, the unlock window is open in less than 1us after sending unlock command,
> and ONLY last for ONLY 2~3 us then close, the reconfiguration status bit will be set in less than
> 1us after register write. So what do you recommend for this timeout value? 100mS for safe?
> 

That would be even worse. You say yourself that the window is only open for a few
microseconds. Now you are suggesting to hold the entire system hostage for up to
100 mS if the code misses that window for some reason. Based on what you said,
100 uS might be barely acceptable. 10-20 uS would be reasonable. But not 100 mS.

Guenter
