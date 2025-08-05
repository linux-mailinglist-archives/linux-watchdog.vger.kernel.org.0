Return-Path: <linux-watchdog+bounces-3971-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51442B1B4E9
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 15:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 940F17A2E69
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 13:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0673086328;
	Tue,  5 Aug 2025 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZzS6ukd"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A50729D0E;
	Tue,  5 Aug 2025 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754400634; cv=none; b=WJZfoAclXIiH746KkyJM+ZrMkhpEk81JmPAx5VcMT3ScYOTtJFFYtRV0etiw0+JMsWNBCao01AXQSrVb824Nf6AD0jfiatiiXV/G1j2SQgY9lO/44f6QUhNiOmvz/np6p6NMqi4OWX+VzLdu526MRcYWAXlDf5GMAXwylhNnnck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754400634; c=relaxed/simple;
	bh=7+7YZ47xZbreRUlfOrRIzW1Rf9BBEqeEpWL2d5HMmzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmKUm/DOGzicuZnNEBKjw5bL2ZCg4//EG2OVfA0FBK/b3PgzfoYosF/rOzbS2AIyv8wVYdQphpcBuNq05mSy1flZh8MnnTInKhUr42Z5FhHIHJvV1D1a0u7wQZ4HICLkwM6u2NBdQiPe1wb0iUAR5gVgmptdmMrNNOmHS2Cd7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZzS6ukd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso3539395b3a.1;
        Tue, 05 Aug 2025 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754400632; x=1755005432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cZWweXfQATMKDZrk4sSi9lSBe6kngHTyWWLkx0Jj+bk=;
        b=XZzS6ukdmpkjDqT1qiVHT23bJE/mbNmbuepUFgZSNHDlpVt918AcNB4Dt40yqqm6ZL
         k/e3uVmGNtE8gACP9F8Cubsas5eYIPezc5R8w71Lu7lYgQiMoxBJpaCdUzY6FikxKX32
         WEl5vRrD92tfQAVWNCx4WsSWGlfHT1sq1kSfGS2ZBHrmKUlCbRFQyRnP3p/jHiTVxcQD
         A6Q7go26dYhmKOfTtsoD1X6+hPR6QETrdVENo1q0ufqhOE2WM8VCgJeRJ5FRyNawtpQQ
         nCvO2fk3iebJSTLHiJxgKhUIXmgsTYC1xzL5rhzuTgv/67PYRBnHumSeDlayRMdlsWcI
         28nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754400632; x=1755005432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZWweXfQATMKDZrk4sSi9lSBe6kngHTyWWLkx0Jj+bk=;
        b=ZXLIXFX1biRNIcwWd0hw+NHw2jg+Vaz8FBsPoYcbNhtHvkr2KTwPbgslLl3Uamw05Y
         Z8fCCfDDlD3CAe9L35dp9XWORh4tGz/2xdLezDf0Ka1SlCyc2L1nhSAHZDbU60GH+ooy
         ImeVq4M7AQ0UG06QNYMDDIioZMGoZf/j5e2sFUzJdog6t3KPCvGjKfS9J9durE2R885f
         JJZwmrbK02aN8+/E0z24+wU8yRmHEUSGY/Xhj13g2+2A8hvUFkFZwckmZcwZw9i3fMzE
         v5iuBQljJ6pEJ0+qbyzMvH7vRClnEnlLTyLtcSOSmoo//M1hqmc52+7BUe5jVJ1IiXw2
         AKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/+NvjCaJpUv9wL/+YHhvAzgApC9sOSsDrkG6TTwsb6+dy7qjIu4BOLzxd2xjoeFJsc1MMxHeTmSjOHg=@vger.kernel.org, AJvYcCWqFmfAMODy544fBSvcift0cIySRin4Phqad3ozSLfPxWvuZbmw16qmuvkzHZ9Mw0kz6Zrsvg2jWCy9+ACJ3MCzA7c=@vger.kernel.org, AJvYcCXOEdU82zVc2osRmv0U+nvlO/oArBkht2ZqsarMZl+c4qdR8r4RQSn9KH8ABoIKe+kPFSGcXHJDKXeWcuKuij4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzurOwl8rECux/FNH78I/5syFG6h5IePJii0da2rVWeHXrcnqBM
	F5PzGJ9u5ahsxYXkIcQUKTwnBVlK8mzXoA/BbrPOpLXnwZBetm5wPkgK
X-Gm-Gg: ASbGncsXBSY7rn+uVa2j9D8kZCVkdjdMPL/CS7O8HiPDjwZSTtcrTxGfXSbL7uCrEIn
	3OrqvnapgWk4i56SC/SE3HEQlpdRtJm9zcBA3h1yaaPbepBZ7ODPXoOS+Iv2l7RE8v4YpEsHTcW
	VueeBqP4ZLd2sYDfqzr+BC2WDL/9zdWvHPsZa4HEjPFO+KoNfEjh5ntDhK6Q/Va1PnjLdRFecs8
	FDeco9DfhuYYI3yy3HcJgyUTLGG+05js03jBm2iKCCKYs35E2ek8myIJAZQ2KKxOez9rlHwPmEF
	3DS9/cODZyZa5A+fIc3M9kZs2bWIrjINcLX54HjSHlKa6bXIxZoltKsAM/y1EpKVkP0HlkeHbaU
	iXZhUSza2oM/qnyZEX/u7Rac+t4FfFkV2CCXNmjM/It+axr+Dwoop6XHhYw33bYjhDrTplkOUGA
	to1kmwBA==
X-Google-Smtp-Source: AGHT+IEvnnUy8re3j4J8a2pONxFAYiEi2+s8IXa2eOgdUl/cWzHK8tCot0jxI7/XmCVPhO59t4Zp8A==
X-Received: by 2002:a05:6a20:3d10:b0:21e:eb3a:dc04 with SMTP id adf61e73a8af0-23df8f94a47mr19694788637.3.1754400632409;
        Tue, 05 Aug 2025 06:30:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bae2fe7sm11241719a12.44.2025.08.05.06.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 06:30:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <30e377c4-15a2-4201-98b0-f00670af1ee2@roeck-us.net>
Date: Tue, 5 Aug 2025 06:30:30 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
To: sw617.shin@samsung.com, 'Sam Protsenko' <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
 khwan.seo@samsung.com, dongil01.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
 <20250724080854.3866566-1-sw617.shin@samsung.com>
 <20250724080854.3866566-3-sw617.shin@samsung.com>
 <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
 <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
 <18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
 <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
 <008501dc05da$36362600$a2a27200$@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <008501dc05da$36362600$a2a27200$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/25 00:26, sw617.shin@samsung.com wrote:
> On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> 
>>
>>>> +       u64 t_max = n_max / freq;
>>>>
>>>
>>> Make sure this compiles on 32-bit builds.
>>>
>>
>> Can you please elaborate what might be the possible problem -- just
>> curious? I admit I never though about 32-bit case when writing that code,
>> but don't see any immediate issues with that too.
>>
> 
> In my opinion, it seems that Gunter Reck's explanation is correct.
> I've found out that the error of "undefined reference to '__aeabi_uldivmod'" may occur when compiling new code on a 32-bit architecture.

Also see include/linux/math64.h. The functions implemented or declared
in that include file do have a reason to exist.

Guenter


