Return-Path: <linux-watchdog+bounces-4592-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E5C5EB34
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 18:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C962C4E2C93
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 17:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C42A262FD3;
	Fri, 14 Nov 2025 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFj1XGsI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188D33446CF
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142730; cv=none; b=DpR7P2L3Q59ZERN3HAVR/+MpTyUuVSivYc6IcwrSt3RCj+Kmj6s9LeNfaKPwBcr7XYI8PxgCkastxBzm33ofwAp0qQiFPbqX0L7ftArqYQY7fRL/n9wAei/Gfd3eCZz5vCcvJiDHK6lXBickzMuJfER2OlfHXd9JosielXyKD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142730; c=relaxed/simple;
	bh=Ua7/wBUW3PehFd16Ncwb3E1GV9Jjh7uoeyXx46lPhBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLZ3SZPHA70Gngv3M+iUP8xsOiQi3EdurRI0KQoJk06yklGQKQd9e/J//vTmMK82MFTmDZFkIKpjMaK6kCsX20MhUqp3FZyuE6sKwsX3LnFjqdWbBjG3MW3JTfr19odBYIxtBT2mLAF2SS5RNZBXRSlQCP3ZPMxJ3y7l8Bpv4i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFj1XGsI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so2002831b3a.0
        for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763142676; x=1763747476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sZZwHkgHQCn69Et1ghK6N4Cb53fs8q5ScPAZJ+uyglI=;
        b=jFj1XGsIfqoVVYCzo+y3RxwqZ5ALfCGvDh38wBNWSWIaStB0TWTQrEhrwK24AZjIBs
         NKkzMwEsQuOR8w0tLFE+mFviSR80ZDP/JLnA/hUpUS3HWSOsUJ/yJruKWgfAAF49Ifvh
         e4NzwsEVTJoQFUjVYAksC9iy2yvsWFCXfcYqKhIKIoAM6OUmHA9QgiNRaHhNj61OVtf0
         weyEb7FBAg47KXp9d4XOQ2ob5ERluhO9+VwR091Pk3h62ueAa766h4iOrJWYho3mfZO/
         yjsKqUvWHIJ1Jvry8pmchyaNqFa8PjPAXpATFdgN8ZYkzyMz+Dq6WsYJCYNj9JGafxBc
         bhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763142676; x=1763747476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZZwHkgHQCn69Et1ghK6N4Cb53fs8q5ScPAZJ+uyglI=;
        b=VKhPGEsB6B5AhD5MapVR0fHhq1gaD1UEjm9bZ92EPzwMU4xCU7BNYW2qrWvLZ0dgTF
         u3T1QAeycbfkWlhoyagtJu/QRDAxWeNUhhX/iPJajjHEW9p+LNq/yUpY+/+2xQPo6g4c
         R0nLi2UzAzilc5Q7K2JHEua2gNyhTi6GL9RZSniLx47BumYT9SnSS0u8quo/NUYs/j2O
         RyC71ARoCPJVKX67yEsLRRPT7VvZeh9IcL+xayPuFYZKa5oAJ0xx+9NLanO0XwkMSACy
         25jAIVy5gCh+RfKJTRv99cRRRQ5bx39+ODag6x7wLRAIxAAecUXDaWOyZ84H+gOjE+Gz
         foUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlPnKXPO9hsLb6XlgQZqCkdJAO6oIApQADFEwtvC5nxxvkVVwmgVrhhc7d9QaChMMLNk9lrnmF/QI6tLLDhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoAWjly5rkyFkqp0Dz7poHQJ4clGyOXdS+CTHqwtqiHHTdIBi
	4i/MPsqbOgfuVLQZ184XsbllCZKCowEdyLcmoV/S8ty6uc9hhgM80IohanhFIw==
