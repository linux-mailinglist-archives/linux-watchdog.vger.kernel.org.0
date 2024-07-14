Return-Path: <linux-watchdog+bounces-1378-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1B930B3B
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Jul 2024 20:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8171F212B0
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Jul 2024 18:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03664134DE;
	Sun, 14 Jul 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evD50kUf"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FCBFC11;
	Sun, 14 Jul 2024 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720982750; cv=none; b=MHaMpQfOUsuUIlw3xBUh59uKNQz5oBFkXE3onfzy4nxS5RuFCQ8d1t4g6vnzESgxIeVfrPc4qT2nJOytYxqjq7a5y2eCOFJzTNH1ue2PMLY6ZJUy+I2ntC8dJ4HpPtPPbIOwW4U7cr/X5w78GPDEyTnXPR0pn6s9VifDsr4aY9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720982750; c=relaxed/simple;
	bh=p5tbMs2YW40W6pJLOB4vRrgfc4P7tSoC9pP2b1oqHMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyydgYmAXxASRtx3M2DE+VaGsSUBDcRP3aP/EBxUPf9eU8wsQe7jAJ9brFgLAZ8aiqpRdUs98hFMZFe1J39VQ5Uu+fMGLaHE9nhqz5bIqvlgKpacalo2gLnO2CfSs/injaag8HRAcvzCpV2yVCdkvkblXGEFZkVS36d1YHOnP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evD50kUf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2c6b27428so2321454a91.3;
        Sun, 14 Jul 2024 11:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720982748; x=1721587548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UZVwhd609Xa3e9eANZ3Lis+cCAUg2rNBckG+Z9vX7uc=;
        b=evD50kUfpG1+unlGrfS0iKtIZ7Ydr1E57DrzitG8Ml+n12+lprPj2bfa5uDKbMbkp+
         322k6xmlXsZzFZFIlaTIoFEGkWJ3v5O6Lu4QJ90IN1WTsdGIqey/98efgh35u/gBTcV5
         eZ9wVNunVPwbgyn76UUOv7hHEpP/8T50lgvVurFLr3CxAFG4kJQJnCgFFLE7F647yUr2
         K9FyjilhYMEP9PFO/PmOaGhDtQNokLb5xPrRzvxqnlme2s954xeZuhOiXR1rN1GbZ4DD
         fpMS3SJUs72GjVpfPh9aaE44dHP+Sa6QtqbwUJwopdzYmz6q3m9O/IJ16KtYIkxQPSOq
         X0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720982748; x=1721587548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZVwhd609Xa3e9eANZ3Lis+cCAUg2rNBckG+Z9vX7uc=;
        b=A/1zeAA+3XRNlnZnoibuBT9q8Nr604WTxHG7WNwUchid7a70zuKoUvdPujmEuhHD6O
         0igFl2wV5ftC+MjhaAbVkv7SMI2BnMRsG7G1bYEp2lrR5sVMKW3dWbrshGrUMfuTnQSY
         eJQGFONQtglX8j1wm1GA8+svPiQiPiP0kqJlws+7i+OLxUoJCG97Y1moGIp/r5YsHy//
         JpBLjAweTMXePj301cakm3nJ+uEXH+xU0kDNJuPntQcfvQgOzaWrrOaHTnGjhbDJDzFy
         YN1VfB5vQ/65KXJaXYu171kekTksE1hyxMzC+vEz+KeOt10OnJnZwqjC61/UOr7nnc5A
         0Hiw==
X-Forwarded-Encrypted: i=1; AJvYcCVYIgIvqQr4zac0t+FHLmCbnsgwXbcygEX000JnimR4uGN+E7KWtY0gHDu+9UHnCP+hs0CftgB+muKpSw3CLZXLDxOcaUKl4WNTNzCs
X-Gm-Message-State: AOJu0Yxng/MvP5dmUqjhsJr05pvPgqEEwtB7H5wFdQ4Q8ontOWbUgcrr
	/7SV3+tHiKZ7B5U7exhttw5MpHLyon8KmnuTg5nzCV1y8Zm46eLi
X-Google-Smtp-Source: AGHT+IGdxQpUMjY7OjFURZPReJ2HeCv1f9g+/Ds3I+VUN1mshAUDu0cgdS6/xjscVkltfhu5wgNVlw==
X-Received: by 2002:a05:6a21:3949:b0:1c2:8c32:1380 with SMTP id adf61e73a8af0-1c298243ae8mr18852496637.35.1720982748199;
        Sun, 14 Jul 2024 11:45:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc52abesm26375415ad.293.2024.07.14.11.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 11:45:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8f9fde5a-9346-4767-89e1-efaf6288083b@roeck-us.net>
Date: Sun, 14 Jul 2024 11:45:46 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Inform about watchdog timeout.
To: Mathieu Othacehe <othacehe@gnu.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240714154623.32676-1-othacehe@gnu.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240714154623.32676-1-othacehe@gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/24 08:46, Mathieu Othacehe wrote:
> When the kernel stops feeding the watchdog, inform the user that it is
> about to timeout in X seconds.
> 
> The message looks like: watchdog: watchdog0: timeout in 15 seconds
> 
> This is helpful to warn the user that, most likely,
> CONFIG_WATCHDOG_OPEN_TIMEOUT seconds have elapsed and the userspace hasn't
> start feeding the watchdog.
> 
> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>

I don't like noisiness in the kernel, and I don't see value in this message.

Maybe Wim thinks otherwise, but for me this is NACK.

Guenter


