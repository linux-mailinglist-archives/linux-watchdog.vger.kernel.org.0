Return-Path: <linux-watchdog+bounces-3238-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705AA7F8EC
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 11:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3F6B165BDC
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Apr 2025 09:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88893219E99;
	Tue,  8 Apr 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIrF3yHz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0225334F
	for <linux-watchdog@vger.kernel.org>; Tue,  8 Apr 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103004; cv=none; b=td7Hkzj4o9MxfLY4FqVperkzx1kz05ONLCurUTyX8vy9oCN1M/D/wMouXa9ABYgjM5gOt9izbqORA+peoHXu15TGTad/7MhArcPdAxPmN8XvZDdxkE+XWU7ty1kKO9RrcVoZNdvd8FBmMWKtiLyzjDYuy7UcTnOsTzX/7ps6EWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103004; c=relaxed/simple;
	bh=jyNWNielaFZNC8x7ge6GPxBZUjXlMnqCK7elcflhkqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qep7UkoK4MTuKGzrkwErWfDMsD5/ivHpe/0SBCzzNs0uCJKfonT7hy9hQUaDj6qiJQRe95uP+1HXXH7cRn3OH/oHh7ZCz+uRk8RfI7i4Q+q1Aci3v8YUbbiCslLSB77i3cMyeZImf4NAWCIzTitFBYz3qEvH7FzE9bZA1cLeWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIrF3yHz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso38108695e9.2
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Apr 2025 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744103001; x=1744707801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v65PC4QNaexxwzfjQafXjEr0ZPne6aP7FPOvE5lZvcA=;
        b=FIrF3yHzOYrwO3qD/MQ1xznKAMcCMrkUSkkzQ4PzwlmfqV2JHENVqpwDvPFs/RVbX3
         fUcdzVgdMnwe5qhg0DE6sQJ1IaKBJ/th6P+YqvRkOpmv2z+7Bbcht6l3EkFYWHnNVIcH
         uSBbh1eZTjOvL6D1T8sjzOgW3P5CEV1mrZ4xDu34y/s6wtKpdNj2V3++krMiSl+pA9KU
         ZMf26delNyJd+suj1qJ2pqcxgnsVon1O30ROsjePprAGitx6C37I5rLjXBgVu13okS3q
         /73HBjJz4HWmehlEcscv6uyShy/7b+THMthq9aP5xebXg/IXHxnM49drxSprIJQd+e24
         rdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103001; x=1744707801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v65PC4QNaexxwzfjQafXjEr0ZPne6aP7FPOvE5lZvcA=;
        b=GV/bQjJNdoMeR7LMc4BQHKHUWuFG0uNiyZUV5IuPgQUZ3rmzrfghdUeCWKRpiuWN3k
         ZkkTJYFR0ysYknjASYDV9vrLK7LFeGYtDrJd8lDbF8tCldKt55sHM5t5Rmgh552m5fem
         sA9vz0cmDV2t/NpBUM80XLHiwygRlgaFbFU+jz9WYe74NkeLMrLPVKvTBAUe7aPUcFLP
         yTr/PyUN59C3kGKiInkZkm5PqhXUPALF0e9ewIcf3FYiwr1K9LI+CIMuCaCUA0ervDSZ
         cz/iON+K4O4O7a/mgnYL1TM3EAp4MBma/8zwQr/a626r6HSuFOAhdKDBqTi9CSNEKA+G
         h8QA==
X-Forwarded-Encrypted: i=1; AJvYcCVBnCP6WS6tBdCLpKNWEkHcVzNgSdZOmqX9a4fq3isv7jnCMU9QrPhNUIh3xPOavbGPcHz2IT/JfxA3NSA2oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdibdkk4efbEB+xIl7VlrhuE+gl4INij/hDwGXqEDDnlOA/ic
	eSAZGUx5iK91xwkpPF7DUj+sN/wZxzss4IzGT01HY3ICDLYWDrEQxel1eJJLaFQ=
X-Gm-Gg: ASbGncs5s9di+Kpf2wqa6SzYvWdajA1TASbLpseBkdGJDfBRILxKrX0Z0Un0I4bsEPB
	TTrdCB+VQjaScJmsiDPPKPWI6QiFjBk9+ZgZKD9M71yAAoCH0wP77ooVyT5omAgO8hszgq2uezN
	lDciLHsKHxm439V0X7HyVUeE22/HuVcY2FkLCrjAkg662jfCm7c3FiGqRrUBlB/chLTHS4Bm12Y
	gHqBpBJDeR18JVjr3GCWK20DhYTq61WA5ZNUNwPzq2gixWOgCQNIXOnvOWt+IWc+OH//14F/Rdn
	EquItjlVrArGgBeqDci60N8/DtNys32FGHzLiJtFX3O0Q7YC3/+DHzXQn4L3yF7mNpPhOMKWUWf
	8c0l3jbhX
X-Google-Smtp-Source: AGHT+IF59mR/Y3gCWpGgqEsAY2RKfJDBH8CAcpxTKw2Uqi3PNlCOWS3dudcLSJmJZMiC+3LMt4kLng==
X-Received: by 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr177755405e9.15.1744103000892;
        Tue, 08 Apr 2025 02:03:20 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39d75ac6d66sm8004445f8f.14.2025.04.08.02.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:03:20 -0700 (PDT)
Message-ID: <1e3d9e34-133d-451c-9ce6-6c974a781305@linaro.org>
Date: Tue, 8 Apr 2025 11:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250407160318.936142-1-daniel.lezcano@linaro.org>
 <20250407160318.936142-2-daniel.lezcano@linaro.org>
 <094855d6-a99b-4ca5-bc8f-ab6faccfd332@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <094855d6-a99b-4ca5-bc8f-ab6faccfd332@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/04/2025 10:21, Krzysztof Kozlowski wrote:
> On 07/04/2025 18:03, Daniel Lezcano wrote:
>> +
>> +allOf:
>> +  - $ref: watchdog.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: nxp,s32g2-swt
>> +      - items:
>> +          - const: nxp,s32g3-swt
>> +          - const: nxp,s32g2-swt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Counter clock
>> +      - description: Module clock
>> +      - description: Register clock
>> +    minItems: 1
> 
> Why clocks are flexible? The SoC does not change between boards. It
> should be a fixed list - block receives that number of clocks or does
> not... unless you meant that different instances of the block have
> different clocks?

The documentation describe the watchdog module with a clock for the 
counter, a clock for the register and the last one for the module.

IIUC, these clocks are enabled when the system is powered-on or exits 
suspend.

The driver does not have a control on them.

The only usage of the clock is to retrieve the rate of the counter in 
order to compute the maximum timeout. So only one is needed.

However Ghennadi would like to describe the register and the module 
clocks in case there is SoC variant where it is possible to have control 
on them [1]

The goal is to give the description the flexibility to describe just one 
because the other ones are not needed for this s32g2/3 platform.


[1] 
https://lore.kernel.org/all/93d83df2-d3bc-e32d-70a6-158571504275@oss.nxp.com/

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

