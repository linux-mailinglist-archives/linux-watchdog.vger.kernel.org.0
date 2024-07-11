Return-Path: <linux-watchdog+bounces-1361-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EF92F23C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E82611F21A79
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5B19F46D;
	Thu, 11 Jul 2024 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmcfDbQ7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139D12C477
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738115; cv=none; b=Q+A9n9R5Ts+5GRzIDJW1wYiOE6DzaJLNFKu1tmcWhVh+18fYLGPLxQx5sQRCSZseS4Y4LYoaTHoNzXUooVGRsIyCb6iiSGKBK1VENu9l6NqplJLXIJKCdK+nZz9xN36YIo77R7+uTmnNUNlYjaH5ZfsrgjotSX6ME0DKCASUPkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738115; c=relaxed/simple;
	bh=lMJXKrJ+sZgTobqLzPiOr5mCbWjl0P/6Oi3O9qnCpF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBlS8FUVlcHltwZq7wmuyPihfGiQCtHTiiANLNz+k4vLdX6UpL6gJIQ70RcbcAY72+jgMaGmsA9h5G9pjkK9rjzaMiq51XbMWs8KEbindhcNoo3o2yMXapXQ49R1wxOQJ1xjiiIW86XcwFB+Fhw8RqMfm9oxAKEs7sr1M1THw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmcfDbQ7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c5362c7c0bso1114030a91.1
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720738113; x=1721342913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NjDTHFeGoDbF/L+Ohm7sJ9OD83vLlsvpbtUDo7ckSgs=;
        b=VmcfDbQ7HH02FAhUDwNsPuT8kjrliW0kMFLP2sNWcmB9Oqw0VcW6Hxggu2yATIkQ5o
         6z6yXSrtrFR8llgqxUBzDLVsZ0qBp+n5VvQq2WgoGcBRwyP+yoP3B75R8fnNJ5mP1JfT
         c+LsE4uy7hUZOXTw6FKJBQyZ4s7UU7eVbl1l9dWiuidhSF9at+xJoKDRqD1QzNdC2hLx
         ywHmp/ckzpDwreJyOgPip+Z2nt5mPDWRdhhUMxu93xkmmebAchN9qAxP5Vzd5SmE8PGq
         dF15I9DpWXUJtfh+JVt15ZFMw8yNaG9CkSK2Je7YMikJjpvEggplmidnG9QuDMBQ8P/0
         ti3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720738113; x=1721342913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjDTHFeGoDbF/L+Ohm7sJ9OD83vLlsvpbtUDo7ckSgs=;
        b=dG5D87TjIwaOwLBFsFsWaG8vUVoYT5ya0t6ED4DFJX42QKmIs0k5vWginceZ5Rl3eS
         1NcgfuSlbMx+9653rLiVSQJeLvXBYGWGzAyG1ZAxdVEOR6RVsU5hVGq1e9o+VWF8ifRD
         C9yOV0QsorZ/jUVSmGTV9GDLH+hp0bYEzrcMQdq3UUQLggAnprirUgBk0thf5qrH+k58
         aSo1mlHt/0j+lZncRUM9YLQ+n8Skg61r3fm9DFs2yrAhifAryp9B51kjhF2J/F+47Bjp
         AXKw2u7qmkCiN/uCdah06jm2p0BgPQAhbcBehRrr92wfpLig7AfOsm7yv02zpkHntG2V
         Xs3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuozV3KsXABx+0EC7m1JxaNTF1u8QiSLgendL8r5FVGbYhJQWsBlWeza98fxvvZKz9vP7Lv03eLLOvN/0b7daeqwRTzH5MXgZkN5QALDw=
X-Gm-Message-State: AOJu0YzoI4YWWBATy7ylu6d91XonnXZHScfcM5V45ics/xDsH3+FTIs3
	He08gLSCkdqB0w8plQFvZQsWzh9fh86hDiitltYqOpUf+UG61lDB
