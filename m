Return-Path: <linux-watchdog+bounces-1566-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA98962C5B
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 17:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFD641C23CA8
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2024 15:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A06813D24E;
	Wed, 28 Aug 2024 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iil0N9FJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0C189511
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Aug 2024 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858983; cv=none; b=hLW1QyiWNfPFrdH9yp8jZARhXt0r6V0LSwNnICsckCpUbzr3CRsZ/cQhr+33kiLDxHck4GI8FZ20XxdrB+RqyPcSdNoK554RAzFAXe8ktr46hSdnv1MolPrB6SlhOEPWVdujPCNrDdNtYAaK4dTsJmaBtGVjl34ZEYU7AJMlLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858983; c=relaxed/simple;
	bh=5cbjBcThZcBg9rHN6TpOjC/XRkGMHqeHROVpYa+prTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSPlliBIOnnj5kMKbR1AULA5ytMA2IjVcYgJIWRzwlJKPDleRV48AXIAbqYXD1JFtdtSx2G5p9okCTdxiTxlI6K1BYn9u9kpC2gfoFTAeVpc8nzYlJyOMntgK7bCbvykIlL5JgiyDWMCGlfG0vwB4AgpvA//4F5pX/1Y6vlGXds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iil0N9FJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-201f7fb09f6so59690415ad.2
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Aug 2024 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724858980; x=1725463780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AIIgBKe3HOzPgBtIf9LqPaFCWB7vokHU2+MyCpmiQ88=;
        b=iil0N9FJQSiFpdlC0NUAsxJjFLLCm2qf4R4zDkor4P2PFe+2vzzphukJ/80nwViVN9
         YNGwTtWPx0596HebzJ+SDrCSReRPVMHPsTGQtlrXXeD9CDD9wx62WIzHk+zN7YTUsK1H
         uYSItbdj+HS7p9tYDdqdBieh+nXcmXopjuh5d5RH1eHR3+rouL9GeFgBgmVQ6DA5Z9bn
         HY7LWaLGMGjDaNJWOrdiT+LxcVsgoh/WUpxDyPGorrNaFU8US5ZFh0EaSZuoUHbh/1M4
         7h+AG8T3rnwvGxEE2qi0PRBztLwGfWB7oAXP2jX0hlE46BcjQL3m+q8+SNRMuVXXX9AB
         y/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724858980; x=1725463780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIIgBKe3HOzPgBtIf9LqPaFCWB7vokHU2+MyCpmiQ88=;
        b=awLkMvRPRzq2/+hq30MtEn7TZa5xN7Vze3cRmwKpdLTsjsJdyefvaLebMT/4HeIMAW
         Kf2NhVWSYb0LIYbCQnU2hjI7y24rjstNvzd6cnYbtKH7nHCEdu0lHoTzTiUSBZYZhatY
         M5roNGGc3wlTWRTJmvYrXq4R1P1+lOYlCODVy1MGj+XahGPMV05vVm9+vkoho5nId3H8
         fi4df1KLicUkArErqtTKYHzDsIWpmWYq1yzELT3qEzOwS3TYGIsL/Hd35Z2hS0Q8B54E
         RT4oXEzPJWodMsqdF0EWDGHw+e6JoYQUMEq5V/Bd3zn4AMjfE7xMrnz1bItPQi3b83E1
         98Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUe+9Y2LvNs+KmN3Ei5euUJh11/Ar7IROTCY95rLglqwg4c3F3hU4vUlaHyRPUGYdSkBR8UlS/L9r7C02seZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXZxVBZaH69qTdgVvN2a51HFRmw58Cs753E/bts3+GCTt1Bqob
	5z9ygMj4kz2HAXjmV1jUN+rcRqcpESCAD7hmGARIkFlkozwaFnDQ
X-Google-Smtp-Source: AGHT+IGtGJ+aStwmAclRmhN3/rogj6yt1islGZkrpUh2ipd/IalwfWXHheU48RqzcVbHW7tlAtoL2g==
X-Received: by 2002:a17:902:e745:b0:201:f568:b8fd with SMTP id d9443c01a7336-2039e50c509mr153168515ad.42.1724858980380;
        Wed, 28 Aug 2024 08:29:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385ae7b1bsm99680735ad.262.2024.08.28.08.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 08:29:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba517016-eb43-4e61-ba04-69a0e4ce8ab1@roeck-us.net>
Date: Wed, 28 Aug 2024 08:29:38 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx_sc_wdt: detect if already running
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
References: <20240828060212.108608-1-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240828060212.108608-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/24 23:02, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Firmware (SC) WDT can be already enabled in U-Boot. Detect this case and
> make CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED functional by setting
> WDOG_HW_RUNNING.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/watchdog/imx_sc_wdt.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index e51fe1b78518..e6d567b11795 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -56,6 +56,25 @@ static int imx_sc_wdt_ping(struct watchdog_device *wdog)
>   	return 0;
>   }
>   
> +static bool imx_sc_wdt_is_running(void)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
> +		      0, 0, 0, 0, 0, 0, &res);
> +
> +	/* Already enabled (SC_TIMER_ERR_BUSY)? */
> +	if (res.a0 == SC_TIMER_ERR_BUSY)
> +		return true;
> +
> +	/* Undo only if that was us who has (successfully) enabled the WDT */
> +	if (!res.a0)
> +		arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_STOP_WDOG,
> +			      0, 0, 0, 0, 0, 0, &res);
> +
> +	return false;
> +}
> +
>   static int imx_sc_wdt_start(struct watchdog_device *wdog)
>   {
>   	struct arm_smccc_res res;
> @@ -183,6 +202,9 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	if (imx_sc_wdt_is_running())
> +		set_bit(WDOG_HW_RUNNING, &wdog->status);
> +
>   	watchdog_stop_on_reboot(wdog);
>   	watchdog_stop_on_unregister(wdog);
>   


