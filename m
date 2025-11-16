Return-Path: <linux-watchdog+bounces-4597-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F21C61AFF
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 19:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF2D535B341
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 18:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B58621FF2E;
	Sun, 16 Nov 2025 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9+KXfcm"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C63101AA
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763318600; cv=none; b=c+hobYaOmkcSDFepgyjre2kJF1dFkg/HeOkO32VxAZAPDylz+ZQqNXb3lP6Av5gKf+gzT+R0bNGxjlU3V0M7gXm6bQJTNXUR1VJd4cidPHbYRmJcpHt54dSnlyT5GnKkQCwRUymP71F4uz8cj8JMDG2ZZSsxvBtj6UcJa0pYohM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763318600; c=relaxed/simple;
	bh=LCcfhkjx9fdmPxiw27tkERaZp0C+5CUPTfZZI78kbwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJux9CTGSY6SS3YauAueMhZzTra644sKof9PnSAK0roz86fmH3eHvfAD8M/1pncVkBBysGAiL/lWPzLMLAYpS5g6RShfw0hYAKZZ7zsp5F0d5PuORN4shwjZuGkFk7Sijhjk7CtVypE/IxGQYRQ66U3/Q5vOgxRr+kKQz22c38A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9+KXfcm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29845b06dd2so39777565ad.2
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 10:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763318597; x=1763923397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lT17/ZF47H4Sxg/49bRH50Z6WdBk8ij2/y8yqQqgxII=;
        b=B9+KXfcmjF4OPjd4QNTZ2Aa+iFs2xNG4skXufxxtVH1CTkAREXjPss1FeZe7MNxLcb
         6ZNxwCmxuONjgaxrxozQtyX+6zNAjlfVtKLTtSkTkMLwAZUPS4ZCApIMcAbq/mtFzvE3
         HL8OcjdRi62WoNdFBsB7AcoWWAE8/Z1dn4mw9A1NrkF+pJxiB+FF98fCLXanQ/uBT5ZO
         yV7YMWUW5gr8EWGJNN1Rf/uy1JnsvmHrv/5d79QU5V+XUcz23fxe/fCYbjHMx99sf47g
         0vtqBR8PoRzmNTBNPsESmT2VDlpo4ppmDkhPeI7MTJWqxNwHiZF3KlLzo+m6QMLSXatS
         7GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763318597; x=1763923397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lT17/ZF47H4Sxg/49bRH50Z6WdBk8ij2/y8yqQqgxII=;
        b=O71qAUdihtq+39sGV6FPq7rXYZMLoRk8DcccqNpzu5RZO4ww21h9/lKm/m3UYKm/kd
         1nMKnAbfbzm22wJOi3WaxJS+6AYOibLTJzI52Ardmb8PAv0KIgIZKzKJDpTHVkyE5mgv
         azSsJvQfXFWka+T/DCHTQ7H9jlHYjAxYImAOs8la+PTv5RFjyZ8LxggpHhdJ0zddxy2B
         FifCm6URg4zTBd7O0sl+Xa3Uhfvn1wEwoCAG3XuYwWrHVM0fBkY5RzijQ79/kflO6FnT
         j62TqaTT5JfhcYALyAqZHhluLdregsJX9y8snl1qJX8uFvme/a6EUee6tfiY20EJga7Y
         nJkg==
X-Forwarded-Encrypted: i=1; AJvYcCW9tzEYdgBU+hJqf293ObMVIgPsPFicnaX36VjOn1713R8TtA3Xv3WLb+6hfmbWhyeZ6XDOirkkrKFBrtWkYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YykalrpN0Elm+gsPzzxugCetUvYYhLrERrmcZIwufh4cPf7TpsQ
	mDv/pXw3TkDvWpnSHs2PkBSqteEOEnLubQJC7kneOzlQebHmoE2PhjFY
X-Gm-Gg: ASbGncv3JFXqpzhXQz9F09aiKCKmx5qQEeK1V+67WLOAGNuGFLh1GqAbRHnLsskeXaL
	ghjr6aqv8VIfIbs76LY31A5/5hY4Tyh3R3MDOIj19bVfbvG+XlPB5zmhirjBVHdn8+4FgZg+qtF
	xSF89X7FgsrLlcKN8C0VhcIZACF9XnfbpJRULUbvcFvKmOB6n7cnVD/80tPCM/mfbUUrr2X4OQN
	s2EKpoF2QtW1K5Tx9onQSsSHSnFPCXWr/iK2FPNOSvlP7gqgrXyF8mVq2uWtUP1mjInMRq2uW/l
	gShk1lIiN+vFSe5UU3Uge6x+0Wt5xXczaRCw5kD72M6caOfsRh3k7FEnmwlBDaBnEelCeh9hTHI
	fuln9G2se0ViwAeBvi21pGbXGAewCOTp/4+zvMSW9unpnSCfIkkFyCPzfN9wsxPSTnEwXJ6jmOv
	FLxQSxYUxbPpl3AoATQcOwo6Nwy8lbGlRMA5vIrh6YWH/1EktkR477o+ylkagMFh5ggLI1Yw==
