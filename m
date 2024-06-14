Return-Path: <linux-watchdog+bounces-1124-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89290859E
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 10:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7841F2599D
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 08:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6596E184115;
	Fri, 14 Jun 2024 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCr1D3bl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A61836D3;
	Fri, 14 Jun 2024 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352119; cv=none; b=fqswiTahEcZBDY58/iJNYIMzh9nBeLh2dv7/gsoH7Fy5KuhFb+bhJLoYpHAwnYtU9b3Ksh9dxgTxl6je8/HJBrQddgAZVZhLw2cEoguBBAuy/IdVrUcWQY25iIui5iJXJFS7e2uuglCK2rCYsNzzn84ceufrZXNI/LfFt/NR5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352119; c=relaxed/simple;
	bh=DNloJkCpugxMgXOsQecfvd48tcZUcJDPFTN7cPrQP6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swywsZChJkRZch7muze5C9flZZLfgIwEcLH8grwJs2ktjlqnHh4y7n3tp6DEGi3Ke607izNgUyh/MUj0HN3hm8Jfe9Uqzns6Afht17SaBU7U/9/BVkDAE6hWBw1eI7eNdnJEddQuWdkJFKMHx2Z97ba00GlsVaAFffBFPeODDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCr1D3bl; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso2017293e87.0;
        Fri, 14 Jun 2024 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718352115; x=1718956915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nRWFYP2PnBSqJKVpviuIt+bkDMabc8LZej0hybvhqgM=;
        b=HCr1D3blzIZOzlhk/hSdEwNlX9awu1hh9OCk9cLfVpGMDqB+OnC8QjL1VnZSWz5S7G
         Cf40xXrHtyBCKSpsNXOZBCRzdIcX8pqgTgJ8G2BTsV2V67/znFFNibnFEf+3wtBTHUFX
         dOWf5or6sE4PwiXVWVtVBCuABoO+aNU690yZZLTy1mHBt73a3iJFxOTSrVdn0ESz+ji9
         f81dweD1eHeqVBbCq8m3zVpE5JQuYFbcotaV5pAxTwRtJCSsTmyxQ2fdukcnbzMC/sbY
         aeldG+1b2Qhk0gnAS5rYrQ1OICPzBDh3RLihrMKOXowYpnsgf2AUCPa+PofyQ9J3OEl5
         AwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718352115; x=1718956915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRWFYP2PnBSqJKVpviuIt+bkDMabc8LZej0hybvhqgM=;
        b=xHKEKQ/FKDgmOPS3UDxvZ0/uKNepBJ78paw2ZGCYGEC2lfj9Mu/UofT8ThjPpQgUup
         7nU22B1AVfYxGMn3JRekJnsqHVfxrEA4pok210irWiGYgKPOh/ImpnyO8oasXO11fZa+
         TvHb9WzOvARJehJtn+vVQQbLKLa1E6KdU4tmMqIJSo5s3+mZ6rGmnAqoO1wxDxg4Zjxc
         QCFYjP3fQEJFpIbpi5hks8uap53TMUrncM5g4aWP2XtAHukYDjFthqXX1bSuXrLpbuEw
         PRAoaPX+t2Mwb0UCuXivTbdufXGmI1WD5ffDQid3p/oQWY0GcKHHgMa0AcR7e67WVArL
         FrGg==
X-Forwarded-Encrypted: i=1; AJvYcCUH3kmfgPgfECDjOmYcwnKGQ0FeqNgiJh88oMizGkho6LsJwnN6vGKz47YFluQpPTzm3qdu5trdd90uGZ19yNwMDObOdpMsf6YDOIK1qouzp819r2RvYdedRaoKqTY8idD8DqppS02L2k1j/ZA63x4Iye+vHCzJSy7IEEptVU+Ib/Xl0t92jlHU
X-Gm-Message-State: AOJu0YyTwoakUiUMQ5aPbZ40H1oUwUyyrnz2V5auMoWyx7foZhFVpfx6
	JRXpdmHXtOBNAp9XM7/0HtmxiKrVlGQaHyuIy+b5/ubINK3YjT56
X-Google-Smtp-Source: AGHT+IHeEQOR6VcQjY6/3rKRzLVKAle1CSEVGl/XgpzmI8h208I/SEeUoNN5Pd4iU+qdGlaKkbLESA==
X-Received: by 2002:a05:6512:1319:b0:52c:845e:3194 with SMTP id 2adb3069b0e04-52ca6e6d4b3mr1398030e87.29.1718352114995;
        Fri, 14 Jun 2024 01:01:54 -0700 (PDT)
