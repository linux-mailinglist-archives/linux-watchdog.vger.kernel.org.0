Return-Path: <linux-watchdog+bounces-3017-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F8A46034
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 14:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A173816ACE3
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 13:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445802185B1;
	Wed, 26 Feb 2025 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdSfU5kN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2BE214A67;
	Wed, 26 Feb 2025 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575142; cv=none; b=tn7hY08VhIJYJZze4tqi1nj4egnHcBnttwuEDOrbDzwlp7YbR6AXOcJHhSBC6h32kjafoG8jMUu8xLPggReZNjSi2duboJzWFQyXtguaS1+q88DWYYcFaQePZoBtJMV1gMTTw8QdPmw+O+OL5Td1v0lLFVP/DVZ87K/sgbAZyvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575142; c=relaxed/simple;
	bh=1GWAwJbeJ27racJs1CBNgOb3G6k5EODN4zwLmay7JBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdCFTHQj/j40Kgk7Cn1bd6KqR3ET7efssloC6gTPEtJ6qL0RzwFLu+EQcmU4EQuRWGVRCAaWmv7Ry6BSLU0J7Hk6JQE6oRGemTwuwroOxvvMyaHr8i7iYMiVJLVScosRN9egYAcz3ls16lAmmYDJVWrIV0k/Qsdf7pk1WY7paOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdSfU5kN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c665ef4cso118332675ad.3;
        Wed, 26 Feb 2025 05:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740575139; x=1741179939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kUPJYq5MrOZuiXFR7HsmKdUOXvIR5gBlSfyG8uvBxWA=;
        b=SdSfU5kN3n06L2qhoZPRh0/Ihx2eJMAEGuErQ7fS/Srtty2t8/H5z17pUYEA/yIfPj
         MVJumxMnq0uMY4liQEn0jXRerLmsYlk3ZLWybO/gfMjDY8wgz4uOVX+vPUacmbyNVKUS
         xiaRxf05UFAOwa5i2N8DZEFMy0kyyXNlKy/363QdORtizuwZ8aAYX6fvJQ2TwJAX+n1I
         4KtZUU/4lDq9rrrzR+jib+Dgz2gxdhXvJXo5ONzJdge/i+TSJIGAKt2Q6hJ5ckH8TS37
         91XaVzf5paXThlfF0TwLpdCAuV/cJwCPA5Za4WzCBlrphoUM9bgM7Y20Q6M4ASitmvdW
         EcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575139; x=1741179939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUPJYq5MrOZuiXFR7HsmKdUOXvIR5gBlSfyG8uvBxWA=;
        b=Hyd+xDhhMPWWETECNUfxCYgoVIyIUJRV8z87ozsX/FkXikgXY92cI060lvOP+SRk6i
         kMKCHhhzv4bMEIMgTgGidtsRx4IPQcFATurmmH1oxIGe/yvPlq/jC5O/oVXmLNRvtu26
         5sJWgS0DrVzdQ7Ky4w8I/OExM/tEzKfpfPaXh7xWU4Ccr3PI7wlhro7vq/ySR4tPla67
         IZeTObG9ZEM0LJnOAZEGlVCPujIRt4DHBB+4Oigl3mh0jrMcM/TxtAeLlWZIqWWX7cg/
         IbLeHZxTGS3i0xgkskwpP25lnS56waYWreFxf7diTOkmBQLaoh51u2jdLrKSnUQJFzgO
         0ZVA==
X-Forwarded-Encrypted: i=1; AJvYcCUbZLIEq1n9YWFQ3zSzOSK7vHBkMY2aqxqID2oVMOFBKEwlpo0aL+K6Pl+ZPnyNVhbiuBw/0aaMsv4gE922@vger.kernel.org, AJvYcCV3vfVSbJJ0b+2LJ8qOrBZSmB4B9GrJlT2j3OEJrIkr9ut575OEmBS6WYjEwSSdY3W21YYPOqY67vE=@vger.kernel.org, AJvYcCWfucVP67ojJn5j/7zZe2TQcZ5agIUkVk1Q0glxwtwZpA0K/YR8nmQmt9kxBfxxH/Y9GNjfmQLdYGzCcm504lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYvIt2RtxDCzmoOokZU2xt+v4lkmNdufu2YSnWprva9AI0tGh
	ctoWFjejgwv3Ldv+VUUypVdbjIHarkRmNVrC8MctpPpkwclu7Bm3
