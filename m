Return-Path: <linux-watchdog+bounces-2561-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F249EE820
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 14:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC961887FFB
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2024 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A632135B8;
	Thu, 12 Dec 2024 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNkTVbrV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41005748D;
	Thu, 12 Dec 2024 13:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734011833; cv=none; b=jCriXQa3thBQskSD6CwrIlic6Wgap8f1iZadGbyi6UAYxZgV+df7bDquu04ngxxvt5xO+409Y0sGeEU6DN/ZwD37uHEqFviievvZOX68PFqzTR5Z1e67Rtf1n1jGO3IdQVEGj1d6NReNYQ04leU5X1cT3T+pN5cyXE2l+QNM3DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734011833; c=relaxed/simple;
	bh=m8t1n2mpPCYXVNNwxexnBNkY2zrrY1ttJsg7+eoSYqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSoTeTSw82oFRsqg8VTnGcPvpYSjV10+lyVCyrSTkUweULSB6uzzxax0NYhS4yoxpHfn1lDV68yyr0Kzj4pUMuToCYUXkKLmM/oHkykfF50crsJ71vuhhC7ksJSNhHcQAyUU+td6DydJjgqIv+e3gOELPytcwta21QeIxeAYAMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNkTVbrV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2156e078563so4817855ad.2;
        Thu, 12 Dec 2024 05:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734011831; x=1734616631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
        b=nNkTVbrVqGgu1f83EXYMf7VKELzjN+1cXjBJhwW7T5clI1AmWTXoURwwQoPNUNEY8l
         sZ5Rj6rEoBT7ZyQWWmcz2ANTFwB2K5vYQtaFcI+P4zgl2eCUWz+5ZQFAO7Sqw75w0M44
         BYPOlpauajB4pVs6vm/jRMsdSi1n7WHQzolHWQVIMwLiMhcsdWU+FfwX8TjsP8LvdrRl
         mbsR1cQClry3cvznvz8pnpwI+vagnRBze3G9zsYtXVTaJUOrckMmO5qAGq8dLAGZ7In+
         gcAUi0xTBFUTESrv/+z2o7JhOLfB3mVkkG06FPog+cTM+yczePMkdBTD0V+bJ5sa7J/9
         d6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734011831; x=1734616631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
        b=XXN06nGSp0OMHx7nRXQyN3D4rpWKA1j1MSfCqL0n8xAJ0VePnAJRubNEL751L49fiQ
         Z0R0l/TRxWp04k0A/FKc8yj7PdSK1ltm9yRhpH8OwZZO/RN4RhEZ4GmDZVbu8dzAcH2D
         F+M7BsEEDziX6dhYQeJ0+hciTE36EMXplTsMdvxlpw97kjdumKOeWSZmjfuTQdb85a+F
         u66ZQNTKVPU6qWogGdFBDsp5UrzBScNK5dKvlYq3N8XfLok4jjTyJLl0MUpxOlguoczV
         4rOEzVyU/1UoF1eHbXzpL7qYf8iX7CX57+uAW8pOefiHBw357iMIGApWKHK1lXwp21J6
         x7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4cI3al9E8GOf8fDyjVQ5InG0BzJ9DHivV3Rd9+1WYZf3yZ2yvhO7tcceuLReH6Y1gdrZAWveC4OF2gTIJgK8=@vger.kernel.org, AJvYcCXKpzZUaiKt3XQGwP/iBSKt8h6P+p6LddGTNRIlZQ9ovilDcqzm5bwocBLTVTqYuKSnNUbrhKi88lR2zrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpqeB1d7hsoLq+Dpe/JROBEDyvABQ6jHr1N/DO31ceW/yCGhW
	STTiW+sAXspXr9+TWOklxb3kUKk4ZUewuF37uId/f5Z93wIn7xGe
X-Gm-Gg: ASbGncvG0w1UlCatvFaruDKafdU/Nrr3O8t81SW2IeAXZKpAPurJ+yqnRdkAAGQkxnr
	ajas0OidYbPYiHFcwcYk/p0XRAEvkP5Wf80T4bU7oQlfW0Y+a785+HxGZUiJu+LVVX4P1wFsMKS
	yEVFF2mZqppMo1HRbEVHyAXu3bTwS/boMpJokhw35XoY2IFz7ofa5wkA7VDXbp1H54LJpEiwA7t
	qO72cERvPdzKiCj2bsxmdqpdu/+ylN9NLJGKOKTUSUl5p2uc1D8xY3DbjhXhWRHcPpkLYOFBEJs
	pE9PtecFMbIR7Rxlspcrm63lURR22Q==
X-Google-Smtp-Source: AGHT+IEo4mBbMhtkdB3hzbmQugEtnQdEpzVLfEDXMQUSzX33prBh8SEVLIh/6dA+93tI1uPs3+SUpA==
X-Received: by 2002:a17:90b:3b49:b0:2ee:5bc9:75b5 with SMTP id 98e67ed59e1d1-2f13925b22dmr5825418a91.4.1734011831408;
        Thu, 12 Dec 2024 05:57:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142de33basm1274609a91.23.2024.12.12.05.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 05:57:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <194f1c3a-2333-4a33-b459-d50f02e1b98c@roeck-us.net>
Date: Thu, 12 Dec 2024 05:57:09 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: stm32_iwdg: fix error message during driver
 probe
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/12/24 02:20, Clément Le Goffic wrote:
> The commit 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> introduces the support for the pre-timeout interrupt.
> 
> The support for this interrupt is optional but the driver uses the
> platform_get_irq() wich produces an error message during the driver
> probe if we don't have any `interrupts` property in the DT.
> 
> Use the platform_get_irq_optional() API to get rid of the error message
> as this property is optional.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2: Change the commit message because it only prints an error
> message and dont break the DT backward compatibility.
> 
> drivers/watchdog/stm32_iwdg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index d700e0d49bb95..8ad06b54c5adc 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -286,7 +286,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>   	if (!wdt->data->has_early_wakeup)
>   		return 0;
> 
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>   	if (irq <= 0)
>   		return 0;
> 
> 
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> --
> 2.34.1
> 
> 


