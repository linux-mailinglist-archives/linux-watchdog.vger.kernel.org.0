Return-Path: <linux-watchdog+bounces-2228-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF879A338B
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 05:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94020B219DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 03:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDBB161313;
	Fri, 18 Oct 2024 03:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P//8MQ08"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AAE20E32F;
	Fri, 18 Oct 2024 03:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729223970; cv=none; b=KjdieaGEMSbfx5Z4hqVmYJvkTJVHbEfbxXiU/QEE9gwyT8xNnXW4cnJJLMF204zL1WNe5MwyqcvFeaTzqSii782IkxNuJa979hGR5IA7ndavRKgvQgEb8oB8coGDbG8P6BTwSgQMHlh6A8EqcKfLNcZvbQELbS/ndN7GSWYRYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729223970; c=relaxed/simple;
	bh=JiW2MoSug/strTIFI5gXRpjA9iysaCSsRFrCN8CPzWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUJd6YZOuWKCyaaOTS3Fmnas42NvN3yvdBEFuXATGdHzzCyL71zbAjFa5nWb6doY8g7ZFy/Oo8K/mENqHa65dVWmDCsAqsL33bDUDmee1YdSZiyJvMVdHIp8P9ys/Fn4BihfuBtO9hxjtjnRtG8waoUzQTonxmbZZjf/VsS6qxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P//8MQ08; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso1124810a12.1;
        Thu, 17 Oct 2024 20:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729223967; x=1729828767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vgin/6NEojEKQOfEFYfWZDxC44ERLFLF9+KLGdPuqCo=;
        b=P//8MQ08qHiRF9HYTyVluHQs5ua/gfuf1TbLK7RRWkt7SnoBWB83/CKfvO3SZHDGzh
         OIXFznnx4gzc6dbwrW1IrkrSNDMOhjzy4QyOJ97kI4aqFK3QntFCDiXgr/yZV1QiwTyc
         CfFCOChO366wCvGEiF3zOXNBdEMiJqGjfpGDVvA8HEm5juAMlgG6flrJYbsAZa9WJOMm
         wWmZYxRxz87VZjxboTNexiGDQauN6BeQit0Gr/dJG6vYDyaKhNMGyZORVr/eZnqH5RYp
         gP/9xwkhIhg+UxF/Yxm30bDHsaiSDO4tELvKsGeNhaswQFttggV866aZDBSCI6qf7MbV
         5+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729223967; x=1729828767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgin/6NEojEKQOfEFYfWZDxC44ERLFLF9+KLGdPuqCo=;
        b=vnpTgFVPfAIM/xZW9RdIRrKn04xmoGOWN/XkXEGKPHd4kYNFtnekevM+EJDeRHAoDM
         h//EC0rRyrwX16I1VFmmQIXdov15OITYQJAc1OSpKWNzY6ojetEtDVtyzhx3VPtTxUXN
         l9plabm4Y9Y1HPjnIr5T81SzTSEBeWUU+CJyHyeaXFgemLw2qI57EyiR/nec5JLGN1+l
         slomGcfo6K4K4dCeTbsMFtKvVg0RiSNKvMpdrXp7527kQtiNAJwT7Mw79S/HhNZ3C/hQ
         lVpiWihlh1XrG9282aTjkBJrPnU4LHoS8/FD/z62+AvSz+//qnGMJMqwIeGOiXEtu/ae
         oYEA==
X-Forwarded-Encrypted: i=1; AJvYcCVlA3Appkgp3paXoLyWejJIU1oGz2tn1lD6F5X8Hyaiz8L/IAvM6a1p9Ng//HfZ8/kHebwKV6Su9e+6ZbnjXQc=@vger.kernel.org, AJvYcCXhs8cHVJK1LS0TElP7rUdTwbW9+clAbxGnlDivJqDWGnwVENFX52M7OWcgUynHOYop93sKAGBhCj2q9Gk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGo4T9SWAa6jCEnY+WzGzcO4enSm6WDMq8zZjn45kPhjYko+2K
	Boeuo8Cni0WkzTToZ7Lqd3XhGG7RSFbd7Gxxtwx3B/h6mCdXtFgW
X-Google-Smtp-Source: AGHT+IEZQC357td3LYmIeFVp64uIVRWLIFpru6DrpsRz/f8YVpBGrk/TXZLHy44NJlszcEsPlZ49RA==
X-Received: by 2002:a05:6a21:1349:b0:1d8:f97e:b402 with SMTP id adf61e73a8af0-1d92ca59dc0mr1551212637.13.1729223967091;
        Thu, 17 Oct 2024 20:59:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea345677asm481128b3a.147.2024.10.17.20.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 20:59:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <66922a0b-6e30-4501-9262-8bdd224155f9@roeck-us.net>
