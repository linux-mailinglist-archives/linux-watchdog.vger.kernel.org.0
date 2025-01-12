Return-Path: <linux-watchdog+bounces-2668-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D599A0AA62
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Jan 2025 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 329BB7A2BE6
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Jan 2025 15:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD041B4238;
	Sun, 12 Jan 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUUra/Pw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF814A8B;
	Sun, 12 Jan 2025 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736695243; cv=none; b=nKUbPJ1NIl337rjaYtynaacDcFWsVvs3BsjvswIEsmJ8XYYZnUeovET9nkNOEKL6Qij59Lufq2yiWHViIAgSCIcnNIY1CWFKn/c6nMg4Qhs+C4tbSaJVmpZa1ZxODyg8vnvsIUTRZEf9jNEcd8hq50V5S1s7pO7dhkDBlSxT2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736695243; c=relaxed/simple;
	bh=0omT2aS7obkdInYq7cFntiBz7VmUXVTTzL3sE3Q9wag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gMv0C02pjKRIrWeZ19Qo4mIag7yMkdwaPAqRvcd1fnZgZRtH0YSBo9KTyrJudfLpJPmIFPiaTyx0rzBuyNqzE+EDSaXjvYkudpDhR3ssxZoaWea+ySaLolvUcNjZuAEAhHUYXy3FIgp5sZT895XfeZAEDUEycUDzUEfnCavqVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUUra/Pw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163b0c09afso60614985ad.0;
        Sun, 12 Jan 2025 07:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695241; x=1737300041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x3gG01/m+hJWTLZKxo2fthJ4fy1cfFaLbH+CW5D3uW8=;
        b=aUUra/Pwyz8Cb2nGmPYDQ/oHzl8B3sgQnZqHVWVTCAvzCy44ulGnAEQYy2Z/jMVWfM
         +GKe5DBEOPDoFFmt1plS9kEWODtTZ4U0G0EwoOBAdsIw/A7H7DpGO6FmkDd3pFJxBnt/
         o1koFZHYoHr+DU0SIYkfdaFcBXgqS2Jda4s0ksZyoCeplu3GvKmr4vVCamC6gBQWrpLE
         K2qIT2bRIK5qrGlKD5yEDK3MUrkWXLIHb+O3V6sjlEz+hQ2ELe4wsFyalS9svZAdA6XP
         cZExehPbbDlssSSIbSBjiCqsYNM30z8AxxCVlb9gKvQCUrTfe6qTwJcmSaqz67yVdVff
         Gkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695241; x=1737300041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3gG01/m+hJWTLZKxo2fthJ4fy1cfFaLbH+CW5D3uW8=;
        b=FrNyPPC5/e2tMEuMdaN40D65PyCPYT4sIISRUP4KuvTd+nvKqG9MOhfLdSZL0hyAsI
         aSrD3GaDOmK+tRK8iN69IHipOBTH8BNcZOKcDof0/ICs/k3KYCrXmF2ciWNBUoY2jhc1
         wLSBKBJ1uKoN5MVEZhKi5hXB/Cyp6YtBwJ3LCCRRklVLqAhFigfpUl4O9Z0pNzhrXNpH
         f8AKgGqBYBM5dCIQhHJCnPtvGbpFkznVKYhvvlW7J2yHifaOqrLxfxTfHU/tVu18s/Fk
         Dw2VEwKy4ncAXz2yJvGfgRExeL2r826QazyHeY/ieSREh4A+j8Zmr0e5VoTvKsi//mtx
         wL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUzFkcs7JTFQ11ACE9pnOTKS3GTv4CjYyfWBOxgSpQOT/w/uZIAyQhXta/k6XWCvsrcTPq7clYGQiec9iDGVh0=@vger.kernel.org, AJvYcCWS7nME3QnzloeymHzVEI2hL0xirijNNp89VnkL1eYTRj0Vxr32hVzjWpNG5WgVCDAHn0ccxbxxK94Hb+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcSIaoOKRH8FnMi6/SV+H0Z0qtr91VGhXPH17q39+3lEqemDE
	XbzeCmJfBNX2rISTfn6wAg/G/0Xk2uTqprhLFv5rs4X1JuOTlI81qbUqWw==
X-Gm-Gg: ASbGnctA9oVMCNIkJyVEL46DMDRMQfp2uZjnyYSk7PEw9kL7yM55BuKZiKNda9FvnYc
	AkW1DrX5WrBZdugymqXRModR6qVM6uvNDTk2UKRG1D1iXZeU6jtdQCRXHG+q+lynLAAX2iqa+5Q
	jAlGb9g2TiWr0YAGSGArujY1b4bK8ftLNdubi06WBqLo5own3OjDA5MOgsG1ThNbTIXVBjPDKiY
	HQPuS4UU1SlWqqA64xkAM58qVYmsmXp2dOQ+wtUJtQcypkk/YxvW6gxtQBIpIH9fnoKcxxyRjma
	HbHNUK0ivOJB/iwpeyu6MNwKRcz7Dg==
X-Google-Smtp-Source: AGHT+IF/FozhO9qZ95zF/Im7xp4vonQs2+URIZ8u5K1tRqaZZL12OaAezyRemQnpRDUXRoKN1pKXxw==
X-Received: by 2002:a05:6a20:12c6:b0:1db:ef68:e505 with SMTP id adf61e73a8af0-1e88d10e95amr29265607637.20.1736695241213;
        Sun, 12 Jan 2025 07:20:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a980esm4412502b3a.180.2025.01.12.07.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 07:20:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <42008fe4-8046-424c-9f12-e95a0471928d@roeck-us.net>
Date: Sun, 12 Jan 2025 07:20:38 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/1] watchdog: aspeed: Update bootstatus handling
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz,
 andrew@codeconstruct.com.au, wim@linux-watchdog.org, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, BMC-SW@aspeedtech.com,
 chnguyen@amperecomputing.com, aaron_lee@aspeedtech.com
References: <20250112081204.263216-1-chin-ting_kuo@aspeedtech.com>
 <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/25 00:12, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET => the system is reset by WDT SoC reset.
> Others          => other reset events, e.g., power on reset.
> 
> On ASPEED platform, the boot status is recorded in the SCU registers.
> - AST2400: Only a bit represents for any WDT reset.
> - AST2500/AST2600: The reset triggered by different WDT controllers
>                     can be distinguished by different SCU bits.
> 
> Besides, on AST2400 and AST2500, since alternating boot event is
> triggered by WDT SoC reset, it is classified as WDIOF_CARDRESET.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


