Return-Path: <linux-watchdog+bounces-1009-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA058B74E5
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Apr 2024 13:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7B61F226D3
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Apr 2024 11:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE69F134412;
	Tue, 30 Apr 2024 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhKfkDaD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B413C9D6
	for <linux-watchdog@vger.kernel.org>; Tue, 30 Apr 2024 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714477897; cv=none; b=bnWFJ6Duary9hQ+5jawln9xXlZw6C8ceOCDpaYLUctteJCBG/w1qecG4vJ0vLM6+MmeXmcqaELqdnOBpnkj+NGUUraK3VEWG+jMEZ3jcOWnX0k4F3aerESZG1Joplo8xtv9ZyPt5FPhAk51mpa0Ajxinp6i6A6C1EqCx++YgItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714477897; c=relaxed/simple;
	bh=6QQgO4OE8g0J20HWgsYfEmJIjE2p894ZlU8e2pvS5Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/IS9UsykkCVQOVZSBlvieuc15ZRMdBnqTUeeK3JuKeGn3SA2SZRPEanJ3MyKG78e/j0xXBJkEoSNrXWw1yr1/n9wIEqdoLYXgfGlKRtGC4gS2Uaa/DjCZLyW5QqDB31QUNWX06yJoSQtut6OydSg5gNG/YaJvnIQRLNGouHR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhKfkDaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B4C4AF18;
	Tue, 30 Apr 2024 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714477897;
	bh=6QQgO4OE8g0J20HWgsYfEmJIjE2p894ZlU8e2pvS5Fw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rhKfkDaD0H2xRiy+xbiWLmZrn/np3wM7mEV7Up/MLDxmm3lskuUwK7QpRMdYz8bRW
	 AuSkfRerumMZcLcI8thAUiGYOGnJ+5MjCvHWR4gxj2N/vSrF2NULUx6a1sM62ipHok
	 cypPc8fHqLqmEaDmYOq/x13R+WApPacNUC2t1aubvtgHZwhfpbSy7O6ItY3gAKojpl
	 Rge/1EpXzhibPXv5qoV0ztisCqhJ5Pay8H8xajrrdfCme36T2yTrvl5QDaTDgGEkN5
	 o4XvmLJBS5vS40cVbDOqi8SN+KI3OZ8bhIcbaWObxzGyNRboQv6gujZzDCNG5kiKTN
	 xm3yRR20Y0shg==
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
Subject: [PATCH v8 5/9] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
Date: Tue, 30 Apr 2024 13:51:07 +0200
Message-ID: <20240430115111.3453-6-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240430115111.3453-1-kabel@kernel.org>
References: <20240430115111.3453-1-kabel@kernel.org>
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
 .../cznic/turris-omnia-mcu-watchdog.c         | 123 ++++++++++++++++++
 drivers/platform/cznic/turris-omnia-mcu.h     |  24 ++++
 5 files changed, 154 insertions(+)
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
index a185ef882e44..687f7718c0a1 100644
--- a/drivers/platform/cznic/Makefile
+++ b/drivers/platform/cznic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
 turris-omnia-mcu-y		:= turris-omnia-mcu-base.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-gpio.o
 turris-omnia-mcu-y		+= turris-omnia-mcu-sys-off-wakeup.o
+turris-omnia-mcu-y		+= turris-omnia-mcu-watchdog.o
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 697ace090bda..5f88119d825c 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -365,6 +365,10 @@ static int omnia_mcu_probe(struct i2c_client *client)
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
index 000000000000..b0de9585da84
--- /dev/null
+++ b/drivers/platform/cznic/turris-omnia-mcu-watchdog.c
@@ -0,0 +1,123 @@
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
index 6179a4f2069e..1838cb3d636e 100644
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
@@ -41,6 +42,9 @@ struct omnia_mcu {
 	struct rtc_device *rtcdev;
 	u32 rtc_alarm;
 	bool front_button_poweron;
+
+	/* MCU watchdog */
+	struct watchdog_device wdt;
 };
 
 int omnia_cmd_write_read(const struct i2c_client *client,
@@ -53,6 +57,25 @@ static inline int omnia_cmd_write(const struct i2c_client *client, void *cmd,
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
@@ -129,5 +152,6 @@ extern const struct attribute_group omnia_mcu_poweroff_group;
 
 int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu);
 int omnia_mcu_register_sys_off_and_wakeup(struct omnia_mcu *mcu);
+int omnia_mcu_register_watchdog(struct omnia_mcu *mcu);
 
 #endif /* __TURRIS_OMNIA_MCU_H */
-- 
2.43.2


