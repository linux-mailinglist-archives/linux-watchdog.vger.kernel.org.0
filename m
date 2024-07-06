Return-Path: <linux-watchdog+bounces-1320-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04676929523
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Jul 2024 21:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F760281E37
	for <lists+linux-watchdog@lfdr.de>; Sat,  6 Jul 2024 19:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445EB10953;
	Sat,  6 Jul 2024 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4sEp2W1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B09E57D
	for <linux-watchdog@vger.kernel.org>; Sat,  6 Jul 2024 19:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720295266; cv=none; b=hLl8G/aDLDeDVgKS5CWmUedq8JHkc+dC5xqtORtN18+onb5Ua7yxFk6Yp3a7xh+2BN5PjzZuF62qQNq8Y5Lq6zj15bnQHlrevLel9cMpXuMII06GFKwjbKXnW7tkkb/q/zeu2Vtw/AG9r/QEmi8im5YNknx99adoXvFgpR7PBGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720295266; c=relaxed/simple;
	bh=sYdFGyfdIgoCpz+UryMD3lSiwRwqezMtwSCj1U+H14s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmHRLv1uJivEjU49rnLxPmYyRYl4rU8adYoOSyEp9OYNtmBOvmUcXwI8gwEOXtkM+iyzmfXRcthSp8F6OrmrR1WMGEU3zC6h8RQFyS2K1a/mkmFpjDNjVXOvr/dp0xlknzXfftfORgpIJ92/k/RFjn5gxjyBaQTkDY5GPhWCudk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4sEp2W1; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-707040e3017so1766483a12.3
        for <linux-watchdog@vger.kernel.org>; Sat, 06 Jul 2024 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720295264; x=1720900064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B4LSxCx+n2qKmlUd/PG1JQ7zRYKAZwo7T474SIu/BXg=;
        b=D4sEp2W1b1NMRlSdBbDl9CrdH2/hEmVL+eFRn5CQHCK2flMIgB/Yq88PtFYcttoYYL
         RxZ74QmuFCPt4gvGJTmjI3mFZHjxLTb1hsQXjUr4+W2/JbBqUIc/rdSTToEV+YrYkgcj
         0W2M7aMLQFt8cGwOoQ2Jvq9i4rkfeSBd1W3V+Cfg61xgJ1X5P5d9h+R+oMLCPM0i+BaI
         Y45ySm5uu6V/1CO3kN5yN10xhjS+ghibK2CQJHnHfPCxlAyBG+TLbyhE0iVyA0qL4xdX
         ND7WDt3j4gzKYxOwINmGdJxIVUqNaGdLX/WWKRqeWEyb+yTt90NFfGPP7GPPvgjW54ZS
         MS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720295264; x=1720900064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4LSxCx+n2qKmlUd/PG1JQ7zRYKAZwo7T474SIu/BXg=;
        b=ATX8BfHfcaQgCECjIvA7b4B7clbF0fdlrI8j6ztMxDJTdAELSnQpjYbrU3xLEnHV/e
         WzOxyRx3uH2cs5LznA3BTKumqRLYcFhe3teV+zQ7QYp+RJrjYBca/MOkRgRgkiepJLeZ
         B43trNLMQsLHYz+6t51T/NmKsDyO52UoBoH7B45rnu65GyUqUA2hbXB6gbNPB89DI8EL
         nIrZI+UTw55JUyl2Y338HH9KqAhPHmyvwAATwdChg6/O7m7lOhDQasPc4OFOT2dy2qJb
         kQ3K8ON0MptyQbWpzbVtuyCTp9f9ObYvlxO/dbMagyVfR7WbCT4LY0InrKdb2v8o8s7i
         M2aw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2Pjqb9budtIaOhsZFs1hEvl4vf8UZFMDSvRNUElLvQ1mCWLnTy+yT4PbjTD3jz/2QYyGKXAertS+SX8dVCF6CepwMzaQEfwxvXEgQHM=
X-Gm-Message-State: AOJu0Yw3Q8iqmZIGEFp6R0rTsZPFNLs7J9Dzkmls3OoaLDnUSSryElOn
	kLF5iNJUVGjqAMEyWM3m11DqXdgvk2M2OoAG6soQgcNaNXtY8j6OWTGfXA==
