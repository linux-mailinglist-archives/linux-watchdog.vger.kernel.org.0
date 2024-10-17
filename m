Return-Path: <linux-watchdog+bounces-2224-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BE9A2491
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 16:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 680BE1C26710
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2024 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997F81DE899;
	Thu, 17 Oct 2024 14:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCXnbfiB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482B1DE4EE;
	Thu, 17 Oct 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174191; cv=none; b=B0YOFUitTCmR0LNjFDzXxtHtf3SEJkpm/oh/yfnYT7c7fHSPFk5eVWEM2/wUKL5zSuSvtPg503vFtScrYKZO7ZTWLX+58PfniZ0qLmRxniU7fESt6s161izD/SwhUg0nsXV+QtVS3YmiJFjBWEHuVEFqpbMVX1O/LYC5aVfHIjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174191; c=relaxed/simple;
	bh=dORIhZy9bhc9F51gpNiV/2yj0/2/uOOIPlwDzcK3wM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN2bhNMXrh0JwYBCGxtEY540sLMM8pJ699ewlX//9vq73lgB5WcagR54GBjQSqY+jBUf01SjnUSl5IJJ10X3z2VkTsCDA/azujSnyJBFsn7lfnNMD2WS2dQMOrJJQ99iE/v23QSJ7rQinsj2pc0RbPkH/uMT/gGk5cdkezqpBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCXnbfiB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20cb7088cbcso7596445ad.0;
        Thu, 17 Oct 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729174189; x=1729778989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kOdq72Eyz5fliKe/ITZ+qWweux/QPvBun64ac46dsnc=;
        b=dCXnbfiBLy9EVSQCX0WQZEfszQRq1nMxq17RgTnLAcCj5SKyhlH+MX+3Nk3TMdwfDa
         ZyjDbn3wenw9qHdUN3fkDOVtJTAVtj8cVxn70vMV9MJuK/3MHttRUJxKifE44K4Qg91A
         u4cBKH+6xwF0WFbptdJhQEi4zALdHQ/r2MzCd/rySekRaDNorUGjR345LbPj+axiikP/
         q3PpPMjsZqaca8V2uoYMyGHGGn6KKJKlLGtVESXE5rU/SZOhiT7dULQ69kmApCy84IF3
         1xBzckTSqoDuyxR+vJsxyYrm8yufzNz4klzJ1haT638y5b6d6guaXWR4N2Y6H9VDoJPR
         6hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174189; x=1729778989;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOdq72Eyz5fliKe/ITZ+qWweux/QPvBun64ac46dsnc=;
        b=m24CZL/DMVeEPY1/ao99yjmZP2SQpX0irNdg9p3N+8YHtZpx+1pL4hmEyKYY+VMI/n
         jRaH+QmrIUKA34UUT1dpPI42swxZ3ZDxNDWKGqwdz1kEd8IGrZx+VqdtN+M63U6Su+2C
         qjwR9dbY5gON0nXoN/vVcDqkY8AxOGF/aWTiPIn+3iLLnvPqqqaPx0gqYp2312eCw1kh
         Beze122fPNTBW/tGcsNczol6BjDpxY1rDp8Efy9QlfWQ3IqS0TMD+1QPAUTR00E+M859
         q2M5oyoWYLIjPCCvBza0vjCy+6aY42VsfgvI/pBa4eJn0b7ZTDS9dRniKi2rp/s48Uk8
         7juA==
X-Forwarded-Encrypted: i=1; AJvYcCUF8NGT+TV1okQmw2mXJlHglis8xF+8SxiC712C+NI3LjehwFdn1YZZvljzmPal5mnqXA3BCHOK/f1+eG9pmH8=@vger.kernel.org, AJvYcCV56nty/ZtTZ5WAANnwm43TJd16OtMSAZPTibVL9CL6OiZSfc46a8VUBV1znhKFBdW0IdlK1e/KsnCf@vger.kernel.org, AJvYcCX/PVrKbbHRKuUVDZPV5ah1JRVGIE4dghfrf+Q9S0nYS93Rfytx5lbQH4S0Ij8FWVkEcgy2jRCs6y1ZIXPc@vger.kernel.org
X-Gm-Message-State: AOJu0YzGYF5UVWfhaf4RWFxAN/8I5GdmnqE+8hQ/UjlUOpgBKWmsBXFX
	4zTfSPSqSbe82Q0hkvVi7XGdO/rP/M7EM3P+hVikl3z0YPdiGFqO
X-Google-Smtp-Source: AGHT+IExDgDSSArIdOLivGgAmDL4WqA8RdwCEDZ62ucf2tPOrBa22Ctmy1n/ZvkHT+fL+XTni0nsGA==
X-Received: by 2002:a17:902:e541:b0:20c:d469:ba95 with SMTP id d9443c01a7336-20cd469bdaemr196136315ad.16.1729174188976;
        Thu, 17 Oct 2024 07:09:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1806c6a9sm44510705ad.302.2024.10.17.07.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:09:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
Date: Thu, 17 Oct 2024 07:09:45 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: yassine.oudjana@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
 <20230302124015.75546-3-y.oudjana@protonmail.com>
 <0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
 <f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
 <9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
 <WOMHLS.HLNVQWWVER5T1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <WOMHLS.HLNVQWWVER5T1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
...
>>>
>>> Say I don't want to use the watchdog (which I don't, all I need from TOPRGU is the resets, I don't care about the watchdog). Not starting the watchdog means I can't reset the system because all mtk_wdt_restart will do is make TOPRGU send me an IRQ that I have no use for.
>>
>> If you don't want to use the watchdog, then you don't need to care about bark
>> interrupts and you don't need any mtk_wdt_restart() functionality at all :-)
> 
> I need mtk_wdt_restart to restart my system. I shouldn't need to take off my phone's back cover and remove the battery every time :)
> 
>>
> I think what Guenter said makes sense. We should make sure the watchdog is started when calling mtk_wdt_restart or at least configured in such a way that we are sure it will issue a system reset.
> 

It is more than that. There is no limitation in the watchdog API that says
"you must only use the watchdog kernel driver to reset the system if the
watchdog has been activated from userspace". Such a limitation would be
completely arbitrary and not make any sense. It is perfectly fine to enable
the watchdog from the restart callback if needed. Actually, all restart
handlers in watchdog drivers have to do that if they indeed use a watchdog
to reset the system.

Actually, I am not entirely sure I understand what we are arguing about.

Guenter