X-Google-Smtp-Source: AGHT+IEqJp8rvG6PXJcmGsNnT/9RHLECEwUnl6fOfjSYFawYozBLEn1sjlGLmI/JL91RahUSjumKHA==
X-Received: by 2002:a17:90b:4a4c:b0:2c5:1a3:6170 with SMTP id 98e67ed59e1d1-2ca35d4878amr7769786a91.38.1720738112834;
        Thu, 11 Jul 2024 15:48:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd3fe09asm117777a91.13.2024.07.11.15.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 15:48:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <213f1f7c-aa0a-49b4-a6af-d76a2cbc2299@roeck-us.net>
Date: Thu, 11 Jul 2024 15:48:30 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for
 IT8784/IT8786
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Werner Fischer <devlists@wefi.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
 <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net>
 <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
 <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net>
 <CADvTj4ohSu7ngB=M8eEpA45shos8M9YM7bbDHhOy=HQVk9YG3w@mail.gmail.com>
 <b09058ca-9547-4d70-96a7-b7fe6b8beb3e@roeck-us.net>
 <CADvTj4r3y4W=PwP4aw1TsKpe1pY=SKBTWjfKZJqFe5J-GxNOJA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4r3y4W=PwP4aw1TsKpe1pY=SKBTWjfKZJqFe5J-GxNOJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/11/24 15:14, James Hilliard wrote:
> On Thu, Jul 11, 2024 at 3:42 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 7/11/24 14:09, James Hilliard wrote:
>>
>>>> The best we could possibly do might be to add a check for the bit in register
>>>> 0xf1 and warn the user that they might have to use the ACPI driver if the bit
>>>> is set. I am not sure if that would be helpful or just add noise, though.
>>>
>>> Do your systems which work with the it87_wdt driver have that 0xF1 bit not set?
>>>
>>
>> I only have one such system left, and the bit is not set on that system.
>> I avoid buying hardware with ITE Super-IO chips nowadays since their support
>> for Linux is non-existent.
> 
> Yeah, I got stuck with a fleet of these boards, trying to make the best of it.
> 
>>
>>> I'm thinking we should check for that bit and prevent loading the
>>> it87_wdt driver if
>>
>> No. That would create the risk of no longer loading the driver on systems where
>> it currently works.
> 
> Hmm, any idea how likely it would be that the bit could be set on a board
> which the driver works on?
> 

No idea, but I would not want to disable it just to find out with a flurry
of angry e-mails.

> Or maybe best to have a quirks table with dmi matching to disable the
> driver on known broken systems?
> 
>>
>>> it's set(maybe along with an override param). That way the wdat_wdt driver I
>>
>> I prefer the less invasive version of logging a message. The user can then
>> block the it87_wdt driver if it doesn't work.
> 
> Hmm, I build multiple watchdog drivers into the same kernel and somewhat
> rely on the autodetection working correctly as I support multiple boards
> with the same kernel build. It's not exactly trivial to conditionally prevent
> drivers from loading when built into the kernel AFAIU.
> 

Those drivers should never be built into the kernel; they should be built
as modules, and module load instructions in /etc/modprobe.d (or whatever the
distribution uses) should be used to determine which drivers to load. I really
would not want to rely on a bit such as the smi interrupt bit to determine
if the watchdog is used by ACPI.

This is actually a multi-level problem: Even if there is an ACPI watchdog,
that does not mean that ACPI uses the Super-IO chip for its watchdog implementation.
It might as well using the ICH watchdog on Intel systems or the TCO watchdog on
AMD systems. Similar, even if the SMI interrupt bit is not set, it is essentially
unknown if the it87_wdt driver actually works, because its reset pins might not
be connected. Or, of course, both watchdogs might work.

Assuming the wdat_wdt driver auto-loads on your system (I think it should),
can you write a little script which loads the it87_wdt driver only if the
wdat_wdt driver is not loaded ?

Actually, just building the wdat_wdt driver into the kernel and it87_wdt as
module (and loading it via modules.d) should work since the wdat_wdt driver
would then be instantiated first, and the first watchdog is all that systemd
cares about.

Thanks,
Guenter


