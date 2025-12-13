Return-Path: <linux-watchdog+bounces-4696-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2579CBB10A
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Dec 2025 17:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47F003059344
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Dec 2025 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F6C18D636;
	Sat, 13 Dec 2025 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLd6T+g4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7E3B8D4B
	for <linux-watchdog@vger.kernel.org>; Sat, 13 Dec 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765641703; cv=none; b=rdZU3QQl6oSunB58a3f63Zm38kee6RWBqVBU7KfxEw8hjapLvuCnDXTgXrBwKa2Vv3q19BO5ap0ZnxqQcSZRXzcPeYPns3FdcXLnzvIlPlOeFqxb+VVHgWMJp9KcKee57qDnXKkBUl+ggWKYa0LZ0K21GQ20xfAmLszpSyRo+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765641703; c=relaxed/simple;
	bh=GugUZIDmxL1IfNy1Jk1N2veotxygzuKWiYbpFPhN9A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqX409Fik6SHq7dhuc/BP+E12RKq6xs4RMmMy0+aSl9YkMWq2+RfT6qXQjH4FOkLb7QdzC+mamy7raxxm5/VGMiOq8+ZYO5WlC2L1bxELYESUIvFsl+sXyGzQGUJFhlscDCd1tXpl1v3OjAGcYVKI/IixW3XSmIGGuPf64CfoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLd6T+g4; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae24015dc0so345632eec.1
        for <linux-watchdog@vger.kernel.org>; Sat, 13 Dec 2025 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765641700; x=1766246500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VNtjhG0Npr9CFEK/eSNr4DfvSNeMnTtAn/2BLbwKKZs=;
        b=MLd6T+g4DS2Pl4ldX3rGfg2oNr/iYu2wM2bYyeoFp8Lrw5P6xmxcZzZjY598bEue5J
         ds1ShP1uhKiCvZ7EMVwWd29BaGwRTx59gaz1y0C4U9PoR8RswnCcoNzbAegzwlImRGLJ
         Z1lv2sCohbngdB5oTn+ustECERg5PHkN7lX6Sb37Akb6898w0FH1oHIb9TEpPvztUYPu
         3LDtHErDDvMMC41JuwYTJk/pBbWJMXkIp9GpVzvwmbFOfcaHK4E8kEQxLPaWgwQf9ONX
         HZu7Zt47gKMw4kn+6ExvUlCfsIy2Jv0ZPUOscxPzdVbu8L+pl5ru1Fc3raJhBVuJ0GqZ
         OP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765641700; x=1766246500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNtjhG0Npr9CFEK/eSNr4DfvSNeMnTtAn/2BLbwKKZs=;
        b=vtyE/HsOmGouqwfJfhHo40bsTrDft82O/Jzam0wQmoFw+x8UzAlr3XxL4Avq3abwP4
         xvxazM5THrbj18untqm35gaP8jffJH6gDYu0jqjhdTqfIZmW3O7WljM423dg1qoX2fxM
         KOYwIHkMGsQt59STVQ7z2pX6ZoWeei9OFJp6y9ORPP3r2w9WB9ZggzY5j73Yy4ORHQkN
         mPZnaTRKM36W/TfJTdZXEd+T1sznf137AK9sWtqCqH40ZEPoNYxXTRsFPn7owe2Cuhvk
         blVT7DpQfTE3pXiQPAbqvLktyy+OUu9b2z5fjksnWVMhJEmIC9GBcHe0u0G4YlNpFnhz
         04CQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7UrKd+qKNuZ8kQE7NN85o2zz7XlxY6StCObUSRIqmouXfmhdWdKKl0WorhOOCUyfCg7HR3pQQKJtBBLHDPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwenjYc3dCcm1RNQKPcCHtG20x50477ces6HV9P78NO89yJl6vg
	+7OHZSxFGHXxU3qMAt+rEqzWqjAMvuz8salTA6olRp1vo0vZYi6vxy28fHiDmA==
