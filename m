Return-Path: <linux-watchdog+bounces-3547-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DADEABE324
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 20:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344421BC0E4E
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 18:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE3D252297;
	Tue, 20 May 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKjTwWZW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EFD1BD9F0;
	Tue, 20 May 2025 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766897; cv=none; b=dYb3A6YyuFZUVJCSMld6NaWVZh1LYGnZR0KqN+3XSRJ2o9bt7AtQ7l3gfNO7IGFwWy+DkYLlle5cD0ow8EMShf7jq/FCafI+Zp5LtIBtIUjZ0g2RkGwcSIAjrks1pHCiFh85ccJSv/q/CBL1ZAiBb599RSObl0LH0t2Jenc4DeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766897; c=relaxed/simple;
	bh=CgPjo0iN42ntlFApY89YjhNLWEByIoKYEa6FJ60IKiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoZ2FHmcgeA1fuNw944XHpvB9l2+DQePtfuGJcF9YpvQBecD5EEWrypx1+pj6nZf9JNjM0cBwjyqXrJXGShTn1qt5tVp8E3aj4QczH79xhyXHdeF2hxNOUDwhxhAgAJ3SJqV3ytCEjhkL3OiLX61ND4uFcVfBZAqVD/wvPQxgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKjTwWZW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73c17c770a7so6434707b3a.2;
        Tue, 20 May 2025 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747766893; x=1748371693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NEGW8OYP6vqNIYspfG7hwW+otQHfZSlN8GWZjQQt5E8=;
        b=DKjTwWZW9d4rQY9uwBAcN3x9mJ43WSJNkR/NUd4Cff2vFVgK4dzNRvhvXwmGrM1O4s
         ca2ucs1xWsr/X0LRmDFN/M4mmk7T+6s35XoH6ZyMwmrQU7dEWAwLgOuG6gKb25AT3+4c
         32sDLzwgHtGWvUer5IY5KCqnbZAD9uZrmTAr+Zjyhl/eB1X76A+HSLLW01dEh2Z8RdUG
         qhjrFTmgG05R66h5QVXgiX1czuzBDXY/UOlLNKmIdJonAqa+ZXqXAbD85dCzpY/dCoEl
         u+1zgC3k+LBQ2RbuyFUcZyWjgV1auZ6s9sNC4pIDmlS0DKoe1WGq8IyOCgxSRWRv0l6i
         i8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747766893; x=1748371693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEGW8OYP6vqNIYspfG7hwW+otQHfZSlN8GWZjQQt5E8=;
        b=hkJ6FaLts9nmuRusOhP6vYol6BcHHNqECcMq572jmpgl5pvg64GdWRFgdc02IXXaRh
         FCf4N9XBqHXR4AC8CbFVwEMI0WdixTHF3/HFjDGQZ2jJMUOEOYG7b1N91IsQUT6zqhp7
         e2Qw4duy3gxRl6ixy4YLgJq07n8owN0AgBHmUyp7Zg8kJFu/f3nPelzb4i3ILKCVdc4a
         FhRyP1yIww5Wt4fHlx2F9C6rrjzIIQXoq8X73kjVrY6ythgM7MKM733poqHAdtrc2+/9
         4VyUR91OSY9VWRt213FJ3oHDhet2O3tt+o2gOeILVsgjCIzy7YuDEIDxSwGrmjbA0Tfp
         okPw==
X-Forwarded-Encrypted: i=1; AJvYcCUEMqsCnki1oSTqFiE9MsMMGgHAKSmSHs7H5suD89g+UB6MeF82ft1biUxx3yxFmpvWGxdzfr9XQBcgR9HVhaE=@vger.kernel.org, AJvYcCUlskiuRDYxskbTWHsx2IjFNx7U7KYcjRo/b+CIQfKkAnUlzyMuVRx2bMc/u4eIWCQTz7LB/P/LXqiT0hE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQxd+O8gNRkp81alos2JS8g4w76dfknsU6Zt+7DJPrjflcOjaz
	7qfv3GYYPFG3jG7Pns4twTZr3xKf1CA8Q3I76xo9oQbh0SbbxTbn17bd
X-Gm-Gg: ASbGncszG3Dt943BamlD7iQY/Rt2UU5nFtEIsCg0XPKerZYRihEPljr7aPSzTxKJYN8
	Dv+Xh5YzE2Z9ok/yTALZdEszLdZshopttjndcM1NUrB+bVd4ptj6iXEUYb0W58ut3xQ1q3AFoxU
	BxZ2OwB7epTAKyOciJvS7peIJ4pXz9Uo0OxH9DP1XTHz292ivUYRPUTZ+TKzMMab1ehZbSggDmo
	rFLZuiXFl2qAqQd9U6h8ln3Wk9x++K+Q2huyEAX45/gf/dhNXLjMyNjUNP/JrMye2CvbF7j8ynp
	kTw+N2wY9p6vYQIjuozVKTynEWwuoT3ho80uRr8xOf9zHRJboMBbl7JT1dUpdLdf0uxYQ9wTdqF
	VeYEThgB0CetZ/Zbb6K9UDA+m
X-Google-Smtp-Source: AGHT+IFWWb7cBfTk9OMRuDtWVVYPpXEqxfFx0itPACSefZ+pOiztCqmjtWe0mkzSLDRwWK1il9criQ==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-217ff4bcc70mr19982865637.39.1747766893374;
        Tue, 20 May 2025 11:48:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982ba69sm8544242b3a.91.2025.05.20.11.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 11:48:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c45c7b81-9952-43e2-91a8-e92d0860fa5e@roeck-us.net>
Date: Tue, 20 May 2025 11:48:11 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: arm_smc_wdt: get wdt status through
 SMCWD_GET_TIMELEFT
To: Antonio Borneo <antonio.borneo@foss.st.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <20250520085952.210723-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250520085952.210723-1-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 01:59, Antonio Borneo wrote:
> The optional SMCWD_GET_TIMELEFT command can be used to detect if
> the watchdog has already been started.
> See the implementation in OP-TEE secure OS [1].
> 
> At probe time, check if the watchdog is already started and then
> set WDOG_HW_RUNNING in the watchdog status. This will cause the
> watchdog framework to ping the watchdog until a userspace watchdog
> daemon takes over the control.
> 
> Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/arm_smc_wdt.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005fb..bbba23ace7b85 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -46,6 +46,8 @@ static int smcwd_call(struct watchdog_device *wdd, enum smcwd_call call,
>   		return -ENODEV;
>   	if (res->a0 == PSCI_RET_INVALID_PARAMS)
>   		return -EINVAL;
> +	if (res->a0 == PSCI_RET_DISABLED)
> +		return -ENODATA;
>   	if (res->a0 != PSCI_RET_SUCCESS)
>   		return -EIO;
>   	return 0;
> @@ -131,10 +133,19 @@ static int smcwd_probe(struct platform_device *pdev)
>   
>   	wdd->info = &smcwd_info;
>   	/* get_timeleft is optional */
> -	if (smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL))
> -		wdd->ops = &smcwd_ops;
> -	else
> +	err = smcwd_call(wdd, SMCWD_GET_TIMELEFT, 0, NULL);
> +	switch (err) {
> +	case 0:
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		fallthrough;
> +	case -ENODATA:
>   		wdd->ops = &smcwd_timeleft_ops;
> +		break;
> +	default:
> +		wdd->ops = &smcwd_ops;
> +		break;
> +	}
> +
>   	wdd->timeout = res.a2;
>   	wdd->max_timeout = res.a2;
>   	wdd->min_timeout = res.a1;
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21


