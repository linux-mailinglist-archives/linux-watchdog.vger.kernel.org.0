Return-Path: <linux-watchdog+bounces-4633-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8CC7A9E4
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Nov 2025 16:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B54474E0470
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Nov 2025 15:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2820F2EBB8B;
	Fri, 21 Nov 2025 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQtxiVID"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE12E2C08D0
	for <linux-watchdog@vger.kernel.org>; Fri, 21 Nov 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740181; cv=none; b=l41JHBG+KrGwYtW0YI4u66Du/rL5E+0UpDWxwFVPun7YlYJsltRsidDNJCIOOJ5C8ZtNHY3LDNT8IDXVDwfz14Uq1eN3X4KassQKF2nCtcikJB+ZEvfMSQpZLoyObgd4Ub2MA1WKDG7pDQWoZP6Q1IJtpbdY4oeTT1IMf5fLylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740181; c=relaxed/simple;
	bh=FaGZS1jvTt6tXYV83OlAcsmhV2ngrUj8bRXjBLmSHaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTMcXd9qSBY+AGjnU6W3581I6YvkKVEiB/XQ/WBe7F1m5jASsHGWvTpd3jn/edwxzNG1BeVS43CnWc8sVH1ho5lmlsD2c6uD0VoqwYOL77WraCHK7LKcQ1G1mAL+hmhjZkT1LVboMJ3SaOaPYXMsekg+snakkkGU/O+isfISu6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQtxiVID; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29516a36affso30582335ad.3
        for <linux-watchdog@vger.kernel.org>; Fri, 21 Nov 2025 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763740178; x=1764344978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=674QVJFsbxVqbAyimzUu0M14/07oha+8CPwhUlXOq4o=;
        b=KQtxiVIDDlhACxVWkFHM4MyKmKHEJ7NOi9vTL7Ydmg3k5GFdyvFHJoO6/ip3MuE99U
         bPBHePYFL1MVLbvaRuw7bcRoUxUFMMwS7190SVbpiQXPH7mpBjBxJrcHuRtzlCrPzo6m
         qV6wCKJJqjn9LE8f/btv/DaI8mK8Ijmsd316L0JP3hErg5wSNdYAU0GUo5teO47cIc7J
         F5ipwJ/SVMLFMMrGxmW8IWP2jIKLCUSO9jqlAiFV93hbC9CJgENy6I03gYT9tRXSZYkd
         KxDsijvaYFXShlpLA9TwrbfA1fXhNSjC1jI3rUB2a9FcJQ9u0KwOie8Fv9wZC3+mCjXy
         D5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763740178; x=1764344978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=674QVJFsbxVqbAyimzUu0M14/07oha+8CPwhUlXOq4o=;
        b=fU09nKYt3EWafQzRN8JnyBd8GcYQ6DjmLu0OEKWG9GM57sFluh2uBaUtR8gCUgrSud
         GMZbNlzk6FLL2rti0VoFWjH3IFkW4XQDJITmYC6C7+y6gPf0S7Q6qgouMsfWgUYDXK8N
         O9T2wnGe+XZZf2g6QM4SlcnOWA3SP8cV3ARi8uVi/LOM4wOqnEamZFeHLr2QY3eZ/6xY
         dJRiO6gL/ACYOlj1AOwRlpeQ7/0YQozeveVxbbido0fqfGt/JhLJHzjnPVoGvRx342rp
         JlndNVuBhjOn9rPvgqfmL8gNwHsl7eQhC+XF2hx+Dntc5z1OlDTE+HR0uIjR3bhp5fmH
         30Aw==
X-Gm-Message-State: AOJu0YxNKCI2e9lnf3YRZxG7fWBr/K/+LKFMBK0VnHSZki770gE85hQY
	D2OZZ7SAPpuh/PVrMPcqAy9QSC736ER7STkGrIcvbKBsrje3qvRHaUFW
