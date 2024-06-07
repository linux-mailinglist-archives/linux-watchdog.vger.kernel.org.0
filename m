Return-Path: <linux-watchdog+bounces-1113-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C3900DF3
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Jun 2024 00:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38EA61C20B58
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 22:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C8E155315;
	Fri,  7 Jun 2024 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuVHyYTp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146046558;
	Fri,  7 Jun 2024 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798559; cv=none; b=Prly/R98+T+NXfYBsWtPjuvsKwoRaxelv3dhKJ4wXfQX/QWmuGTDt1gjGpAleBCdGlsnqazNzIictbypMKm+AaKmLxDtSIXR3BG0tR/dudhrdNOUTHb+/9U+cNTYTgZhp2CB3qWUAdw5a6DHiEBKYx3j1wCusKBKaCSq1XG/SVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798559; c=relaxed/simple;
	bh=O12F1HQU5NW3JiODtzXh1jsvFROgPQ+iJWVQaGRnz7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlB/LibCKueIJUe8xB2nJQz9j+1MmRDzwphVy0mTuRYly3KnBRA3d3pCGCxeo991SfkO7zmNZ9hizYLfDR38T//jqsnb5AMv/EJ380m7kO2KCU21TvVQEAQlk6R6f0W//vlYsjF2aL9yZKvArpCfoRzM69NIpPz23LUEQaYSvow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuVHyYTp; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6c3b5c5e32cso1921229a12.1;
        Fri, 07 Jun 2024 15:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717798557; x=1718403357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz9rQKz8crDUMNb4O3Q6P8K3R72IuqybqY4CSrfIpGI=;
        b=CuVHyYTpStegfu75nnp9Eo4snf4wzGE+lsOA5XFnG1RhB/aDQ2DdhrrnpczQlM0tJb
         0fSMJs8BssT6K41ZCoJ6v6I0Y6NKdXumPotpYgEZODd4N+BBW1qgoCzXIpLrJPGIyHfO
         +rjTrGPtigcLq6BpXXvnPO+ov8cSoMotYGXP45tz9p4ZtVCw9DGxIeV9fmOjjCGAlC6u
         IJXbfwYNdyMJDy/OPV0tp6TDt4RMblrHPNSkuefuN2nC3uyz27joVDxyw3zvzziKXYY2
         LPmps9L3m3duWchgQeoWlqQ/3nxGIIiq3ie05yfnTkQlLIdCsBxnl9XQ0CozzzDPP1Ak
         Ojpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717798557; x=1718403357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz9rQKz8crDUMNb4O3Q6P8K3R72IuqybqY4CSrfIpGI=;
        b=PjuUTePc/YvmbQ2kxebAlUYFako8+EOCP9ZubYEXNxvrUv+SFPDzEKmCdiFk/6H+Y+
         J5Yf9ShcXV1w5ketiV0z4YN0njMB5dVi9FkFEt0IPhS70jtPPYrNcZErVEZEIkQqIbcj
         CB8XHLXsgfvusuMYY7xkyg4GqcONqVgQdWG3VRmxKul6mldkMlg/VXCE8GqUEQC7tbm/
         aJRwImKFMbSiMF6aSzsJvHvZZfTv6AwhVsaeWW9nk28OcHfziUMrI0JIRL0U+UdPzIDj
         658Nm1FyxrCaKni76Rvy1ScYkJ6mkzJ9NtphMLnf7BqGTSc0LWfG40f+GJiQjDwxi8pW
         fmew==
X-Forwarded-Encrypted: i=1; AJvYcCW5jIe0IMdgh6+ykxVxHU2tNgF28ULZEzD5UgAVmVki1QQv7U02mbSl9RV+bLO3PHHZ+CY0muhjbeRnsdl6KVoHDFQgn4W7Xy7G/wJSe8tiOSui1ING3T3dL8pkE8ASZ4d31yPjbOpJKsQG7cqE
X-Gm-Message-State: AOJu0YyKS8ajCeBkj8NZlovLIkwmuzv9qWXPVRvVIyzyXBPQI7KjEi1i
	d/YRbl9ZHCtVm2Xn58gBjgZ/AcFWES3LqW0opOLfJEqaD71wHZms
