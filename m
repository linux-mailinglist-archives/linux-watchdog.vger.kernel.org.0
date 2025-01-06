Return-Path: <linux-watchdog+bounces-2660-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36870A02FDE
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 19:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E452162FCE
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B8B1DACBB;
	Mon,  6 Jan 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5tbBScz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4D78F4F;
	Mon,  6 Jan 2025 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188886; cv=none; b=KEf3gGaIPmgccsBv9t4HeAzCDShd3nq454hHMkeMqsvZHJxExn1mrRE8c7hK1WT3S6gx0++4ONoLWiqpt4+JlIDFu4a0SQwZprOPcM38yIPQiguGL7wMHOWY/s5xEF+S+aXCX+mICOxzqcS6CeqW1e1cCQnFvAO6I4qi/eor8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188886; c=relaxed/simple;
	bh=ykEeuugA/mvLC/eWWzra4YSLyhJ2m5A4P+Cbpa8SHe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnVPbGb3+sHdGKkz6bcc7jSyerIanp2fqG5rYJJ4EADRl/CO7Oj8JHtz9N+yN+qnI/w8VHAC/eJV3wBMDwNgBA3irC56GR+iyLsHvqK0RU4gBdXy0xk/6fTWhZkjlzeCoz54OcoR3HmKb1fmqkQNQPzPivsjCrRtwPmdyT5BHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5tbBScz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b1f05caso207911185ad.3;
        Mon, 06 Jan 2025 10:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736188885; x=1736793685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lZb9K+uC//Eu4IdaXK4oLhOwVIJasugKstQC038B3Io=;
        b=O5tbBSczlxIzgUsJ8JMMqUtRnIS4zOX6QYYi+DUhnASisMq7Sj3uHfyUtYkQjIPpli
         E4fSWRRc8o0uYijV781Xx7LRFmlmmHmB6QnfYwgCZhehraf5QhDn/MgNmjsrlGgGIDnW
         dQPsP4C6EmpSzj4rgmISlW7OdNZCF5CR/QwvIYjNQAN8jl3/prfw38mcfvv51M6zDWn+
         my5lIlSOIXkgTmdVpzsYDJoN4WJ6mK+OkHCnNkNsIO5cISWrBNJg8ZO50hfkv6iT9O/H
         8l6BOxfwx9jGX+J5WlXrnlmikDpTB/lf2fzzmnkCNd7tVv1UVH5u2lHCQxYKs2mkC5lK
         e7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736188885; x=1736793685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZb9K+uC//Eu4IdaXK4oLhOwVIJasugKstQC038B3Io=;
        b=DtQwpwTgqycf6f+eVOOQq96X6Gpua19VVgsxAqFeVN14KzooSlsC3KeoYYbZ+B5via
         iLNElCCov1lxIoieTuJHGDfpLT6JxL6LQF6fSlBALaLjl+a92MEa9pd+DDuXJGR0HmrA
         SD/3R3iaO6SCIM5KwqiyP8EV85x1wGfLSr2ISW12t5MF0xQgKlG50AYy9o+/Y99igOi+
         lFPAbVfCcEPHOQY/I0CjCt73n/7VCyTelgqjAi0lxviqFmDPo/glSFZABhEycPSkNLlH
         p3YIRKICdwsGEeqDf/aTjr9rjcIJlbqdBw729tkiGdMb4/cccY5ttXKV9mDXuAXZpRD0
         uNog==
X-Forwarded-Encrypted: i=1; AJvYcCUI+7gLQfFCsLB0C5kWx9FzVf2O7nvoA9WLISbC1aiJix7hLxKBkYB2h1iTjSvT9rqTI7avc/ut/3Cv@vger.kernel.org, AJvYcCVNoyIHGFGXc5sOl83KjIeaDxCOk79kx7OIPhVl20B9KaJ1hniI/YYKX97W1QsUlkwioH43q2KDHm/GCBDV@vger.kernel.org, AJvYcCVQ+/2w9Gyr450zUzbKfDpQ128EdoOBi7+xTyp2cR1pxYMUY9xV1q4tJvdADH/OK8OFjynGbNU47A/GmAaaKDM=@vger.kernel.org, AJvYcCVaTJYDTCuhPIUivXhlFvKU2PxDxW0UpxGc8u8bbRTfqtZOcMYvJVyMwirEzOimc6phS8FkaFSKQjMqvX1wrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYDZg+ubmfBmG5mRjgCMR7lyK9K99WpbAASEqadHzkONJz7pG
	1JgeNpbrMHtFtYoLxc5FA14pcyHUM1Gx2Zp59iLv+vsjCLstFuws5yb23w==
X-Gm-Gg: ASbGncvg6mFjo+Udzj4s/c93+tTVAuw8nwR0i5hGEvdy4FQanzbR2VoRw9ub/Pa16Dk
	ByAX2ruqGhPSnRxgrjvp5RyVHBdFWqZIqGdTI3pLQ0nX4gnjMWJnnQaWiM+9m4smHtyXVNGIATJ
	u8Jqf0WJQw9EFunW7OE+ZNs/NOl0lF3o6VNuN13ysCP7BFL8Ws5xIHxbpEl/w1Pim+Ff8HRWgUc
	s2PD86T8BqEzXun9fxlfyBwRD2sToHXjGril3G8qcSXxl4aESO3oivc6k104w5dz8sPuo8xRl1Y
	p7283lGaiAgUvdfBlUKUpctoLQBcxw==
X-Google-Smtp-Source: AGHT+IFq8tXUwcfAZ7Wkf0z8wjDvMwS4nNu9wA0vZQdPn9mxzbiLmpaJQX07ZflraaX7GQ8Wv7U90Q==
X-Received: by 2002:a17:902:ef09:b0:215:a028:4ed with SMTP id d9443c01a7336-219e6ea26d4mr822171945ad.20.1736188884675;
        Mon, 06 Jan 2025 10:41:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b1ce01b8sm24823826a12.20.2025.01.06.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:41:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0adb4a57-fa6b-4b2d-bcb1-a8804554f753@roeck-us.net>
Date: Mon, 6 Jan 2025 10:41:21 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Document Qualcomm IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, quic_rjendra@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241120055248.657813-1-quic_mmanikan@quicinc.com>
 <20241120055248.657813-2-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241120055248.657813-2-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/24 21:52, Manikanta Mylavarapu wrote:
> Add devicetree binding for watchdog present on Qualcomm IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> index 34896a39fa91..49e2b807db0b 100644
> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> @@ -20,6 +20,7 @@ properties:
>                 - qcom,kpss-wdt-ipq4019
>                 - qcom,apss-wdt-ipq5018
>                 - qcom,apss-wdt-ipq5332
> +              - qcom,apss-wdt-ipq5424
>                 - qcom,apss-wdt-ipq9574
>                 - qcom,apss-wdt-msm8226
>                 - qcom,apss-wdt-msm8974


