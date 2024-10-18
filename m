Return-Path: <linux-watchdog+bounces-2231-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B39A3AF4
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 12:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BDA61F299A6
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933712010E8;
	Fri, 18 Oct 2024 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blk7uMHN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC926188A18;
	Fri, 18 Oct 2024 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246156; cv=none; b=b1OdilKttMZGm1Y45oOGRKPAPUGW54Fs91KHM29sY+yeqe7GjleSymVMJ0Uy7FHNYESuv9gUQt7h44IGplnmul+sDb3p/Ogqao0gdn9tmGpRKILhx9DwpVJS/bQeWyu/+alw7nZWyvvhU0IQZhx7i5c2sBd3J7VG8s60oSe5kC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246156; c=relaxed/simple;
	bh=AYgd7GJ+Yoxc0Is6sH8i9gWFK8agoNs9YvvMKDfw+aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtrDC4rE1mbnxWfyXAoN7K9bH9/a+BDg2BTGyqusfr8XlroQXdQneo0uv1AK0WsO4sKnPw/A7SGAMaXHwth5doAalvGiFYzTbFWDFL8kmWZgFArTKNbRgLxyxq047li6CUUjC3azpCl/HPKzhHTNwTiGW0RT0DSve3uid3WzOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blk7uMHN; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e602a73ba1so312204b6e.2;
        Fri, 18 Oct 2024 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729246154; x=1729850954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kqufkdO0FPM/84+eB0tQ3ID+IKoXaw0gDMZk/TPWK08=;
        b=blk7uMHN/XkP2IPTTNKQU7HCS0ovzmyL1+oGtBvM4RqSkrTqWlKxZn5xlDRuDyW00U
         /+0HjyxxwDhqkqQrKEbS0FtC+7HSBg0nhNkBB8OjoUdSjVc8xm30/YEU36KYfk5DX51A
         tcYi7Cg5PDKoZPnMoE5+u4pNmbCtjEIs6A5F33OsIAhlSGki/uktIW40PqWniSwyT4lU
         52MfkGVSP/imrzIsaB4VPhmMpJcv1E6D9CbR4+LcbKD2c5KI9V6u/xAB5vIgJR3+YkJ/
         HKKcZKjssiEeDZWTL2lKt7emRA8QQAFUI+uqaeHem0xH/Y67Dm/cslV0ya8ECE69+jKX
         nrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246154; x=1729850954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqufkdO0FPM/84+eB0tQ3ID+IKoXaw0gDMZk/TPWK08=;
        b=H7/BphUPJlVnwol4Mgv61O0WNOo8KwoMyMor2Q9VIpWA9TC/S35oo2Cyq5o/MBPloh
         eT/tm0sv4zLg79ZsSUSatbP2m5ulxDHHzn4Py4uCPRMscd6B63Ia3Mjm15+7z4pmxvoi
         58J/VDCadrSUrqqx6R7ATiBciVhro+UplcfVL6l1M0gM4tH2VlBXQGnjS0msGNkUnhql
         3lKhLWazpwUyofYu/Ii4a381ZEMoN54P5/9m7Vgr+AsUI/cSPMWZ7SQ0lojIK3oHm1+P
         0zDNp/SlhAH2fWKIO52iBH1UOfsXiwxX8Iwbg6bZ/gxPyCAr21MdM+4len/pjGP9pl3f
         iilA==
X-Forwarded-Encrypted: i=1; AJvYcCWv7bUbuUEj0Q9l4XYlzC7Xm2/asbyS3GIjK+DsfK63rIQPtTO607h9dRBK6+lo3qn32exdUv3GGOhmByw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mq8ljsj5HUZreInShWWnN6zKU05Mo1e/RL3VAzVmMH1N/4v1
	R8WhUwLE/bPv8u0YSchgYnu0gCLll0En/GBWrquWbvhOxD828GAVS3H62w==
X-Google-Smtp-Source: AGHT+IGq+rCdCVAA4DkRtu9+iH/kLyM7XA7IBhj4r/5XVnXLlpUvO08nn9vcKZnktKbsq2SylR6yMQ==
X-Received: by 2002:a05:6808:159a:b0:3e6:117:ac09 with SMTP id 5614622812f47-3e602df2555mr1840466b6e.43.1729246153754;
        Fri, 18 Oct 2024 03:09:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc28c1a5sm991186a12.61.2024.10.18.03.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 03:09:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20a922fb-6703-4712-9818-8e97c38b5148@roeck-us.net>
Date: Fri, 18 Oct 2024 03:09:10 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: it87_wdt: add quirks for some Qotom IT8786
 boards
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org
References: <20241018030917.2540841-1-james.hilliard1@gmail.com>
 <66922a0b-6e30-4501-9262-8bdd224155f9@roeck-us.net>
 <CADvTj4pnYn478mzM6LQFJ7x1SBANY_Q4JBygTUqx2PnJgJkQxg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4pnYn478mzM6LQFJ7x1SBANY_Q4JBygTUqx2PnJgJkQxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/24 21:29, James Hilliard wrote:
> On Thu, Oct 17, 2024 at 9:59 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/17/24 20:09, James Hilliard wrote:
>>> For the watchdog timer to work properly on the QCML04 board we need to
>>> set PWRGD enable in the Environment Controller Configuration Registers
>>> Special Configuration Register 1 when it is not already set, this may
>>> be the case when the watchdog is not enabled from within the BIOS.
>>>
>>> For the Qotom QGLK02 board the vendor indicates that the IT8786
>>> watchdog hardware is not functional due to a conflict with the BIOS
>>> power-on function, with PWRGD set the watchdog will trigger but the
>>> board will poweroff rather than restart as expected. Disable the
>>> it87 driver on this broken hardware.
>>>
>>
>> This shouldn't be done in drivers, and it doesn't scale. The driver needs
>> to be disabled with the mechanism supported by the distribution, for example
>> in /etc/modprobe.d/blacklist-watchdog.conf, or by whatever other mechanism
>> the distribution supports for that purpose.
> 
> There isn't really a good way that I've found with my setup since I use common
> images for both of these boards. I'm also worried that it's much easier to mess
> something critical like this up if user space is involved in hardware detection.
> 
> Many other watchdog drivers do this sort of thing so I'm a bit confused why we
> would want to not do that here as well, for example:
> https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/renesas_wdt.c#L176-L207
> https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/ebc-c384_wdt.c#L125
> https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/lenovo_se10_wdt.c#L242-L285
> https://github.com/torvalds/linux/blob/v6.11/drivers/watchdog/sbc_fitpc2_wdt.c#L203-L206
> 

Those are specialty watchdog drivers, which only work on a very limited number of boards
to start with. For the most part they use DMI data to determine if the watchdog is supported
on a board, not to determine if a watchdog isn't supported.

The it87 driver works on thousands of boards, and is not wired up on a substantial percentage
of them. In many cases, systems with ITE Super-IO chips have two Super-IO chips installed
(one of them typically being an IT8786), and only one of those (or none) will have the watchdog
wired up. Many boards with Intel CPUs use the iTCO watchdog and don't have the Super-IO
watchdog wired up at all. Trying to maintain a deny-list for all boards where the watchdog
isn't wired up would not scale.

Guenter


