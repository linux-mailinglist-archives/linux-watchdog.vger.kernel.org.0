Return-Path: <linux-watchdog+bounces-4898-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL5pBdkdg2nWhwMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4898-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 11:22:17 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9BE46C2
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 11:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0658A3015D22
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Feb 2026 10:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FC33D7D96;
	Wed,  4 Feb 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsdVwZjR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238633D7D7A
	for <linux-watchdog@vger.kernel.org>; Wed,  4 Feb 2026 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200466; cv=none; b=uu1eSoRMiBgSrDIa89rIHeqyFDjIYyCmY6iT+mdRlEhiutcTG/iw+cj8ob8Ni7cfXx1hSsdTNrsC5mD4GG09cuOk3TkwEl3wcESeihtowGCcdaeBCYjc+U0yI8Z+nfYXnpUqRXJC78Xp5UJI2FkhaU9MJpZbTfwAeWVRoeY41fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200466; c=relaxed/simple;
	bh=Hj7x3CQjfXXL9ZenZPjtTI8pLd5bZeX0sDzqTErLSIc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOnQUr/GrwdNslzP2szhEh8jbdcUXJPKkRCB+yA08ZvR/JFWxjp8gAX1cWa2BoLj5CC6d4DYm+QdP0K166UxBLdeJA1DTxCw4Tq6cEL5K1nZRyU9xQJrCJ14Xw2C95LV/77v2SE/Sh5FBSPwv4HqEmsJ7UlMCvE16X9gtp4e/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsdVwZjR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058B2C2BCB2
	for <linux-watchdog@vger.kernel.org>; Wed,  4 Feb 2026 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770200466;
	bh=Hj7x3CQjfXXL9ZenZPjtTI8pLd5bZeX0sDzqTErLSIc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GsdVwZjRIoAf5b2E5xb1KsHkGZDvLiCqSfzoO2LaoDlAZqFw6XVTdZaYAm9F3iJoK
	 GVz35wCguOLlek4JteZ+KM8rrRufUCKCCU5vOj/yS9RGaSx5nkumfaoo/HFOA4keiY
	 EG1gQ1jY/9zn+cWhPWxt/Ae6dOhKrJ0YcOwb+4FfFD5s+0lXgnjr3cGlo9UXsT+ISQ
	 Ab4DNiaV+duB3OFIwyhGCYYAdpqUj0eNr2ZSVDwRewW4ro7dspsoPlUQaCpN/3zSDF
	 hxm3PNLPPQtMr7xpb0pPulODvSdED3LvRQbA5Pzalx1G84+bRH4yUNzfvEucHy6JF4
	 Y6vaQjiBpuNJA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-383153e06d6so60276331fa.0
        for <linux-watchdog@vger.kernel.org>; Wed, 04 Feb 2026 02:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXYbFFKwsPAI1JVna7VO0hTwjTvwKbItHBGIwlaKL8tUhiNCrASLn+PJfX+SqXnaYqgEkwbwhaWJ3L1EKaKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR9NAKhUq15GaHrwUWPAS3wx0BsD1GqXKdE7U5ySBiFaUvYeag
	RpP+oZrhRcMpry+CSCUuS3m8uoFb8pVfrim5ILafUMLu1HQ+NPCPyhZFtgILfv1vZq3mHFsBLyo
	hwVtHX8jk/SSaKjCcyMEuPxbCOJEEPW7Lkt5VVoZR6g==
X-Received: by 2002:a05:651c:41d6:b0:383:1232:379a with SMTP id
 38308e7fff4ca-38691c5dea5mr11058671fa.2.1770200464304; Wed, 04 Feb 2026
 02:21:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:21:02 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:21:02 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-3-0a19432076ac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com> <20260203-dev-b4-aaeon-mcu-driver-v3-3-0a19432076ac@bootlin.com>
