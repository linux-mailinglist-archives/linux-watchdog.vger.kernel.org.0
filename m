Return-Path: <linux-watchdog+bounces-5002-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBNGAl1LoWkKsAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5002-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:44:29 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6951B40EF
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 979673031EAE
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E07D36F437;
	Fri, 27 Feb 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJiYCA02"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF57374168
	for <linux-watchdog@vger.kernel.org>; Fri, 27 Feb 2026 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178249; cv=none; b=MW5xYozxnn9Hi726dwQ6do+pkCGYxcYMuqBwjzId0bpZZy6QnTGsK9lQIQGzeXg452xVFe5gAUW35ORi6cEik1Ld4hRgA/OA7rhRaHCdzl2WECoIT/ktgyX0E9UlYRLrf5PI8DOdbHM4wgUUy5kbS4upkijAJ2YsoSLS5brUzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178249; c=relaxed/simple;
	bh=84TxcVVnLLZ21GHiYnfom/Tm/4rsR33MtXnG34S9MjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xu9wr9fjLlmcCk0yiiz3pq6EM2qnkLvDXUA3sE39HQD+W1B5c9PSYNLQo9Mn+AtEZsw984PrhO6ST4crnJJz0J9XYL6bgCMHKBidwsBwyzdcyT1lyUETvlF7ZmlBzmbPDqc48VPbZa0hPsaJSo/+JqvQDBrT67mBLPqLpjJYPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJiYCA02; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3590408a093so936695a91.2
        for <linux-watchdog@vger.kernel.org>; Thu, 26 Feb 2026 23:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772178246; x=1772783046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k7eVWufdRnuJaMT82ARr6mUQU8+3LuBH9hu4HQmbar0=;
        b=lJiYCA02M5Q3Q0JwhFeYUSWxN77x1xWaV07kuUXNf9fvPt9osLJvtXh5ZAtM7TmR6w
         q+cZb+RYz0OTltkWbXeD3VL62+7Dy+7SMu9lqFLIUAfvc56uPoEtkDOGFY0xzbkhIfsD
         UPezOdgYbZuam5lsrJbDdHSQC2XxffO+Bwp//wCVnV7HptpO+6uX+9CwZVx3PWCFIagN
         Eq8Fi/171uljyKEJ2emowZkowwuZlmo8k0gMPqdxyXKRSgTy6h616K9GrFhsUpu4NPru
         n3CFJ/pyekzR5TCj5BA30cYqAsTSNdK9rtE5FkvqdaJyBSBC7l3r00LDZNCaNlg+6sug
         udPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772178246; x=1772783046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7eVWufdRnuJaMT82ARr6mUQU8+3LuBH9hu4HQmbar0=;
        b=raTsp7V91VDwBuW+Kv4J4RQjWwnaZ85nzrgjgxag98WZzL28sjrzSOBIs7LchsEtfJ
         bkLYd+vl4YL9CZS+zdFo4O/9+2jaYi0PDVlh2CIsw8rZ6uvdTLDAoKJOzc0aweNTfjR5
         qKF/Nd3zfATjWfemjeWdFPLXNBwRQYkfoZzyXRi+yPBhgbWmu3o6u6Kn7K4/tIwV6MT7
         +Il+s3G4wLaeR5RtyGHmZrHTN92dTIXVzM3DLiAIcnYN3V27S0ZeVcYY5mVmzor8caFl
         f2UTm1L8tnGTj7fcIxPuKWT8U69OosCkQpsJ3k/fgWPO9Dg69Ont5vFhDGp0EDGj6IjW
         vNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUN+igqinO11/6DoDdGijtPil9VWk3WJ6I7GeR4FGNAfJ4zrah9gpHoYlwbbX06AzhfZpxjPvYZvAc6UdtkjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygpvv5yz29Oy4cjkQ2QOjAO2Rar7TDxFfAY5fYjFoXSOLSrwCD
	Bsrmpt2pWyMo3rebvJ6fci/VJ/Lk4jddHyWRhleDB5sZEaN099NVnaul587bnTeW
X-Gm-Gg: ATEYQzx0aM8saROLCJiK+29/9/uYQI1SZyp2+Wc0XTiW6Qc3VgkHTfmvNhVoEMiUktz
	VvynY4DoRaqlH6Lx5SlYwzya/AkZ6/E1kwMZmxfslkONmiutY7yWtx5Z9YGF0YR331TMBoJkdn2
	yaqWCZ+BlF0C12BIWVAFevKriJ275pHwt22z1m98R7exxIz6DN0H0O+mMdA2ZHdjfqLbLnZalbD
	efpCl0kJk4AJOfOdyh9/VFkM5//TV2gmy6Q6O//x69i4/tHajYRVLQyWNhssp0/7JFjJkQT2pwf
	8NAJeDEYqQn2roSOVCcPw3+DE0AyYKeF+vrS0yFk0aUnkxmnbQrUt+mb54/SX0XuJ8l9vL96edn
	O9FZr7/kZpwnUSVluMD2chOM4KKA+/d/InIDLyFQy9nxcJuFAafpQO+dt7XbwAYRyauRHYHkNR3
	ZEiOx8wEUO3JVIIiZM2FbFL4PlTpzcIAApE2bONlSsLSyrb0WfzGimXQ95mwkW+gmeiyJjgrSS
X-Received: by 2002:a17:90a:da85:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-35965c93b31mr2286620a91.16.1772178245932;
        Thu, 26 Feb 2026 23:44:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912e19c4csm7147007a91.0.2026.02.26.23.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 23:44:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
Date: Thu, 26 Feb 2026 23:44:04 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 wim@linux-watchdog.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260227073116.30447-1-balakrishnan.s@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-5002-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-watchdog@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C6951B40EF
X-Rspamd-Action: no action

On 2/26/26 23:31, Balakrishnan Sambath wrote:
> This series cleans up the AT91 watchdog header and refactors the
> sama5d4 watchdog driver.
> 
> The header reorganization introduces consistent register naming and
> makes the WDDIS bit handling explicit for modern (SAM9X60, SAMA7G5,
> SAM9X7) and legacy (SAMA5, AT91SAM9261) SoCs. The driver refactor
> improves readability and fixes the reset regression introduced by
> commit 266da53c35fc ("watchdog: sama5d4: readout initial state").
> 

That is inappropriate as a bug fix. Ther bug fix should come first,
in a form that can be backported, followed by an optional cleanup.

Guenter

> Andrei Simion (2):
>    watchdog: at91sam9_wdt.h: Cleanup the header file
>    watchdog: sama5d4_wdt: Refactor the driver
> 
> Balakrishnan Sambath (1):
>    watchdog: at91sam9_wdt: Rename AT91_WDT_WDDIS to AT91_WDT_WDDIS_LEGACY
> 
>   drivers/watchdog/at91sam9_wdt.c |   8 +-
>   drivers/watchdog/at91sam9_wdt.h |  65 +++++++------
>   drivers/watchdog/sama5d4_wdt.c  | 156 ++++++++++++++++----------------
>   3 files changed, 113 insertions(+), 116 deletions(-)
> 


