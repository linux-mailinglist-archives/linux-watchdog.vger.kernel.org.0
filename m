Return-Path: <linux-watchdog+bounces-3532-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A28ABCC23
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 03:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F021B642A9
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 01:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E2A1BE871;
	Tue, 20 May 2025 01:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ1igA7g"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517642550AF;
	Tue, 20 May 2025 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703598; cv=none; b=kYFeG8RMFFwlBqIYGThoqT6pkCmluGH6+HzAMEkgGcmmRRLDtM3jK9y3rE85yfRPcQj7H4I1DfRVISAeWrfGQHu+uyzPKbEj67/LiBH27rekoO5Mr1v7eGUXQkMYT/BCKrhoVkhhf5gpTJtk3Tx7iR2b9Vis/t7EHT/xRnuqYRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703598; c=relaxed/simple;
	bh=gvSBSnZ+4LebMpoKH56smJT1hpCFnk5ubrigS/Ar60c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjpt3Mp6nnFqUzPlXXWpxvhgTWsMfZ9ftZoVtx7EG2rKpEgpnoZRk+i4HNDqJ3ftx8fJTZ9e0xYlmlt/h2zTKzMd25r4XJ+vTQBczvJQYPuHWoT8FP7gdW8heH5WUWOupuEdzxQyPijVaF++n9bGXFE7a9K+VfCMpwUq0Nu2Z5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZ1igA7g; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231f6af929eso35032865ad.2;
        Mon, 19 May 2025 18:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747703594; x=1748308394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l+bh9yDJlVVImj9+6PkfxMDDt8Anc9GhnNIfLGfFu/k=;
        b=BZ1igA7gyKLtq+nxYWBw1et51Xh0aA5yeDqOvTkKf0JNADo8Q7vmg50+3q/KDg0JP9
         5zo3u+qJ0JquV6cJf4HJn8FVWOQCzn6CzTNUSoH8XiHCrWhYKLuqMgI+/U7jDrKOFiBq
         CqkRLdR87t2ru+FVGOp33fAA+PfXTMBpFT+uEpxiX5kWeSwvHVBQjh2xS3kZIu+oX9SC
         s4o86igGgT30Qk//58gRv70Ij4pbcPspWKjAFEHWMqLhySOmfFmP6L6nASExEO1Pk06i
         kt2DRVjX3NQzkaq7By42MoJ6VHO9Eve50B3Q5apS5p6ijphr+P0WG13MeWhDOCYK2ZgU
         xV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747703594; x=1748308394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+bh9yDJlVVImj9+6PkfxMDDt8Anc9GhnNIfLGfFu/k=;
        b=Sn75VRmrkaSuCNFFWcHtmluxrsUyLnMG1pX4nTM45yGcrBTPPKbR5nKVSIfGG1Z5Zg
         T2L4RUEEc+ELbxB9us8eQpFJ0iCfyWvbUiD5locXa9h2IiXJsuh++IYkDYHVB0shpIAK
         wAra4zHQQwQFk/qH5qnOvMILN4GhWqRRpwUJnhsapqMpnx0yakmJo76YpItvQQoh7yKS
         +tRF0mkzKoSdt7rjDXmo0TqqTYI2Er5NvVkzFCuTQqv340yrNZ53t0zVnbKMgeOsF47/
         jm8kc82coneGjIsw551FrBki/nfe1GyZCfEXpD2T91ujqhOgY5jyE7DJvjnlo+n74NZY
         Qf4A==
X-Forwarded-Encrypted: i=1; AJvYcCUPBSBlBRIrQ72YNZKViFd7YPZE2xPOFxc8TprSSA1QAgAVn9i/w+UY2VQ3DgxJQPWAkIFmLbSmpicjPw0=@vger.kernel.org, AJvYcCXbEHX9DkdyN2yifHfdWooRFDbm9x77BUu1tL+Sv7yRaPaU405aWklpQr3yFVwsbPIrZO3RJYrYSQWGTafsyh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfuI18rdvODEkl4N+ncQUhwMB+0oj5Q/17Febh88KCaZnhy4x
	4LHUpO+FkBKStqchRML8oN7xBMJdLPqSSXKeJV54vSxxjGV0iXW7f6+vYhodTpN9