Date: Thu, 17 Oct 2024 20:59:24 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: it87_wdt: add quirks for some Qotom IT8786
 boards
To: James Hilliard <james.hilliard1@gmail.com>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org
References: <20241018030917.2540841-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241018030917.2540841-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/24 20:09, James Hilliard wrote:
> For the watchdog timer to work properly on the QCML04 board we need to
> set PWRGD enable in the Environment Controller Configuration Registers
> Special Configuration Register 1 when it is not already set, this may
> be the case when the watchdog is not enabled from within the BIOS.
> 
> For the Qotom QGLK02 board the vendor indicates that the IT8786
> watchdog hardware is not functional due to a conflict with the BIOS
> power-on function, with PWRGD set the watchdog will trigger but the
> board will poweroff rather than restart as expected. Disable the
> it87 driver on this broken hardware.
> 

This shouldn't be done in drivers, and it doesn't scale. The driver needs
to be disabled with the mechanism supported by the distribution, for example
in /etc/modprobe.d/blacklist-watchdog.conf, or by whatever other mechanism
the distribution supports for that purpose.

Guenter

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/watchdog/it87_wdt.c | 55 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 3e8c15138edd..dec501c21fd3 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -20,6 +20,7 @@
>   
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
> +#include <linux/dmi.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> @@ -40,6 +41,7 @@
>   #define VAL		0x2f
>   
>   /* Logical device Numbers LDN */
> +#define EC		0x04
>   #define GPIO		0x07
>   
>   /* Configuration Registers and Functions */
> @@ -73,6 +75,12 @@
>   #define IT8784_ID	0x8784
>   #define IT8786_ID	0x8786
>   
> +/* Environment Controller Configuration Registers LDN=0x04 */
> +#define SCR1		0xfa
> +
> +/* Environment Controller Bits SCR1 */
> +#define WDT_PWRGD	0x20
> +
>   /* GPIO Configuration Registers LDN=0x07 */
>   #define WDTCTRL		0x71
>   #define WDTCFG		0x72
> @@ -240,6 +248,28 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
>   	return ret;
>   }
>   
> +enum {
> +	IT87_WDT_BROKEN			= BIT(0),
> +	IT87_WDT_OUTPUT_THROUGH_PWRGD	= BIT(1),
> +};
> +
> +static const struct dmi_system_id it8786_quirks[] = {
> +	{
> +		/* Qotom Q730P/Q8XXG2-P */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "QGLK02"),
> +		},
> +		.driver_data = (void *)IT87_WDT_BROKEN,
> +	},
> +	{
> +		/* Qotom Q30900P */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "QCML04"),
> +		},
> +		.driver_data = (void *)IT87_WDT_OUTPUT_THROUGH_PWRGD,
> +	}
> +};
> +
>   static const struct watchdog_info ident = {
>   	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
>   	.firmware_version = 1,
> @@ -261,8 +291,10 @@ static struct watchdog_device wdt_dev = {
>   
>   static int __init it87_wdt_init(void)
>   {
> +	const struct dmi_system_id *dmi_id;
>   	u8  chip_rev;
>   	u8 ctrl;
> +	int quirks = 0;
>   	int rc;
>   
>   	rc = superio_enter();
> @@ -273,6 +305,20 @@ static int __init it87_wdt_init(void)
>   	chip_rev  = superio_inb(CHIPREV) & 0x0f;
>   	superio_exit();
>   
> +	switch (chip_type) {
> +	case IT8786_ID:
> +		dmi_id = dmi_first_match(it8786_quirks);
> +		break;
> +	default:
> +		dmi_id = NULL;
> +	}
> +
> +	if (dmi_id)
> +		quirks = (long)dmi_id->driver_data;
> +
> +	if (quirks & IT87_WDT_BROKEN)
> +		return -ENODEV;
> +
>   	switch (chip_type) {
>   	case IT8702_ID:
>   		max_units = 255;
> @@ -333,6 +379,15 @@ static int __init it87_wdt_init(void)
>   		superio_outb(0x00, WDTCTRL);
>   	}
>   
> +	if (quirks & IT87_WDT_OUTPUT_THROUGH_PWRGD) {
> +		superio_select(EC);
> +		ctrl = superio_inb(SCR1);
> +		if (!(ctrl & WDT_PWRGD)) {
> +			ctrl |= WDT_PWRGD;
> +			superio_outb(ctrl, SCR1);
> +		}
> +	}
> +
>   	superio_exit();
>   
>   	if (timeout < 1 || timeout > max_units * 60) {


