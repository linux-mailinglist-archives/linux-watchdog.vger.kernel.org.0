Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A073716C2
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 May 2021 16:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhECOkU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 May 2021 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbhECOkU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 May 2021 10:40:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7AC5C06174A
        for <linux-watchdog@vger.kernel.org>; Mon,  3 May 2021 07:39:26 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1ldZjJ-0003t5-6b; Mon, 03 May 2021 16:39:25 +0200
Subject: Re: [RESEND PATCH v3 2/3] watchdog: f71808e_wdt: migrate to new
 kernel watchdog API
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org
References: <cover.dc9133eee56aa67653455928e4de2162e344ce4d.1618310618.git-series.a.fatoum@pengutronix.de>
 <35b474fa750fa11781509e94675fc90e28b2d514.1618310618.git-series.a.fatoum@pengutronix.de>
 <92b48338-4d9a-dc02-d8b5-198bd34c9f21@roeck-us.net>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <9f326f40-08dd-ab2b-0a80-970d20c57d6a@pengutronix.de>
Date:   Mon, 3 May 2021 16:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <92b48338-4d9a-dc02-d8b5-198bd34c9f21@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Guenter,

On 03.05.21 16:31, Guenter Roeck wrote:
>> -static struct fintek_wdt watchdog = {
>> -	.lock = __MUTEX_INITIALIZER(watchdog.lock),
>> -};
>> +static struct fintek_wdt watchdog;
> 
> This should really be allocated, and "watchdog" is a terrible variable name
> even if static, especially given the previous patch.

I can add a follow up patch to change this. I maintained the old
state of things here to make review easier.

> 
>>  
>>  /* Super I/O functions */
>>  static inline int superio_inb(int base, int reg)
>> @@ -218,17 +206,9 @@ static inline void superio_exit(int base)
>>  	release_region(base, 2);
>>  }
>>  
>> -static int fintek_wdt_set_timeout(int timeout)
>> +static int fintek_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
>>  {
>> -	if (timeout <= 0
>> -	 || timeout >  max_timeout) {
>> -		pr_err("watchdog timeout out of range\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	mutex_lock(&watchdog.lock);
>> -
>> -	watchdog.timeout = timeout;
>> +	wdd->timeout = timeout;
> 
> This needs to save the actual timeout, which differs from the
> configured one if larger than 255.

Oh, makes sense. Will changes with v4.

Thanks,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
