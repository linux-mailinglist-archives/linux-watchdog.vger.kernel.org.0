Return-Path: <linux-watchdog+bounces-2834-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB62CA2835E
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 05:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91CC718821D2
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 04:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9A02153C7;
	Wed,  5 Feb 2025 04:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZazAtBpk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E353215181;
	Wed,  5 Feb 2025 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729729; cv=none; b=BO2d+CzxdTtFa/hlz2f40rPPqBkbQi4Sro/K28eKp3J287+c6WQK+g8P91Q/+FT5L18m81LQxI3d0n6iL2e4MViCTShpWjh8U6wqsAfKQFXqGdxvPrZMMf5JqdsEQir6uVOJgNO7wPtFo7heqW4DrcKU6m0RXdiAu5XQUSq4h2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729729; c=relaxed/simple;
	bh=mswzsv2TzCC5uR2Xuj/vBCzDqGZTy2Zn2xxyfHYH3Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKGksJBSZaNSNP3EJ6cttx5LYGJPYf6d1U4Kl1qv2z6kZuQ6N2L6yazNxtwaNc4udYBwPHzbbKm08pTFe/p26VwChQfM4xvBrsdupve936UzUqZ9S7pm7rdOqYL1qxTZDzLIVjrBK2YJciFy8EwjqvKZxuo4xBDXAgNJgooTQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZazAtBpk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso106532825ad.3;
        Tue, 04 Feb 2025 20:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738729726; x=1739334526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iAA17giIiOWp68Rtp2xvIBloP4S+AWc1tT4t6Tdk3ok=;
        b=ZazAtBpkohJkTRDddSspNQ5gWwIwNXMWWHZSi0qSGTZUP4ngiPjIujwx7jruWD/Juz
         M7TIIyhq1OoChekTUK+RK/mfRQlhLAVUobqlVr8Bgg8N8CqU/PMObSEaWv/Ca7OCuznv
         L7reIloIFzodtdurocxRfrildGUZ+h17TfSbKxY0YPgYs5+u+Hfh+gX6Kj6r31TVz/zO
         M2TQ/ocF9bF28XSdDtsSfKlBvRosvrwSvOguVdsBcpION7OzMVV2uxB+Pj0u6knCQNOa
         eBPE9GGbQlaNlrtbS/nHQ5wY2GyINBa2RCOpk+PPMstcoFi5I7j9eSMnB7Qnomsuqcvh
         c20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738729726; x=1739334526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAA17giIiOWp68Rtp2xvIBloP4S+AWc1tT4t6Tdk3ok=;
        b=LiLB+pe0cbSC21BIY/z1Z5nQvBqT1OoVcbsNBh4k8VvLJ0rxBKVOlGR0J5HAajMH2C
         oNHUGU1SHiroWuM+5F0VOCKuyfeKaDjUDFJkATdA/XMnlcgylwwCGEOhcAUHBGLrqfT0
         1qZ5pLv7Dajf1GdmfVIovMd6iV5q+RUOG6u2Zun7ttOOwTmonrm5lwoH4Xf0vUd78CbE
         VwIhq/Ys0sKBcAQe4GmZ9hGEoBjXNTf0NXTnCLVC4tMJKM3w0XRjntEsDvdhpfjmtEyF
         CqfvxVuljXspLv6AYPUZM/a1rZHklvZqCPbvlpOZWKnuYhuYajFt2n+82wKk7HkRF7Uj
         ZeCA==
X-Forwarded-Encrypted: i=1; AJvYcCUiHmEQrBRTneTLFjH2c5tguiBJbYqzuYj/HuXDogZ9CLsXt45S7Xq3ZQDL11n56G8ugKR/W6FB3+ZM7Gfoo/s=@vger.kernel.org, AJvYcCWGEZg6a25Wgb5G7FKBQ8FrnuNORqg1Z1VxYzseM7m2pu2qepI7ILUsGnLjzq01K3Z/cesKANhYABSVV2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLLfGyYhBy6GtQu4iOAjmOTrEIVqf3QC7kq6q4qWrgOjqwcFcL
	EB8O60qvR5WKm4VOznn8mLjVxLIewRV+ZAo5c94DnTuhb6dcWYEzedt0Og==
