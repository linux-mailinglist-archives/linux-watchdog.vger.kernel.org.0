Return-Path: <linux-watchdog+bounces-2815-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A14FA23FD5
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 16:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B5721884CEF
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 15:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87B114B092;
	Fri, 31 Jan 2025 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6pFpZ1o"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225881D0E2B;
	Fri, 31 Jan 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338281; cv=none; b=MbvDVjOPiuF4/z2k8M2W8UPfpklv/IXXTgzqm1EgmDMuViK0yXfaAqxShdxGs3tUbDVnlCCpZ4rst7f6Xk9ZLFBuwUclGV7Y1S/J4xE9dmBN/T4gkdwgzzbWo32VzdfRNFVuXIYPmnJQhvKuCfJtz8k+NF9R6hP02wwJ8IbNJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338281; c=relaxed/simple;
	bh=lcLm9SSvUlLY0ZzM/AW8Xevl2bPj3NG0gFCsBflcDm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuFMFjnZ3eCNY21fK3Wwp90q4A5t4+WuianI0CcvqYGvwvaYF/DhVhfWGtVcmfVnthgGFziQidwtyNBoep/tC7QHndHNonBiWlY9qt1BEVte7MMkUuEZLAg5YgwhVfR0mjq8VHL5HSnGRDvKsSKnHHVHZVuCGzlBVQQqlgANQeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6pFpZ1o; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so38637675ad.1;
        Fri, 31 Jan 2025 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738338279; x=1738943079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rnTU/By2h1Kdt2bvSDYTHUDEomCeXigEUkCqGnwitys=;
        b=T6pFpZ1oQQMPlc/uGCzSqee4/MIiQp1JQQKCNktU0Dm/VX8EmLd6nGBb/+q7pre+AR
         69Ur1m9Re3CAlBWoz/3oMEESaRWoT8ALNocb1Ty2ZbhcBiU8iLUaFtQoLHMVBwiZHgg+
         D2yhdeZsTCQzW+uZaFk9+Xk+sHgANtCg9q6pRtaDU5LkZg2mVLH4raBWsrRWDiuCRQWu
         CVk1/V432RI5GQoJetcMlCZym5fq3gUOK5xOah+O0DLggCXo5YDtlxGYeFMUA1Pyrwnl
         wk5bsiI26NVQoX7VnphlGUDaPAWRAGOIgB8oEg+XJ9SbbDHq3i59vIqNkEYbPyTcIzyM
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738338279; x=1738943079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnTU/By2h1Kdt2bvSDYTHUDEomCeXigEUkCqGnwitys=;
        b=tNelBvfxbRqgW64SxB44AYb7BMLRJe8u1ZlEbMzE6Ffj0NOE2SymSfcFNkiqUmpxNt
         cYT9I+nj5P7mADfKNR+OkAKsDP0TgLpHcPlk3MfHgT1m/PYX0Phn8b3rkygdD2FQEPIu
         yl1WJNQd/wlbmknLPJAegels6AKCeL1dyi0Wi7o6RDI7uGMHULTSgJ7N+mXOtoG9tNDT
         niEYigyPXJsmjcsM0zUxwqZZokOeC5xjvTG3vzuDVrUh00t9JLbhMVzy+FAO3Rza3Zml
         C4E3XvyXa6Goxte/1Dh8phalXpm9VSlAEvilx+E3OfpxXFyRgZjiXxhQWQB2jGtOB98G
         5Zcw==
X-Forwarded-Encrypted: i=1; AJvYcCW2HYFu6jxsUFgjwKt1FZJ369YuW7GCInlXclRXz81gkjUVZNK41k4UzdTKQpw9LZ/IcOJwsVbkf0Ye7V4=@vger.kernel.org, AJvYcCXFAMBBQ4iFVybOQ6cJsne0x5fEIBB4tKU5OSDTtkeed0f9rYjLTcI1o4a1SnYkgxS+K7xAWiSa6nlEKrtD9k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxARbo+orsoABkLHfMov5ABimM6rhWoJZH4EJd+twD5bRAPqpgd
	7MZHAKYGaDuI8waM39KH37svxpBdJJ5qe8J3aZk11bX4b74z9vhL
X-Gm-Gg: ASbGncvvgsAc8eQf64c3ZbC+4cSfxmTE0cGKYP1Gjccdkdo3nwj8fo1AvBl4oid2sNS
	PIYYbZ/KwlxmrUjS2moV++gGwXlgYJxNhEQlkOsKEyggqmAjtcRiv/8UXPGC2e9oSDLzmUfLoL4
	T22FdyXyxq6PM74AEWHBrXp5lb6AqmSkwCtd3TdpdivwCIVTgPYP7Dh61oZWxrhKSEsleDJHySA
	z76MyC6CW7iOJtti0t9u6ogJxlh2bZhgiE1e5/AkiRKaKe5M8AH8f08sBOxVaDEk4sbcL7y3FiJ
	5EXQR16nGdfuzIYSNKFl6NciPjEdpMRRNdyEI2iXFaJ4p6VcfTFJaCVN7fRNJ4uF
X-Google-Smtp-Source: AGHT+IHxHBbsYsw5MiWtqkX2SyYqmSLL2h0ALS9r8P6xSZ+NlZYhmTfld+dzhl5gAJcWprAk+G9dew==
X-Received: by 2002:a17:902:d58a:b0:215:ae61:27ca with SMTP id d9443c01a7336-21de19cb4cbmr115350625ad.26.1738338279164;
        Fri, 31 Jan 2025 07:44:39 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33206besm31715045ad.241.2025.01.31.07.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 07:44:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c7571180-c643-42e9-b2b8-4da07c9394c1@roeck-us.net>
Date: Fri, 31 Jan 2025 07:44:36 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: dober@lenovo.com, wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/25 10:29, Mark Pearson wrote:
> Watchdog driver implementation for Lenovo SE30 platform.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
...
> --- /dev/null
> +++ b/drivers/watchdog/lenovo_se30_wdt.c
...
> +
> +static int lenovo_se30_wdt_set_timeout(struct watchdog_device *wdog,
> +				       unsigned int timeout)
> +{
> +	wdog->timeout = timeout;
> +	return 0;
> +}
> +

This function, as implemented, is unnecessary. See watchdog_set_timeout()
in drivers/watchdog/watchdog_dev.c.

Guenter


