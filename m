Return-Path: <linux-watchdog+bounces-2719-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F39A12689
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 15:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EF93188563C
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Jan 2025 14:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C469412AAE2;
	Wed, 15 Jan 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeZOavI/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9A186320;
	Wed, 15 Jan 2025 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952742; cv=none; b=YE5C4xTAALg3hE+9vEK3+3CQLoUIzbIvZVS08RwBq8InjguADTxsyumtvxXAJxe9TRhdkJhUvFAd+zsU4vJfs5xiG5nCzAuo/CbxzbBsuDSnpvJRCp0LSnn7TMTod2Q7uM1okhBHcgAWzpz1EZ8pJffJCqg9XwtBySLZGwMWOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952742; c=relaxed/simple;
	bh=AhvqQKQfqkwQn1dvB5oSVeM+vHd5S5Orx9VgHqcygTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7oswM6fmPiqWkDb+rcRPD3m4hyNY9ss6REUTEAIP0Dj5itWtsgBW/lH0FB1KejvBJBjBKP51xzRrdkO/XMTUB2H1VH1n42YhXubt+zFW3GUHV76ZSvHAnrmEvlSzEQdd264o6v2mqSZjMWBbUHycrQLdwtClIWZpCV3s78VY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeZOavI/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21654fdd5daso117780555ad.1;
        Wed, 15 Jan 2025 06:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736952739; x=1737557539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GvEeJ+HxT7u1Ozuth6Yjb+JvTHnXy5acPwiYU4ZOHmA=;
        b=IeZOavI//GV5MP7Gkht8C2YMtUowCf0mHljoks/R+s9cbMpR/ja4kvV2PlZqD9q2FH
         gAAdNx9DiEdFuk3qdTVH3lyzcp8P3sVXqU4ox9X1kIRu19JWUNqIdH4LxZI/Waivltjg
         jd1TUPXJLW8ZC4E4R0UaW8USZwJac1iXVy9dsORwEYBijhkO6THSyHae5UJaoSLAGLeQ
         6W13rJ9Ru4agrjXnU83KSp1evKkNEFq5eIf3DmsEaJHXw4vQhJyifeD4WBfFLu/pVglG
         rmrOOMzaSSno+Ig2d8KHE9ZqyJO3ACys6FGS6RS1mpLdLDZn2keLa/4/KoQp0P5lrzd/
         SnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736952739; x=1737557539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvEeJ+HxT7u1Ozuth6Yjb+JvTHnXy5acPwiYU4ZOHmA=;
        b=MvDRgXcdj0eic/4eAFQOeNxAN3Uovp6787+nhmh2eBQBlRgrsAh+8W/aZAzgKEyLVa
         Ji+Jy9TGpE9jcBpk9TArUFTEviPb0U4L7d9TAq68cEXiTMhTFzUY6/v6YMywhDQWwOnn
         voxT8XP1BO6pxjaWmbrfrxxxPcc3P+Q3DOdglyTZL6rmGHO5/R8qmdv8obQKHI/BWA8B
         Sein4PASxMt09O07H4ph7TRcjklR/gBhZf/kkUsjuOLIfOudeyUVifmM39DU5eM8MEyf
         xi4jlHLji9BZFY48pxjXiIjaDQdtjXEJi77JlqHSIYKxERjT6KfthKT9s/39rL7IT8M4
         z1OA==
X-Forwarded-Encrypted: i=1; AJvYcCV18eXajDtRHH08ve8fdK1z1v1+cO+7vlPxvegv8NqwZIuVWnAbCEoai6yBaGGfhgR/CVm+VcvpPDEHGQA=@vger.kernel.org, AJvYcCWCfL7SyMMyB9nfoJ2dl2OV6ZrrvFuSdSXpPC17mjcU969Xzzu2Uaok5vhbo0pdRXFP7vMO33gKbdozJlYEtqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9Gi9rulfhJZxuTWwr0BOz/uHJWqS5H8TI3xbst07QxWxK1Vj
	F3C2G2YfT8KtBfhPfqyofcCzq8Ush5Bo5HxQGVyAdIHJroHAh/Im