X-Google-Smtp-Source: AGHT+IHAJoipFEx3JklNvPdkAWaoW3oYdGdNfnMeF2L68NdMY+ZItmjkcYaq51bcuFf8QPv7z+3wMA==
X-Received: by 2002:a05:7022:6b9e:b0:119:e569:f262 with SMTP id a92af1059eb24-11b40f8ab3amr5423955c88.11.1763318597050;
        Sun, 16 Nov 2025 10:43:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm38867114c88.8.2025.11.16.10.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 10:43:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f0e8cb64-53f6-4bc7-ad10-83e4bfc5b1c1@roeck-us.net>
Date: Sun, 16 Nov 2025 10:43:15 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251116.145908.308086523429052446.rene@exactcode.com>
 <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
 <20251116.181454.1861060123559061936.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251116.181454.1861060123559061936.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/25 09:14, René Rebe wrote:
> On Sun, 16 Nov 2025 08:22:39 -0800,
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 11/16/25 05:59, René Rebe wrote:
>>> Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
>>> wdt enabled by the firmware and a broken BIOS option that does not
>>> allow to change the defautl time or turn it off. This makes installing
>>
>> default. Also, claiming that the BIOS would be broken is
> 
> Sorry for the typo, English is not my native language. I will try
> harder next time.
> 

No worries. Happens to native speakers as well.

>> inappropriate:
>> For all we know this is on purpose.
> 
> The BIOS is broken in that it has an option configure the time and
> disable it but it does not save and thus have no effect. Thus that
> part is as broken as I described it, ...
> 
>> Unless I am missing something, this makes it impossible to stop the
>> watchdog.
>> Is there a configuration bit indicating that the timer can not be
>> updated ?
> 
> No, I only meant the BIOS configuration is broken.
> 

Ah, ok, then the scope is wrong to start with: The problem is not that
the BIOS is broken, the problem is that there are BIOSes out there which
enable the watchdog. The driver should support that case, broken BIOS or
not.

In other words, the driver should work fine if the BIOS _does_ enable
the watchdog. It should not be necessary to disable it for the driver to
work.

>> If so, the watchdog core needs to be told that the watchdog can not be
>> stopped.
>> Otherwise userspace could try to stop the watchdog and the system
>> would reset.
> 
> No it is fine, setting the time to 0 disabled it, I tested.
> 
>>> Linux difficult and annoyingly rebooting early in an installer; unless
>>> one loads and starts a watchdogd in the installer environment.
>>> Change it87_wdt to report a running timer to the watchdog core using
>>> the user supplied or module's default time and set it as the timer
>>> might already be up and trigger soon.
>>> Signed-off-by: René Rebe <rene@exactco.de>
>>>
>>
>> ---
>> and change log goes here.
> 
> sorry, oversight, I'll make a mental note to never forget it again Sir.
> 
>>> --- a/drivers/watchdog/it87_wdt.c	2025-09-28 23:39:22.000000000 +0200
>>> +++ b/drivers/watchdog/it87_wdt.c 2025-11-16 14:18:24.759115286 +0100
>>> @@ -4,6 +4,7 @@
>>>     *	   for ITE IT87xx Environment Control - Low Pin Count Input / Output
>>>     *
>>>     *	(c) Copyright 2007  Oliver Schuster <olivers137@aol.com>
>>> + *	(c) Copyright 2025  René Rebe <rene@exactco.de>
>>
>> For a couple of lines of code ? Really ? I changed 75 lines in that
>> driver
>> and don't claim that.
> 
> To be fair, for my inital one-liner fixed I did not have that, but as
> I now spent hours adjusting it to your suggestions, if not
> requirements, debugging and testing, I thought that is more than a one
> liner. But my life does not depend on it though legally it probably
> might be a thing.
> 

I'd have a copyright claim on hundreds of files in the kernel if I would
use that logic. Let's see...

$ git show --name-only --format="" $(git log --oneline --author="Guenter Roeck" --format=%h) | sort -u  | wc
    1401    1401   42814
$ git grep "Copyright.*Guenter Roeck" | cut -f1 -d: | sort -u | wc
      32      32     883

Guess I have some copyrighting work cut out for me. Oh, and that would
include this driver.

