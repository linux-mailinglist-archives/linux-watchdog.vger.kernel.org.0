Return-Path: <linux-watchdog+bounces-2835-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37147A28398
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 06:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E442D188700C
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 05:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53686324;
	Wed,  5 Feb 2025 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbPCD4y8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF652770B;
	Wed,  5 Feb 2025 05:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738732861; cv=none; b=CmirZm1lXTAeoCQ8JxBEoK4quaaFzyaMwfMot5eInLF3eji/GT9JDrngJqMjzofb4eUgifOvGlRNL8vMAvkP9U++ID/TFAYzp7RoQ16yBQ6THRtl1uInRCjfR8S2JA9oFPrCRRwaszPjvokIoPyahfZlcgOdbzNMsKwBVo+0cOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738732861; c=relaxed/simple;
	bh=flleG7oNr7iCUfgVprHTDvaDvUHRS/5qjPvDrcRGPY8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=avR1pdiygrVMV5TjieN/sWe+PgombF3NX4J8wdfKy48GK6Y/wFfDgoI9ktnV7yBdLM46vn7ldnwPwDsUr4KqfZkCLusASb+syLazow3xYss/ClxutIVUiPc27mifZP65sGhfNvF1HTXzheZ44y8t4zhSIv8h6aB3OtxRn1GHFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbPCD4y8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso2939340a91.1;
        Tue, 04 Feb 2025 21:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738732858; x=1739337658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WiMzVsBr8S9VRJ6XnyKkmjVw7/dHKBHgOQBTjUzdy7w=;
        b=WbPCD4y8qMG4E+IMRnJRGZ/4FpGZFGuVL7HAH3yjrEAPBD1p5zWJloLDO95t6RKB8i
         RsIfifIiUm65ER6HC3Zp8JUryqF4y0X0fAk1TpAB1PMQxDLMuFVkvnWOxP9bTwbazrr5
         5kF2AGwOHg09OjpMN8aMyZGugU7GeboujD8O2ahPVqnwsF431BpbZmoj2pjgZNvNf0vU
         McT0B9qCOeP06PoQPhKKOLaa8mSIYwAr48UqfWFT6cBYRz/226HlSW06/PYQ0pPHGz5y
         m2E7ILbWjV3IsE8Aam1XuCNRJp1sHRbsUz2NasHhuNFX4vbfRrgUyGPQRlS6ya5010cg
         H6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738732858; x=1739337658;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiMzVsBr8S9VRJ6XnyKkmjVw7/dHKBHgOQBTjUzdy7w=;
        b=YtcJ5xwsYWB7uqmGYexzOAzQcqBW8Y4LdUyf9zf5lxxTNMk14RiFU/UbVzn/6kuN04
         ARF0hd/QeSbyAfYIAGyYZR52VmrxVa+rKDkmPpQDt96br0ALDZpvXoUIB15xyPRRvpRd
         oFD2hAmQ5OGA32bUjfQj8WVNF0Kxqw254e0Zat/RQN17mWlp+58YXrBW5j6WkW4TxJ7c
         ankoltiE0klkWGAUyeZGpY0aZnA8wKV7y2qPR20yy5aPGWvV5oyizM2yDi8f/9PYYSys
         TX4YhefNKIa8M163QVXe8+r44oV6XaS4AQc0q/eM7ahj2PwkniPXDWtG6UPGtQPEgOxa
         5AGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNVeWbVzf3y2GQXtzgMt9j45+NWgIQ6FbqRzc+4RQgRPFxzz5dJBkZMMxbJH2iPB0mt07Z8J87MqOpQbA=@vger.kernel.org, AJvYcCWFv2QyereT09U6UN7MkzQuy2HMIAnv7EldRyoWvvZWAhlDcIH6m8cCf3EoTj3u1qymLNfs52FjbXMOxLvn914=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/sj6vSxjrUarmCwxj3rN5TubS/lwQw8WvhsR1ofWGRVdBLits
	mK0MVSmt9uyp3AR0YNlTExCbRmvxVClY2ofMmfdjKAiVPGZ1xfnCYe3kVg==
X-Gm-Gg: ASbGncuPfPKOOkxslG71xDLnVTHGaEK+1rpHJepWTn/atQGTbWTsADlOrx4dc72KNrR
	Kz5f9G77/1e7NAhGmqwg7/upYf6oKTYplQcOhHA7UXgR0ZoNP0VCaMOlvXNnIMK1iDXP0g/7KSr
	Ed6bpbh88CHZ+RDncmftOPSkLhz2EB6U0WuFO9ELpURjpJ5HFEfIDa1NX4CMDbM2Is15DuLK6Cr
	u+j2x0/gqUcB0CQM48dU3kAwhrDnaBG5YSipSkEido7sy3FJ6l6SXZX5RpYcNfUMqMHxuwKxs/O
	AStsXE2qeGp9C4Nmxvd4JyORIv1g4lv09scEBjsFT+u9r0mzGudGav5XbXscqrlv
X-Google-Smtp-Source: AGHT+IFKbhX0iUyzSVT/UUGFVUXOxdyc+XQN11kbjiRj1bFuAgHeap8Ay9TAYIrUJLRf5emoXb5IEw==
X-Received: by 2002:a17:90b:2c86:b0:2ef:31a9:95af with SMTP id 98e67ed59e1d1-2f9e081077cmr2267615a91.27.1738732858400;
        Tue, 04 Feb 2025 21:20:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e409a9sm535669a91.47.2025.02.04.21.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 21:20:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <76cf411a-c68b-4839-a134-16f2df53f354@roeck-us.net>
Date: Tue, 4 Feb 2025 21:20:56 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
From: Guenter Roeck <linux@roeck-us.net>
To: "liuchao (CR)" <liuchao173@huawei.com>
Cc: caihe <caihe@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 lixiaokeng <lixiaokeng@huawei.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>
References: <a59651b1a53c4362b0416a3252d9c750@huawei.com>
 <e9b135a6-f398-4acb-b3ab-01732e94645c@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e9b135a6-f398-4acb-b3ab-01732e94645c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 20:28, Guenter Roeck wrote:

>>
>> User creates a process and echoes every time to ensure that the system is
>> normal, the process can be executed properly. Otherwise, the system reboots.
>> So the critical message keeps printing.
>>
>> Is it reasonable to change it to info level?
>>
> 
> No. The user needs to echo the magic character instead of "0".
> 

Actually, the underlying problem is that the user keeps closing
the watchdog device, which is not the intended use since the watchdog
is supposed to only run while the watchdog device is open. That is
why applications like watchdogd are normally used to manage and
control a watchdog.

The problem here is that the user insists in doing something wrong,
and you want the kernel to adjust to that wrong usage. In a sense,
this is like persistently driving above the speed limit, and instead
of paying the resulting fines (or reducing the speed), the user wants
the penalties to go away or to have them replaced with an informational
notice. That is not how it works, sorry.

If the user insists on their current approach, they will have to live
with the consequences.

Guenter


