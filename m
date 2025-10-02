Return-Path: <linux-watchdog+bounces-4308-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C4CBB50F1
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 21:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABFD04260AC
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 19:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E172874FE;
	Thu,  2 Oct 2025 19:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReUG+xJ0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A11950276
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759434997; cv=none; b=lu7nSNhT7qta3+RTDUUq6WiUgK3T5SrarqtzaoASmns7cHK+1qYLjOHiD9QuHjwifVK1bWmMNEs0QQbSSe42h1hG9rsTbyJhW+NxIITZ08TJyWk7LTWWL5EBX+kvaawUgVgKAHFxdvPO3bqQZWYQ5sGJRZNHAkcGDLquE88cLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759434997; c=relaxed/simple;
	bh=Nw968j4fVw9vYVzTHd9iNO/A3GEzX9jdXgSw+z6Xzms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRR06DDzPZH0zBPZlUb0DaM+PWr64LfQwUVFWBnU8yY1WVmHvGS/3HpqV2Ar82U+0IiPUoZvW1bU619uIv0ExH/dK1u2lQy/aXu8fDuUxlJg41IMnWw0GrGGZxtTcXGf4ft47vXIFfuI+6imYw+KEadUTZc+mbJ3u8pCufc7CyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReUG+xJ0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-273a0aeed57so30020105ad.1
        for <linux-watchdog@vger.kernel.org>; Thu, 02 Oct 2025 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759434995; x=1760039795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nPfU2wP0cjDISP9HounFnZh8b9McBUGeb5L7OBClIh4=;
        b=ReUG+xJ0X64PRLNJOAvwYM6JzWhLf5PGofTEjK0OstKowcToPwRYdFFXA/lTgzZ9q1
         r/QwqB+MjwSOaRyiMFF2iVP9l9eZ0r+Q9dTj0Bt6rBDrUcsNyXyd6bnmPSeQ/zWW3Q54
         nzPTsPU/4W/I8pKmha3SN5UszdIraLtqP83eCscL/kfVtcNPRB/RsPnC9wMK9OY07WoF
         ah2kT+zAt1waXe2+lH91cc5gpEfC69/n8RetqRlyd++5N83nEeauJjtS96eEYQqNkY6s
         6lkG0/yKInnnQVhdeMi5daUw8e4VJpv2jlmdLAb8bHGaI//OIc6Or61C9Cm303tMlYLW
         Lk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759434995; x=1760039795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPfU2wP0cjDISP9HounFnZh8b9McBUGeb5L7OBClIh4=;
        b=cUuFq7AWjZXtGRpofSRovzV963JbxgdTTm1dF78YxmaIy0oJR4d0+5QikOBWoRihMT
         72a/oWYEx1QiTzn2X/dcyg4d/wQafkx20XUBQsmc27JJxuwIsJOLIw54QgmqizX3eaxj
         JXgj9rc78YYLkPUODmHEuureFzjpjekvodzdI6acCwQOWdQEaF2hwFBbvLhQlZxtXvuy
         qxvtQgcCOTQISQiSONduTD0mjoWVe8uhaGvW5bdCoHI9QxZ2OvkzYbcMxVy2Ng9AhZnp
         u/fDwv66Z4Wa89V1lkGc+0WowXbD8mEwEZ+BQL1Nc7TntqDuoGhn8i2PJO0MAS13uJD8
         f8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUQxiZs97hpoqPC5jOWRzXDec70b7/CtVVWn2r/bTk0uvDZ8pbkrhUiFEgJAo+0UwR01ta6p/vbQjLDU+Xw9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJK88bZxcR9s+GpCOojEi+V9jlfLRFEIasWi7fLpPcv6ijPE6k
	Rnc2ssQWygN3Cy/IbYjclOBPTPJb4VhZN6XXfWRZOHxuP3f+1cQeb316
X-Gm-Gg: ASbGncuYBHJhosji9zbi86lyxuahc5D18gyrAmxVsUPPeyt0wuZWWum9mBuHK1/FAHJ
	Al5VakyCEXqnMS0K8i8eYiLpyUL8mca8L39jnCV+osPYbrw2WVkh0TAwG3Wg4vrFPYXn15I0V/I
	brYqo4vQjnKeiwnRtqcLbGNJFQmz3MSnpmtOfarluJrLSA8xehWuG5jZrw3xLX6Biljvu75DHqF
	Vap5M4ty2zDikKTVJJt2kaz6DokdhdI0zFDhrSOQ7TI1X27979htfVSjedbbAJBdLiK0gArltoG
	OJ6u8r/kqO/YKI+eA0hvhaYcjFZvNCewjfXl36aJS7ngFcOuqPP8/D2MHRoRHjqVl4bY4+PLeZn
	1FeU/C5AbwcgInUbOkQxsjXi14CFLB7ZdrTIKyyQHgWzHr7etlVP7smI9c74Y8GqYOzr56/Ppzv
	x1b7SK7r8Ybmv0QwImS2w=
X-Google-Smtp-Source: AGHT+IFxLnDbrfHfgxc2fhIQ2H16KPappOPJbbqwiPQ4IGIXOdT/JiNMNX6A0/uAZF74UfqoQV+NwA==
X-Received: by 2002:a17:902:d541:b0:269:b2e5:900d with SMTP id d9443c01a7336-28e99bac56bmr8073275ad.5.1759434995488;
        Thu, 02 Oct 2025 12:56:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110995sm28954425ad.3.2025.10.02.12.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 12:56:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <413fcd0a-3805-4a47-8bee-b8dcf1bc87eb@roeck-us.net>
Date: Thu, 2 Oct 2025 12:56:32 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
 <20250926112218.28723-5-wsa+renesas@sang-engineering.com>
 <CA+V-a8tqOBz2i_7Nny488syuSXGBhe1japjX47hkN6_Ejge1ZQ@mail.gmail.com>
 <aN5m2TltHzdBQDLT@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aN5m2TltHzdBQDLT@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/25 04:49, Wolfram Sang wrote:
> Hi Prabhakar,
> 
>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Thanks for the fast and detailed reviews! From a glimpse, all your
> comments make perfect sense to me, so I will send a v2 soon.
> 

Please keep my code review tag when sending v2.

Thanks,
Guenter


