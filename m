Return-Path: <linux-watchdog+bounces-3204-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D318A7BD17
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 15:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C179179505
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 12:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95171DC1A7;
	Fri,  4 Apr 2025 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlGqni+A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053ED1E7640
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Apr 2025 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771571; cv=none; b=DMWDzgLJzUdq/LMpgMMzogj9tn4N80v3QLcM4x5p/ez66WIPnN6qN3XzdEu/PtLUgDJeYoT8JzR8+S4yipmfBBd1Sv81F7ItAhYC6/F9XNjWRUgSrO7zeyO6Xq157ZudRRXRQRQKWnNWfB42mN8b+YBppv9bk6XIHEkb9iL65mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771571; c=relaxed/simple;
	bh=kE3NpLXcAhKDrouxuIdErti4eFQEij/aA0GPYtPCqXE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=X0rNYTe5X4YMYIxVZ3ypAD8mtb+E6FzDDwKL7Peod0qccEdnpcE3V+QQSpCweUEwNmexi2PYopemHMBnmWQYiQFCSUcxU8YhbL0aAFuOQHftUNRJ98b6hM2BnYBtBCqlp4h/5jsidxbI721UNs1r8Wzs8bpGpt/GFkGNmsdL3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlGqni+A; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1668415e9.2
        for <linux-watchdog@vger.kernel.org>; Fri, 04 Apr 2025 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743771568; x=1744376368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=peai6JkVMYY7lakrEi3u+WbVvVIrypT8y/AorA5z5gY=;
        b=BlGqni+ABKLxqad68cbFVELRRwBl/tdTPewxwDfBk8qWV5jm6zKZzbnL5RHJQeh1Ku
         tDQYK2tDBOMNXvJOqPxO7TyFuHn1kxkBdwLBADIXzwBbTIlGdvKfZOE/FktdP2EU86Cn
         ZPehG1v5DrzQ71KGy1LZmdTNu2jzHJfmp0hOXueXFAlaVeiD2gFiQ280ylXU2Vigiq3w
         8sqjAIfXC/OzVPSf9H0Qzsg2oon5oLCShF3Hm5zd7c9w8G9x+DmxaGa+vAXOtGGwNnoI
         kMl/vTylvi0Md48Qo4cOdaKr32SMSk3kSyhBeMykq9PskRG/vUD4OPpxTci6Ave23w8p
         jwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771568; x=1744376368;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peai6JkVMYY7lakrEi3u+WbVvVIrypT8y/AorA5z5gY=;
        b=NUMnsycqgIQ90nKyAc3BhPLNjwz4tH33Bn2HCioGOjzn3p82vtv4Q2/iwkrtrjBNQl
         Xj4gOvQFTaA+tkq0VWBlXLdPV3uWksiedGNyDS7Xlemq6sjjb78HOiNjiiJ0EoBeTqoj
         fPGxMxIHWBsZPUC4hNwvBRkstQ0WLo4TARNYvUsmXG2l3FGGC4+zRqdQ2W5gT8ayjmn+
         XJ69+E0s3sqEJfIRFVG8MdviYal9XEnOxtXYkU+F5yspGod/C/pUJwX9Jvb1YyF4bxAz
         EcwqSwOMk61BfV0BJZPwrbRWBT1FCZC/MFqhpNz3RmDb0+nlnITJKyzx1QW3C3pV8XnD
         y6/A==
X-Forwarded-Encrypted: i=1; AJvYcCXe+kM56lKs0TdMMt/7hAcVxGCHZuZgcDuyQh86SUrWGYMr0YMF/VtLvUivqxUHhBUIVaqK1/zoToUAvKYx9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9Fzo1NrugqIAn++9EkwVGaLhcj4p1qEbG8pjP7AdRtoVdtoA
	ZlpOMCt5u+8eAIX1lemKXOvU6M4lVdoSos4xDtTzBdz/69TMlwUTmKaF9CyM5UE=
X-Gm-Gg: ASbGncvpnbgu3Eep950084FT0MyHGafVYzAN96xNIOFgaRW5o6XcJ2P0Ugl5S1cnp2F
	fuVr0QlB7+wPzAiEsybKtfV8WI2DPIkn8OzG6zV77+O5ksdS9MjXDHHxo6+lBgNtJf2hiGkQcmH
	koU5AK6Dea0A6phsgb23J+ctHkeOkxuJEpe7HrFZOLFRQX3YXeZHLXZ0wjZ08DNlavEyqwrZ8bL
	NhZv9MiHZzT65EDikXyiIVfz51Lbr+hQy1V2tY6PiONSrf4zn/+6A/aMBI1oWmjX0vGJFivjXSR
	G4BaNRSjcPzkfM/r4IaHciomLPV+h3ig/o0fLNsEOgS7gkCcW7q5D7CaNVAyHRVk
X-Google-Smtp-Source: AGHT+IFf0uNr8Eq9ADXBjwgbRjZ/26sTKnwO661Ft4qDLwqkO93kLd+WI49vCdH3eGbScEIxGEd/BQ==
X-Received: by 2002:a05:600c:3b17:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-43ecf9c6102mr10187705e9.4.1743771568235;
        Fri, 04 Apr 2025 05:59:28 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm45466885e9.39.2025.04.04.05.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:59:27 -0700 (PDT)
Message-ID: <05d96c93-f9a8-42ea-9c11-2d38a7dffff7@linaro.org>
Date: Fri, 4 Apr 2025 14:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
 <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
 <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 14:57, Krzysztof Kozlowski wrote:
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

+Cc Arnd,

I also dug out old recommendation from Arnd (so I am not making this
stuff up):

https://lore.kernel.org/lkml/CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com/

Best regards,
Krzysztof

