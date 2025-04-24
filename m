Return-Path: <linux-watchdog+bounces-3384-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9020A9ACE8
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 14:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 378063B7EC2
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 12:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6D122A1FA;
	Thu, 24 Apr 2025 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlVIXJju"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F472147EA;
	Thu, 24 Apr 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496610; cv=none; b=MK7w5dtRn3SjTH8rJX4CC1cEpjjsxYeebvVjH9PlqKfKJm/t6vEH0vkLIE1Zp9MPnBIev1ssCaIgsh861ufcQp65MlW2wiYz5N9RlkpyGLXBnGCl2fjdDzv0O1+wiDOHbuzu641fu89UwJlq8Mz+BOplEYkobENwt31czZN6uwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496610; c=relaxed/simple;
	bh=YkxuED/HPMVTzxMfaj/13xIMhTlcrbMb1CQQCsqaRK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTmk1h1GGR431zfte54UFMqFCdJF8+eAm0/MR7Qb8htCvDrCVIQd6/o/jJ/rmexrmCBLQt6x9AX9BRh5nAE0cH3F48VKkDpti2+pkxj7tcdfYLdPtKGfoLQl26iJiOy7ZYuBfURwxMLz7dahgnlF02S+eYvbcZdYhNcdj5dGtNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlVIXJju; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227b828de00so9101095ad.1;
        Thu, 24 Apr 2025 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745496607; x=1746101407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EX3SgmhMPLeBJmDhxjtUamBoOEgguGRipxPe692JA7E=;
        b=IlVIXJjuDAoStRUqTXEHzoZI2fXFYUx8vEF6IOTpU4WLdH9HUo+WcHuOjo76Kf4LOh
         1iNdABTgIDVAHwh+OelC1QhUkMynVn/lx6xfVnanxLI4cvKkG6/qDZ8g7+UP2LBTj1Sg
         SMGoaWSTuGV/ukF0nFP580jWdOYj0BwE2hJVNHmqGTJuTIHJoTLnR5XW69LvO1/KadJW
         BZ1ErK4g0AclxI5a7WciiEwTBs3bGPwOnQjtxLAQYJ3ZK/cOQEY5vQofcWONcos+RVQX
         Ql5t1OSLnfi9GZpMadcH+YoxXxOwpgYpQLhgDDtZXz54oPJxry97yUtYdBUA1bM/pYsG
         NPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496607; x=1746101407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX3SgmhMPLeBJmDhxjtUamBoOEgguGRipxPe692JA7E=;
        b=P8sqPrtc/KkZl+f7rtktKd257d7tGxKRjO6arylQNdaCp3sCOmdsf7DvtWmNF7nu2i
         ZGwGMrkXtmSN32b84OfMLeBlbYPC6ldrpJuVp3s1eq+dPdsVvHR7birXpI0dOtnXUnDl
         cugoeaYF96QQ6FVB59cV+rCcJXLx5lh4dfQoM2vRErilybVJpzPBi2GfU/+4EQmlXA3R
         Z/O97FMgPQZVpmoBAsVURCpRqX9Ft1wtupBZ3lR0iclPdmOBa2Fh2dhGgjnQnJvZd6kb
         x4aWkFLgTUeDvNgNIhfawi5cqnOScZtfC4mgoUyNO4O5vmWCNrvS/a/LwAPFTelOHc9c
         ycTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIoJaRH2fUwOUJ5KZSxw3KzVoLeob8GJAHYh0Bg1xnfQkEaocOFC97jiR0bzAkCYXKk6IQbhxBSGpMEwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGyqfy0IPAwG9Kx0fUn0/kkdGLbWCiXoldAhtoDxWPU6iJ7ASj
	QzbjnOiOomYjoMgp/ZHdmzb5XBJezYIi8uO9Y6r0m6tycwM5D6KW
X-Gm-Gg: ASbGncu0CdIzaw/lrGij6hiw92RNMW5ChC2IgZOPf5QlmwBjoElG5urfYZ6BLRp3Mv+
	x1zQ4M9CgizlO675LY1gcjwcynTLFq1tuW24m1zKVHf5dOHa3iXWVyIjXdm6J+w85CuKIk1zigN
	jhkQQk1qZn+14jXijOWcef0Td0Pt+6eaJzqQZ1WDs2cpTDUFrOL2CI6UXF6DKagPX5qAEdEsaqR
	w8b/fu0AxFICHtn1XbxN79ucGHvaWEqDXCCT07sV4K7u/rl2vgogu73oviKCZ/hWtAoNAH4Y4QT
	u//WIn6y+sHJIfFoVErmrRcixxh57uEWELjtaKMjgZWeXkd3cRVBs67kMG7GGdeL2DSi+RIHaqC
	hOdloftLYawomh8QygqcL11s3
X-Google-Smtp-Source: AGHT+IFiMwRg9krBKjHCGQ2cWM8EFLEJICW5R0MKaOqIXB69g0tVB5p4duEFx3SzKPfcdMO5SBhSyA==
X-Received: by 2002:a17:902:e5c8:b0:220:c813:dfd1 with SMTP id d9443c01a7336-22db3d777c4mr35729795ad.36.1745496607318;
        Thu, 24 Apr 2025 05:10:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcb0dsm11496585ad.73.2025.04.24.05.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:10:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e5b126df-a311-49e5-bf6f-fe59dd083bb2@roeck-us.net>
Date: Thu, 24 Apr 2025 05:10:05 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] watchdog: lenovo_se30_wdt: Fix null-ptr-deref in
 lenovo_se30_wdt_probe()
To: Henry Martin <bsdhenrymartin@gmail.com>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424071648.89016-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250424071648.89016-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 00:16, Henry Martin wrote:
> devm_ioremap() returns NULL on error. Currently, lenovo_se30_wdt_probe()
> does not check for this case, which results in a NULL pointer
> dereference.
> 
> Add NULL check after devm_ioremap() to prevent this issue.
> 
> Fixes: c284153a2c55 ("watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/lenovo_se30_wdt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/lenovo_se30_wdt.c b/drivers/watchdog/lenovo_se30_wdt.c
> index 024b842499b3..1c73bb7eeeee 100644
> --- a/drivers/watchdog/lenovo_se30_wdt.c
> +++ b/drivers/watchdog/lenovo_se30_wdt.c
> @@ -271,6 +271,8 @@ static int lenovo_se30_wdt_probe(struct platform_device *pdev)
>   		return -EBUSY;
>   
>   	priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
> +	if (!priv->shm_base_addr)
> +		return -ENOMEM;
>   
>   	priv->wdt_cfg.mod = WDT_MODULE;
>   	priv->wdt_cfg.idx = WDT_CFG_INDEX;


