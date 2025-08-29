Return-Path: <linux-watchdog+bounces-4129-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF4B3C2A2
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Aug 2025 20:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ED797A2184
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Aug 2025 18:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5149641C63;
	Fri, 29 Aug 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvp6/HBR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5A30CD8A;
	Fri, 29 Aug 2025 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493212; cv=none; b=GnOf67ylfoIbo3TQOmBosgzkgcJ/meMGOEFB7x6AFOou9kR06DAIChTTA25l7xZe/k3TP2/qqM/tqN+JzI63/wsI8k59U+hSiZf0GFRUhWWlu/NNLsMi68fYR1MHkramTvFDO54+2C4VmqCxWB4/sK3vYgdR48jtETA8l7l/Sro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493212; c=relaxed/simple;
	bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmixdLqbae/gucD5LlvoSQMZUL4HHrTmo2wl0glxp72WcUR9xmMFReDRwQmGWsmjQ6adu7LofoWBBByHxco62eQQh6mdduiXONqbL0K2sci2npiN1/L5akoq8FLBKW90c0ZtTqZPEFR26dN7qHq0haUCEWTrLM9G+4EWtLMeY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvp6/HBR; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77238a3101fso341758b3a.0;
        Fri, 29 Aug 2025 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756493210; x=1757098010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=;
        b=fvp6/HBRSBVjm/7wYiH4TlOo6893gh3tRBMlyT56adl3rA2BKz92ZNxOSlAazIrHdj
         ZpZNUe/bOfW4HF0xe0+xYZGrlY9t8GLqQVMKvRZSGsJliLC8H4ZCq8P0rwZCLZo5FW6z
         1E4KYMxe8bn06FRc3g7Vy18eTadX4NpZMuhMWmiegPUJWMDZ8dPuK+osoLpN+AVE9X4U
         FFGkAaQiIcaLaK+dAGE6dFdx3QhZTmo3ZASREP9tYZkcleZqp1AZEurtv8zE7vCDngqM
         fDUbTiA1X8O+L7nfvMWBRx3rTlmyma3Gr1qfNSjFf1CTQGfgxn3kGmAncY297EQ6yF/q
         RWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493210; x=1757098010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1CXCLkc3V2gOKTrIvLbzThifD/xfD1NRiFqcp7amsM=;
        b=J2euwqbx2BzTtsMWDBRSCHplSFeMYh/jT6CZiPSi0zbrWUv8wHDNXaFzXKSIgfE8ei
         7XCtjykV1y3R1joha9iEP4sEhjh+Let1bnDEeEciI008YdbHVLu2el3wMCU9ysCWB+O/
         /8eIA/cd1yN3CRPRdK7fvK0m9y2pQOlpQsYUJPk5MxvLf7qrPIXJFADH4fju3BSpYRK7
         NKAhV5guTdT60wZ/KCjrjHomYLChBqXlZqjtFsOhEKUPviCsgvFkBBVqYXy5PeQPi/GI
         yzfIRlD70C1pWPHMzPq3PkrfKKnGz1YBf/7fGKHiTF2f45r4XORiT4vYVax7VCfv0FCR
         uKjw==
X-Forwarded-Encrypted: i=1; AJvYcCUHAyROUzVSGJMPncVQvcdbbDE3PkAXjNfc5TH9aowlQSbtM1jq5tqUIi1jfxFuQ/hOaEQwmQ/3F/o/rLk=@vger.kernel.org, AJvYcCUJWslJM78a6oF3+jTo/SzzmvX6F4LF1ncHG0oLqxAZtFqW64hpaPUfIHKlj6Wg8sSt/9H8o9/HivL5j4W9fJ8=@vger.kernel.org, AJvYcCVQlkkYwnKOwCj/JSKGT2ZzxO7uEzIGMUt+q6frVpZmk4UkO47Shssf9dwWyooO4ogB4lz1CQoOY2aDcqqJtxj5nmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEXli1AWcPGddoweg/TfUXHBQPXQfqGqUIvepihfQVDSZj02X
	JeeBY4gbbObQumgqaTa6QOzpzVWeSwlMCN3uhRHIsANpiXFjGKIzGcQl7xAjMw==
X-Gm-Gg: ASbGnct+CJvPWzItWMVH4befXzPXt4hFCUt8BvQco18dLjpi60uThMJHKi20SkUnvxT
	LIz3BB2lkpB/r97nOcu/0KMehFZ5b1VghhslGrvnhihPOq6Vn2KZQG+rsNN8oN1NOrlG5Fu86Vv
	u79LYxwNZhtveUt6+Dm9UCMaM9FnuxTND31Rm7FGzSJZ1UESA3aVZMjQq6IwJg7oWtPbSA+Sw6X
	E1+Wev0F2JWyE0EwVLKKBDH67CtHc4Jq52Q3vJ8w+L9EvkBBar+DmT78ikAcl00+iHT7mTtDbr3
	vsxddf2YSwCS3CvRks06nHKQGIJ2ILwjoUbf5mdmyG319DObk8SG5u+x3InM7MjYoyLXJh+woKD
	NuWRHOdPkjymRE6SKEV60hNnJ2x8HJUTmj3GVg7KTGmnUSZrzZN6XLe9z4IGRuZRozEgo9g8=
X-Google-Smtp-Source: AGHT+IFkDUn0Bj27WhzY121M482vhMayXfNAABYTgrCz865mRDEJIuDhY4dOuhuI9V5Yw9Osyp3N2w==
X-Received: by 2002:a05:6a20:65a4:b0:243:a251:cf5b with SMTP id adf61e73a8af0-243a251d425mr11908511637.57.1756493209662;
        Fri, 29 Aug 2025 11:46:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5f7a9csm3051681b3a.91.2025.08.29.11.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 11:46:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d6c251f-bd3b-4f9a-aa3a-edb9da0caced@roeck-us.net>
Date: Fri, 29 Aug 2025 11:46:47 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: s3c2410: Add FSD support
To: Varada Pavani <v.pavani@samsung.com>, krzk@kernel.org,
 alim.akhtar@samsung.com, wim@linux-watchdog.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 gost.dev@samsung.com, aswani.reddy@samsung.com
References: <CGME20250829140010epcas5p1bc06faf0001ab2695f0199db65fe678d@epcas5p1.samsung.com>
 <20250829140003.109588-1-v.pavani@samsung.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250829140003.109588-1-v.pavani@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/25 07:00, Varada Pavani wrote:
> FSD SoC has 3 CPU clusters, each has its own WDT instance.\

Full Self Driving ?

Guenter


