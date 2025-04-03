Return-Path: <linux-watchdog+bounces-3197-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E620FA7A701
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Apr 2025 17:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB8881896DEF
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Apr 2025 15:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237F124CEE2;
	Thu,  3 Apr 2025 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euke6chF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E024C080
	for <linux-watchdog@vger.kernel.org>; Thu,  3 Apr 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694412; cv=none; b=fPzP5CjlL3jXHMdWuJmm+u3YNQkiKBm6eQIYTnnjuyKnCWMKLnTFAgYs+ZuTxHPJ85ySKJHvglUI99xyyMyqHN5++PsnOOgSDNHQA0y1A89WOB+JVQByOFr0BuNHy/PbjItEGB+krzQRnFvazqi6LdOb4TCPK4Xf4sl2ojg3fiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694412; c=relaxed/simple;
	bh=xUsMfDdsHev4z8y+qrKBCt1T0mcUN+xIFgs5O6KHNTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmM8qOLJR8CKxFWrB4mkUvkUZhIwZHEp20ItrFCpbhZYAuDDp2pZeqtDr5hHHk05vYTXMhCXgfFqio5UdWKhBUe4ndXllIg85ESwkzMoMW26zvsH+6N7NPltTFCxzF7cUKJoIxbqUMI0HUr3pMpENjtR6rDjyGzXLgxkm6OY9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euke6chF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so10470415e9.2
        for <linux-watchdog@vger.kernel.org>; Thu, 03 Apr 2025 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743694407; x=1744299207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IA3B3Q5eXFyYAQJEPZq6Pd0mFFgGQNKge9PTmDiKXyk=;
        b=euke6chFnB+IvJv/vmegiBgWqdof4AE416F1qKIz2LauJgz0ns/GlLNGOTY0N8B2vK
         NHBudNIk3DPPwbvJ3Vm6mWPiUt1VIxJmRj6UWjzdGBgawXfcX1D0D+5pqk54R4pG9Z2r
         DjeYz3l+cHwsvQwMWbDIJ4kcoez5jgWmoEd1JqSan4S8dYa8Erbfp5BKw2ElatvBqZ+q
         ctKom88/lebu+Y+ZDkD9rIaelBQGSIVV/9CSIHiz0wk1grqsrW/1SgLnb8sSjFTJYhPm
         js2dT3xX99g5FJQDKnJpVB3j9zHRAK938tmr5vkpMWGpXUMMoV1rMkZP/XidPiLBp5km
         n5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694407; x=1744299207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IA3B3Q5eXFyYAQJEPZq6Pd0mFFgGQNKge9PTmDiKXyk=;
        b=KW2s5ZYEiW4/x0XaC8hQnS4hyQh9+RW8EYoU9DAr2Tyb7ztyjl1aGXpBkI+2x4qv7u
         A13Fwhb3zALVck9YFwgjZJB0EtCKooXSpWXnuJJQuwOWOKJYISA1pBwhCpmYzOMGJTRN
         t6awcljLZFO4aZj+6PDSxLleeqsQcUdEh2Fqy9AnnpMGdaxlTNIp+7JSnjjS3oxiGUKe
         qAgpFLBbK14I7Ys6UmTRLQ2VWiIq9I/VrNnXhAik0INXhLlavebFGQNlypoaH+B4fKB3
         M60NFlVWXJv5Tb97M+uv6TVwxJuxH0YoVQHl2NTNwZWOORaD24jHFaeyzelRJg8Qv+l+
         8Oqw==
X-Forwarded-Encrypted: i=1; AJvYcCW+4+BSy9mWCsSPrkqA0j/fceE8A2/zRL6jE6csNqIPeDl8SSbJZGr4Bump/1nyX5O99pQ1etiMOfED3JIx8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuBlSr6X6sh33SlpPQODEzzIJVtHAgre5cFXIqijz02xgTp694
	V9W36D8dCOA4zgmjdFJzIky6b8yKIhc9YetU1a5hyMWK10kyGHiUA4PLEkNuaUI=
X-Gm-Gg: ASbGncseI/DPEAfs+SmUIAwfS2n4+dSRIT9jnlIajvxNHUgJpZdRdA75P+/ITL4WH11
	mZ75OSy531HzNnOjnHlpPPCNZlan0vxyu80iP6eiz8VTReMVVQ4j6ZqYeqoi8PzuYGyIYFlsd1i
	2+zdasbofuRs61WweIA7f/JQRuI+zgYEBU0e/b5vdlYD+5woXGPgF59S6zxNyNP92xhUqMbrTwd
	hetvr2rAKMgqzzt0XsxPn4ECGCBXGTDt2X3K8B8lfxKwrd0BbQJr5K67F7FWrn56dVG69O6gn/l
	Ust4pa2fBJeH8ovEK7YihjjltAfEmIwLjnEMbHOoCXzq5SEwECjk1E1vI+pytUnkfDPazCpPAoI
	ECrS6mkh2fmIlgOKIyT0=
X-Google-Smtp-Source: AGHT+IGl0RUQsSLIiDj6J53/hl8O4gfEXAtkKHjNB/Cx3JzQ6eah3TKX1+b1Fw2JSaFT996wTjvNNQ==
X-Received: by 2002:a05:6000:1869:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39c120c8f07mr18988412f8f.2.1743694407337;
        Thu, 03 Apr 2025 08:33:27 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm2105782f8f.60.2025.04.03.08.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:33:26 -0700 (PDT)
Message-ID: <5c2def81-11c2-4e24-b633-aabdb50cab34@linaro.org>
Date: Thu, 3 Apr 2025 17:33:26 +0200
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
 <c449fba0-476e-495b-abbd-65ba2d44d590@linaro.org>
 <9c47cd4d-41c7-42b9-8f00-a1ea9b9f6ed8@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9c47cd4d-41c7-42b9-8f00-a1ea9b9f6ed8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 16:16, Krzysztof Kozlowski wrote:
> On 03/04/2025 01:01, Daniel Lezcano wrote:
>> On 02/04/2025 17:56, Krzysztof Kozlowski wrote:
>>> On 02/04/2025 17:49, Daniel Lezcano wrote:
>>>> Describe the Software Watchdog Timer available on the S32G platforms.
>>>>
>>>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I ran the make dt_binding_check but inadvertently removed the "oneOf:"
>> after :/
> Other errors were also not fixed even though you got report on them on
> 29th of March.

Which ones ?

All errors were coming from the oneOf removal, after re-adding it they 
are all gone


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

