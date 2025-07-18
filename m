Return-Path: <linux-watchdog+bounces-3885-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2B6B09A93
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 06:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68DC189236B
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Jul 2025 04:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE081CEEB2;
	Fri, 18 Jul 2025 04:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikQGbBPM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D93117CA17;
	Fri, 18 Jul 2025 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752813548; cv=none; b=hQE4gJTsqKo3zVt13kIwMBmaLhbg+gGtXnjlMik9UIcU7qh9yWN5yGEUXkEoVjAHLG/GqBm6p1a97f4RQrmjQPbX9JnPx8Ky5dj1dDdVO+vN7ex1tX8BHWFmrwvwIHdYif4xy6vPnsBURmCtepMUgiYMObLMCEPIcdXud9LrlTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752813548; c=relaxed/simple;
	bh=EmI+I+BHN0u10uLmfL+8Aw9ycZHF4QW4wHBp455XFkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwcgXpBwVX9YbUZTN9LyNbScbWJtr8ymrsZIek6y5vLScn8K22GHvJzWW7vlaTNCoz7a4SNt7fiznDoQ4wY5WV8O4OqFSZQzSmhmwUkjxChG+1f0egknTmEQmJCws2iG6YWYs5vlUGIelp5fBnr1C3WmH2AO6bJYhsXNglJTr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikQGbBPM; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b350704f506so1481596a12.0;
        Thu, 17 Jul 2025 21:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752813545; x=1753418345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sfeLjYAu3LNDX5KgUF9PABLyeDYQCAc3TNVfU3He2PU=;
        b=ikQGbBPMZ/iNYJn5uZsjpHQzEh1jx3l+LChkMZAB14Ud5UBraJwACBdz4JLyn89XmT
         fpqKxv/LdgXF2sLbflHAbqQu0cfGHPu7zSYwMyhPYKiBlXBQqpnofPDVuv8lJ8wDz5oA
         ryEDD56GIM1ZZTx6P/LGrdPZeO76UmqgQuCTJTqEVkJNvMLI8IdnJUyj6vz5thI63uM5
         Y2sV5VkUvXaFaMQpMtxcugj/Ifsmsfwi8AUUnCgy9knuy09VpvNxLjHxrHfZUn0eDUPg
         FjFmTlLLIRU6tLLtAWth7Gxkbal9heVo1/K2gjK534QotQBNaI83NweBA0y6VT7U044E
         Ipww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813545; x=1753418345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfeLjYAu3LNDX5KgUF9PABLyeDYQCAc3TNVfU3He2PU=;
        b=N9p5Qq8WzGjQ/UOU6zHoXk8K6zUm8qX0/IRFcQyfcIpWUiz+nn51wZ9+OI/mPuzlqC
         d9d+0cJWH8z/4UeFjRSZsH47j1HdiP658BI+ktoOn2CyZebp9tZryWWP8Zgy8iXJ/EOR
         Lw/1Jb9+G5aCby2auS3GVJ6eK1CMsIrYnIzKPNCHYhxfqIiyH0tIP15+GYgVQtbcG9Lx
         ENAu7DT5Ieenf3lmvVTIOWP+WSCWAIEZ43IVsFZeZwe9kVBTuimAChtIJdTJ/FTMvxw3
         dz7KUKcl9HWzFGh/FVmKH4a1V3M2x7qVh7VYDbeGBStexzagys+fadOPPre2e5T9iPPH
         RvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPu2ddgtIQOHaU5PVwkNiDXUqWo+6n2kckXwGBMb8ntn9QpCGLEjsrtpZwxBK1CcUfBmKBoqDemTouRDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YypYm14Ni1oROH/NP1gs0l4Ox2Jk/O88aEoRlEDNvM3kdgJVpV3
	Eq4Y6exdqiMD9BDUtu1vv1RIMA3/9qFqAV2rrpMuEEC132Un9srqcFkX
X-Gm-Gg: ASbGncu9LAhr4mzxvEEiAsLhlvtdlyoBgyfCzvbMEOAq8l4n4AFgn0DNC4ieWpX+4Y4
	wSRUHFesGXLrSvubXOcera8Ywa4Epf2ulABI7YTpX9+E4N0lKTO2RZolOy9J2HyodAxSrPQTCWA
	rHxSkBJ1AvjgJRTslulXLEPrUpfVmdPHfl17JzEsE5YZ9ooGVeFXZtRgzpNKQNUgYi3xPlpcGko
	FpMwy0hdub02HP6Watm+4HccQiVi5EKYR7wvhMeEngsPUyvFQCE0J2aZ+QDuSf56k6wpVSFDkEd
	gJinHFv54BWH/FmlDlhgXsyz8427fU3+spCpOyl3rBpg77PfUnBJFYI1YcRDpbNxpHbcjsIRF8T
	FWz8jSkzZ6Zew4ntqQQiDwZl56UgvJZczcaHncQKaqckPeaWMv+Jd3jAyB99tOm7opbd/gZw=
X-Google-Smtp-Source: AGHT+IHArLiUBO6W83sIUwfOHin3uXhUnBrvUGIMqXEUxCvaizahnGqcDBn0beQl/HcwtKF0oVMn4Q==
X-Received: by 2002:a05:6a21:4a8c:b0:222:ca3f:199 with SMTP id adf61e73a8af0-2390c80c19dmr8461189637.18.1752813545229;
        Thu, 17 Jul 2025 21:39:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb15699esm391941b3a.82.2025.07.17.21.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 21:39:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8128ed3b-235b-4e2b-a858-d478d70a1c6b@roeck-us.net>
