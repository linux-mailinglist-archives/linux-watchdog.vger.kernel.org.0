Return-Path: <linux-watchdog+bounces-4393-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB9BDDF56
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Oct 2025 12:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 000A634DFAA
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Oct 2025 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8F431B119;
	Wed, 15 Oct 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isX3Krsr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958373168F9
	for <linux-watchdog@vger.kernel.org>; Wed, 15 Oct 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523932; cv=none; b=HsnW9zX9G2Dzkwe+LApM23dWFFO/blxOSF9NWUFaYIi+MB3+wJZvi5gysZSY7GrdDDw9jrJfUSK5/lEaiIy5eI5RUVUEPWq2h8hDsruBDL+BUa5LfjyF9Wg5UGvZ85AdGk68V0NX6ASSQUjou6iRQRv6L7ZqdBLTDpTEla3oNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523932; c=relaxed/simple;
	bh=EdmVNMEdzhVGagPHRshWBZyNedGbuZxbWBj75ZOC7Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R//BPdeSJ66VX1RD53jjwgZKUiT8s8/oy81d+iMCwMcVoTmgs/sY7CfLTAdxrH9iMPSTMlqKGBGvwAzgvbPfEpWYlS9m5EejJe2FH2/XIvo5iD8RnwsasTaN7gOJVUqM/y1w6Judynojg305y+wr4fWNUoXHSkCYtrgHuKkMFB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isX3Krsr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-791c287c10dso5365033b3a.1
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Oct 2025 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760523930; x=1761128730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpDrH61coc+DItWQj52GloHTcnEX52cLDzSouFLikTM=;
        b=isX3KrsrTiDSximgv+7psZ3t1fN0ubd/T9onp6rUiR0gOH8iPwnamaWHbuKxL/pItK
         S5+EZ5D25YpX+g34/YxExix5qmM62rSIfvf64TrEwtQEKDDOX9dcnHLLm6ZXMM2dHu3/
         z/niI8mYRztieJ683NqGVc1c/li/g2xq+n91stNd46rfS06D4wWUK/RSI1+daKwf+DZq
         cW3PkgL2B79Ng+5WMEnhq3w6l0ldnntpCFExeB9I2w8riAWlVWNGfY8MnJwVYy1Psu/i
         2llAtELp5xGXflTzWA5RDm95RKVmNv/48F92bPI1+etaPy3NYkcJQ6FGuwiX3YAb1Skz
         iP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760523930; x=1761128730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpDrH61coc+DItWQj52GloHTcnEX52cLDzSouFLikTM=;
        b=jZoZD/4r24UZtEzVfTlqg0od+juTLwZ2E0/jeqpnCnYbRj3Zi8wklZuffJPFpsrtUG
         3y5B4GhZdd0ECc591P1VSaI/NkQiFe1dwpaE5//N6Vpg5M1vvP1Q/X1UVgLxWuMXk3N8
         yio79GoPF44NVRtjOevoOX+qBjc/bPh920KttzphzJq3P1+01aS3PS4Ev16KdgbIOsy5
         o2MqNWC+6PgiWlyB1B6xm0uuD6DkkvtUgdPf9yEWE/ojyxHhvrHnm+HPWN3kA57cs3Qe
         AL1/UMuxdTJlwa8CNhwIffqwtvkhxY4xhbPlfEYQ98+PW/FBu7z02lJ4MAi+QV0j2flv
         4mwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhFmu4b43fv9S2U93680TfuMNMnFv0EMFhsqfTGqni/gVFHWIufUyr2+ipkr0pgdqNV51fZsSi0e/RRk7nZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwskljtGT0ndhuWHl3CcvBV52y3+PVCG/W6pCwKfBJUilqOAC3U
	xyYmiz1nKHN6yiZlbuKubItErv55OkcXSUx/CtA6AXej9azYaHZ5FggJ
