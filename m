Return-Path: <linux-watchdog+bounces-4607-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF776C65E18
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 20:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76C0A4EE7CB
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 19:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F237B303A1D;
	Mon, 17 Nov 2025 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCGAy9ny"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45976207A3A
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406374; cv=none; b=JlsoN0qVgZ7pTJUuBWud2+uuicIt6vBRg6LyexaAjk+pQgN3t2KkgXukNKjhzx+V3cUKHtmal4kx5DFPRvblUTKI0br15FT+yCi0pNHZ4JHtdA7XASxgnqUISbTOgx4XjQj/B4AmHvyhc2m1EtSMfNCyMxaHrhFcA8Yd+vfxY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406374; c=relaxed/simple;
	bh=rFiMSmFEjPbJNpsQ4K9x1RL6OeK3koTlX7zcSoXg9Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpFYEMExbCldj3eIvuGXov3H/17K6U9UwplXsxKbuGu/+5NX8odEK4/2PTuthdBXNIHDhU2DgknLVcfrwhnZ+z4LfxIv2zbZvoXBpkXrwsKW+/1nSVv75MjKuN+RBI9/dUa/JCBX2uYMgHk4uj1r9bMsr1Sz1Ty7gl6QsCA1LVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCGAy9ny; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso3952842b3a.1
        for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406372; x=1764011172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dlsZtfEc6JQRncrO9gv3FbbnoRQVjJvWvLbcLyrQNAE=;
        b=hCGAy9nyzQHJjoHBhLjQ/q9kJshzFAbDbS+tscLl1FFu5+2L44p/7JnAt57Uis4PRu
         EmrMxdFORC7qHkH5LRUKuNOlAQ/AAsF0JZP/ixogsxWckFDN9u5x/QKZuVaYLmxiDKmU
         TnSKOwZHY63RRa9C/+LunSDa0lY19O2VBZMqpCFjsPWNa12+foNuhQVXKzb722egdCtJ
         NfpAY9iNjX806unS7HKdPgEoAwoC9M7DoOS6hpFcRcO15wtAg8CCIqgOdoJwJbJPCtTL
         zIk8Fb5kksi0xEaPogQa7CgC+mL3BOeHfAPL87q7Mr1jOXdPJziHFD8CKfsYMwfACj9s
         3seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406372; x=1764011172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlsZtfEc6JQRncrO9gv3FbbnoRQVjJvWvLbcLyrQNAE=;
        b=uNhiWWPXI6/Nz0p7/0j1ZwxHqyChJ0YKD1Mz3iizMEGuiFht7x1TmF+ZBoKoPEtqxJ
         3EBuSxlQPUa8g2hwiioa8m2QPkz2igRPQTFTG5YxJh6GYjdNSGrLaP+cr4HhqhS0LXo5
         x2KwqS1GD7sMMW0Dhu7JbB5lgXi9JF8JmYU1atYZCIOTsFfYHyj21NurFL+W/fDX2Nhc
         I7mdJiu9Ks+yuy7vYhRUP7QXXMavjCW+51T+qFUdGAbnBemqzWbYfpPhGjAkpDMXk04s
         cj4qVhUvi9bQwxfCFSGzGPokbUrQFbMORs4hWTI1hh1BBwK089K+GKGhsoHvzH+R1pQE
         bYpA==
X-Gm-Message-State: AOJu0YxfGcLDlKSqjofdEX6gzWIgDd2OpfkfcqYo0zQf4guQb/XvWjk7
	+x3sHeyKYCcx/N/43Cjy+WyDwUUfIilHq7j9WDdj5iGJybFRXRssKB7v
X-Gm-Gg: ASbGncvtuFRM3DiaZ8e1hILc4nRaCUglauta7Zur86evkOlHlSRdvlEFf/QIHdNlNZd
	0rPqqR3LXyqw8LZPywZ5c5o9i4apUBp7Z0OI7LrXdMm6zd7fabHKPfQ12tAB6kmQorG8RZnyoFG
	ViHqypHtQtbJlJMq2MC3l6EWzGRTbRlWUThmJ4UlXhQ5A/ozlFqU1032k0kJbp30gPglHSbZ194
	JS5xPffqhvtnRXLT0smNI7NOUwnQwinkBXOsQUMURuYeKGG7Ofcu/N5Y4kIqJ+oysWB1ujvX5L0
	pVt17RVMU8+6qK2Ty3d58Sn8vPn6JJtPmL7995ngPPwFxQza8pIrm6yZjn8OdhbOiNf6xdN7NAK
	g9tab2DlNmWTHjExXGMUnfAwlaHugP/B3qi7tcXYP2JQuGdM/ONZ1SkMRqCznWF0NGvSLMT7fWc
	54xpXNP9soeBvF6qX5PlUdom/grS5uJ/cyrhMjBpUWTEYFxDySWWlSQtntAsM=
X-Google-Smtp-Source: AGHT+IFd5uwvmhgTmz/z8E86sAkopCImCOPyZ6bzoN8PX6DF9/XnG2lTG7ZoLs+N4gvzqXcLpjvBbQ==
X-Received: by 2002:a17:90b:1348:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-343f9ea41b3mr14489544a91.14.1763406372354;
        Mon, 17 Nov 2025 11:06:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927151d38sm13965830b3a.40.2025.11.17.11.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 11:06:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c4c1a84e-ee2d-459a-84dd-6dec3ee8e152@roeck-us.net>
