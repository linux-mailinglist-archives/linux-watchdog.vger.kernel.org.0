Return-Path: <linux-watchdog+bounces-2511-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD579EAE40
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 11:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D791889911
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 10:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3282C210F62;
	Tue, 10 Dec 2024 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdmcqLBv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C5C210F56;
	Tue, 10 Dec 2024 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827562; cv=none; b=XKx+BFxw+zcaHw41FFiJXBG06d9gftksfCOGhV1+3j47d/U4m7r+Ikr6hViqUZCvK9KyFyIsjjRxCreczrPQYGOHD9kZUOYYiZH8uAo/eptI959YXbAzMmptMvL5OcDiCneTOEadO0Tpi+m8X7850pEi30VE/lUQKDmOhHRCmfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827562; c=relaxed/simple;
	bh=1Ad7boXiK81bBb4hrpnHXDp6RHFHSLujsHdBxtE9+dc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gdw04ySkzOtbb5Sa58FbLDl3x6VvfBAHT2D/ooD4OME7SaEZHuvsZOtj3EP30etN0PYjJf5UinKJ082FOnoy7DMBC6zwUg4qIMpvPOiKUzlW6G2O1pFiL3tzCg+hXdGbeaDdUSp5EBXCYFqzp7I8uVr+pYrosFVNl6x52U3PE+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdmcqLBv; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216585cbe1eso17452175ad.3;
        Tue, 10 Dec 2024 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733827559; x=1734432359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QRLyHmPfdTDtbGtNfafkBqirNBX/D0Qp3Sa4aEfp6A=;
        b=CdmcqLBv6UWVQD2NDgveuNIp3ZTrqwh2wadw0x7s4R5Lio2pHJtzWJTZFnU3JrOkLp
         INNj6W9m7K9rG9gMjfta6O+I62pof6zgnwggvdu4rDKgh+uprPJhif+QG5jtKTxY7cbr
         /vE4dzeB6xzbBCH0ZHht/W3umsipwcUVUwJEWJMhdgk2ZD21kN7CmbDGDlVzOYz2dL9Y
         CNXtUpa2j0I6XTUGLDQ5KALhg3zfFfk1NDWWNhQFRGAMiAxOKJFT0fS7rH2JRWLdeJkY
         pVjyT1ZWypat+9T1q5AZHzL17P+gR1bnv9fSP7TmSwKhUqU1tYP31HwNd1yc8QK7gx9i
         BB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827559; x=1734432359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QRLyHmPfdTDtbGtNfafkBqirNBX/D0Qp3Sa4aEfp6A=;
        b=uS3tnGIQxQEU3B+erSc932HRZuJIicDeF75CeVg/r9cmHRdLnaW23MKtOTWdX/3vq3
         ySjgx6yAJKwr/9zH8JlSRPVEV9G2GLhUnBJkXvO5lFufD9Y+IIY21MzUmFki7lgn+lQp
         3aeSvuuqhQbGLNPfcOhf2RqPPvqFqUzJ2OpePQtaskR1uOr3nr70UYH1OgpizARs3iOX
         fJI/YWSyKGKdnRpxGENagkQVOxTArozfQaoSocAqxM7xdOnKSHW6wOKHmjamFOTuHUFx
         AGIxl1w3Vj9fVabxVYMA68DqEH3Wz2iqusgYkOUBMyZmr7KANwUQzXjurCijrtgibAN6
         M07A==