X-Gm-Gg: ASbGnct5YeqpL2+t3SFCm/Q/qVixrLR4g51DQiWfGP8cEjOqMPyAXu3oTsbWDgL093m
	Z990Xn2yQei7rVAOhMj+0wWTpdtAPF4H4ZFf14gXx/dm8Nl1YxL83wpu2F39fzDH67Uuo8l1fP7
	gKv44ATCuFts6gpdN0ad9vVutz1IuTdaRLalJF8CtUkt2gIckY8jKWPtPdhvGwokTh44hgQ7v6b
	Xg/rCV5f6Sf0KR7nCd9fufwVPyDr8LLV4wxPqqokGIrFsrobkEUJeh8qwgfIgNanwmWlKDNy4Mj
	fuX+gCCvv05HI/170fHY75u6hjEwnY5KjxfqYdIVSuUN0wz5YWGUjsbiMxIYXNvgiwdBnK7AiqG
	5xqBd0uAZhUpdq6yBhifGMuTRN+HN4lWmDcgC+1ZpoSoGsQ3IISesHu5ORC15QmUFzhpPd93y+L
	FMWA5+peAZECd1JBLatSiUmC7SfWhupvGAFEDbhMDzI3yjA13j
X-Google-Smtp-Source: AGHT+IHqsm6cPQljXWoRyEeZ3T8J070N1CYtGlh7RMJ/umZAQ7stfpodbgGcSAG9bzjASrzptNLH9Q==
X-Received: by 2002:a05:6a00:2d8d:b0:7b7:a62:550c with SMTP id d2e1a72fcca58-7ba39b60acfmr4421756b3a.1.1763142676099;
        Fri, 14 Nov 2025 09:51:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm5795667b3a.33.2025.11.14.09.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 09:51:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b170cf54-e366-4368-a8a8-655938ac8d53@roeck-us.net>
Date: Fri, 14 Nov 2025 09:51:14 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init it87_wdt to prevert early reboot
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20251114.163911.1677511234058361014.rene@exactco.de>
 <0d406a59-ea24-43a0-bf2d-5f53ef8450a3@roeck-us.net>
 <FC92E78A-64C6-4FA0-9E45-AE66B40A7155@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <FC92E78A-64C6-4FA0-9E45-AE66B40A7155@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/25 09:30, René Rebe wrote:
> Hi,
> 
>> On 14. Nov 2025, at 18:25, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 11/14/25 07:39, René Rebe wrote:
>>> Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
>>> wdt enabled by the firmware and a broken BIOS option that does not
>>> allow to change the defautl time or turn it off. This makes installing
>>> Linux difficult and annoying instantly rebooting early in an
>>> installer; unless one loads and starts a watchdogd in the installer
>>> environment.
>>> Change it87_wdt to initialize the hw wdt register to 0 to make sure it
>>> is disabled until it is actually requested to be used.
>>
>> Wrong solution. The driver should set .max_hw_heartbeat_ms and, if the
>> watchdog is running, mark it as running by setting WDOG_HW_RUNNING.
> 
> Just to clarify, your proposal is supposed to solves the BIOS already enabling
> the hw watchdog during boot and just initializing the linux it87_wdt with your
> proposal would trigger setting it to 0 to disable it?
> 

No, it would tell the watchdog core to ping the watchdog until watchdogd takes over.

Disabling a watchdog which was enabled by the BIOS or ROMMON is a bad idea.
After all, it was [presumably] enabled on purpose, to ensure that there is
always watchdog coverage even when booting the operating system.

I am quite sure that the original NAS software enables the watchdog for exactly
this reason, and that its boot process ensures that the watchdog daemon starts
early enough to prevent the watchdog from firing. That is not "broken" but
(presumably) working as intended.

Guenter

> 	René
> 
>> Guenter
>>
>>> Signed-off-by: René Rebe <rene@exactco.de>
>>> --- a/drivers/watchdog/it87_wdt.c 2025-11-06 16:36:17.474866809 +0100
>>> +++ b/drivers/watchdog/it87_wdt.c 2025-11-06 16:43:56.756190409 +0100
>>> @@ -374,6 +374,9 @@
>>>    }
>>>    }
>>>   + /* disable, might be left active by the fw, e.g. Ugreen dxp4800+ */
>>> + _wdt_update_timeout(0);
>>> +
>>>    superio_exit();
>>>      if (timeout < 1 || timeout > max_units * 60) {
>>>   
>>
> 


