Return-Path: <linux-watchdog+bounces-3255-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D21A81FDD
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 10:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B34C19E33FE
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Apr 2025 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACFF25DAE7;
	Wed,  9 Apr 2025 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUh8XmO4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DA125D914;
	Wed,  9 Apr 2025 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187307; cv=none; b=LiKJsjxFMpYx4u4EfxV6lGa5WCeRj7WFWDtrloLnhPi6lSfFSkkQOlAyslNNyCxRDRkp5qiqXZGjnC2qkh4jciIdBaXvqapuXzRwUm1dCvCMDemPINUfyZgY5X96TmKuL6peDPOZNRc71DAO98ZR/S3VjEiWdwDoG3xitXRxwHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187307; c=relaxed/simple;
	bh=8G6nonrwfQuBWygHM49Ruvy+MryYJP4vx9AKOvqXkiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OL9+fkwTw5DIDmerT/eub/YQNKH+fPVOYpr5RYU3+nDg6h5svGgarLWf7/TZr8MVEEokqEd1mA384AaO6lH9XvzRcCjCY8p9+9u7pWzmR+CxcmO01fO/KML+KiII2lVfO0x1g3B++WP59VzRyfBUY7iqRP8ZrQu5XOkGyzC4/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUh8XmO4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af50f56b862so4456137a12.1;
        Wed, 09 Apr 2025 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744187304; x=1744792104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28WibuzeNSCTFmS4UgcS9IjqyaJZAIhm23zmQRw5whg=;
        b=UUh8XmO4Ye90HY9nFJfnBDZ6lrapku2E7rqY8mFHauBt5tcH+LgIIqs1AcgWXRNZN3
         Y4N5TGQYclJ2gBDlCmULIDThNyhB3tR9LAQ+FtcY4LTmMqGIF2UhBd6tRadNx+CPtL8j
         +0mP0OewJ7pJdZc+czRQceIupjc4kLKMf+OhVTDqVJxRAZhIottvsHzqgqjPR/8l7/BG
         XWCgkM29T6kD9TYDYg6vclQhOGkZjGCLTrxailk8o35AT6UrscmTi30nNGs2GcxP6nKb
         tsR9zYS+ZeS5n8dpV6WHZUqW93tuTguNsojXGFMU8sSWTJSTSvCsubWuTqB5F5xCcFA5
         /VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187304; x=1744792104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28WibuzeNSCTFmS4UgcS9IjqyaJZAIhm23zmQRw5whg=;
        b=j1QdsdY6OQsdqHAslCNnShPnuGrt0LCNxjKFBbaUwBZPbIfH5wlhfcxIHhX5GCppEx
         3DZ+sTBGx7A4K9dCXZD3aIHZnrK+Wpyg+fFsV2y8FH3Ok9f2RLnxfZBYby/KPuQ6vM2T
         kkLXjY4tErBgvMnVNLxSIvBaC3YOh3pf3ClbswhlD5PJ4qk50pPj2oZ1iO1sDeAk/a61
         dCHJM13ytFHeDgonVAw990C95eL9/SZZPl6GHOqvqh1g8D5CqPoXP2w/UTW32B4Ylj4R
         TqSKaqOaQ220TwgwnqexQ41qDjn2iUwbDIzbrvCc4JpX10lcftDhQ4HJ4jG58VbpZ/8i
         /O8g==
X-Forwarded-Encrypted: i=1; AJvYcCUkXvNcGDXHwSg1kefWndCMXlFMltuQ3Z5PjpDisXrMkHghHGIiZ6ksir0wBtAu0PDhKpVTADLHdyyDxVA5rNI=@vger.kernel.org, AJvYcCV31Oqj6/LaE6b+fCGI84gkVHHwxLIhzLB9mOVrsI3001CZ9eT4p11oXWZmwc2vY4ZG8VqcWX2N9MC8@vger.kernel.org, AJvYcCVepXMghgPHeuUf0eJ6JwnwVoApDioLagUDm0RDXLnx33dgm7fPvR9MsZtj+dANswUrVP9bbFVQUFBfN54=@vger.kernel.org, AJvYcCWG7UzmQDwga9Lv6f+Uvs98H9guVzy/vlhwWV+cM58D1pzLLomR5Y8eX5z+iJCPDdRdBH2zUZ5cuUA=@vger.kernel.org, AJvYcCWPbGu1YB5B9wDhKZpJqISTWLffsnen+CJtvrUwwMSlrBgDencKWJ8Ht/7H52KElD5DVgL/9285@vger.kernel.org, AJvYcCWvKo0ZaHylzIUR2/dyuP55U/jsQte5WMfu4a2C1gur3JzPxlBLFTl79Q8zA33VPR5nAqMvZDCYaMuB3A==@vger.kernel.org, AJvYcCXm48ET91xNrYmij8XbZZeSJVMGH/Sc6bgAF6Q6/H+09RfNXFUuHVdnEyJENZxCR7gZyFAgv7EKeT6Y@vger.kernel.org, AJvYcCXyURlwSsL8ufQR1/7ON6kpSyJqqmmVa4S50ADknLoFGoMXP3CswbxgxvhgciBpd4Hnor97Cx8vBIi1@vger.kernel.org
X-Gm-Message-State: AOJu0YwL6NX+sj+mmgcTo+6Rrr1R+zq6/URD4FCxF/60q/8v3C58m8wU
	LssZ5IrVlOZ7uKa8lF6HI+gs+AGYSv/pftxQEsG7t0emdu9M3X/H
