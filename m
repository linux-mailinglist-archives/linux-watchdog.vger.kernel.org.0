Return-Path: <linux-watchdog+bounces-3944-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB7B1871D
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 20:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E287188857F
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 18:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBFB235346;
	Fri,  1 Aug 2025 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuI8XG8X"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3D1DC99C;
	Fri,  1 Aug 2025 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071465; cv=none; b=fLXlOPRKREOcd5C6yfHpDvCV0jcyU1j620aOlzjvr66BMt5A7phXu/gITXLN3yR160BC8lRAafn5vFnRi3xilgnEXA/1wCVmYMVlAbZsEI5759xv3lgxJqgHvrWwJiWBZIxcF1VRc4NSswCLVcbLOcA4jwU2Nqoiv8q6c4AbHcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071465; c=relaxed/simple;
	bh=jtVs4YM3HugwAbhWrHuORF3i3AWrbmHy7uCsJ4n4FSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVX/lkV2/6kyFUXu8yNZiNbxVDEnjX3m0nMvBX1/3AYNx3H2QANlk4cEN8BajE2pyhQRxrHgwMl83zaHoaFNnJIh1cxDDhkqiFNLV6TMHhz04hu6FkYQlXPaEAgz3cbXj26v1HcihNkeZZBA2rIGxZJ+Z9LhVU4D8NYWV7e4/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuI8XG8X; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31effad130bso964713a91.3;
        Fri, 01 Aug 2025 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754071463; x=1754676263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gn8QwK2PIACuutr4KjQ3PXKlXST9xlDrnNTcVggzZy4=;
        b=PuI8XG8XrGU7Z0iyQmJVT4KeCPiEmk/eYxy1J1x1tbpuIc3InqLMnGX68hcygwS1s9
         joNw8c4U5gm6pwI38MyoMxiDLtraE4Z49FSrEbhTVT7s716l+a6nNfSwQzp4n1TSX5W3
         7nBxOdL6+MdPbGqXxaFq4D7cQaaLM+bob/yEFm6YegPpNCjyITCTAGPZsFN1qt5VewVw
         lZCOmU6cFjEwLWsLx8VyJIoWc763LfDvCA8qysplFHAB5UY4jk3qSgZAzF+p2H2DjVNv
         EmhZjng46bomij984lHRDqYwJHFWF8O/QMrMeyug0CMbLzu/ittS/oUUMewen+UCyBlo
         gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754071463; x=1754676263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn8QwK2PIACuutr4KjQ3PXKlXST9xlDrnNTcVggzZy4=;
        b=pB0FX+4hp0jCeBaCbJ5pVVKasA0LzBDVcYuZ0RuuwjdMV6w6XuGly3OOZDB9WrcRz8
         PZfflpB2sB7mrAzC3nKAJrYvzwlFeZV0ievviZGJPU0iokt+No1ruIo7wLXxevo5U0qM
         c337CByOed4Nhxucb/WQh8a1iTikmTRra917gAEsmKwMkc6jy/6TIu1vN3sDLKJAxsQR
         TmJyueVJXvjj/dcOZFpas0IRh4q6amB/OZ/iIpEoRIuW+R0hZcxdsLYZEq4CrgDkSqAS
         A07IrKQsuG+20ztjdn2Ow+yLcFPKx2HimnWTlmp68gzWa4mmSEdXWY+GHp4komApxTce
         9hTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53KPhIY3rQhphn9McqpohEVyoCTcac8xfOWZ1YSlkMa7or1WxOddyxQE9wuZhOVmiSq5I2jwVPRYcvL9X@vger.kernel.org, AJvYcCW8SaihE1az9+1G63KolkLyENoUwoHApdL/UP27qxjVwBHsd5t4gIENv2YwFBK2SAZ9aM6plQo2pgePTTNcP5s=@vger.kernel.org, AJvYcCXDtqvbbObzOF65I1A9qYpGFmYVq8CHkVFbhtun2ZYaVpyvGyravMhp3g95RuKfHqeuYkW2dtkG6UrC/ILi+sIUnQ8=@vger.kernel.org, AJvYcCXdose+WxMYGXgqTZ0rl0YWVvaSdtgC3IP3wDVmgToCahZjM2jv1R1syy0MyBNdnSZlA2SVfy+AOOma@vger.kernel.org
X-Gm-Message-State: AOJu0YzNAPMV+sQ2IQARzaJBLS/aj7XaS4fhkQ9sMGRAw4yE0taz44DR
	JHlRRYhK+lp3KJNRPj4K2kbFEpX+uaWo8RgtrvYo+HNSll2LDJxVpI3i
