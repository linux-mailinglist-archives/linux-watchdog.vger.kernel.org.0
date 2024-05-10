Return-Path: <linux-watchdog+bounces-1059-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E54D8C21E4
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 May 2024 12:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C96502885C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 May 2024 10:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC646165FCC;
	Fri, 10 May 2024 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8O+Gmxz"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8258161935
	for <linux-watchdog@vger.kernel.org>; Fri, 10 May 2024 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336324; cv=none; b=UM891DOLLlp2Bk3Ulift7popCBtEQqFWMBz9y75SVw4bZKcjNdX/sVRv8ciYyVdS6lC/t7d7OWYczxkbHRUP6iEb56iZP0l/jae4zYiU2P+dvUcVRye2aZ5yFTmHzS/whnB81d1kOQbMw2iG+AiKJXrDp0aOY4t8jlEy+1sAbIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336324; c=relaxed/simple;
	bh=5JlYe73jIem02xH1w770yLEniOhcmIDGWw/K0zB19YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVJ+Xqil9jd6mkmg5kmCg2yaosPFBPjFdCUaAtdzVbPotGrLgU9VzQwR2IXLPCm6Q9zdyw5pQ/7HNlVoriFiKTNmJh8MYyEgJUhTPM26XH7tDItCKaHuHX8koa0OCmgNfHgCNh7Z0CiDnlvD0iGyD5hpoGHBL34funF2t7xbsH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8O+Gmxz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29CDC32781;
	Fri, 10 May 2024 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336324;
	bh=5JlYe73jIem02xH1w770yLEniOhcmIDGWw/K0zB19YA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k8O+Gmxz6Y4nUMC8zDllYBw9i2v5f9wj275UxugYX6Flc+DxkCQRWZqxnKqM04VtM
	 cGcI5p17wcPSpJr4N2kBANRFPbRBW2ITmbrnHuEy1Uo9HMMv14oCp7170CA5V5s1kN
	 MQr9mrxg0Ag7ZiPbDtEe7ytnOvZW3E1YROGysdcdjyi0/Zy/ytITyjohuwNODEdOWq
	 tW6yIFzy3nTPmufV9TLEHyGtUifHDgJhbMSGX5aIsP0mmP6FxJPr5xkbX9m2JkNEWy
	 xLlDtrzx8sjMDUVxsCLo73bfNRKbwa+VftWZHLAnJa4BlTMEr/bKLln876+Algbf81
	 OG1T2Fm6nv2bg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v10 5/9] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
Date: Fri, 10 May 2024 12:18:15 +0200
Message-ID: <20240510101819.13551-6-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240510101819.13551-1-kabel@kernel.org>
References: <20240510101819.13551-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the watchdog mechanism provided by the MCU.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/Kconfig                |   2 +
 drivers/platform/cznic/Makefile               |   1 +
 .../platform/cznic/turris-omnia-mcu-base.c    |   4 +
 .../cznic/turris-omnia-mcu-watchdog.c         | 128 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
 5 files changed, 159 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index c1e719235517..e262930b3faf 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -19,6 +19,7 @@ config TURRIS_OMNIA_MCU
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select RTC_CLASS
+	select WATCHDOG_CORE
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
@@ -26,6 +27,7 @@ config TURRIS_OMNIA_MCU
 	  - board poweroff into true low power mode (with voltage regulators
 	    disabled) and the ability to configure wake up from this mode (via
 	    rtcwake)
+	  - MCU watchdog
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index a185ef882e44..687f7718c0a1 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-y		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 479f355f730a..f44996588d38 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -376,6 +376,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	err = omnia_mcu_register_watchdog(mcu);
+	if (err)
+		return err;
+
 	return omnia_mcu_register_gpiochip(mcu);
 }
 
