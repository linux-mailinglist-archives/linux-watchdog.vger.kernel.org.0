Return-Path: <linux-watchdog+bounces-3207-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD9A7C033
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 17:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62B59164C21
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 15:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096631DFD96;
	Fri,  4 Apr 2025 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m33PwzZk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE031DF994;
	Fri,  4 Apr 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779126; cv=none; b=KbfKhArp3zaSeaxxf2pjzAbcMWR2ICCGKW1ljSs4XCXr0/68NwmB5Q63wHnd4HmNr3XqptPEOn2SRO3sXJKp7PBxkKEorBFewImhpp/zcuCrwtwd9Q1p29mI7YcwmqgioNP8SoYJB93G4lYoTVlTXmu9HfEXKxIqE6vXuDt4hGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779126; c=relaxed/simple;
	bh=ZVikniyK7KLkxDPPvHkW2s0CUIidHxkB4zF3yk5s9bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jTwkDFIySK30+0opTWOT4hCNP480n7o9S8/OmQp9XF3RK2EFfOcWZynrQcE6hVdCzrh37AFTSFbksPERnfWc+UtDiVcB5j97hq3v+MetuRCNcYgEh55EO2T6PM1A1On44ek2mZ6dxudM8EgyLZYUYhHN9oxTBT3jJ1mooFk/GZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m33PwzZk; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af50f56b862so1527230a12.1;
        Fri, 04 Apr 2025 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743779124; x=1744383924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ5Y1IYqZCQNIt934R7T8JlinYgk7rnHAWu5l/J9iqA=;
        b=m33PwzZktoTdtVnZ3FWklfqSC3JsWC4Y8rYHPbnKyAzljpGEvy6Qjm7+1axOHnnGxS
         MSHes4ErK/Cg9Q/TGaOgV44KhdFLoLwM74p6yGoD+yRG2d5deu+DnS9mm8HjU3VPCrDb
         Jl539BsUtOH46mbiC8B9EpmlPmwok4kfkYvLGoC7CCAq5501LYMN6S01d2Ah45EnyzRI
         RdzNBtjD5c5wAuQ4pdn/x+/3P+/o1HZpdIVmTiAfzivtNayqX7GON8sEiVUfvR8mqAHj
         HaAxAH2cS+SjScFHo4siOmkdQypkLABva2/y+CL6x2LbEJTsnM0i1akvRYZbprRJeZYr
         +f+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779124; x=1744383924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ5Y1IYqZCQNIt934R7T8JlinYgk7rnHAWu5l/J9iqA=;
        b=MJ8apPJbLjk5JT3mzQeQV9sA5RD78xd+QtxpQNjfrOTRvwGZQr/BtUZo2MbKF6kNbl
         rR4lDU32RiWDm3KQjuSUW4fh9aqNW8+awbNQvSzWikcbpz7U+/MmCtB/RNtWMi4WP8LS
         BfmpJDdTW8//QN8qidohGrkAczTZ2oln791gyiujFaJ2KTIsCUshDJzTlDTNlAttoGPO
         9l414uHIuk8tE16qbHKnC+VM8YitT114iTSxZVTjFCC3LKqRVecj3DajVXHePyUn/3Ko
         9rueAtmLjatEceNaY4Sa0EE0Te1zB6bvsNP8d322/o+kx+F7hXocmE1J2H209Us6M9JF
         fN7g==
X-Forwarded-Encrypted: i=1; AJvYcCVAl2A1wk6e5RV3VOWg7FOMitPxWjG8GKV0EXkV7qy4bw367Q1qmclG4gOnTrbu7CGKq47H7mziM1Jk3AI=@vger.kernel.org, AJvYcCWiKBgo+3y+tTk5WBUsF9qrwJB+NHGdFUVJ63noGfAXYoCBxDhunxh3LsFSk1tI54d+y1/VulXRpdFJA2me40Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ81/uo+P1X7XtGhljAZFmDJ8PV00SxgbS1dy8MJ5zUAvIQ6lc
	LVbD40R3276pR4JMLYhnXfYb3b70IPeqTvwwHKzZTgYEsvd2Oqp6
X-Gm-Gg: ASbGncvmkxuUypw5tp41R6YrITAtOg6LhGDpB0m+yhStQwAlc7L/c1/3mkKejmydBUp
	Gm1sivIPcaOjXmaued1bS2xfWo5SPrw0ebiM5iUYJ4tNaPFA3DF8WBy2zdcm+3k+BjuTwmyyT6T
	SUTJd5KNf77GRoViAKsMvBk+E/rIprWu9JcIEfjXDEZm/sSEF6K1kqwHjJ4Q/YV4qnXVIGiaPNR
	4i0+U4EEXpLzi+rASs68FTFrdhCjz0F69oF1UOUWR04MXLCfw/CmYYMQdItmgPbO0beJPb0P2h/
	O7sjuG8jKsAM5sMgsT57xK+bSY86sW3012SlUkAHIGWOd8ICiXwzfalLZP/WhKYxConDzwSpv+y
	H7DliaMtZENnKGlJ4hA==
X-Google-Smtp-Source: AGHT+IH2lmvWd9cwY/Z1OxTrbMHPloB3DJJBFWnHQ6TwWo3PJJIe4gPU55OnPftbq2VXy9Vn+2PIdg==
X-Received: by 2002:a17:90b:51cd:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-306a492209bmr6234144a91.33.1743779124218;
        Fri, 04 Apr 2025 08:05:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d71a4sm3579106a91.1.2025.04.04.08.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 08:05:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52a36e8e-6df9-4168-b8ad-c04801c3064d@roeck-us.net>
Date: Fri, 4 Apr 2025 08:05:22 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
 <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
 <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/25 05:57, Krzysztof Kozlowski wrote:
> On 04/04/2025 14:49, Guenter Roeck wrote:
>> On 4/4/25 05:39, Krzysztof Kozlowski wrote:
>>> Enabling the compile test should not cause automatic enabling of all
>>> drivers.
>>>
>>
>> Sorry, I seem to be missing something.
>>
>> Isn't that what COMPILE_TEST is all about, that it enables everything ?
> 
> No. Compile test *allows* to compile test, but it does not mean you want
> immediately compile everything. allyesconfig is for everything. Maybe
> you want to compile some subset of drivers.
> 
> BTW, I am aligning with the most frequent pattern (quickly judging), so
> of course I also accept argument that we should revert that other
> pattern and use "default y" everywhere.
> 

NP. We live and learn.

Guenter



