Return-Path: <linux-watchdog+bounces-1964-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36D97C84A
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 13:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663D42824EA
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Sep 2024 11:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A2819ABB3;
	Thu, 19 Sep 2024 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uFZ6uprE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF81865C;
	Thu, 19 Sep 2024 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726743781; cv=none; b=QTI18vuY2+JqadcQpRbRXs9oe7mUvu4Wsh1JWiMJriq3Mdg42HhWRnDRzJAXzx0C9mvG3AomrYSqVXfNhupeEnNp06dpN4y0u6Ok/ofTZT0r06h5iM0TuN6/y2vAQZAaiYf5AQNK8+mSh7q1atV1MzQCSAkKBwJNbgHPb4zRCQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726743781; c=relaxed/simple;
	bh=RG/LW8LPHfCBT977OpMqEUDzHLL9C5Pj6wQPzse7CQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbHOCSAOBgeZb93MxDFbs8zj1I41tLUILlQwgPyx4fiNOrEiOSvXxU5Hf+OqW8HB3tfpWy6821aEoEMOpTDxDzPtI00ofSApHxOTwxbJgEBS5UHB8KdUMy7hhqIHcUPzxvwIn7qzrKWBIrqM66lBgmyp6ZEqM7RKxcPd2V+CTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uFZ6uprE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BECFC4CEC4;
	Thu, 19 Sep 2024 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726743781;
	bh=RG/LW8LPHfCBT977OpMqEUDzHLL9C5Pj6wQPzse7CQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uFZ6uprEdrUBpgN4/rd1S7xFyAZCojUbyiuInBkyFxG+o4xkbfpQL+zZc2XDMvLW6
	 aILvBVcJUG8LJZTWVz4evFb9cFn44e8u3SstLM2XQJzQRGh814hbh/ILXvAJFz92hd
	 wEX7lC3DFaf/dJlsCxFLu1iUVuVoHZnsQSiVZNBdIlJ3vDTulBJ5OJsKbgj7gNjeUv
	 F4jLN8r2A/zfCbHIdMzLOMCat586+QuCtmVQkYKeqyCPerQjb/cF4glldu2TdL7pKm
	 0dLLbPrZsHv3mmmZ/EbG+Sgcig4IABw+bUO+Zu/V/cSp0AXmjXv9y4LT2a5GT5wguu
	 qJkY2D05QVqUg==
Message-ID: <2543aa99-0069-4eb1-a37b-204f3e6bbf6c@kernel.org>
Date: Thu, 19 Sep 2024 13:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rn5t618: use proper module tables
To: Andreas Kemnade <andreas@kemnade.info>, Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240918212925.1191953-1-andreas@kemnade.info>
 <f52deaf1-492e-4cbe-8e46-8999ae2e481f@roeck-us.net>
 <20240919125005.0bcd17e4@akair>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240919125005.0bcd17e4@akair>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2024 12:50, Andreas Kemnade wrote:
> Am Wed, 18 Sep 2024 15:43:40 -0700
> schrieb Guenter Roeck <linux@roeck-us.net>:
> 
>> On 9/18/24 14:29, Andreas Kemnade wrote:
>>> Avoid requiring MODULE_ALIASES by declaring proper device id tables.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>  
>>
>> This needs a better rationale. There are more than 40 watchdog drivers
>> using MODULE_ALIAS. I would hate having to deal with 40+ patches just
>> for cosmetic reasons, not counting the thousands of instances of
>> MODULE_ALIAS in the kernel, including the more than 1,000 instances of
>> "MODULE_ALIAS.*platform:".
>>
> basically reviewers were arguing against patches from me bringing in
> MODULE_ALIASES. So I decided to clean up a bit in my backyard. Not
> sure whether such things could by done by coccinelle but at least
> it could be tested via output of modinfo.
> 
> This is one example for such a patch:
> https://lore.kernel.org/linux-clk/119f56c8-5f38-eb48-7157-6033932f0430@linaro.org/
> 

There are multiple aspects here:
1. People (including me) copy code which they do no understand. Or
without really digging into it, because they do not have time. They just
copy it, regardless whether the code is necessary or not. MODULE_ALIAS
is one of such examples. It got copied to new drivers just because some
other driver had it.

2. MODULE_ALIAS creates basically ABI - some user-space might depend on
it, so removal might affect user. I think I was not dropping it from the
drivers in cases it would actually drop an alias. I was only dropping
duplicated aliases. That's not the case here, I believe.

3. MODULE_ALIAS scales poor. I believe proper xxx_device_id table is better.

4. But it does not mean that one single line - MODULE_ALIAS - should be
replaced in existing drivers into full-blown ID table. I think I never
proposed such patches for existing drivers. Why? Because if there was no
such need so far, means there were no scalability issues.

5. For new drivers I would propose to use ID table instead of
MODULE_ALIAS, even if it has one entry, because of above scalability.
But that's just my opinion and other person still might prefer might
concise ALIAS.

That's said, considering (4) above, I would not propose such patch. I
agree here with Guenter that you need proper rationale.

Best regards,
Krzysztof