diff --git a/drivers/platform/cznic/turris-omnia-mcu-watchdog.c b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
new file mode 100644
index 000000000000..da2efc32df8f
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU watchdog driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/i2c.h>
+#include <linux/moduleparam.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/types.h>
+#include <linux/units.h>
+#include <linux/watchdog.h>
+
+#include "turris-omnia-mcu.h"
+
+#define WATCHDOG_TIMEOUT		120
+
+static unsigned int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+			   __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static int omnia_wdt_start(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, OMNIA_CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_stop(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, OMNIA_CMD_SET_WATCHDOG_STATE, 0);
+}
+
+static int omnia_wdt_ping(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, OMNIA_CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_set_timeout(struct watchdog_device *wdt,
+				 unsigned int timeout)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u16(mcu->client, OMNIA_CMD_SET_WDT_TIMEOUT,
+				   timeout * DECI);
+}
+
+static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+	u16 timeleft;
+	int err;
+
+	err = omnia_cmd_read_u16(mcu->client, OMNIA_CMD_GET_WDT_TIMELEFT,
+				 &timeleft);
+	if (err) {
+		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
+			err);
+		return 0;
+	}
+
+	return timeleft / DECI;
+}
+
+static const struct watchdog_info omnia_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "Turris Omnia MCU Watchdog",
+};
+
+static const struct watchdog_ops omnia_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= omnia_wdt_start,
+	.stop		= omnia_wdt_stop,
+	.ping		= omnia_wdt_ping,
+	.set_timeout	= omnia_wdt_set_timeout,
+	.get_timeleft	= omnia_wdt_get_timeleft,
+};
+
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu)
+{
+	struct device *dev = &mcu->client->dev;
+	u8 state;
+	int err;
+
+	if (!(mcu->features & OMNIA_FEAT_WDT_PING))
+		return 0;
+
+	mcu->wdt.info = &omnia_wdt_info;
+	mcu->wdt.ops = &omnia_wdt_ops;
+	mcu->wdt.parent = dev;
+	mcu->wdt.min_timeout = 1;
+	mcu->wdt.max_timeout = 65535 / DECI;
+
+	mcu->wdt.timeout = WATCHDOG_TIMEOUT;
+	watchdog_init_timeout(&mcu->wdt, timeout, dev);
+
+	watchdog_set_drvdata(&mcu->wdt, mcu);
+
+	omnia_wdt_set_timeout(&mcu->wdt, mcu->wdt.timeout);
+
+	err = omnia_cmd_read_u8(mcu->client, OMNIA_CMD_GET_WATCHDOG_STATE,
+				&state);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot get MCU watchdog state\n");
+
+	if (state)
+		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
+
+	watchdog_set_nowayout(&mcu->wdt, nowayout);
+	watchdog_stop_on_reboot(&mcu->wdt);
+	err = devm_watchdog_register_device(dev, &mcu->wdt);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Cannot register MCU watchdog\n");
+
+	return 0;
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index 2648046231ed..f54d17af457d 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/rtc.h>
 #include <linux/types.h>
+#include <linux/watchdog.h>
 #include <linux/workqueue.h>
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
@@ -43,6 +44,9 @@ struct omnia_mcu {
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
+
+	/* MCU watchdog */
+	struct watchdog_device wdt;
 };
 
 int omnia_cmd_write_read(const struct i2c_client *client,
@@ -55,6 +59,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
 	return omnia_cmd_write_read(client, cmd, len, NULL, 0);
 }
 
+static inline int omnia_cmd_write_u8(const struct i2c_client *client, u8 cmd,
+				     u8 val)
+{
+	u8 buf[2] = { cmd, val };
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
+static inline int omnia_cmd_write_u16(const struct i2c_client *client, u8 cmd,
+				      u16 val)
+{
+	u8 buf[3];
+
+	buf[0] = cmd;
+	put_unaligned_le16(val, &buf[1]);
+
+	return omnia_cmd_write(client, buf, sizeof(buf));
+}
+
 static inline int omnia_cmd_write_u32(const struct i2c_client *client, u8 cmd,
 				      u32 val)
 {
@@ -157,5 +180,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