X-Gm-Gg: ASbGncv4OY7g5WLGzJkFzfvyAnqUH+i3HvtkdpzzwvicuOD0j/45bYMpOsJ2oNbcT6G
	L+/An1Vu1wCUgSKFt1Tzpo/OGYm2kqeH2m08ZJlIwnf6aomeUSaDbtJ6LqAYiSa+aOn4HYJVecC
	MYz8X6dE/MnegWP+uAUP94a+rO/Hcp+oeRAi0sSAIfyEE9Ca+xwpvg09xyEURxg7tb6ii88G5L1
	oXu0Z0rB8ajEFTnxUlznVk2wyL406xiWhyMlxTBpFyespuRv+Ni1RHr1SGLXoXzhlSe+ZyiEFow
	X4XgaiwueG9lpcUQdGJxQupdnH0CEN9I0hwjRKWNfxbPV7RFrA3KUzBulM0mrBRMSP9IQhnn83Q
	=
X-Google-Smtp-Source: AGHT+IF52Tf/01cGLG+xCIoFZ0NjGuMjfXvwIbTsVAazBV62ZHuWTYw7OgubBrzI8FDcQXOYRpeNyA==
X-Received: by 2002:a05:6a00:1810:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-73426d77f98mr29955779b3a.15.1740575139335;
        Wed, 26 Feb 2025 05:05:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6abb0dsm3413704b3a.11.2025.02.26.05.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 05:05:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca040804-3b04-4852-af14-8be1d4becf3f@roeck-us.net>
Date: Wed, 26 Feb 2025 05:05:37 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v3] drivers: watchdog: Add support for
 panic notifier callback
To: George Cherian <gcherian@marvell.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250225140615.2141119-1-george.cherian@marvell.com>
 <85d99af3-a3ee-41dc-96df-0b9903a6f516@roeck-us.net>
 <PH8PR18MB53811DA4CD7BAAFE7C8857CBC5C22@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH8PR18MB53811DA4CD7BAAFE7C8857CBC5C22@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 01:14, George Cherian wrote:
