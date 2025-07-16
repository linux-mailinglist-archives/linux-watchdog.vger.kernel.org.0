Return-Path: <linux-watchdog+bounces-3875-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298FB07D28
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jul 2025 20:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1D317A2612
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Jul 2025 18:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CF5263F5B;
	Wed, 16 Jul 2025 18:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcK5OyXc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B83621D5B8;
	Wed, 16 Jul 2025 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752691821; cv=none; b=VXDrk9V77d5O1HSFt5j+OgN5ljUocls6XGyo2lUbMWowrl+1xckX3JUrG0rVfqhpDPGufkKePyPY9XHg6yQfNnuYU/tHtEB9q+8hdFhz9zhIwMoS3wX6tOz0NSRr9rLVobAXHHwJ2c57KUqY6wy8FONyHlBNj2rhB8eElCfeBu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752691821; c=relaxed/simple;
	bh=2SsV6e/YJQJ5JZ7EBFFC80zRUBpJnuDVga7+BCm9BkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpyZnCkvOzZrn684Tkpd0x7rQH7TGMtnHEiGQ1Fu70V6WgoTTwCglnqo6kimslLVKLaJWrdDk+ZCEgmFIgobXB/MvoSp0R4m8krwqJlHK/g3HyEzSHh0adSFFwxwRXMQQ52Hd5X25UR3/FgNnpm7kESCDwoMETBeTLATY8AHnrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcK5OyXc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234c5b57557so1188905ad.3;
        Wed, 16 Jul 2025 11:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752691819; x=1753296619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=55CI9qwqZZ/X+xODdWJN1T4oZqGBoQ5xLG7HeFL2fEs=;
        b=jcK5OyXcIXlv1Xc4xISvXn5+T9o+hZIdTNppNhFGwlfl6PkoNPeAXPT3/ZOQTKFkOR
         P8v/n+nXsViS5Qpq50i7uuOlxNsZUGM3ikmcwDh0OsG5tPTg/BH+2n0bbBejdeDUZR2z
         RnEfkfek3ZYt6GWmFBVZcIDWWkfGmKANvqZRFRqJ2pGHLZ5QCRjtORMmcXHQNXfFU/XE
         a8egFhcO5+QziL2o9UoDuEysVbzObOpSLOdyq4stY5IQCJLAoJ85ThmJQySDmgiqUqS4
         fkaxqiD00yKcx5OylTEfi16V4kE+b+Qy5bKJBPsv7jtDmrYTFrJ//StbTf/s/mbWDoIK
         173A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752691819; x=1753296619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55CI9qwqZZ/X+xODdWJN1T4oZqGBoQ5xLG7HeFL2fEs=;
        b=gTt5yOal+A4aJj0LHhCvzpeSr6M7yrmL0ajSnQxLmWjW6KXOcuC8LloEHNQ9SIhv/j
         4OVMuwA1bxwn8JV6f27iWDjHqN0Ty/Ppef9vqOkJwEBkAS8cj9sTmN8VVWZRQTLz2QCD
         hwGHAhMb9Bpg/NCj+l/ldW33zNAkILU+8Tl19Kym7eNzPWvW2B6lKJPp5kkM4wHSrdAW
         hbiWDwhWzCfeXoBLNUkllaN2SeQoBounZGbkVqgqUBPRO70IOwJNtSS/MXuph1ak+sMc
         wSmJJAFWq/txsw33+w2PIYvdYKQHtmLeRXkyoMZVDkXS1xcIGuxNVFLEOajikXjl/bX2
         4Iyg==
X-Forwarded-Encrypted: i=1; AJvYcCVVyCHhB4c1BJYof/Wbq+0+7H/HKL+hBoXOL2DAVCX0H4hqvH2gYyjDqfl9xWN8kJSVqeEq2XenFgNCDD9n@vger.kernel.org, AJvYcCX00+K3ZN2f0r9Xbk9YuQI8LwdAAfgvxb/4sfa7CVMBmakZk/D15jqi87AEmnkghcjA2C0Uu9UpcfLo@vger.kernel.org, AJvYcCXUFrENnKgQQdZVsh8GbfzrFovB0SIY6uJ9A07uANBC3UB+LjnBjUZeUCij0MX8I5GKwWUcAxlo7taQLHo3y3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/M8xUSPRYXTrQL019aapSDHUzNSRu6af7bpMR4kN3fKsY4Py
	hJ/HgsqdNpyOljXwMxhnPQEVqsJpEX59wTRiyoz8BVPqZa43CNCKB3BGFbvLKw==
X-Gm-Gg: ASbGncsbejUHnSb9vDLMeuPSOuis4+yidkNg/oQEmViz4Rcz1wZ2Y/vS4cFw9Gve9tr
	Yx90Jenvy+GLX8OzdwJQfe9jw+v2LmlcQtbzR7ZDdArIbIdkxHTI6/Tt6/3ALtDqaVzStu7Qjs2
	VG/gaO0JsHw88RLpIitQEGSVVCCbAyeczkRvZGemfnT3zZ3jxXuypykuW14Ll3TcP+zPB/8CCCg
	qDAvWzdlnsqkJA1YFWtASNbmtA9UbQs6gplUnq+okRql8VPdHj7MT9Ps5suuCGiuKw8QRkCWRNv
	ZPaRNQM486KB1Wh4pdbU5CNgY/0EiwcquxQ6yhdBtp1nZrYG/mK2Sbh9CtP8E1NU4NYnvcZCU95
	t1+qitvk1xDWIMNT2kVDdzfiaCY86jqjZo5N9ar8daH/QBldSmrSSwsjwjNK5UdWBSCdmMB8=
