Return-Path: <linux-watchdog+bounces-1354-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A444A92EF7E
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 21:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315621F21C75
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 19:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930C616B75D;
	Thu, 11 Jul 2024 19:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5DKeBAi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5B1EA85
	for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720725455; cv=none; b=bP4oYSK2yY24+6ufi8m+deb9w38MY10mROJ2zyUSUAtLKjxo48G0B1Qxhw4HZhRT8t2BJIyLoSYt5UbGw5bliLzl8D10T6TdEhG7Sp0EdTxOrmFU3TPhKUU4ncmVZyk/LzLeUv8ppm9Im1Elvvzrji7gLD9jws/8ebW6KKqDoXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720725455; c=relaxed/simple;
	bh=K9R0k2w/8jjtOaTckvpEKrqcfturQYKU63YMVsKaSIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fimlSh6JqN9CageqEgerU9hy70mje4EGGnpKIS/Ue1tujagFFWPV6xFu8YnlQLNOTqmY52knlFz/gmdpnSTCOAAAh/gAXn+i4/bLkNzCOsmNhmLGCQDJJ2Gapl6831eI+bNwixLnAjM/xO9Urxnfq3eq4PbIUad2Ix9sliVIwKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5DKeBAi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b07bdbfbcso1818468b3a.0
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jul 2024 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720725453; x=1721330253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj/ERQd2PMN4UyxPuF5KQJzlTVD+FysHfHvTqGvOZ4w=;
        b=E5DKeBAi0sMTy+cvaUMxr9Gi/FnaxUNU+wy6oS6Mqb/4FbWzDK8aFSAL2lXEkRTcBS
         KGEDbNFy+BJXRCaDNavh55DOGRd71getZ0PSxX5OpChNQTEuFuduXiY/v5pX1I0PDTru
         2oP3vsX5C0OPKidEJhieGUTrWDXG48bf7Fy+rMJqDdOhfiYnR6dwExp60PIyAzE+GAVF
         AGReEi/cxJQrv6u6uLvKnQ/OBVJYdKje/giH0yzbollKtKt2zdRvCX/fu6pXpHsjSlQO
         uoxGk7aQx0RmjHXA5MNQqwESk8ulCnlM7B+BLq6NkQyWPAMVKvyJrXKw+4GG3EHVmbij
         Vylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720725453; x=1721330253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj/ERQd2PMN4UyxPuF5KQJzlTVD+FysHfHvTqGvOZ4w=;
        b=KYGtqKFmB5Mh3VtOMjZfpl2lE5LRmWSZSZtVNcFI8XGZdo2vucRgUb5JumHb8QNz/H
         TR4I2Ji9VQyDG4PxWzsS+bWoGyTddkbj/aSSOAQrYzfNxsXRBpCmJ37ofkFLDa0r9gJ4
         ZA5pWBJLMIgwHRTyxoDH50j0SaD43I+mMy8SMbzLmtj9GmvbfwUYfjR4/Y0dJ9ORGdzJ
         8lBMzCTH4EC+fr7XgyEG1NQtf5b4jLcX/7qaQSXbTQECQL2YNRYzRdauJOzI1bkqLqfk
         m6Gnd+8V7107LWAryF7OGDeekjExGa+aiN+9Hg0wRFeDFf/xc/yQPTa8TiQyyiZl04pF
         D9qg==
X-Forwarded-Encrypted: i=1; AJvYcCWijgmdspnMQDkizwEhyfKZdaZrAZSgagZ2jDwq4pIsAVVZVvllkpbekNdEul1FLlgqkeB8lKB2TW9OT9GZuTzWPyPpqCnFY3DziIS9vMo=
X-Gm-Message-State: AOJu0Yx0b3dCVDnVFSsqVS+7KAlifCbagBFPTHlPHydhkZyVawClzkLs
	lfLRqWiYbPl36nYIUEIHkPhXdENLZQFLvm340iKp+7cPJUEbslkc
X-Google-Smtp-Source: AGHT+IFiDzeJG11/J5+UTBTodvcIhiv8E7BJaTIQxaLdEJnw7ldXjojowi+bTWfW+4u4MFIRyeVwrA==
X-Received: by 2002:a05:6a20:2449:b0:1bd:25bd:ef6f with SMTP id adf61e73a8af0-1c3becfb065mr753928637.18.1720725452818;
        Thu, 11 Jul 2024 12:17:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43899578sm6056811b3a.26.2024.07.11.12.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 12:17:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <49f46f96-dfc3-4c50-a33d-a6cf1b67066d@roeck-us.net>