X-Gm-Gg: ASbGncuUmLLyR4EXHuqdrk/F9DiZ4lHjIUaW5ponSB07wzdu31f0oUuQs4OPPPbeU3h
	MQ9yYKuNQMqED8YI+jp9orp8PW/HoXg2cYzfZbhiQjmE9yT5SkI4AvfumGqeD92NIeAt/Q9HoQg
	NI1jHrit7TUxf5hyNrFF8U1iWQadqwU6HxZq2BZTw0KLWcsD5qTuoMdGw9ybAaoo/aiG7y/gse7
	g1HYTYfyBOc1WLm2PHehdc01Uf0iu+M9N6pTUm3N8YyYh5nyy31aoVNQRYwb6Y9ARKngSm5uoGf
	m0xlrcKrP+FAJD+c3wWiJc6qMp6XOv3WM6PujKOh3zMssLh7ua4LdR56e71cevjNBNYH099NmLR
	+clxAd/Ni4pu2z5cJ7j0HnGFSyaYLjjdk1trHRquDj57L4bQI607MSE6jMz72k6gVBE9qz9ze4+
	5Z2PQbWTSJ0zqOsXLbEQEy+SHC
X-Google-Smtp-Source: AGHT+IEGry8vLqyCUE+lved+//YETCdDCkIKIK+IHR7ZNEywfhOIWLZQMXRVwuUtBrz6ojSm+DUMPg==
X-Received: by 2002:a05:6a00:23d5:b0:781:1f5e:8bc5 with SMTP id d2e1a72fcca58-79387829439mr36878231b3a.18.1760523929749;
        Wed, 15 Oct 2025 03:25:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060a38sm18426137b3a.5.2025.10.15.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:25:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7cf0b3b1-c1e1-4df0-abbf-c4e4b542a836@roeck-us.net>
Date: Wed, 15 Oct 2025 03:25:28 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: renesas_wwdt: add driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org
References: <20251014112953.25712-4-wsa+renesas@sang-engineering.com>
 <20251014112953.25712-6-wsa+renesas@sang-engineering.com>
 <9c1a61f6-f9aa-40b8-9578-adf0e443d790@roeck-us.net>
 <aO6-S6uC1aEsAsNL@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aO6-S6uC1aEsAsNL@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/25 14:19, Wolfram Sang wrote:
> Hi Guenter,
> 
> thanks for the fast review!
> 
>>> + * The WWDT can only be setup once after boot. Because we cannot know if this
>>> + * already happened in early boot stages, it is mandated that the firmware
>>> + * configures the watchdog. Linux then adapts according to the given setup.
>>
>> What if it didn't happen ? Is WDTA0OVF set to a reasonable default in that case ?
> 
> It will overflow pretty fast, but it will be in a working condition,
> generally.
> 
>>
>>> + * Note that this watchdog only reports an overflow to the Error Control Module.
>>
>> Kind of unusual. Why not panic in that case, and why have the watchdog in the first
>> place ?
> 
> We have multiple WWDTs on the SoCs, namely as much as we have cores. The
> idea is to utilize one per SoC. In normal configuration, the Error
> Control Module (ECM) gets notified of overflows and will act
> accordingly. It has more options than a reset, it can e.g. raise
> dedicated pins to trigger actions. Sadly, we don't have a driver for ECM
> yet upstream, but we need to start somewhere.
> 
>>> +	struct wwdt_priv *priv = watchdog_get_drvdata(wdev);
>>> +
>> Maybe use container_of() ?
> 
> Ok.
> 
>>> +static irqreturn_t wwdt_error_irq(int irq, void *dev_id)
>>> +{
>>> +	struct device *dev = dev_id;
>>> +
>>> +	dev_warn(dev, "Watchdog timed out\n");
>>
>> So the pretimeout may trigger a reboot (panic) if the pretimeout
>> governor is set to it, but the real watchdog just says Hi.
>> Does that really make sense ?
> 
> It depends on how the ECM is configured. It can make sense. If someone
> misconfigures, it might not make sense. But maybe we just don't use
> pretimeout here because for Linux this is system-wide while the WWDT
> usually has a smaller scale?
> 
> Does this make it more clear?
> 

Yes. Assuming you know what you are doing,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Happy hacking,
> 
>     Wolfram
> 