Date: Thu, 17 Jul 2025 21:39:03 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sbsa: Adjust keepalive timeout to avoid
 MediaTek WS0 race condition
To: Aaron Plattner <aplattner@nvidia.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Timur Tabi <ttabi@nvidia.com>
References: <20250708233354.1551268-1-aplattner@nvidia.com>
 <08cc0273-6c26-4ff1-b5fe-75235bca7a9f@roeck-us.net>
 <cbd0cd0c-83d9-49db-9e84-a8807e6dce75@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <cbd0cd0c-83d9-49db-9e84-a8807e6dce75@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/17/25 17:19, Aaron Plattner wrote:
> On 7/16/25 12:01 PM, Guenter Roeck wrote:
>> On 7/8/25 16:33, Aaron Plattner wrote:
>>> The MediaTek implementation of the sbsa_gwdt watchdog has a race
>>> condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
>>> the hardware is processing a timeout refresh that asserts WS0.
>>>
>>> Detect this based on the hardware implementer and adjust wdd->timeout to
>>> avoid the race.
>>>
>>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>>> Acked-by: Timur Tabi <ttabi@nvidia.com>
>>> ---
>>>   drivers/watchdog/sbsa_gwdt.c | 52 +++++++++++++++++++++++++++++++++---
>>>   1 file changed, 49 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
>>> index 5f23913ce3b4..81012dbe9088 100644
>>> --- a/drivers/watchdog/sbsa_gwdt.c
>>> +++ b/drivers/watchdog/sbsa_gwdt.c
>>> @@ -75,11 +75,17 @@
>>>   #define SBSA_GWDT_VERSION_MASK  0xF
>>>   #define SBSA_GWDT_VERSION_SHIFT 16
>>> +#define SBSA_GWDT_IMPL_MASK    0x7FF
>>> +#define SBSA_GWDT_IMPL_SHIFT    0
>>> +#define SBSA_GWDT_IMPL_MEDIATEK    0x426
>>> +
>>>   /**
>>>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>>>    * @wdd:        kernel watchdog_device structure
>>>    * @clk:        store the System Counter clock frequency, in Hz.
>>>    * @version:            store the architecture version
>>> + * @need_ws0_race_workaround:
>>> + *            indicate whether to adjust wdd->timeout to avoid a race with WS0
>>>    * @refresh_base:    Virtual address of the watchdog refresh frame
>>>    * @control_base:    Virtual address of the watchdog control frame
>>>    */
>>> @@ -87,6 +93,7 @@ struct sbsa_gwdt {
>>>       struct watchdog_device    wdd;
>>>       u32            clk;
>>>       int            version;
>>> +    bool            need_ws0_race_workaround;
>>>       void __iomem        *refresh_base;
>>>       void __iomem        *control_base;
>>>   };
>>> @@ -161,6 +168,31 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>>>            */
>>>           sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
>>> +    /*
>>> +     * Some watchdog hardware has a race condition where it will ignore
>>> +     * sbsa_gwdt_keepalive() if it is called at the exact moment that a
>>> +     * timeout occurs and WS0 is being asserted. Unfortunately, the default
>>> +     * behavior of the watchdog core is very likely to trigger this race
>>> +     * when action=0 because it programs WOR to be half of the desired
>>> +     * timeout, and watchdog_next_keepalive() chooses the exact same time to
>>> +     * send keepalive pings.
>>> +     *
>>> +     * This triggers a race where sbsa_gwdt_keepalive() can be called right
>>> +     * as WS0 is being asserted, and affected hardware will ignore that
>>> +     * write and continue to assert WS0. After another (timeout / 2)
>>> +     * seconds, the same race happens again. If the driver wins then the
>>> +     * explicit refresh will reset WS0 to false but if the hardware wins,
>>> +     * then WS1 is asserted and the system resets.
>>> +     *
>>> +     * Avoid the problem by scheduling keepalive heartbeats one second
>>> +     * earlier than the WOR timeout.
>>> +     *
>>> +     * This workaround might not be needed in a future revision of the
>>> +     * hardware.
>>> +     */
>>> +    if (gwdt->need_ws0_race_workaround)
>>> +        wdd->timeout -= 2;
>>> +
>>
>> It seems to me that this is still racy. If the ping is ignored, I would assume
>> that this is reflected in the watchdog registers. How about reading the status
>> if the workaround is needed and issuing another keepalive if it was ignored ?
>> Or just always issue a second write to SBSA_GWDT_WRR in that case, maybe after
>> some short delay ?
> 
> The window for the race is very small, so triggering the refresh a full second earlier should be plenty of time. Are you worried that the refresh will be delayed by a second and hit the race window anyway? I'd have to check with MediaTek when it is okay to read the status registers to check whether another refresh is needed and whether we need to delay the read and for how long.
> 

I am concerned about hacking ->timeout which will be passed to userspace.
Also, that change does not guarantee that the heartbeat will npt be issued
at the wrong time, it just reduces its probability.

How about setting min_hw_heartbeat_ms to a value slightly larger than
timeout / 2 ?

Guenter