> 
> 
> ________________________________________
> From: Guenter Roeck <groeck7@gmail.com> on behalf of Guenter Roeck <linux@roeck-us.net>
> Sent: Tuesday, February 25, 2025 21:34
> To: George Cherian
> Cc: wim@linux-watchdog.org; corbet@lwn.net; linux-watchdog@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [EXTERNAL] Re: [PATCH v3] drivers: watchdog: Add support for panic notifier callback
> 
> 
>>> On Tue, Feb 25, 2025 at 02:06:15PM +0000, George Cherian wrote:
>>> Watchdog is not turned off in kernel panic situation.
>>> In certain systems this might prevent the successful loading
>>> of kdump kernel. The kdump kernel might hit a watchdog reset
>>> while it is booting.
>>>
>>> To avoid such scenarios add a panic notifier call back function
>>> which can stop the watchdog. This provision can be enabled by
>>> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
>>>
> v> Signed-off-by: George Cherian <george.cherian@marvell.com>
>>> ---
>>> Changelog:
>>> v1 -> v2
>>> - Remove the per driver flag setting option
>>> - Take the parameter via kernel command-line parameter to watchdog_core.
>>>
>>> v2 -> v3
>>> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
>>> - There are no users for this.
>>>
>>>   drivers/watchdog/watchdog_core.c | 42 ++++++++++++++++++++++++++++++++
>>>   include/linux/watchdog.h         |  2 ++
>>>   2 files changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
>>> index d46d8c8c01f2..8cbebe38b7dd 100644
>>> --- a/drivers/watchdog/watchdog_core.c
>>> +++ b/drivers/watchdog/watchdog_core.c
>>> @@ -34,6 +34,7 @@
>>>   #include <linux/idr.h>               /* For ida_* macros */
>>>   #include <linux/err.h>               /* For IS_ERR macros */
>>>   #include <linux/of.h>                /* For of_get_timeout_sec */
>>> +#include <linux/panic_notifier.h> /* For panic handler */
>>>   #include <linux/suspend.h>
>>>
>>>   #include "watchdog_core.h"   /* For watchdog_dev_register/... */
>>> @@ -47,6 +48,9 @@ static int stop_on_reboot = -1;
>>>   module_param(stop_on_reboot, int, 0444);
>>>   MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
>>>
>>> +static int stop_on_panic = -1;
>>> +module_param(stop_on_panic, int, 0444);
> 
>> This can now be bool.
> Ack.
>>> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");
>>>   /*
>>>    * Deferred Registration infrastructure.
>>>    *
>>> @@ -155,6 +159,23 @@ int watchdog_init_timeout(struct watchdog_device *wdd,
>>>   }
>>>   EXPORT_SYMBOL_GPL(watchdog_init_timeout);
>>>
>>> +static int watchdog_panic_notify(struct notifier_block *nb,
>>> +                              unsigned long action, void *data)
>>> +{
>>> +     struct watchdog_device *wdd;
>>> +
>>> +     wdd = container_of(nb, struct watchdog_device, panic_nb);
>>> +     if (watchdog_active(wdd)) {
>>> +             int ret;
>>> +
>>> +             ret = wdd->ops->stop(wdd);
>>> +             if (ret)
>>> +                     return NOTIFY_BAD;
>>> +     }
>>> +
>>> +     return NOTIFY_DONE;
>>> +}
>>> +
>>>   static int watchdog_reboot_notifier(struct notifier_block *nb,
>>>                                    unsigned long code, void *data)
>>>   {
>>> @@ -299,6 +320,14 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
>>>                        clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
>>>        }
>>>
>>> +     /* Module parameter to force watchdog policy on panic. */
>>> +     if (stop_on_panic != -1) {
>>> +             if (stop_on_panic &&  !test_bit(WDOG_NO_WAY_OUT, &wdd->status))
>>> +                     set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
>>> +             else
>>> +                     clear_bit(WDOG_STOP_ON_PANIC, &wdd->status);
>>> +     }
>>> +
> 
>> No longer needed here. See below.
>>
> Ack Got it.
>>>        if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
>>>                if (!wdd->ops->stop)
>>>                        pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
>>> @@ -334,6 +363,16 @@ static int ___watchdog_register_device(struct watchdog_device *wdd)
>>>                                wdd->id, ret);
>>>        }
>>>
>>> +     if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status)) {
>>> +             if (!wdd->ops->stop) {
>>> +                     pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
>>> +             } else {
>>> +                     wdd->panic_nb.notifier_call = watchdog_panic_notify;
>>> +                     atomic_notifier_chain_register(&panic_notifier_list,
>>> +                                                    &wdd->panic_nb);
>>> +             }
>>> +     }
>>
>> Simplify to
>>        if (stop_on_panic) {
>>                 if (!wdd->ops->stop) {
>>                       pr_warn("watchdog%d: stop_on_panic not supported\n", wdd->id);
>>                 } else {
>>                         wdd->panic_nb.notifier_call = watchdog_panic_notify;
>>                         atomic_notifier_chain_register(&panic_notifier_list,
>>                                                        &wdd->panic_nb);
>>                         set_bit(WDOG_STOP_ON_PANIC, &wdd->status);
>>                 }
>>         }
> Okay will update to this.
> 
>> This also fixes the bug where the unregistration function is called
>> even if the notifier was not actually registered.
> 
>> One thing I just realized is that we'll have to figure out if atomic
>> notifiers can be used here unconditionally. Unless I am missing
>> something, watchdog stop functions can sleep. Of course, sleeping
>> while panic isn't a good idea. That means we _may_ need a driver
>> flag indicating either that the stop function can sleep or that it
>> won't. If we need that, I suggest we add WDIOF_STOP_MAYSLEEP or
>> similar to the watchdog_info options field.
> 
> Yes, that is correct there are certain .stop implementations which can sleep.
> I will add a new WDIOF_STOP_MAYSLEEP  flag and enable the drivers with
> this new flag. Only those drivers which have non-sleeping stop function will
> be able to have this feature.
> 
> I hope this is what you are expecting.

Yes, that would be great. Please add the flag in a separate patch.

Thanks,
Guenter


