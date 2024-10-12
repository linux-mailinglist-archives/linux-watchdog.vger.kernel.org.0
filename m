Return-Path: <linux-watchdog+bounces-2197-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035999B5F7
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 17:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83EF81C20E61
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Oct 2024 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C932282F4;
	Sat, 12 Oct 2024 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erKaV3ZU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E515917BA3;
	Sat, 12 Oct 2024 15:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728748105; cv=none; b=lzmAw8/MTAobvglcOoI3V2Jm8uUUersv8vUtOWADmvuyzqlrtXCWRKUysWAHj61wgL9BQS/JZXGMBxyN83cg2oz7fFhs0pVRuBTkWHyOaw4r6yaBQ3ZrCwrFMcLqvcoGC8Ttugu6hLOqo3gxPpFl0JtCOqkqMDWDG/pMNekDVJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728748105; c=relaxed/simple;
	bh=eqMMTy9vN4cfjpAvr+hPWxBy8TCFF0273a8T1XHiqno=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D6pliocVHt1jbuUcxE4BQOdhdF4FPqXCdeLxYSwAoIvsb6s/YhBr/eC0sDQ1Z+zNaPbAEdT1FL4TQ3b4c8YOZ3QtDVBisjEMdZAFH8nkAVkuJXaCigSECV0oZsgfDafAmuPhZRSItm/1Uc/oJYWN7KWJvIUWDArPLIZURdNWU8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erKaV3ZU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso1799171a91.3;
        Sat, 12 Oct 2024 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728748103; x=1729352903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5E6oZyQ0XiiHB4zfgsMv2wFw1k/9mboJqj9Xin/I9a8=;
        b=erKaV3ZUdZMFSfdJAkAr8cSvK3U4EU+zNgo3EIUy0JrdgvAHlEdFYOB8U+GCPuZuxx
         /bWGrqUReh53qc/zRJzgb1IR0/oF4xD6KjvsLHMAJiJkTdclrKtYBfFXCnlCmuiFK59s
         4/aUjj1f/yVlRgnKgcqvxGw2M2jCtn2zzKL82wCPeJkyqDdleYgLj52oBBrUSgyx+vBn
         Q33HkOkr+nCwZNPZe77y7mxOKZlqdPZh4hcz7PrJZDzdSFXy1SDkmssqqGp5gy/rBHho
         THWvAODiUYTFP08i4eCXH7VfRZq5TiSSaKqCIJXhW21TYv+HFFlwBXTZlxkmuXhu1fCB
         u9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728748103; x=1729352903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5E6oZyQ0XiiHB4zfgsMv2wFw1k/9mboJqj9Xin/I9a8=;
        b=EmOITnYCZbrlMaHGC08AYZCjq+DUQ0OBCb2OOrvjS3BnQN/oV0PXumJrJGzi2cOVQQ
         wdSUqfvT5xWbvCzqM2mPsC2CXtTSFjZ1j7rbTpT/JMzwb+VcBAlJeSupD+RHhyp0lwpz
         umNqHqwoqm1CmUJaWYJnQsETi7ijuAwVAmTPnIAGOq95J5vjeL520/E48u7IznDAn8u7
         Hkllf9f+doRmNaHZ+3Pg48JtibkD4HF3UBunOIHwbUr3pK7sdmotwSOH5CtGi49g96JN
         xbOa6ye2tuXywRTpcHvzANO0RPsdqPl7U+gTb6n+Zow+jt21Y7040D5OY5+ThSOahgJJ
         leiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJJkrgB3l8tG/iGZegUAzLM7iwP5luHjT0hjeI8bYTuThwkITA+Gsh8EB421WvDYZnGq5AzIdJOmOl5ESNZf0=@vger.kernel.org, AJvYcCWMLGA6Kj9XiYvkhGsnvDGl/dn46pUIMtjTj0YC6SmxDS2yeWGUCGjkWVd97QS4REvaOcxU1C6fKazj@vger.kernel.org, AJvYcCX14EMpBiluuk/WFT+DylhVij/sP9BGkP66jubwuEI/uYmlN2vRFWGlMuuTJA9AYr+7EDQKKaMxghjPGpNu@vger.kernel.org
X-Gm-Message-State: AOJu0YwNTvzUeeDDvb6NPVnCopa3URJYNbKVMhfi3w1q+FyYvi252ZCk
	ZJUNO0uszU/UuaGDM6GKn8+19jO15oWXFJhFeQa8CA2r8rt2si3w
X-Google-Smtp-Source: AGHT+IFr1WpRvRiviKpGdTfC1mK2VDE6V90xs1tqagq5Zi0TZPv6vfSfOOpq2GPUhIoVapcTv2zl4A==
X-Received: by 2002:a17:90b:390a:b0:2e2:9522:279e with SMTP id 98e67ed59e1d1-2e3153581ffmr3998533a91.31.1728748103164;
        Sat, 12 Oct 2024 08:48:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d5dd4110sm5161591a91.1.2024.10.12.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:48:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c501a3b9-5953-401f-b6d9-6623aa321862@roeck-us.net>
Date: Sat, 12 Oct 2024 08:48:21 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: Add support for Airoha EN7851 watchdog
To: Christian Marangi <ansuelsmth@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, upstream@airoha.com
References: <20241011104411.28659-1-ansuelsmth@gmail.com>
 <20241011104411.28659-2-ansuelsmth@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241011104411.28659-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 03:43, Christian Marangi wrote:
> Add support for Airoha EN7851 watchdog. This is a very basic watchdog
> with no pretimeout support, max timeout is 28 seconds and it ticks based
> on half the SoC BUS clock.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