X-Gm-Gg: ASbGncvc/Sb+jnPmSCls7lVC1I0qb0/1A6gyx0GOxqfEJPFB5qjDA+MrjvkEuvYixSB
	cao/c43f65ENtAdzrtqOR+vJjxPQzPiN9gMoKeXxDljVmw04v6AgFKWiNGG9t4X+IlPYjL9fm8f
	PPyOPP9Ccvs5hGAErwqM3628UhL6WDe/hSkND8Ri3kiu5W0juGKodhQ9xHIGJr3stM01AXxzN9+
	TulnIivvQ5XCtCXoXQgbjxJSl1JGBep/fk4Om9SzOiABfRSsTPxpZasNlFKcn+BsGcYqrG9IM+M
	aVTQz8ZZvTwT1cmYpmZz2L1Z9tdPgzq9UzVzRSE5Fqs8nuAdWz+vvCoUPnTPzjJ10D6taxBmb2W
	jhdTPuT0fUiq4zlR2EVM3M+0MkmngOTR6gkg=
X-Google-Smtp-Source: AGHT+IFhYagJYSr486ndbkbSDxTnhJeL2TXjMGcxVjfwTQJzwvLcCbi4D3PmDnre+Q1oJmDILXXLVg==
X-Received: by 2002:a17:902:ea01:b0:231:97ab:9544 with SMTP id d9443c01a7336-231d452d4f0mr233183945ad.41.1747703594376;
        Mon, 19 May 2025 18:13:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adba6dsm66227095ad.68.2025.05.19.18.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 18:13:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
Date: Mon, 19 May 2025 18:13:12 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: arm_smc_wdt: get wdt status through
 SMCWD_GET_TIMELEFT
To: Julius Werner <jwerner@chromium.org>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Evan Benn <evanbenn@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
 <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/19/25 17:12, Julius Werner wrote:
> I don't really know about the issue Guenter mentioned, but otherwise,
> from the driver's side this looks good to me.
> 

It should just be
	set_bit(WDOG_HW_RUNNING, &wdd->status);

There should be no dependency on CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.

Guenter
	
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> 
> On Mon, May 19, 2025 at 10:58 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/19/25 10:00, Antonio Borneo wrote:
>>> The optional SMCWD_GET_TIMELEFT command can be used to detect if
>>> the watchdog has already been started.
>>> See the implementation in OP-TEE secure OS [1].
>>>
>>> If CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set, at probe time check
>>> if the watchdog is already started and then set WDOG_HW_RUNNING in
>>> the watchdog status. This will cause the watchdog framework to
>>> ping the watchdog until a userspace watchdog daemon takes over the
>>> control.
>>>
>>> Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
>>>
>>> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
>>> ---
>>>    drivers/watchdog/arm_smc_wdt.c | 18 +++++++++++++++---
>>>    1 file changed, 15 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
>>> index 8f3d0c3a005fb..f1268f43327ea 100644
>>> --- a/drivers/watchdog/arm_smc_wdt.c
>>> +++ b/drivers/watchdog/arm_smc_wdt.c
>>> @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
>>>                return -ENODEV;
>>>        if (res->a0 == PSCI_RET_INVALID_PARAMS)
>>>                return -EINVAL;
>>> +     if (res->a0 == PSCI_RET_DISABLED)
>>> +             return -ENODATA;
>>>        if (res->a0 != PSCI_RET_SUCCESS)
>>>                return -EIO;
>>>        return 0;
>>> @@ -131,10 +133,20 @@ static int smcwd_probe(struct platform_device *pdev)
>>>
>>>        wdd->info = &smcwd_info;
>>>        /* get_timeleft is optional */
>>> -     if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
>>> -             wdd->ops = &smcwd_ops;
>>> -     else
>>> +     err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
>>> +     switch (err) {
>>> +     case 0:
>>> +             if (IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED))
>>> +                     set_bit(WDOG_HW_RUNNING, &wdd->status);
>>
>> This is the wrong use of this configuration option. It is only needed
>> in a driver if the watchdog status can not be read from hardware.
>> That is not the case here. Worse, using it in a driver like this
>> overrides the watchdog core module parameter "handle_boot_enabled".
>>
>> Guenter
>>
>>> +             fallthrough;
>>> +     case -ENODATA:
>>>                wdd->ops = &smcwd_timeleft_ops;
>>> +             break;
>>> +     default:
>>> +             wdd->ops = &smcwd_ops;
>>> +             break;
>>> +     }
>>> +
>>>        wdd->timeout = res.a2;
>>>        wdd->max_timeout = res.a2;
>>>        wdd->min_timeout = res.a1;
>>>
>>> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
>>


