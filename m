Return-Path: <linux-watchdog+bounces-4352-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555CBC3490
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 06:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30F461890480
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 04:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FCC1799F;
	Wed,  8 Oct 2025 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyzksQ9E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A422571C2
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 04:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897269; cv=none; b=tO8BEcjK0N/ViDsZpwv2sh/uIqMskVgdISL4ftopNLjZNvVIlKnlNfPYuBiFYi33nU7HP7Fss29HI7P+DdlLUNT9E23RH6Hd+wd9QYFr2E5xJZzrzm/kLTd3ZjY6aml3WXMyc9tBfILw/hxOK44JtZybmO11Wgl/ruX0Ak0IAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897269; c=relaxed/simple;
	bh=l0m8a19M8uRE97VEhRLl8oSLNWe4r6HUTI2Q6O6wAcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BjBHpOvRss8XdKlo8lHdy3QLFClGd8zFV24uBw7t2VGoE33jE7YuoH3Jop+TWb2iz2DkeS+zDHnleOOIdBZMUziQ/wWLriMSEmC6e4X4ppgrr/0GCRHx+L4BhRaI/TSeOvrqT9YSzB5OMhqt8bwfdjoau/FybwTvTFZJOYJkMGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyzksQ9E; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7811a02316bso4955045b3a.3
        for <linux-watchdog@vger.kernel.org>; Tue, 07 Oct 2025 21:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759897266; x=1760502066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9TJy9TZ0V4zU9QEOdoUBMSlfuWW6/GP48/yMW3+/H9s=;
        b=eyzksQ9Efcf8OEtTrA5BH8bD4yrw8FjLhDuIsLcaXrZYd5LVHkn5l56uKeBu4qc9tF
         K7KNEp4An8aK/TN3R9z9Kgf8BboH3GPrM1Wt625ii1/tS5/DuTfhqHg1xTUVdLFR0Z0S
         igAMtFqWv3vVlivc6StmTiC5al9ZSe12CztWNWgXBlcDUz1NiUfbzh1MFt0imey/joPO
         ntp/7Tyluq0s/3xzf2iSAFUaONRMaOEDEfiDCMWdG7uOmMJAeQHMC5fTjtcl0fTeGbDw
         xX56YQtuHCDBf3ia3ggZ6iOFtjt+YFLS3pTW37Adh9gaaWx28keBUbWUYoTs5sfTtbCR
         zzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897266; x=1760502066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TJy9TZ0V4zU9QEOdoUBMSlfuWW6/GP48/yMW3+/H9s=;
        b=dp0Zy8yaPYrfU4p3bZIojHDTSF0v+9lLEtF9ZH/M6Orn9HnWhTRhc5Wm/hJgzCiiaT
         by8t3E8P15xtwTZVVhSulfLT7YPcVAR+R5P1ZTX/lS3N8kzbpruKpCtew+Igb7aeHtj7
         1ZK4e7zWoKPi7Zi12O50q5nTk0vze+j4azLbkuGah2RD0r/q+QsHnyCJOsjrrwgI8Nwd
         OC6WHzH83qZJfkA6bMyIK4n1YzVglQpvcsGXqLFvl15hC4Jtgq+XDTXcni345re2P/Jr
         mAOKtgEt/Co6FePl90HvYp92hntfT0h+k03JAeJptCO4AAirXIaUL9pyx4egejQfUBGb
         bgGg==
X-Forwarded-Encrypted: i=1; AJvYcCU6OzSTGIOwyyQTxBz66IRXC6BONMlWbp7pMb18QRuNdpQvxGzXldtStxxK6uFjOpqb85EBAzwggsQHOpL58g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YLyp3tOmRNEfpLTrZK4y+uGNHUbj5rQUcArFncg2+gAu1en7
	xafeVxBu+8oWOUutALXLwgNK2DWnoLlEhrI42dd0E1S/z+xFo0JG6oeo
X-Gm-Gg: ASbGncswjuryMEIKT1VyPQ3KEaXcWRvYtqN4owhtJNtQAiMZ/M5Tu3/JNXleXtHevcF
	2xxOxhJq9KY8sQRtNZCF7k94lVfLhR/jYW5z39qOxkvHSM0qAdDI1G5M+6sTG+TILioHaVLfUUv
	V8TkgTVrT4BmaFKMJKyfvn0rtm055qCNAphojV2dM++xBwx2Zs6PPfkVmHF+i9X7CBI0AdeaTTR
	jVlOP/CA9b0RIaBMpMwikjpnJjKLOXWZCsERrXW5x9BjASseNa850u0eli4ZtSgaCoodfHjwzrX
	FPQaC7Zsd8yoHf2mbCHUNIeYJluzse8SUKsPEmgCR3NB/9senzEKIykUr1RkDllREPau7HIZRw9
	gEPQdrzZy9IrLbIg3rGQXbww0HUYJ7+uU16oKuRYYgpAzPeaA3lCQ37sT17JCrYiunY1NbdUoLx
	RJpcXdNQ1B6p3iU5lOSfg=
