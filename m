Return-Path: <linux-watchdog+bounces-1111-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2D8FFF60
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 11:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 861ED1F22C08
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 09:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB115B552;
	Fri,  7 Jun 2024 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deU+NLr/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD215B971;
	Fri,  7 Jun 2024 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752347; cv=none; b=a0+1ECTj1U9K+iQ3fpid0mXRSZxbOoszzGPT4aSpTz1Gwu1lyzkw5nr0bYMQSB/Ms+wfcyXQNxs4KKMJukcAq1N99kOcTdGe/evgL8Wl3rfSRXCdW0ODv3XyAVq/pcy5zF5bte2d7ZZiAe28DTmbAJzCpnvXpxni0XU9VUZz1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752347; c=relaxed/simple;
	bh=jBF5v5BVUZ5p9KI5K2L/2p0DPNYB2/IgznDp8NAAQso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USNyWfmSVboWQspH/tmkjQchMEAjaQpBJ0kZZjElD7+A5sfzWUXbZnI+4RQ77MFXIL1prnCpfr7q8YcPAButbbiBCDbgC6y4sf+GXLh88vLgv70GvLXH564ZIOr29e7+4LzxIgZuU9a0eIa5GW5Haa8A5HBWlVCadyjxlQqr658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deU+NLr/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc1acb9f0so168410e87.2;
        Fri, 07 Jun 2024 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717752344; x=1718357144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9ASv3z6aW5Usf95w5T/QMJgunpGdnmwRFnN/fLCNTU=;
        b=deU+NLr/yjiInjyDb6oaUP80Fk0ls8Y6UVR3hX2PL+fMqSXye86Fl+7QVfUNcGuSgD
         2Wm7vMMe8MJKiQW5HljJWotfQzK0VyQ62jmlkr3mEkI5EOH8IHXLXJ30YArtGGhBfS8D
         lOhk5L9TqISv3Uz3S4kY8ON5zO9wq63eB4rEcdpIZ3f2imj32Kr2hR76khWCIGeO7L6K
         F17OvbNCcgsPgwujiGQk/qLbzTpYovwg4t3/S0MCNYeWhB5V39Jc6o93tsTYPvbFqCR3
         QBYViquj+KuPqOErQxwMmOJJIVd4estQatSDid9z5WJcSrVQV6C5MVHqG27BrcWktmYS
         UqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717752344; x=1718357144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9ASv3z6aW5Usf95w5T/QMJgunpGdnmwRFnN/fLCNTU=;
        b=j0La0XztGCrAEOc0w6Z3Oyx3ROpII85gPavKUhJFs9eWN5D8keacu7dn3k2Z9JZVHn
         nj2HoO52nUJUMhSpR9Wne/yVNLReLsjRjPQ/my/62zqF0wNGoMnuFAN31pmYSSfz3Tbo
         d+ugi9jsRqp3iZ95lqqNbA6DflptCJ6meXSVXImhcZLzJI2glVJH1XncScT0WR1SljLv
         O4s1nx6bY8eW/PI/+deIPtM8loewMYOAmusVE8R4KAPxmaWCm1D8yEvIHU9/yUzbLCxb
         qs6EpJ2lHKhbz8lG4ERPnhM1a96RwMa6TEUdBXtZI5kd+trNjVwl/HgYMmIL8om5AfFJ
         VtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWBUQi/xgmfOiWhZvCX2MZyXRI0nW1si9h9nJ794NcikCm5drosoH43H+Mcu1Ufdx0b4nMorLXZUfDiTRERjquA6YEGNpEOfTVg0tr/eXdIJj4TtaSs6WwsWKEi1QYpe8lbmRQs70GQDJBsdkwJHJugmnOOQf+Xq2N97rcBfqcC3MUHu0Bb/Nn
X-Gm-Message-State: AOJu0YzwG+QSOt0j0b+uoYO26+8573EvSTIRx4D1NBvpRc3CWz9+HbeU
	IBUFfs7iBtDQsYi81bfAMKcREBakS5FtdJPkUEPvHMpH3w9I5euw
X-Google-Smtp-Source: AGHT+IHKQ6Tg3i4tZtYYKEcILbfowk8mCAyKD5fX55Ig/BQHMi2kBGlPe3r2yp8QXxeaMn+lmkOD2Q==
X-Received: by 2002:a05:6512:3f03:b0:526:f4bc:beeb with SMTP id 2adb3069b0e04-52bb9f84612mr1662158e87.32.1717752343388;
        Fri, 07 Jun 2024 02:25:43 -0700 (PDT)
Received: from [172.16.183.82] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433d081sm464074e87.278.2024.06.07.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 02:25:42 -0700 (PDT)
Message-ID: <b4fe1689-4d29-475c-89b9-4bb5c4c1b2aa@gmail.com>
Date: Fri, 7 Jun 2024 12:25:41 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
 <87plst28yk.ffs@tglx> <045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
 <20240607101356.3ede2a17@bootlin.com>
 <b2b31803-44ff-462b-bc1a-6b1ffa93bdf0@gmail.com>
 <20240607112325.27e23671@bootlin.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240607112325.27e23671@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/24 12:23, Herve Codina wrote:
> On Fri, 7 Jun 2024 11:49:07 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 6/7/24 11:13, Herve Codina wrote:
>>> Hi Matti,
>>>
>>> On Fri, 7 Jun 2024 09:38:31 +0300
>>> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>>>
>>> ...
>>>    
>>>> Herve, do you have any idea when you plan to do further sketching on
>>>> this? Do you want me to try seeing if I can add the struct
>>>> irq_domain_info and maybe use that in the __irq_domain_add() to get the
>>>> name-suffix added? I might be able to send one version out during next
>>>> week - but then I plan to be offline for couple of weeks ... so it may
>>>> be I am not much of a help here.
>>>>   
>>>
>>> On my side, I plan to work on it next week too.
>>> If you are off a couple of weeks after, I think I can start and move forward
>>> on this topic.
>>
>> Thanks for the prompt reply and thanks for working with this :) I'll
>> leave it to you for now then, as I don't think it makes much sense to
>> intentionally do conflicting changes. I'll see what you've been up to
>> when I return to the keyboard :) I'd appreciated if you added me to CC
>> when sending the irqdomain refactoring patches (but I can dig them up if
>> you don't).
> 
> Sure, you will CC you.

Thanks!

> Also, I am not sure that I will perfectly take into account your use-case
> but it should not be a big deal to add it on top of my commits afterwards.

No problem! That's just fine :)


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


