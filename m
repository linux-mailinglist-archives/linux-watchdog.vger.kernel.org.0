Return-Path: <linux-watchdog+bounces-1444-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB882944DC1
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2024 16:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28304B22925
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2024 14:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACA3171658;
	Thu,  1 Aug 2024 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS1L0GoY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334E184534;
	Thu,  1 Aug 2024 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521805; cv=none; b=DjDoqAidbFFtHcoJ8rcuX4PUJb1rw6Q1TBkteDQ1cANYjfHzX2Dasc9mgRRmwRHl+JchEdryKLkP8SDrZIvfsHnmh4BSGod54GynJqjd572+ATjpvC2xanYqrwg3bmsrAj01AV9bvi8+UMY+atn4v0gPpC8fR9wJ+Ck7a5nThLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521805; c=relaxed/simple;
	bh=/dupWhpAP6cxdPHzZCN/DFOGIGI+w43PjLfN9l7Uwe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt9Vw9ob4aLxNeuSWk1Cy5rBQJ6+jxxLQAfbTVQ6bqH05DuuawK3AY/eWw9lqK9YIxsULaMXswXh4ElIJ7y7DgmyD3UQCp8rXvPRq0b59O4x5iBHnxPEN7uCoLcZHtVEJjgKcRcf98eMOKnrenlDzUhpPRG5NekrE7oaE/u5HVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS1L0GoY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc4fcbb131so61856065ad.3;
        Thu, 01 Aug 2024 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722521803; x=1723126603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0YOAZ4MEIwSMs3ZVqhSp3JzNSyETrbdw0jGKvXahsgI=;
        b=jS1L0GoYejfPwKQfv5fECTmlyjBnZybEL2DdJns1rqRAGROx0bnRDjE6pZoVyBdcFN
         m10De05hkJwwkdJUum2xl5EaNTubx4OQCU0ZTryy3f9MRbddHB/hqnzFL8p6B8qGHTGR
         pYPSksYvSHIiVQdJKGzpSu3xErfIrR64oHglEDU/AJH8m9sc7Eq9tgtcOz7q7dpEEcKH
         SMZTFIfT/rVd+4XT1YjNJiagR2EE38KfuITEePkrvhndBUSnYUZa0sFtaawuTqvZ+YkW
         KM1aPEz1vvop3seX4gr2oY9TZeNdg2hiXnWgdvVL3y0QO3+/eu0PudoXg8nx881QNkxW
         iARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722521803; x=1723126603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YOAZ4MEIwSMs3ZVqhSp3JzNSyETrbdw0jGKvXahsgI=;
        b=M4iZwBHBKIdER95qSdd+55jdk7vlrR6fsh/kZhtCbZWmYnY+FK6bZi1Qgt2PP8iJrM
         0ihA1QlQEIUjgJcgecwNuWceThgVrxbD9e9gcJAJZ5BKAO8Q1KRbdqJLjoKauPjCr055
         Jd4zV+srXd/qeOj92bEJ7gtZltoZkv5VnpiyQEgh8l63w8gLeDbLVxNH7HecirLK2OwR
         gBo3Q9QOHtVgiyT4peAoqxZ+K+98WKdwGc5xVN6kz5QJIlUtZBGp6s0SBzgDTppWVMho
         gcABnQvSgF8/gbgdrUXeB8VCzBxjN7Bz8Btwa+enXO4NrB+DKfmKJmF/YrlOH0lomuKw
         Gwxg==
X-Forwarded-Encrypted: i=1; AJvYcCX+JaSjLB/h16NJLzAsE2CXtv8NO7LMMCE4r5SMpkBts/i07oQ3Dbr2S/Ek4kk9jvpEz33dm3+InkQao9N3eeWMp0l5Ph69dVbHZlrYk52t6hTZfBStdKDFi1/O/oFotIhxQguCkgAGS8ZAKDg=
X-Gm-Message-State: AOJu0YyocmCL3kvVePIq7hlb3+QO8PRR5nQZIBBu0oO5yWE8xGs+U0mG
	y4yx11e0RW5XbvGIy7UkTSfLkvRC0PBBRHaW7e7fpf8Op1hHmDLY
X-Google-Smtp-Source: AGHT+IG+19HQ6LAfZQIafMZSXLZH9DW7qQdwJzX3Af//sEjh4IjSWNR2u9UD50qNDMNcvkZIcJkQKg==
X-Received: by 2002:a17:903:120c:b0:1fa:2e45:bcb8 with SMTP id d9443c01a7336-1ff5722dec9mr4839105ad.2.1722521802721;
        Thu, 01 Aug 2024 07:16:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d3947esm139772055ad.116.2024.08.01.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 07:16:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2936c3cc-acdc-4bbd-9dd8-871d5f04b841@roeck-us.net>
Date: Thu, 1 Aug 2024 07:16:38 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx_sc_wdt: Don't disable WDT in suspend
To: Jonas Blixt <jonas.blixt@actia.se>, wim@linux-watchdog.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: john.ernberg@actia.se, Anson Huang <anson.huang@nxp.com>
References: <20240801121845.1465765-1-jonas.blixt@actia.se>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240801121845.1465765-1-jonas.blixt@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/24 05:18, Jonas Blixt wrote:
> Parts of the suspend and resume chain is left unprotected if we disable
> the WDT here.
> 
>>From experiments we can see that the SCU disables and re-enables the WDT
> when we enter and leave suspend to ram. By not touching the WDT here we
> are protected by the WDT all the way to the SCU.
> 
> CC: Anson Huang <anson.huang@nxp.com>
> Fixes: 986857acbc9a ("watchdog: imx_sc: Add i.MX system controller watchdog support")
> Signed-off-by: Jonas Blixt <jonas.blixt@actia.se>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx_sc_wdt.c | 24 ------------------------
>   1 file changed, 24 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index e51fe1b78518..d73076b686d8 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -216,29 +216,6 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>   	return devm_watchdog_register_device(dev, wdog);
>   }
>   
> -static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
> -{
> -	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
> -
> -	if (watchdog_active(&imx_sc_wdd->wdd))
> -		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
> -{
> -	struct imx_sc_wdt_device *imx_sc_wdd = dev_get_drvdata(dev);
> -
> -	if (watchdog_active(&imx_sc_wdd->wdd))
> -		imx_sc_wdt_start(&imx_sc_wdd->wdd);
> -
> -	return 0;
> -}
> -
> -static SIMPLE_DEV_PM_OPS(imx_sc_wdt_pm_ops,
> -			 imx_sc_wdt_suspend, imx_sc_wdt_resume);
> -
>   static const struct of_device_id imx_sc_wdt_dt_ids[] = {
>   	{ .compatible = "fsl,imx-sc-wdt", },
>   	{ /* sentinel */ }
> @@ -250,7 +227,6 @@ static struct platform_driver imx_sc_wdt_driver = {
>   	.driver		= {
>   		.name	= "imx-sc-wdt",
>   		.of_match_table = imx_sc_wdt_dt_ids,
> -		.pm	= &imx_sc_wdt_pm_ops,
>   	},
>   };
>   module_platform_driver(imx_sc_wdt_driver);


