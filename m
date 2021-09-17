Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6E340FB5A
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Sep 2021 17:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhIQPJo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Sep 2021 11:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhIQPJn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Sep 2021 11:09:43 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DBBC061574
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 08:08:21 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so2166312otj.2
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Sep 2021 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G1wCccT1Tk1IpD7FJDcaedvWtRvCxYRU/5XW487IGjk=;
        b=KXW1EZjEPSUPNWJX2oMTwpngBMIDjZ++Cs4QNibHrZ14MU4yNTZ4kYEGHQAzmdX9/i
         AXQv59Kx/on0HQ5UGUFwIlsXJ3DQHugNPnDLg68FkKlKCeHrshkPXQeqxCl72uyweM0v
         MS/A2q2BQS0LHZxIoi4lN75jJ8jeuZaxiypVTmKO1qXTXURqh521G2db2VY4oTr4iwQE
         N1SWVUJ/uCDOgZzxZoulZo6rsD/Dq9eij/g1EBdYnY7V8dhmGFLahlpiV+SuehvhfjCM
         L95rXeOK0nZKZPuBDLDqNO95PFr8sQ9MIh39WlaD8Bj40bekAqiOO2cYNOAdisPzQ7Yv
         YIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G1wCccT1Tk1IpD7FJDcaedvWtRvCxYRU/5XW487IGjk=;
        b=n4ML58j8HyM0B08FVnhp2tbdLnZcZTQhxKpHIv8vZOVIFth1RPAxYjb+ocd18fZ05o
         jhgcIjPEJ6LezOGGDXvna9/i/e3dhm2Pw08KZHIELyCZVBwoe4EApEPmuR6aP/x2FmFh
         nJGwD3BOZwemW5SPqmo2TxJoqRLUxTQyoOOzyAPwINnkin8eomZC29sUTYwr8kJmerDg
         8ZOUL1ccR0zEDpS/TrucoEL6+QouaPiC847bf6mo0w97+4aZ1ImDtXo3dRFP4nRl7IMj
         cwZ03RAU1BF91M8KDYDjV6iqsSspL9Cq4KN+lEL1xNwaBl1k2J7+slzqWbAGuwCGT9dS
         PK4g==
X-Gm-Message-State: AOAM531W3RLEWUWLQTBafCRhdCjwII4gXRInWoEoU7COddW6sHh5YKad
        pbGbcEvZfgyhT/tem5cp2u4yqm/tqpI=
X-Google-Smtp-Source: ABdhPJyqoU3lwqiUkOSY7g16uQAdRolM+zyxGxmhbYS+aEq9Gcoo208VcpeHbAZOrM3iJtndMUQFpg==
X-Received: by 2002:a9d:4916:: with SMTP id e22mr10282977otf.43.1631891300936;
        Fri, 17 Sep 2021 08:08:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13sm1552608ota.17.2021.09.17.08.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 08:08:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: AW: [BUG] omap_wdt.c: Watchdog not serviced by kernel
To:     Walter Stoll <Walter.Stoll@duagon.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <cb068bbba92347b2ab3190fda5d85ebf@chdua14.duagon.ads>
 <49fe3ca1-2243-f007-92b2-3c2d3430417f@roeck-us.net>
 <cd9db72b69964157b3e36e22ab1e542f@chdua14.duagon.ads>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <06eba290-1794-854a-f999-86668211dcaf@roeck-us.net>
