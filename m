Return-Path: <linux-watchdog+bounces-2707-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C66EDA111C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 21:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A363A24CF
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2025 20:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579EF207A2F;
	Tue, 14 Jan 2025 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNF2WXM5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F41B87EF;
	Tue, 14 Jan 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736885833; cv=none; b=QmMCvNHQ5km/VZsAyKKunzmdE5mRc0+GnyHSLFZzkQIjvm7iDTs0790NagSVx1kQJy6z+hBy78nrwrhWelfT0z15zJcYA8lYo5XusXDyTd6UhjXuC2S/t3xJdtRsMHLvS3oXfCg4c8sGxMuKIieSMYtJwqIWr4e/WgWXvNss9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736885833; c=relaxed/simple;
	bh=EqT2WkfiWKDM8H5RoBWwCLtNbl8tn/ggaWmxk2u4YDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrlq0ebMdrCNqNViqzLmFnl503a+uqUjAqKle+mNT4QSJH+Ipax7SP8MDF+regQ5VVWdY+Z6HA/7ty6lB2DhFp5UAS2IH8Qq1xqS7A89uT5uSKEKj1ooiSGB68VZd/Noo8DNqPCXp4boMQfTYWuO5S8kl4epsT3Y5ln+/Ic4EeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNF2WXM5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21a7ed0155cso103065765ad.3;
        Tue, 14 Jan 2025 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885831; x=1737490631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RGt4WPnm969RJucfeLyWdLBbHqHzuKxIPaZB8gPnboY=;
        b=iNF2WXM53Okslz4xIEFzuaUwO6j3kZcRwyLYYrLHFB2E8VhuCmwPkr9mm3dlaKZWmA
         1v+nZLuHHBWFng1hCEKOCMuh8x944lOveNQ/APUGxYX6g8M6DSttCYZwJ7Oa9othKBQT
         gknBhnpgLR37BEz1/W12VMkVzAANmZ/kO2wzjWQJ9+uQXwIKb7y54zE1sWMXQVCw6HfG
         UnSFpBQNqtQ82C4n7hjmdT0joxX99lx0frDv2eVqdyajzAiNL1e6KNMZFRGC7YVTR8tP
         iWJxUq/u6PLQ70ICG6eBw6R/uqyrFExXKg1U9OlV0hQKR5ScEF8NnBTBHxokM9GXtvWx
         avXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885831; x=1737490631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGt4WPnm969RJucfeLyWdLBbHqHzuKxIPaZB8gPnboY=;
        b=XUM+7+ZRQHMGLR3NDOA3pgV7JpyPsq/bAm5wSwLFrVdybDaxadXJOir8u+Ia1ZGPYM
         KbJJStXSOdi2E/aiJ9ADSTvnT0O/PDgfAIDGYPXPxla//g9/znJ/aalGIkx14dTzt9mh
         b9O9GKO1c3UEAekvKwEgizjXBC7TS6TCmPed+Cmxw8VqWmJafB+YxkC9bBGzw/gtoeLq
         PReTDJVtkGkUH47zXMCVN5gJ4hE2TY2/mDJpRx/4DT8giSx9j3ZO9bqG7W3YrTpBYaU0
         URt+on4Eu9dMky0UGa/V7GQRZnnMvmGOj5K5Ai5wvse+w1IPGTD7GOIiTYr8pProCxxW
         ZIkw==
X-Forwarded-Encrypted: i=1; AJvYcCUUH2HrRbl3voKP6FJ2/oGLTs+VyY1V08ErF1ea4/XEJXZnp6CAMntja/aCllupE1h0CNneuR+GaWXIPPjJ@vger.kernel.org, AJvYcCUgZTd6o3S8PQ8vglya+Isxi0Om2nABkIsehqLnw64x6dOSZYv8Y2/3TXE3nCGHFaLGILM2RKr071qw+963QYc=@vger.kernel.org, AJvYcCVNdN9nZrBjaCrSxhND+5s6uEIvFh4klV9hAA0Kj+YcbSBjLND/E03j+VMo4z1/56/gAeI3sqCtIxbNzT4R1EV90mE=@vger.kernel.org, AJvYcCW03vuKNNL2AmJ68N3o/uIIZKi+60MEXihUzUJcXfqWkora28lwG+TKPctFP6Plq7/GUDUKXYnCHvnr@vger.kernel.org, AJvYcCW5q/DdEaryq9cJj9mF+JJDeqFa7O05Kt8xGvshIdtt8/B3ZOQQ0faZ4bGvk1kerCD0O3j90JJ/oLO6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfugd1mxP0d0dXo9htvuuP4Wykyh7Bx3W14LXLNn0CCOG0JmoF
	YlWfLmwhhzOzKIUF0fgetfpcVVnUOE+EzbyHe4mXMne6BXEbWT5m
