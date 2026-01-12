Return-Path: <linux-watchdog+bounces-4801-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E085BD14C77
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 19:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84A9F30060F9
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Jan 2026 18:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE373090E0;
	Mon, 12 Jan 2026 18:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGp7ENy7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2415C2DCBF7
	for <linux-watchdog@vger.kernel.org>; Mon, 12 Jan 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242703; cv=none; b=edRgbr2VTMny2KDANfCSJA8h+IbEYm+Grgg4WsUb6gAs+j6NSm0tyb+Qad8koDOF5rVDgO/n0qLs1I2Wz49mex/esnblnoGZAPra40DmIguy/ebYRltdD7ntI79yGxZOLAA79tHVI2EnsxkSlsqyosn49856rbnujgghPYegN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242703; c=relaxed/simple;
	bh=q3Eh1eOk0KY9COaWecDtDBcWzeZGOrEQL+B+wKxicj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJ3FdIf11hVwrkDXkQ+rSsxYqM5Q+REPfWfstdS3gKPQIOYV1QJjdaEqxqlkxktF9WHbkLe8Du3rJ6+bh8WI/rvfVcgrKA67CM/DoHIb+tcUXvarqebbtDYP2y7CBJarRD4+7Oa2jnzfT0n/w+lmFvCLJewDjARzELHHAAcI7rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGp7ENy7; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ae5af476e1so2677405eec.1
        for <linux-watchdog@vger.kernel.org>; Mon, 12 Jan 2026 10:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242701; x=1768847501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mV4AojHvRyhYno3Akkk2iFwkIjDptGliuZ7lzw/dL3k=;
        b=UGp7ENy7bsVQR8V8o3za8uOWLOE3HqfW4ceVop55O/z1UBRpFS0D4iX6LmRQYbO19o
         dOB0MElFKcG3eizbzlS2+96JuRSe8SOKWg8xm+dNirGL8A4GBvrqTqhrrX39yrsSq0xA
         Vgfg4vPcM+qvn9qO6txvlHqD9A5MT+BrGIJZMPP1Ryknu7F87UzCUkYkEqIrhE6jgtW3
         KvMvMMWlH4LW49uBp120vsNVq5bTkl/aQvkvXQuypcS7IvWtFiu2dcE1E7qGIfHKeMQx
         rCtkMmKq/mWlTj2YCw3EOJJLr/lIo52Kua6wUPZj5Y2f9n78zp6SY42aZW8gCBVhseec
         8/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242701; x=1768847501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mV4AojHvRyhYno3Akkk2iFwkIjDptGliuZ7lzw/dL3k=;
        b=sIH4OEjH2D7a8OHHGhAXI1UHW5ucwGDCLhvhDYfOwrA3z6uU2SdT8QUGzGEyWrbnEL
         etXqHZtLH+7FUr58lh5YsJQoiHlswcYShyXvyXu+/HnH2pMxCpkFw/2z57HfT74wji77
         mhnDd1kPNsGY5YFJ7g8A24EqsTatGlyM7UTHWTpCm66mLsQDBei+MAFyCfcx2dt7J7pX
         +bEaJHWqZhMsyU/N8bB5q9ix/FLOv3b5qRNvVW55l2v1hwI6rAAlxB+OaCxR5ELJwXbm
         u2HH79tpcQWjCa79xjEebN5AnFCTFcWUbyEIgDT+jv8AHZ7N50+NGbDF4pVZrnjmyHnl
         K0xg==
X-Gm-Message-State: AOJu0Yx8UPnxRE1Le+lzQrZE+2/fuqDVgPVSauyTUciR94Lu9AQ6JiNr
	atC9fWOnmhPDBJULOt4ESA2qvMVgvRsgJ5ovGoiOqVHwEpv2flNVd7vX
X-Gm-Gg: AY/fxX4ljScltKTWE/AaxG9zDtFMMykQMPwC4Ti0HeNNaDmHOE8BIQud2DXP6qv0ENJ
	mcUvJom0z43ioqPiHd7sGtKTbTPS6fHowetv1C/RLeVWpbLc4JC8tlHZlo5Y2sO/T0r26frk9Xc
	z6nsqwcu0iIar1AbWHLGkU0HXlke6Efknti75RHgov4JxQ2RX4QJISdcExmtpj3FRkXzHoKrfVo
	Rq3t678MOwmtPNECpFPrfe1K9sFUFIeypYGmBjLaT6825yveTPKWQCqqhlrHAraufc1z77W+vCd
	QXFsUnu6SCiIPmByHie8nM6rt796guPrLdwyIyDAV2h63h3InYtb1MGHiEuXB7otgWf2BDl571n
	Q2OhmHZxian6hM+syOnR8p6qTirIFlvUwhLZE+QUT45YRrzY6CpPbj2FJajhaNzgI/+dWduZnqz
	A0o9fBIQT/e1x9nG/g+b2Y0Hdm1AgTu6l2ju/yVNHCoW2mv1Rub8U5D+ZcD+kNci/3UibP5GE=
X-Google-Smtp-Source: AGHT+IGoabbmVtHntJRf0P9vIMvdCUpQSdMtCmrGN8qBz6n/dmXqJqmfbMu4VAow/Rb6YJ5HYthgYQ==
X-Received: by 2002:a05:7300:1912:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b44f49d28amr212062eec.14.1768242701114;
        Mon, 12 Jan 2026 10:31:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707da231sm17895409eec.34.2026.01.12.10.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 10:31:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3bcf4710-9b4b-4e08-83c0-64659ee8d36c@roeck-us.net>
Date: Mon, 12 Jan 2026 10:31:39 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: starfive-wdt: Fix PM reference leak in probe
 error path
To: Kery Qi <qikeyu2017@gmail.com>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org
References: <20260111172914.2191-2-qikeyu2017@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260111172914.2191-2-qikeyu2017@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/26 09:29, Kery Qi wrote:
> The PM reference count is not expected to be incremented on return in
> functions starfive_wdt_probe.
> 
> However, pm_runtime_get_sync will increment pm usage counter
> even failed. Forgetting to putting operation will result in a
> reference leak here.
> 
> Replace it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/starfive-wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
> index ed71d3960a0f..af55adc4a3c6 100644
> --- a/drivers/watchdog/starfive-wdt.c
> +++ b/drivers/watchdog/starfive-wdt.c
> @@ -446,7 +446,7 @@ static int starfive_wdt_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, wdt);
>   	pm_runtime_enable(&pdev->dev);
>   	if (pm_runtime_enabled(&pdev->dev)) {
> -		ret = pm_runtime_get_sync(&pdev->dev);
> +		ret = pm_runtime_resume_and_get(&pdev->dev);
>   		if (ret < 0)
>   			return ret;
>   	} else {


