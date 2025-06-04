Return-Path: <linux-watchdog+bounces-3622-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8CACDBB0
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 12:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE40169DE7
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Jun 2025 10:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B7828D8D0;
	Wed,  4 Jun 2025 10:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MYITG1KW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6528D8D5
	for <linux-watchdog@vger.kernel.org>; Wed,  4 Jun 2025 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031905; cv=none; b=sVLtbk73qu6UMXoOtAwLGqrQc3R58qhbCbYXcERYING6WO/AIgmwMrDLSDe0EwKdBoanRY0L/tGempj9LzKA9F6p4VXKP0JshGEu+6gZ+voyB+e6smnSP04YjTaSJ7Vv3pCzujBMzWqOeNLbIJc9lGHalcPkgApyeqLQDgLubYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031905; c=relaxed/simple;
	bh=bMz8PIBAQbrvx8Djn/oBl8MxTjTq84wAVZa1BcDfmSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UouLyuLmPnGPh8W6NJgq6Xk8PPvQxWNWNpS2b6DqRY2Y/RGXT1xb9k1ihYkP7xd/uKQH4hBXoMPPOv+Si0dT4DYZXBr6bBl/uIfpoQLDTxuGnoMLg6MjaSX8PbJqlSpOwJeqeaP5c2M7pKDbJfqW1AXidrQ+f4CyumyI97sBgpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MYITG1KW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad89ee255easo1199601666b.3
        for <linux-watchdog@vger.kernel.org>; Wed, 04 Jun 2025 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749031900; x=1749636700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWPoWbzUhmp2RDptwz5xvj52B4NS6cLJTvzVIv/q4Ys=;
        b=MYITG1KW2pDdcyH0HIRjSnh29SjV6H0LusgszbnRgJmvAPA6jn2WewC8cAHg1Nr+De
         l7PtwxmbFx1veP94y3WcND0QBPLjRHpiVJKv9HR4ZbyXFO/oq4UMXVS7H2Pd+RnbYRl0
         7hRGDvoPtpsxUucOik1NfinqsvY1s0FsUtfVfS7JyhNrlk6TwVPzAiiRdI5Rt3TMGop2
         TKZDXxPupvVlvfiVs/IQPVaz2MSGbdFc/4AFy3n1ukHCHXsRWxRcv1GD9VHKdhzaTuVJ
         G1HI3rJJmo3NMHAg1IKCngyMi4EqC3Ax0efTG8iC03dpaRpkSPy7Yrky4fgWB6nOlM08
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031900; x=1749636700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWPoWbzUhmp2RDptwz5xvj52B4NS6cLJTvzVIv/q4Ys=;
        b=L2GGPJ6HuXFsKi5tP3LsHC25N+vCpV4/qFsDmY/UOFEJT+3oMH1fOygG978NVQTAW7
         H+POTECFj9iTNUbZFlygNGsJKaW71nkHZKy1bcCzW/bhRYqrLnOIfjnZXnk0tFGA51xv
         IJpUiTl36fxEJVW1SK5pSpz76FKJ+nTJ/mMdESqm+h8mhxDEAB3b/dIVkZv/ud09m8o7
         wIN54cyppekuN7Eu2k9Ctxgpg1RTT5t4TUijsTCaUKW5/BrRjkhHuy15ZFgOxFcnBrLO
         gQ5/LCn2PIoNwaa6mdwi2PEh0yAzxcV5qZi2JFIicXtGmTBh2NEkOme0hicRXl3TjAB6
         pVmA==
X-Forwarded-Encrypted: i=1; AJvYcCU/hVHLtDG8cBNoG7x426nIB+e9+hpKfVor/x0WBJj8A97ZLwCOxNEKHC4Je/WwPpLBvlvxbp4EVwQJfN4/IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYHPmqKmVsCKrFLcZYJdickSW81DrRgGxz8DgyFUnVCQBncah
	UoY+onLlBnU25beY6wugJOJIJKziekj3uPIbDYC7R+wn6ABHl9BzvV/bbnvWiZkP1f8=