X-Gm-Gg: ASbGncuNHHUSvsBFCIKjON3hovIDjvqOOP9E7VHo/JKPYmraxzf45QUFXYW+nnY5V3P
	JgjAqmUN79tDZP6+MQ2wWSVul7ajvNUZxE+RfEYF6NjvaalohgJG76YjFJ4IIdRhWb/ri5sIAVl
	CU/nHFP+4AQrlskPMaAOJE3Iys9tBhuWVXIp4XRnDcSYJ1XqpSHQ5u3aOUsNt7ggMhn4huTaypT
	rd/K+lqggBEEwVA4sMs4kXjH8+0/lFjRfvlzsDvEhfkM+QiPSK0JvcOSahDBQrH7PX1L1Qxo0S6
	HQhJyZfetVw9DrrERGdTg50aukAyZN/EpKOJoM2dmgM6JZ88s8/10wKE36K34DtTPZNCtD4/oSg
	T11dmpny9fkfrMj1z4lwj/CwEKSdmYMBDuy06IJBRneWhrihOI+AoSa4h171qb65UkB09mkygFj
	QfuyN+ArnIjXR+pnF5
X-Google-Smtp-Source: AGHT+IF/Q5VicR3q+/5Ioe/gArLWmCx1gbjfP7yi6cWvPwNAjxEGFO3teqYgxHOSgy3WnTbbVxouqw==
X-Received: by 2002:a17:90b:38c9:b0:311:ea13:2e61 with SMTP id 98e67ed59e1d1-32116306ccbmr737677a91.34.1754071462801;
        Fri, 01 Aug 2025 11:04:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32106bab5ecsm1734437a91.19.2025.08.01.11.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 11:04:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cd0653d0-4a2f-4361-8eb2-c1937d988a8c@roeck-us.net>
Date: Fri, 1 Aug 2025 11:04:20 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] watchdog: rzv2h: Set min_timeout based on
 max_hw_heartbeat_ms
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aIw-P6zkQSOhvYJW@shikoro>
 <CA+V-a8txrQoweVrd7uK4LLvDonqrEQGT_gV1r28RFhy8-m=9VQ@mail.gmail.com>
 <c06bcde9-0aa5-46d1-a5bf-bae5a319565c@roeck-us.net>
 <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CA+V-a8sDP7iir-bPetbCw0fakPRxua5F-F1hVvXUD8bGAMdhFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/1/25 08:30, Lad, Prabhakar wrote:
> Hi Guenter,
> 
> On Fri, Aug 1, 2025 at 2:52 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/1/25 04:05, Lad, Prabhakar wrote:
>>> Hi Wolfram,
>>>
>>> Thank you for the review.
>>>
>>> On Fri, Aug 1, 2025 at 5:10 AM Wolfram Sang
>>> <wsa+renesas@sang-engineering.com> wrote:
>>>>
>>>> On Tue, Jul 29, 2025 at 04:59:13PM +0100, Prabhakar wrote:
>>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>
>>>>> Update the watchdog minimum timeout value to be derived from
>>>>> `max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
>>>>> consistent minimum timeout in seconds.
>>>>
>>>> I don't understand this change. Why is the _minimum_ timeout based on
>>>> the _maximum_ heartbeat?
>>>>
>>> The reason for deriving min_timeout from max_hw_heartbeat_ms is to
>>> ensure the minimum watchdog period (in seconds) is compatible with the
>>> underlying hardware.
>>>
>>> max_hw_heartbeat_ms is calculated as:
>>> max_hw_heartbeat_ms = (1000 * 16384 * cks_div) / clk_rate;
>>>
>>> This value varies by SoC:
>>>    RZ/T2H: cks_div = 8192, clk ≈ 62.5 MHz -> max_hw_heartbeat_ms ~ 2147ms
>>>    RZ/V2H: cks_div = 256, clk ≈ 240 MHz -> max_hw_heartbeat_ms ~ 174ms
>>>
>>> Since min_timeout is in seconds, setting it to:
>>> min_timeout = DIV_ROUND_UP(max_hw_heartbeat_ms, 1000);
>>>
>>> ensures:
>>> The minimum timeout period is never less than what the hardware can support.
>>> - For T2H, this results in a min_timeout of 3s (2147ms -> 3s).
>>> - For V2H, it’s just 1s (174ms -> 1s).
>>>
>>
>> Sorry, I completely fail to understand the logic.
>>
>> If the maximum timeout is, say, 2 seconds, why would the hardware
>> not be able to support a timeout of 1 second ?
>>
> The watchdog timer on RZ/V2H (and RZ/T2H) is a 14 bit down counter. On
> initialization the down counters on the SoCs are configured to the max
> down counter. On RZ/V2H down counter value 4194304 (which evaluates to
> 174ms) is and on RZ/T2H is 134217728 (which evaluates to 2147ms). The
> board will be reset when we get an underflow error.
> 
> So for example on T2H consider this example:
> - down counter is 134217728
> - min_timeout is set to 1 in the driver
> - When set  WDIOC_SETTIMEOUT to 1
> In this case the board will be reset after 2147ms, i.e. incorrect
> behaviour as we expect the board to be reset after 1 sec. Hence the
> min_timeout is set to 3s (2147ms -> 3s).
> 
> Please let me know if my understanding of min_timeout is incorrect here.
> 

The driver is missing a set_timeout function. It should set RZ/T2H
to 62514079 if a timeout of 1 second is configured.

Guenter


