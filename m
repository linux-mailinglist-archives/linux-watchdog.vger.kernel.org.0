Return-Path: <linux-watchdog+bounces-796-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3442688797C
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Mar 2024 17:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5780C1C20BEB
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Mar 2024 16:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7292445029;
	Sat, 23 Mar 2024 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gkl03SFL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D38622625
	for <linux-watchdog@vger.kernel.org>; Sat, 23 Mar 2024 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711212259; cv=none; b=KSEVAh7CZlvSiZa2ydKo/FPA8bO+NdrEo+ohHTT9s0p5iotmf3LkUczCaIoHQc//l5qLOGxISMzQQIyKxR4f3/mkfrxU7hEBXD7yR6rX78xu9cLpnZYB0lNpzoIPOEFG1ClumBcsYJgMt+bG1r/IDh0autnlqrhCrz65pwhnH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711212259; c=relaxed/simple;
	bh=In/IXGCPRimMw+ZGEg/IliMUS/entO1zlEEo2AAT1Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKAbuL7NAb3e798NJHuZ7a3Z0JC47zP1vP6yQds4e7LvMkPCv8KkgyLjPzHo7tg8v30N6tdPqMPD4XU4en2bZ0tA3dHkTtSEyHq5mKCKGOId+ZtMrwgXJ7xl/KqzwTLLXSPZIrVYvSIXcBrBqtkHb4HGAlTi6V1ysfqVvfqDNpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gkl03SFL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF80C433B1;
	Sat, 23 Mar 2024 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711212258;
	bh=In/IXGCPRimMw+ZGEg/IliMUS/entO1zlEEo2AAT1Ow=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gkl03SFLze3/LzngcESi+yZtq2zU0ceiQT2/ReNkaw8FSFWCndI7WV+ckqHCC+OOi
	 h2Dx2duhfxhySu7+HpKAlHDr12r8MhQU7jiE5SCLro2/BPEYldj3dqTKv7xlSNi4UP
	 g7229HQpxBNNPnaotEv/Q/6p8HSE06ND+lk8wN+MkE1G47cguQnIzeFFeMGA0zGYs5
	 NqvJkbnp6SdiNK748QEfz1TIk+Zj60USfyD5NHErUMI8jIymJOij0R9FWzJe+tj/q+
	 nA1t7ZZvt+jFdkgEi5vODApr/sIipagQGer1e4KT7crPgHIhN33upkXbBEIW/RdihL
	 fcuyr3Fn257fg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 05/11] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
Date: Sat, 23 Mar 2024 17:43:53 +0100
Message-ID: <20240323164359.21642-6-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240323164359.21642-1-kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
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
 .../cznic/turris-omnia-mcu-watchdog.c         | 122 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
 5 files changed, 153 insertions(+)
 create mode 100644 drivers/platform/cznic/turris-omnia-mcu-watchdog.c

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 0a752aa654fa..e2649cdecc38 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -20,6 +20,7 @@ config TURRIS_OMNIA_MCU
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select RTC_CLASS
+	select WATCHDOG_CORE
 	help
 	  Say Y here to add support for the features implemented by the
 	  microcontroller on the CZ.NIC's Turris Omnia SOHO router.
@@ -27,6 +28,7 @@ config TURRIS_OMNIA_MCU
 	  - board poweroff into true low power mode (with voltage regulators
 	    disabled) and the ability to configure wake up from this mode (via
 	    rtcwake)
+	  - MCU watchdog
 	  - GPIO pins
 	    - to get front button press events (the front button can be
 	      configured either to generate press events to the CPU or to change
diff --git a/drivers/platform/cznic/Makefile b/drivers/platform/cznic/Makefile
index 6f1470d1f673..a43997a12d74 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-objs		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-objs		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-objs		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 6ab4494335ca..5a45834003cd 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -331,6 +331,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
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
index 000000000000..94cdd6eea4c8
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia MCU watchdog driver
+ *
+ * 2024 by Marek Behún <kabel@kernel.org>
+ */
+
+#include <linux/moduleparam.h>
+#include <linux/turris-omnia-mcu-interface.h>
+#include <linux/types.h>
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
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_stop(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 0);
+}
+
+static int omnia_wdt_ping(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u8(mcu->client, CMD_SET_WATCHDOG_STATE, 1);
+}
+
+static int omnia_wdt_set_timeout(struct watchdog_device *wdt,
+				 unsigned int timeout)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+
+	return omnia_cmd_write_u16(mcu->client, CMD_SET_WDT_TIMEOUT,
+				   timeout * 10);
+}
+
+static unsigned int omnia_wdt_get_timeleft(struct watchdog_device *wdt)
+{
+	struct omnia_mcu *mcu = watchdog_get_drvdata(wdt);
+	int ret;
+
+	ret = omnia_cmd_read_u16(mcu->client, CMD_GET_WDT_TIMELEFT);
+	if (ret < 0) {
+		dev_err(&mcu->client->dev, "Cannot get watchdog timeleft: %d\n",
+			ret);
+		return 0;
+	}
+
+	return ret / 10;
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
+	int ret;
+
+	if (!(mcu->features & FEAT_WDT_PING))
+		return 0;
+
+	mcu->wdt.info = &omnia_wdt_info;
+	mcu->wdt.ops = &omnia_wdt_ops;
+	mcu->wdt.parent = dev;
+	mcu->wdt.min_timeout = 1;
+	mcu->wdt.max_timeout = 6553; /* 65535 deciseconds */
+
+	mcu->wdt.timeout = WATCHDOG_TIMEOUT;
+	watchdog_init_timeout(&mcu->wdt, timeout, dev);
+
+	watchdog_set_drvdata(&mcu->wdt, mcu);
+
+	omnia_wdt_set_timeout(&mcu->wdt, mcu->wdt.timeout);
+
+	ret = omnia_cmd_read_u8(mcu->client, CMD_GET_WATCHDOG_STATE);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Cannot get MCU watchdog state\n");
+
+	if (ret)
+		set_bit(WDOG_HW_RUNNING, &mcu->wdt.status);
+
+	watchdog_set_nowayout(&mcu->wdt, nowayout);
+	watchdog_stop_on_reboot(&mcu->wdt);
+	ret = devm_watchdog_register_device(dev, &mcu->wdt);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Cannot register MCU watchdog\n");
+
+	return 0;
+}
diff --git a/drivers/platform/cznic/turris-omnia-mcu.h b/drivers/platform/cznic/turris-omnia-mcu.h
index af9845d1c6d2..3e2c96079e64 100644
--- a/drivers/platform/cznic/turris-omnia-mcu.h
+++ b/drivers/platform/cznic/turris-omnia-mcu.h
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/rtc.h>
 #include <linux/types.h>
+#include <linux/watchdog.h>
 #include <linux/workqueue.h>
 #include <asm/byteorder.h>
 #include <asm/unaligned.h>
@@ -42,6 +43,9 @@ struct omnia_mcu {
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
+
+	/* MCU watchdog */
+	struct watchdog_device wdt;
 };
 
 static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
@@ -54,6 +58,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
 	return ret < 0 ? ret : 0;
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
@@ -148,5 +171,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