X-Gm-Gg: ASbGnctL4M/lRrXGHvFWjIUzQenKCMjAcHajQRCJC177nO7BVkMSEuiVaMNEAOVfkR9
	UOj4nf2bY9hoLi2w9JrhNqhDc0P34PeNqV0yQkvFuoj5zlSyJevmV5+L1pQu0zUB9fRCv2PjNC8
	mfg01MSkAXzk1M5m9LLZ6qyNfU+NSOt8R5LJnp3Kmznai4n1r0z7t9hb1Q5Hx+5zaXpU8u4DBJg
	RIJZI59FfkDZnDnELSpSGwLeTnWHVsfGedwzeHSlaVLGyCbnTt0qvVm8MmXeTUfrYlXpyV6K2Og
	LOFtBvzqbtce9N3ueiVXsX8ZBxZtTHq/6O7hdygnhWEBkhF+uaNdmVw+NY276JmnXCabpfn8aT8
	t2RW5WEvbeIO9HhkQdw==
X-Google-Smtp-Source: AGHT+IEN7+lUvVjlo5WrsWRuQY/5JwNtTIftyeq/8cm9Qk7+1lHTStjH4l2FSVtegPvjKCRSAb2npw==
X-Received: by 2002:a17:906:7b56:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-addf8ebb630mr142177666b.36.1749031899644;
        Wed, 04 Jun 2025 03:11:39 -0700 (PDT)
