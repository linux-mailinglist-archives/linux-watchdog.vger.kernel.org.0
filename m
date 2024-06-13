Return-Path: <linux-watchdog+bounces-1118-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FD1907CF9
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 21:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E12C1B28CEC
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2024 19:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5578577109;
	Thu, 13 Jun 2024 19:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3gMtLGh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DA36F073;
	Thu, 13 Jun 2024 19:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308444; cv=none; b=d71SOHGSC9xNQIStpP+2ALFjb+ZymEyrY1Sx3m8fr5S3qDiX3O7R9Y2P1bOK6WgiCO26offucv7JVW6I+I22DQaMVhDNbqHediI+PlNVLkL8LIyJg2PPD2xUO8a0cizR00pqoxpkvwFHRhjsf+yzMckWmw6kHv0ehp/pvc+ilQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308444; c=relaxed/simple;
	bh=y57DgvjNKksF1qkYxh9gCS3pSuxSTikP4EqozuUcEYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDyroOY1yiH/cAQCEbig16iXLVbTa+nR/nUv4kIaPkphqt4ieCP84EVmDPyUyZd/KErcq9Ye2CX1w5bDRGZ5WrPdKbAIBR4ATWIs7BTmVrmLG0cJtZRnDk8d9SMHMKeUCTmzkYp+l+vsKQ7Y49YKb864+3g572ggnmadvQXagJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3gMtLGh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c2c6277ef3so1215184a91.3;
        Thu, 13 Jun 2024 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308442; x=1718913242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mX2Kw+fvOVtb6d7HSW/w6aDQhkizPHvvgT8e+Li/jWI=;
        b=J3gMtLGhDvkZxanhWBTRSgMCaY8AX39mqCyfetxOmiWfjQZELB/flJRDgRwHyZss+j
         4C5RXtL6w8Glm/RG8ygANi6rYf5zz759j1jZzLchIPxa6GViyys4xSluHHdlSOzN68yt
         r3AwUwrP0piAtH2hntyRFeSYmdqWwrA5SRyxd4FABEUHfLInMaRBFG+K44RnKdwqYx0/
         yUdCLHyf+fK+h0HviLaoIJEKG8D6E4rDeHUUDkFk/+7gEbV6MYWH+feXqvT33s2dh9L9
         91RBk0IPqqe4mVOk7qhgohhqwdFep4IXd2vozweUSZ0aYeVZUGLfsYnhXhM5K0JoleMB
         7DHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308442; x=1718913242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mX2Kw+fvOVtb6d7HSW/w6aDQhkizPHvvgT8e+Li/jWI=;
        b=KxZhBB7nxVmD25tbKd8Qec690Tmfp09LejhxW/bKdDxWDH+hI/ZfajiDEmM5un++YL
         KY8NymITTIEGl7IrNgStK93sjtmgiSz9yr7Lj8nXtZMeFBoqARjx3hM78HuaMXADHITP
         tIyvth0qrY5eBxoeGHBC0Y2vVMYRm9V/738CbpFa7IobNA80ArRdxZvGc2Xslu2eH2ix
         vmNmThYN/wXqdVu/54ClJPHvhDdKadJSvm4okqhEyiAl1cv1dCObgaqDsM9GNZmpUPuo
         yEVwvTk1WQE8wKUvel+XKJWbNuIxdFU49CWIHoFK6DxQGIN7ys+urdmWBLB4BHWFaE/w
         EIaA==
X-Forwarded-Encrypted: i=1; AJvYcCXM7/kpQiB3S0pbVOHa3p7TblQ+3HspNrZXCjmNZerFxBzerC8AXj8OkT3NNJoZStg7BCFxGPXul/qCppIE+Xp3V/vSs22l/ACipCQH
X-Gm-Message-State: AOJu0YwOfE6BKsLKSS5Xf+7QzS7ejuQDjcl/++GXqpWbxU9yOcGV6xxk
	n5QVU5KdeWNGZLMmAtlB0yCvR9+btuLL6Murw7L4jLF7rvRFlYcH
X-Google-Smtp-Source: AGHT+IFknxVtzX7P1/Q2yNYsZaF3u1Hhf9/qsKOUqSbElm/4f4LmPKkPWked/Jv8/zxo2OGni3M9Cw==
X-Received: by 2002:a17:90a:5883:b0:2c2:7dd5:eb3c with SMTP id 98e67ed59e1d1-2c4dc0288c4mr702512a91.44.1718308441606;
        Thu, 13 Jun 2024 12:54:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75cdec7sm4462856a91.3.2024.06.13.12.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 12:54:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <41a40700-ae78-42d9-8eab-72e0f1197792@roeck-us.net>
