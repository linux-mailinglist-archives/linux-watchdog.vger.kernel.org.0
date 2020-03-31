Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CCA199AF4
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 18:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgCaQId (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 12:08:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46324 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730562AbgCaQId (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 12:08:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id q3so10504489pff.13;
        Tue, 31 Mar 2020 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LUpeYe3f5YBYK5l68bZrbY1kyH4ZN4dBpgi8h3BURsk=;
        b=TSWv9A7APKK28Mv1sWzp/2xIeBVQkk3boTrVlnUtLfPTwWI4r8HhsOwgPQW0mLZhpi
         9yV3/X2WIRFh/2pDSb7PTuG6fiCBsYFCv4SbbFfZlckGCL151vCOl/nvf3ZNZIYleVfH
         QNtO3syyA3hbYnNXXduSAdFLonuaoGe9oNd+fF8r8R50vBhXzn3vRs7JbE86Argj85Z2
         lk31FqeRgP61eJX8GdlwJUqEM/1YgU8wHRIyqfhL7Bp/1Af4hWjR6OkFjjE7DEsFiGxN
         dT7n0S2u0yUbTf0t+svgLE5bjuuiX4XfE63Py7JArQPaDXKv3MDldzTl5fISmyPTLoHF
         CKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LUpeYe3f5YBYK5l68bZrbY1kyH4ZN4dBpgi8h3BURsk=;
        b=l8PmznDSmugY+J2wohbNi1Cn8SHQRc9QIp9zaQITdpQo/rzmX6sjwiuZEalhz68rGQ
         SBwpoqYW1msIhihyrwPMceeKM9ybTpVNjFAzeub9t2TTXq8z5PhBH90lheubMXlR7hek
         bJ1zV+wrZZF+aDGSwfhnSoeH/iYoow6Gwr0dmDoOwCdD5vw9VIhxt/HvwVT+ioXoKp8y
         Tylck2Cfbuo5h7znIJjd4CLhD2WStqf2tcEotEXrpKJiozGl58m/GoCsZqHt7QCuxOs2
         tTI8HhXEyxfUCFNC+rN8Y6WbPilbyqG7FzAQjxLGzUpnJ0W1OTQXhX/dzlmqh/ixJhHi
         8qDg==
X-Gm-Message-State: ANhLgQ23zqz30T3SnYq16WafkVnvES9A7tm/Xcj9AaC0w+gnemiyRtjL
        7fLYN1yZhnYny7GBNpqlvM9W7/9N
X-Google-Smtp-Source: ADFU+vswqCQN/m8vbqo7OFJ3hsC8Fn1kUaszmkOi3IFtgbxXgfJRRwlAu8mWz+mhbFE22ODwBvb64A==
X-Received: by 2002:a05:6a00:42:: with SMTP id i2mr18762031pfk.108.1585670911026;
        Tue, 31 Mar 2020 09:08:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w205sm12771938pfc.75.2020.03.31.09.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 09:08:30 -0700 (PDT)
Subject: Re: [PATCH 2/3] watchdog: da9063: Use pre configured timeout when
 watchdog is running
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <Support.Opensource@diasemi.com>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
 <20200326150203.371673-2-s.riedmueller@phytec.de>
 <AM6PR10MB2263A1A76AFFBCE7BCC4B93880CB0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <387fadc6-1eab-ada7-86dd-0e47c5e9cb9f@roeck-us.net>
Date:   Tue, 31 Mar 2020 09:08:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM6PR10MB2263A1A76AFFBCE7BCC4B93880CB0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/30/20 9:38 AM, Adam Thomson wrote:
> On 26 March 2020 15:02, Stefan Riedmueller wrote:
> 
>> If the watchdog is already running during probe use its pre-configured
>> timeout instead of a default timeout to make sure the watchdog is pinged
>> in time until userspace takes over.
> 
> At least for this driver I don't think there's an issue here with regards to
> not pinging in time. Calling 'da9063_wdt_update_timeout()', as it currently
> does in the probe() when the watchdog is already active, actually disables the
> watchdog before then setting a new timeout value, so by that method we're
> avoiding a timeout and starting a new timer period.
> 
> To my mind the timeout value should come from DT if possible, which I would
> assume for the most part would match whatever is defined in the bootloader as
> well, unless I'm mistaken. If that's not available though then I would maybe
> agree on falling back to a value that was already programmed in the bootloader
> rather than the driver default which should be the last resort.
> 
Agreed.

Guenter

>>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>>  drivers/watchdog/da9063_wdt.c | 29 ++++++++++++++++++-----------
>>  1 file changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
>> index 3d65e92a4e3f..34d0c4f03814 100644
>> --- a/drivers/watchdog/da9063_wdt.c
>> +++ b/drivers/watchdog/da9063_wdt.c
>> @@ -46,15 +46,16 @@ static unsigned int da9063_wdt_timeout_to_sel(unsigned
>> int secs)
>>  }
>>
>>  /*
>> - * Return 0 if watchdog is disabled, else non zero.
>> + * Read the currently active timeout.
>> + * Zero means the watchdog is disabled.
>>   */
>> -static unsigned int da9063_wdt_is_running(struct da9063 *da9063)
>> +static unsigned int da9063_wdt_read_timeout(struct da9063 *da9063)
>>  {
>>  	unsigned int val;
>>
>>  	regmap_read(da9063->regmap, DA9063_REG_CONTROL_D, &val);
>>
>> -	return val & DA9063_TWDSCALE_MASK;
>> +	return wdt_timeout[val & DA9063_TWDSCALE_MASK];
>>  }
>>
>>  static int da9063_wdt_disable_timer(struct da9063 *da9063)
>> @@ -191,6 +192,7 @@ static int da9063_wdt_probe(struct platform_device
>> *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct da9063 *da9063;
>>  	struct watchdog_device *wdd;
>> +	int timeout;
>>
>>  	if (!dev->parent)
>>  		return -EINVAL;
>> @@ -214,15 +216,20 @@ static int da9063_wdt_probe(struct platform_device
>> *pdev)
>>  	watchdog_set_restart_priority(wdd, 128);
>>  	watchdog_set_drvdata(wdd, da9063);
>>
>> -	/* Set default timeout, maybe override it with DT value, scale it */
>> -	wdd->timeout = DA9063_WDG_TIMEOUT;
>> -	watchdog_init_timeout(wdd, 0, dev);
>> -	da9063_wdt_set_timeout(wdd, wdd->timeout);
>> -
>> -	/* Change the timeout to the default value if the watchdog is running */
>> -	if (da9063_wdt_is_running(da9063)) {
>> -		da9063_wdt_update_timeout(da9063, wdd->timeout);
>> +	/*
>> +	 * Use pre-configured timeout if watchdog is already running.
>> +	 * Otherwise set default timeout, maybe override it with DT value,
>> +	 * scale it
>> +	 */
>> +	timeout = da9063_wdt_read_timeout(da9063);
>> +	if (timeout) {
>> +		wdd->timeout = timeout;
>>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>> +		dev_info(da9063->dev, "watchdog is running (%u s)", timeout);
>> +	} else {
>> +		wdd->timeout = DA9063_WDG_TIMEOUT;
>> +		watchdog_init_timeout(wdd, 0, dev);
>> +		da9063_wdt_set_timeout(wdd, wdd->timeout);
>>  	}
>>
>>  	return devm_watchdog_register_device(dev, wdd);
>> --
>> 2.23.0
> 

