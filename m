Return-Path: <linux-watchdog+bounces-1055-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA878C0BDE
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 09:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D241F21266
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2024 07:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C628813AA5A;
	Thu,  9 May 2024 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTrOPr/B"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D642F4A;
	Thu,  9 May 2024 07:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715238228; cv=none; b=bRXUbvW5JcJTIl8+1oJ1ftC+Vh6WODIgQfVuaxC6pKP5r6bHRuoJ49i+692E5s8/ayfgGIhkr4IfAG0R1IwvTs56cHqMzrJNbAfSj5RpDDqh9YjhPdX3ClNMwyc+PCtMgdwGh1hD3eI5tlx7h1ZHrcz+1ehmZlFC+1bf/kC7GBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715238228; c=relaxed/simple;
	bh=qGxIb+yN4QJ5lbflcHzZ289CJV8WK+EAGAfTzoHSU5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0u5ziZIRHytSJ8WZ+w8cBU5TQD76fzOSaC/KMbdOETi8Pf2HWRdPbB0om7k/JL4h3kX/qhSCXisJtgS1ABhHgLGtkCcQ8YdfEzNyt83wtazKnmuC2dm7hgMJ9EvREwrWqb5sVwjmZSDUrVtZ9yDjoQP1urxdTMbcYakqasg5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTrOPr/B; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f3761c96aso656303e87.3;
        Thu, 09 May 2024 00:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715238225; x=1715843025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV3VXr3FzBHHc86etbARcMDYosOYMN7pyry12cUs17I=;
        b=aTrOPr/BMAf8QgbzyQTQ0vyl2kDuO+59HlJVO9AKSZOr/pqZ7fV5pPDGUV/OZpv+MY
         K4cwdfgQE/laHA4wMur8XLWci3bKbPNV8j0zi+/1rofUgJ+h1ADHIfLvy1/5rY7Up0cT
         dJKMqdacJQRvbOgxzHKlgYNvkvfFVhVwi0pL1I5XERji0pBVqZ+qdZj8jPnhhD3Ya49y
         nIbcwkD4MTw2sh07lJi2IKHiphWmjKg82wGDQmYvMIeHxdZRvWuvaUWWjz5jpkSL6uA4
         aFUlr5i+llcED2pNBMSFmL8ao2QPpyxGkoM/vmGqN6dZsB5lvns4OYBba7icGWoDDlbh
         3bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715238225; x=1715843025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kV3VXr3FzBHHc86etbARcMDYosOYMN7pyry12cUs17I=;
        b=Rx2VojXDIsVbHzTxLZr+4B2JHQFDMIMwAYGWskP7IDF0Z9fKLLg82H4rhFEXPBpK3J
         1W8RgVlbXkKadBDU616VPlH56fWGRDISJGFq1JXAssx8/VBjNgdW+dy21ZflgbR7dV5R
         oYaJJb1fUX8S5Qmmoe8M2+e6tY/UgJe0EQp1ZBgDCkAMgNS9if0uXguXoRj78uwg1B0J
         kquNRwGo2pqzx+eaHFHCLtLUZ2e5i7+XkSwRdBnWfGcEVTiXPZ8lDZLHPauPWQZWc7u2
         3sLie6OBlucvo0OaKfkoIOQc8vmDuQnahl1Z287UFNkH85Ax2PPsDQuYM+ZO+oYbidqK
         iIqA==
X-Forwarded-Encrypted: i=1; AJvYcCVOPEks0PTGd+I8AaOvwaCldJwl9njhp/O2HwKrdij9fpX40j4bL4Rrpsf4N3M6t/3gmoRnRssrExdnsvjeUFOxxcqY73VzYNZV4wdQI2WSf9VaxqD5pgfR004xU7oupkN9lCUqOUpj/3XOgBLhwKMtTHnrqBI0Abl9SllaCvqqxO8fkuhQBly0
X-Gm-Message-State: AOJu0YyhKoxQ1s4RH+37xQEnHkJ1+fEaLlGv1zNrCmO0VvAA7RNGdICY
	RuMCJIVGuRKO5J/F+fv8U0EkfKoeBUYv8gsNUE5DpRavF9F/PS4m
X-Google-Smtp-Source: AGHT+IFH0nSj1Sl2zFNlZBn03COxstGselG/PVwJSfHFEuveurl+egnMUQf/L31IPth8h1fRjaPcEw==
X-Received: by 2002:a05:6512:3b28:b0:51d:1d42:3eef with SMTP id 2adb3069b0e04-5217c6673f2mr5419056e87.29.1715238224762;
        Thu, 09 May 2024 00:03:44 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba5bfsm161189e87.79.2024.05.09.00.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 00:03:44 -0700 (PDT)
