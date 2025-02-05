Return-Path: <linux-watchdog+bounces-2832-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB54CA281D6
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 03:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6593A23CC
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 02:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A2E42077;
	Wed,  5 Feb 2025 02:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO4kQNyq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C3EAD0;
	Wed,  5 Feb 2025 02:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738722921; cv=none; b=PYCOdoprKMLAlCJq2rsrTXVt2QvGQguLwiL7pcxYurRl9D4FdadoCORNLjI1Ws1ZCT2vRKy1tlisWN14nMw07JRC93GR77E7ZqQieB3Ek3Cibx2HCCnue1Xsxximl1S8dYckKICYkyupw0PbaQO7EvqcvXpPA7KHYuae0Li1RFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738722921; c=relaxed/simple;
	bh=4ub5YpPW13HFxNVKAPveKTSbnIWC6uR8EuupaMpuOE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghyhHkW8NwAEXwSA8u5QQBVJAYUXlEDZXOdq0FwFTXRjfFT9Jua44QZNoUIF1J+4IJjO4zSAQkXhQBh/PZLU9j88ckDeUcPZb77D0Xea2eXOCmWxDkl6OQVZEw8mVsSY/vShkVBFyjhtv5uq2ws67+O29pTEHWbOnoBFUfiCrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TO4kQNyq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so8318531a91.2;
        Tue, 04 Feb 2025 18:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738722918; x=1739327718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bIxnjul27PkcVxSra4MQSzivSSjn2yM2jo9sG3ROLOo=;
        b=TO4kQNyqUQ/hTnfR0QC4Jb6CRCv3pklXWHhHvWkGqH21WOyyJJVFlX/UuksATIGOAL
         E9NTcTPjbM9J6xvMLCaert0CDI7/Bwf3DcyAOqDMV4Luzn6Btx3HL41JVbNoXEueK6ha
         7U+yxWI9d8BU7i6KAbj86ux0VInYpysRIzMusIEb6QdNSSOodCMiUzq0ZBwvt2EZxbFd
         GcPlIZlpr+5IcYbjp0b3FMtIVfPLjDEManwEmKIgjRs+o0puk6MNzoX8KtoYXNV3qfov
         1t21cAH5hPk+/1K8Zu9CdfekiN2WoQpkmFHjCvAbr5zAA+QFZaa1gqEdC0vJxb1EW+8S
         ifNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738722918; x=1739327718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIxnjul27PkcVxSra4MQSzivSSjn2yM2jo9sG3ROLOo=;
        b=h6zkK7I1H0W6msbif4Nf8/RycIwCzjkjlqcyKkcfVGZXfcs4UuvSrP5NoMoaegLBia
         ZocZpr46mDuLy1eF4ZpePQXCRH6TsFABBngwW5co+OrmDJ04SdSCMDQxqQQpCPbMIWoP
         B6QNnXh9Kb4rZL9lybZdtRZswDnfKOeQw0ozoBWgRvgeTcrAR4nz1UDeY41+k+KHVvIT
         VV8BC/Cuc5vBxVWKjFrVgisu0nVFNJZ/d///tIRpWxotnQhQS7WjKjACx4bceV3kJWXH
         PQHD2iKSHSNGQlHNIVUWYYArI+Rpk5F/bxONTSMRRc2juhlzBHledWy+tx0OZ5AM4yX0
         O2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4NR4NbNgGlJOAiPWYA1TZGrJGcoYzVlXAn3/d9zGKpKnlW6qJTNijT7iU5vIsP8+jhBlyNvcRDaD/ig8bTVs=@vger.kernel.org, AJvYcCXSrO/CWVxzqtqOpKghjjsOjwBS49wSm/oYsUTT3DGyo4ggK+IKa/U/OILtcrT1aYGIia5f41k0L6qjWKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX4pbtbFqO43c0FTd3C6OUinARb2tMMWGVdispMfmFGgyOWBJ1
	gsG6hfbs2plN1AUt54zTmUq2Vo9upBzB3Ko6ZxAzsuv0jyiCg4Qi