X-Gm-Gg: ASbGncvIrzgOBG3MBLix3liz4wRahw6mtz9xxdxKZoxhccJmwyhQMXJ3alABgj71yE2
	Zy1KZk1F2+97vW+MC4RGGtkT5R/KwBJDxchm1kPFPI4K23hfHL+NrJ2K+szLUDZNzqOjp3lgOEa
	JY/7e9wq2Jw34DmC3g/yCD41mAiYJGV9OeYYcZT/IXuTaj4QoX+DJ9LGoCMLlIS8lWYp+nO6dvv
	rOs807kaZ3ocAIg8nilAS1i6oHHom/7XKQjDqsVNwHqvoojOC2efgBA0XCTMrfBQueCnRqtmCQa
	G3inzt4G5ewTaFCEQkO9ROKxTJk817fqYkcIJZr2f10Qb90g5Ua58MZv5TaAi8UxI0N4x7pTM8X
	nB4YlVjGdyuVE7xXPFB/tvTeS6DbOpDQwA6SRgviZ7kzbi/JrDJfvxsWzYPtVpvAKC2jc6ceoZq
	UV/0o8375CV8iLfbTh5uQZBlsHFquMNpLYmi0yhUXtVWOGtlJeSsQCjNOUDEs=
X-Google-Smtp-Source: AGHT+IHcZvQCwI7c3J4WHbSa2RxKh6+9w0q3DoG9cXmLaCnmS63OL5fS/DCyC3okKwwI1C68YT5uHw==
X-Received: by 2002:a17:903:2f8d:b0:298:52a9:31d4 with SMTP id d9443c01a7336-29b6c6b87c7mr39814475ad.54.1763740178188;
        Fri, 21 Nov 2025 07:49:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b29b37fsm60131845ad.79.2025.11.21.07.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 07:49:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bf2dd43c-f795-4b07-8de2-26856e42f7d6@roeck-us.net>
Date: Fri, 21 Nov 2025 07:49:36 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sbsa: Update the W_IIDR Implementer bit mask to
 0xFFF
To: Naina Mehta <naina.mehta@oss.qualcomm.com>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Plattner <aplattner@nvidia.com>
References: <20251121061411.4185792-1-naina.mehta@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251121061411.4185792-1-naina.mehta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/25 22:14, Naina Mehta wrote:
> The implementer mask defined in the driver [1] captures bits 0-10,
> whereas section C.4.2 of BSA specification [2] indicates that bits
> 0-11 of the W_IIDR register represent the implementer JEP106 code.
> Update the SBSA_GWDT_IMPL_MASK corresponding to bits 0-11, while
> at it update SBSA_GWDT_VERSION_MASK mask to use GENMASK.
> 
> [1] #define SBSA_GWDT_IMPL_MASK    0x7FF
> 
> [2] Implementer, bits [11:0]
> Contains the JEP106 code of the company that implemented the
> Generic Watchdog:
> Bits[11:8] The JEP106 continuation code of the implementer.
> Bit[7] Always 0
> Bits [6:0] The JEP106 identity code of the implementer.
> 
> Signed-off-by: Naina Mehta <naina.mehta@oss.qualcomm.com>
> Acked-by: Aaron Plattner <aplattner@nvidia.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> * Link to RFC: https://lore.kernel.org/all/20251104063937.839138-1-naina.mehta@oss.qualcomm.com/
> 
>   drivers/watchdog/sbsa_gwdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index 6ce1bfb39064..f7cdc277eb3f 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -72,10 +72,10 @@
>   #define SBSA_GWDT_WCS_WS0	BIT(1)
>   #define SBSA_GWDT_WCS_WS1	BIT(2)
>   
> -#define SBSA_GWDT_VERSION_MASK  0xF
> +#define SBSA_GWDT_VERSION_MASK  GENMASK(3, 0)
>   #define SBSA_GWDT_VERSION_SHIFT 16
>   
> -#define SBSA_GWDT_IMPL_MASK	0x7FF
> +#define SBSA_GWDT_IMPL_MASK	GENMASK(11, 0)
>   #define SBSA_GWDT_IMPL_SHIFT	0
>   #define SBSA_GWDT_IMPL_MEDIATEK	0x426
>   


