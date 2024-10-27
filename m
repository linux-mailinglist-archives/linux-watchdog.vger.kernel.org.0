Return-Path: <linux-watchdog+bounces-2340-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5DE9B1EBC
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 15:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44E71C24106
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2024 14:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF2E168C3F;
	Sun, 27 Oct 2024 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsMaDBo0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03811166F25
	for <linux-watchdog@vger.kernel.org>; Sun, 27 Oct 2024 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730039323; cv=none; b=e/Urts0PD9qN1NriK1kUjfVKPH2BuRfPM/GpM8roVsHMCDy/eJpCfYwK6drIrGngexMETPAYYvYXn2cXo4FDhKkZrFHlmotOGp3ySue5WDiPNqDnoWxuK+4jL67v8JJ9ou/B5D6+3JfLBf6yXIEqSklJ28jgglLyOZx1v6SlmKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730039323; c=relaxed/simple;
	bh=SmzaLasFqr99jar/+9zDFHZc7Qz2YMrjCwpVIgnjQGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1ljAFzhfolQiYgc3p3dA356ThQK4loQLUkXHFYvqZPjauZEVC0UIpblE57OEaw9NNlepi8X/rw3pnB8rtVPX+N4whWQkT+eBz5vOVnuh6P1HZeHqGd3b8isdolhpVacergRDmeqRNKxnxK/fioPKxikVffy4Efl3uG9xe3hV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsMaDBo0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c7edf2872so32854845ad.1
        for <linux-watchdog@vger.kernel.org>; Sun, 27 Oct 2024 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039320; x=1730644120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7A3lbsEM7HKz9vAURuZDu+UknulQsKtxt8b5QEI9hvQ=;
        b=gsMaDBo0nKPpwKv0RKLL1e7cnZ5t2AQ04+GaL9e1JnBV5h5bHRcIwNVPfrxnDEsJoD
         VWpIb3/RzYp8VtzQst+X7XY63/yogv2+0S9xQhBODpdUM4IbTInn7vDpQ6wgqVGaa/NY
         dV5tc7Hl+GmVBr5R2ySfPmQHwjQzre2aYhpwh+PGV6wJJIuRitS3rlUuvAMhIKYJAQKs
         hvWTPXcLBwNqq6SPuH+4b4GqcEyT425Q3Hz46gO3dHRm/h6DpcYjNgerQ/hv70zhFAUV
         drN8Z5TybFoERKGgnBjCujukm/OCFcfzzoMYniWKkeUB8UO69zH46dDSCqVPZE4431kl
         ej0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039320; x=1730644120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A3lbsEM7HKz9vAURuZDu+UknulQsKtxt8b5QEI9hvQ=;
        b=H9AEfuuhSu5a/CYCYY+o4UShwDF6gxsTHjbFv6e6mOLzxCeOi+pa2VB57Stqn4ApAo
         oVaX+s2t0ISsEmaMZswkPpkJqZeM5KXdy/CH/b7qAIwvDzk2JNGGJ+0Y7mZLfBDMZNvo
         jDsgryPAzSpkD9psmSsoZNHj7bBoPm6w3koG9nAqE+Ma4mQyw28LaTENzBKA+hSZdQbC
         036Rb0rhkr/UYnxyKi/MvNHogYI22XibjVLgcQ5N5jadBUXl05wxQzQWh85yUA1goY+P
         vFXZ29xldMlHhiSAOoyIfIIc/x8/K5YsZERa35S3Z1+EP/zyW6oMsl3HfO8RQbRk+4Kf
         iD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE167ventXLIcWqFF4DOHUBymNQcXG/4s/xPIJSClWYov/yEVAdRk9gdTI34Gr2fpGCgRlg3nD5UZAkpmrUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2bVtH1FzsG8Nn5ZMTovZe3oJ2pFQKP+cXLQY2NWtGtucJMLZ
	5Wxe4LhezDGWbis4IW++KOJrAlO+z+vAlog6kX30khtnQH48DMnj