X-Gm-Gg: ASbGncu0Vggb+1z42Xlc0ltosyXaEz7wz473hZ62T6uedcmBHQfzAeUboreKJ/aSNRQ
	fztVp49HYdQ2mY5XXV1QjoukqXTCaNUpKPDrHcsWDgL+EdUAjXw7xE6elF11Xtu1piWBalAYOml
	cmIdxH4kQt+E9NUcrA0gcO7mJVv6lB5x4f4W6nAloEWva28uTn52RvqVjFymuxT105+xEwaoVbn
	N790l9VJyCC3Ms+0DwK6POcCj2+mBpqcipX1WjPrbYwBUoHqX5QH0DTaxB64PF9TkB5ui9QdvLO
	iiBgBLs6//4VA62JczvxdQ1c5WU3oEZJ/MoDe1gUl/Rju+jk8yJjpkSvZMT2qKsb
X-Google-Smtp-Source: AGHT+IGHp3oR5ZRb99FKQZ0eO3yLw3bLANDFdlJxRVnUshNHiO3tkoOg0NUIqa8Shy5QM2HSnJn5yQ==
X-Received: by 2002:a05:6a21:1394:b0:1e1:afa9:d38b with SMTP id adf61e73a8af0-1ede8810c19mr1792136637.8.1738722918392;
        Tue, 04 Feb 2025 18:35:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe64292b2sm11563456b3a.62.2025.02.04.18.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 18:35:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d184241d-beca-4246-ba5a-f7a9ffe2f140@roeck-us.net>
Date: Tue, 4 Feb 2025 18:35:15 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
To: "liuchao (CR)" <liuchao173@huawei.com>
Cc: caihe <caihe@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 lixiaokeng <lixiaokeng@huawei.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
References: <13073a1dfb7946af98565921c609bd6f@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <13073a1dfb7946af98565921c609bd6f@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 18:02, liuchao (CR) wrote:
> On 1/27/2025 22:30, Guenter Roeck wrote:
>> On 1/27/25 01:35, liuchao (CR) wrote:
>>> On 1/26/25 21:10, Guenter Roeck wrote:
>>>> On 1/26/25 00:38, Liu Chao wrote:
>>>>> Every time the user echoes 0 > /dev/watchdog0, meaningless critical
>>>>> log is printed.
>>>>>
>>>>
>>>> It is not meaningless, and it will still be displayed after this
>>>> change, making the change pointless.
>>>
>>> The change is not pointless. For example, the softdog driver does not
>>> invoke watchdog_stop or print logs in the watchdog_release.
>>>
>>
>> It seems to me that is a problem in the softdog driver.
>>
>> The change is actually worse than I initially thought.
>> The message is _supposed_ to be displayed if watchdog_stop() is not called while
>> the watchdog is running (i.e., if err == -EBUSY).
>> Otherwise it would not be displayed for real hardware watchdogs which are not
>> stopped because they were running and watchdog_stop() is not called because
>> WDIOF_MAGICCLOSE is set in the driver and the magic release byte was not
>> written.
>>
>> Specifically, the softdog driver has WDIOF_MAGICCLOSE set. It is not supposed
>> to be unloadable (or unloaded) while the watchdog is running.
> 
> When echo to /dev/watchdog0, The watchdog_open, watchdog_write, and
> watchdog_release functions are invoked in sequence. Do you mean the softdog
> driver should not call watchdog_release?
> 
> After the user opens /dev/watchdog0, the user feeds the watchdog through ioctl
> WDIOC_KEEPALIVE and never closes. Is this the correct usage?
> 

I tried softdog. It works as advertised. Yes, "echo 0 > watchdog0" triggers the message.
"sudo modprobe -r softdog" then fails with

	modprobe: FATAL: Module softdog is in use.

and, as expected, one minute later (or whatever the timeout is set to) the system reboots.

There is nothing wrong with the message. The softdog _does_ refuse to be unloaded
while running, and it _does_ reboot the system after the timeout expired. This is all
perfectly as expected. The log is not meaningless. Instead, it tells the user that
the system will reboot after the watchdog expired. Which it does.

Guenter


