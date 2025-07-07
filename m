Return-Path: <linux-watchdog+bounces-3837-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94491AFBCF9
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA63A16C214
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1F32264B2;
	Mon,  7 Jul 2025 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1qfPnAl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6333086;
	Mon,  7 Jul 2025 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751921895; cv=none; b=c4Sks5+xpdHd4BnHPwYADuqJn/QIjXj8m72n6hYhersKx6wk0nHnjWf3tfHcYvTEp2xEVVB2RITE87e60ipguybij6cocfmO2G2OorcDNILpQszOtatfTnldHwBCJngzv5dPY/R/8+6j7jz5pebIVy28V8mIW/NUnt6pbejauAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751921895; c=relaxed/simple;
	bh=1yfgLOFQaiPln+5UECEysOSL8yOtlnqkjI3h5BWsKRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+eCy7mD6nfbsbGZMkTl+gcf3lZDdklIVp3HJHLSOee3cpmUDV9DnyNP8bisbu6reRPq0etPj7XCobQewlegNG4OSUat8Uaxsz3ha8MbL5pUwVsJ/Jrvzr5aQ9+0g0Vjm9ITW9i8ciTj1hO/bd9q6Kl4vzcm/S5QR9RkXR2NfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1qfPnAl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74ce477af25so2152211b3a.3;
        Mon, 07 Jul 2025 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751921893; x=1752526693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdtzQHXmDsLgtDJHYdjLmDT6a/R1cKsr1fz9USt0LtY=;
        b=b1qfPnAlL7t0zfzOx34Qu8w0ym21NtTaw1IUEa8fNLWXVg/Uz+K3/hWqDgOhw2f0F8
         oB2RBKkjrasSaQEiSSIj6LPBxMENc/r9HBRc6IxByxOSVu8UBdN7bkAEuHSJNtYPzSma
         tX5aG30wyPDUEryajB7UZls3b6basaP3DFRRnuFf6onLc2Re6/rQVj/kICWuISUE2ZM9
         1YF5TexXJYNycoUafxhN5vLumxsv7jBQkJf3LHhQpvFRh4akyY8wP0G5PTw940TLpiqM
         A0u4UIo6AuvTyWZlkB2/84JO+1LeDI6NVzkAsD6juSaqtLhiyGTXt9elt15pbNV7IjgX
         0z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751921893; x=1752526693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdtzQHXmDsLgtDJHYdjLmDT6a/R1cKsr1fz9USt0LtY=;
        b=Ck85/tkxKjeX9kHUlnxdk8pJSLpXb4o/4e6xG7opEXJMagolWZmUwUWklhEnDF4SDG
         DrU0st/5NxG5IZY/PNF7TdIg0arBY2buajc/Q6Uqct4oK5bJeiPTfk5+3BH+DdIuWdwc
         e4xzsTQCKrpfRMIED8SFgxSBoSjRwarQ1bjjlmLcTdKroArqsJHWHIolJC6fGIcyEO3O
         YO8q+hS4IkrYsk+8k85mM5uZq9vHMXoxUl+jZlT5XCv1TOYNDYlr6cqgj4bsoTNg4kxC
         +uQiIPgkulJ9tTJTB45XNgfOCms+5I0VDOwrPQhP+HB689O/5eFPswzQFxkkJCNgKrEi
         DV0w==
X-Forwarded-Encrypted: i=1; AJvYcCWLZkm3/Axs8DFmtteZ+nWLU8h5RsjeaysrzJClCcUO6gS9rYaQ+GHEbg5aiWCqJmtFvcX7EyeyWXaz@vger.kernel.org, AJvYcCXdDWgGBeggjPfBQFICZc47PoqmY7T9iWbSjPwOUKX/oC3SBryvycW+vn+5QyvCoJ1MAXjL5eU1tfz5b94eo9s=@vger.kernel.org, AJvYcCXrAOob/FSCzpNEQrD3nsGGcwOzLlTPh/tNoxV1atiZxKEI8iyLZHJofEcedkJzPPs4bB3bY8q9ymm4tR4c@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/8sev21paLo+xdj2f88IFwZcMVdvHzuJwkn4ztConxpNqxWc
	WHZ8b/BXSUJjvkMgQMDx3GgTCfneek54hoDCSMqd1tCa7NQy+m/tiiZf7J1mFg==