Received: from [172.16.183.82] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282ee91sm437317e87.105.2024.06.14.01.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 01:01:54 -0700 (PDT)
Message-ID: <b585d817-da4d-45b1-87b5-2cfdc8b8823b@gmail.com>
Date: Fri, 14 Jun 2024 11:01:52 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] mfd: bd96801: Add ERRB IRQ
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Thomas Gleixner <tglx@linutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
 <20240613163249.GN2561462@google.com>
 <21a468c2-7d8f-459a-a5a9-53d8694c3f38@gmail.com>
 <20240614075004.GB2561462@google.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240614075004.GB2561462@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/14/24 10:50, Lee Jones wrote:
> On Fri, 14 Jun 2024, Matti Vaittinen wrote:
> 
>> On 6/13/24 19:32, Lee Jones wrote:
>>> On Tue, 04 Jun 2024, Matti Vaittinen wrote:
>>>
>>>> The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
>>>> handling can in many cases be omitted because it is used to inform fatal
>>>> IRQs, which usually kill the power from the SOC.
>>>>
>>>> There may however be use-cases where the SOC has a 'back-up' emergency
>>>> power source which allows some very short time of operation to try to
>>>> gracefully shut down sensitive hardware. Furthermore, it is possible the
>>>> processor controlling the PMIC is not powered by the PMIC. In such cases
>>>> handling the ERRB IRQs may be beneficial.
>>>>
>>>> Add support for ERRB IRQs.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>> ---
>>>> Revision history:
>>>> v2 =>:
>>>> 	- No changes
>>>> v1 => v2:
>>>> 	- New patch
>>>> ---
>>>>    drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
>>>>    1 file changed, 253 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
>>>> index 1c2a9591be7b..b7f073318873 100644
>>>> --- a/drivers/mfd/rohm-bd96801.c
>>>> +++ b/drivers/mfd/rohm-bd96801.c
>>>> @@ -5,13 +5,9 @@
>>>>     * ROHM BD96801 PMIC driver
>>>>     *
>>>>     * This version of the "BD86801 scalable PMIC"'s driver supports only very
>>>> - * basic set of the PMIC features. Most notably, there is no support for
>>>> - * the ERRB interrupt and the configurations which should be done when the
>>>> - * PMIC is in STBY mode.
>>>> - *
>>>> - * Supporting the ERRB interrupt would require dropping the regmap-IRQ
>>>> - * usage or working around (or accepting a presense of) a naming conflict
>>>> - * in debugFS IRQs.
>>>
>>> Why bother adding all that blurb in the first place?
>>
>> Because, I assume there are users who would like to have the ERRB in use.
>> The main purpose of this comment is that any such users could
>> 	a) see this version does not support ERRB.
>> 	b) can find the original RFC with ERRB supportn and a workaround.
>> 	c) know why this version does not work with ERRB and thus fix this
>>
>> It seems this ERRB support may be missing from upstream for a while, hence I
>> think having this note is worthy until (if) this ERRB patch lands in
>> upstream.
> 
> What I mean is - you're adding all of these extra lines in patch 3 and
> removing them in patch 9.
> 

True. This is because I had a feeling the irqdomain changes might not 
get merged that fast as it seemed like something that is not completely 
trivial. This comment is useful if patches 7-10 aren't merged together 
with 1-6 - which I now also hope is the case XD

>>>> + * basic set of the PMIC features.
>>>> + * Most notably, there is no support for the configurations which should
>>>> + * be done when the PMIC is in STBY mode.
>>>>     *
>>>>     * Being able to reliably do the configurations like changing the
>>>>     * regulator safety limits (like limits for the over/under -voltages, over
>>>> @@ -23,16 +19,14 @@
>>>>     * be the need to configure these safety limits. Hence it's not simple to
>>>>     * come up with a generic solution.
>>>>     *
>>>> - * Users who require the ERRB handling and STBY state configurations can
>>>> - * have a look at the original RFC:
>>>> + * Users who require the STBY state configurations can  have a look at the
>>>> + * original RFC:
>>>>     * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.com/
>>>> - * which implements a workaround to debugFS naming conflict and some of
>>>> - * the safety limit configurations - but leaves the state change handling
>>>> - * and synchronization to be implemented.
>>>> + * which implements some of the safety limit configurations - but leaves the
>>>> + * state change handling and synchronization to be implemented.
>>>>     *
>>>>     * It would be great to hear (and receive a patch!) if you implement the
>>>> - * STBY configuration support or a proper fix to the debugFS naming
>>>> - * conflict in your downstream driver ;)
>>>> + * STBY configuration support or a proper fix in your downstream driver ;)
>>>>     */
>>
>> ...
>>
>> Thanks for comments Lee. Reworking this will have to wait for the irqdomain
>> name suffix, which I will continue after Hervé has done his part of the
>> irqdomain changes. I will omit this patch from the next re-spin of the
>> series.
> 
> I'm in no rush. :)

Well, glad to hear ;) I still usually try to avoid delaying sending the 
follow-up patches. I am under impression it is easier to review the new 
revision if the previous revision was not reviewed too long ago... ;)

I feel it is polite to tell the reviewers there will be some delay when 
I know it.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