Message-ID: <0674ca23-2cf2-48a6-84d3-e0936d50dd8c@gmail.com>
Date: Thu, 9 May 2024 10:03:43 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Support ROHM BD96801 scalable PMIC
Content-Language: en-US, en-GB
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <cover.1712058690.git.mazziesaccount@gmail.com>
 <f7d454ac-6ecb-4431-a1de-c9b5d1240969@gmail.com>
 <eb03ec33-0627-4986-be04-8e35da390d6b@sirena.org.uk>
 <b6279be8-cf7d-4608-b556-3c01587f0d43@gmail.com>
 <f1e3d31d-8c24-4cdc-ae26-747f383a937b@gmail.com>
 <b6ded975-1d16-46ea-84a2-8799b36e1270@gmail.com>
 <ZjxaP_BNWVufJb_X@finisterre.sirena.org.uk>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <ZjxaP_BNWVufJb_X@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/24 08:08, Mark Brown wrote:
> On Mon, Apr 22, 2024 at 01:52:27PM +0300, Matti Vaittinen wrote:
>> On 4/5/24 12:19, Matti Vaittinen wrote:
>>> On 4/4/24 16:15, Matti Vaittinen wrote:
> 
>>>>> I would expect each parent interrupt to show up as a separate remap_irq.
> 
>>>>> So if we arrange to supply a name when we register multiple domains
>>>>> things should work fine?
> 
>>> After my latest findings, yes, I think so. How to do this correctly is
>>> beyond me though. The __irq_domain_create() seems to me that the name is
>>> meant to be the dt-node name when the controller is backed by a real
>>> dt-node. Naming of the irq_domain_alloc_named_fwnode() sounds to me like
> 
> ...
> 
>> If we wanted to support multiple HWIRQs / regmap-IRQ controller, it would
>> require us to duplicate almost everything in the struct regmap_irq_chip for
>> every new parent IRQ. The status/mask register information, IRQ type, etc.
>> Naturally, it would require also duplicating lot of the data contained in
>> the struct regmap_irq_chip_data. I am not sure if this could be done so the
>> change is not reflected in the existing IRQ data initialization macros etc.
>> Furthermore, some API changes would be required like changes to
>> regmap_irq_get_domain().
> 
> I don't understand what the difficulty is here - we're creating multiple
> interrupt controllers so I'd expect to have to have full definitions of
> each, and since everything is referenced by name from the root
> regmap_irq_chip which gets registered it's just a case of supplying
> different names and all the helpers should be fine?
> 
>> Thus, forcing the regmap-IRQ to support multiple parents instead of having
>> own regmap-IRQ instance / parent IRQ feels like fitting square item to a
>> round hole. I am sure fixing all the bugs I caused would give donate a lot
>> of EXP-points though :rolleyes:
> 
> Right, my suggestion is to register multiple regmap_irq instrances - one
> per parent - and supply a name that allows all the display/debugfs stuff
> that currently uses the dev_name() to deduplicate.  You'd end up
> sticking -primary, -secondary or whatever name was supplied onto the
> names we currently use.
> 
>> Another option I see, is trying to think if irq-domain name could be
>> changed. (This is what the RFC v3 does, [ab]using the
>> irq_domain_update_bus_token()). I was a bit put off by the idea of
>> 'instantiating' multiple domains (or regmap-IRQ controllers) from a single
>> node, but more I think of this, more I lean towards it. Besides, this is not
> 
> Yes, register mutliple controllers with different names.

Thanks for the guidance Mark. The controller name is not a problem. 
Problem is that I don't see a (proper) way to supply a name for the IRQ 
domain which gets registered by regmap-IRQ. IRQ domain code picks the 
name for the domain by the device-tree node. Both of our IRQ controllers 
would be instantiated from same node => the IRQ domain will get same 
name => debugfs will conflict.

My "solution" was simply dropping the ERRB IRQ from the driver (for now 
at least). I did send that as a series without 'RFC' - but made a 
mistake and restarted the versioning from v1. I am currently working 
with 2 other PMICs, one of them does also provide similar setup of two 
IRQ lines. Thus, I think being able to provide a name (suffix?) for IRQ 
domain when registering it instead of just using the name of the DT node 
is something I should look into. It's just nice to know someone else 
thinks it is valid approach.

Thanks for the input!

Yours,
	-- Matti



-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


