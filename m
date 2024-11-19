Return-Path: <linux-watchdog+bounces-2452-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F8F9D1D47
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2024 02:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6F911F2372D
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Nov 2024 01:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4972E200CB;
	Tue, 19 Nov 2024 01:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkkJPVAW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD02B9A6;
	Tue, 19 Nov 2024 01:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731979671; cv=none; b=EPk8OJL5v10RuiQCIP3ujoLeuVK+QzSeY1+E2eFLvlu57osruncWjKKmO9hVeZUwAQ2f79VuczSbDbayCx9yPwJ9Cs/lUU1Y4ME5ei1A/N+IrDWraUBw2GoQX+kI7Q4VdlxdXBMZYpzdfpmVuuYDwEWy6Ki3vLbRqeMXnI3nfeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731979671; c=relaxed/simple;
	bh=loM8X1kgKqXIkKwQM/QzCn21fOeIsEzaQfGiZtt8bOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0oGPm2JogbHCNZdwA20cXhguzCRW2IepCThmsPvK3ydpPcc+ZePXGSW792ETexh5MGdQpfgahaRw+yzsMWo2daZub/9Q7Lym6KOQO8t4wqJen6V86IbM1+NnY6V888dD9fezlL+9OTqcuJXukdCevHtppSAc6KnASB4XJi+YZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkkJPVAW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20cd76c513cso40512475ad.3;
        Mon, 18 Nov 2024 17:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731979668; x=1732584468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=PkkJPVAWs84thcjG5bqvf1/4rCgzsd1MThcXrAe3TuiJ5L+uSon8YyLErYiJeJ5wRT
         +GWvSggYUUq9FvZHBuI4eHI6tAJcJ7zfR9b0GcA84YFeZlkIM/UPTAStl3JIEI0Swibq
         ROl1CXPuJaCRUMKP/2s/WroAPUtsjvnVF1wo7qgd/NzoVSEP2tM42MeG40pcID3qxdz2
         qXo5n1dEc+zQK/I+NYQL5SD4HwmlCABLz3AQ7taiudkpcnKVy5mykzieFE9B1eoumYfo
         cUEkXq4Dhyv6P+MQ4vBI2L0mqTcKSHSYNao/x3DAkG3nnQPOQsNWtFO3LVIVKoQofq4n
         tutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731979668; x=1732584468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZorpfKuUeGuivvgx/Z+J1Gge5l/P7+qrV0/mMG9I6Q=;
        b=fdcE5skv98bPhGLL06zBqJ8LracpeLVqEo1jqnVWdEH3ZkxsmIq+RuwYix+WFsrMdc
         HM88y+xyVggErrx1/XaeriVZXbum9okxYql9VIdHKticg9UkhamEzrse2BB+PbndpRQ5
         p84WauiDb0ogwJaGO1792YWPdtQmy2FY1LWEN2iE6p9noAVoVLCfm106OwY5dFJcghj1
         9b2Yk7310+tp75wd8bqh0U7BZ5ffcLQRVXO3xadZwnpfuLaN2XvH+iH39oLeKGBTZtpJ
         pb3ll0Owa7hoSKt+EwVwsPFuhV7FbfdPHbFELFT/HdAZR0OqLRNCcWteGWr6cphEhqvk
         RQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUB+2UpHEuGv30aoAGb686vXjCOjltuyUZYBhyEDOePT4EuFs2kBEtm7J3vNO6n0KLhCkQFz+soY0L3bz4=@vger.kernel.org, AJvYcCWgGK79OnkQmDQQIuvE1FfyRpIUadXQvCQj2fi9cck9QWjsIBOyqel0Vtzl7hq/Ew941YprrjWeLtxgxDlVY0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2YLG1frhFmUuwLz3Txd8q6Bz+ByM6bijLsQzsyaM4QXR+YJw
	wKyspfyWD0p7PE9RNRtGIZUw02mQrM6vMXraw6CECgCXAmJlREya
X-Google-Smtp-Source: AGHT+IGVmuyorAWRkpmodzfyjWX00rOtHkl4LsRbCrNu/DpwLEEoRin3/dPBpX0eN9YNURbS8cJqhA==
X-Received: by 2002:a17:902:d4d0:b0:20c:5bdc:c228 with SMTP id d9443c01a7336-211d0d6e7d6mr161345145ad.13.1731979668390;
        Mon, 18 Nov 2024 17:27:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea3394287fsm5682773a91.31.2024.11.18.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:27:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
Date: Mon, 18 Nov 2024 17:27:45 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
 "Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
 "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
 "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>,
 BMC-SW <BMC-SW@aspeedtech.com>,
 "chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/24 15:00, Andrew Jeffery wrote:
> On Mon, 2024-11-18 at 12:50 -0800, Guenter Roeck wrote:
>> On 11/18/24 04:46, Chin-Ting Kuo wrote:
>>> Hi Guenter,
>>>
>>> Thanks for the reply.
>>>
>>>> -----Original Message-----
>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
>>>> Roeck
>>>> Sent: Friday, November 8, 2024 10:08 PM
>>>> Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus
>>>> handling
>>>>
>>>> On 11/7/24 21:42, Chin-Ting Kuo wrote:
>>>>
>>>>> But now, I think it will be better to add a patch for creating
>>>>> a new
>>>>> reset reason, e.g., WDIOF_REBOOT or WDIOF_RESTART, in
>>>>> watchdog.h of
>>>>> uapi. Can I include this change, creating a new reset reason,
>>>>> in this
>>>>> patch series? Or, should I create an extra new patch series for
>>>>> this
>>>>> purpose?
>>>>>
>>>>
>>>> This is a UAPI change. That is a major change. It needs to be
>>>> discussed
>>>> separately, on its own, and can not be sneaked in like this.
>>>>
>>>
>>> Agree. However, how to trigger this discussion? Can I just send a
>>> new
>>> patch separately with only this UAPI modification? This is the
>>> first time
>>> I change such common source code.
>>>
>>
>> Yes. That needs to include arguments explaining why this specific new
>> flag
>> even adds value. I for my part don't immediately see that value.
> 
> So maybe I was derailed with my WDIOF_REBOOT suggestion by the proposal
> to repurpose WDIOF_EXTERN1 to indicate a regular reboot. I still don't
> think repurposing WDIOF_EXTERN1 is the right direction. But, perhaps
> the thing to do for a regular reboot is to not set any reason flags at
> all? It just depends on whether we're wanting to separate a cold boot
> from a reboot (as they _may_ behave differently on Aspeed hardware), as
> on a cold boot we wouldn't set any reason flags either.
> 


Thew point here is that this is just a warm reboot which happens to use
the watchdog as vehicle trigger a reset. A UAPI change along that line
would tell the user just that, and I don't see the value in it.

FWIW, the only really valuable flag is WDIOF_CARDRESET. All others are
at best misleading since the watchdog isn't typically involved in
making policy decisions such as WDIOF_OVERHEAT or WDIOF_FANFAULT and thus
can not report such reasons to userspace.

Unfortunately we can at best deprecate all those existing flags. At the same
time I really don't want to introduce new ones unless they provide real value.
While it might be valuable to know if a reboot was a cold or a warm reboot,
the watchdog subsystem is not involved in this either on almost all
platforms, meaning userspace can not really rely on it. Yes, Aspeed
hardware may behave differently, but typically all those differences
would need to be handled in the kernel when (re-)initializing the hardware,
not in userspace.

So, again, what exactly would userspace do with the information that this
was a watchdog triggered warm reboot ? Why would it need that information ?

Thanks,
Guenter