X-Google-Smtp-Source: AGHT+IGPl/Mm/NaQsG0TYzUcRWLvYSHGWrnzPu3xN1xjq6km3zWj4znIXZRYrQL1Ybsio/8lBLjBzA==
X-Received: by 2002:a05:6a00:391a:b0:781:220c:d2c1 with SMTP id d2e1a72fcca58-79385709914mr2694127b3a.2.1759897265572;
        Tue, 07 Oct 2025 21:21:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cd3bsm17314227b3a.4.2025.10.07.21.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 21:21:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c5cab3a0-b17f-494b-b856-ebf2fb68db60@roeck-us.net>
Date: Tue, 7 Oct 2025 21:21:03 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
 <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
 <83a90651-0b46-4c68-ab90-361422192e90@roeck-us.net>
 <TYZPR06MB52035407C39249441F09AA18B2E1A@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <TYZPR06MB52035407C39249441F09AA18B2E1A@TYZPR06MB5203.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/25 20:29, Chin-Ting Kuo wrote:
> Hi Guenter,
> 
> Thanks for the quick review.
> 
>> -----Original Message-----
>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>> Sent: Tuesday, October 7, 2025 10:55 PM
>> Subject: Re: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
>> mask registers
>>
>> On 10/7/25 01:36, Chin-Ting Kuo wrote:
>>> Starting from the AST2600 platform, the SoC design has become more
>>> complex, with an increased number of reset mask registers.
>>> To support this, introduce a new field 'num_reset_masks' in the
>>> 'aspeed_wdt_config' structure to specify the number of reset mask
>>> registers per platform. This change removes the need for hardcoded
>>> platform-specific logic and improves scalability for future SoCs.
>>>
>>> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>>> ---
>>>    drivers/watchdog/aspeed_wdt.c | 12 ++++++++----
>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/aspeed_wdt.c
>>> b/drivers/watchdog/aspeed_wdt.c index 837e15701c0e..e15f70c5e416
>>> 100644
>>> --- a/drivers/watchdog/aspeed_wdt.c
>>> +++ b/drivers/watchdog/aspeed_wdt.c
>>> @@ -35,6 +35,7 @@ struct aspeed_wdt_config {
>>>    	u32 irq_shift;
>>>    	u32 irq_mask;
>>>    	struct aspeed_wdt_scu scu;
>>> +	u32 num_reset_masks;
>>>    };
>>>
>>>    struct aspeed_wdt {
>>> @@ -54,6 +55,7 @@ static const struct aspeed_wdt_config ast2400_config =
>> {
>>>    		.wdt_reset_mask = 0x1,
>>>    		.wdt_reset_mask_shift = 1,
>>>    	},
>>> +	.num_reset_masks = 1,
>>
>> Looking at this again: Why set it on ast2400 ?
>>
> 
> This should be removed for AST2400 platform. I will update it in the next patch version.
> 
>>>    };
>>>
>>>    static const struct aspeed_wdt_config ast2500_config = { @@ -66,6
>>> +68,7 @@ static const struct aspeed_wdt_config ast2500_config = {
>>>    		.wdt_reset_mask = 0x1,
>>>    		.wdt_reset_mask_shift = 2,
>>>    	},
>>> +	.num_reset_masks = 1,
>>>    };
>>>
>>>    static const struct aspeed_wdt_config ast2600_config = { @@ -78,6
>>> +81,7 @@ static const struct aspeed_wdt_config ast2600_config = {
>>>    		.wdt_reset_mask = 0xf,
>>>    		.wdt_reset_mask_shift = 16,
>>>    	},
>>> +	.num_reset_masks = 2,
>>>    };
>>>
>>>    static const struct of_device_id aspeed_wdt_of_table[] = { @@ -482,8
>>> +486,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>>>    	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>>>    		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>>
>> ... because the code here only evaluates it if this is an ast2500 or ast2600.
>>
>> If num_reset_masks would be set to 0 for ast2400, the value could be used
>> here.
>>
>> 	if (wdt->cfg->num_reset_masks) {
>> 		...
>> 	}
>>
>> and it would not be necessary to add of_device_is_compatible() for new chips.
>>
> 
> This "if" conditional statement includes not only reset mask configuration but also pulse polarity and driving type of reset output signal.
> How about changing this "if" statement to the below one?
> 	if (!of_device_is_compatible(np, "aspeed,ast2400-wdt")) {
> 		...
> 	}
> It will also not need to add of_device_is_compatible() for new chips.
> 

Ok..

Thanks,
Guenter