X-Gm-Gg: ASbGncuhjZuDbTY0+eCJZYhHTLCPi+/QDQy7jeRgGdVLhgzJYK4/yYHlKA4Lq17lChK
	9s5Vb11eEMl1ZrfEc1VUKjIHUYv5xWXFfnzajvctXUggkL1Tpn1tR55vTYtg9/Pb9dFTMGCrnS9
	8nobzBFGkeYix5j201Xe+GuBBt9pk3zs0NNZJFq9ZtZTBUaZ8jr+J4dMj0VQ/r1rYfrPbsvUHtb
	7McNdDvsFx5o5FzzRfAjerOnIZt44cpx1dgO0hI/uT9ySXUQZXnAc7JIjbvijVpRuQiV17jVYs8
	3ZAxobNqVPhVCc71q22Is1zyUkBbDA==
X-Google-Smtp-Source: AGHT+IGFt/giJrArprePBlrOgmFrEz+9CLtTlPCYdf1zDzdUZoXEtQqpKDZsFQHbyTRBOcJNNXnfLw==
X-Received: by 2002:a17:902:e88c:b0:21a:8dec:e57a with SMTP id d9443c01a7336-21a8dece77bmr382607525ad.48.1736885830694;
        Tue, 14 Jan 2025 12:17:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f250393sm70791345ad.212.2025.01.14.12.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 12:17:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e74391e7-c7ab-422b-9dab-dbde9ce55204@roeck-us.net>
Date: Tue, 14 Jan 2025 12:17:08 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add support to retrieve the bootstatus from
 watchdog for RZ/V2H(P) SoC
To: Rob Herring <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346D7617436A7779B6697B3861F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20250114200335.GA1626474-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250114200335.GA1626474-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/25 12:03, Rob Herring wrote:
> On Mon, Jan 13, 2025 at 11:38:08AM +0000, Biju Das wrote:
>> Hi Prabhakar,
>>
>>> -----Original Message-----
>>> From: Prabhakar <prabhakar.csengg@gmail.com>
>>> Sent: 13 January 2025 11:24
>>> Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Hi All,
>>>
>>> This patch series adds SYSCON support to retrieve boot status information for RZ/V2H(P) SoC.
>>> Summary of Changes,
>>>
>>>      Clock:
>>>          Add syscon compatible support to the CPG block in bindings and
>>>          device trees.
>>>
>>>      Watchdog:
>>>          Document the renesas,r9a09g057-syscon-wdt-errorrst property.
>>>          Update the watchdog driver to fetch and report boot status via
>>>          Error Reset Registers (CPG_ERROR_RSTm).
>>>
>>>      Device Tree:
>>>          Add the syscon property to CPG and WDT nodes in R9A09G057 and
>>>          R9A09G047 SoC DTSI.
>>>
>>> These changes enable the watchdog driver to identify boot sources like Power-on Reset and Watchdog
>>> Reset, improving system diagnostics.
>>
>> This means that, we should assume U-boot/bootloader should not clear the WDT reset status bit.
>>
>> If they clear it, there should be a way to propagate it from u-boot/bootloader to linux,
>> otherwise, we get wrong bootstatus in linux.
>> But the clearing of watchdog status by one of the cases:
>>
>> 1) u-boot identify the boot source and clear the status bit
>> 2) u-boot identify the boot source and does not clear the status bit, but linux clear it.
>> 3) u-boot does not touch WDT status bits, but linux clear it.
> 
> Sounds like the same problem as this[1]. If that works for you, please
> comment there. Always better if there is more than 1 user for something
> "common".
> 
> Rob
> 
> [1]https://lore.kernel.org/devicetree-spec/48defa98-9718-4997-86cb-b171187708a6@cherry.de/T/#u

If this ends up being provided through /chosen, it should probably be supported
in the watchdog core.

Guenter


