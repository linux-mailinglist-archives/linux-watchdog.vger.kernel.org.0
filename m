Return-Path: <linux-watchdog+bounces-4268-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42923B9AC52
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 17:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 411F61896A95
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Sep 2025 15:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9703002A9;
	Wed, 24 Sep 2025 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFIueKdT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5272E1747
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729189; cv=none; b=AXzRLQdZmEmxnnyiYysDI8eVem2qNskKXRBVXWxRVMFoWuO4umkNmx7cIdXA2LYI4BVgcL4e2KPAXf6GkhXi6JLtrOv+prcPBOjyiDhv5S2IV6xBRLRIHbhIW64ivh7TZ+JougxcKuSIHw4W8DCs727Csymrzojl6Xnh+rkexpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729189; c=relaxed/simple;
	bh=VT178yYCZMBRPny+L5bF5MeTxPfpCtbi4fIoBmP00o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+hBRBtxJb9ksLSL72EluQCsEt0+73uhG/p9SrHTIcF7AlneE/e7ep0gWa7eXfu5LRZmGP5nChPAl7+30n2qV/BEIvNC0oSFtntV/a8a+S52O3ICQVdVOXncHOO5bPVh68yLokrUXHDtG86LA5TTJ8318nO2Cy7t9MOEXCQQPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFIueKdT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7800ff158d5so501546b3a.1
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Sep 2025 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729187; x=1759333987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YLFgCdLMh/r5hFbfHnhDFZlsrstBsRj7M+/SLEooJtQ=;
        b=iFIueKdTTiB9B5tR8i1hdiMj03VLVLDH3bwi5nWmsTvOkrK4988HIeFviY54KnIeyb
         Qv+ahD/WvSJLa85bsjsymR5Z/Ge+Btl1mXcfvl7aecJxNVKEXK5gYF0urVRSAc2sLS+G
         xkWODTsxpT9fdAxGnFvm6ZXzYcEkLqXFE3qo2LdCaTTPsvku/fRd77/bI5L4GgMH7WoF
         w7TjBSUd3ylmB+Rsc5XVXzUgiFwQt11yUNROodl4Z0O3tP38byu0/CV6sf1Z8OS7FxF1
         Hk47eUWyDo78nYxp60BO0jQhYtq3qSQbjcCWm1tKcRe0fnRkH+lxZPkMYFmjDzisFBba
         UmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729187; x=1759333987;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLFgCdLMh/r5hFbfHnhDFZlsrstBsRj7M+/SLEooJtQ=;
        b=HYnOVQ3+nrOpfasQ1U/ZSVbhoaFs2M5Kn/e33DC37nbKN29i6ob9JjY9EqgU081Tpb
         KLmLMKBpBLuDI9TWZ1pZlIB7Mfxm1678V3TipsBSKdQoPkh2cQnl4lQlo2fXxjR81tLt
         TCgmQ5gw/zIra3V5YvCo27sJzV4L3yQB0JP2u5oScfBOEJL9vDNeI0SrZbD/+D3xBJTh
         G4WiDJ3zk7TIA/NknSBKERjb/MyGjxcGd5upbeTrB9LGpYZETegmAbZ5m0GZnKxylRZV
         shgMY80rYhSHx3YDRQMoGbDlM9ZJ6jI1m5eOUl3qgG0cVoxzywzz6Czv2tfrkRfCSvUA
         OLQg==
X-Forwarded-Encrypted: i=1; AJvYcCWvYuGJF4zVJWE6KatJT10AvjUgtlh7Fg4YVaNmS2fstFE3wBa/slkbJk7snt0hq6RNySGhaeivQAjby8IxPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ItoJLpHUkXOsofXsfBvWRcNNTm472WxHGoDAZ+j95vDRcU90
	/3xdekFklFA9kZwflxZmx7zRK4weWCCgp5DeQBGE2NroU/ZJoJQwkH26
X-Gm-Gg: ASbGncu39vNOr1JlHLSRdcXXVJUBdSvN3of+DjObEZKIkOanDZ1BgsU6E5bf3SBcYEd
	BqioYS1/rmBOI5NCBvX4Eo3PY9obDWs+7kOQY6z8Z8G57KW8sn7ApT1Pxp5zQ+jPE5Sb8UCv7qb
	VRWvx9oPw4HYjkuyi5mI9OpzbK+sg3+kc4LX3IPieidkKzTJFzRT88Lllf83O1X3XYzBvQC8l7A
	wnrEpmi8SqoI/IMs4G2DJkt6Wv5K/Yf+aQ09BoodJKFGv7SJj3R5VSv0tSSNwgYQhSaK6Loiar6
	i7CbflVqX1HRsIFve8UNwVyadLSdhbHGuegeSaedraU8xFkBg3R/4P38RvZf40zK0ck1waEf3hE
	7MzAdgk5cTDItlKD864Ilj8IpebpzEO0gz6kkizXL9tIMiOM7ef3Aydop8cXDOoYGWW5KX+8=
X-Google-Smtp-Source: AGHT+IFVgSVMSm2vqmLG6DCS+JeXgQcaQs1Myt5b3EftOEQSBe/HHP3HWNYKBwBYn84yLRpiHo54rQ==
X-Received: by 2002:a05:6a00:a8c:b0:77f:156d:f5b1 with SMTP id d2e1a72fcca58-780fceebcb7mr560901b3a.26.1758729187064;
        Wed, 24 Sep 2025 08:53:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe7607c8sm19130110b3a.58.2025.09.24.08.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:53:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5e76f825-a352-43b2-9d95-488064b52eba@roeck-us.net>
Date: Wed, 24 Sep 2025 08:53:05 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] watchdog/hpwdt New maintianer
To: Jerry Hoemann <jerry.hoemann@hpe.com>, linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, craig.lamparter@hpe.com
References: <20250923190352.2517220-1-jerry.hoemann@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250923190352.2517220-1-jerry.hoemann@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/25 12:03, Jerry Hoemann wrote:
> Update MAINTAINERS file with new contact.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 520fb4e379a3..11839d5f1c2e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10784,7 +10784,7 @@ S:	Supported
>   F:	drivers/misc/hpilo.[ch]
>   
>   HEWLETT PACKARD ENTERPRISE ILO NMI WATCHDOG DRIVER
> -M:	Jerry Hoemann <jerry.hoemann@hpe.com>
> +M:	Craig Lamparter <craig.lamparter@hpe.com>
>   S:	Supported
>   F:	Documentation/watchdog/hpwdt.rst
>   F:	drivers/watchdog/hpwdt.c