X-Gm-Gg: ASbGnct8oBv7Wk1mBYBqCiHooOWJVc4aG5hjDMz0mFLrOHhZV25O8IV07LcGZWmo8ld
	huh/5doa9tTD0BN21XmIVK6FO+m7xhpK59J+q9LyUZ/qt2yin67gf3t1u8/SZYHRmwn4Z2NR+MK
	qATWu+9etcpQm83l1Lx4o8Qy2SdFqM6ewSLhTjwyDs0F82Ibc64gWcmhEZvM4Jpk5+/TePLTPqe
	4zAu/oD84cPgH4BSaOy8uKatyKjHWOI2khjAvvCUGYXKIJmfHeNFkAg+xaFuGRKLetJ+8wEYRO/
	kaBLtLRHLXbt/9y4pCqvpdw8BhWPDQ==
X-Google-Smtp-Source: AGHT+IGRh/1532ENXcvsb+iiP0iRLXZj2CLb0trSRgFQ0hmTxa/o5eQVb5rPY9mXVdLUQDyclPzeaQ==
X-Received: by 2002:a17:902:ce8a:b0:21a:5501:9d5 with SMTP id d9443c01a7336-21a83fde4femr477457655ad.44.1736952738663;
        Wed, 15 Jan 2025 06:52:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219de5sm84011475ad.133.2025.01.15.06.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 06:52:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7e9a3b98-8b7b-40b5-a529-cb6ac308098a@roeck-us.net>
Date: Wed, 15 Jan 2025 06:52:16 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo
 SE30 platform
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: wim@linux-watchdog.org, dober@lenovo.com, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250115140510.2017-1-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250115140510.2017-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 06:05, Mark Pearson wrote:
> Watchdog driver implementation for Lenovo SE30 platform.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>   drivers/watchdog/Kconfig           |  12 +
>   drivers/watchdog/Makefile          |   1 +
>   drivers/watchdog/lenovo_se30_wdt.c | 435 +++++++++++++++++++++++++++++
>   3 files changed, 448 insertions(+)
>   create mode 100644 drivers/watchdog/lenovo_se30_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..c73e8f0e436c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -279,6 +279,18 @@ config LENOVO_SE10_WDT
>   	  This driver can also be built as a module. If so, the module
>   	  will be called lenovo-se10-wdt.
>   
> +config LENOVO_SE30_WDT
> +	tristate "Lenovo SE30 Watchdog"
> +	depends on (X86 && DMI) || COMPILE_TEST
> +	depends on HAS_IOPORT
> +	select WATCHDOG_CORE
> +	help
> +	  If you say yes here you get support for the watchdog
> +	  functionality for the Lenovo SE30 platform.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called lenovo-se30-wdt.
> +
>   config MENF21BMC_WATCHDOG
>   	tristate "MEN 14F021P00 BMC Watchdog"
>   	depends on MFD_MENF21BMC || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 8411626fa162..c9482904bf87 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_I6300ESB_WDT) += i6300esb.o
>   obj-$(CONFIG_IE6XX_WDT) += ie6xx_wdt.o
>   obj-$(CONFIG_ITCO_WDT) += iTCO_wdt.o
>   obj-$(CONFIG_LENOVO_SE10_WDT) += lenovo_se10_wdt.o
> +obj-$(CONFIG_LENOVO_SE30_WDT) += lenovo_se30_wdt.o
>   ifeq ($(CONFIG_ITCO_VENDOR_SUPPORT),y)
>   obj-$(CONFIG_ITCO_WDT) += iTCO_vendor_support.o
>   endif
> diff --git a/drivers/watchdog/lenovo_se30_wdt.c b/drivers/watchdog/lenovo_se30_wdt.c
> new file mode 100644
> index 000000000000..d119f6fe870a
> --- /dev/null
> +++ b/drivers/watchdog/lenovo_se30_wdt.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * WDT driver for Lenovo SE30 device
> + */
> +
> +#define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>

I don't see any ACPI code.

> +#include <linux/dmi.h>
> +#include <linux/delay.h>
> +#include <linux/iommu.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define IOREGION_OFFSET	4 /* Use EC port 1 */
> +#define IOREGION_LENGTH	4
> +
> +#define WATCHDOG_TIMEOUT 60
> +#define MIN_TIMEOUT 1

What is the point of a 1-second timeout if a ping can take up to 6 seconds ?

> +#define MAX_TIMEOUT 255
> +

Please use

#define<space>NAME<tab>value

for defines, and align the value.