Date: Wed, 4 Feb 2026 05:21:02 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeJ+WdsYXpwW2dRVXYQGoXfHw1EQ4TqbHJph6-H6zy-uA@mail.gmail.com>
X-Gm-Features: AZwV_QilL0KBTJiJFRhGwOT3AJqFCpnUraNwgkBHTK4L_FTOjWvtlMKtC9O-nuQ
Message-ID: <CAMRc=MeJ+WdsYXpwW2dRVXYQGoXfHw1EQ4TqbHJph6-H6zy-uA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4898-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7C9BE46C2
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 17:21:12 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
>
> The MCU firmware version is queried during probe and logged for
> diagnostic purposes. All I2C transactions are serialized using a mutex
> to ensure proper communication with the microcontroller.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/mfd/Kconfig           |  10 +++
>  drivers/mfd/Makefile          |   2 +
>  drivers/mfd/aaeon-mcu.c       | 137 ++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/aaeon-mcu.h |  20 ++++++
>  5 files changed, 171 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221=
f6c8e8a3652cd77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> +F:	drivers/mfd/aaeon-mcu.c
> +F:	include/linux/mfd/aaeon-mcu.h
>
>  AAEON UPBOARD FPGA MFD DRIVER
>  M:	Thomas Richard <thomas.richard@bootlin.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe=
7b1c91b72253c05 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1574,6 +1574,16 @@ config AB8500_CORE
>  	  the irq_chip parts for handling the Mixed Signal chip events.
>  	  This chip embeds various other multimedia functionalities as well.
>
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  Select this option to enable support for the Aaeon SRG-IMX8P
> +	  onboard microcontroller (MCU). This driver provides the core
> +	  functionality to communicate with the MCU over I2C. The MCU
> +	  provides GPIO and watchdog functionality.
> +
>  config MFD_DB8500_PRCMU
>  	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
>  	depends on UX500_SOC_DB8500
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28afae975ac61d282b3b85af5440119..0bc3a10c787c55730131224fc=
1053fe35657dd71 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+=3D rsmu_spi.o rsmu_core.=
o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+=3D upboard-fpga.o
>
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+=3D loongson-se.o
> +
> +obj-$(CONFIG_MFD_AAEON_MCU)	+=3D aaeon-mcu.o
> diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4f2420668106453549ab42888=
bbfd50363bdfc45
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#define AAEON_MCU_FW_VERSION	0x76
> +
> +/**
> + * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
> + * @dev: Pointer to kernel device structure
> + * @i2c_lock: Mutex to serialize I2C bus access
> + */
> +struct aaeon_mcu_dev {
> +	struct device *dev;
> +	struct mutex i2c_lock;

If you wrapped your client in an i2c regmap, you could drop this mutex and
subsequently the entire structure making your driver even smaller.

> +};
> +
> +static const struct mfd_cell aaeon_mcu_devs[] =3D {
> +	{
> +		.name =3D "aaeon-mcu-wdt",
> +	},
> +	{
> +		.name =3D "aaeon-mcu-gpio",
> +	},
> +};
> +
> +static int aaeon_mcu_read_version(struct device *dev, u8 index, u8 *vers=
ion)
> +{
> +	u8 cmd[3] =3D { AAEON_MCU_FW_VERSION, index, 0x00 };
> +
> +	return aaeon_mcu_i2c_xfer(dev, cmd, sizeof(cmd), version, sizeof(*versi=
on));
> +}
> +
> +static int aaeon_mcu_print_fw_version(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	u8 major, minor;
> +	int ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x00, &major);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aaeon_mcu_read_version(dev, 0x01, &minor);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "firmware version: v%d.%d\n", major, minor);
> +

Do we *really* need this? If you'd at least used this to change the behavio=
r
of the driver or check if the version is supported, but you just read it an=
d
never use it. I'd drop this and aaeon_mcu_read_version() above. That would =
make
the driver even smallerer.

> +	return 0;
> +}
> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct aaeon_mcu_dev *mcu =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	guard(mutex)(&mcu->i2c_lock);
> +
> +	ret =3D i2c_master_send(client, cmd, cmd_len);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D i2c_master_recv(client, rsp, rsp_len);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret !=3D rsp_len) {
> +		dev_err(dev,
> +			"i2c recv count error (expected: %d, actual: %d)\n",
> +			rsp_len, ret);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu_dev *mcu;
> +	int ret;
> +
> +	mcu =3D devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, mcu);
> +	mcu->dev =3D &client->dev;
> +
> +	ret =3D devm_mutex_init(&client->dev, &mcu->i2c_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aaeon_mcu_print_fw_version(client);
> +	if (ret) {
> +		dev_err(&client->dev, "unable to read firmware version\n");
> +		return ret;
> +	}
> +
> +	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_de=
vs,
> +				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] =3D {
> +	{ .compatible =3D "aaeon,srg-imx8p-mcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver =3D {
> +	.driver =3D {
> +		.name =3D "aaeon_mcu",
> +		.of_match_table =3D aaeon_mcu_of_match,
> +	},
> +	.probe =3D aaeon_mcu_probe,
> +};
> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootli=
n.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.=
h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2e9f5f316f33b70c732faa850=
576cee596455dab
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: J=C3=A9r=C3=A9mie Dautheribes <jeremie.dautheribes@bootlin.co=
m>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +#include <linux/device.h>

Don't pull this in if you don't need to know the layout of the structure. J=
ust
use a forward declaration for struct device.

> +#include <linux/types.h>
> +
> +int aaeon_mcu_i2c_xfer(struct device *dev,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len);
> +
> +#endif /*  __LINUX_MFD_AAEON_MCU_H */
>
> --
> 2.52.0
>
>

Bartosz

