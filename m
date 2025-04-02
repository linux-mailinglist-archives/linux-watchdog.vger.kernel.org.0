Return-Path: <linux-watchdog+bounces-3193-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE0A79879
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Apr 2025 01:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 569057A2D5F
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 23:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E291F3B8D;
	Wed,  2 Apr 2025 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="erG22Kva"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FDBA42
	for <linux-watchdog@vger.kernel.org>; Wed,  2 Apr 2025 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634873; cv=none; b=tLKolqUyvSYDl8q+7fOTpI76rSI665yNKUuuiXCRCMaxW19bpoutkhfKhGX5CCbhykuEJuxSBwkZ2k4wc9iYVV9J+n+t9x/VrPgOsAZRLzlpX0WS3rsq49l28ED98N+WTk6r8oczHS3ezutC5qJF83bIJp7krRjWxMhVyUlaZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634873; c=relaxed/simple;
	bh=ae8HG5mamuJ6F6/+nBlRSOsXFultdkdpg9uOrzVgMHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qRH+xZINzIz4hxicsdgh5g4Wb6yEDAZYiJZ7FZcBvXRsvTjKksLlLbW9TRbnddffjTpd/PMdR0k8sjQkYB8xt0P3Ad9bgOmoj7e0xkrN7oQugsW6q9RAVNDLV6TEs9uT/qeOX/rdHWSKwEO3vJMAXNGp4lBNiYeSWa8pFTL7Nuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=erG22Kva; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso1761445e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Apr 2025 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743634870; x=1744239670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssDdQ9pYXMHr5I5/Xw/ZAgexifJSDigD1EuzFV2qg4I=;
        b=erG22KvaPBOLtLLf9ql4HsTCgHMSvgtwC5lqQTS7vDTAZtUA7XmW4YPQXhRifwtjFx
         UfWucTf35UPuRjkjIAjAESMRevW9BQoUrFVETT7mErooVPKiTz96fNpyHacOQxjLptYE
         XvekRZ3LDy6uWyk9Yu3Snmw5b7KRvoVPCeybMTMJKFwS0Ii1NBZ9ov6dpAp6Mzb2KEg8
         r1vs4ROGb+fPxeqc6s0F28EYZIPzwR0Qoda3ZGcTzSIJXyNuGYbwKZRsHeuqI0ODNc4m
         KEnaf+m4NutpJYUUBIqvRRJt42sAuiNR+V45jFHP8OAtn0kHug28h70YT98Gqfg02tS8
         HSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743634870; x=1744239670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssDdQ9pYXMHr5I5/Xw/ZAgexifJSDigD1EuzFV2qg4I=;
        b=OQeB0hQJZlzYHzToU1z0znK1i93ZRbfuBierX1451OyfF9Ce1gsp+DMsUm6NtRpOxO
         F9bcVGqwz7uzc7L8XGsEhbA3EGH7Ct+COmNB6HRGIPHwnffGjorkN3/eG1O/S8iTRwLD
         fqha5BqDJAsNz9PYaqqN5t1HJHpdm/Qt7+6sMGATiYOEIP5j1VhzXagGyi3ftdbTTofY
         QWdljTQvyuJb1fNug+n+iK9AKtrAZfph5vk8ng3VohVbAUDu1pLfAeANdTV+XNedYdAz
         l4mB2mOVIkP6gWPB5A9CnJlW8sHmWRFVElfQ2YEKlvCKyMssBDV2pQQa/mxN/i+YpngT
         3jgA==
X-Forwarded-Encrypted: i=1; AJvYcCXPTevJ+Y4t061RLJkbfcybT0WlmYjQR+IF1Ku5QR55Z/pADuxOJvPwE1JFXRycpkofxejVU3OBpeIwLhCHIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKltUoOWRvP58s9quNYE8uL9T7C8WqsQKPh2gxa1DYqdVwIHR1
	lWZ+ojFBvoDxIAFNU2N8QA808vot4149nXbwXUDKB/8JPEnNU1WtoFGT1aDKcUk=
X-Gm-Gg: ASbGncucRr9oc2AY36Usdzpk2VqRtb51ygO1yIvO5SI8adla6SABAmI8n+FFDRM+uzX
	ZW8JG/wrlIeYk/zvGI6258eoh/5w1dq9+yQqees12laysYVz3M7UbVVNC6Vhduy99WOD9VZVOHf
	fARmTl5+ac81w+UvJlmOspqSI8ZrqwyPCIk+3tzN13qavXjDa2p9VkowJOOjgNakZOxIGO4q4Fw
	G2Xl4oQ0y2xaS+lynF7sOaCgoOHNTtO0RRCyZhJqTo5+FP/kFG66ixmBACUsmWQCr0l9h2T5IGi
	fHm1aTFPZL+TuBC/AmG5ZTd1qvGnMXYffNlQGdI4rUWYF3ZDkZE6ABQ+eLWo1OHfa1j4OxiGcpA
	OpEaGLXe4
X-Google-Smtp-Source: AGHT+IHyj66xL8VsObpHLyziVGG93y/NYfcl9RGB6qeFeKmVhSfE7lLRhxrpfsHle94LdUZoXtf+eg==
X-Received: by 2002:a5d:64ed:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39c2f96b901mr215465f8f.58.1743634870250;
        Wed, 02 Apr 2025 16:01:10 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c300963e1sm127285f8f.4.2025.04.02.16.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 16:01:09 -0700 (PDT)
Message-ID: <c449fba0-476e-495b-abbd-65ba2d44d590@linaro.org>
Date: Thu, 3 Apr 2025 01:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
 <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ffe49998-f809-458e-8eda-002d0c0fc32a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/04/2025 17:56, Krzysztof Kozlowski wrote:
> On 02/04/2025 17:49, Daniel Lezcano wrote:
>> Describe the Software Watchdog Timer available on the S32G platforms.
>>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof

I ran the make dt_binding_check but inadvertently removed the "oneOf:" 
after :/



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

