Return-Path: <linux-watchdog+bounces-2927-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DC6A33F07
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 13:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BB3166AB3
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 12:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ABE210F45;
	Thu, 13 Feb 2025 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMEAx18I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C44227EB4;
	Thu, 13 Feb 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449470; cv=none; b=PxkHey1MqTbeAdM2qOKvQLmnF81By4SFpOIaYqLXsy3PcrkAmpVwvWSgq/qgJJbnKMDI/nMNsHDeGCtWsWsmdfsfwbzJY5VeREy8jHFPoOp0IVVjBxxmnyYNANgpurvwhi7O2m0Ji8rMzcmgctH1lbPCcafJMi5G76VmUjv10M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449470; c=relaxed/simple;
	bh=XAEgFDTKr/1cUxv9k3A+gALh2vtE06UxWY3X14A4KMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwQtgDfLEvhFfezZtBqDmwFXtjfhiavh/6NzMNAsaO+XXehKUFXT1BAwSqLZmg9NqvfzJS3C1qSOi1Ga28/z8h39qh7m4K+sY5V9gobCo135fHeRTDjv3zBSLSTBNy65LF2Fm/dMI+2ZbopAb4dCJAqKHgzl9zaFmOoxHISSfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMEAx18I; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c92c857aso12724025ad.0;
        Thu, 13 Feb 2025 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739449468; x=1740054268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sAc/4CdH/FMRJoZOCAi+3om244SgG2X6fllrDyJixhg=;
        b=jMEAx18I7sZ3R9Np2OY3RJIOxZ4Qpl0ytnSSzkb9/MJ/QzDyk/qJDdcoHFt2C8xqcX
         JED82ANqrLWL+n81n3tw5qweBvcyTfFfPPSlN4GkpcBgJLR5Kegsmu8r60l3m5yecL92
         5K5aXuTnDr0k9X9541C4uMic3Y7NCA0IzlmKjtuCCYUSYH4njzGyXi/Jk3AAAg/PZ+Vv
         wu+XOvjFfp6QA2L+gOo+NW5ltrZvI3KLSSmMDzJyVOsAmEahWcr2pVgM5Z9vzoglGpag
         FgtqCfbjAFhUngG6XWdfAb2jpNyIJVneRB3C6PwSACZpLoMDiHEnJAPXao5Pnm2qNEdG
         wKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739449468; x=1740054268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAc/4CdH/FMRJoZOCAi+3om244SgG2X6fllrDyJixhg=;
        b=nb+yF60CKDfzKBYEVdnMiIoKpDH+dFRYdGWzt8WS1F57R0EklM5DmyixFbuQ0GwE/U
         fGOQUCISHRxxRqwFqEkTfDV7BFluc32ojWh0BeHUL6hNtoWQ5rTiyQ55zq+CbehsVaRj
         1XCwdLhjroS5iDaZltuuUUrk66ILzVSDDTLVRs2bF2ar7eRHC8+YeBj/s3qtI/3HSGUW
         fxdM3nD2AQBio8F7ecBWsqqmCnVi8iHIHonlxLGGuLl+HytFR0O9XWZVr51ycikeS09A
         rt9R2orloFAN5i5g+gvSrnkyEff1DJ9Q0f/Nzk+2FSS+ob3vbGcAmFwluaa/QpIt4L2r
         y3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWJG6t/0T+0aK4q224OtL0PjY0PQsiZ5Ca5flXZBbVlFFsie0m7RjZRveFuOOIzMyiNyQbiLKKqKdDS/zY=@vger.kernel.org, AJvYcCX8mCYqWi6mlqco9bSdDND89afBhx8KJE6Py0aUpB/Q+hg/RQHWdbPbfhqMhsRts2MzPeKL0RozN493w1cuhJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFsenFQ00zzHCxj9+t+skYKlN7aZoT0e566tHX0qXdlp2VzwA
	A2SAx3od0BbYReWpfC0hYlJoJaI5Nn8JfDbmBSj7sw9nE7aplbPU
X-Gm-Gg: ASbGncu8oiK7uRbYxE8XMviUMUhDxCKlw8jd6DNZEgGXiQB2bE3vx29NBC0152FQzB3
	fOKukqPIU+MD/6VrTFvik+nBD0kOVyiFpGR05PywkqHEfCXUEOqVXik9/ymbTW47g6rL5SfXccv
	VPkCbAAa2KXsFFzQ3zlQNifx/qz9bqdThLPoI6q1EXdCcH0YY0RVn/hdWUd/pBDqOASWRL91z8h
	0A/3+gX6y+7lh5gJ5HIh7Rx+/n292EF6WhVzOpHNnGZl0u6Ohd0Nc+qip/BCbLnnFDsEwv/G5Ai
	6ofn38Wok90nq4XOUWaxRvc6xKR70Y5SXEpHs4ZsBaNbwQGrMv4vWNroV892qNxF
X-Google-Smtp-Source: AGHT+IEagc76DBLFhmr+j/iksmjWFGMx98hwyyzGQic6pF4+F8aKCG0je7XiwSyj8URUHMQgBkJuqQ==
X-Received: by 2002:a17:903:189:b0:21f:6022:c269 with SMTP id d9443c01a7336-220d33ff215mr38587335ad.9.1739449468200;
        Thu, 13 Feb 2025 04:24:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220e0232190sm7754295ad.186.2025.02.13.04.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 04:24:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d94a8e53-41e4-40b9-aac4-0041ad5db9af@roeck-us.net>
Date: Thu, 13 Feb 2025 04:24:25 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/31] watchdog: Switch to use hrtimer_setup()
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <cover.1738746821.git.namcao@linutronix.de>
 <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>
 <882031d8-5b8b-455c-9f5e-90090408304e@roeck-us.net> <874j0yksc8.ffs@tglx>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <874j0yksc8.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/25 03:16, Thomas Gleixner wrote:
> On Tue, Feb 11 2025 at 08:16, Guenter Roeck wrote:
>> On Wed, Feb 05, 2025 at 11:39:07AM +0100, Nam Cao wrote:
>>> hrtimer_setup() takes the callback function pointer as argument and
>>> initializes the timer completely.
>>>
>>> Replace hrtimer_init() and the open coded initialization of
>>> hrtimer::function with the new setup mechanism.
>>>
>>> Patch was created by using Coccinelle.
>>>
>>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: linux-watchdog@vger.kernel.org
>>> ---
>>
>> Change log missing.
> 
> I read the above as a change log, but _I_ might be missing something.
> 

I have no idea what changed since v1 or why. If you can see that
in the patch description, good for you.

Guenter