Date: Thu, 13 Jun 2024 12:53:59 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: kempld: use pretimeout member of
 watchdog_device struct
To: Thomas Richard <thomas.richard@bootlin.com>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.brunner@kontron.com, thomas.petazzoni@bootlin.com
References: <20240613164157.457693-1-thomas.richard@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240613164157.457693-1-thomas.richard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/24 09:41, Thomas Richard wrote:
> Th driver was written whereas pretimeout wasn't supported by the watchdog
> core. So the pretimeout was stored in the driver data.
> 
> Now the core has pretimeout support, so use it.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>   drivers/watchdog/kempld_wdt.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/kempld_wdt.c b/drivers/watchdog/kempld_wdt.c
> index e6c7a2906680..ebb873502203 100644
> --- a/drivers/watchdog/kempld_wdt.c
> +++ b/drivers/watchdog/kempld_wdt.c
> @@ -73,7 +73,6 @@ struct kempld_wdt_stage {
>   struct kempld_wdt_data {
>   	struct kempld_device_data	*pld;
>   	struct watchdog_device		wdd;
> -	unsigned int			pretimeout;
>   	struct kempld_wdt_stage		stage[KEMPLD_WDT_MAX_STAGES];
>   	u8				pm_status_store;
>   };
> @@ -205,8 +204,8 @@ static int kempld_wdt_set_timeout(struct watchdog_device *wdd,
>   	timeout_stage = &wdt_data->stage[STAGE_TIMEOUT];
>   	pretimeout_stage = &wdt_data->stage[STAGE_PRETIMEOUT];
>   
> -	if (pretimeout_stage->mask && wdt_data->pretimeout > 0)
> -		timeout = wdt_data->pretimeout;
> +	if (pretimeout_stage->mask && wdd->pretimeout > 0)
> +		timeout = wdd->pretimeout;
>   
>   	ret = kempld_wdt_set_stage_action(wdt_data, timeout_stage,
>   						ACTION_RESET);
> @@ -249,13 +248,14 @@ static int kempld_wdt_set_pretimeout(struct watchdog_device *wdd,
>   	if (ret)
>   		return ret;
>   
> -	wdt_data->pretimeout = pretimeout;
> +	wdd->pretimeout = pretimeout;
>   	return 0;
>   }
>   
>   static void kempld_wdt_update_timeouts(struct kempld_wdt_data *wdt_data)
>   {
>   	struct kempld_device_data *pld = wdt_data->pld;
> +	struct watchdog_device *wdd = &wdt_data->wdd;
>   	struct kempld_wdt_stage *pretimeout_stage;
>   	struct kempld_wdt_stage *timeout_stage;
>   	unsigned int pretimeout, timeout;
> @@ -269,11 +269,11 @@ static void kempld_wdt_update_timeouts(struct kempld_wdt_data *wdt_data)
>   	kempld_release_mutex(pld);
>   
>   	if (pretimeout)
> -		wdt_data->pretimeout = timeout;
> +		wdd->pretimeout = timeout;
>   	else
> -		wdt_data->pretimeout = 0;
> +		wdd->pretimeout = 0;
>   
> -	wdt_data->wdd.timeout = pretimeout + timeout;
> +	wdd->timeout = pretimeout + timeout;
>   }
>   
>   static int kempld_wdt_start(struct watchdog_device *wdd)
> @@ -336,7 +336,6 @@ static int kempld_wdt_keepalive(struct watchdog_device *wdd)
>   static long kempld_wdt_ioctl(struct watchdog_device *wdd, unsigned int cmd,
>   				unsigned long arg)
>   {
> -	struct kempld_wdt_data *wdt_data = watchdog_get_drvdata(wdd);
>   	void __user *argp = (void __user *)arg;
>   	int ret = -ENOIOCTLCMD;
>   	int __user *p = argp;
> @@ -352,7 +351,7 @@ static long kempld_wdt_ioctl(struct watchdog_device *wdd, unsigned int cmd,
>   		ret = kempld_wdt_keepalive(wdd);
>   		break;
>   	case WDIOC_GETPRETIMEOUT:
> -		ret = put_user(wdt_data->pretimeout, (int __user *)arg);
> +		ret = put_user(wdd->pretimeout, (int __user *)arg);
>   		break;
>   	}
>   

Sorry, but this patch doesn't make sense to me unless the conversion
is complete. If the private ioctl functions are still necessary,
using the pretimeout variable from the watchdog core does not really
add any value. It just makes the code even more difficult to understand,
and sets a bad precedent.

Guenter


