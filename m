Return-Path: <linux-watchdog+bounces-3212-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C06A7D0A0
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 23:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12BC8188CB22
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 21:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F3D19F495;
	Sun,  6 Apr 2025 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msLWya21"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD39197A8E;
	Sun,  6 Apr 2025 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743974108; cv=none; b=O47INyMKfM591W6bVRF6JTXYsWpDt9ELpoTsteipbDKs3PJ9np5hWCUcsddPnpxwOAq71KGWlRFrgKlZgQSnc5u/STIK22bhYvQ7inumMQf23mKOZtDrcsNv9fG/z127epVtM02DrbgN+70mtCJhegpIKOPOLdjYuHwdf7OrryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743974108; c=relaxed/simple;
	bh=iKZJ9Fx4Q3W3fJUQFkOjj/0jyOHoWZGFXH1xtLgmQD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OU2TpQ7maAHBfUCDjuRCbsUTnGcUyUgUaVdSAZE3M8PQi6KYpRsf/yhNX/pvfMXsnaPLRe0r7ZarRKk2ccD4Tweh8nq5rTRrEdOgyLcRbTINaDxQNqpPti623LdKm6CzYXxMBe8ZeGvT8avhtSX0H2npUritbPuW7YEm05jVZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msLWya21; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736ee709c11so2956366b3a.1;
        Sun, 06 Apr 2025 14:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743974106; x=1744578906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zDleBR0jwFGhTNeC9UeCz4wwAyXYlgAVasnWCtF6ZzQ=;
        b=msLWya218uN7LjWO2M829dz6z20gaNAeJ8L1RdWEXkkDK0t/5HDR3p+9cv2x/NTmLq
         8bTxmt8BqdKWRJHGZAYnZspaHN/UHGVmP/oH9WTkAgC55uAvI8yzrY+/hcgWXep0co5R
         FuDJBuV36LV93KPwX20Jq7MaIQBdULTAK1WuITXWpE0zCWNavYEHDl7rJPDiKCX4IUxS
         z0F5PL429d7dWcVlrjyabr+WoLOKNCXd+J4DOyT65NlRCA13MrCwaZca+xq4RlgTiYiA
         Ac3SzV8E0xf3cCuq1Vn1sep1kVWqUNETdJnr4+rH1hBlVqRsbcRaXlx9zgsavMU60t7J
         DZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743974106; x=1744578906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDleBR0jwFGhTNeC9UeCz4wwAyXYlgAVasnWCtF6ZzQ=;
        b=WlCr61WaA9zwX4mc93HR34Kns47ADe10/njbKlCns4IBnV68Mmg3sf2f7XJE8RYVnw
         JxDGBDG28cIHEZH43pZpPyxb7uFI15lGv4o21XPAXb+v7lkVLWGZuiolEUe43JeCy0rY
         tZa1ufJ0W2QCvpmcE6Nk/PUs+vLlYI/PuUCINzlFj+KvIKp1hwDBeUIv6gWWW8FbAqs6
         LqI7U2/G/hEpZtv9ESpHZUzt8jKSb6AmNSie3zbY0Sxoff3h/1/3/XzbkkYlJcP3zcrl
         PqRLcB1WUaL0zRVwueVyrlOmiZVqyJ5WRy7ZR/7e//ZJDOBJy99bI/2Oq7uvptAUqmx8
         8VcA==
X-Forwarded-Encrypted: i=1; AJvYcCU/C0OC8GOoB8+lfAxCcVK38Vlz3lm1CKtpxVBHE30QW/E6r+FeMT8OmZn6kGAnTQX8o6IAq1cCb8Yl65ZkBrs=@vger.kernel.org, AJvYcCVNUlrxVqXnn+AIBhqvJPk7XvxyxzLRartbUQT8ElXzUVA1x0Guf9gCOne70vrh0tg6EnmPDqXo0PjZezA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7l9GyBLndTmIFgNPBrfMMofrcsFJ7kbQp6b7BOWChGyJ0VpP
	B4veePjLYwDGZoeEqeWneMrMmNEi59Ilfydm5ZA1C97Eo+EeH4u2
X-Gm-Gg: ASbGncvewrtg5Fy5pFXQyFIGxgxrh5vZrWMDEsc1YetCdxSMWHNZpLPsBMTi3QjFJR0
	1Bn94GFFPk3ZhNgNxQyqMUZizLjQM/p48PXvFxnJSqXKof35Tko+//yK8S4j/ty3qGfkfLU5J6l
	d55Nowx/YBmv2wdTv86fFSlhj8/i+M7fOXNao3N3WhQ+Gt70d3MlLx32KT4FhSTI37WtN5zyAvB
	DCFX8lQRLWRn6uFCj/OUxsS5Zh4bqOU9eVTVVuZyCBgpfDwPEAXzMUf6cz44WQ6YZjI6xxcJ9/+
	rqfsMHPqLgOege3v+ar3e4QmHx2b8wWIiI1mKQR3/XhLnE5e5fsRZ2SqeZP21zd02AFq4Y6pDOQ
	nxmf5fb8MvsXo1oRZfw==
X-Google-Smtp-Source: AGHT+IFQ8QWvvd1ZviCya2MeIjl1ablt6V+jxnurJmhA/g3jhsv/TE0Na/5We5Jj9KIVyelIFaeiUA==
X-Received: by 2002:a05:6a21:9211:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-20108187d17mr15484006637.29.1743974106291;
        Sun, 06 Apr 2025 14:15:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea080esm7286630b3a.108.2025.04.06.14.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:15:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c3c22904-d684-4294-99d6-a83f53545934@roeck-us.net>
Date: Sun, 6 Apr 2025 14:15:04 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: Correct kerneldoc warnings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/25 13:35, Krzysztof Kozlowski wrote:
> Correct kerneldoc syntax or drop kerneldoc entirely for function
> comments not being kerneldoc to fix warnings like:
> 
>    pretimeout_noop.c:19: warning: Function parameter or struct member 'wdd' not described in 'pretimeout_noop'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