X-Google-Smtp-Source: AGHT+IEk5h6ugb8qZFsQ3OO+D2YZTiJYOA+mjr2TXBjIJ0a0Qg5y+W/XWqfHArVQUCARIEds7UgAvA==
X-Received: by 2002:a17:902:b7c8:b0:1f6:85d2:2a1 with SMTP id d9443c01a7336-1f6d03c382bmr35214915ad.61.1717798556974;
        Fri, 07 Jun 2024 15:15:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7cd2b8sm39336685ad.121.2024.06.07.15.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 15:15:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <13501da7-3e65-4401-9e21-eb3a1f93f4a8@roeck-us.net>
Date: Fri, 7 Jun 2024 15:15:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Johannes Thumshirn <jth@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
 Xing Tong Wu <xingtong.wu@siemens.com>,
 Tobias Schaffner <tobias.schaffner@siemens.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240607-md-drivers-watchdog-v1-1-485c1c58301f@quicinc.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240607-md-drivers-watchdog-v1-1-485c1c58301f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/24 11:04, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/omap_wdt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/ts4800_wdt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/simatic-ipc-wdt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/menz69_wdt.c      | 1 +
>   drivers/watchdog/omap_wdt.c        | 1 +
>   drivers/watchdog/simatic-ipc-wdt.c | 1 +
>   drivers/watchdog/ts4800_wdt.c      | 1 +
>   drivers/watchdog/twl4030_wdt.c     | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
> index c7de30270043..0508a65acfa6 100644
> --- a/drivers/watchdog/menz69_wdt.c
> +++ b/drivers/watchdog/menz69_wdt.c
> @@ -161,6 +161,7 @@ static struct mcb_driver men_z069_driver = {
>   module_mcb_driver(men_z069_driver);
>   
>   MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
> +MODULE_DESCRIPTION("Watchdog driver for the MEN z069 IP-Core");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("mcb:16z069");
>   MODULE_IMPORT_NS(MCB);
> diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
> index a7a12f2fe9de..b6e0236509bb 100644
> --- a/drivers/watchdog/omap_wdt.c
> +++ b/drivers/watchdog/omap_wdt.c
> @@ -370,5 +370,6 @@ static struct platform_driver omap_wdt_driver = {
>   module_platform_driver(omap_wdt_driver);
>   
>   MODULE_AUTHOR("George G. Davis");
> +MODULE_DESCRIPTION("Driver for the TI OMAP 16xx/24xx/34xx 32KHz (non-secure) watchdog");
>   MODULE_LICENSE("GPL");
>   MODULE_ALIAS("platform:omap_wdt");
> diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
> index cdc1a2e15180..1e91f0a560ff 100644
> --- a/drivers/watchdog/simatic-ipc-wdt.c
> +++ b/drivers/watchdog/simatic-ipc-wdt.c
> @@ -227,6 +227,7 @@ static struct platform_driver simatic_ipc_wdt_driver = {
>   
>   module_platform_driver(simatic_ipc_wdt_driver);
>   
> +MODULE_DESCRIPTION("Siemens SIMATIC IPC driver for Watchdogs");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:" KBUILD_MODNAME);
>   MODULE_AUTHOR("Gerd Haeussler <gerd.haeussler.ext@siemens.com>");
> diff --git a/drivers/watchdog/ts4800_wdt.c b/drivers/watchdog/ts4800_wdt.c
> index 0099403f4992..24b1ad52102e 100644
> --- a/drivers/watchdog/ts4800_wdt.c
> +++ b/drivers/watchdog/ts4800_wdt.c
> @@ -200,5 +200,6 @@ static struct platform_driver ts4800_wdt_driver = {
>   module_platform_driver(ts4800_wdt_driver);
>   
>   MODULE_AUTHOR("Damien Riegel <damien.riegel@savoirfairelinux.com>");
> +MODULE_DESCRIPTION("Watchdog driver for TS-4800 based boards");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:ts4800_wdt");
> diff --git a/drivers/watchdog/twl4030_wdt.c b/drivers/watchdog/twl4030_wdt.c
> index 09d17e20f4a7..8c80d04811e4 100644
> --- a/drivers/watchdog/twl4030_wdt.c
> +++ b/drivers/watchdog/twl4030_wdt.c
> @@ -118,6 +118,7 @@ static struct platform_driver twl4030_wdt_driver = {
>   module_platform_driver(twl4030_wdt_driver);
>   
>   MODULE_AUTHOR("Nokia Corporation");
> +MODULE_DESCRIPTION("TWL4030 Watchdog");
>   MODULE_LICENSE("GPL");
>   MODULE_ALIAS("platform:twl4030_wdt");
>   
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240607-md-drivers-watchdog-79132a7cc0b0
> 
> 


