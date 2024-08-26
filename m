Return-Path: <linux-watchdog+bounces-1529-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6959F95F4CC
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 17:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC25B2113E
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 15:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1EB1917E0;
	Mon, 26 Aug 2024 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd3Q/RhR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30018D638;
	Mon, 26 Aug 2024 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685140; cv=none; b=hKyIRGuAFaYwG9YI62gBDogHt4i7uwBgQdpf9Rcw53QHbglrzau1PIw/N7Wj8LIbnIk2zwzPvftxE4UxUXZ9qMQu4mvkUmjvCt38//EUn8Vz/XSFXNr71ZdMOzJyKV0l4Cy+/KdH9Ry4qoBWsl+KXTv77dKUx2seE6RS2R5T06Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685140; c=relaxed/simple;
	bh=MrfygaZtea27JXYmnab/RKenVpslT6ZKSAHsyCQvwMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BhbCoaJmHyIdmaeVCc7av2JCiSJQSjED7SABfd/KGIOol/djD1nGWyB9lu+SoHUuQ94D8Guykbiq12+lHfBS7rog1eODAKg7AG60Hrc8RCLST+hzoK4dD5/+GoWEvbW1GujAenTOYT4V0pD9e9tWQQHlXD+BH9ZzJV77R7WDWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd3Q/RhR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d3c071d276so2927139a91.1;
        Mon, 26 Aug 2024 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724685138; x=1725289938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezq5MM+KL5qw4ps6P21Dw52XpyfzivaUMGCgpfxor/c=;
        b=Zd3Q/RhR7zEX7iIqmJ7rAn65xit+obogPex0kQ8pTnfZP4mUz9SW2rL8xShwkB+D+3
         O75C65V7EIXeiA3KkyS9ldeHHi+tYhnRAb8LtBNRfLHdTZD59cDPv+PQIK2OV6ojMKgo
         bJsqulWqHFauLW9N5Opdk+CjOmPEQzY64zWB/ui/xgv+TtQIHH8z2AxU+bBmR+omT6ST
         omNNtcXjPApY0lQN75yK/4TZLEfbeMjx+9nvJGq0kXjsNNBgLtWBZ3bZDFKweLiHgoSO
         G8c/6o6d9QXN+72mwhPKwuyFZ7/IBAvZSRyzOZ7oODDU/YHPo0n3qpLX1+NrYVZN4wJ+
         eEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685138; x=1725289938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ezq5MM+KL5qw4ps6P21Dw52XpyfzivaUMGCgpfxor/c=;
        b=eT9KD1wF7RgpMVaSzXDfL+GC8aLaDM4Yt39kH5RpXIM1HAAaerd7fzRBulR35Z+dxO
         tKkWzDchP1w8SeykXY2CV2yz+BQlvNDy1DR84TlYnMaItCdgBLSfUqyQur6zyuKD7a69
         cXhNsn9u//0rvOeYXqmBuxCOhObpydODieUVxx1CRO/za0ojJsWHSrhGbxfu0T7U059/
         DvpgyiqZ/XK+/4pCE9ruzIeKam+J6ZzquI/b09l78U9myqyF/LptGwr9SE1o2LxnmtHe
         OmnMvOQmB1Js7cYNUB/mrLo9giJ9PJ25DrcXDwFD3iLBjmy92tVlH76Kr0mCXEi3MZna
         wxqg==
X-Forwarded-Encrypted: i=1; AJvYcCVX3N+cMWlgA2OIQdLnQfITS1WJ0tE/En46Cc+PQJx5pswtl9CVP71HwPcHJ/D1Iw9yDDGrsbM75PjQO84=@vger.kernel.org, AJvYcCW2gneqBi9rJ7oFH2LyCxLsNuLludpB9N9DNEjLyNIOrFWaw1dRC1k+Tz42HAExiSUbStK0dg9fqdAlMysww+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTMkAR/aax4FB3+FtE1dGDAOEivRNGDsNCEK2UWLtdX6seQlkL
	xjxYjJJ/wQinoI4wsLjwscTcYCz2HcLZ2nNdSDjv/4o9evlO/0hy
X-Google-Smtp-Source: AGHT+IHeW6SfEHwo+G8477dXA3JST49Dz8dCkolSifdtMUHpjF9Z5NHsIKyH0Pui7yqpFMKmwfzlwg==
X-Received: by 2002:a17:90b:3593:b0:2d3:d299:ddd2 with SMTP id 98e67ed59e1d1-2d646b90f7cmr9819370a91.6.1724685137911;
        Mon, 26 Aug 2024 08:12:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fc523sm9903418a91.9.2024.08.26.08.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:12:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7fda0a60-e34e-4853-bb4b-2c29c0806754@roeck-us.net>
Date: Mon, 26 Aug 2024 08:12:15 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iTCO_wdt: ignore NMI_NOW bit on register comparison
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jean Delvare
 <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
References: <20240826075303.3964392-1-oocheret@cisco.com>
 <20240826111811.GP1532424@black.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240826111811.GP1532424@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 04:18, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Aug 26, 2024 at 12:53:01AM -0700, Oleksandr Ocheretnyi wrote:
>> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
>> PCH iTCO") does not ignore NMI_NOW bit on write operation to TCO1_CNT
>> register what causes unexpected NMIs due to NMI_NOW bit inversion
>> during regular crashkernel's workflow with following logs:
>>
>> iTCO_vendor_support: vendor-support=0
>> iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>>                                              disabled by hardware/BIOS
>>
>> This change clears NMI_NOW bit in the TCO1_CNT register to have no
>> effect on NMI_NOW bit inversion what can cause NMI immediately.
>>
>> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
>> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
>> ---
>>   drivers/watchdog/iTCO_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>> index 264857d314da..679c115ef7d3 100644
>> --- a/drivers/watchdog/iTCO_wdt.c
>> +++ b/drivers/watchdog/iTCO_wdt.c
>> @@ -224,7 +224,7 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
>>   		val |= BIT(0);
>>   	else
>>   		val &= ~BIT(0);
>> -	outw(val, TCO1_CNT(p));
>> +	outw(val & ~BIT(8), TCO1_CNT(p));
> 
> I suggest adding some #define for the magical number 8 so that it is
> easier for anyone looking at this driver to figure out what it is doing.
> 
> Otherwise looks good to me, thanks!
> 

Not really; it appears to be hiding a change in code which is supposed to do
something different (it is supposed to set or clear the no_reboot bit),
with no explanation whatsoever. That warrants a comment in the code.
Also, I would prefer
	val = inw(TCO1_CNT(p)) & ~BIT(8);

Guenter

>>   	newval = inw(TCO1_CNT(p));
>>   
>>   	/* make sure the update is successful */
>> -- 
>> 2.39.3


