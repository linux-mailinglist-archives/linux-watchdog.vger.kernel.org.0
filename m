Return-Path: <linux-watchdog+bounces-2819-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F64A24538
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 23:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EBD93A48C3
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 22:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD654192B66;
	Fri, 31 Jan 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnsPl0A4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9431547E4;
	Fri, 31 Jan 2025 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362387; cv=none; b=AWH8FibDEdjM5fonL5eVPMWN2/mi4+3IQgdQ7OD1hROD8viFUvLRJMv1TcCUQoeXNPOYjgCqX4eOcZ3wQEeEYUxyaWjCnAJLh512bKsZAKY1aE+mOfmIhg6pvFhNsUMc/veSpmLYfmbfQgRTAKkjDk5ig1RTEAqm9Z1XBt89YSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362387; c=relaxed/simple;
	bh=OgUXJrUeJvprERmitSRLxVjTBBH8BrCM72OrWSR20Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAqbftsRjVReAG0SMXPT0D+S7er1Ni2TZFMzHILd38gxLtdnPNtB3200xQ6Q7DvA5J/M5EZDakLLOEsAnkKP0ebFOgusreo+cCrMqRf/ul6A0DsNT5p7i8x5Itmt1OkRoyDm1tRax8T+Hf34EuQeQUHuMdjOpqvNxVzIvqVCINI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnsPl0A4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so4411540a91.3;
        Fri, 31 Jan 2025 14:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738362385; x=1738967185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O1N8qF8wxkIaqT7isLgj59NRHAsf5z/eWOihNCvPQVc=;
        b=YnsPl0A4N8WaPEcB8gTKdfiRpYYIZ5MsoU0Mumur1OvxsHrPLddm+XeMyG9Zype/mR
         v8h+Zslqy6nkpNud7YM7LO2y8raLtc4jDvic6vyy3lD1Csjc62Lvpe/Vz/Oo65GALo8B
         porEva+MNpmcewARD2k2M25MuR5P8Yu64m+DyDhL08ZhrfA53BYjuRw/ha8UTK0QuDMh
         vlg/UQ/jd6xBhjqeqJ9QubHFR1p9qgL7msjdF4v8sLbtrolrjkWqiwrYUBuD7894tHnI
         RF6mAEeIbBbFTyM7iCl+XwobSxFGXbCXDOynicCHhQuiLlI3PMpqKctZ8m+vQhaV7tl1
         4Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362385; x=1738967185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1N8qF8wxkIaqT7isLgj59NRHAsf5z/eWOihNCvPQVc=;
        b=iul3WtOoy7woodHrCI8hGogqiF8/6rHyCapXC1dJ5CknkSrNeivI/B2BHNNCAHc2WM
         gr4CncXA2Eka0i4IeVObkYuM6ykmde0sJIO9xnvrm/S6gu9kg6wR5T5NAHCjbPUmxblH
         /Nqdxr9HqAkzNmZ0JGRAeEuVBe9gN+cMPj2WADSF0DzyhK+Vy2EdSY3wHyg2epAjSTY/
         rZY/O1+mZmeKoQ98TzYQauCND0vHCPbxrwRb9N+/pqLFQTJcVzjJA5jz/bXpWlfwZUDc
         AN7S/i/7VwL+xAABVwy47BXgY1jr0baOFwu9UYmkO+3NGwVAmosq6m2mrgFGyyigmoBM
         xHKg==
X-Forwarded-Encrypted: i=1; AJvYcCVnCa3wubnysk3hzplkH5H8VhpzrPRJxTbdGannEfeBfkx8qMX8sCGUzKD7ozXLYAOU/NS0Wv08EYnd/tNXImM=@vger.kernel.org, AJvYcCWXe5ftwgTvbtpbNorF24Y88+jSeKhAskjb06s+zgDXRk1NuZpFXxHtFUKtgRHLN+9TgQ3k6o/Asc4mBlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwxqXTUqbPgc4XjjmItRsP4xSyuRxLphvdQpt1/+MQrI0i+y9
	ZdvXYR3QMBfbbXrUUcxYS50cdF8BtkOzVYIAduqJ+J3367zYnIak
X-Gm-Gg: ASbGncuvrz+TGDvrk0lIH9+mlUDhcFME45yVS7dFoC3QZaHK6h0e/+68Wj87TJCtxFb
	Svdru+dUAZ3/O/NoDfNOV5FcAZk+7hkaQF1nEGIerkD4NALGoyxwhMduqv5XpMMtduYBXL2/6RL
	9wzHiigjhHOshvAD0YbJwYUDe5POWAEkAFWimNbaqQ/oyAq5Sm946H6O8eB5ZPFf9qbhtkW3JFv
	4YDuhcbWhyNCLExwQELesKhgGe6yFBFWJjnNeBanYYoK0jm6u8n9j/bRVqHE3jg9qZfgOe/wA4o
	AJiw50SwzgmfX6EDgVAS1Y8DVy3cMAdL7KwsPjWnDDkY3/JS13AqdviPjYDJ2H3e
X-Google-Smtp-Source: AGHT+IG6AF++SREIZSC2RLDhfXHnVTBwaMMNaCH/iC0yaaOu4MhGVZIijPhNO2xWzvyzhoOQB5f5pw==
X-Received: by 2002:a17:90b:5688:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f83aa8279dmr24002782a91.0.1738362385132;
        Fri, 31 Jan 2025 14:26:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfdb81bsm6407936a91.49.2025.01.31.14.26.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 14:26:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28754bd6-aa1e-4f48-8f48-e7d54a9d282b@roeck-us.net>
Date: Fri, 31 Jan 2025 14:26:22 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: dober@lenovo.com, wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250131204855.1827-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250131204855.1827-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/25 12:48, Mark Pearson wrote:
> Watchdog driver implementation for Lenovo SE30 platform.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>