X-Google-Smtp-Source: AGHT+IE59qROXyaWOC0wCIHwcfE55x00ppkt/Riu9bhhfr3ok7cGb2r6Xp/Gp7IsCuKw6x8V7rRGaw==
X-Received: by 2002:a17:903:acb:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-23e25791562mr49992825ad.50.1752691818477;
        Wed, 16 Jul 2025 11:50:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm134553595ad.13.2025.07.16.11.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 11:50:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d2bb793-14d0-45d8-b8bd-b770cdb4ca70@roeck-us.net>
Date: Wed, 16 Jul 2025 11:50:16 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
To: Judith Mendez <jm@ti.com>, Andrew Davis <afd@ti.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250707180002.3918865-1-jm@ti.com>
 <20250707180002.3918865-3-jm@ti.com>
 <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
 <d96541bc-644d-4c90-b9f7-1e4afd16aeb6@ti.com>
 <953f78a8-3928-479d-8700-dfe1cea15454@roeck-us.net>
 <299c363a-23c7-4522-b58c-100f49c4eece@ti.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <299c363a-23c7-4522-b58c-100f49c4eece@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/10/25 07:08, Judith Mendez wrote:
> Hi Guenter, Andrew,
> 
> On 7/7/25 5:55 PM, Guenter Roeck wrote:
>> On Mon, Jul 07, 2025 at 04:49:31PM -0500, Andrew Davis wrote:
>>> On 7/7/25 3:58 PM, Guenter Roeck wrote:
>>>> On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
>>>>> This allows to configure reaction between NMI and reset for WWD.
>>>>>
>>>>> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
>>>>> to the ESM module which can subsequently route the signal to safety
>>>>> master or SoC reset. On AM62L, the watchdog reset output is routed
>>>>> to the SoC HW reset block. So, add a new compatible for AM62l to add
>>>>> SoC data and configure reaction to reset instead of NMI.
>>>>>
>>>>> [0] https://www.ti.com/product/AM62L
>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>> ---
>>>>>    drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>>>>>    1 file changed, 28 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>>>>> index d1f9ce4100a8..c9ee443c70af 100644
>>>>> --- a/drivers/watchdog/rti_wdt.c
>>>>> +++ b/drivers/watchdog/rti_wdt.c
>>>>> @@ -35,7 +35,8 @@
>>>>>    #define RTIWWDRXCTRL    0xa4
>>>>>    #define RTIWWDSIZECTRL    0xa8
>>>>> -#define RTIWWDRX_NMI    0xa
>>>>> +#define RTIWWDRXN_RST    0x5
>>>>> +#define RTIWWDRXN_NMI    0xa
>>>>>    #define RTIWWDSIZE_50P        0x50
>>>>>    #define RTIWWDSIZE_25P        0x500
>>>>> @@ -63,22 +64,29 @@
>>>>>    static int heartbeat;
>>>>> +struct rti_wdt_data {
>>>>> +    bool reset;
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * struct to hold data for each WDT device
>>>>>     * @base - base io address of WD device
>>>>>     * @freq - source clock frequency of WDT
>>>>>     * @wdd  - hold watchdog device as is in WDT core
>>>>> + * @data - hold configuration data
>>>>>     */
>>>>>    struct rti_wdt_device {
>>>>>        void __iomem        *base;
>>>>>        unsigned long        freq;
>>>>>        struct watchdog_device    wdd;
>>>>> +    const struct rti_wdt_data *data;
>>>>>    };
>>>>>    static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>    {
>>>>>        u32 timer_margin;
>>>>>        struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>>>>> +    u8 reaction;
>>>>>        int ret;
>>>>>        ret = pm_runtime_resume_and_get(wdd->parent);
>>>>> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>>>>>         */
>>>>>        wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>>>>> -    /* Generate NMI when wdt expires */
>>>>> -    writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
>>>>> +    /* Reset device if wdt serviced outside of window or generate NMI if available */
>>>>
>>>> Shouldn't that be "or generate NMI if _not_ available" ?
>>>>
>>>
>>> For almost all the K3 devices, the WDT has two selectable outputs, one resets
>>> the device directly, the other is this "NMI" which is wired to an ESM module
>>> which can take other actions (but usually it just also resets the device).
>>> For AM62L that second NMI output is not wired (no ESM module), so our only
>>> choice is to set the WDT to direct reset mode.
>>>
>>> The wording is a little strange, but the "or generate NMI if available" meaning
>>> if NMI is available, then do that. Reset being the fallback when _not_ available.
>>>
>>> Maybe this would work better:
>>>
>>> /* If WDT is serviced outside of window, generate NMI if available, or reset device */
>>>
>>
>> The problem is that the code doesn't match the comment. The code checks the
>> "reset" flag and requests a reset if available. If doesn't check an "nmi"
>> flag.
>>
>> If the preference is NMI, as your comment suggests, the flag should be named
>> "nmi" and be set if NMI is available. That would align the code and the
>> comment. Right now both code and comment are misleading, since the presence
>> of a reset flag (and setting it to false) suggests that a direct reset is
>> not available, and that reset is preferred if available. A reset is the
>> normally expected behavior for a watchdog, so the fact that this is _not_
>> the case for this watchdog should be made more visible.
> 
> 
> How about:
> 
> 
> /* If WWDT serviced outside of window, generate NMI or reset the device
> if NMI not available */
> 
> if (wdt->data->reset)
>      reaction = RTIWWDRXN_RST;
> else
>      reaction = RTIWWDRXN_NMI;
> 

As I have said before, the problem is the "reset" flag. Its name suggests that
it means "reset is available". That is not what it actually means. It means
"NMI is not available". So I suggested to rename it to "nmi" or maybe "no_nmi".
Please educate me - why is that such a problem to name the flag to match its
meaning ?

Guenter


