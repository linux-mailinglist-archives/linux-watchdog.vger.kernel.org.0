Return-Path: <linux-watchdog+bounces-3476-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431E6AB6FEC
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 17:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430903B046A
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 15:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFD521D58F;
	Wed, 14 May 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zo1rjdwM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F81DF994
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236632; cv=none; b=ierpnTgnxS5ekpB0jdfYMQwfGGUViLjNTunW6/lqNLszmWYkZhHyRfYTv2ZF5APMmugK33xKBm6rMrKafQ4i2fR+9gCcq2cZrpbyVb9fqZ3hiCa10K40Q9oigOaIrBlXhs4juCW6ocD6DqsDmjfG/UtkRK64BWnRyGwaEbcBINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236632; c=relaxed/simple;
	bh=moZFEINmCupMyzsdUOqHVB3JKm+jOMrn4fBI7Ik9468=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=X90DoRgNLAnZSrDCtNijyubWntelEvLLtniGz/wd4uScC+XWLgnrwQoDZjzKxbsjyf/1SqO4XpVXEf2r75ItB/q56SgADE9yzJ7ltNvSvPQEiPheXFHTEA/6m4aYQX3tSUZy64nAzv7DEv5rT7UYJT6SVaDMLlxOA0AJ0STESy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zo1rjdwM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b9303998so759939f8f.0
        for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747236628; x=1747841428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nycOpyBxI5sRC+H1LR7ey+jyRhRD4iCs0HcWJtxwtvU=;
        b=zo1rjdwMWVdUfHn0DPJL2RiafHIcfHF1pyTtVUPGCApTtGkNU+K2QRtfk68+B0TgPV
         aod01e7J8yAiBTBpAFH8dL4PYOn7KI5RstxdaEgOhACd0S/uolb+NYgLIKGCMJxoxane
         qZFU7/Zf1yBj/xxfbzig5EpoIUyPQqrMJO5xSCUEo3qF/Y1DiBA4PdAhLU8qduMI6VJG
         VaAIUKkiRsa8XMTRSUDwM9XDxHLQnqYgotwwZR03w0/tBW5VsYejn0pkLrgz0engiLMY
         r4TrWT35P3tC+znhTFSVbluC83y1+5XuNA4iRsVn1LtfArZ6Kt2n6P+z8I0OvcO5Q5Vy
         ygGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236628; x=1747841428;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nycOpyBxI5sRC+H1LR7ey+jyRhRD4iCs0HcWJtxwtvU=;
        b=ObHChNxZFSemuCkkC5vyQ4UrP1azZ4YZdsYaoGMRNa4sjZ+VW1ZV8y+D/Foa4fY5D1
         vpTNcvvKkPqekOedfrjb5gH7W90zWF5ET2B1tqYOxnHXLxeDqDSYLrcHfkaRe56tTcW+
         WcF4hyqtTMYsMjpTQXcbG8dlY3DRHDSuS1oQemZ23h/4lhhu3S+D7yP2T7e2AdxGi7JE
         Cgkcu+Oyb+1MkHYGnESZimqSnHDIKehE39aCZGrFqEwfZXXIxBXN/m+Sjdfhc+oij83O
         0o35YgLANNeg69Y3pbGkqzMzNIMyMLebFPP1lRiqel9+AbzrJ7Oe6+WFTWkfohlP81bk
         Ot8A==
X-Forwarded-Encrypted: i=1; AJvYcCXUUHLskutx3oRPsrAlSTg2kJqgS3rY18dEid9joXBTDS8sILG0j7PWC9aZFjIcoMj2KukJ9qTaLFpfviBzqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8YjDdPPdKzugL5p6fuO+j89SxF2ddbhp1gtTD+mweXPj0ZYGh
	D04BqM+T17UNdS8D/972LQ26Py9o4bezF+p6mnJ4jAico1uFbEWFShW1ie3HiRM=
X-Gm-Gg: ASbGncv4INKu47esorMKCfJWSgXmBecT35sjyqD9MjshMu477dNsetsEodNbdQ1PAAh
	QUaZrD2Lj0eidjhE4+k6SASclWDfjHy8w4U7Z5IwuCYPhjnXZvnhw7rOpejLEKhN5WjjwWa7uDC
	aDJH3FQxtzMXfN0RsWlJ5NFKpRyc7osGLZrWbtsjOAVO5cw5PIu/GygCVU4EFjpBBsGgFafN6kj
	J0dU/CyV++ggqp4tQ4NjigZicMdTnwX3GIh747mSgn6rKP6IkDsodnPUQJXsyfhJQRcraJZW1tN
	tlzLq2wSaJdOeDWq9/lJMgmh4NdKkxB6l1Np6FseRl4nBDnDKWdgwudcl8fE5gEGEQdPIoknMUi
	B+Y6cqtcRKvA1/VRjBUAh6rY=