Received: from ?IPV6:2001:a61:13e2:3601:e970:9c8e:9666:22ea? ([2001:a61:13e2:3601:e970:9c8e:9666:22ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb325c829csm920799566b.145.2025.06.04.03.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:11:39 -0700 (PDT)
Message-ID: <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com>
Date: Wed, 4 Jun 2025 12:11:36 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: a0282524688@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250604041418.1188792-1-tmyu0@nuvoton.com>
 <20250604041418.1188792-2-tmyu0@nuvoton.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250604041418.1188792-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 06:14, a0282524688@gmail.com wrote:
> From: Ming Yu <tmyu0@nuvoton.com>
> 
> The Nuvoton NCT6694 provides an USB interface to the host to
> access its features.
> 
> Sub-devices can use the USB functions nct6694_read_msg() and
> nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
> 
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
> Changes since version 11:
> - Modify the irq_domain_add_simple() to irq_domain_create_simple()
> - Fix mfd_cell back to v9, and use Use platform_device's id to replace IDA
>    in sub-drivers
> 
> Changes since version 10:
> - Add change log for the patch
> - Fix mfd_cell to MFD_CELL_NAME()
> - Remove unnecessary blank line
> 
> Changes since version 9:
> - Add KernelDoc to exported functions
> 
> Changes since version 8:
> - Modify the signed-off-by with my work address
> - Rename all MFD cell names to "nct6694-xxx"
> - Fix some comments in nct6694.c and in nct6694.h
> 
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> 
> Changes since version 6:
> 
> Changes since version 5:
> - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> - Drop unnecessary macros
> 
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> 
> Changes since version 3:
> - Modify array buffer to structure
> - Fix defines and comments
> - Add header <linux/bits.h> and use BIT macro
> - Modify mutex_init() to devm_mutex_init()
> 
> Changes since version 2:
> 
> Changes since version 1:
> - Implement IRQ domain to handle IRQ demux
> - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API
> - Add command structure
> - Fix USB functions
> - Sort each driver's header files alphabetically
> 
>   MAINTAINERS                 |   6 +
>   drivers/mfd/Kconfig         |  15 ++
>   drivers/mfd/Makefile        |   2 +
>   drivers/mfd/nct6694.c       | 386 ++++++++++++++++++++++++++++++++++++
>   include/linux/mfd/nct6694.h |  98 +++++++++
>   5 files changed, 507 insertions(+)
>   create mode 100644 drivers/mfd/nct6694.c
>   create mode 100644 include/linux/mfd/nct6694.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98201e1f4ab5..29d2d05bac22 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17679,6 +17679,12 @@ F:	drivers/nubus/
>   F:	include/linux/nubus.h
>   F:	include/uapi/linux/nubus.h
>   
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>   NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>   M:	Antonino Daplas <adaplas@gmail.com>
>   L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 96992af22565..489c1950f1ac 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1078,6 +1078,21 @@ config MFD_MENF21BMC
>   	  This driver can also be built as a module. If so the module
>   	  will be called menf21bmc.
>   
> +config MFD_NCT6694
> +	tristate "Nuvoton NCT6694 support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This enables support for the Nuvoton USB device NCT6694, which shares
> +	  peripherals.
> +	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> +	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> +	  PWM, and RTC.
> +	  This driver provides core APIs to access the NCT6694 hardware
> +	  monitoring and control features.
> +	  Additional drivers must be enabled to utilize the specific
> +	  functionalities of the device.
> +
>   config MFD_OCELOT
>   	tristate "Microsemi Ocelot External Control Support"
>   	depends on SPI_MASTER
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 5e5cc279af60..a96204d938fc 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>   obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>   obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>   
> +obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> +
>   obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
>   
>   ocelot-soc-objs			:= ocelot-core.o ocelot-spi.o
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> new file mode 100644
> index 000000000000..82d378ee47ed
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Nuvoton Technology Corp.
> + *
> + * Nuvoton NCT6694 core driver using USB interface to provide
> + * access to the NCT6694 hardware monitoring and control features.
> + *
> + * The NCT6694 is an integrated controller that provides GPIO, I2C,
> + * CAN, WDT, HWMON and RTC management.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/usb.h>
> +
> +static const struct mfd_cell nct6694_devs[] = {
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> +	MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> +
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> +	MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> +
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
> +	MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
> +
> +	MFD_CELL_NAME("nct6694-hwmon"),
> +
> +	MFD_CELL_NAME("nct6694-rtc"),
> +};
> +
> +static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char err_status)
> +{
> +	switch (err_status) {
> +	case NCT6694_NO_ERROR:
> +		return 0;
> +	case NCT6694_NOT_SUPPORT_ERROR:
> +		dev_err(nct6694->dev, "Command is not supported!\n");
> +		break;
> +	case NCT6694_NO_RESPONSE_ERROR:
> +		dev_warn(nct6694->dev, "Command received no response!\n");
> +		break;
> +	case NCT6694_TIMEOUT_ERROR:
> +		dev_warn(nct6694->dev, "Command timed out!\n");
> +		break;
> +	case NCT6694_PENDING:
> +		dev_err(nct6694->dev, "Command is pending!\n");
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EIO;
> +}
> +
> +/**
> + * nct6694_read_msg() - Read message from NCT6694 device
> + * @nct6694: NCT6694 device pointer
> + * @cmd_hd: command header structure
> + * @buf: buffer to store the response data
> + *
> + * Sends a command to the NCT6694 device and reads the response.
> + * The command header is specified in @cmd_hd, and the response
> + * data is stored in @buf.
> + *
> + * Return: Negative value on error or 0 on success.
> + */
> +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
> +
> +	/* Send command packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
> +			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
> +			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL_GPL(nct6694_read_msg);
> +
> +/**
> + * nct6694_write_msg() - Write message to NCT6694 device
> + * @nct6694: NCT6694 device pointer
> + * @cmd_hd: command header structure
> + * @buf: buffer containing the data to be sent
> + *
> + * Sends a command to the NCT6694 device and writes the data
> + * from @buf. The command header is specified in @cmd_hd.
> + *
> + * Return: Negative value on error or 0 on success.
> + */
> +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
> +
> +	/* Send command packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
> +			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Send data packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
> +			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL_GPL(nct6694_write_msg);
> +
> +static void usb_int_callback(struct urb *urb)
> +{
> +	struct nct6694 *nct6694 = urb->context;
> +	unsigned int *int_status = urb->transfer_buffer;
> +	int ret;
> +
> +	switch (urb->status) {
> +	case 0:
> +		break;
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		return;
> +	default:
> +		goto resubmit;
> +	}
> +
> +	while (*int_status) {
> +		int irq = __ffs(*int_status);
> +
> +		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> +		*int_status &= ~BIT(irq);
> +	}

Does modifying the byte have any benefit?

> +resubmit:
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret)
> +		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
> +}
> +
> +static void nct6694_irq_lock(struct irq_data *data)
> +{
> +	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&nct6694->irq_lock);
> +}

Why? Does this do anything but make it _harder_ to tell that you
cannot take the lock in interrupt?

	Regards
		Oliver