X-Forwarded-Encrypted: i=1; AJvYcCU/rIdliBg6xYjOB2ttZ0JlTh4y5Xrvrrvqj/KntLtVrg4NLmt55TBIeK+b2vkjrQSlPaWBTnvuOYaiR5vXo50=@vger.kernel.org, AJvYcCV5kQDdv7f2rshalcOntsNVDbANFrgtr+kys3O03nWIT0lNi3iTP4SRofHkyZ3VMTeL53dIJJFWohkBVA==@vger.kernel.org, AJvYcCVFgHekMlwEMu2bsDtxb7A4Bb1/Z1GSDJr2DY5OSs/idPCzHoyh6VcLisr0WJH8j6/x8kGRIc73QgGW@vger.kernel.org, AJvYcCVgT4HOEwhb3YxBGZ+R/HMnnz3ysR/xIuJ+a5NzG2IgWmRxMLlI74qg+CJnqnV/5zZc8qlOe56EDp6t@vger.kernel.org, AJvYcCWGCoYNvEcl2m2lgw8V+agnmiueEd8TobqAoBqA1qTSFpuJ1SmggA7/Y4hMTT1q7Tj8BTpv13D6zKU=@vger.kernel.org, AJvYcCWRm/YMWwUaU2/gKeILTVUwbGyM9qtilRQ8MKdayw1uPkpFgoSb4tGQZvdEfsNTtEc1SC3J5s/3HtIGHZE=@vger.kernel.org, AJvYcCXmyL18meIAwHEJ+vtrmZEKM/+89GT4ww84OPEPalkiCKS5SC9QkL1t2QQrLw7B2t7iaEXVVSfH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxff66VF3EL62HRAimwn3ieKpWXX6A2Z11tS/TjpvLOpV8O1Xk7
	7RWYk269xf+UYfxV1s08raVfK6VpjsIPxbbcAiFI7ipbeJc8klTr
X-Gm-Gg: ASbGnctnzDP1olQElO4uEGDEAldBBBbcvFO+5hh2/hCBiw6BePc02wXSV9jqJ+98lSZ
	rd9i1hwofu0G3sOIkx689q6kNhhRhJ0UnEd+a3lYeV10AUUaXCa5zfHalp2XnINbjHNX4SnPDH/
	hjkN6twEZBn4DRiexSOq1+eg/xDUEfxKvA0d/Ots7B7n/ez2hS9x+2pM3RnrFGGUZrlufMBJ7Nv
	VX/Yo+b260SbRWODxSVdfqqc6QRxc8JCCtHefxX3CsaJQwtQZ7Hl4Env66ZG2GF5SQ8nq3pVppW
	bsBZwXuWBSrMY7+X
X-Google-Smtp-Source: AGHT+IHn9mqJD07SJyP8cMSSSwYwXVCXtC2PdqAWUP6+6HfZMLdvG9dAlUunocLf+it+I1uu3tnqOg==
X-Received: by 2002:a17:902:d503:b0:216:2f91:92c7 with SMTP id d9443c01a7336-21669f98769mr64686235ad.12.1733827559203;
        Tue, 10 Dec 2024 02:45:59 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156dfe2fsm8905748a12.31.2024.12.10.02.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 02:45:58 -0800 (PST)
From: Ming Yu <a0282524688@gmail.com>
X-Google-Original-From: Ming Yu <tmyu0@nuvoton.com>
To: tmyu0@nuvoton.com,
	lee@kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andi.shyti@kernel.org,
	mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
Date: Tue, 10 Dec 2024 18:45:18 +0800
Message-Id: <20241210104524.2466586-2-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210104524.2466586-1-tmyu0@nuvoton.com>
References: <20241210104524.2466586-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
PWM, and RTC.

This driver implements USB device functionality and shares the
chip's peripherals as a child device.

Each child device can use the USB functions nct6694_read_msg()
and nct6694_write_msg() to issue a command. They can also request
interrupt that will be called when the USB device receives its
interrupt pipe.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                 |   7 +
 drivers/mfd/Kconfig         |  10 +
 drivers/mfd/Makefile        |   2 +
 drivers/mfd/nct6694.c       | 382 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/nct6694.h | 139 +++++++++++++
 5 files changed, 540 insertions(+)
 create mode 100644 drivers/mfd/nct6694.c
 create mode 100644 include/linux/mfd/nct6694.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 67d2159406c2..9c9a94ff8f98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16541,6 +16541,13 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON NCT6694 MFD DRIVER
+M:	Ming Yu <tmyu0@nuvoton.com>
+L:	linux-kernel@vger.kernel.org
+S:	Supported
+F:	drivers/mfd/nct6694.c
+F:	include/linux/mfd/nct6694.h
+
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
 M:	Antonino Daplas <adaplas@gmail.com>
 L:	linux-fbdev@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 03c1e4e3eea4..07ccc32f9985 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -558,6 +558,16 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_NCT6694
