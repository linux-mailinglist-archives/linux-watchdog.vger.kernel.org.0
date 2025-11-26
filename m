Return-Path: <linux-watchdog+bounces-4638-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16912C8AB49
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Nov 2025 16:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F110D4E62FF
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Nov 2025 15:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FB63191D8;
	Wed, 26 Nov 2025 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDJ5f/PF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCBB25DB0D
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Nov 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171643; cv=none; b=YZBI45z0uj9JW7Ht2uWDdaAuAQh74lpPSelBNSIMKx5wKUF9eNnXMcL7T7CXip+OasGXjNX85m1cv7GcovcpWGpTxjFPfA5QrTEIjVCuljulGESCZlXzU+/Dj4Ot7gIDFHYPWbUakaUAcpsybHE3FjJh9pWmszyzRJC58HBJ2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171643; c=relaxed/simple;
	bh=zn8jKS+JRD/ggE/wz/s8owVrvJYkoiuVbin9bobkJLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZbAzOhEtAcrIEysubyidHhiNGfRT6qrrqsvB3EtiNInWnEuCD6AVe7efiLRlOCMudcC3N567UosiDoSi8C+QGP5ZCtIQqm9iWkQWieAQvIrHD+Xmw+h4G9tLP1SPBJusdRqT2u2sfVIuqfElVLmoqL/4v1gGxwDU95btNYBAbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDJ5f/PF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29568d93e87so65829645ad.2
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Nov 2025 07:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171640; x=1764776440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hLEr2mhbSydvUQiwdphLxFtcbUY/7PorxSeGYIiLSVo=;
        b=GDJ5f/PFkgaphaKmHflepTTTihXFX9WDbgT6S/zyLEQ59lzyey3W2CQG9HrFS3GVmd
         oW2vOqa0bbX3pNEibEJ3Uqblw2oQX/NFc/NCHcwZdzY7Mb7So/NsjJ2PJIMCLEwd49z4
         0xY+yOclOygpfCu1gX6/DE++ED/qIQIXith5jheG2NLVQMUnq/ymwzgqKmYJsKL3DDxH
         P096uMUYa83eEYIoRFRAs1aWJmhaDfauXtg8/1pvnRXHTG7UnEd71Gk3qMHMgbAMFKM9
         vSRV+Etu36B6jyJE0hTGVYD3M7J6BV0AJar2Ehesxbd45fVa6tbtG24qqj3+rDQWQczC
         9K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171640; x=1764776440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hLEr2mhbSydvUQiwdphLxFtcbUY/7PorxSeGYIiLSVo=;
        b=kIvXlWlDssH94NQOVaB1j9Ak+o9LvEt3AQCQ7xTSjqdEyILbDqO6N/O0oaFcLfjjPb
         uObzhUPdKtvEL8IhkJ+lSc7wswxOJUxmOLJ6tXL56dhgPHFmEBBQEMkKlT9Tl2/CRXzg
         H2y3GzhUzwJvG2pNPvXAAGOGBXYUefnA/ky+9yGj2loOOlQjlle7hvm3zMJrv3xgC0ca
         gYGkE70uQuGVWLhVBBl4LklbyGWpPOUdepVQAJS+XL71nrl29xXDD5oP0jTjM68JUsW3
         3kTBpE+aVtAr2P2ckGYHeCPh7mc7tEyCfKlrVrVKc9kq+JCarq6JHUmAk5CoRG0Bxy3U
         J3sA==
X-Forwarded-Encrypted: i=1; AJvYcCU3g5fF4M0ybDuqkPkN12js0ZKxokpjVMa4DJJe7v2WWaYwYW9o4XS1q4kvwRr7hhCXIepDfIzn7mQiMUbadg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8TyXt2drRHHP0GWDxc1TGwzRBppGOeqYK5yZc7Co8tapM+gf
	yprn677oC1LoNFpaHV2ABOP3GeuCcpwLKEVzwhZbGTRtqLreGM35WzWshQ1T2w==
X-Gm-Gg: ASbGncsqXJ1pAJ+GMyCBHIQGuZeck+mzGVhaKVH7aTu+Z2zAQfkWFgMdZH+asMDk6PQ
	+d1krQ6tIH+4N+j5dM7kwY6wTJXJQriUYRHZdUELOHqAuRsF/S/C0f0p1QDmhZ7CCk60HREoDZ5
	46kNYo885kaTCgxFn+0b5X/SmO3QrVBCfofgBWIGK+e0vsu+wzk+eFhLVP/cM6VkFtEAeQQEIPr
	7uL+X+0WYnDFpEUCGLgJBYC7CwJnnh78P9v0XblgS0Q96dLpxlj8A4IT9XpkV5P4fP+D8tcD0Vr
	jtXbbgxYkoJ3ng3OaO8h6wGv0fSqaKh93BRPqyX3X9ORe0SAKm1gdtZn1ZoMngnJ6rlKjWL8NF7
	dLX/DC30op1nzHkzxkQjjK8/u8dFSwUVfA62GTJT4m5iwyT3pP60K03HYOCXLbd3MOGZEpetio3
	zuyj3mT0KelVJIn81ASL/GuvSI/WPH94bZYSDeXZZNZlPu3yXUIGRdfeO6rpg=
X-Google-Smtp-Source: AGHT+IHrLUK31bCCbDjlmtpwl1XiZh4HSWC6vvxupiBK8Fu1iaMTqWIXoRlb1HEf47FGbae5m8av3w==
X-Received: by 2002:a17:903:234e:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-29bab1e4df8mr73672225ad.53.1764171640437;
        Wed, 26 Nov 2025 07:40:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0867558sm21927156b3a.46.2025.11.26.07.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:40:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86effac8-5d54-49b8-baa7-2eabad826e98@roeck-us.net>
Date: Wed, 26 Nov 2025 07:40:38 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: diag288_wdt: Remove KMSG_COMPONENT macro
To: Heiko Carstens <hca@linux.ibm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
References: <20251126144312.2219492-1-hca@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251126144312.2219492-1-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/25 06:43, Heiko Carstens wrote:
> The KMSG_COMPONENT macro is a leftover of the s390 specific "kernel message
> catalog" from 2008 [1] which never made it upstream.
> 
> The macro was added to s390 code to allow for an out-of-tree patch which
> used this to generate unique message ids. Also this out-of-tree doesn't
> exist anymore.
> 
> Remove the macro in order to get rid of a pointless indirection.
> 
> [1] https://lwn.net/Articles/292650/
> 
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


