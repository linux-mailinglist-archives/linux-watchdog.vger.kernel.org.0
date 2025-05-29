Return-Path: <linux-watchdog+bounces-3592-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5EAC81E4
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 May 2025 19:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC473AC92D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 May 2025 17:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74ADB22FF37;
	Thu, 29 May 2025 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T6M5c+0K"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A527522DA08
	for <linux-watchdog@vger.kernel.org>; Thu, 29 May 2025 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541417; cv=none; b=B1wXWKD+zZO4203sDMs0xSk2xT+vHJoNoDW2LAYDGsw3JrFvDAWYvrfVYE5VMv1ALzpthuGSHTZSkbqXK7QRfWV9yljQZ8fwWnN9ctkAPRgN5052nThW7f366pO3V7AVuHfzmKOEbAEcdil3TSistEEeInVn4MVRt3cRokI7UUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541417; c=relaxed/simple;
	bh=kS9GiviriiCchrXct0uEKMDSd5rA7xErne29tXNsIjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llbcwWCQriYa5IRPEwW22OlurLCEgAMZs8UnChdw81A4/VW0rXqjcL1hWUgmLoT03y6uubNVVapsEx5lQ9msBeXy9yik5XqNX8U4Pzn4hp+AsyqUBBx3JbNh8s0JBf5mCLCcAV3ZHmEupM7LZgPpRlQ1VmqGa7dqa+7pjZeEWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T6M5c+0K; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a440a72584so865281cf.2
        for <linux-watchdog@vger.kernel.org>; Thu, 29 May 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748541414; x=1749146214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cnq3317eLDD3aX+MPu1x7nQnkfxgO3IBGujg8LJkV6U=;
        b=T6M5c+0KpJoPw6T3s1dzxMIQTzAqHfa6Hnz3do3TKGJrakZZhcci7Xt8b0GYawYRQO
         kmrSnVA8GPUS20gdUm4or5JUweJ5YKOBYGqSWRAzZDSg1eL59RkR1bq4JhlgQ7dvaz1j
         3TvmeD5mDxyILHoR9/ZHJSbjd2eXF4MTZABOsZHqedy4Bwk2DojIogjtMoPLQSquAfbQ
         M72AjWpzppzplvD58MUjdQnaOx+oGYnkFXTYtOKQF5NwbYdsRQM9SlMQepNpvXNZDFzG
         KsrnI8QvKiKfSk5zEMdJftHxw4vT6CLkEPNayYzOIyLndjU640ufbVZA3jc+94m7Fvny
         nAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541414; x=1749146214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cnq3317eLDD3aX+MPu1x7nQnkfxgO3IBGujg8LJkV6U=;
        b=LZSsrw/JcbMIOlzojapIuD1Ui2rjCuoM8kjPnHHPXmvbRojYwqfwvTY+x8s5W9EO40
         ZA2uEwItUHcO2JK/67TF7bvthfqFtWaYNjqfxih0L8k4g8XYD3dMEvSUDQybx5yqKgM/
         qgcfHdxHXK4un3bY1H4L7r/yLT2W18Ry1g/7FOxZZHYnUglcg5GbYh78hXbl8FQSXoD9
         /CQMfHa1KapEIIkpjDKaCy6Nd528kkCblBPSZOqU8jbIMfLBo9kS+0XWJ09/91e4kGom
         N3reeDkdiBzuEC+jdy+G0Z4VY+RIuzsFxrBEsLx6Q8cO06LLbphZHh1HDSeh8QvJK1F9
         +Zkw==
X-Forwarded-Encrypted: i=1; AJvYcCVkXArgFuTFo8T1X7JvOem9Xu5M3UUqwFJ3M67KoesQlFrRnfEh6E6pAjBdabU/zhY4fJlEIA0bJ5Y6Djfg9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwYomr2H6iACjNG8ZppMUicmW3rolnLbrQhCI+3MlY039whvj
	gzhMNy59WSNmk4vOzDRHKb4E6HFdWfNyqw9HiauqZMFYvvSPXnNvVf57e4izLLQwgrI=
X-Gm-Gg: ASbGncumafxFHysw4GYLUnmbrfw5H/EBdrcVMHNaZ2Zhxff2pcfaEuzeFYEneTm/DKS
	q4OrgLITu0zx7FKzBoKl4MGRIBGKki0bkLfn8Iu+CgKozVM0ooSkBjD12Bxh3h3wHS3j/XMZkOU
	l1JjwIZtO0gLpnhOLyECeAaRI+smTGyiX0/OTjgIZEk9/Ufghwhr2gAUojj92cinw2K+coN94Fo
	U716S50eHWO1naGv9x14G1Pti/qG7tavA31+l3m5Y18397wJLc3V5PgCk58MVBZbsWM4A8DHzeD
	Tv5IV3t0r6Kz8h2NilBYdJ6NypLL5XfRgmcOU8PqadIlt0vho8kakoKcsE6JAO7vDTN0LtnA7jP
	iLxn+W4jE8TZ8rlYtylLEfAEzMQ==
X-Google-Smtp-Source: AGHT+IFRbPY9FcCpkFcar+WohXHkz8dPIXN2wRIAXXxo4Xlx3qkGIE/m8rbx0C9NzOjslxqzybdnaQ==
X-Received: by 2002:a05:6214:f6a:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6facebf8bb8mr9098066d6.42.1748541414556;
        Thu, 29 May 2025 10:56:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d79:3250:12f6:aa0:e9ea:e0da? ([2a01:e0a:d79:3250:12f6:aa0:e9ea:e0da])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fac6e1c68fsm11859116d6.110.2025.05.29.10.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:56:53 -0700 (PDT)
Message-ID: <62092013-1c15-4b43-b045-f8915bfc2d2c@linaro.org>
Date: Thu, 29 May 2025 19:56:50 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
 <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
 <2a8e1ae7-2a8a-4cd8-b699-c010019c766e@roeck-us.net>
 <a6d64948-e713-4a50-9d4e-6de02a550d06@linaro.org>
 <20250528192450.GA15816@www.linux-watchdog.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250528192450.GA15816@www.linux-watchdog.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wim,

thanks for the update

   -- Daniel

On 5/28/25 21:24, Wim Van Sebroeck wrote:
> Hi Daniel,
> 
>> Hi Guenter, Wim,
>>
>> On 14/05/2025 20:09, Guenter Roeck wrote:
>>
>> [ ... ]
>>
>>> AFAICS the patches do have Reviewed-by: tags, so this is just
>>> waiting for Wim
>>> to pick it up.
>>
>> I fetched the watchdog tree and saw it was updated from May 23th but
>> I don't see this watchdog series.
>>
>> Is it possible to give a status about it ?
> 
> commit bd3f54ec559b554671e5a683e05794abe3a609df
> Author: Daniel Lezcano <daniel.lezcano@linaro.org>
> Date:   Thu Apr 10 10:26:14 2025 +0200
> 
>      watchdog: Add the Watchdog Timer for the NXP S32 platform
> 
> 
> It's in linux-watchdog-next since the 24th.
> It will be sent to Linus probably this weekend.
> 
> Kind regards,
> Wim.
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