X-Gm-Gg: AY/fxX7AWMkTtuzqfeQcCf5FhJF5gl+KeNOy4gK53HvE/Q5kw+7fL3vMIzvFQ+w+G+d
	lN0E8MG0HiKGutRAVM+DbfBsmutepxW/yEx9UoYM73/ettLQENeJ3jLUcfWdmNqVNI8TOrS+mPC
	G8+6O7ZqLBd5I2faKohYOrW3ZBokpnNElC7scMH+qoSjZtH5TEkqCBGgG7WPYrTkOGVdI7MFO2p
	dkCiM/IadKZZjhzAZRmzLvYMTqQy3tE1XbqUteX3/J7R5cA85TooURFbKjlrfZi2bIp2pjZUbC+
	9hhG/Ulp0OFZgILLdExNrMGzEWmZi1eul3r9VTGLCxmYMKtdfSd09fN8jB+9+5IGmwaz5FRNRCY
	2OzQxuBpaxiUCMhYwKwLyYKH95UT+tacchyN0D5ofcbUNuADqyrfaeVbZrzmMUEaaviqjDJe3/8
	Cif1TSIM86JJYEatTKGNfjJbBsClZnI4gbXSeqWEZB28fMBoIfrzcbmAVOfSc/byHd5DleXQ==
X-Google-Smtp-Source: AGHT+IEW34XEwqH24ydIm+j4Bela3kMkxcf2yXpdV2uRzVrtlakYUKvFcnGDBoT70a0C9nRdCj5TrQ==
X-Received: by 2002:a05:7301:4d0d:b0:2ac:1464:7255 with SMTP id 5a478bee46e88-2ac1c5cdacdmr4908716eec.5.1765641700068;
        Sat, 13 Dec 2025 08:01:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190acd01sm23728595eec.1.2025.12.13.08.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 08:01:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <acd50699-e369-4f29-a015-7a753e410f1e@roeck-us.net>
Date: Sat, 13 Dec 2025 08:01:37 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: James Hilliard <james.hilliard1@gmail.com>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
 <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
 <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
 <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
 <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de>
 <CADvTj4qWfq4OgGfYECuepazbwNWWhtH7qy6cAzCYeFKYDFGt-w@mail.gmail.com>
 <D6B291A1-0657-4DA6-A7F8-40C19AB9064D@exactco.de>
 <CADvTj4r+SJ6+jbOOkdjoiZFqwMFx2XLkHu6kwkaewW5a2w71aA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADvTj4r+SJ6+jbOOkdjoiZFqwMFx2XLkHu6kwkaewW5a2w71aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 15:00, James Hilliard wrote:
