Return-Path: <linux-watchdog+bounces-4601-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11368C61F17
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 00:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8337E35D97A
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 23:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABEC257AEC;
	Sun, 16 Nov 2025 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGhHjTxb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BEE259498
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763337595; cv=none; b=NZ4ehGzW4cME3YPrTBOPHeUAYXu6NaufAO2SIsLaeYLjdn98YcsRZOWItIJgC6P8lfdlJfxewtlLOt4F3VeS7au/nt+pX2Lm8M2XCwP5ZwbGhb9uis47Ot2/Zl2jbCgIkn8zED9NauAGuYlDJBoMYK7Bi7xsxmnEfnm+kVMUUPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763337595; c=relaxed/simple;
	bh=zHQYsQXo5MmyHztBEeCEPBEvif1dvitp41wZuF5sy2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5/0xvdc+FHkQ63/IsaNnSdAJrc0oAX80vRWJ0ESnZyKkxQXPctdEZZygMqOHIX00QRLkRCcR5ZzcJbxH3COboV2JWkhlrcWDo48AdRBelJKVPOBoFhnMaAWRoxZqvIazKosydIiIic3G8z2LHZzjTRpwLN5ibX1FJz1qc4dA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGhHjTxb; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34585428e33so826363a91.3
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763337590; x=1763942390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tc2nOe111dzTyX787F1g6P/XIFovV3ZNRO2Z4Cs57G8=;
        b=NGhHjTxbhKzzX8AfFtoyFwj2CA5XjiLFmJsiRGu91oxdq2stkq9Beg3y7P3ShN4EZ0
         PnMaCcS00FELjzhD1SAOkYKfUP2RMrIMIWZPPyC2LmweCUkiepe2T0yyZ1G04vkgALvK
         gR3S3avExPKRegKsUZ+nfvyuY9iin/nPY4GEJr+utPlDMfutl483aOWYeJlGpacE1eEQ
         iH5Ev3/8+heo5eGayEOEPj7PHbRQl6W4p8x62fdbxdEGu3g5Y3K6quUosmYJUFEUsfb/
         2eQtrGKwOZYymKZvtyRULjjUeGfVPSxc7BRVskPLixweVxmZXMWkYEq17pgHjjbBeZIj
         QZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763337590; x=1763942390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tc2nOe111dzTyX787F1g6P/XIFovV3ZNRO2Z4Cs57G8=;
        b=FzOjpQJ1Z1/MZX7cwjfgwDa0Y9laAdFwFWgFESUkwRLT6IcUny/FquwN3JcM7paqdi
         sNtF5DdCn4QBlgcQ/w+T1cmWkny09HmDt84DumKuaLzU1VAlVs4U/I3yf1ICmv5iXfXh
         NPhbBo9K6ZQA4pVMctc+SCYl9ArEdZIPIkYfCh54rxkUf7+3/TXYc7a/2EBBmg7vT492
         pPHP/iM/Dei6IVPinLOzdn66EUYdZ39GV0B3g99iM9lPgzTdpZb8qCJAn5ELkeXO96M/
         GgV3Bdqo6yhu1fFZCIXZ8BYFaGdCzPwFBTnl9ZaucfOVCCxyeUJFmvmMSA32q2PWEZ05
         1Q3w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2j/D/eERNuLuHZDc89xNUfTIMMOY5PXveUy9qrsnS23r9IsX5tsHanBEffuvHcXKgiUXsgtizyX+EIP6yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZQgEbCbtcyFRwMzkT9vywkkv8lIvhb2UMgCqAZsXNINbCGXW
	PphFWwTVPByPo3QZFlr6uNxMTsecvAzBbs6JurXwlmRDsQkiPKl7XCMRvFgwXg==
X-Gm-Gg: ASbGncvUz0YkwN2scTc43Y1/L4cjERBomyaD2celVrDm1ETZQ66cOmjvNISA5xzxHsp
	mfj+yqE0jk+DK4hcy9VFFgLMTeqEcOkZiYvJYfFEIpjqttFC1xWnUny/l3I7GjrmJJcpPVgt0u5
	KjhJK4GXb1MF8NgPmXPBb+wZnSUCrXwLSxL5B2/ksxHC9uLvpGXzij3RXgZAx2rLi1pjZl32h6y
	2nUxdCmHK/Dhv6EL1CKcFfFSwN0EQnONEtrwl9X08++DPp8EOY1qG/bXNsnCoxpN+32NkZ21WWt
	+wwat4Y5Rv7wL0YT4Fi8x7mQa5/uw6l7VcK5cGrptZQJjknJMPByU/IMNiCzPtfr3fTDh853Qme
	g0DDourpELPPhxKpMMTobdBstceQ46oqu1rhEQ8SqljAl601D7sYF0rT2uFL91EexU8mRqjOU/g
	Ht8QTkJqoz95CUUc0dIG+vka0iIsDB7S0gk3/5a6nPxGpXo2h26KrKAopNdlxe8OjOGBnfWyNv3
	1QmYvzn
X-Google-Smtp-Source: AGHT+IErzTDV8m04GYr2B6dSY4CCtXvx4DVQNCSjzj01VT8+Xr+xpIlX/AsLh/+vQRi1NgjO/n7vWQ==
X-Received: by 2002:a05:7022:639d:b0:119:e569:f27a with SMTP id a92af1059eb24-11b4120d45emr4079935c88.35.1763337589547;
        Sun, 16 Nov 2025 15:59:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm33991343c88.5.2025.11.16.15.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 15:59:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <071a702a-da55-4f67-9568-0a80cc543e06@roeck-us.net>
Date: Sun, 16 Nov 2025 15:59:47 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251116.145908.308086523429052446.rene@exactcode.com>
 <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
 <20251116.204210.871371429161034821.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251116.204210.871371429161034821.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/25 11:42, René Rebe wrote:
> On Sun, 16 Nov 2025 08:22:39 -0800,
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> This is not a reason for a log message, much less for a warning.
>>
>>> +		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;
>>
>> This should be set instead of setting max_timeout.
> 
> After debugging, reading the core source and RTFM apparently not. As
> the time can be changed and thus .max_hw_heartbeat_ms should
> apparently not be set at all unlike you initially suggested. AFAICS it
> is the regular .timeout and .max_timeout we want to keep setting.
> 

You are correct here. My understanding wqas wrong - I though the problem
was that updating the timeout was disabled by the kernel, but the problem
was just that the timeout was enabled by the BIOS. So all that needs to
be done is what was done in w83627hf_wdt.c - mark the watchdog as running
if that is the case.

Guenter


