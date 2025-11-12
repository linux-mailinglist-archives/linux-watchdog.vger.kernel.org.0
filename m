Return-Path: <linux-watchdog+bounces-4567-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6EC54C6B
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Nov 2025 00:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A8BA3AEBC4
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Nov 2025 23:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8312C375E;
	Wed, 12 Nov 2025 23:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOpBFswF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55F2550AF
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 23:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989010; cv=none; b=bdVSFKXibgftPvcvlVUfRG2THfp9UZZ5dyMCa5nCMFxJQPH2olKPGZRz0ViRHNNXsxbUHLXbc9MfPIu+4+XnFX6gw15NUDEbrQ3Ro41i6E/Bwn09N7YV4GUlOrspcoPkvqd4td6FvIYK6sKulZ60xZ7ajNnTsP69ruJHv85wbYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989010; c=relaxed/simple;
	bh=Efm1CheD5Sr0CJDLCiqeQBbOd25yK6LVZqSTXW5+puQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNnB6QgBsVsceOFmxtBftBXGMCPMDKMMs8koKgk82XEhY5v3wpdT7yFfShSPChQ+6b7JVHa12lUiBtAGMaatLQ4VxAxU+9k2x/YSmGq9Cqp2dR/tIIYQ6/d5YdKI/j5BBKWDHqTmEVVF2tNUg62rY2uoemTNUfv7E5bHU8+9gh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOpBFswF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29844c68068so1289015ad.2
        for <linux-watchdog@vger.kernel.org>; Wed, 12 Nov 2025 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762989008; x=1763593808; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SKn14yUaSOpFQ5q1VKUkNZZhTxOu8+zeLEC+aDosUU0=;
        b=HOpBFswFdtgwSetKEPiaHdZaIz4SA55sZdt48S2gQwkLaZu/5GGcpGwtCS+HFEqJ2i
         7u9QxkQaZaNbbuIRCDk/SIi8KAj/MPJYwBhk6RR+mCck+TQrwZuPjN+wgjUDWAEI6lAQ
         OzunWCHD98L6WrUZCfI+2tJrRnr5vKvERvu5RQ2ONOdiy4HwQQ6wYf5j/i5lnSAAcKEz
         SP6BIqME0GGDeV5pL/1pGs05+AkfqOEfw0VNNzcID6TAVmQYesxybm3UxZAHft9Mlhd9
         G6ikmpMH7M8aPKHjlWMMLPRFOlc++fBWv/Nc3kRkmUUgQSustfY9pzBK5Hohe4anmU30
         T9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989008; x=1763593808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKn14yUaSOpFQ5q1VKUkNZZhTxOu8+zeLEC+aDosUU0=;
        b=g7f+gG7UDf5C8If44cnbBoYVLiaoU6SOQuBhdPWy+S8QxVeFsBEqfaSM7HpygEbMNX
         PeTQMt5cl7PAcwXNKVsX0AYw13b24etvX34h//8tSw5ncTDWVPZf9+gbcVDKYIRCUeoI
         YmlDJGQikkKCpFkZFAT9BcfECu0/tgppGHiESKQspYLMbisqpQ+rJZP53usZLuZWsOQw
         K3SCMMnVc8JbvBm8q7ic/FMv2r3L6Ktua69Z+4AP/ts06Iy+K+SwwWda/wbT9BOhVuni
         FbpP81bR5xAZnE0A8TfMA6RaBdKs+4qUkEK4Ut5HDqx9S43u/Sa1kFL0NPHNKs7B/dql
         JV+g==
X-Gm-Message-State: AOJu0Yx5S0z0ywY1eAhg1f4+iXu14VDo2wMp4w5XifVMyFZYzAslcMI1
	plkwGGejjldg+T4CxqZl/S5pDjgIFKFAAcGS9JFQvSXF1ZvY3lXmn4K3
X-Gm-Gg: ASbGncseEimZT5TsNZ+nBXzWrSQGWdeMRb/PVBwd4BjIKaqlXp5sQ1Yu33LmTBgZ+pq
	jpx6NjfLobAHi/vr2k/z19wWIZO0/6uhTNfF1bt2FZCloxVnsDcWW/TY/9ky8ULH42qzhaClqO0
	l4aNlpejFE9rzkq6bO1CigZIbjkuPmQbYC2jU2jrirfmRkmk2GDDY3HIrd+jIWMTO5WmirQk6DJ
	WFlrs7HjkjlRvmx4mbFuIuS3ntON+d7b5+s6G1ZtStKd4xuN/YQ8bjz0iZOjUyuEMks4HTgvoxf
	DGmb89t74NKlzmATWb9PxF3ZivGod5HBDHs8mgM6iZ+uZJrGlBPoYuSViBjFYILNGgMixjh25qz
	4M/sxwL1BOzwfwAtKnRZZ9oqf88m7mweLc1672aYu6LWqg+DQiqYxdEz2tqj2233QzPa3qfZNBo
	3vBa3mGgCySLMzohinroL3ELnLlzuNVSxihawQBv5i0YGGyE+XtJThQB2Pwcc=
X-Google-Smtp-Source: AGHT+IF3xnlOL953sei3orlAtUZPvwAOvaEBc3a9cJEteHax75KTnh09/DLTzBtnhgm4zG8xQzZUlw==
X-Received: by 2002:a17:903:2281:b0:295:5b68:9967 with SMTP id d9443c01a7336-2984edd7529mr61864115ad.49.1762989007709;
        Wed, 12 Nov 2025 15:10:07 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm2596705ad.59.2025.11.12.15.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 15:10:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9bc04f8b-18db-42c2-aae7-232548e83bdb@roeck-us.net>
Date: Wed, 12 Nov 2025 15:10:06 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: wdat_wdt: Fix ACPI table leak on probe
 errors
To: Haotian Zhang <vulab@iscas.ac.cn>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251111032832.1985-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251111032832.1985-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/25 19:28, Haotian Zhang wrote:
> wdat_wdt_probe() calls acpi_get_table() to obtain the WDAT ACPI table but
> returns early on multiple error paths without calling acpi_put_table().
> This causes a permanent ACPI table memory leak if the driver probe fails.
> 
> Add a single cleanup path which calls acpi_put_table() and redirect all
> error returns to it, ensuring the ACPI table is always released.
> 
> Fixes: 058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

I just noticed that the subject line starts with "platform/x86:" instead of "watchdog:".

Why ?

Guenter


