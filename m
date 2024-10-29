Return-Path: <linux-watchdog+bounces-2379-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A149B55B2
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 23:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 522FA1C20CA1
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 22:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95AA20ADD3;
	Tue, 29 Oct 2024 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3SNIhGZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3D20A5FE;
	Tue, 29 Oct 2024 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240623; cv=none; b=d4toTzoClIKZBwEDFjqfTGc3VMlb1V6vLtBjW/ZEKDZ4u3/Lk0jsLi84pSXpqyvuYQZQDZCoykqGLEEwN5GFB2V/Lzc1RHFiQP3rSr5QxQsvswOws2S6mQUKpRjCOKHOmiCF627+G0qmPGIes36nBKYTKdjvbBx/lgnhP5HpGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240623; c=relaxed/simple;
	bh=YOHlfonGcOkRZSPk9E2iJXfWyslkYwgrxSzkG+aqEkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jo4+25nlBj83uj/OUnmR55APhRAP7zMRpbr+neqyxmh4SRENf3JDwnRGsFKH2DTixFoKt/IyYv1w2SH6agWxPP4pGzX6NkoAEVCB55R2q9WHYXMUSmEYzF17urP2UjDFR/whsLoBqKmH1IOky2gviuNauw1ZOfdYqRr8g9TL+PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3SNIhGZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cbcd71012so64434695ad.3;
        Tue, 29 Oct 2024 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730240621; x=1730845421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S3amIaBqxn/MRk2a7GLzyv4HMPzhNOSMDMorth6/EHs=;
        b=c3SNIhGZNTehoQdWucxglG+h7S90E0jMO7kOccc1und7DRW8PgK4qkRzVOffV6Qsz8
         9J8NWaPFufp5OE1AK+GDDEO56ai3Eerl7NsvQtDPWVHW3EoFTpIDOA8nEQbRbF/S+Ion
         S3h8GjovzPdilziqModyHwQfbK1L9TOz3k49iERdN4UYzWzqBih602qv8vcmerKASrf0
         +s7Z5om8vzCdxlmF9TiPGufFMia3CO9s2fIDTM77MyU8d1/NG9wXHvX74yW99QWXDtys
         WmtkFRxEQIh8wDhx/pfFGJ43NjLgJn0La44AFtlk3eyO9LytkmSjQB6cOKRaD3PT8ETD
         nMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730240621; x=1730845421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3amIaBqxn/MRk2a7GLzyv4HMPzhNOSMDMorth6/EHs=;
        b=PSfYTW2XkcPwl21//d6fmi0iup8LV5sdxTS4tDneI9ItcGtiBNxfrK5mryGVrNLp/K
         EtjoQVyly/Xa2RiWObUfWZ8Sw1H7I1JZynmuf2us1C89ufmEMomnQ/LzHhnOaZ3XMNdq
         yXRSclyU5B2rdzUPdL8OYCmuAbK4JWUtu8oAlYDffVs+IdT9HdYpBXixfulG9OBOBbP2
         N+YYSm7o3fLB+NmHo1Fpnu7dWLFw3yjM86Ba7bDyyEF3/s3MynMZjtjAWFVelD11wSPx
         V231U54v9bKz72jQlBMtD6GvFWg/wYl0h5DE83/0w2dZQte0pFToe6jHgRe2+G6yMpBx
         hFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyw6qellbf64ZHXMZXPhBQCW115uT5mD2VZBPm3VJoAQBuS0WYlMResqtn8M+qpMSqb1hdp2OgPAGhEoM=@vger.kernel.org, AJvYcCXfNhvZTS6N9UC4XZNp9uLdwsKIIbo6nFU1VmxoTkpnQWhBPJSVwuiLUVykdYIx3NqHs71gz4cS3oT259n467FB78o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcvJ8j1H7U0hcsnSlRVQiVY3gjeO5s2LEoRoMQceoQoQMacUw7
	ymEetkdzreorklBV89nriZg2la6tpVZZ31u1T4VGw3iQNQkKIPF/A9oDdQ==
X-Google-Smtp-Source: AGHT+IG2OJ1VL8fU2/dXLJtV/JilmSF/qgLlzh7YDYRMAY3fyaGBjvcMUfU2RkOk3ukVkrg9Pj8vqA==
X-Received: by 2002:a17:902:db0f:b0:20c:92ce:359d with SMTP id d9443c01a7336-210c6c6d8bamr214657625ad.45.1730240620917;
        Tue, 29 Oct 2024 15:23:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc082bb5sm71477175ad.295.2024.10.29.15.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 15:23:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58e98acc-d7b7-4160-9504-e5a7201f25e7@roeck-us.net>
Date: Tue, 29 Oct 2024 15:23:38 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "watchdog: s3c2410_wdt: use
 exynos_get_pmu_regmap_by_phandle() for PMU regs"
To: Peter Griffin <peter.griffin@linaro.org>, wim@linux-watchdog.org,
 krzk@kernel.org, alim.akhtar@samsung.com
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20241029191131.2329414-1-peter.griffin@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241029191131.2329414-1-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/24 12:11, Peter Griffin wrote:
> This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.
> 
> Now that we can register a SoC specific regmap with syscon using
> of_syscon_register_regmap() api we can switch back to using
> syscon_regmap_lookup_by_phandle() in the client drivers.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

I hope this won't get auto-backported.

Guenter