> +static int timeout; /* in seconds */
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout,
> +		 "Watchdog timeout in seconds. 1 <= timeout <= 255, default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		 "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +#define LNV_SE30_NAME "lenovo-se30-wdt"
> +#define LNV_SE30_ID   0x0110
> +#define CHIPID_MASK   0xFFF0
> +
> +#define LNV_SE30_MAX_IO_RETRY_NUM 100
> +
> +#define CHIPID_REG   0x20
> +#define SIO_REG      0x2e
> +#define LDN_REG      0x07
> +#define UNLOCK_KEY   0x87
> +#define LOCK_KEY     0xAA
> +#define LD_NUM_SHM   0x0F
> +#define LD_BASE_ADDR 0xF8
> +
> +#define WDT_MODULE    0x10
> +#define WDT_CFG_INDEX 0x15 /* WD configuration register */
> +#define WDT_CNT_INDEX 0x16 /* WD timer count register */
> +#define WDT_CFG_RESET 0x2
> +
> +/* Host Interface WIN2 offset definition */
> +#define SHM_WIN_SIZE        0xFF
> +#define SHM_WIN_MOD_OFFSET  0x01
> +#define SHM_WIN_CMD_OFFSET  0x02
> +#define SHM_WIN_SEL_OFFSET  0x03
> +#define SHM_WIN_CTL_OFFSET  0x04
> +#define VAL_SHM_WIN_CTRL_WR 0x40
> +#define VAL_SHM_WIN_CTRL_RD 0x80
> +#define SHM_WIN_ID_OFFSET   0x08
> +#define SHM_WIN_DAT_OFFSET  0x10
> +
> +struct nct6692_shm {
> +	unsigned char __iomem *base_addr;
> +	unsigned long base_phys;
> +};
> +
> +struct nct6692_sio {
> +	unsigned long base_phys;
> +	int sioreg;
> +};
> +
> +struct nct6692_reg {
> +	unsigned char mod;
> +	unsigned char cmd;
> +	unsigned char sel;
> +	unsigned int idx;
> +};
> +
> +/* Watchdog is based on NCT6692 device */
> +struct lenovo_se30_wdt {
> +	struct nct6692_shm shm;
> +	struct nct6692_reg wdt_cfg;
> +	struct nct6692_reg wdt_cnt;
> +	struct nct6692_sio sio;
> +	struct watchdog_device wdt;
> +};
> +
> +static inline void superio_outb(int ioreg, int reg, int val)
> +{
> +	outb(reg, ioreg);
> +	outb(val, ioreg + 1);
> +}
> +
> +static inline int superio_inb(int ioreg, int reg)
> +{
> +	outb(reg, ioreg);
> +	return inb(ioreg + 1);
> +}
> +
> +static inline int superio_enter(int key, int addr, const char *name)
> +{
> +	if (!request_muxed_region(addr, 2, name)) {
> +		pr_err("I/O address 0x%04x already in use\n", addr);
> +		return -EBUSY;
> +	}
> +	outb(key, addr); /* Enter extended function mode */
> +	outb(key, addr); /* Again according to manual */
> +
> +	return 0;
> +}
> +
> +static inline void superio_exit(int key, int addr)
> +{
> +	outb(key, addr); /* Leave extended function mode */
> +	release_region(addr, 2);
> +}
> +
> +static int shm_get_ready(const struct nct6692_shm *shm,
> +			 const struct nct6692_reg *reg)
> +{
> +	unsigned char pre_id, new_id;
> +	int i;
> +
> +	iowrite8(reg->mod, shm->base_addr + SHM_WIN_MOD_OFFSET);
> +	iowrite8(reg->cmd, shm->base_addr + SHM_WIN_CMD_OFFSET);
> +	iowrite8(reg->sel, shm->base_addr + SHM_WIN_SEL_OFFSET);
> +
> +	pre_id = ioread8(shm->base_addr + SHM_WIN_ID_OFFSET);
> +	iowrite8(VAL_SHM_WIN_CTRL_RD, shm->base_addr + SHM_WIN_CTL_OFFSET);
> +
> +	/* Loop checking when interface is ready */
> +	for (i = 0; i < LNV_SE30_MAX_IO_RETRY_NUM; i++) {
> +		new_id = ioread8(shm->base_addr + SHM_WIN_ID_OFFSET);
> +		if (new_id != pre_id)
> +			return 0;
> +		msleep(20);

Can it really take up to 100 * 20 = 2,000 ms for the chip to become ready ?

It seems to me that this huge timeout makes the driver pretty much pointless.

> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int read_shm_win(const struct nct6692_shm *shm,
> +			const struct nct6692_reg *reg,
> +			unsigned char idx_offset,
> +			unsigned char *data)
> +{
> +	int err = shm_get_ready(shm, reg);
> +
> +	if (err)
> +		return err;
> +	*data = ioread8(shm->base_addr + SHM_WIN_DAT_OFFSET + reg->idx + idx_offset);
> +	return 0;
> +}
> +
> +static int write_shm_win(const struct nct6692_shm *shm,
> +			 const struct nct6692_reg *reg,
> +			 unsigned char idx_offset,
> +			 unsigned char val)
> +{
> +	int err = shm_get_ready(shm, reg);
> +
> +	if (err)
> +		return err;
> +	iowrite8(val, shm->base_addr + SHM_WIN_DAT_OFFSET + reg->idx + idx_offset);
> +	iowrite8(VAL_SHM_WIN_CTRL_WR, shm->base_addr + SHM_WIN_CTL_OFFSET);
> +	err = shm_get_ready(shm, reg);
> +	return err;
> +}
> +
> +static int lenovo_se30_wdt_enable(struct lenovo_se30_wdt *data, unsigned int timeout)
> +{
> +	if (timeout) {
> +		int err = write_shm_win(&data->shm, &data->wdt_cfg, 0, WDT_CFG_RESET);
> +
> +		if (err)
> +			return err;
> +	}
> +	return write_shm_win(&data->shm, &data->wdt_cnt, 0, timeout);
> +}
> +
> +static int lenovo_se30_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +	const struct nct6692_shm *shm = &data->shm;
> +	int err;
> +
> +	if (!request_mem_region(shm->base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
> +		return -EBUSY;
> +

Are any other drivers using this region ? If not, it would be better to
request the region once in the probe function. If there are other drivers
using it, why not use request_muxed_region() ?

> +	err = lenovo_se30_wdt_enable(data, wdog->timeout);
> +	release_mem_region(shm->base_phys, SHM_WIN_SIZE);
> +	return err;
> +}
> +
> +static int lenovo_se30_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +	const struct nct6692_shm *shm = &data->shm;
> +	int err;
> +
> +	if (!request_mem_region(shm->base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
> +		return -EBUSY;
> +
> +	err = lenovo_se30_wdt_enable(data, 0);
> +	release_mem_region(shm->base_phys, SHM_WIN_SIZE);
> +	return err;
> +}
> +
> +static int lenovo_se30_wdt_set_timeout(struct watchdog_device *wdog,
> +				       unsigned int timeout)
> +{
> +	wdog->timeout = timeout;
> +	return 0;
> +}
> +
> +static unsigned int lenovo_se30_wdt_get_timeleft(struct watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +	const struct nct6692_shm *shm = &data->shm;
> +	unsigned char timeleft;
> +	int err;
> +
> +	if (!request_mem_region(shm->base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
> +		return -EBUSY;
> +
> +	err = read_shm_win(&data->shm, &data->wdt_cnt, 0, &timeleft);
> +	release_mem_region(shm->base_phys, SHM_WIN_SIZE);
> +	if (err)
> +		return 0;
> +	return timeleft;
> +}
> +
> +static int lenovo_se30_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdt);
> +	const struct nct6692_shm *shm = &data->shm;
> +	int err = 0;
> +
> +	if (!request_mem_region(shm->base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
> +		return -EBUSY;
> +
> +	/*
> +	 * Device does not support refreshing WDT_TIMER_REG register when
> +	 * the watchdog is active.  Need to disable, feed and enable again
> +	 */

Seriously ? With the huge timeouts associated with each write, that can
cause the watchdog to be disabled for each ping for several seconds.
Diasabling can cause a delay of 2 seconds, plus four more seconds for
re-enabling it. Is that even worth the trouble of providing a watchdog ?

> +	err = lenovo_se30_wdt_enable(data, 0);
> +	if (err)
> +		return err;

This leaves the memory region unreleased.

> +
> +	err = write_shm_win(&data->shm, &data->wdt_cnt, 0, wdt->timeout);
> +	if (!err)
> +		err = lenovo_se30_wdt_enable(data, wdt->timeout);
> +
> +	release_mem_region(shm->base_phys, SHM_WIN_SIZE);
> +	return err;
> +}
> +
> +static const struct watchdog_info lenovo_se30_wdt_info = {
> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +	.identity	= "Lenovo SE30 watchdog",
> +};
> +
> +static const struct watchdog_ops lenovo_se30_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= lenovo_se30_wdt_start,
> +	.stop		= lenovo_se30_wdt_stop,
> +	.ping		= lenovo_se30_wdt_ping,
> +	.set_timeout	= lenovo_se30_wdt_set_timeout,
> +	.get_timeleft	= lenovo_se30_wdt_get_timeleft,
> +};
> +
> +static int lenovo_se30_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lenovo_se30_wdt *priv;
> +	unsigned long base_phys;
> +	unsigned short val;
> +	int err;
> +
> +	err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
> +	if (err)
> +		return err;
> +
> +	val = superio_inb(SIO_REG, CHIPID_REG) << 8;
> +	val |= superio_inb(SIO_REG, CHIPID_REG + 1);
> +
> +	if ((val & CHIPID_MASK) != LNV_SE30_ID) {
> +		superio_exit(LOCK_KEY, SIO_REG);
> +		return -ENODEV;
> +	}
> +
> +	superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
> +	base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
> +			0xFFFFFFFF;
> +
> +	superio_exit(LOCK_KEY, SIO_REG);
> +	if (base_phys == 0xFFFFFFFF || base_phys == 0)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->sio.base_phys = base_phys;
> +	priv->shm.base_phys = base_phys;
> +	priv->shm.base_addr = ioremap_cache(priv->shm.base_phys, SHM_WIN_SIZE);
> +
> +	priv->wdt_cfg.mod = WDT_MODULE;
> +	priv->wdt_cfg.idx = WDT_CFG_INDEX;
> +	priv->wdt_cnt.mod = WDT_MODULE;
> +	priv->wdt_cnt.idx = WDT_CNT_INDEX;
> +
> +	priv->wdt.ops = &lenovo_se30_wdt_ops;
> +	priv->wdt.info = &lenovo_se30_wdt_info;
> +	priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
> +	priv->wdt.min_timeout = MIN_TIMEOUT;
> +	priv->wdt.max_timeout = MAX_TIMEOUT;
> +	priv->wdt.parent = dev;
> +
> +	watchdog_init_timeout(&priv->wdt, timeout, dev);
> +	watchdog_set_drvdata(&priv->wdt, priv);
> +	watchdog_set_nowayout(&priv->wdt, nowayout);
> +	watchdog_stop_on_reboot(&priv->wdt);
> +	watchdog_stop_on_unregister(&priv->wdt);
> +
> +	return devm_watchdog_register_device(dev, &priv->wdt);
> +}
> +
> +static struct platform_device *pdev;
> +
> +static struct platform_driver lenovo_se30_wdt_driver = {
> +	.driver = {
> +		.name = LNV_SE30_NAME,
> +	},
> +	.probe  = lenovo_se30_wdt_probe,
> +};
> +
> +static int lenovo_se30_create_platform_device(const struct dmi_system_id *id)
> +{
> +	int err;
> +
> +	pdev = platform_device_alloc(LNV_SE30_NAME, -1);
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	err = platform_device_add(pdev);
> +	if (err)
> +		platform_device_put(pdev);
> +
> +	return err;
> +}
> +
> +static const struct dmi_system_id lenovo_se30_wdt_dmi_table[] __initconst = {
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NA"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NB"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NC"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NH"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NJ"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NK"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, lenovo_se30_wdt_dmi_table);
> +
> +static int __init lenovo_se30_wdt_init(void)
> +{
> +	if (!dmi_check_system(lenovo_se30_wdt_dmi_table))
> +		return -ENODEV;
> +
> +	return platform_driver_register(&lenovo_se30_wdt_driver);
> +}
> +
> +static void __exit lenovo_se30_wdt_exit(void)
> +{
> +	if (pdev)
> +		platform_device_unregister(pdev);
> +	platform_driver_unregister(&lenovo_se30_wdt_driver);
> +}
> +
> +module_init(lenovo_se30_wdt_init);
> +module_exit(lenovo_se30_wdt_exit);
> +
> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
> +MODULE_AUTHOR("David Ober <dober@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo SE30 watchdog driver");
> +MODULE_LICENSE("GPL");


