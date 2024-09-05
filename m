Return-Path: <linux-watchdog+bounces-1776-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C00996E291
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 21:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 456971C22F53
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2024 19:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D34C17B4E5;
	Thu,  5 Sep 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqDCbL2E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7646C1552E0;
	Thu,  5 Sep 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725562901; cv=none; b=m0FVkDXdYe0uZf2jjXGYBtMmj5halqgl/77zWYqeshXl1mTmkBUqu9CeFK6rwRV2+Z76446UtPmWoLmhFmmYrl6gzlbG+fpCvRZsrECCjsaJVH3/evhheuu66GxGxZYH69xBUAtfwtJMAFvqPgYM8AJpWzoWgqaFQzea9vd3lOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725562901; c=relaxed/simple;
	bh=/e4u/JDvc6bVXSRURtHyV8WfjImNr4XaUNgP4OjRRBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNGkSlyxW2hDrLemEm5Ady4yWzPnoVXYK06K+42N5r7Qfj41g5LEV8eQWTgIvi/SB4Q6xz4OPAuB/m6/Dehtgl4Zy1MsvMVqxPo63eaL9d0sXjtbazU6IfHABghrjYZzhxVqCCfZfph1TB9bujgfnj9uyL1w+0YYhh2v+YbKdcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqDCbL2E; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-717934728adso728696b3a.2;
        Thu, 05 Sep 2024 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725562898; x=1726167698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7jvqKHWKTNEwzmEHt4HX/4BnyKCC/7k0aB+R5vHLZNI=;
        b=jqDCbL2E9ppU3qgDmZA925dMepkXSpEeCvVh5q6cRDfZhf3+0GeARbuzmNoWLaavXy
         bEKTRMFfr0BztbZ/uWMRS/JWTyz5F9uewTSMgAPvj7vVaxRkBksJNinKj7KJy2HAC/EP
         VKCdQPK5s9TXl6C4mP0T1V49K6Qgo/2td90ADEI5Mk6jOExvZZaslALZrionYgbIkx49
         syhtfU8zX+WkUHYPuOMrLe/gfSEdVhk+Ojrz8Yr4oWVUBggr8U0VyA/RfFiz3JK60V9L
         lYUg16Dm8K/9481PrZChTUDJRhgVra3Q5Vk5B8+QlWzdTILT1iUDPmcro7wyafOVps0E
         ulvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725562898; x=1726167698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jvqKHWKTNEwzmEHt4HX/4BnyKCC/7k0aB+R5vHLZNI=;
        b=sVOGrXMxA3JqfBsIsk9929yHyIban66fnBNN0w0aw5Vi6ll4KsfUkCcrfbehI8T244
         XFrIWfC/0WtrMCMCoH1hNS9Y6gCtNt/4kR4qrBYpWreQQrMwIY/FyMN4SddyN5CKUIap
         NXHps5KrhM7jxoFlueaIZZT6dnHKomvHqatbsaWUJ1rAE9Z4aLOOko+cO0tWggjR9r9z
         PbPC8mePYtZMXz6HHh/YJ/lqDEWcJVBZmG7yO0EXMtcbMg3UKvHDfjiXl5in1gZFmjzM
         rj6R1G1chdGTgSkrlUuidzdeeljgPsIH/4/GftclFc/+W+fXttCxYgfi4JnTwfL7wM9R
         Yn1A==
X-Forwarded-Encrypted: i=1; AJvYcCU6+r32kiyXBkZsujqNGLNfmKkSCg4CwBXvh1zNR9LSfqXnZw31WZRBvLfbBZwzTbhGhwXZeLbM2jF/@vger.kernel.org, AJvYcCUtBKSNDlY3H21CYqjCJpaZ5hr+5WM53V3XlbbcKdmynWGCTkrDAjCxmYNFasIifPtPeZMN10T6QZgVTnC1@vger.kernel.org, AJvYcCXEcwqSxCGR9qkMgv2pJWMPArn2J6tjXIxlvNQ/9coy5tbP+LS15duMcNZ8PsV2L9IbeVk1I9ZeeD20EsWoHsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+2lUN86SpwPFZEk9RNPfVcCbanvJfALyAprHdmhpSkKxVXuv
	eKGMgqsm5N6Dc5IcGxhaRNWQmCKmFncNTkKLvu/5YS3b1FYY2yb0JLrMYw==
X-Google-Smtp-Source: AGHT+IFxTTWpZUiDBR4nIYLol5cprsIqljX/0VILfOAPfpIcvRqe+FExe2zYb7967dhzt+eRUJqsmw==
X-Received: by 2002:a05:6a00:1951:b0:717:97ac:ef46 with SMTP id d2e1a72fcca58-71797acf5a6mr1613754b3a.15.1725562898217;
        Thu, 05 Sep 2024 12:01:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178e2a4ab6sm1460359b3a.9.2024.09.05.12.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 12:01:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9cf523a0-53b3-4b5a-b325-15626e12a6dd@roeck-us.net>
Date: Thu, 5 Sep 2024 12:01:34 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: watchdog: qcom-wdt: document support on
 SA8255p
To: Nikunj Kela <quic_nkela@quicinc.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240905185642.3767906-1-quic_nkela@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240905185642.3767906-1-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/24 11:56, Nikunj Kela wrote:
> Add a compatible for the SA8255p platform's KPSS watchdog.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v3:
> 	- Removed the patch from original series[1]
> 
> Changes in v2:
> 	- Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 47587971fb0b..932393f8c649 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -26,6 +26,7 @@ properties:
>                 - qcom,apss-wdt-msm8994
>                 - qcom,apss-wdt-qcm2290
>                 - qcom,apss-wdt-qcs404
> +              - qcom,apss-wdt-sa8255p
>                 - qcom,apss-wdt-sa8775p
>                 - qcom,apss-wdt-sc7180
>                 - qcom,apss-wdt-sc7280


