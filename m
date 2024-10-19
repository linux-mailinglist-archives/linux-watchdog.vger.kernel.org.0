Return-Path: <linux-watchdog+bounces-2237-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58B9A4EAE
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Oct 2024 16:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D3C1F25530
	for <lists+linux-watchdog@lfdr.de>; Sat, 19 Oct 2024 14:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21513A8E4;
	Sat, 19 Oct 2024 14:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJgoZIWj"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A63128F1;
	Sat, 19 Oct 2024 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729348439; cv=none; b=t5yRkoXf56wbw2yDkQC1muc3f9vBkfgLQZSYAAMNbzTQ4dgY2UHPqAsvINnbHzJ6cgdiumgZPEa01z3oC/kYkz3UEIN2C2vH9y0/rxCatgXU7jvEw6+dzNRCEV+B4f2e7VuJwC8d5uBLyfyik662GWO0wh06ovFoAEivGqpLwww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729348439; c=relaxed/simple;
	bh=wPd1zyIAGrsuG4/njc6WF8Py6yQzVBLMZGqWwQLCBlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTA9JZ1YQt5ZD63ZeVUS9Rcpa9EqgbnUGhjrGiaO6bAcI2oayh5au2IbqBfRznKg6NSOYlPRr8F3TaSGulrdDVMS8yvjvuZGiK/fjfkcvycYMshCDNWXjUXOQzAXXI9RJ5gzy25iMqPaHge4jLlC002PkRJhfvx78xdjKYZJq0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJgoZIWj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cdda5cfb6so31965055ad.3;
        Sat, 19 Oct 2024 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729348436; x=1729953236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kvpCezNcl0mUfb3bmBqMqCb7ngU3+8pARHdAoWLvZ0I=;
        b=gJgoZIWjcfLA4nfWiLqSrtVqc5KIVbvy6a+ofRPuCfhRnHdwypWRTrid498eo/ugME
         +CuVE0LMqYij0CL8vOU7pTBdm+2R+yO2UERB5B5DlR+ZV7YjDdeeRJ1YINAZNyGTpkYt
         c5oGZGfTmuoUM9yuG+44SbugtA2kMxQ92Skwephw35oUEvdqynBmR1Iin/04wjGrZ8M3
         6hqnkaeqtnX19ZJ/uYM/u46HMXlGUt2bPqL7iz+pbBcoWYnx+JlBnG/lu/VUGvJgxzCj
         CKNQU0EgndeaxzCCIp2064uSEBzdxcV/1J96Dsnmwi/J1xYy4ZNJOnI6lkdgMCA3l6Nd
         zGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729348436; x=1729953236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvpCezNcl0mUfb3bmBqMqCb7ngU3+8pARHdAoWLvZ0I=;
        b=X/HwxZ2Ld+fR+XePWtZ7LBmnsjqhF6MDDcObD0ipZjcTxXNNhnp72vjIDYcHsxbEum
         633Ia4cUQrA7Xnf7k+o2i+yEVHzLUTpBQjxEyAJR1SHydhVc3gdoqGf/wRTV3G6U/P5n
         64CbmHTocrcuMrTmeABANvVhoj8K1JhBW1zSTgfxJ42D6cdCp919CmEdi5ubKWg5qePb
         S+MIAb7Nd8wM9dwsRJuAZy8usD8p/pdjblxzmkN5m8LbB1bmrCk5zC4uTrUIIT9jk7Ie
         TWySgC+wyqaouOdIRdsd92mnWijZh7AhDV1eckjDvBGuuBkWCLCCT6eidyusio9fa0zi
         x9xw==
X-Forwarded-Encrypted: i=1; AJvYcCVRlDxGUiecJOoyQ3HvQjpsi9ovIfcSSpe45HOCIs6HNc4102VkZZvCtxJuGnu46UoSwmsLbSbOckzVOSQ=@vger.kernel.org, AJvYcCXE9CI4lyjUOp3SsrK5+9r43xGYtg3htMc8inuYwamAJLRhs92HL8DYbWxIa5iFZE7WzorQkEdj7/I8AcpaaEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygrPVCIg2T4JPMDXXVoZiYOLyCfiCCdOc+m8Cclrsq8L+2zXfd
	uOC0KdpJaxqSFaJRtvAeMK7VtkICYpj0zsH6aUmEQfrJfkVl8RRiHMz6Uw==
X-Google-Smtp-Source: AGHT+IG7EEX++21PpmNhXPts9K6E+LLOxICZBK9VSSqCUcyt1WFEwc9G5k6/O6pGJwNvoLIxmsd2Ig==
X-Received: by 2002:a17:903:2447:b0:20c:db77:a4f0 with SMTP id d9443c01a7336-20e5a8e124fmr72970005ad.25.1729348436438;
        Sat, 19 Oct 2024 07:33:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8d8cd8sm28550715ad.138.2024.10.19.07.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Oct 2024 07:33:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <74b01dd4-79bb-44bb-98a4-a478a99a5654@roeck-us.net>
Date: Sat, 19 Oct 2024 07:33:54 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: it87_wdt: add PWRGD enable quirk for Qotom
 QCML04
To: James Hilliard <james.hilliard1@gmail.com>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org
References: <20241018154859.2543595-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241018154859.2543595-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/24 08:48, James Hilliard wrote:
> For the watchdog timer to work properly on the QCML04 board we need to
> set PWRGD enable in the Environment Controller Configuration Registers
> Special Configuration Register 1 when it is not already set, this may
> be the case when the watchdog is not enabled from within the BIOS.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - remove QGLK02/IT87_WDT_BROKEN
> ---
>   drivers/watchdog/it87_wdt.c | 44 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 3e8c15138edd..b8be9af065b2 100644
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

The IT8786 documentation I have states that this bit is reserved.
Do you have information suggesting otherwise ?

> +
>   /* GPIO Configuration Registers LDN=0x07 */
>   #define WDTCTRL		0x71
>   #define WDTCFG		0x72
> @@ -240,6 +248,20 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
>   	return ret;
>   }
>   
> +enum {
> +	IT87_WDT_OUTPUT_THROUGH_PWRGD	= BIT(0),

I don't mind starting to use BIT(), but then <linux/bits.h> needs to be
included as well.

> +};
> +
> +static const struct dmi_system_id it8786_quirks[] = {

I see that bit 5 of EC register 0xfa _is_ documented for this purpose on
at least one other chip supported by this driver, so the flag should be made
generic, and not be IT8786 specific. Please name the quirks it87_quirks
or similar and check it for all chips.

Thanks,
Guenter

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
> @@ -261,8 +283,10 @@ static struct watchdog_device wdt_dev = {
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
> @@ -273,6 +297,17 @@ static int __init it87_wdt_init(void)
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
>   	switch (chip_type) {
>   	case IT8702_ID:
>   		max_units = 255;
> @@ -333,6 +368,15 @@ static int __init it87_wdt_init(void)
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