X-Google-Smtp-Source: AGHT+IE/c6g6JiQkCz/5Zz8qJt8aJ6Fd9jquqHMlhiflkH30VSnMpf/IoWrCQ1XMu4hzjvDSxNeqfg==
X-Received: by 2002:a05:6a21:3a44:b0:1c0:e612:296d with SMTP id adf61e73a8af0-1c0e6122b58mr3146870637.54.1720295263480;
        Sat, 06 Jul 2024 12:47:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a992c43sm5433810a91.30.2024.07.06.12.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 12:47:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9770a65c-e08a-4f7c-9ffd-8899d8390e2e@roeck-us.net>
Date: Sat, 6 Jul 2024 12:47:41 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] watchdog: it87_wdt: Keep WDTCTRL bit 3 unmodified for
 IT8784/IT8786
To: James Hilliard <james.hilliard1@gmail.com>,
 Werner Fischer <devlists@wefi.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20231213094525.11849-1-devlists@wefi.net>
 <20231213094525.11849-4-devlists@wefi.net>
 <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4r58ETz-Yym+MMEcu0DDeW-xbXBRGHxfZAfyGqOj3prGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/6/24 12:06, James Hilliard wrote:
> On Wed, Dec 13, 2023 at 1:45 AM Werner Fischer <devlists@wefi.net> wrote:
>>
>> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT8786.
>> Some motherboards require this bit to be set to 1 (= PCICLK mode),
>> otherwise the watchdog functionality gets broken. The BIOS of those
>> motherboards sets WDTCTRL bit 3 already to 1.
>>
>> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, keep
>> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 keeps
>> the status as set by the BIOS of the motherboard.
> 
> I have a board(https://qotom.net/product/94.html) with an IT8786
> revision 4 which is recognized but doesn't seem to ever trigger. Did
> your IT8786 based boards show revision 4 like mine do?
> 
> [    1.607590] it87_wdt: Chip IT8786 revision 4 initialized.
> timeout=60 sec (nowayout=0 testmode=0)
> [    2.367608] systemd[1]: Using hardware watchdog 'IT87 WDT', version
> 1, device /dev/watchdog0
> 
> Docs I have from the vendor just show bit 3 as reserved:
> 
> https://qotom.us/download/SuperIO/IT8786_B_V0.2_industrial_111412.pdf
> 
> 8.10.8 Watch Dog Timer Control Register (Index=71h, Default=00h)
> 
> Bit      Description
> 7        WDT is reset upon a CIR interrupt.
> 6        WDT is reset upon a KBC(Mouse) interrupt.
> 5        WDT is reset upon a KBC(Keyboard) interrupt.
> 4        WDT Status will not be cleared by VCCOK or LRESET#, and only
> be cleared while write one to WDT Status
>           1: Enable
>           0: Disable
> 3-2      Reserved
> 1        Force Time-out
>           This bit is self-cleared.
> 0        WDT Status
>           1: WDT value is equal to 0.
>           0: WDT value is not is equal to 0.
> 
> Any idea why the docs I have would just show bit 3 as reserved?
> 
> Did you have any information from your vendor under what conditions
> bit 3 should be set?
> 

On ITE8784E bit 3 is "External CLK_IN Select".

>>
>> Watchdog tests have been successful with this patch with the following
>> systems:
>>    IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
>>    IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
>>    IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
>>
>> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net/
>>
>> Signed-off-by: Werner Fischer <devlists@wefi.net>
>> ---
>>   drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
>> index f6a344c002af..9297a5891912 100644
>> --- a/drivers/watchdog/it87_wdt.c
>> +++ b/drivers/watchdog/it87_wdt.c
>> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev = {
>>   static int __init it87_wdt_init(void)
>>   {
>>          u8  chip_rev;
>> +       u8 ctrl;
>>          int rc;
>>
>>          rc = superio_enter();
>> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
>>
>>          superio_select(GPIO);
>>          superio_outb(WDT_TOV1, WDTCFG);
>> -       superio_outb(0x00, WDTCTRL);
>> +
>> +       switch (chip_type) {
>> +       case IT8784_ID:
>> +       case IT8786_ID:
>> +               ctrl = superio_inb(WDTCTRL);
> 
> If I print this value out like this:
> pr_warn("WDTCTRL initial: %02x\n", ctrl);
> 
> I get 0x00:
> [    1.607480] it87_wdt: WDTCTRL initial: 00
> 
> Do you think it's required that the kernel set bit 3 for some boards for
> the watchdog to work correctly if not set by the BIOS?
> 
That is done for none of the boards. The code in question does not _clear_ the bit,
but it is never set.

> Or maybe it's required to configure additional registers?
> 
I would suspect that to be the case. You might want to check register 0x72.

Guenter


