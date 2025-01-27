Return-Path: <linux-watchdog+bounces-2797-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC0A1D864
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 15:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 884F71884422
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 14:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACEF8EED7;
	Mon, 27 Jan 2025 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEOhpcLo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061B5227;
	Mon, 27 Jan 2025 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988191; cv=none; b=V1qjw51iMC/RSFwFjehnFAWsllhlJQhsfGNyIvJyMgGneKk5+j6jdnrAn4Z1V/mlI1wPfRDTUlEWH5c25Ir1Dkw5nCNob32yC5P/BlPj4Aeyp0+sZOu1dUxdIfgQZBR0sW4/K5ZvTRbEwdSgpdE8ulJRoyROH0XAp+rT2Ku65A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988191; c=relaxed/simple;
	bh=+7GJZNoxlC1ZOVqU/UhD1sZGnIHeZ6WShDsNVjEnP/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KA5M0fMoVVEZ119Az6Ae+b2pPY4RqHIPEQfPnw8iYAIxbH4HQ7dhyoBonQAQ5yjABYQ9J/Vvbwr+TDFAZumM3JpOlE5k6jhXjLMDqyxjgYa56aBspa2Rrr4wj84hDwGKUy2OXCcwqTdIkMASMgqfuR00uYebLSByNgQCVtw3aNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEOhpcLo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so5893342a91.2;
        Mon, 27 Jan 2025 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737988189; x=1738592989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+/olJd5Kpgcm0kP2d+w5kRfjK3bRhWr2UudNKh6q2o=;
        b=gEOhpcLolQU6SxFjUpuo3st3ejT1soA3x1BsIUdkQeK3CfKJ0Ocp+OcKZlP4kcSUBK
         XP5vkNci1mMa1NxUJ5fD7Fw8jY7+sY7d4a0RCFV8di88cBF1HEL5Q3chwHi6YH/KTLlD
         dSfBDFLOT9FOpH9goD6+1UPAKVxhE85GmPcPPcFGkI3WdVLjdLtN32UO7JdoHVT6x1Kv
         XMGf1EhxH607ZWlkGbJ6DW8t3SGmQAOD4E0LdlHauyroBEdo77iGqiS0gSvpXzk7PJRB
         yDtBFvpYxwJvI/gucqo5nPhOOct5iOnjdqzUhcRk7cUnGZadpblxzEl5CULXAPcrO1uw
         oh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988189; x=1738592989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+/olJd5Kpgcm0kP2d+w5kRfjK3bRhWr2UudNKh6q2o=;
        b=Oo6dhk/sbXwVq9oz2FmGrIWhL2qW/vCn0T56mDsf7rUyY2Ud3tQOHC7rnY/Leze93P
         KJxGrH9k2ImyWynJDMMxzkSk2jdqq+MOc+zVhSaXfwb6j64w6LGtAifxSkhZkPXrrc0+
         +mj34mCjXb7OfYSokHR6Hwbr5GRj4vNQEgPIV1tZPV07LO+zXfQVkH/xJU3hZVPEFyTr
         cNIjyNeHjlu7esxLSeQCDhJCTwcXpbpiqjF+Dly/hjM8Memym9cN7ofTWH9a71wJ77Xa
         9NAWzh5tNjZB1U8uX0cgFJJ6S5ndEhmhM8LCEPdLEGogRpBbG4lmZ/VII9Ob5NO5fH4N
         /tIw==
X-Forwarded-Encrypted: i=1; AJvYcCVbiRYGFXF0qXG8eMCVBHRs5F49ppLa0Ld9ggQkGYcwLCYcMyplos8NE7L72a+IQYTegRO9/RHvnboOR/8=@vger.kernel.org, AJvYcCWV4fGGg7Jw4Eg23QlNYttBkhIwSHme114PaSpymNS7uS9vruCU0lQO4HosB74D2Ouywe7AOOpTol+o77B68Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ++XOLupKdDwnYtxeTjCK79d2oxxRTJJ+JjSB1u9pyt/4lc+x
	IkB+BsBQ7vWGOFmUZoWbj0RpxLNAJr9Hz+t2qe4diZYYyLY6Uv1Z+vgokA==
X-Gm-Gg: ASbGncvGT8AigyET94GvPhvLA70Sh4f/oFj1U3KSEeNrk4GANWISW4bteK69DlRlT+8
	ZbAzmUBm2lGUdk+v8VWcvTeXEIbBm9/0V6oX38kyn8LjkjUsy/ODJQsDz2yIEhqNYNBQMMjH8kb
	/xUF/9AeYrB86mkmxtPEMTJmKFVyFCmSh0Ge169DwTuXfRDigLnrumMmGAZliLJczIwzz+xspPT
	tO3bc/AqY7WcbzBEQb8JQvZexyBXaInqQyvXL5rM/mf64NXxrHEH6eCwaLMIQMCeM1crMe7qXBT
	D+SmaW5hYl+YNV8OnJHjOXi/nKS040vtQSwCwZXn05uFmOOLIUzY2g==
X-Google-Smtp-Source: AGHT+IEWXi7UGyQosL4rXllvYzJdhzIjt0ylxKMQpfNKvBgk4m8a/iFYHpg8ZP3Yr3VrpWktm0J55A==
X-Received: by 2002:a17:90b:4a41:b0:2ee:b2fe:eeee with SMTP id 98e67ed59e1d1-2f782c9b417mr61044904a91.15.1737988189072;
        Mon, 27 Jan 2025 06:29:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa76fa8sm7319756a91.36.2025.01.27.06.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:29:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b84d6b59-1829-4d93-8720-75d1b24ce7d1@roeck-us.net>
Date: Mon, 27 Jan 2025 06:29:46 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
To: "liuchao (CR)" <liuchao173@huawei.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: caihe <caihe@huawei.com>, lixiaokeng <lixiaokeng@huawei.com>
References: <09237774d7a64521888fdd47f4ac5d8e@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <09237774d7a64521888fdd47f4ac5d8e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/25 01:35, liuchao (CR) wrote:
> On 1/26/25 21:10, Guenter Roeck wrote:
>> On 1/26/25 00:38, Liu Chao wrote:
>>> Every time the user echoes 0 > /dev/watchdog0, meaningless critical
>>> log is printed.
>>>
>>
>> It is not meaningless, and it will still be displayed after this change, making the
>> change pointless.
> 
> The change is not pointless. For example, the softdog driver does not invoke
> watchdog_stop or print logs in the watchdog_release.
> 

It seems to me that is a problem in the softdog driver.

The change is actually worse than I initially thought.
The message is _supposed_ to be displayed if watchdog_stop()
is not called while the watchdog is running (i.e., if err == -EBUSY).
Otherwise it would not be displayed for real hardware watchdogs
which are not stopped because they were running and watchdog_stop()
is not called because WDIOF_MAGICCLOSE is set in the driver and the
magic release byte was not written.

Specifically, the softdog driver has WDIOF_MAGICCLOSE set. It is not
supposed to be unloadable (or unloaded) while the watchdog is running.

Guenter


