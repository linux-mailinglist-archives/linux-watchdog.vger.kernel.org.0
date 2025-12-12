Return-Path: <linux-watchdog+bounces-4685-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9ECB9E4B
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B2793032730
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 21:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1361123E32D;
	Fri, 12 Dec 2025 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc275l2J"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17FA238C03
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765576245; cv=none; b=SHB83n2chu3lr4pDeKNkReuxvoyo9Pvn3fAx0KeKH/0zagUxyDlrP4mGRqHHJVyDqRWkO9H1e9dLcZV9XSC8khy+FC8LYFdtFj2e4yYP6sz5PAGOPWtw6l/CcnoffnMlrKRZe5FB6+tZNn4/Hn3Ig9fdLyK8SLqJz8pSvMaLnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765576245; c=relaxed/simple;
	bh=Y5N9PSco1IFytTph+SQkbqQNqeFrTpgWcM6rbMuU1SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOBvyJKVC1cZ2LluZ8qJ7BOt1lz9EZ6ebPCfLrqjHr8YUkvuxCMVY0cUJfF6I1UBCHI+X9tAm9G+c1dTLNnNrK7rmzWdzBipKAdsUQjdQITrC9DknkqW5FH+z4mKID0CV5co0rJhfV/vMudQOk7TmuEHpK6JQA/6RM7FLp/etyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc275l2J; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11b6bc976d6so2120262c88.0
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 13:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765576242; x=1766181042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XG6NGyGFLJZJjyKpU/rY73/o4hKBugl/AuALjIrSKcA=;
        b=Hc275l2JIZCn3Fk/zgKAcDvM0TClDMFySL5MelioUgSYWZLIthtjLVVyaWHC18U4Du
         cdVM720amX9oHRRDpMWHRJfJHVLj6wUxrz2O6B5z8AfU/qb71bCf2fGnIz1wn0k3QorV
         9/Unn4nqmuGplGE0taJH50f2Kq43S85zaLr0j0ZFrAHNa2sXl4dGznkt9rBcsWGsnxHF
         j0b+3pojz8rxEFLOl0PoXOChHwhsfu7ljCScxTy1Q3wmmzx6KqUBBSQIautz19NLSQI0
         Qkm4HkoLoKW8RAF+6MOFpOuydNCpADrV48B3dxBKmbQM/NM6CRDA4hcgdFiqxlJitq3c
         4J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765576242; x=1766181042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG6NGyGFLJZJjyKpU/rY73/o4hKBugl/AuALjIrSKcA=;
        b=bERVNwPTjJuI8GC5xJXV0HG6p+jSxFdpu5LSqHVY/5E/gTytBENyU7h1/RtJT9ikKL
         SEUeejiO3s9YGls9E1o2UjwUL/ea4a/UCBEO+QM3Di7BdtuzGO7jPl7dH7O9pem+Rinf
         4rZSFaeXkBQdT82KZ9YuDE6Jhao+qvT5VdHE2f3bCVchQSxBOfRKDEeH+Wfsu1Sos+os
         gBqMDF/1GEgXeYR1y8VpjPCf2ogVtEC0ZmPdnm9VsmCRpOygVU2Juun1wOTXNdvcojoA
         Mkbk0TPqjT+DLYFW7Az1FFDQGWpr+zZjcQZccJdBCPzOvOQakayp9Z6Uv5fqEENVViIF
         b8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV7352P4jAYwRYP2FzNqF3hTWXEEAeTjBYChYGOm8hyv4jKxAwonTM/0Vx5qEgvRpfpHwLltYQ2q721HN+OeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5HxHoDoXgLsjmlORBsSXjq7dt05ScUirz21hu2MdD6yK9t0B0
	3TFYJ09oeOfRzXXzSU9PflRUyzzf1GEdrF/+OB6yzQD/luJ+pmIIJrtR
X-Gm-Gg: AY/fxX6Apoz9KGTHHifRmutL48RA6MRzDQF7hI5VQGdJr128IgH4SWveweDNNBH3sks
	ms9HSjXYYZF9qwzitG+1CwwVlZnfhr+tlRTVrKI0ohmDlKOx/HrvRXnCHF5D2ul+IM+/Vv+WyYt
	vZxKXm1My9hxD/6SbZcqXT7bMfSMxNUYUCity4y3QIn0U+YluR0oFUnTkJQ9XCY1C64FiK/L+4y
	++WfN9wpHy059MtKhAe/UMzKXDp7vyS4rCYOA0PIzAarATHzflJ6/Jv2+duKBr2KG40+BJi3QXj
	9HjvM81IAHkf4sXYmjK/CLUDc+xuXidO2qT5ctqU4TKusT9OnbFOhlxVI8A/doqiJd/FNN18jDa
	/V1mPSVfV4zEEDtZ+5e/99SawG6JppSTqys5ODBMdptCUMMrktGfKE/buPGg5bz9PSmrmzBhv9f
	4AkqsFaRYfP6VOw+LpSl9BEaMfTmM8G5nEYway8hnz2zCWbO8zv0CQyiK/kFc=
X-Google-Smtp-Source: AGHT+IGbNgf7+PMwpFVitfBiS5JpRk9ZY6Bhw8rhVyQ9uUxESvKyjn4kdacYngkZSwJjogrg2TD+EQ==
X-Received: by 2002:a05:7022:3b89:b0:11f:3479:fb72 with SMTP id a92af1059eb24-11f3479fc18mr2407060c88.6.1765576241683;
        Fri, 12 Dec 2025 13:50:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm20549337c88.3.2025.12.12.13.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 13:50:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
Date: Fri, 12 Dec 2025 13:50:39 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: James Hilliard <james.hilliard1@gmail.com>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/25 12:17, James Hilliard wrote:
...
>     +       /* wdt already left running by firmware? */
>     +       if (_wdt_running()) {
>     +               pr_info("Left running by firmware.\n");
> 
> 
> I'm wondering, is there a way other than looking at dmesg to identify if
> a wdt was left running by the firmware? I'm thinking having an ioctl or
> similar could be useful as a way to notify a user that a BIOS or firmware
> configuration change may be needed.
> 

This is not a bug, so there is no need to notify the user in the first place.
The only reason for accepting the message is that I was tired arguing.
It is even misleading, because loading the driver, starting the watchdog
by touching the watchdog device, unloading it, and loading it again will
likely trigger the message.

Userspace can check if a watchdog is running by reading
/sys/class/watchdog/watchdog<index>/state. Do that after loading the driver
and before starting the watchdog daemon and you'll see if the watchdog
was running when the driver was loaded. But that doesn't mean it was
running when the system booted; it only means that the watchdog was running
when the driver was loaded.

Guenter


