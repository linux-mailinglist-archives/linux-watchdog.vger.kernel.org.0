Return-Path: <linux-watchdog+bounces-4723-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE1CD08C6
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 16:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03210300E443
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 15:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BC832AABE;
	Fri, 19 Dec 2025 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFtIVfnA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24533043CF
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158871; cv=none; b=gy9Q+s62Gm+PS8kiPvKGIgqGG9tj/1SXbIxB8gwzQBHVdMC2GUWDG7ptCZuKhM209KRnt4ClbCsrD+QLAn3oyTwsDyco4W1YZbF6ulqXOilILF9XZoYk+lg5ChsL6WTJrjL69/GE5L37wvaXy7IX+/K2MFl5SK7MTdb2FqZ46hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158871; c=relaxed/simple;
	bh=BRrNcZvVlDwSwnRRU6a5m2aesMieJkkg9nkD+8nzge0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T76QlQnvRW9afUVrnimh4c/anJxSbSER66+n92i7tFDvJykt1kPv54261+SMsjchV19RkaynIRLhZ2jmVS66fVZwZfzqtF9LEmk0T3fkn0190QtgoDgFsOC0QiVCaSgj7pJsRbmyYwThIy04Tdx4hea3PQA94uvh1yv2solOveY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFtIVfnA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0ac29fca1so17055385ad.2
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766158869; x=1766763669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPXvnEl86h7uXlbydiQlqn600f4rTYS35PhjEa5747s=;
        b=iFtIVfnAtO1qW3qBvxdns8ezPF6L0ayGcwsTRztB9fbtbo/DHO62xPPZJmEQ1Pq3wF
         u4K4O1GUXd3omsBvlYr1LlR2zHJipXeFjOCf66GyCz2k3A6vIwYuMUwDns68U17PqGxk
         qKSZ64+k0gBKpowVEPZStDu+ZFi3HEIjOhQZDEOeJl1itpa+wF3JRxNc4nAgTDTS0yOW
         6lpKze08D0aGOzMu7U5dbjv14dx7Aw1HZ3CfAR2Nn7A0UZxzkIGOOfzi/sY+N8+VuCyC
         W831NVhOQRdVdLp06Larh+lyZe5q2TEZxeV3UUuDw3rrKSaB19u6RncdRtFTQM3CdWR2
         E9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766158869; x=1766763669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPXvnEl86h7uXlbydiQlqn600f4rTYS35PhjEa5747s=;
        b=H37DX8kqMRfVDaaipd/NQXoM5ReOrOuuYwzt2Jy1fqIQUG/x/qvYbYgDC5PZZm21jQ
         XTKgjIWYxgmEOjI3IUyFYuVipyoQ6NdfZMTR0n/A3qWcy0LO0qf4nUs39iHGUt90pvmN
         d3owCPWxsZi8+bdvdXz2UwrGLpj/24RFcXhke7xM2luxz1H2MmSpao8hXmMQ4KpkNvUY
         xAeDKgIcKSE3/im1GJ0bzfZ6xaD3pwHqGTKFZ1hOZQUWvDVvHZlBbcTrBPsXetZPQl5h
         EGNujl5kT+Y1GlajV6kRYH6opPOlqUwVQh9szkS9GKYRMPe5OB9MiBe9t5dVM7TuyZx+
         WI2g==
X-Forwarded-Encrypted: i=1; AJvYcCX2bWmkT93EDtiRzM6TqL3ho7Xh0h72t6A26kZSvjr1UKFcrbW14Da6Z8aAHgLU/Ry4dRfr3VBdADy7FIqPng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzri9dosGIw2YSMEnXNBNe9eiMOGj3I7oHa3DEmiQ/t1+ZZ5aJB
	jEKvyJcc5aFwBkZq/KeOMbGdC4PrQBK7mbk2YgnKujJm0WVRnHjTVj+V
X-Gm-Gg: AY/fxX5ml+xwiPLIwLgbpErHWHQAqaT6A7ILPslS8oqda16cgaHGOJnlhjIQjU6mLn7
	zYsnVdToOuLB/wDIzuWH9/LZZrs5WPCzSLy9/LzDIU2YLyY0qfmr2c5W0jFSbaMj3uhwcX9fDZF
	/Jy7Q2aprLY7YnJYclJw2kjhKFF+/YbnayytGmJSE8kjD+HIE9nnpNHrpqJzRAA5urPwxYX5TGl
	M8AVnjw+px9okB4MzSjs31nsJxfkyKgN2ffNroXETdFxCmBOg1oE7iE5iTD9XpTkp4g4Zd0CMGf
	baMQJcy1GdGwIDX44YE0ozgZorT9H14PlexwmY4G/mUU/Nw3CggDOZx20qoJRktNu8YUFbRP3kK
	D2dKLEdbQv7v9Rh5L7G3p1IOpBA/R88eipERq25GOFqJp4QzPPfIsQOHC9tfQGKxCZpna1YcRCK
	3v0FqludrOisfuKR96C91TN2IaDHWuyhw1d9oel9EERVmI0banuwRgmI6HtNLV
X-Google-Smtp-Source: AGHT+IHqFQr9VCsCz94jfHlAbFf1IeLSnEtxm0lVZUjn+gonTVrzhD4100xdi7kegdd/YqdS1Bi3rw==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr32089865ad.30.1766158869094;
        Fri, 19 Dec 2025 07:41:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm25677395ad.81.2025.12.19.07.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:41:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <39f2a3ac-6906-4970-822e-d1f5cdced563@roeck-us.net>
Date: Fri, 19 Dec 2025 07:41:07 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miBbUEFUQ0hdIHdhdGNoZG9nOiBzYnNhLWd3ZHQ6?=
 =?UTF-8?Q?_clamp_timeout_before_updating_wdd-=3Etimeout?=
To: 1536943441 <1536943441@qq.com>,
 linux-watchdog <linux-watchdog@vger.kernel.org>
Cc: wim <wim@linux-watchdog.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <tencent_E88A86F3126F065BA4E3D4FC9CEB1A9A2406@qq.com>
 <6fda7aa7-244a-4650-b120-acd66ca0d1c9@roeck-us.net>
 <tencent_8FC8A3A9BF39EB3529C9320DFC259E0CE607@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_8FC8A3A9BF39EB3529C9320DFC259E0CE607@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/19/25 01:46, 1536943441 wrote:
> Hi Guenter,
> 
> thank you for the detailed explanation.
> 
> I misunderstood the watchdog core semantics here. With max_hw_heartbeat_ms set, the userspace timeout can represent a virtual timeout and is not expected to be limited by the single hardware timeout. Given that, my change is indeed wrong
> and I will drop this patch.
> 
> One follow-up question: in my testing, "/sys/class/watchdog/watchdog0/max_timeout" always shows 0 for sbsa-gwdt.  Should the driver set wdd->max_timeout in probe(), or is a 0 value expected when max_hw_heartbeat_ms/virtual timeouts are used?
> 

The value is as expected, and the driver should not do anything. A value of 0
means "unlimited", which in practice means that the limit is UINT_MAX / 1000.

Turns out the attribute is not documented. We should add it to the ABI
documentation. If/when I find the time ...

Thanks,
Guenter


