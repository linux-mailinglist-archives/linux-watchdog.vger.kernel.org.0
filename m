Return-Path: <linux-watchdog+bounces-2170-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831D998941
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 16:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9F328A9D9
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 14:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6321CCB28;
	Thu, 10 Oct 2024 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ8n8Gnt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B071CB505;
	Thu, 10 Oct 2024 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569659; cv=none; b=IkMlfuF8K2zAIli5qyCxdbjcR+0StDp8h7XMrHmgoDUSNQNSkIR727vVKmgvoM86qAKwYgeyGiyXQL6XXaOVu0tUDyVCQWY2J4sj3+SOSmQXJqbcF+VOqN7ZrPPEF4KAbbi5rScQPbyCKMRdqX21i35E85RyTWOUbdO6sERNrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569659; c=relaxed/simple;
	bh=cNTLaPlqmk1DVmX1ffKjBHb3+5ytOIx+BBbcEHfJHwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aX8BVm3HYl1naVDSrifK+MebK1un5TfGXzFQcJ7oKhvtn4N5VYzViRPyoPDE127St8U8oj19hZpMdiWL/6XJX4RSSPScxLgJOen57GX4sSgvd3y/SCOD1pbJ2z1/ozfe45xup/HV8amHlvdHofcbiqc+8rQJ7Am+Jny7jSZUrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ8n8Gnt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e0cd1f3b6so761049b3a.0;
        Thu, 10 Oct 2024 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569657; x=1729174457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yvHeCDhdcRIH496syVGmBzmdcJIijCDtmjRSWF/mNyU=;
        b=DQ8n8GntcaSNRarcaNdJyan+JoRAVBZN9foWnQSnaqwu5BmzK1kZeh7QsAsUXIOGK7
         6WNq0UZmqtVujGKM1o1o4YjEC9TuBixkTA1Ao1DDZroqNNpODU0WJglf32zDJLCcklCL
         j0d0mTzem+Wm/BKVfahZA5ehglOKjNgcsE80pQMQEA700yl/ay9sEHdzLSMdZlw28f0m
         SkPk0PM+Tal/ZtUuFvpXAPWFj/k20N52Hraz/d39gO/8fteo9KLX1TD3El6FI7VeZGI6
         g00L+7so85KhaZ9V5v2xSJnpDfMeqDEsvkGiyFVnWOW+EL9LMHA8uUDG49LdJQctLWZO
         9IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569657; x=1729174457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvHeCDhdcRIH496syVGmBzmdcJIijCDtmjRSWF/mNyU=;
        b=WuvqD5wRN47RpYajgHIxb7lIeo4KX8jn3xDO7JdDlcVB87KrR1JAK5Ou7z4kh5y2V7
         btCDeXUIiyu3ya0ZJ4LISghCjTw0C0Wb734/LPQLzygAm1hb+TBRJg+kgkX/IL+hnS34
         cerGYzEYBdWOT/JUM0H0uMV6tECVCHGUBTEF2++fsnJMsYyQicO/q9l41jlUSTFc6K+H
         Xm7SxS1QHboSVt1ApaEbSDy3t8446aJlWP/Ei46BpYc45/CW59dvHOgMOGDArNjCkNC1
         QCxKVO+ghtQ9QGBs/NVHdBvwVImG3fs5Gbpchjo4CVoUCRT43Ras4FEoFzY141Uj6Atk
         0KUA==
X-Forwarded-Encrypted: i=1; AJvYcCV7CSWHCdbymjxajX5H5NN1gxkE/KnZ9fosDgTFe3JSoK6cqXj8zp9vMUaoeMYaXRq7BfK3LxM2FRezkbi/@vger.kernel.org, AJvYcCXwMjeGb7IQGKzS74vWDBWYuMj3HNSFardg/Mp8wb6B+f6rvXco+VKx+jmwJjqPXJZR3wsryOEYD8jk@vger.kernel.org
X-Gm-Message-State: AOJu0YxtJh1GjMCsqfqNiv308y2rasyhldypofNuLIZHV66OuyOo0V7r
	YsktApFXK8DcEw/9K+pJZX3ZQpdA+RZzw3YSwolLOTYS4ybH5saI
X-Google-Smtp-Source: AGHT+IHFMjuAvQQl5rnYEDKUKdIeODkNv9AqdtBfjJ4hc/fOCAcar8Vzv9smwKR0HWGd2kgzD5zfdA==
X-Received: by 2002:a05:6a21:3983:b0:1cf:3885:b9d8 with SMTP id adf61e73a8af0-1d8a3c208fcmr10332464637.27.1728569656621;
        Thu, 10 Oct 2024 07:14:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea44908236sm908852a12.43.2024.10.10.07.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 07:14:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20141056-15a3-4e4b-9100-d1a570f39e83@roeck-us.net>
Date: Thu, 10 Oct 2024 07:14:13 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Add RV1126 compatible watchdog string
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
 wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241010061408.1351865-1-karthikeyan@linumiz.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241010061408.1351865-1-karthikeyan@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 23:14, Karthikeyan Krishnasamy wrote:
> This patch is introduces a watchdog compatible string for rockchip's
> RV1126. I have already send this patch[1] in the series[2] but somehow
> missed watchdog maintainers and list. So resending this patch alone
> again from the series[2].
> 
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> ---
> 
> - Link to patch: [1]. https://lore.kernel.org/all/20240912142451.2952633-2-karthikeyan@linumiz.com
> - Link to series: [2]. https://lore.kernel.org/all/20240912142451.2952633-1-karthikeyan@linumiz.com
> 
> Karthikeyan Krishnasamy (1):
>    dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string
> 
>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 

I am curious: More and more people send introduction patches for individual
patches. I don't see any value in it, the intro patch is not available
in patchwork, and thus the context is missing when trying to review the
patch from there. This makes reviews much more difficult if one doesn't
reply directly to the patch. It doesn't make any sense to me, yet people
do it more and more.

Where is it suggested to send introduction patches for single-patch series,
and what is the rationale ?

Thanks,
Guenter


