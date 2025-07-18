Return-Path: <linux-watchdog+bounces-3887-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3401B0AACA
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 21:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F65E1C46EB5
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 19:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB6D517;
	Fri, 18 Jul 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy1L0Gm8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1341E379B;
	Fri, 18 Jul 2025 19:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867922; cv=none; b=bszFtbxd5puNvIcKK6UPLdNtl3uY62GUFvExuWXDXwtrdBXMzc9gpCGWOsN8Ts44E646nOLRqv2pazRu4FkmrfZTa3gGMHhNYvYSlc1TtTqk5kqgfk52e8RuVEnIl8UFur+E0olk7SlmA91LyaxNXqFUK50n2pJJLZ3vW8BefxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867922; c=relaxed/simple;
	bh=V+xIb5sU3pMiZg1FQYQ1g1B5p1d3HvYa33eEvK6J6bE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW0YwfAescw2Xv1kNTZbpXE971QqHLz4NEIgB8Xl4Xr7PInfHdFPlp35hKwqhF6OCVjw8oa/fz4n11lRF07IUY0lHImxQvFDZXgx8Cnzb5u3iX9/JdBH9UqFtF+yfzUjGnwP4sFDV9uz3By8b/tGqEQ3IVfFgtLBdkzuAxN0ikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy1L0Gm8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234c5b57557so23650255ad.3;
        Fri, 18 Jul 2025 12:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752867920; x=1753472720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8k91OzzHrBmSNz3hJadNtfDbazsr0HjZ2gHE7qoAzxc=;
        b=Iy1L0Gm8c1SN3CsBUmqv4YKT+tyqqFh/D9m/mX6HZr08oRHzDduyz6gCWzHx02FObm
         6us93Se8F6i+FUjT39MZyQnpcGxPD2yxGGtBzpYVf0VkKJ6ek3TdIrhAV5nk5wB/ZQJe
         iEO/CjSLEn1/x7FAT2tU4xeExIqRiWcgbknBphmMQUjaMn51yP9G4k6+FMA6X9ZRE3as
         Gw0iRcX5z1x1XacQq11vZIM/WhUvkUgbfib6jN24JUgrMXEeGIh/OYZOOUUdQ/W4f4OR
         xxhXn4hwZ1H0sMqAoJHdfh55nrm2IcIt6e4efghMxc6KhgnwQCtKETWTvtCo1obbxCEC
         50og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752867920; x=1753472720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8k91OzzHrBmSNz3hJadNtfDbazsr0HjZ2gHE7qoAzxc=;
        b=uCor2vSjgGN7ygj02m6u556aMHko/pZuv71vZVnP0Jg+z4ZRXAQ9mqey++58KQRXP8
         QB6mvhMqwrBxYsJ7B7ECLSbBKfhp7QlTcGOoCPY1Q13TU7eet3w2vCCw9JiJOXMHdW3o
         HmEDij29hIxt6GAlfLbYcJHKwXwT188tfuk9VDPEkIGM2OTrgVMlIbTnovCBPEtrM6mI
         iDD1UTvNq/UTbARFDv9gZTfm8t9gelM+mXJVANgchVX+7+oXRUH4K6Fh4HLsOQR2cfSU
         UL4C/WSW7unyI9yBcr3sh3jBK0NoOstxoBhtDzS0RIVlS7/ZBvaDXIag6SePdsltT3pf
         qjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEYbCVRop8lewVlO0rqz7q6OI8L5LNR66qyLlyJ/VP45NkMorQ8ZxDt8hFxz+m0Yx2E0s40XH8kaJdn0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDWLSkXLh+yIitJ3M6C/BTV6OFrFRLV1ueoasxnasbIDQP87DD
	rVI+xLon0S2M0qcwme/GLevLix1eKCJn628frof0Gkq7QVVi5hXpLRqL
X-Gm-Gg: ASbGncsJSA/vNCl/0lMCe4W51W9Z/OHkmWTDdP6HSLD79vdn3EyENxb5j7xdVKQWrGz
	LJ9OyRDjLkPuDn1S7qB6y2GLoftQDpe8FgqkZiD/w+gV578pW60doG0BQyJq7ar1J6Ku+L6gk9i
	o7pcnxzrjpLVv4G8KV5MFF0xSP3TtyiEHqcQcrUqjJxNmtsLVQH21Dfn2q3toDY8H1yLnMovwJI
	8UXDkrX3MxP3VT7/6ahIK+3Hcn55byN72wi/WFMPB8Ggn1MuVvKEHqbOLZZi+PlV/stlWA35VeT
	54WR7eHXZmP4Zk+RbeM7z0RKNwwyPxsKvno7LMwQd6oL/S0hCCehi3VvwIRA/LorLaqoUrm3xkE
	A1x0tk0R146OehEtzprThrnvETdbQmfYDLy+vHqTcFAvdDzAqiPHO5aWuE6csUf9R1UDiJtc=
X-Google-Smtp-Source: AGHT+IEy18SMuMjST0dAswHidNkn4KeQeZOBbdip0wKCHbbRpUXrZ14zlXNSGIUpJvzakY0QktN17Q==
X-Received: by 2002:a17:903:41c3:b0:234:d292:be72 with SMTP id d9443c01a7336-23e2573019amr162403905ad.26.1752867920261;
        Fri, 18 Jul 2025 12:45:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d06sm17310515ad.43.2025.07.18.12.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 12:45:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05d07f4c-a82f-48fe-bac5-e947d0324e98@roeck-us.net>
Date: Fri, 18 Jul 2025 12:45:18 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: dw_wdt: Fix default timeout
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250717-dw-wdt-fix-initial-timeout-v1-1-86dc864d48dd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250717-dw-wdt-fix-initial-timeout-v1-1-86dc864d48dd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/25 09:55, Sebastian Reichel wrote:
> The Synopsys Watchdog driver sets the default timeout to 30 seconds,
> but on some devices this is not a valid timeout. E.g. on RK3588 the
> actual timeout being used is 44 seconds instead.
> 
> Once the watchdog is started the value is updated accordingly, but
> it would be better to expose a sensible timeout to userspace without
> the need to first start the watchdog.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> This has been found when setting up a CI pipeline, that
> intentionally runs into the watchdog timeout.
> ---
>   drivers/watchdog/dw_wdt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 26efca9ae0e7d2fea1b2eaf68085a70829b62b3a..c3fbb6068c520133c8a4ca97313706e877857a7f 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -644,6 +644,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>   	} else {
>   		wdd->timeout = DW_WDT_DEFAULT_SECONDS;
>   		watchdog_init_timeout(wdd, 0, dev);
> +		/* Limit timeout value to hardware constraints. */
> +		dw_wdt_set_timeout(wdd, wdd->timeout);
>   	}
>   
>   	platform_set_drvdata(pdev, dw_wdt);
> 
> ---
> base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e
> change-id: 20250717-dw-wdt-fix-initial-timeout-d4b3a2ada6ed
> 
> Best regards,


