Return-Path: <linux-watchdog+bounces-2767-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656BA1C7D4
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 14:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 601843A5CD0
	for <lists+linux-watchdog@lfdr.de>; Sun, 26 Jan 2025 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E511862A;
	Sun, 26 Jan 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdQ3lJIl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C725A642;
	Sun, 26 Jan 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737897021; cv=none; b=sWiRjw2+p5TSCvdu7UqZx0EJdCbYr/c2hYamAMwnOeYiN7Pi7Jz8WFl4iZRKqGDJ4SXSC7dWsvBPWRGWui1Y5SbyYtX9z42pDkx8OAbJvUZMril8z5gMBDDgW9xSLVj4IFt/7hcfvJpQBOZH7xijv7nRrkshr7qy8TXOKkyMGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737897021; c=relaxed/simple;
	bh=N7PgW3auIBgzNky/kNWWhl39lPJnzcICapfIdb6BOqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaIDst7qHoSpClDz9IupOK9Mn9MyOShJCbYPSbdvUmlhvDn074pjg0zlAV+rZydvVy/ebtAjneLTEPOS+J896pOKo+LLeJvXsK2oxab2zMHBEBnVlL8d+JZluJwBsN9xt4JD2ew2HfuNe/icqaAt+6NmZyn52VtchufY8D0yvo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdQ3lJIl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-219f8263ae0so64730755ad.0;
        Sun, 26 Jan 2025 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737897019; x=1738501819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cAPLBaOeiq7UgHn+hQOI6mSfS++Ep1/29AHVvwe7p5M=;
        b=CdQ3lJIlfu36H7wGQIJhn/B245eRxMFc+0vx+iAhG+ole4AFRi62MXUQK4x11JFk+f
         KjqAO77qb5rcmmPBQnuAObW2QRikP1MEgEtC3dBZGCtCBOu9bRSTLrjKYAd2xJQQlLLr
         Eb1CsyqZqoFyCTxUXfIyIskjhYAHJLLATyrg9ewkisEMsDxxiA5nRAZjuIU6zeJkHj5l
         4CLdDQ2sRR3HPkBuOf1sj9mOBhz9VlOz7uoC9wkQG452f7jPGW5HjBh9lztJ6TpXp6G6
         mcyPn9RQyTo7CDNqWxZGImgDeqKyVYarXccg5jaOnb9zY+MOVgSLiWwEcA9gdd0Ysc+6
         wTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737897019; x=1738501819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAPLBaOeiq7UgHn+hQOI6mSfS++Ep1/29AHVvwe7p5M=;
        b=NuKZmyJmlCYv91ZqIbQnUMq7S2QRg8z5fu8wUn5B9mXnWNp9UgNPhEdrH4jV++Ssjn
         cxpPADJZ31wOVUt+9OZlSvytMeOEf8b3B2cVcR+xKBt7TKRELZ7HUKwlj4fmv7dwQIrK
         /zKm/pkQnz6jxgxyWD9vAly1Ke/MehmSHQohgf3ZTKzZAgGugu5aHHQKxFsYgNkIzBip
         IwxKOw3ceCug+rbS7CPnm7l4Nd1+oQMp3b43lwVT6JY1UWTYqQbIaRDo3K7WNJeyC6v5
         L8JikStMyOvC+OxccQLxRtSrihpgYU++cmEseB4DMk9HNDUwEpJjCIPZYD6sAEnvyRXw
         51KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs2uUUR8qOCmJ6LlL994ZYNOgTnFbeY0xc+VuZLR3kI1biFwEVhjEojYj4pzQO4Zobj8lzRBEufCy7Scc=@vger.kernel.org, AJvYcCVTqJzIiMEJIPgpoUav9X2Ng4ffCN+00d1WrmgMU9af/tvhBqcoN5yUmP1TCDlQO84YlnyBeDChTEFdJOHCGhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRGC+G3960LmEaWZT1psg0/Hl2RlM5aUPFXSPKe038bLQ78aZo
	fqtnULiBiIuTyFJMaE14pYQ7UswdpmXkt5hPx0yIR839ku8A8ul+
X-Gm-Gg: ASbGncs5Ym53vjWEaY0LJdcDs+x6B86nUrTtLmKZ9aH1C1q33+7/0SmBymPE5JagGNa
	UeRsWwNf5F3wyMjgqrOyiI/aCnLRiMLs5v+dQbgal/4p4uUrgnPB1IzxR5fC0x6tU4D6GLSroZ5
	jusb5m3McXtqxHF0QHfGWfC/Q/4jk1VI7sN8AuTJx+2V8M8ipUXQDoAY0pGLGpX7F/plgsZll7D
	TvnAgwOShn7/JYxXp5cfQ5CpQGpT4maUjt62i+9Z7an2IG2Ay63WkMp+Sk6+rOTMq1ObPDkkZDc
	iUIHpr6JnOO3JgBwPKdkOKKCR9zE9aas+02x2xwaHxb85ZvvXIWaUg==
X-Google-Smtp-Source: AGHT+IHVAeKoph86JZsrT7/oMf5qHQBPbGEPHcicwJ+dTJWUUm9aU8WDX6e99m6OLAITh0vaNMNfdQ==
X-Received: by 2002:a17:90b:5281:b0:2ee:9d36:6821 with SMTP id 98e67ed59e1d1-2f782d4ed5emr51214544a91.27.1737897018686;
        Sun, 26 Jan 2025 05:10:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa450c9sm5168960a91.9.2025.01.26.05.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 05:10:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec80adaa-b383-4acc-a86a-5a9276c38740@roeck-us.net>
Date: Sun, 26 Jan 2025 05:10:15 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
To: Liu Chao <liuchao173@huawei.com>, wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: caihe@huawei.com, lixiaokeng@huawei.com
References: <20250126083850.34623-1-liuchao173@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250126083850.34623-1-liuchao173@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 00:38, Liu Chao wrote:
> Every time the user echoes 0 > /dev/watchdog0, meaningless critical log
> is printed.
> 

It is not meaningless, and it will still be displayed after this change,
making the change pointless.

Guenter

> Signed-off-by: Liu Chao <liuchao173@huawei.com>
> ---
>   drivers/watchdog/watchdog_dev.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index e2bd266b1b5b..0a9d5e6f3a88 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -960,14 +960,15 @@ static int watchdog_release(struct inode *inode, struct file *file)
>   	if (!watchdog_active(wdd))
>   		err = 0;
>   	else if (test_and_clear_bit(_WDOG_ALLOW_RELEASE, &wd_data->status) ||
> -		 !(wdd->info->options & WDIOF_MAGICCLOSE))
> +		 !(wdd->info->options & WDIOF_MAGICCLOSE)) {
>   		err = watchdog_stop(wdd);
> +		if (err < 0)
> +			pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
> +	}
>   
>   	/* If the watchdog was not stopped, send a keepalive ping */
> -	if (err < 0) {
> -		pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
> +	if (err < 0)
>   		watchdog_ping(wdd);
> -	}
>   
>   	watchdog_update_worker(wdd);
>   


