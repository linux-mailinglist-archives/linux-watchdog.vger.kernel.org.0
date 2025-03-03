Return-Path: <linux-watchdog+bounces-3039-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31DA4CB72
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Mar 2025 19:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7392416628D
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Mar 2025 18:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE8E22D4ED;
	Mon,  3 Mar 2025 18:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aGVYKuGy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32E622D4C8
	for <linux-watchdog@vger.kernel.org>; Mon,  3 Mar 2025 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028213; cv=none; b=FNEBSX758Uql1UMagm1jVg3u/MWc8rqj5rws1nnrm/JbzxEz0ZHeBv+31/OQPXUJrLm/NUZknfSLx8hOyD9I1Ubyw59gMGDTR9Zn5oUeKBM2H1jq859wTy+t6lkdxGeIpcmpa+NPa9jn3QavUfeCYn7xN+sBRDvN4oKoSEee8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028213; c=relaxed/simple;
	bh=I+YMifaWTe/KtcKWykwnguS02DQwUt/9Nd7ZBZTaipM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emVD+1IwQV5y4iyckTE2Pg3o0Evj33Nx/Nay3soXULmWyRfUhYKCLPsCoBaeZdzgxvAeHqFHIWtWmuPl26vGxRz05dI/NGoY/Kp85AVLY53NK48H+mrkrvQUF0nm483tKHQ4eL4meF0WnQFaiYgjWdZ4gLzJ3J75JKCIL5b39mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aGVYKuGy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so51800465e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 03 Mar 2025 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741028210; x=1741633010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByURWW4/51grEFFoJ5cNbGWq84mjT1dgOMDzzVdymTY=;
        b=aGVYKuGyOfyU9UcQavzr01XQNPAZs5kAe6gKMjYHl4T7XQjPiPHek5YgM1iqH/1oDM
         M0xI8p3Ty1nK0IPEGz9ZQi0Ti2fi764sF/BZDfJRzJncCTkfG/BV4xA7z4hwkmtdzjLI
         BspErz0GpDg707j8UFSbl1drZaCkibpsQkcmK2/+F4wB8YW+ednOV946QvKqE1UxUMYL
         uahffyCxut23erQrfWsI577jiTlvec0IJqDVFYy29BKWM5xvEgAdxqXmM1yboAzK/geS
         YhgO5eOFtBbhSGu7L54G/fhZfS116c/uvGPtEOEtEQR/7yKFHqyulGPuVWupTgeZ9s2S
         7XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028210; x=1741633010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByURWW4/51grEFFoJ5cNbGWq84mjT1dgOMDzzVdymTY=;
        b=bUheVtfURBip7h/jH3V78vJlVmal8qcCfpLsNrP01zKsbhqOG/3xUgtFzQbYvvD/Y3
         lU2CWueJvEX3viRrIiW2BMuTp6uuoQdG2fFC9eJw4Es1MOVZeWtz0MXbEKuC/h99s67+
         R2xmm67Q8sXQYP+PK4EF/xsp0gRRx8mLTwfXtctlP2O8IOHDOJjmSh+MFIV4mCu9/LMu
         7W+11qyFdOfx1yFtsP8nsURpthstaXizAGhvnwDgucP8hEsSV55S1KHTNmIaLuXkAQaB
         OOivz2V9icMF7vLUt+VTmRvl2XaHYIZmUK4Q4/Q9yWH7YMbO1kUvHVewskGYFq/+X9pJ
         STsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL5MA9UduA8RndEvuCrY0s96X72ppkiY0NWVkmZ9rgZGRVlfe1IY2l+eSWSOle3M1NJNuUNCs1vtyxIvGURA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2e3Edb0L9C9hqN4L2NI5rfZfsyolDp40BY0hgZhb8F7vRUZaZ
	8iZN3ZRdMkqCWGoZgmxPblFzhb/3vtn6fUNPV+R+JNveg98wRUtTcMID5Pc6MZc=
X-Gm-Gg: ASbGnctk3oJQwfWwW3wzA9W3cS/swV66/Yhxtb6qdt8qSaB76A/RvXPureDvn8CP9DR
	20L4QaKI4NpOhXxgzhNx/zhHT+pPh53uF5fGByPKG9Swtfd/e2vfyn6ENKrE7ghVCm7V+BuZGNt
	9CQJ9i0fgJYOxdpUccoEj0GmrWziVdbGkGxRcfSSIkLUqfFAFxk2XWbYrRqJEsq/pCOH9ZqHQlS
	nun1JD2mi+g3nUNi+NzARxuTDssikubc03dLG4OOCtnmJMg/e9/ail2IJ9y7xFpg66wNQqFyc6f
	Csz4CZh4TGBbLMYyjJQaIymHlldQVIM1ni8iXdzFTtdMZvkPpWs70A==
X-Google-Smtp-Source: AGHT+IGVUE0CQu4ReThqwR4ny9E8a1exZ2jLsRFt7w170BeB8vADyu6EQUUGy2xTMtQFYKiXpDs9Pg==
X-Received: by 2002:a05:600c:4fd3:b0:439:a255:b2ed with SMTP id 5b1f17b1804b1-43ba66e5f09mr144551665e9.9.1741028209871;
        Mon, 03 Mar 2025 10:56:49 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc9c0fb1esm12229025e9.20.2025.03.03.10.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 10:56:49 -0800 (PST)
Message-ID: <39213e99-3041-4602-9dd2-536e9b09ad11@tuxon.dev>
Date: Mon, 3 Mar 2025 20:56:47 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add System Components for Microchip SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wim@linux-watchdog.org, linux@roeck-us.net
Cc: vkoul@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1740675317.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.02.2025 17:24, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (2):
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65

Applied to at91-dt, thanks!