X-Google-Smtp-Source: AGHT+IEddC7mt3S+zIgad3iK7xrMPQBFENvpB2vP99X6e/sU/fDdtOXzTrC5bdqxPz4evOD0/cdxvg==
X-Received: by 2002:a17:903:2307:b0:20b:723a:cba1 with SMTP id d9443c01a7336-20fb884fc0dmr183973465ad.1.1730039320157;
        Sun, 27 Oct 2024 07:28:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3e2a4sm4177619a12.88.2024.10.27.07.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 07:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fb93ba0f-d414-4f7f-aff9-cd958c715e23@roeck-us.net>
Date: Sun, 27 Oct 2024 07:28:37 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx7ulp_wdt: Clarify timing units
To: Stefan Wahren <wahrenst@gmx.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-2-wahrenst@gmx.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241027105323.93699-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/24 03:53, Stefan Wahren wrote:
> imx7ulp_wdt mixes a lot of timing units (frequency, clocks, seconds)
> in a not obvious way. So improve readability of imx7ulp_wdt by
> clarifying the relevant units.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a3053357..0f92d2217088 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -19,7 +19,7 @@
>   #define WDOG_CS_PRES		BIT(12)
>   #define WDOG_CS_ULK		BIT(11)
>   #define WDOG_CS_RCS		BIT(10)
> -#define LPO_CLK			0x1
> +#define LPO_CLK			0x1	/* 32 kHz */

This configures the clock source to be the LPO clock, which according to the
chip datasheets is a 1kHz clock for all chips except IMX93. It is only 32kHz
for IMX93, and the prescaler is enabled for that chip.

The comment is not only misleading because it selects the clock source,
not the rate, but wrong, because it only selects a 32kHz clock for IMX93,
and that value is then prescaled.

>   #define LPO_CLK_SHIFT		8
>   #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>   #define WDOG_CS_EN		BIT(7)
> @@ -39,8 +39,8 @@
>   #define UNLOCK_SEQ1	0xD928
>   #define UNLOCK		((UNLOCK_SEQ1 << 16) | UNLOCK_SEQ0)
> 
> -#define DEFAULT_TIMEOUT	60
> -#define MAX_TIMEOUT	128
> +#define DEFAULT_TIMEOUT	60	/* seconds */
> +#define MAX_TIMEOUT	128	/* seconds */
>   #define WDOG_CLOCK_RATE	1000
>   #define WDOG_ULK_WAIT_TIMEOUT	1000
>   #define WDOG_RCS_WAIT_TIMEOUT	10000
> @@ -240,7 +240,8 @@ static const struct watchdog_info imx7ulp_wdt_info = {
>   		    WDIOF_MAGICCLOSE,
>   };
> 
> -static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout, unsigned int cs)
> +static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
> +			     unsigned int timeout_clks, unsigned int cs)

I don't think "_clks" adds any clarity because the value doesn't set a "clock".
"_ticks", maybe.

>   {
>   	u32 val;
>   	int ret;
> @@ -263,7 +264,7 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeou
>   		goto init_out;
> 
>   	/* set an initial timeout value in TOVAL */
> -	writel(timeout, wdt->base + WDOG_TOVAL);
> +	writel(timeout_clks, wdt->base + WDOG_TOVAL);
>   	writel(cs, wdt->base + WDOG_CS);
>   	local_irq_enable();
>   	ret = imx7ulp_wdt_wait_rcs(wdt);
> @@ -275,7 +276,8 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeou
>   	return ret;
>   }
> 
> -static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout)
> +static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
> +			    unsigned int timeout_clks)
>   {
>   	/* enable 32bit command sequence and reconfigure */
>   	u32 val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
> @@ -296,11 +298,11 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
>   	}
> 
>   	do {
> -		ret = _imx7ulp_wdt_init(wdt, timeout, val);
> +		ret = _imx7ulp_wdt_init(wdt, timeout_clks, val);
>   		toval = readl(wdt->base + WDOG_TOVAL);
>   		cs = readl(wdt->base + WDOG_CS);
>   		cs &= ~(WDOG_CS_FLG | WDOG_CS_ULK | WDOG_CS_RCS);
> -	} while (--loop > 0 && (cs != val || toval != timeout || ret));
> +	} while (--loop > 0 && (cs != val || toval != timeout_clks || ret));
> 
>   	if (loop == 0)
>   		return -EBUSY;
> --
> 2.34.1
> 