X-Gm-Gg: ASbGnctd6PvnnFV6ZdkR5XEmoBfGWa7hgEKGO45Icqz3/uAEM0K7GRlTdLQU8g49zoG
	TordhwlaEf1sBR3zBPS/CrPNjaQJHVRt6xdNCYg/TK+q4OagMu6J7LwhQA/c/51FYgQHmY9mT5B
	GsFM0w+/iqlOjOoOwjxzScmCOauqhEBeVcZDah3kVkgEN1ec7vwrDK7m8ccGCzABtoqhtCtLQUN
	VV9NRillPsEuz1CjwKEy3GdXEX7n/xfwSHMPJaNI791yq524/OtmP/RbvWcCQT2VkMlXKK43ns4
	2D9I53t9/9v8V64kNwTmOCbB+sFWuqaOLL3p4ksFK2vXF4Pzp0iU4aG8sBBSDqJsFMLnNwLZJv0
	/hBc=
X-Google-Smtp-Source: AGHT+IGM53p2VGfEm6ue6SMpGnoa4Wci07FdWZE4qGUTzaodWjdwHLOH7vbije5CZ+wcTHTxvc0sIQ==
X-Received: by 2002:a05:6a20:d04e:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-2015afcbcf3mr2980840637.32.1744187304081;
        Wed, 09 Apr 2025 01:28:24 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d46509sm740772b3a.57.2025.04.09.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:28:23 -0700 (PDT)
From: a0282524688@gmail.com
X-Google-Original-From: tmyu0@nuvoton.com
To: lee@kernel.org,
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
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
Date: Wed,  9 Apr 2025 16:27:49 +0800
Message-Id: <20250409082752.3697532-5-tmyu0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409082752.3697532-1-tmyu0@nuvoton.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <tmyu0@nuvoton.com>

This driver supports Socket CANFD functionality for NCT6694 MFD
device based on USB interface.

Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
---
 MAINTAINERS                         |   1 +
 drivers/net/can/usb/Kconfig         |  11 +
 drivers/net/can/usb/Makefile        |   1 +
 drivers/net/can/usb/nct6694_canfd.c | 815 ++++++++++++++++++++++++++++
 4 files changed, 828 insertions(+)
 create mode 100644 drivers/net/can/usb/nct6694_canfd.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c2d7be0cdb58..3a96a8730e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17308,6 +17308,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/i2c/busses/i2c-nct6694.c
 F:	drivers/mfd/nct6694.c
+F:	drivers/net/can/usb/nct6694_canfd.c
 F:	include/linux/mfd/nct6694.h
 
 NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