Date:   Fri, 17 Sep 2021 08:08:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cd9db72b69964157b3e36e22ab1e542f@chdua14.duagon.ads>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/17/21 8:00 AM, Walter Stoll wrote:
>> -----Ursprüngliche Nachricht-----
>> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
>> Gesendet: Freitag, 17. September 2021 15:47
>> An: Walter Stoll <Walter.Stoll@duagon.com>; wim@linux-watchdog.org
>> Cc: linux-watchdog@vger.kernel.org
>> Betreff: Re: [BUG] omap_wdt.c: Watchdog not serviced by kernel
>>
>> On 9/17/21 1:36 AM, Walter Stoll wrote:
>>> Effect observed
>>> ---------------
>>>
>>> We use the watchdog timer on a AM335x controller. When U-Boot runs, we enable
>>> the watchdog and want the kernel to service the watchdog until userspace takes
>>> it over.
>>>
>>> We compile the watchdog directly into the kernel and add the parameter
>>> "omap_wdt.early_enable=1" to the kernel command line. We furthermore set
>>> "CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y" in the kernel configuration.
>>>
>>> Our expectation is, that the watchdog is serviced by the kernel as long as
>>> userspace does not touch the device /dev/watchdog. However, this is not the
>>> case. The watchdog always expires. It is obviously not serviced by the kernel.
>>>
>>> We observed the effect with kernel version v5.4.138-rt62. However, we think
>>> that the most recent kernel exhibits the same behavior because the structure of
>>> the sources in question (see below) did not change. This also holds for the non
>>> realtime kernel.
>>>
>>>
>>> Root cause
>>> ----------
>>>
>>> The CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED configuration option is not implemented
>>> in omap_wdt.c.
>>>
>>>
>>> Fix proposal
>>> ------------
>>>
>>> Interestingly we found only one single driver that implements this featrue,
>>> namely the driver from STM, see
>>> https://elixir.bootlin.com/linux/v5.4.138/source/drivers/watchdog/stm32_iwdg.c#L274
>>>
>>> This makes us wonder if there might be a good reason not to implement it???
>>>
>> It is primarily a watchdog core feature. Handling running watchdogs in the core
>> used to be enabled by default. Not everyone was happy with that, so
>> WATCHDOG_HANDLE_BOOT_ENABLED was added to be able to _disable_ that functionality.
>> It was never intended to be a driver feature. The STM driver (mis)uses it
>> because it wants to be able to support WDOG_HW_RUNNING, but the HW has no means
>> to detect if it is running. That doesn't mean that other drivers need to do
>> the same.
>>
>>> However we think this feature should be available. Our use case is to make
>>> software updates more robust. If an updated kernel hangs for whatever reason,
>>> then U-Boot gets the chance to boot the old one provided there is a reboot.
>>>
>>> Based on the STM implementation, we created a patch (see below) which resolves
>>> the issue. The watchdog is now correctly handled by the kernel until userspace
>>> first accesses it.
>>>
>>> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
>>> index 9b91882fe3c4..94e2e1b494d2 100644
>>> --- a/drivers/watchdog/omap_wdt.c
>>> +++ b/drivers/watchdog/omap_wdt.c
>>> @@ -271,6 +271,11 @@ static int omap_wdt_probe(struct platform_device *pdev)
>>>    	if (!early_enable)
>>>    		omap_wdt_disable(wdev);
>>>
>>> +	if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED)) {
>>> +		/* Make sure the watchdog is serviced */
>>> +		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
>>> +	}
>>> +
>>
>> No, this is wrong. The driver should set WDOG_HW_RUNNING if the watchdog is running,
>> independently of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
>>
>> The omap_wdt driver has a boot option "early_enable" which does start the watchdog
>> during probe, but it doesn't set WDOG_HW_RUNNING (which is the real problem).
>> Plus, if early_enable is not set, the driver explicitly disables the watchdog
>> (see code above), and setting WDOG_HW_RUNNING would be wrong in that case.
>>
>> The fix would be something like
>>
>>           if (early_enable) {
>>                   omap_wdt_start(&wdev->wdog);
>> 		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
>> 	} else {
>> 		omap_wdt_disable(wdev);
>> 	}
>>
>> That needs to be ahead of watchdog_register_device(), and is independent
>> of CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
>>
>> Guenter
>>
>>>    	ret = watchdog_register_device(&wdev->wdog);
>>>    	if (ret) {
>>>    		pm_runtime_disable(wdev->dev);
>>>
> 
> Hello Guenter
> 
> Thank you very much for your fast response. I checked your fix with all
> combinations of early_enable and CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
> 
Excellent.

>  From my point of view, this works exactly as expected. Any chance to get
> that mainline ?
> 

Submit a patch, I'll review it, and Wim will pick it up for v5.16.

Guenter
