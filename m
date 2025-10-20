Return-Path: <linux-watchdog+bounces-4407-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C54BF2ECE
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 20:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A385C34E455
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 18:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4F232F75E;
	Mon, 20 Oct 2025 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gi8SRe2K"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466FC2D0C8C
	for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984852; cv=none; b=SxmGsMA0F27ZEZm6yHVxD3TgFn2rG8t+OybDnCTQ5gLKRL5scIqHF63tL18tGHypoxQ1Fd2X643j1QC5ZkJAXk+6P5/Qatm5A1zXnbhTi7UuCRo+BUIpsGKJmf5l/Ski++NqKTig0OCvD1OoFJyhrNczrJ8uQU/TbEdsjvksGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984852; c=relaxed/simple;
	bh=sYVWUSKsNXqyLkSateWcXYUk5hCBzr+F+MG40EHbSaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fb9Cbijv2/fZBv+ZWvB9xBm5BObb9ac3dx6IPM9n2p4GeJa6wb58V/ew8ncN2fpGK9nefKlN0e1X9MNOX1+lAPRqm2V9HM2d27qk6SKcbGkc5h7h2LNWpuIIEKvoIKZf5CtVOeidBCTPG3EXlf/zXWj/K5NfdDwugWJ4ru6liXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gi8SRe2K; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso4164126b3a.0
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760984850; x=1761589650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FTvwgqpXQZ+o6L/m4LchDT1vFh5niSq5QC1VWoGB/ow=;
        b=gi8SRe2KuvXlLPk+Lnem5NfyF5d9pLRwTe9I+fOGbNOQAelhwek6CdqA2s+JZqFqqU
         Orzfensu4Q19Jw9meLdoPG1ftCcqaqYxlKNhMS3ygeLkbHR6CEI2DubdSW7cd0khf5r8
         Rw/wJa/MBqLrRSMYJL2EFoYUKZc9rUydAh0KPKBQq8vXQ9X+J6KSehC92yrzZoG9hTSJ
         dEHtZTn8/NhVsaP+iOVLr8SrzzH4500q5cFozwPKG6ehL3WBnLlMXtPCWVZP5kEXtCqt
         JpofjX41leVpyxnQAI+2djB3vW5hqs9A5zAGkRZKCoCkJ20txMg6h3oiKXaW39L2x2Db
         fA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760984850; x=1761589650;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTvwgqpXQZ+o6L/m4LchDT1vFh5niSq5QC1VWoGB/ow=;
        b=rH2BcJYQBIxa6DKhcqnm1DBGET3gGpdFsWr3IF+d1EduvAqyVO4zCvIlqwMBb+kOi0
         1TTAmR7cNi1UKkuI3VkHKmp8V1FAqji78AlPH8ykW626f5+BqAA5D1JC3ATF0x+HKWUv
         n5PsRXDsMkdJNuGGAPEke1NLqWbwoNmErC/HpPCukA6VrFMucjDSeUCUf2PpzrIaTCdm
         Zl5vOHO6L0Zf19BjjmMiQcDDfMit4RlgAxhN/u03lFvqJw6PAA5Y2ml7GrYZzAnUiUVD
         j17ss8cjUNMGtFmuKbi5RUT284S6CgsYHgC6jLKCMv56vru5ba433FaqOeW2l21FFEYH
         /ZVw==
X-Gm-Message-State: AOJu0YxEdGoAyvreH4hDwLq8u6Qkfd2gp9CiC/dm3pC2hAlKbEWDz7R6
	mjiQBsvuJpg8DBp2RegLROe1qwxCm/Gd5WICsvnNkdV4uDnH+j23xllx
X-Gm-Gg: ASbGnctmZEJmzzicM6Znut8JCA/qhvnClydqBqcb5ylZY/mwI74glGUkzdO7lHJIuNd
	TvjHsuROYZxLUv//yRjZqxyLIfu6VFc7Ic2NHA9ukmZJudAU+/dOV+lvWiywBPWO1I9QGbWDr1C
	ClDWUv1yxvETXm9UEBd58VWrHW0/z1XYzNm2XQtw3Q9bLcLgvL5wPMuYY84j3iJRLLRDvOJx7eJ
	MVg4bB+4eB99fyGh4+A9c54xQq9ZdV2HXbSQX8jcifCD7ZpO1nJpYS7J3eKpL/Znq8H/VmPDVta
	dKosFCmSM7PS+19ltBHph91v8TunrwlALuXYZd4A9+OoiS93Lx+1ZmcVk20uUjnvVxax1/CJ/pb
	VPeuuO5K1eu3Pwguc1uvyPym74N0P09CAcINZfqEGAjhbwsKUhQojr22tnJRsq8TKYIpFpVJWmX
	4Ucz3uz3aCNWFrirQvwwb6T0h75dhu1wGUS+3Ery+i7IPhauKNouIK4y9aesQ=
X-Google-Smtp-Source: AGHT+IEjH3dSW9ulk4E4mIrpvO9Jn1AcEOGkaGJJ9HKRt+Ccb0xvg2qf5L9jZNunaz4Ts5RCZXrPOw==
X-Received: by 2002:a05:6a00:4099:b0:7a2:23cd:418c with SMTP id d2e1a72fcca58-7a223cd42b2mr14024213b3a.3.1760984850497;
        Mon, 20 Oct 2025 11:27:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2301230a1sm8880632b3a.71.2025.10.20.11.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:27:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aa552c02-b8f0-42ea-8075-415d193f8cb3@roeck-us.net>
Date: Mon, 20 Oct 2025 11:27:27 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Restrict timeout-sec to one
 number
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
 <20251020-dt-bindings-watchdog-timeout-v1-1-d0f3235eb327@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-1-d0f3235eb327@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 09:52, Krzysztof Kozlowski wrote:
> Linux kernel expects only one number for the watchdog timeout and the
> type is an array (defined in property-units.yaml in DT schema), so
> restrict the property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/watchdog.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index f0a584af1223..be0327f587eb 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -24,6 +24,7 @@ properties:
>       pattern: "^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
>   
>     timeout-sec:
> +    maxItems: 1
>       description:
>         Contains the watchdog timeout in seconds.
>   
> 