> On Fri, Dec 12, 2025 at 3:44 PM René Rebe <rene@exactco.de> wrote:
>>
>>
>>> On 12. Dec 2025, at 23:41, James Hilliard <james.hilliard1@gmail.com> wrote:
>>>
>>> On Fri, Dec 12, 2025 at 3:34 PM René Rebe <rene@exactco.de> wrote:
>>>>
>>>>> On 12. Dec 2025, at 23:28, James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>>
>>>>> On Fri, Dec 12, 2025 at 3:16 PM René Rebe <rene@exactco.de> wrote:
>>>>>>
>>>>>>
>>>>>>> On 12. Dec 2025, at 23:04, James Hilliard <james.hilliard1@gmail.com> wrote:
>>>>>>>
>>>>>>> On Fri, Dec 12, 2025 at 2:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>>
>>>>>>>> On 12/12/25 12:17, James Hilliard wrote:
>>>>>>>> ...
>>>>>>>>>   +       /* wdt already left running by firmware? */
>>>>>>>>>   +       if (_wdt_running()) {
>>>>>>>>>   +               pr_info("Left running by firmware.\n");
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I'm wondering, is there a way other than looking at dmesg to identify if
>>>>>>>>> a wdt was left running by the firmware? I'm thinking having an ioctl or
>>>>>>>>> similar could be useful as a way to notify a user that a BIOS or firmware
>>>>>>>>> configuration change may be needed.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This is not a bug, so there is no need to notify the user in the first place.
>>>>>>>> The only reason for accepting the message is that I was tired arguing.
>>>>>>>> It is even misleading, because loading the driver, starting the watchdog
>>>>>>>> by touching the watchdog device, unloading it, and loading it again will
>>>>>>>> likely trigger the message.
>>>>>>>
>>>>>>> Yeah, I'm aware it's not a bug, I'm just thinking it might be good to have
>>>>>>> watchdog drivers record the initial running state.
>>>>>>
>>>>>> The kernel logs so much pointless random stuff; an info about a
>>>>>> running watchdog timer is more than warranted in this case IMHO.
>>>>>> It wasted quite a bit of my valuable time.
>>>>>>
>>>>>>>> Userspace can check if a watchdog is running by reading
>>>>>>>> /sys/class/watchdog/watchdog<index>/state. Do that after loading the driver
>>>>>>>> and before starting the watchdog daemon and you'll see if the watchdog
>>>>>>>> was running when the driver was loaded. But that doesn't mean it was
>>>>>>>> running when the system booted; it only means that the watchdog was running
>>>>>>>> when the driver was loaded.
>>>>>>>
>>>>>>> Hmm, this seems impossible in some configurations, AFAIU systemd's
>>>>>>> watchdog is integrated into PID 1, so loading a watchdog daemon later
>>>>>>> doesn't appear possible.
>>>>>>>
>>>>>>> Maybe it would make sense to have a sysfs variable like
>>>>>>> /sys/class/watchdog/watchdog<index>/initial_state so that
>>>>>>> there's a way for userspace to determine if a watchdog was
>>>>>>> already armed by the time the driver was loaded?
>>>>>>
>>>>>> This would be quite wasteful overkill for something that unimportant.
>>>>>> It is rare that firmware leaves a watchdog timer enabled in any case.
>>>>>
>>>>> I think your presumption that a watchdog is unimportant is wrong,
>>>>> in my case I want to identify systems and send alerts if it's detected
>>>>> that a watchdog was NOT armed by the firmware.
>>>>>
>>>>> I manage a bunch of x86_64 based embedded systems and
>>>>> we always want the watchdog enabled, including in the BIOS,
>>>>> however unlike on your system the watchdogs on my systems are
>>>>> disabled by default and must be manually configured in the BIOS.
>>>>> We do still arm them from Linux either way but it would be nice
>>>>> to warn users that their systems have bad BIOS settings, on the
>>>>> systems I work with failing to arm the watchdog in both the BIOS
>>>>> and Linux can result in the watchdog failing to fire when we need
>>>>> it to under some circumstances(we're not sure exactly why this
>>>>> happens but failing to arm the watchdog in the BIOS can result
>>>>> in the watchdog not always firing if the system freezes during a
>>>>> reboot from what we can tell, although it's difficult to reproduce
>>>>> this issue in our hardware testing lab).
>>>>
>>>> Instead of adding new kernel state, you could probably just read
>>>> the initial state as suggested by Guenter.
>>>
>>> As I mentioned earlier, I don't think we can read initial state since
>>> AFAIU systemd PID1 will immediately arm the watchdog prior
>>> to anything else running, so by the time we could read the state
>>> variable the watchdog would have already been armed so the
>>> state var would be meaningless in regards to determining if the
>>> firmware armed the watchdog.
>>
>> You can either adjust systemd accordingly or add a /sbin/init
>> wrapper for systemd to check the state before executing init.
> 
> This seems super hacky to me and likely to cause weird issues.
> 

systemd executes a number of actions before opening the watchdog device.
At the very least that includes loading all the modules. I am quite sure
that some script can be configured to run after loading the modules and
before opening the watchdog device. I don't see that as hacky.

Guenter


