Return-Path: <linux-watchdog+bounces-4595-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CACD2C6188B
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 17:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 911634EE5FE
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 16:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF30C2DCF69;
	Sun, 16 Nov 2025 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CynIqob2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3FC30DD21
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310164; cv=none; b=PsejM0MFk+U4c2siHwttXanc53xoK0igxaohihTkGsjxhXXYt5NJ/fcwInNW8QNGA6DMDfDf+j8GcvW1LteZdE1iyYdDGQ6mHF1uSd+mYqBQnATDgYGS1WMxK6ip8+JyhpihjQDl5LfmAYgggwf5NXXFDR3oZXdJUgQEcc4i/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310164; c=relaxed/simple;
	bh=XxH0GsJaCdJhGIwKLzaCI5r+KaYaPOyMl1v7L/dBTJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoCTb8BVQuLhRKDPBH7ZeuKH9b15DR8SR6C2RMXhlLJJehfxJv+uMChAtAgf2b5mj3npQoZthNAyWcBEKh7/8WgV1xVHWw0G6txz7HrGKGASj284qSaoYGCnO66kzl+seddbt7YW0XidKMmcxI8HkJcS3vdGIcvpzyTc30A9UPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CynIqob2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso3996018b3a.3
        for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 08:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310162; x=1763914962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2wFpb1JXQvHVZt7Ui2yS287G7AJP28LZP+hgWOD3PHQ=;
        b=CynIqob2aKH0grL7E6WbXuIlhpf1M5Q/60q7OKV0TF0hhq4JSqSRDtRklnYruWCT3x
         iK2ejeEc5kV+C6lfz0O6+5u66zsTFhrb8NOBhKL/XzBxDzFwVegS7iXr2Ub4Gl8sgP92
         fAf7FcmSgnOdr8WKl1Zux7s8FxpgEZUqsLjDEeoZ2oVp5zsnjeDi2RkLV3253zeSskRv
         JjsQE95FNhZHyeXI5ea9IfnzLprd2o6+0XQS7A4lCgnl5LQC7OKqu1HIqniGmq2HYpfr
         tq3fF4t8GIVMUryJn2KUr0yv9hoz72YUNF2TbUz2GJ7FnAXxeZYv6J8XhHBgOB5OmvKI
         53RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310162; x=1763914962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wFpb1JXQvHVZt7Ui2yS287G7AJP28LZP+hgWOD3PHQ=;
        b=cnjENA7tCkz0VFBo0KeZ72rh7M0G5tTbqmnkQ+eXfR1OX0aE6aEMUpUy3nt/uyNP2v
         lcOHNzWtYVLDIz1nDcnNxkuUdJeQVH64IriqK1d+vK+dk39PVq1PjaTLmI2+nAvA0PR1
         b0bmbWMsICbLN7o6BBjZklFvH3gAMlujXnU85bHKD8t5673DYWRXNu/pGAw7tvGD59YA
         ZSCU9V0mU6aTOPRmrCYOH39B+WBvsncX1Qu1cSqeyQ9dbsrZs8sXEZEYK7VZ84HEn4E9
         9va6vWJEUBaqSh0ajTBfxCakZ54RFziQBvouKvy3M4UdsAOs8rHFlL1tauCpK8Wh9IfA
         8YqA==
X-Forwarded-Encrypted: i=1; AJvYcCXA2C5KjsXJ1246SQ2K1xECz8/m5ztFPvkqvO2wdbWYUf5K+6VGWEsGzBZNRkT9ztO2+SaBbqcbCVONDu8zZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxdWFXGn0zKO0SlE1ObZiJTm5onXCiROl0FfD7nvtx7QGtTwz
	NAClRWsp6iAvSz+RBGkye4LsjJMy56exVChBN0g4ORa7p0lkhcKfYhvkDWy1kA==
X-Gm-Gg: ASbGnctseClaUqZvIWe5pgZUf6heLFTfIdljf6FUmcH2tymT2PwQcMyjaYhLMlilAaN
	HJraqWJ/KJXL2Eut+n3c4B9ZLDfaxlPRPNQI5BFCrLOgykH4svmWWcCys8wemecBDAG/Ucn8Nqb
	5VD3ZFlL5yxfN6v7bOyPowFfa5PbrSP2LCQqPs6QbHtkXtb97SgO44zOuYBzpbaRgsLPvi9pxT/
	SEyAOYexkhSlomT6/EClBGEIxqFQrBw+emXT9UYjalB+H0qhsT6y6t09I6RTjkDAPqNX4opQ+JX
	zvBIfod3OviVrc175rSXj2zzjD+XjJmSQH23p7P2vd+GJIiJlg/j4IusKxG5iKSZNvYcxYzT37z
	1diatmMWD4yoHhNx5yFwEihNLUGsI+nmA98Tgip9redNvwzkJlXgeUgH8E4769Axn7KmjOSftQq
	VU9hQ1Xbdbp7eVzkefZ9F9xZvG1x+yIT6AWsLSGWL68Q4D/We5