X-Google-Smtp-Source: AGHT+IHTYDs/TaBgsdW3hxCoxJZWvcRCJr5SkxDS89aSiJtpbn9D4/TYDukFeKcnbKmAmLbDJRJzOg==
X-Received: by 2002:a05:6000:2486:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a340d159e1mr7054344f8f.6.1747236627686;
        Wed, 14 May 2025 08:30:27 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c599sm20435689f8f.94.2025.05.14.08.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 08:30:26 -0700 (PDT)
Message-ID: <650c336b-a698-42f5-ad59-7dcdf24667f4@linaro.org>
Date: Wed, 14 May 2025 17:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add the NXP S32 Watchdog
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 alexandru-catalin.ionita@nxp.com
References: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Content-Language: en-US
In-Reply-To: <20250410082616.1855860-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 10:26, Daniel Lezcano wrote:
> The NXP S32 watchdog, referenced in the documentation as the Software
> Watchdog Timer is actually a hardware watchdog. The system has one
> watchdog per core but an assertation does not directly reset the
> system as this behavior relies on a particular setup and another
> component which is not part of these changes. However the first
> watchdog on the system, tied with the Cortex-M4 #0 is a particular
> case where it will reset the system directly. This is enough for the
> watchdog purpose on Linux.
> 
> The watchdog relies on the default timeout described in the device
> tree but if another timeout is needed at boot time, it can be changed
> with the module parameter.
> 
> If the kernel has to service the watchdog in place of the userspace,
> it can specify the 'early-enable' option at boot time.
> 
> And finally, if starting the watchdog has no wayback then the option
> 'nowayout' can be also specified in the boot option.
> 
> Changelog:
> 
>   - v4:
>      - Update the watchdog timeout when the callback is called (Alexandru-Catalin Ionita)
>      - Fix the clocks bindings to have all the clocks described (Krzysztof Kozlowski)
> 
>   - v3:
>      - Add the clocks for the module and the register (Ghennadi Procopciuc)
>      - Use the clock name from the driver
>      - Removed Review-by tag from Krzysztof Kozlowski as the bindings changed
> 
>   - v2:
>      - Removed debugfs code as considered pointless for a such simple
>        driver (Arnd Bergmann)
>      - Replaced __raw_readl / __raw_writel by readl and writel (Arnd Bergmann)
>      - Reordered alphabetically the headers (Guenter Roeck)
>      - Enclosed macro parameter into parenthesis (Guenter Roeck)
>      - Fixed checkpatch reported errors (Guenter Roeck)
>      - Clarified a ping on a stopped timer does not affect it (Guenter Roeck)
>      - Used wdt_is_running() to save an extra IO (Guenter Roeck)
>      - Fixed a misleading comment about starting the watchdog at boot time (Guenter Roeck)
>      - Replaced allocation size sizeof(struct ...) by sizeof(*var) (Krzysztof Kozlowski)
>      - Drop old way of describing the module and use table module device (Krzysztof Kozlowski)
>      - Replaced additionalProperties by unevaluatedProperties (Rob Herring)
>      - Removed the DT bindings description as it is obvious (Ghennadi Procopciuc)
>      - Fixed DT bindings compatible string (Krzysztof Kozlowski)
> 
>   - v1: initial posting
> 
> Daniel Lezcano (2):
>    dt-bindings: watchdog: Add NXP Software Watchdog Timer
>    watchdog: Add the Watchdog Timer for the NXP S32 platform
> 
>   .../bindings/watchdog/nxp,s32g2-swt.yaml      |  54 +++
>   drivers/watchdog/Kconfig                      |   9 +
>   drivers/watchdog/Makefile                     |   1 +
>   drivers/watchdog/s32g_wdt.c                   | 315 ++++++++++++++++++
>   4 files changed, 379 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
>   create mode 100644 drivers/watchdog/s32g_wdt.c

Hi,

Gentle ping, we are close to the merge window.

Thanks!

   -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