diff --git a/drivers/net/can/usb/Kconfig b/drivers/net/can/usb/Kconfig
index 9dae0c71a2e1..759e724a67cf 100644
--- a/drivers/net/can/usb/Kconfig
+++ b/drivers/net/can/usb/Kconfig
@@ -133,6 +133,17 @@ config CAN_MCBA_USB
 	  This driver supports the CAN BUS Analyzer interface
 	  from Microchip (http://www.microchip.com/development-tools/).
 
+config CAN_NCT6694
+	tristate "Nuvoton NCT6694 Socket CANfd support"
+	depends on MFD_NCT6694
+	select CAN_RX_OFFLOAD
+	help
+	  If you say yes to this option, support will be included for Nuvoton
+	  NCT6694, a USB device to socket CANfd controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nct6694_canfd.
+
 config CAN_PEAK_USB
 	tristate "PEAK PCAN-USB/USB Pro interfaces for CAN 2.0b/CAN-FD"
 	help
diff --git a/drivers/net/can/usb/Makefile b/drivers/net/can/usb/Makefile
index 8b11088e9a59..fcafb1ac262e 100644
--- a/drivers/net/can/usb/Makefile
+++ b/drivers/net/can/usb/Makefile
@@ -11,5 +11,6 @@ obj-$(CONFIG_CAN_F81604) += f81604.o
 obj-$(CONFIG_CAN_GS_USB) += gs_usb.o
 obj-$(CONFIG_CAN_KVASER_USB) += kvaser_usb/
 obj-$(CONFIG_CAN_MCBA_USB) += mcba_usb.o
+obj-$(CONFIG_CAN_NCT6694) += nct6694_canfd.o
 obj-$(CONFIG_CAN_PEAK_USB) += peak_usb/
 obj-$(CONFIG_CAN_UCAN) += ucan.o
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
new file mode 100644
index 000000000000..76ffc23e8184
--- /dev/null
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -0,0 +1,815 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Nuvoton NCT6694 Socket CANfd driver based on USB interface.
+ *
+ * Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/can/dev.h>
+#include <linux/can/rx-offload.h>
+#include <linux/ethtool.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/platform_device.h>
+
+#define DEVICE_NAME "nct6694-canfd"
+
+/* USB command module type for NCT6694 CANfd controller.
+ * This defines the module type used for communication with the NCT6694
+ * CANfd controller over the USB interface.
+ */
+#define NCT6694_CANFD_MOD			0x05
+
+/* Command 00h - CAN Setting and Initialization */
+#define NCT6694_CANFD_SETTING			0x00
+#define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
+#define NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP	BIT(2)
+#define NCT6694_CANFD_SETTING_CTRL1_MON		BIT(0)
+#define NCT6694_CANFD_SETTING_CTRL1_NISO	BIT(1)
+#define NCT6694_CANFD_SETTING_CTRL1_LBCK	BIT(2)
+#define NCT6694_CANFD_SETTING_NBTP_NTSEG2	GENMASK(6, 0)
+#define NCT6694_CANFD_SETTING_NBTP_NTSEG1	GENMASK(15, 8)
+#define NCT6694_CANFD_SETTING_NBTP_NBRP		GENMASK(24, 16)
+#define NCT6694_CANFD_SETTING_NBTP_NSJW		GENMASK(31, 25)
+#define NCT6694_CANFD_SETTING_DBTP_DSJW		GENMASK(3, 0)
+#define NCT6694_CANFD_SETTING_DBTP_DTSEG2	GENMASK(7, 4)
+#define NCT6694_CANFD_SETTING_DBTP_DTSEG1	GENMASK(12, 8)
+#define NCT6694_CANFD_SETTING_DBTP_DBRP		GENMASK(20, 16)
+
+/* Command 01h - CAN Information */
+#define NCT6694_CANFD_INFORMATION		0x01
+#define NCT6694_CANFD_INFORMATION_SEL		0x00
+
+/* Command 02h - CAN Event */
+#define NCT6694_CANFD_EVENT			0x02
+#define NCT6694_CANFD_EVENT_SEL(idx, mask)	\
+	((idx ? 0x80 : 0x00) | ((mask) & 0x7F))
+
+#define NCT6694_CANFD_EVENT_MASK		GENMASK(5, 0)
+#define NCT6694_CANFD_EVT_TX_FIFO_EMPTY		BIT(7)	/* Read-clear */
+#define NCT6694_CANFD_EVT_RX_DATA_LOST		BIT(5)	/* Read-clear */
+#define NCT6694_CANFD_EVT_RX_DATA_IN		BIT(7)	/* Read-clear*/
+
+/* Command 10h - CAN Deliver */
+#define NCT6694_CANFD_DELIVER			0x10
+#define NCT6694_CANFD_DELIVER_SEL(buf_cnt)	\
+	((buf_cnt) & 0xFF)
+
+/* Command 11h - CAN Receive */
+#define NCT6694_CANFD_RECEIVE			0x11
+#define NCT6694_CANFD_RECEIVE_SEL(idx, buf_cnt)	\
+	((idx ? 0x80 : 0x00) | ((buf_cnt) & 0x7F))
+
+#define NCT6694_CANFD_FRAME_TAG(idx)		(0xC0 | (idx))
+#define NCT6694_CANFD_FRAME_FLAG_EFF		BIT(0)
+#define NCT6694_CANFD_FRAME_FLAG_RTR		BIT(1)
+#define NCT6694_CANFD_FRAME_FLAG_FD		BIT(2)
+#define NCT6694_CANFD_FRAME_FLAG_BRS		BIT(3)
+#define NCT6694_CANFD_FRAME_FLAG_ERR		BIT(4)
+
+#define NCT6694_NAPI_WEIGHT			32
+
+enum nct6694_event_err {
+	NCT6694_CANFD_EVT_ERR_NO_ERROR = 0,
+	NCT6694_CANFD_EVT_ERR_CRC_ERROR,
+	NCT6694_CANFD_EVT_ERR_STUFF_ERROR,
+	NCT6694_CANFD_EVT_ERR_ACK_ERROR,
+	NCT6694_CANFD_EVT_ERR_FORM_ERROR,
+	NCT6694_CANFD_EVT_ERR_BIT_ERROR,
+	NCT6694_CANFD_EVT_ERR_TIMEOUT_ERROR,
+	NCT6694_CANFD_EVT_ERR_UNKNOWN_ERROR,
+};
+
+enum nct6694_event_status {
+	NCT6694_CANFD_EVT_STS_ERROR_ACTIVE = 0,
+	NCT6694_CANFD_EVT_STS_ERROR_PASSIVE,
+	NCT6694_CANFD_EVT_STS_BUS_OFF,
+	NCT6694_CANFD_EVT_STS_WARNING,
+};
+
+struct __packed nct6694_canfd_setting {
+	__le32 nbr;
+	__le32 dbr;
+	u8 active;
+	u8 reserved[3];
+	__le16 ctrl1;
+	__le16 ctrl2;
+	__le32 nbtp;
+	__le32 dbtp;
+};
+
+struct __packed nct6694_canfd_information {
+	u8 tx_fifo_cnt;
+	u8 rx_fifo_cnt;
+	u8 reserved[2];
+	__le32 can_clk;
+};
+
+struct __packed nct6694_canfd_event {
+	u8 err;
+	u8 status;
+	u8 tx_evt;
+	u8 rx_evt;
+	u8 rec;
+	u8 tec;
+	u8 reserved[2];
+};
+
+struct __packed nct6694_canfd_frame {
+	u8 tag;
+	u8 flag;
+	u8 reserved;
+	u8 length;
+	__le32 id;
+	u8 data[CANFD_MAX_DLEN];
+};
+
+struct nct6694_canfd_priv {
+	struct can_priv can;	/* must be the first member */
+	struct can_rx_offload offload;
+	struct net_device *ndev;
+	struct nct6694 *nct6694;
+	struct workqueue_struct *wq;
+	struct work_struct tx_work;
+	struct nct6694_canfd_frame tx;
+	struct nct6694_canfd_frame rx;
+	struct nct6694_canfd_event event[2];
+	struct can_berr_counter bec;
+};
+
+static inline struct nct6694_canfd_priv *rx_offload_to_priv(struct can_rx_offload *offload)
+{
+	return container_of(offload, struct nct6694_canfd_priv, offload);
+}
+
+static const struct can_bittiming_const nct6694_canfd_bittiming_nominal_const = {
+	.name = DEVICE_NAME,
+	.tseg1_min = 1,
+	.tseg1_max = 256,
+	.tseg2_min = 1,
+	.tseg2_max = 128,
+	.sjw_max = 128,
+	.brp_min = 1,
+	.brp_max = 512,
+	.brp_inc = 1,
+};
+
+static const struct can_bittiming_const nct6694_canfd_bittiming_data_const = {
+	.name = DEVICE_NAME,
+	.tseg1_min = 1,
+	.tseg1_max = 32,
+	.tseg2_min = 1,
+	.tseg2_max = 16,
+	.sjw_max = 16,
+	.brp_min = 1,
+	.brp_max = 32,
+	.brp_inc = 1,
+};
+
+static void nct6694_canfd_rx_offload(struct can_rx_offload *offload,
+				     struct sk_buff *skb)
+{
+	struct nct6694_canfd_priv *priv = rx_offload_to_priv(offload);
+	int ret;
+
+	ret = can_rx_offload_queue_tail(offload, skb);
+	if (ret)
+		priv->ndev->stats.rx_fifo_errors++;
+}
+
+static void nct6694_canfd_handle_lost_msg(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct net_device_stats *stats = &ndev->stats;
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	netdev_dbg(ndev, "RX FIFO overflow, message(s) lost.\n");
+
+	stats->rx_errors++;
+	stats->rx_over_errors++;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+	if (!skb)
+		return;
+
+	cf->can_id |= CAN_ERR_CRTL;
+	cf->data[1] = CAN_ERR_CRTL_RX_OVERFLOW;
+
+	nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_rx(struct net_device *ndev, u8 rx_evt)
+{
+	struct net_device_stats *stats = &ndev->stats;
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_frame *frame = &priv->rx;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_RECEIVE,
+		.sel = NCT6694_CANFD_RECEIVE_SEL(ndev->dev_port, 1),
+		.len = cpu_to_le16(sizeof(*frame))
+	};
+	struct sk_buff *skb;
+	int ret;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, frame);
+	if (ret)
+		return;
+
+	if (frame->flag & NCT6694_CANFD_FRAME_FLAG_FD) {
+		struct canfd_frame *cfd;
+
+		skb = alloc_canfd_skb(priv->ndev, &cfd);
+		if (!skb) {
+			stats->rx_dropped++;
+			return;
+		}
+
+		cfd->can_id = le32_to_cpu(frame->id);
+		cfd->len = canfd_sanitize_len(frame->length);
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
+			cfd->can_id |= CAN_EFF_FLAG;
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_BRS)
+			cfd->flags |= CANFD_BRS;
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_ERR)
+			cfd->flags |= CANFD_ESI;
+
+		memcpy(cfd->data, frame->data, cfd->len);
+	} else {
+		struct can_frame *cf;
+
+		skb = alloc_can_skb(priv->ndev, &cf);
+		if (!skb) {
+			stats->rx_dropped++;
+			return;
+		}
+
+		cf->can_id = le32_to_cpu(frame->id);
+		cf->len = can_cc_dlc2len(frame->length);
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_EFF)
+			cf->can_id |= CAN_EFF_FLAG;
+
+		if (frame->flag & NCT6694_CANFD_FRAME_FLAG_RTR)
+			cf->can_id |= CAN_RTR_FLAG;
+		else
+			memcpy(cf->data, frame->data, cf->len);
+	}
+
+	nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static int nct6694_canfd_get_berr_counter(const struct net_device *ndev,
+					  struct can_berr_counter *bec)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	*bec = priv->bec;
+
+	return 0;
+}
+
+static void nct6694_canfd_handle_state_change(struct net_device *ndev, u8 status)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	enum can_state new_state, rx_state, tx_state;
+	struct can_berr_counter bec;
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	nct6694_canfd_get_berr_counter(ndev, &bec);
+	can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
+
+	new_state = max(tx_state, rx_state);
+
+	/* state hasn't changed */
+	if (new_state == priv->can.state)
+		return;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+
+	can_change_state(ndev, cf, tx_state, rx_state);
+
+	if (new_state == CAN_STATE_BUS_OFF) {
+		can_bus_off(ndev);
+	} else if (cf) {
+		cf->can_id |= CAN_ERR_CNT;
+		cf->data[6] = bec.txerr;
+		cf->data[7] = bec.rxerr;
+	}
+
+	if (skb)
+		nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_bus_err(struct net_device *ndev, u8 bus_err)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct can_frame *cf;
+	struct sk_buff *skb;
+
+	if (bus_err == NCT6694_CANFD_EVT_ERR_NO_ERROR)
+		return;
+
+	priv->can.can_stats.bus_error++;
+
+	skb = alloc_can_err_skb(ndev, &cf);
+	if (cf)
+		cf->can_id |= CAN_ERR_PROT | CAN_ERR_BUSERROR;
+
+	switch (bus_err) {
+	case NCT6694_CANFD_EVT_ERR_CRC_ERROR:
+		netdev_dbg(ndev, "CRC error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[3] |= CAN_ERR_PROT_LOC_CRC_SEQ;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_STUFF_ERROR:
+		netdev_dbg(ndev, "Stuff error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_STUFF;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_ACK_ERROR:
+		netdev_dbg(ndev, "Ack error\n");
+		ndev->stats.tx_errors++;
+		if (cf) {
+			cf->can_id |= CAN_ERR_ACK;
+			cf->data[2] |= CAN_ERR_PROT_TX;
+		}
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_FORM_ERROR:
+		netdev_dbg(ndev, "Form error\n");
+		ndev->stats.rx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_FORM;
+		break;
+
+	case NCT6694_CANFD_EVT_ERR_BIT_ERROR:
+		netdev_dbg(ndev, "Bit error\n");
+		ndev->stats.tx_errors++;
+		if (cf)
+			cf->data[2] |= CAN_ERR_PROT_TX | CAN_ERR_PROT_BIT;
+		break;
+
+	default:
+		break;
+	}
+
+	if (skb)
+		nct6694_canfd_rx_offload(&priv->offload, skb);
+}
+
+static void nct6694_canfd_handle_tx(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct net_device_stats *stats = &ndev->stats;
+
+	stats->tx_bytes += can_rx_offload_get_echo_skb_queue_tail(&priv->offload,
+								  0, NULL);
+	stats->tx_packets++;
+	netif_wake_queue(ndev);
+}
+
+static irqreturn_t nct6694_canfd_irq(int irq, void *data)
+{
+	struct net_device *ndev = data;
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_event *event = &priv->event[ndev->dev_port];
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_EVENT,
+		.sel = NCT6694_CANFD_EVENT_SEL(ndev->dev_port, NCT6694_CANFD_EVENT_MASK),
+		.len = cpu_to_le16(sizeof(priv->event))
+	};
+	irqreturn_t handled = IRQ_NONE;
+	int ret;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, priv->event);
+	if (ret < 0)
+		return handled;
+
+	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_IN) {
+		nct6694_canfd_handle_rx(ndev, event->rx_evt);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->rx_evt & NCT6694_CANFD_EVT_RX_DATA_LOST) {
+		nct6694_canfd_handle_lost_msg(ndev);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->status) {
+		nct6694_canfd_handle_state_change(ndev, event->status);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->err != NCT6694_CANFD_EVT_ERR_NO_ERROR) {
+		if (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING)
+			nct6694_canfd_handle_bus_err(ndev, event->err);
+		handled = IRQ_HANDLED;
+	}
+
+	if (event->tx_evt & NCT6694_CANFD_EVT_TX_FIFO_EMPTY) {
+		nct6694_canfd_handle_tx(ndev);
+		handled = IRQ_HANDLED;
+	}
+
+	if (handled)
+		can_rx_offload_threaded_irq_finish(&priv->offload);
+
+	priv->bec.rxerr = event->rec;
+	priv->bec.txerr = event->tec;
+
+	return handled;
+}
+
+static void nct6694_canfd_tx_work(struct work_struct *work)
+{
+	struct nct6694_canfd_priv *priv = container_of(work,
+						       struct nct6694_canfd_priv,
+						       tx_work);
+	struct nct6694_canfd_frame *frame = &priv->tx;
+	struct net_device *ndev = priv->ndev;
+	struct net_device_stats *stats = &ndev->stats;
+	struct sk_buff *skb = priv->can.echo_skb[0];
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_DELIVER,
+		.sel = NCT6694_CANFD_DELIVER_SEL(1),
+		.len = cpu_to_le16(sizeof(*frame))
+	};
+	u32 txid;
+	int err;
+
+	memset(frame, 0, sizeof(*frame));
+
+	frame->tag = NCT6694_CANFD_FRAME_TAG(ndev->dev_port);
+
+	if (can_is_canfd_skb(skb)) {
+		struct canfd_frame *cfd = (struct canfd_frame *)skb->data;
+
+		if (cfd->flags & CANFD_BRS)
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_BRS;
+
+		if (cfd->can_id & CAN_EFF_FLAG) {
+			txid = cfd->can_id & CAN_EFF_MASK;
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_EFF;
+		} else {
+			txid = cfd->can_id & CAN_SFF_MASK;
+		}
+		frame->flag |= NCT6694_CANFD_FRAME_FLAG_FD;
+		frame->id = cpu_to_le32(txid);
+		frame->length = canfd_sanitize_len(cfd->len);
+
+		memcpy(frame->data, cfd->data, frame->length);
+	} else {
+		struct can_frame *cf = (struct can_frame *)skb->data;
+
+		if (cf->can_id & CAN_EFF_FLAG) {
+			txid = cf->can_id & CAN_EFF_MASK;
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_EFF;
+		} else {
+			txid = cf->can_id & CAN_SFF_MASK;
+		}
+
+		if (cf->can_id & CAN_RTR_FLAG)
+			frame->flag |= NCT6694_CANFD_FRAME_FLAG_RTR;
+		else
+			memcpy(frame->data, cf->data, cf->len);
+
+		frame->id = cpu_to_le32(txid);
+		frame->length = cf->len;
+	}
+
+	err = nct6694_write_msg(priv->nct6694, &cmd_hd, frame);
+	if (err) {
+		can_free_echo_skb(ndev, 0, NULL);
+		stats->tx_dropped++;
+		stats->tx_errors++;
+		netif_wake_queue(ndev);
+	}
+}
+
+static netdev_tx_t nct6694_canfd_start_xmit(struct sk_buff *skb,
+					    struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	if (can_dev_dropped_skb(ndev, skb))
+		return NETDEV_TX_OK;
+
+	netif_stop_queue(ndev);
+	can_put_echo_skb(skb, ndev, 0, 0);
+	queue_work(priv->wq, &priv->tx_work);
+
+	return NETDEV_TX_OK;
+}
+
+static int nct6694_canfd_start(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	const struct can_bittiming *d_bt = &priv->can.data_bittiming;
+	const struct can_bittiming *n_bt = &priv->can.bittiming;
+	struct nct6694_canfd_setting *setting __free(kfree) = NULL;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_SETTING,
+		.sel = ndev->dev_port,
+		.len = cpu_to_le16(sizeof(*setting))
+	};
+	int ret;
+
+	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
+	if (!setting)
+		return -ENOMEM;
+
+	setting->nbr = cpu_to_le32(n_bt->bitrate);
+	setting->dbr = cpu_to_le32(d_bt->bitrate);
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_NISO);
+
+	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
+		setting->ctrl1 |= cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_LBCK);
+
+	setting->nbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NSJW,
+					       n_bt->sjw - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NBRP,
+					       n_bt->brp - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG2,
+					       n_bt->phase_seg2 - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_NBTP_NTSEG1,
+					       n_bt->prop_seg + n_bt->phase_seg1 - 1));
+
+	setting->dbtp = cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DSJW,
+					       d_bt->sjw - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DBRP,
+					       d_bt->brp - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG2,
+					       d_bt->phase_seg2 - 1) |
+				    FIELD_PREP(NCT6694_CANFD_SETTING_DBTP_DTSEG1,
+					       d_bt->prop_seg + d_bt->phase_seg1 - 1));
+
+	setting->active = NCT6694_CANFD_SETTING_ACTIVE_CTRL1 |
+			  NCT6694_CANFD_SETTING_ACTIVE_NBTP_DBTP;
+
+	ret = nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
+	if (ret)
+		return ret;
+
+	priv->can.state = CAN_STATE_ERROR_ACTIVE;
+
+	return 0;
+}
+
+static void nct6694_canfd_stop(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	struct nct6694_canfd_setting *setting __free(kfree) = NULL;
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_SETTING,
+		.sel = ndev->dev_port,
+		.len = cpu_to_le16(sizeof(*setting))
+	};
+
+	/* The NCT6694 cannot be stopped. To ensure safe operation and avoid
+	 * interference, the control mode is set to Listen-Only mode. This
+	 * mode allows the device to monitor bus activity without actively
+	 * participating in communication.
+	 */
+	setting = kzalloc(sizeof(*setting), GFP_KERNEL);
+	if (!setting)
+		return;
+
+	nct6694_read_msg(priv->nct6694, &cmd_hd, setting);
+	setting->ctrl1 = cpu_to_le16(NCT6694_CANFD_SETTING_CTRL1_MON);
+	setting->active = NCT6694_CANFD_SETTING_ACTIVE_CTRL1;
+	nct6694_write_msg(priv->nct6694, &cmd_hd, setting);
+
+	priv->can.state = CAN_STATE_STOPPED;
+}
+
+static int nct6694_canfd_close(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+
+	netif_stop_queue(ndev);
+	can_rx_offload_disable(&priv->offload);
+	nct6694_canfd_stop(ndev);
+	free_irq(ndev->irq, ndev);
+	destroy_workqueue(priv->wq);
+	close_candev(ndev);
+	return 0;
+}
+
+static int nct6694_canfd_set_mode(struct net_device *ndev, enum can_mode mode)
+{
+	int ret;
+
+	switch (mode) {
+	case CAN_MODE_START:
+		ret = nct6694_canfd_start(ndev);
+		if (ret)
+			return ret;
+
+		netif_wake_queue(ndev);
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int nct6694_canfd_open(struct net_device *ndev)
+{
+	struct nct6694_canfd_priv *priv = netdev_priv(ndev);
+	int ret;
+
+	ret = open_candev(ndev);
+	if (ret)
+		return ret;
+
+	can_rx_offload_enable(&priv->offload);
+
+	ret = request_threaded_irq(ndev->irq, NULL,
+				   nct6694_canfd_irq, IRQF_ONESHOT,
+				   "nct6694_canfd", ndev);
+	if (ret) {
+		netdev_err(ndev, "Failed to request IRQ\n");
+		goto close_candev;
+	}
+
+	priv->wq = alloc_ordered_workqueue("%s-nct6694_wq",
+					   WQ_FREEZABLE | WQ_MEM_RECLAIM,
+					   ndev->name);
+	if (!priv->wq) {
+		ret = -ENOMEM;
+		goto free_irq;
+	}
+
+	ret = nct6694_canfd_start(ndev);
+	if (ret)
+		goto destroy_wq;
+
+	netif_start_queue(ndev);
+
+	return 0;
+
+destroy_wq:
+	destroy_workqueue(priv->wq);
+free_irq:
+	free_irq(ndev->irq, ndev);
+close_candev:
+	can_rx_offload_disable(&priv->offload);
+	close_candev(ndev);
+	return ret;
+}
+
+static const struct net_device_ops nct6694_canfd_netdev_ops = {
+	.ndo_open = nct6694_canfd_open,
+	.ndo_stop = nct6694_canfd_close,
+	.ndo_start_xmit = nct6694_canfd_start_xmit,
+	.ndo_change_mtu = can_change_mtu,
+};
+
+static const struct ethtool_ops nct6694_canfd_ethtool_ops = {
+	.get_ts_info = ethtool_op_get_ts_info,
+};
+
+static int nct6694_canfd_get_clock(struct nct6694_canfd_priv *priv)
+{
+	struct nct6694_canfd_information *info __free(kfree) = NULL;
+	static const struct nct6694_cmd_header cmd_hd = {
+		.mod = NCT6694_CANFD_MOD,
+		.cmd = NCT6694_CANFD_INFORMATION,
+		.sel = NCT6694_CANFD_INFORMATION_SEL,
+		.len = cpu_to_le16(sizeof(*info))
+	};
+	int ret, can_clk;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = nct6694_read_msg(priv->nct6694, &cmd_hd, info);
+	if (ret)
+		return ret;
+
+	can_clk = le32_to_cpu(info->can_clk);
+
+	return can_clk;
+}
+
+static int nct6694_canfd_probe(struct platform_device *pdev)
+{
+	const struct mfd_cell *cell = mfd_get_cell(pdev);
+	struct nct6694 *nct6694 = dev_get_drvdata(pdev->dev.parent);
+	struct nct6694_canfd_priv *priv;
+	struct net_device *ndev;
+	int ret, irq, can_clk;
+
+	irq = irq_create_mapping(nct6694->domain,
+				 NCT6694_IRQ_CAN0 + cell->id);
+	if (!irq)
+		return irq;
+
+	ndev = alloc_candev(sizeof(struct nct6694_canfd_priv), 1);
+	if (!ndev) {
+		ret = -ENOMEM;
+		goto dispose_irq;
+	}
+
+	ndev->irq = irq;
+	ndev->flags |= IFF_ECHO;
+	ndev->dev_port = cell->id;
+	ndev->netdev_ops = &nct6694_canfd_netdev_ops;
+	ndev->ethtool_ops = &nct6694_canfd_ethtool_ops;
+
+	priv = netdev_priv(ndev);
+	priv->nct6694 = nct6694;
+	priv->ndev = ndev;
+
+	can_clk = nct6694_canfd_get_clock(priv);
+	if (can_clk < 0) {
+		ret = dev_err_probe(&pdev->dev, can_clk,
+				    "Failed to get clock\n");
+		goto free_candev;
+	}
+
+	INIT_WORK(&priv->tx_work, nct6694_canfd_tx_work);
+
+	priv->can.clock.freq = can_clk;
+	priv->can.bittiming_const = &nct6694_canfd_bittiming_nominal_const;
+	priv->can.data_bittiming_const = &nct6694_canfd_bittiming_data_const;
+	priv->can.do_set_mode = nct6694_canfd_set_mode;
+	priv->can.do_get_berr_counter = nct6694_canfd_get_berr_counter;
+	priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK |
+		CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
+		CAN_CTRLMODE_FD_NON_ISO;
+
+	ret = can_set_static_ctrlmode(ndev, CAN_CTRLMODE_FD);
+	if (ret)
+		goto free_candev;
+
+	ret = can_rx_offload_add_manual(ndev, &priv->offload,
+					NCT6694_NAPI_WEIGHT);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "Failed to add rx_offload\n");
+		goto free_candev;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	SET_NETDEV_DEV(priv->ndev, &pdev->dev);
+
+	ret = register_candev(priv->ndev);
+	if (ret)
+		goto rx_offload_del;
+
+	return 0;
+
+rx_offload_del:
+	can_rx_offload_del(&priv->offload);
+free_candev:
+	free_candev(ndev);
+dispose_irq:
+	irq_dispose_mapping(irq);
+	return ret;
+}
+
+static void nct6694_canfd_remove(struct platform_device *pdev)
+{
+	struct nct6694_canfd_priv *priv = platform_get_drvdata(pdev);
+	struct net_device *ndev = priv->ndev;
+
+	unregister_candev(ndev);
+	irq_dispose_mapping(ndev->irq);
+	can_rx_offload_del(&priv->offload);
+	free_candev(ndev);
+}
+
+static struct platform_driver nct6694_canfd_driver = {
+	.driver = {
+		.name	= DEVICE_NAME,
+	},
+	.probe		= nct6694_canfd_probe,
+	.remove		= nct6694_canfd_remove,
+};
+
+module_platform_driver(nct6694_canfd_driver);
+
+MODULE_DESCRIPTION("USB-CAN FD driver for NCT6694");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


