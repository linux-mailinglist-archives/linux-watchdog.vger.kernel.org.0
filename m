Return-Path: <linux-watchdog+bounces-2500-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33579E223B
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 16:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E883516843E
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Dec 2024 15:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D41F7071;
	Tue,  3 Dec 2024 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsF3KTNz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64B1F6698
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Dec 2024 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239009; cv=none; b=jbsT9W4wFup1kF++gDkieYWunpHYSI8n99/asS/zRUq3aFwW48RxDvXUQRVGfJU0KyaVUSKHHhI2lG7mJwvTmCkbll+Cl8T75vHhyVZzNce4b6xJFEyFMS/a/VIou0TIzN4ukNWhL34PiGDT3RCdK0fTTyrqKzzWTJV4ksBkWbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239009; c=relaxed/simple;
	bh=n1aMLT+bz9zlpMhHlqhw1pLzEFgqgWtaQBZe1kxtaPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvYqHN7TMFiMw2YsFkpYhxQE5HaOpbtAMDwtKK428cc0fIs3bmhluzrvXKAdjmcRPFW8stAjcFN0vJu5bMGQMUrOpGNBxCoKXu7o645NATDUtrqVKgdcImx0HuKjfuU+98NMf7fiGoukkrLCuLK6LQCUuCI989FvVvv9aW/GBHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsF3KTNz; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso4346200a12.1
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Dec 2024 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733239007; x=1733843807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=89YKLRzn9zOH0nQuUskkOUPH4e8JKryQbi+/JTlgn4A=;
        b=IsF3KTNzQ05oRCDZLnmFC0KFLmt2+FgKWoczEhix251rY0HYWNChKdYXyXekE+4QJ2
         XWZADy8ETDLe3+wLtc8WA8+tW9jepckgz8/MjxaQd4glzZl9AIHYQxbvxw74NFf0Wc67
         hJmb+aMqD9IZVzkMsmMGAsW5/mVbu8+vrpBAz6AQm9vHIX27drEUaos8k3Awxcke+Dyv
         zJzK/CEDesItg3glqXIdu72gk7ygrK5H6BYxitVKfY8pr1reMmtzKboSpU4lcM5A6gr2
         04Dm9DyNHUSVrEr6fHlVkOKTAvPYUi0MVZptjE4hlWAWKsFx50qUxbRQ3swWwho+rke7
         gWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733239007; x=1733843807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89YKLRzn9zOH0nQuUskkOUPH4e8JKryQbi+/JTlgn4A=;
        b=FNdk237TWmdIRoOL9o+2iJ1Cq6Ctfi2JFGvEPNAGXQBOj6pDarCDJwpklP+Yu2D4Rn
         vcHgzcIKqt0Ef3/5ULk7HiGEELEwWS7u6oN9Mtpr5NXlLHwNWkDhQF261+nHyAq56uso
         IlLijL/UynStp9wySeGrv9IA7l7DvkpRtj+ZEYVLgNJXXqEpPZAof8Mze3Vu5udxaxZM
         Bgo71RXqS1ykSOY/+7/koMK3T6gvGmoU7AudQknk5oiLb1kx26iYmiMTbi+e0xqYCc4S
         JPC0rlCzUfKTbI2tDDSfWegUQVodq+eWAtVlrB3wrBlgwRtN+CfFE+iLdotByH0/4dpu
         5wvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy/GNeMx6etZsOhcSlo9hHlJ7ngGEDltxlK4K9S1IXKqSNYWX0Bm9G9Udi7RlxCXQgXefNcPPd+chiT5EC3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdtWUz/c4issOKKpi9OTwOfX7yosC5XVRtaQSCaQJG8iZNof1j
	QQzf5oRdpy/ty8jQBN90OqlpRcEoVfMDyrn3MYTJZKOSgl5Lw49T3SnkUw==
X-Gm-Gg: ASbGncvOUsVQErEFO4TY6Dbs8NWgiXTEfcFYN6N/gUsfqwZhDJVyUn2NgiNyBCXPjVk
	O1lxWFJtipL4Ri/v2GTSzHsAzJtHBtpqcnS5rG32QsUbIsbUMErGhkmS0HsqmgB1gNGY9erNTVa
	MvLFd6JtGSt1JS4yFL2w8pMqvDZTfxXxSdxiYEMxLA2p+3ko45JTCxBlF5QAMK7HpeZLnyrN2jY
	9kF1k+CSGuccfEN8+/XKo4I8Q7moXO3TUrW0SCg3JraKZvj8fsNl4QBAI+UjLb4/jtBPkXFtGAA
	4tTfYatKkmaWwzbu7TN1tbw=
X-Google-Smtp-Source: AGHT+IF/VMsbQ8/i0UJ47bG6cN6ekeKU7AR3+CE6Q+2ipiSeiGTM/zBCzIcqbcg1D+Zezz3ERKyU0Q==
X-Received: by 2002:a05:6a21:3289:b0:1e0:c30a:6f22 with SMTP id adf61e73a8af0-1e1654132dfmr4510948637.40.1733239006963;
        Tue, 03 Dec 2024 07:16:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2e2babsm9731209a12.22.2024.12.03.07.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:16:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ef171d61-66a5-4d69-8dac-dfb73e4479f4@roeck-us.net>
Date: Tue, 3 Dec 2024 07:16:44 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: sp805: Report correct timeleft at maximum
To: Mike Crowe <mac@mcrowe.com>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20241202214343.2425341-1-mac@mcrowe.com>
 <20241203095744.3001795-1-mac@mcrowe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241203095744.3001795-1-mac@mcrowe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/24 01:57, Mike Crowe wrote:
> sp805_wdt::load_val is of type unsigned int. When the interrupt is
> inactive wdt_timeleft adds one to the value, and then adds that to the
> value used to calculate the time remaining. Unfortunately it's not
> unlikely that load_val contains LOAD_MAX, which is 0xFFFFFFFF and wraps
> to zero when one is added to it, resulting in the time left being
> understated by about 21.7s. Fix this by ensuring the addition happens as
> 64-bit.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Please provide change logs in future patches.

Guenter

> ---
>   drivers/watchdog/sp805_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 109e2e37e8f0..4400c439c718 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -128,7 +128,7 @@ static unsigned int wdt_timeleft(struct watchdog_device *wdd)
>   
>   	/*If the interrupt is inactive then time left is WDTValue + WDTLoad. */
>   	if (!(readl_relaxed(wdt->base + WDTRIS) & INT_MASK))
> -		load += wdt->load_val + 1;
> +		load += (u64)wdt->load_val + 1;
>   	spin_unlock(&wdt->lock);
>   
>   	return div_u64(load, wdt->rate);