+	tristate "Nuvoton NCT6694 support"
+	select MFD_CORE
+	depends on USB
+	help
+	  This adds support for Nuvoton USB device NCT6694 sharing peripherals
+	  This includes the USB devcie driver and core APIs.
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_HI6421_PMIC
 	tristate "HiSilicon Hi6421 PMU/Codec IC"
 	depends on OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e057d6d6faef..9d0365ba6a26 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -117,6 +117,8 @@ obj-$(CONFIG_TWL6040_CORE)	+= twl6040.o
 
 obj-$(CONFIG_MFD_MX25_TSADC)	+= fsl-imx25-tsadc.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+
 obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
new file mode 100644
index 000000000000..071333d13eae
--- /dev/null
+++ b/drivers/mfd/nct6694.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton NCT6694 MFD driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+
+#define MFD_DEV_SIMPLE(_name)				\
+{							\
+	.name = NCT6694_DEV_##_name,			\
+}							\
+
+#define MFD_DEV_WITH_ID(_name, _id)			\
+{							\
+	.name = NCT6694_DEV_##_name,			\
+	.id = _id,					\
+}
+
+/* MFD device resources */
+static const struct mfd_cell nct6694_dev[] = {
+	MFD_DEV_WITH_ID(GPIO, 0x0),
+	MFD_DEV_WITH_ID(GPIO, 0x1),
+	MFD_DEV_WITH_ID(GPIO, 0x2),
+	MFD_DEV_WITH_ID(GPIO, 0x3),
+	MFD_DEV_WITH_ID(GPIO, 0x4),
+	MFD_DEV_WITH_ID(GPIO, 0x5),
+	MFD_DEV_WITH_ID(GPIO, 0x6),
+	MFD_DEV_WITH_ID(GPIO, 0x7),
+	MFD_DEV_WITH_ID(GPIO, 0x8),
+	MFD_DEV_WITH_ID(GPIO, 0x9),
+	MFD_DEV_WITH_ID(GPIO, 0xA),
+	MFD_DEV_WITH_ID(GPIO, 0xB),
+	MFD_DEV_WITH_ID(GPIO, 0xC),
+	MFD_DEV_WITH_ID(GPIO, 0xD),
+	MFD_DEV_WITH_ID(GPIO, 0xE),
+	MFD_DEV_WITH_ID(GPIO, 0xF),
+
+	MFD_DEV_WITH_ID(I2C, 0x0),
+	MFD_DEV_WITH_ID(I2C, 0x1),
+	MFD_DEV_WITH_ID(I2C, 0x2),
+	MFD_DEV_WITH_ID(I2C, 0x3),
+	MFD_DEV_WITH_ID(I2C, 0x4),
+	MFD_DEV_WITH_ID(I2C, 0x5),
+
+	MFD_DEV_WITH_ID(CAN, 0x0),
+	MFD_DEV_WITH_ID(CAN, 0x1),
+
+	MFD_DEV_WITH_ID(WDT, 0x0),
+	MFD_DEV_WITH_ID(WDT, 0x1),
+
+	MFD_DEV_SIMPLE(HWMON),
+	MFD_DEV_SIMPLE(RTC),
+};
+
+static int nct6694_response_err_handling(struct nct6694 *nct6694,
+					 unsigned char err_status)
+{
+	struct device *dev = &nct6694->udev->dev;
+
+	switch (err_status) {
+	case NCT6694_NO_ERROR:
+		return err_status;
+	case NCT6694_NOT_SUPPORT_ERROR:
+		dev_dbg(dev, "%s: Command is not support!\n", __func__);
+		break;
+	case NCT6694_NO_RESPONSE_ERROR:
+		dev_dbg(dev, "%s: Command is no response!\n", __func__);
+		break;
+	case NCT6694_TIMEOUT_ERROR:
+		dev_dbg(dev, "%s: Command is timeout!\n", __func__);
+		break;
+	case NCT6694_PENDING:
+		dev_dbg(dev, "%s: Command is pending!\n", __func__);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return -EIO;
+}
+
+int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		     u16 length, void *buf)
+{
+	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
+	struct nct6694_response_header *response_header = nct6694->response_header;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device */
+	cmd_header->mod = mod;
+	cmd_header->cmd = offset & 0xFF;
+	cmd_header->sel = (offset >> 8) & 0xFF;
+	cmd_header->hctrl = NCT6694_HCTRL_GET;
+	cmd_header->len = length;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	return nct6694_response_err_handling(nct6694, response_header->sts);
+}
+EXPORT_SYMBOL(nct6694_read_msg);
+
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, void *buf)
+{
+	struct nct6694_cmd_header *cmd_header = nct6694->cmd_header;
+	struct nct6694_response_header *response_header = nct6694->response_header;
+	struct usb_device *udev = nct6694->udev;
+	int tx_len, rx_len, ret;
+
+	guard(mutex)(&nct6694->access_lock);
+
+	/* Send command packet to USB device  */
+	cmd_header->mod = mod;
+	cmd_header->cmd = offset & 0xFF;
+	cmd_header->sel = (offset >> 8) & 0xFF;
+	cmd_header->hctrl = NCT6694_HCTRL_SET;
+	cmd_header->len = length;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   cmd_header, NCT6694_CMD_PACKET_SZ, &tx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP),
+			   buf, length, &tx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	/* Receive response packet from USB device */
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   response_header, NCT6694_CMD_PACKET_SZ, &rx_len,
+			   nct6694->timeout);
+	if (ret)
+		return ret;
+
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP),
+			   buf, NCT6694_MAX_PACKET_SZ, &rx_len, nct6694->timeout);
+	if (ret)
+		return ret;
+
+	return nct6694_response_err_handling(nct6694, response_header->sts);
+}
+EXPORT_SYMBOL(nct6694_write_msg);
+
+static void usb_int_callback(struct urb *urb)
+{
+	struct nct6694 *nct6694 = urb->context;
+	struct device *dev = &nct6694->udev->dev;
+	unsigned int *int_status = urb->transfer_buffer;
+	int ret;
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		return;
+	default:
+		goto resubmit;
+	}
+
+	while (*int_status) {
+		int irq = __ffs(*int_status);
+
+		if (*int_status & (1 << irq))
+			generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+
+		*int_status &= ~(1 << irq);
+	}
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	if (ret)
+		dev_dbg(dev, "%s: Failed to resubmit urb, status %d",
+			__func__, ret);
+}
+
+static void nct6694_irq_lock(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&nct6694->irq_lock);
+}
+
+static void nct6694_irq_sync_unlock(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+
+	mutex_unlock(&nct6694->irq_lock);
+}
+
+static void nct6694_irq_enable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	unsigned int irq = data->hwirq;
+
+	nct6694->irq_enable |= (1 << irq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	unsigned int irq = data->hwirq;
+
+	nct6694->irq_enable &= ~(1 << irq);
+}
+
+static struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_bus_lock = nct6694_irq_lock,
+	.irq_bus_sync_unlock = nct6694_irq_sync_unlock,
+	.irq_enable = nct6694_irq_enable,
+	.irq_disable = nct6694_irq_disable,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
+				  irq_hw_number_t hw)
+{
+	struct nct6694 *nct6694 = d->host_data;
+
+	irq_set_chip_data(irq, nct6694);
+	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
+
+	return 0;
+}
+
+static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops nct6694_irq_domain_ops = {
+	.map	= nct6694_irq_domain_map,
+	.unmap	= nct6694_irq_domain_unmap,
+};
+
+static int nct6694_usb_probe(struct usb_interface *iface,
+			     const struct usb_device_id *id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct device *dev = &udev->dev;
+	struct usb_host_interface *interface;
+	struct usb_endpoint_descriptor *int_endpoint;
+	struct nct6694 *nct6694;
+	struct nct6694_cmd_header *cmd_header;
+	struct nct6694_response_header *response_header;
+	int pipe, maxp;
+	int ret;
+
+	interface = iface->cur_altsetting;
+
+	int_endpoint = &interface->endpoint[0].desc;
+	if (!usb_endpoint_is_int_in(int_endpoint))
+		return -ENODEV;
+
+	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
+	if (!nct6694)
+		return -ENOMEM;
+
+	pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	maxp = usb_maxpacket(udev, pipe);
+
+	cmd_header = devm_kzalloc(dev, sizeof(*cmd_header),
+				  GFP_KERNEL);
+	if (!cmd_header)
+		return -ENOMEM;
+
+	response_header = devm_kzalloc(dev, sizeof(*response_header),
+				       GFP_KERNEL);
+	if (!response_header)
+		return -ENOMEM;
+
+	nct6694->int_buffer = devm_kcalloc(dev, NCT6694_MAX_PACKET_SZ,
+					   sizeof(unsigned char), GFP_KERNEL);
+	if (!nct6694->int_buffer)
+		return -ENOMEM;
+
+	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!nct6694->int_in_urb)
+		return -ENOMEM;
+
+	nct6694->domain = irq_domain_add_simple(NULL, NCT6694_NR_IRQS, 0,
+						&nct6694_irq_domain_ops,
+						nct6694);
+	if (!nct6694->domain)
+		return -ENODEV;
+
+	nct6694->udev = udev;
+	nct6694->timeout = NCT6694_URB_TIMEOUT;	/* Wait until urb complete */
+	nct6694->cmd_header = cmd_header;
+	nct6694->response_header = response_header;
+
+	mutex_init(&nct6694->access_lock);
+	mutex_init(&nct6694->irq_lock);
+
+	usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
+			 nct6694->int_buffer, maxp, usb_int_callback,
+			 nct6694, int_endpoint->bInterval);
+	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	if (ret)
+		goto err_urb;
+
+	dev_set_drvdata(dev, nct6694);
+	usb_set_intfdata(iface, nct6694);
+
+	ret = mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6694_dev));
+	if (ret)
+		goto err_mfd;
+
+	dev_info(dev, "Probed device: (%04X:%04X)\n", id->idVendor, id->idProduct);
+	return 0;
+
+err_mfd:
+	usb_kill_urb(nct6694->int_in_urb);
+err_urb:
+	usb_free_urb(nct6694->int_in_urb);
+	return dev_err_probe(dev, ret, "Probe failed\n");
+}
+
+static void nct6694_usb_disconnect(struct usb_interface *iface)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+
+	mfd_remove_devices(&udev->dev);
+	usb_kill_urb(nct6694->int_in_urb);
+	usb_free_urb(nct6694->int_in_urb);
+}
+
+static const struct usb_device_id nct6694_ids[] = {
+	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
+					NCT6694_PRODUCT_ID,
+					0xFF, 0x00, 0x00)},
+	{}
+};
+MODULE_DEVICE_TABLE(usb, nct6694_ids);
+
+static struct usb_driver nct6694_usb_driver = {
+	.name	= "nct6694",
+	.id_table = nct6694_ids,
+	.probe = nct6694_usb_probe,
+	.disconnect = nct6694_usb_disconnect,
+};
+
+module_usb_driver(nct6694_usb_driver);
+
+MODULE_DESCRIPTION("USB-MFD driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
new file mode 100644
index 000000000000..9733d47f5a01
--- /dev/null
+++ b/include/linux/mfd/nct6694.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Nuvoton NCT6694 USB transaction and data structure.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#ifndef __MFD_NCT6694_H
+#define __MFD_NCT6694_H
+
+#define NCT6694_DEV_GPIO	"nct6694-gpio"
+#define NCT6694_DEV_I2C		"nct6694-i2c"
+#define NCT6694_DEV_CAN		"nct6694-can"
+#define NCT6694_DEV_WDT		"nct6694-wdt"
+#define NCT6694_DEV_HWMON	"nct6694-hwmon"
+#define NCT6694_DEV_RTC		"nct6694-rtc"
+
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+#define NCT6694_MAX_PACKET_SZ	0x200
+
+#define NCT6694_CMD_PACKET_SZ	0x8
+#define NCT6694_HCTRL_SET	0x40
+#define NCT6694_HCTRL_GET	0x80
+
+#define NCT6694_URB_TIMEOUT	1000
+
+enum nct6694_irq_id {
+	NCT6694_IRQ_GPIO0 = 0,
+	NCT6694_IRQ_GPIO1,
+	NCT6694_IRQ_GPIO2,
+	NCT6694_IRQ_GPIO3,
+	NCT6694_IRQ_GPIO4,
+	NCT6694_IRQ_GPIO5,
+	NCT6694_IRQ_GPIO6,
+	NCT6694_IRQ_GPIO7,
+	NCT6694_IRQ_GPIO8,
+	NCT6694_IRQ_GPIO9,
+	NCT6694_IRQ_GPIOA,
+	NCT6694_IRQ_GPIOB,
+	NCT6694_IRQ_GPIOC,
+	NCT6694_IRQ_GPIOD,
+	NCT6694_IRQ_GPIOE,
+	NCT6694_IRQ_GPIOF,
+	NCT6694_IRQ_CAN1,
+	NCT6694_IRQ_CAN2,
+	NCT6694_IRQ_RTC,
+	NCT6694_NR_IRQS,
+};
+
+enum nct6694_response_err_status {
+	NCT6694_NO_ERROR = 0,
+	NCT6694_FORMAT_ERROR,
+	NCT6694_RESERVED1,
+	NCT6694_RESERVED2,
+	NCT6694_NOT_SUPPORT_ERROR,
+	NCT6694_NO_RESPONSE_ERROR,
+	NCT6694_TIMEOUT_ERROR,
+	NCT6694_PENDING,
+};
+
+struct nct6694 {
+	struct usb_device *udev;
+	struct urb *int_in_urb;
+	struct irq_domain *domain;
+	struct nct6694_cmd_header *cmd_header;
+	struct nct6694_response_header *response_header;
+	struct mutex access_lock;
+	struct mutex irq_lock;
+	unsigned char *int_buffer;
+	unsigned int irq_enable;
+	/* time in msec to wait for the urb to the complete */
+	long timeout;
+};
+
+struct nct6694_cmd_header {
+	unsigned char rsv1;
+	unsigned char mod;
+	unsigned char cmd;
+	unsigned char sel;
+	unsigned char hctrl;
+	unsigned char rsv2;
+	unsigned short len;
+} __packed;
+
+struct nct6694_response_header {
+	unsigned char sequence_id;
+	unsigned char sts;
+	unsigned int rsv;
+	unsigned short len;
+} __packed;
+
+/*
+ * nct6694_read_msg - Receive data from NCT6694 USB device
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @mod - Module byte
+ * @offset - Offset byte or (Select byte | Command byte)
+ * @length - Length byte
+ * @buf - Read data from rx buffer
+ *
+ * USB Transaction format:
+ *
+ *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
+ *	OUT	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
+ *	IN	|-------D------A------D------A-------|
+ *	IN			......
+ *	IN	|-------D------A------D------A-------|
+ */
+int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		     u16 length, void *buf);
+
+/*
+ * nct6694_read_msg - Transmit data to NCT6694 USB device
+ *
+ * @nct6694 - Nuvoton NCT6694 structure
+ * @mod - Module byte
+ * @offset - Offset byte or (Select byte | Command byte)
+ * @length - Length byte
+ * @buf - Write data to tx buffer
+ *
+ * USB Transaction format:
+ *
+ *	OUT	|RSV|MOD|CMD|SEL|HCTL|RSV|LEN_L|LEN_H|
+ *	OUT	|-------D------A------D------A-------|
+ *	OUT			......
+ *	OUT	|-------D------A------D------A-------|
+ *	IN	|SEQ|STS|RSV|RSV|RSV|RSV||LEN_L|LEN_H|
+ *	IN	|-------D------A------D------A-------|
+ *	IN			......
+ *	IN	|-------D------A------D------A-------|
+ */
+int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
+		      u16 length, void *buf);
+
+#endif
-- 
2.34.1


