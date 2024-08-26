Return-Path: <linux-watchdog+bounces-1530-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F3C95F4D6
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 17:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A97E1F22B6C
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 15:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE373C17;
	Mon, 26 Aug 2024 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpOjmIu1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C27E8F7D;
	Mon, 26 Aug 2024 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685358; cv=none; b=ZbGQCvwv+65WO2AjAhjz6eSdQzKpIyEtUIgqAgEA7C8TssQglKRQ5SiyOcu5zdxtfGdUlJUUMLa0y8zGFmEdF+lRVxNqBGStEImzaKxTi6yCoby45it16ssuSV+lYYIVIwOyMArA6n2H8Jy1HKjhqTJt7J04CFOa3F8gWRXAcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685358; c=relaxed/simple;
	bh=FStfZ1tceaR1OGM8qLxqU4pfVOzY30JSrOD58lZiKOs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=F/JVQ6ZsL1WebJNkGnB3NIIoFY2C7U8ls7tH7Hua3pgoo8amWuttkzdw+sTqoDur9fAtytdZ4xyedPk74oWYLet0Go0HW+71VHpIreq4z5J8c68cU9d0UnCsgEby4WdMkJry/s331Pi+UvFzcBotQ2iOrN5bKM4TnaadFDKZ8CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpOjmIu1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7143185edf2so3697169b3a.0;
        Mon, 26 Aug 2024 08:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724685356; x=1725290156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nBDbTISgteYXuVD5DLXqenFwN8KqmSC7xTXYy1AikEM=;
        b=hpOjmIu1jQRr6/9jneEmRTEgiP46OG1klyByRU/X6ytgBjLGu4j9LkInr7Ry3Js6mg
         n/rsG0aN4MnyCsmBDaRmJ28jfVlM8deNkGklTc/MbESvF1Lv0h3Ygrp1Uan576aqq7z7
         qIFw1F6uo4d8pc5vIus7BNwB/mGCfRhZcbiKi2H6L60MFbGFIcG9Tu5awPVPEHqArbAX
         IxGO/I474fiLaMEnhSP5DSdPsUJd67V67CTxengsKlQYTwe9Kf1wToASczrls25g8Lr1
         /JiIB8jbfQ7vriWuPg19DZPyygoRrNBQtEXcaBtVa+BQvPCtqCb9g/5d/Qe8qSbbfvi4
         Ymrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724685356; x=1725290156;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBDbTISgteYXuVD5DLXqenFwN8KqmSC7xTXYy1AikEM=;
        b=QJPEHWlQAUR5veBUvu5qQJ1M96ODKYhGfaM5ZAArG3UYLG8T/SpTR8ErVg6oPbQ5Iu
         3Dsq7Sb+mxnFevDjAVE2Jdvk0OPFQgz0kBVouYsNdHThYGUqJudS8BXsIOEasOttbpi4
         zrmz3ogpIGYNFfo4nK+QfA925jvM76WEv4uno6aBgWwibNQvUiZ91BnOHtg6Af/KGvEZ
         rtcYmey1FiR7pqMKR+u514zdTxUMbDsnSmXUiWTQiYflITCxtbnwshmPcWguE0E4hpJI
         24QpKdSeT64a/cctt/4QVcPW890lUo/ZOrAbcPGQjKXhuHt5xCq3dsQMwUyAMEeWF+aT
         xQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB+WCwFjfQ28rOmlOkJRUUSmTWJ7V7B0U1XqbOcC0qqhVozqCGxXnA9kV5SvXNJ33gnSb+ozQt/XP9tM0=@vger.kernel.org, AJvYcCWMW/BjUcNN1uXP3vK1f90tgZrEauo/lQ6xacKqpW2Fsz+ZZfVz/nv4I3gLa7ylP8nm0DjxPOSZwZyQ9KO3mjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpRmtqYm5uZNdWQ/8nuP7MJ2cVpyL3iWQbWodJkFMIUyp7ea6v
	FvzIK2+2Ma3z7u4qPV4CInv0g0L8vzKE0mtY4kbTFLo55chpl25gQjCqGg==
X-Google-Smtp-Source: AGHT+IEh+/+XeumKWAjz05voMllH+iLhNQVDhET8wdOto21E6IKLt+RdnoqO+NhsXA7lfPt9Z2p1jA==
X-Received: by 2002:a05:6a21:9688:b0:1c4:6be3:f571 with SMTP id adf61e73a8af0-1cc8b5d8f81mr12301097637.39.1724685356248;
        Mon, 26 Aug 2024 08:15:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343405f6sm7117710b3a.186.2024.08.26.08.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 08:15:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <124070dc-77ed-4854-9322-9cc9a4c54b57@roeck-us.net>
Date: Mon, 26 Aug 2024 08:15:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iTCO_wdt: ignore NMI_NOW bit on register comparison
From: Guenter Roeck <linux@roeck-us.net>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jean Delvare
 <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 xe-linux-external@cisco.com
References: <20240826075303.3964392-1-oocheret@cisco.com>
 <20240826111811.GP1532424@black.fi.intel.com>
 <7fda0a60-e34e-4853-bb4b-2c29c0806754@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7fda0a60-e34e-4853-bb4b-2c29c0806754@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/26/24 08:12, Guenter Roeck wrote:
> On 8/26/24 04:18, Mika Westerberg wrote:
>> Hi,
>>
>> On Mon, Aug 26, 2024 at 12:53:01AM -0700, Oleksandr Ocheretnyi wrote:
>>> Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
>>> PCH iTCO") does not ignore NMI_NOW bit on write operation to TCO1_CNT
>>> register what causes unexpected NMIs due to NMI_NOW bit inversion
>>> during regular crashkernel's workflow with following logs:
>>>
>>> iTCO_vendor_support: vendor-support=0
>>> iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
>>>                                              disabled by hardware/BIOS
>>>
>>> This change clears NMI_NOW bit in the TCO1_CNT register to have no
>>> effect on NMI_NOW bit inversion what can cause NMI immediately.
>>>
>>> Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
>>> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
>>> ---
>>>   drivers/watchdog/iTCO_wdt.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>>> index 264857d314da..679c115ef7d3 100644
>>> --- a/drivers/watchdog/iTCO_wdt.c
>>> +++ b/drivers/watchdog/iTCO_wdt.c
>>> @@ -224,7 +224,7 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
>>>           val |= BIT(0);
>>>       else
>>>           val &= ~BIT(0);
>>> -    outw(val, TCO1_CNT(p));
>>> +    outw(val & ~BIT(8), TCO1_CNT(p));
>>
>> I suggest adding some #define for the magical number 8 so that it is
>> easier for anyone looking at this driver to figure out what it is doing.
>>
>> Otherwise looks good to me, thanks!
>>
> 
> Not really; it appears to be hiding a change in code which is supposed to do
> something different (it is supposed to set or clear the no_reboot bit),
> with no explanation whatsoever. That warrants a comment in the code.
> Also, I would prefer
>      val = inw(TCO1_CNT(p)) & ~BIT(8);
> 

On top of that, I fail to understand "on register comparison" in the subject.
What register comparison ?

Guenter