Date: Thu, 11 Jul 2024 12:17:30 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4qk0QMafMOD81D=95oL3Qyc7Jd0C5_gGjtw+Kbn=_v9WA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/11/24 10:43, James Hilliard wrote:
> On Sat, Jul 6, 2024 at 1:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 7/6/24 12:06, James Hilliard wrote:
>>> On Wed, Dec 13, 2023 at 1:45 AM Werner Fischer <devlists@wefi.net> wrote:
>>>>
>>>> WDTCTRL bit 3 sets the mode choice for the clock input of IT8784/IT8786.
>>>> Some motherboards require this bit to be set to 1 (= PCICLK mode),
>>>> otherwise the watchdog functionality gets broken. The BIOS of those
>>>> motherboards sets WDTCTRL bit 3 already to 1.
>>>>
>>>> Instead of setting all bits of WDTCTRL to 0 by writing 0x00 to it, keep
>>>> bit 3 of it unchanged for IT8784/IT8786 chips. In this way, bit 3 keeps
>>>> the status as set by the BIOS of the motherboard.
>>>
>>> I have a board(https://qotom.net/product/94.html) with an IT8786
>>> revision 4 which is recognized but doesn't seem to ever trigger. Did
>>> your IT8786 based boards show revision 4 like mine do?
>>>
>>> [    1.607590] it87_wdt: Chip IT8786 revision 4 initialized.
>>> timeout=60 sec (nowayout=0 testmode=0)
>>> [    2.367608] systemd[1]: Using hardware watchdog 'IT87 WDT', version
>>> 1, device /dev/watchdog0
>>>
>>> Docs I have from the vendor just show bit 3 as reserved:
>>>
>>> https://qotom.us/download/SuperIO/IT8786_B_V0.2_industrial_111412.pdf
>>>
>>> 8.10.8 Watch Dog Timer Control Register (Index=71h, Default=00h)
>>>
>>> Bit      Description
>>> 7        WDT is reset upon a CIR interrupt.
>>> 6        WDT is reset upon a KBC(Mouse) interrupt.
>>> 5        WDT is reset upon a KBC(Keyboard) interrupt.
>>> 4        WDT Status will not be cleared by VCCOK or LRESET#, and only
>>> be cleared while write one to WDT Status
>>>            1: Enable
>>>            0: Disable
>>> 3-2      Reserved
>>> 1        Force Time-out
>>>            This bit is self-cleared.
>>> 0        WDT Status
>>>            1: WDT value is equal to 0.
>>>            0: WDT value is not is equal to 0.
>>>
>>> Any idea why the docs I have would just show bit 3 as reserved?
>>>
>>> Did you have any information from your vendor under what conditions
>>> bit 3 should be set?
>>>
>>
>> On ITE8784E bit 3 is "External CLK_IN Select".
>>
>>>>
>>>> Watchdog tests have been successful with this patch with the following
>>>> systems:
>>>>     IT8784: Thomas-Krenn LES plus v2 (YANLING YL-KBRL2 V2)
>>>>     IT8786: Thomas-Krenn LES plus v3 (YANLING YL-CLU L2)
>>>>     IT8786: Thomas-Krenn LES network 6L v2 (YANLING YL-CLU6L)
>>>>
>>>> Link: https://lore.kernel.org/all/140b264d-341f-465b-8715-dacfe84b3f71@roeck-us.net/
>>>>
>>>> Signed-off-by: Werner Fischer <devlists@wefi.net>
>>>> ---
>>>>    drivers/watchdog/it87_wdt.c | 14 +++++++++++++-
>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
>>>> index f6a344c002af..9297a5891912 100644
>>>> --- a/drivers/watchdog/it87_wdt.c
>>>> +++ b/drivers/watchdog/it87_wdt.c
>>>> @@ -258,6 +258,7 @@ static struct watchdog_device wdt_dev = {
>>>>    static int __init it87_wdt_init(void)
>>>>    {
>>>>           u8  chip_rev;
>>>> +       u8 ctrl;
>>>>           int rc;
>>>>
>>>>           rc = superio_enter();
>>>> @@ -316,7 +317,18 @@ static int __init it87_wdt_init(void)
>>>>
>>>>           superio_select(GPIO);
>>>>           superio_outb(WDT_TOV1, WDTCFG);
>>>> -       superio_outb(0x00, WDTCTRL);
>>>> +
>>>> +       switch (chip_type) {
>>>> +       case IT8784_ID:
>>>> +       case IT8786_ID:
>>>> +               ctrl = superio_inb(WDTCTRL);
>>>
>>> If I print this value out like this:
>>> pr_warn("WDTCTRL initial: %02x\n", ctrl);
>>>
>>> I get 0x00:
>>> [    1.607480] it87_wdt: WDTCTRL initial: 00
>>>
>>> Do you think it's required that the kernel set bit 3 for some boards for
>>> the watchdog to work correctly if not set by the BIOS?
>>>
>> That is done for none of the boards. The code in question does not _clear_ the bit,
>> but it is never set.
>>
>>> Or maybe it's required to configure additional registers?
>>>
>> I would suspect that to be the case. You might want to check register 0x72.
> 
> So it turns out using the wdat_wdt driver works on this board.
> 
> If I log register 0xF1 I get a value of 0x44 which the IT8786 docs
> indicate for bit 2:
> This bit is to enable the generation of an SMI# due to WDT’s IRQ (EN_WDT).
> 

Interesting find. I looked into some other ITE datasheets; they all have this bit.

> If SMI is enabled for the WDT IRQ does that mean one can't use the it87_wdt
> driver and instead must use wdat_wdt?
> 
Looks like it.

> I noticed there's some ACPI resource conflict detection in the hwmon IT8786
> driver(although the hwmon driver doesn't indicate a resource conflict on this
> board for me. I wonder if there is a resource conflict here with the watchdog
> that should be detected?
> 

The hwmon driver detects the conflict on the hwmon register space, not the
Super-IO configuration address space. I would suspect that pretty much all
systems would show a resource conflict on the Super-IO configuration space.

The best we could possibly do might be to add a check for the bit in register
0xf1 and warn the user that they might have to use the ACPI driver if the bit
is set. I am not sure if that would be helpful or just add noise, though.

Guenter