X-Google-Smtp-Source: AGHT+IEDvBXw5XT+/Q659aXjDWQEzhLtLM2KNXjkVx6HM4PuKHKQTCQ8D/i+BeTlHMqB4VDNUddhCQ==
X-Received: by 2002:a05:7022:d8e:b0:119:e569:fb96 with SMTP id a92af1059eb24-11b40e7c118mr3373167c88.5.1763310161791;
        Sun, 16 Nov 2025 08:22:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm37577878c88.1.2025.11.16.08.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 08:22:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
Date: Sun, 16 Nov 2025 08:22:39 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fix it87_wdt early reboot w/ FW started timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
References: <20251116.145908.308086523429052446.rene@exactcode.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251116.145908.308086523429052446.rene@exactcode.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/25 05:59, René Rebe wrote:
> Some products, such as the Ugreen dxp4800 plus NAS, ship with the it87
> wdt enabled by the firmware and a broken BIOS option that does not
> allow to change the defautl time or turn it off. This makes installing

default. Also, claiming that the BIOS would be broken is inappropriate:
For all we know this is on purpose.

Unless I am missing something, this makes it impossible to stop the watchdog.
Is there a configuration bit indicating that the timer can not be updated ?
If so, the watchdog core needs to be told that the watchdog can not be stopped.
Otherwise userspace could try to stop the watchdog and the system would reset.

> Linux difficult and annoyingly rebooting early in an installer; unless
> one loads and starts a watchdogd in the installer environment.
> 
> Change it87_wdt to report a running timer to the watchdog core using
> the user supplied or module's default time and set it as the timer
> might already be up and trigger soon.
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> 

---
and change log goes here.

> --- a/drivers/watchdog/it87_wdt.c	2025-09-28 23:39:22.000000000 +0200
> +++ b/drivers/watchdog/it87_wdt.c	2025-11-16 14:18:24.759115286 +0100
> @@ -4,6 +4,7 @@
>    *	   for ITE IT87xx Environment Control - Low Pin Count Input / Output
>    *
>    *	(c) Copyright 2007  Oliver Schuster <olivers137@aol.com>
> + *	(c) Copyright 2025  René Rebe <rene@exactco.de>

For a couple of lines of code ? Really ? I changed 75 lines in that driver
and don't claim that.

>    *
>    *	Based on softdog.c	by Alan Cox,
>    *		 83977f_wdt.c	by Jose Goncalves,
> @@ -188,6 +189,15 @@
>   		superio_outb(t >> 8, WDTVALMSB);
>   }
>   
> +/* Internal function, should be called after superio_select(GPIO) */
> +static unsigned int _wdt_get_timeout(void)
> +{
> +	unsigned int ret = superio_inb(WDTVALLSB);

Empty line after variable declarations.

> +	if (max_units > 255)
> +		ret |= superio_inb(WDTVALMSB) << 8;

There is a configuration bit which determines if the timeout is counted
in minutes or in seconds. That needs to be taken into account as well.

> +	return ret;
> +}
> +
>   static int wdt_update_timeout(unsigned int t)
>   {
>   	int ret;
> @@ -292,6 +302,7 @@
>   	u8 ctrl;
>   	int quirks = 0;
>   	int rc;
> +	unsigned int _timeout;
>   
>   	rc = superio_enter();
>   	if (rc)
> @@ -374,8 +385,6 @@
>   		}
>   	}
>   
> -	superio_exit();
> -
>   	if (timeout < 1 || timeout > max_units * 60) {
>   		timeout = DEFAULT_TIMEOUT;
>   		pr_warn("Timeout value out of range, use default %d sec\n",
> @@ -388,6 +397,17 @@
>   	wdt_dev.timeout = timeout;
>   	wdt_dev.max_timeout = max_units * 60;
>   
> +	/* wdt already left running by fw bios? */
> +	_timeout = _wdt_get_timeout();
> +	if (_timeout) {
> +		pr_warn("Left running by firmware.\n");

This is not a reason for a log message, much less for a warning.

> +		wdt_dev.max_hw_heartbeat_ms = timeout * 1000;

This should be set instead of setting max_timeout.

> +		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
> +		_wdt_update_timeout(timeout);

The watchdog core does that already when the watchdog is registered.

> +	}
> +
> +	superio_exit();
> +
>   	watchdog_stop_on_reboot(&wdt_dev);
>   	rc = watchdog_register_device(&wdt_dev);
>   	if (rc)
> 


