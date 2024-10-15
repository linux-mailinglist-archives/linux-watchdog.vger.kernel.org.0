Return-Path: <linux-watchdog+bounces-2212-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86999EEAC
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B38E28709E
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 14:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3546D1B2192;
	Tue, 15 Oct 2024 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay4Jf513"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E21AF0DF;
	Tue, 15 Oct 2024 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001121; cv=none; b=hQfT/FIKcF9f48+sdY80VM0voXH7ENZnyci1WOOgk+GCoOiliHMmF9NwoDX5+7eOWK3JCBenfrQE8lGvFrW9KgGOP0xOmLfJTwJXEJeUtK92DMM4oz3iZEn9wy0NlLKaYD6j2VZCInNsV8RHXYGbvBkx04Qd+zwaVHxUzY/KbM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001121; c=relaxed/simple;
	bh=ZuSKa6RtEAwqSzF0Imu8HavW2XrXsY8QUCnRQPs4zCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+gL/vXw6LQr0ruFy3NHQTTz89r/RuM3+vp12H9uBiEGaFIIaNHP2ctWzciJeYlkEqh26RR64DGcNL+7weFGFIwlkRmcUVmRd1y8BhYE9InFW5drGYknaCv9t1MZvhIV1U/jLH+r9KP6oxaSjP/vSanTVqv5rAVm5m6r6YORwn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay4Jf513; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e1c91fe739so4173570a91.2;
        Tue, 15 Oct 2024 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729001118; x=1729605918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sINTlp+lAb8Vry6g4stAnZM3QNEY9NvOkRtit9foqPU=;
        b=Ay4Jf513AkLUaCAPJ7SWxEg0IshVUJLBsbEzSyLq84yIXDDiruZSrRdePHHCs7LGu1
         FnI7IiyUOK4y92KzK53lYz2f/Qe6Tx3m32RtXfoFyG8hzbVGsX8zsimYYPBhvxT5IhfC
         Z9bhuoRjRvKmfBowR2oYaBGThaDVib+zRKjNBpmLpx6tkUzWzBrYjNKioKfYQ+ifX3e9
         ZWAD+2YHh3xUOJ4MGR5s4K4ouNBudNYGFrLlu/jdx3ZQNnRwP8UnKg21lPyyocOVu+Sk
         WzzxswOmmKr4YlaXMj3Q4Pyf7lelQG4Oggncv2U6AFgLU6/vrT8lVg45MeWKTTntR7iI
         ZCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729001118; x=1729605918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sINTlp+lAb8Vry6g4stAnZM3QNEY9NvOkRtit9foqPU=;
        b=qOcE1SIdrIlTwY+vqwE1O+SRNu1eboSl6Oe5GufqbSCUmgEHI+5Vvn8LRyoe5ZANPe
         XJ6DOqkF6msipUf/8BVFzvqJ23bbHNTd7n1kWPTNkBHqdVDf/8tY+f7XmHCMuE9ezNSC
         KOPw5wY+O6Ddu37QHmQr4J0Tbfiznrmmr1HtEHVU3mriuu2q/Ya6/jcxnJ/Cd5sFw+aT
         gTyUqKkM5fvK2s/ShLGbzGM0S+v44qI/aDr5Wyo2wYpiL8myVQHCX9tncwBiqufBCj2u
         CO03Shy8hQNZmK8cEWjkcwa61iqVF7yvxzyGHfpDjHhTMhtOchU2o85lbzEMCIsRuSx1
         42VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW70cJdepZjzatOa02xVQdiPe7Tq+E3XXvy1BwaxYpcVL7tu7f59PzYgi+JXMG/sg9X5ZHpvWcSk/7abrc=@vger.kernel.org, AJvYcCWmfZbHAuU14h1VKNewjg/PSZJQtbV24lCylLGt69ssIl0xRn5bMiLPnMCIaVG6ydbhL+J62THzLi5vXAebAwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuDHpu8iNH7iNbYkukMZwpA+tR7PDwcDiecznWdOZ609wJpWJ
	RwAcNguV+ZExkDTRRFTfB6J75LB2fKXXGFUQnjyTy7LnfBTdj2iw
X-Google-Smtp-Source: AGHT+IFXhpVdTgwZKve0IhbN7lXgT7nISMjj7hVxoGUOg8J8BnWpxVaf4gy61Ncyy2MFOaDxLesMpg==
X-Received: by 2002:a17:90a:1f4f:b0:2d3:c638:ec67 with SMTP id 98e67ed59e1d1-2e2f0825fc1mr16573225a91.0.1729001118380;
        Tue, 15 Oct 2024 07:05:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f0394asm1798799a91.30.2024.10.15.07.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 07:05:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <424ffa29-5d05-4a58-9fd1-09ae177ad781@roeck-us.net>
Date: Tue, 15 Oct 2024 07:05:14 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Delete the cpu5wdt driver
To: Jean Delvare <jdelvare@suse.de>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20241015133701.35e26fe5@endymion.delvare>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241015133701.35e26fe5@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 04:37, Jean Delvare wrote:
> This driver has a number of issues (accesses arbitrary I/O ports
> without identifying the hardware, doesn't document what hardware it
> supports, suspiciously inconsistent locking model, doesn't implement
> WDIOC_SETTIMEOUT, potential integer overflow...)
> 
> The driver was added in 2003 and there's no evidence that it has any
> recent user, all changes seem to be tree-wide, subsystem-wide, or the
> result of static code analysis. So I believe we should simply drop
> this legacy piece of code.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Message-ID: <20241011170710.484a257a@endymion.delvare>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Ultimately we should consider removing all watchdog drivers not implementing
the watchdog API, or at least declare them deprecated.

Guenter