Date: Mon, 17 Nov 2025 11:06:10 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: wdat_wdt: Fix ACPI table leak in probe
 function
To: Haotian Zhang <vulab@iscas.ac.cn>, wim@linux-watchdog.org
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251113023032.547-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251113023032.547-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/25 18:30, Haotian Zhang wrote:
> wdat_wdt_probe() calls acpi_get_table() to obtain the WDAT ACPI table but
> never calls acpi_put_table() on any paths. This causes a permanent ACPI
> table memory leak.
> 
> Add a single cleanup path which calls acpi_put_table() to ensure
> the ACPI table is always released.
> 
> Fixes: 058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
>    -Remove unnecessary initialization.
>    -Correct the patch description, since the v1 patch already
>     free table on both error and success paths.
> ---
>   drivers/watchdog/wdat_wdt.c | 64 +++++++++++++++++++++++++------------
>   1 file changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index 650fdc7996e1..dd3c2d69c9df 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -326,19 +326,27 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   
>   	wdat = devm_kzalloc(dev, sizeof(*wdat), GFP_KERNEL);
> -	if (!wdat)
> -		return -ENOMEM;
> +	if (!wdat) {
> +		ret = -ENOMEM;
> +		goto out_put_table;
> +	}
>   
>   	regs = devm_kcalloc(dev, pdev->num_resources, sizeof(*regs),
>   			    GFP_KERNEL);
> -	if (!regs)
> -		return -ENOMEM;
> +	if (!regs) {
> +		ret = -ENOMEM;
> +		goto out_put_table;
> +	}
>   
>   	/* WDAT specification wants to have >= 1ms period */
> -	if (tbl->timer_period < 1)
> -		return -EINVAL;
> -	if (tbl->min_count > tbl->max_count)
> -		return -EINVAL;
> +	if (tbl->timer_period < 1) {
> +		ret = -EINVAL;
> +		goto out_put_table;
> +	}
> +	if (tbl->min_count > tbl->max_count) {
> +		ret = -EINVAL;
> +		goto out_put_table;
> +	}
>   
>   	wdat->period = tbl->timer_period;
>   	wdat->wdd.min_timeout = DIV_ROUND_UP(wdat->period * tbl->min_count, 1000);
> @@ -355,15 +363,20 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   		res = &pdev->resource[i];
>   		if (resource_type(res) == IORESOURCE_MEM) {
>   			reg = devm_ioremap_resource(dev, res);
> -			if (IS_ERR(reg))
> -				return PTR_ERR(reg);
> +			if (IS_ERR(reg)) {
> +				ret = PTR_ERR(reg);
> +				goto out_put_table;
> +			}
>   		} else if (resource_type(res) == IORESOURCE_IO) {
>   			reg = devm_ioport_map(dev, res->start, 1);
> -			if (!reg)
> -				return -ENOMEM;
> +			if (!reg) {
> +				ret = -ENOMEM;
> +				goto out_put_table;
> +			}
>   		} else {
>   			dev_err(dev, "Unsupported resource\n");
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto out_put_table;
>   		}
>   
>   		regs[i] = reg;
> @@ -385,8 +398,10 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   		}
>   
>   		instr = devm_kzalloc(dev, sizeof(*instr), GFP_KERNEL);
> -		if (!instr)
> -			return -ENOMEM;
> +		if (!instr) {
> +			ret = -ENOMEM;
> +			goto out_put_table;
> +		}
>   
>   		INIT_LIST_HEAD(&instr->node);
>   		instr->entry = entries[i];
> @@ -417,7 +432,8 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   
>   		if (!instr->reg) {
>   			dev_err(dev, "I/O resource not found\n");
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto out_put_table;
>   		}
>   
>   		instructions = wdat->instructions[action];
> @@ -425,8 +441,10 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   			instructions = devm_kzalloc(dev,
>   						    sizeof(*instructions),
>   						    GFP_KERNEL);
> -			if (!instructions)
> -				return -ENOMEM;
> +			if (!instructions) {
> +				ret = -ENOMEM;
> +				goto out_put_table;
> +			}
>   
>   			INIT_LIST_HEAD(instructions);
>   			wdat->instructions[action] = instructions;
> @@ -443,7 +461,7 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   
>   	ret = wdat_wdt_enable_reboot(wdat);
>   	if (ret)
> -		return ret;
> +		goto out_put_table;
>   
>   	platform_set_drvdata(pdev, wdat);
>   
> @@ -460,12 +478,16 @@ static int wdat_wdt_probe(struct platform_device *pdev)
>   
>   	ret = wdat_wdt_set_timeout(&wdat->wdd, timeout);
>   	if (ret)
> -		return ret;
> +		goto out_put_table;
>   
>   	watchdog_set_nowayout(&wdat->wdd, nowayout);
>   	watchdog_stop_on_reboot(&wdat->wdd);
>   	watchdog_stop_on_unregister(&wdat->wdd);
> -	return devm_watchdog_register_device(dev, &wdat->wdd);
> +	ret = devm_watchdog_register_device(dev, &wdat->wdd);
> +
> +out_put_table:
> +	acpi_put_table((struct acpi_table_header *)tbl);
> +	return ret;
>   }
>   
>   static int wdat_wdt_suspend_noirq(struct device *dev)