Seriously, if you rework the driver to work as platform device, a copyright
claim might be warranted if you insist. If you rework a watchdog driver to
use the watchdog subsystem core (not an issue here, I did that already),
you would have a valid claim. Adding minor functionality such as detecting
if the watchdog is running ? Not really.

As for time spent ... I sometimes spend several days (not just hours) to track
down a problem in the Linux kernel. Does that make me own a copyright on the
file(s) that include the fix ? Not really.

I assume that there is some legal definition on who has a copyright on kernel
code. If so, that is automatic and does not need to be spelled out. By convention
the copyright listed on the top of Linux kernel files is used to indicate major
contributors. I have no interest in changing that - if minor contributors would
be listed, the entire kernel would be cluttered with copyright lines. I find
that misleading and unacceptable, and will not agree to it.

>>>     *
>>>     *	Based on softdog.c	by Alan Cox,
>>>     *		 83977f_wdt.c	by Jose Goncalves,
>>> @@ -188,6 +189,15 @@
>>>    		superio_outb(t >> 8, WDTVALMSB);
>>>    }
>>>    +/* Internal function, should be called after superio_select(GPIO) */
>>> +static unsigned int _wdt_get_timeout(void)
>>> +{
>>> +	unsigned int ret = superio_inb(WDTVALLSB);
>>
>> Empty line after variable declarations.
> 
> Oh  man, guess  time to  re-read the  kernel style  guide and  run all
> changes thru some verifier ;-)
> 

You might possibly consider running checkpatch --strict.

>>> +	if (max_units > 255)
>>> +		ret |= superio_inb(WDTVALMSB) << 8;
>>
>> There is a configuration bit which determines if the timeout is
>> counted
>> in minutes or in seconds. That needs to be taken into account as well.
> 
> I had this at the caller but can of course move it here.
> 
>>> +	return ret;
>>> +}
>>> +
>>>    static int wdt_update_timeout(unsigned int t)
>>>    {
>>>    	int ret;
>>> @@ -292,6 +302,7 @@
>>>    	u8 ctrl;
>>>    	int quirks = 0;
>>>    	int rc;
>>> +	unsigned int _timeout;
>>>      	rc = superio_enter();
>>>    	if (rc)
>>> @@ -374,8 +385,6 @@
>>>    		}
>>>    	}
>>>    -	superio_exit();
>>> -
>>>    	if (timeout < 1 || timeout > max_units * 60) {
>>>    		timeout = DEFAULT_TIMEOUT;
>>>    		pr_warn("Timeout value out of range, use default %d sec\n",
>>> @@ -388,6 +397,17 @@
>>>    	wdt_dev.timeout = timeout;
>>>    	wdt_dev.max_timeout = max_units * 60;
>>>    +	/* wdt already left running by fw bios? */
>>> +	_timeout = _wdt_get_timeout();
>>> +	if (_timeout) {
>>> +		pr_warn("Left running by firmware.\n");
>>
>> This is not a reason for a log message, much less for a warning.
> 
> I often daily waste time with something random, because of missing
> diagnostics. Often something as stupid as this. Should the user not
> know the FW left a watchdog running that you insisted should be left
> running? I certainly would like to know that there is something I did
> not explicity asked for especially if a user might wonder why the
> system might sometimes randomly reboot. Few will see this message.
> 

Not an argument. This is not something left running, it is perfectly
valid configuration - even more so if the BIOS supports enabling the
watchdog. It is also not "left running". I'd accept an informational
"timer is running\n" (hpwdt) or even "Watchdog already running. Resetting
timeout to %d sec\n" (w83627hf_wdt), but not as warning and it has to be
neutral (no claim or suggestion that this is somehow wrong).

> The kernel has much more random nonsene diagnstic, like MCE missing on
> on Intel and AMD CPUs etc.
> 

That is a much worse argument. You can find pretty much everything in the kernel.
Many people drive faster than the speed limit. That doesn't make it a good idea,
much less legal.

>>> +		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;
>>
>> This should be set instead of setting max_timeout.
> 
> I thought that might not yet work here that early, and IIRC grep found
> other drivers doing it liek this, but will of course adapt.
> 
>>> +		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
>>> +		_wdt_update_timeout(timeout);
>>
>> The watchdog core does that already when the watchdog is registered.
> 
> Ok, instantly without delay? Will double check.
> 
> Thank you for your review, will send v3 soon.
> 
>        René
> 
>>> +	}
>>> +
>>> +	superio_exit();
>>> +
>>>    	watchdog_stop_on_reboot(&wdt_dev);
>>>    	rc = watchdog_register_device(&wdt_dev);
>>>    	if (rc)
>>>
>>
> 