X-Gm-Gg: ASbGncv4ec1mgV/apycDwC6I5H7MbqRuAFJwZT7begKgv2zNenb3/0UOyoVDvW5dKrx
	qXIj6KWDVEd+4M4/X+mZ+htmyAcFkKd4bA8lo9WER5HUc2dcAJl+pD8yzTl0hGWILXWbHXaQjfU
	QlqcHZKG0BJnA+8jPp+lL9XojtYbcd9+QQ130C7d23y33KzOslUvjsRjhY7x22uMJakfP6dOx/x
	XdqqbXKdkXw2VbaOX0wG3RCNGsdlS72bXu6i00FSZJGByc4dpxP9iPc+KxgZjXJTy3zNb3/Lh8k
	OfOkXjhZ/bprxmbzdnb/ZzVgD+RbJNiyI7+YL7udF/EuR2XguxlaFOuQjiG6uK1S
X-Google-Smtp-Source: AGHT+IFdaOVM6nbQK4g0lP2GnCY3wEjp0vO6CGTujIXGePpCJQHVag1F11Ah/J4IgXx/cztrV1Nrzg==
X-Received: by 2002:a17:903:2301:b0:216:2dc5:233c with SMTP id d9443c01a7336-21f17ecbd2bmr25454185ad.41.1738729726259;
        Tue, 04 Feb 2025 20:28:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33007e6sm105203335ad.173.2025.02.04.20.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 20:28:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e9b135a6-f398-4acb-b3ab-01732e94645c@roeck-us.net>
Date: Tue, 4 Feb 2025 20:28:44 -0800
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
References: <a59651b1a53c4362b0416a3252d9c750@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a59651b1a53c4362b0416a3252d9c750@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 19:14, liuchao (CR) wrote:
> On 2/3/2025 18:35, Guenter Roeck wrote:
>> On 2/4/25 18:02, liuchao (CR) wrote:
>>> On 1/27/2025 22:30, Guenter Roeck wrote:
>>>> On 1/27/25 01:35, liuchao (CR) wrote:
>>>>> On 1/26/25 21:10, Guenter Roeck wrote:
>>>>>> On 1/26/25 00:38, Liu Chao wrote:
>>>>>>> Every time the user echoes 0 > /dev/watchdog0, meaningless
>>>>>>> critical log is printed.
>>>>>>>
>>>>>>
>>>>>> It is not meaningless, and it will still be displayed after this
>>>>>> change, making the change pointless.
>>>>>
>>>>> The change is not pointless. For example, the softdog driver does
>>>>> not invoke watchdog_stop or print logs in the watchdog_release.
>>>>>
>>>>
>>>> It seems to me that is a problem in the softdog driver.
>>>>
>>>> The change is actually worse than I initially thought.
>>>> The message is _supposed_ to be displayed if watchdog_stop() is not
>>>> called while the watchdog is running (i.e., if err == -EBUSY).
>>>> Otherwise it would not be displayed for real hardware watchdogs which
>>>> are not stopped because they were running and watchdog_stop() is not
>>>> called because WDIOF_MAGICCLOSE is set in the driver and the magic
>>>> release byte was not written.
>>>>
>>>> Specifically, the softdog driver has WDIOF_MAGICCLOSE set. It is not
>>>> supposed to be unloadable (or unloaded) while the watchdog is running.
>>>
>>> When echo to /dev/watchdog0, The watchdog_open, watchdog_write, and
>>> watchdog_release functions are invoked in sequence. Do you mean the
>>> softdog driver should not call watchdog_release?
>>>
>>> After the user opens /dev/watchdog0, the user feeds the watchdog
>>> through ioctl WDIOC_KEEPALIVE and never closes. Is this the correct usage?
>>>
>>
>> I tried softdog. It works as advertised. Yes, "echo 0 > watchdog0" triggers the
>> message.
>> "sudo modprobe -r softdog" then fails with
>>
>> 	modprobe: FATAL: Module softdog is in use.
>>
>> and, as expected, one minute later (or whatever the timeout is set to) the
>> system reboots.
>>
>> There is nothing wrong with the message. The softdog _does_ refuse to be
>> unloaded while running, and it _does_ reboot the system after the timeout
>> expired. This is all perfectly as expected. The log is not meaningless. Instead, it
>> tells the user that the system will reboot after the watchdog expired. Which it
>> does.
> 
> User creates a process and echoes every time to ensure that the system is
> normal, the process can be executed properly. Otherwise, the system reboots.
> So the critical message keeps printing.
> 
> Is it reasonable to change it to info level?
> 

No. The user needs to echo the magic character instead of "0".

Guenter