X-Gm-Gg: ASbGncvjDuoc6fBk528UbnvWQSMrj4XeYgwd4kL1Pee79m16Wc65scJGhoiAj4TJkm+
	6H+LvYbcVIIUVX4t4FmO1laYTf6oW06njwKHFv9MjODWPwo7KFQuQVTzKtVex28k5Y6rsOIjg0z
	f5EhWzCDnUl1Bf1DoQyKIagVvDlBgUzaPg7WFzC0MvUz/j9JmFU7XgaKLG5MNyMYd8UhfyUQXr4
	aQ6sS49lgz+iN3WeQa3qrYncE94tI2RLZfrD+7rysu62v8BJTbN3HbJOUHH8mxmRLHV7CHHil+Y
	AMWvDo+kd9yP8jgoMTrmObc3US+Fw+IUvlZKEtHB78kQKw1vstm/EEVyn8436OIaZPD6mQTDglE
	QmIikrzUYiw==
X-Google-Smtp-Source: AGHT+IHa33IoJDkkiAUXOiNtnScGLdwFfsOuTvhHokB8mo7xs2anSqK5WIaSd1T5qMmvoHWiD9OYSg==
X-Received: by 2002:a05:6a00:1910:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-74ce6417d49mr19430623b3a.6.1751921893287;
        Mon, 07 Jul 2025 13:58:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cc72dsm9826565b3a.42.2025.07.07.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:58:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 7 Jul 2025 13:58:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Judith Mendez <jm@ti.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v3 2/2] watchdog: rti_wdt: Add reaction control
Message-ID: <cc37e797-d3e5-444d-8016-c437a0534001@roeck-us.net>
References: <20250707180002.3918865-1-jm@ti.com>
 <20250707180002.3918865-3-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707180002.3918865-3-jm@ti.com>

On Mon, Jul 07, 2025 at 01:00:02PM -0500, Judith Mendez wrote:
> This allows to configure reaction between NMI and reset for WWD.
> 
> On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
> to the ESM module which can subsequently route the signal to safety
> master or SoC reset. On AM62L, the watchdog reset output is routed
> to the SoC HW reset block. So, add a new compatible for AM62l to add
> SoC data and configure reaction to reset instead of NMI.
> 
> [0] https://www.ti.com/product/AM62L
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index d1f9ce4100a8..c9ee443c70af 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -35,7 +35,8 @@
>  #define RTIWWDRXCTRL	0xa4
>  #define RTIWWDSIZECTRL	0xa8
>  
> -#define RTIWWDRX_NMI	0xa
> +#define RTIWWDRXN_RST	0x5
> +#define RTIWWDRXN_NMI	0xa
>  
>  #define RTIWWDSIZE_50P		0x50
>  #define RTIWWDSIZE_25P		0x500
> @@ -63,22 +64,29 @@
>  
>  static int heartbeat;
>  
> +struct rti_wdt_data {
> +	bool reset;
> +};
> +
>  /*
>   * struct to hold data for each WDT device
>   * @base - base io address of WD device
>   * @freq - source clock frequency of WDT
>   * @wdd  - hold watchdog device as is in WDT core
> + * @data - hold configuration data
>   */
>  struct rti_wdt_device {
>  	void __iomem		*base;
>  	unsigned long		freq;
>  	struct watchdog_device	wdd;
> +	const struct rti_wdt_data *data;
>  };
>  
>  static int rti_wdt_start(struct watchdog_device *wdd)
>  {
>  	u32 timer_margin;
>  	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
> +	u8 reaction;
>  	int ret;
>  
>  	ret = pm_runtime_resume_and_get(wdd->parent);
> @@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>  	 */
>  	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
>  
> -	/* Generate NMI when wdt expires */
> -	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
> +	/* Reset device if wdt serviced outside of window or generate NMI if available */

Shouldn't that be "or generate NMI if _not_ available" ?

Guenter

> +	if (wdt->data->reset)
> +		reaction = RTIWWDRXN_RST;
> +	else
> +		reaction = RTIWWDRXN_NMI;
> +
> +	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
>  
>  	/* Open window size 50%; this is the largest window size available */
>  	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
> @@ -255,6 +268,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	wdd->timeout = DEFAULT_HEARTBEAT;
>  	wdd->parent = dev;
>  
> +	wdt->data = device_get_match_data(dev);
> +
>  	watchdog_set_drvdata(wdd, wdt);
>  	watchdog_set_nowayout(wdd, 1);
>  	watchdog_set_restart_priority(wdd, 128);
> @@ -369,8 +384,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +static struct rti_wdt_data j7_wdt = {
> +	.reset = false,
> +};
> +
> +static struct rti_wdt_data am62l_wdt = {
> +	.reset = true,
> +};
> +
>  static const struct of_device_id rti_wdt_of_match[] = {
> -	{ .compatible = "ti,j7-rti-wdt", },
> +	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
> +	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
> -- 
> 2.49.0
> 

