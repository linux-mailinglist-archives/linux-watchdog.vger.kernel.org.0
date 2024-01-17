Return-Path: <linux-watchdog+bounces-393-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF9F830374
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jan 2024 11:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9251C1C23CD2
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Jan 2024 10:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6A11429A;
	Wed, 17 Jan 2024 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N29Bm0hc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C31B97E
	for <linux-watchdog@vger.kernel.org>; Wed, 17 Jan 2024 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705487101; cv=none; b=CSyfKW+pKEXcu/kcJOII1JQUb4l3G1aLMPIvCEUBb9ynXpCN4set1K+qdOv/kifgLROncZLQtbxAFyliOYFOZmqGVyjENTHGZFh/gWyBSQG9hDLdW5TjM83AhnLJKEyxhQsTq+DF+t/324entkFD/VzWfk2VjAdYrCY0CyfVH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705487101; c=relaxed/simple;
	bh=HLX5iGTYTLOPEEfTpBgxJbAQtYQeAl905P8kK0bfvI4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=P3Q8O21whcnNUfLg1rcp0DGPqSYZRoZM/FGyZEybgSHf8lLYjQAdw7bfu7i/o/SxzbHKEQN44AgYhCblfw6OcQr0F4pEE+AcOFCtFDdK4cxSSo+S5Qvnq4oEMoUwBit7yImXmhqGNW9pNkXdfa1x6ilVp5vprSOqhauE/Y8kix0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N29Bm0hc; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e766937ddso12212635e87.3
        for <linux-watchdog@vger.kernel.org>; Wed, 17 Jan 2024 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705487096; x=1706091896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDEtDY05BH1w9NcY1Olov6GfJjLNe1+CsfEFO2x8wCY=;
        b=N29Bm0hcigG6OupcP1E+ft3pm4TZCpl8Kt60biz72aJZfNu5zTEaMxBfKC1nz5FO5I
         LggoeSwgNKGaz87ybt4ZozTBg6qFUpxPKKct8adL6nQ5+PRXXeU/GK7N52J/5qWHxTHm
         OTFapsG3fpO6rQkm7D4/d8fa85KIoz+RY+I/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705487096; x=1706091896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDEtDY05BH1w9NcY1Olov6GfJjLNe1+CsfEFO2x8wCY=;
        b=O3yHpiIWROb1Te43oFIJhad7c8v6v4ocVQ+c/9kfkZg70wZhH6XoNXVat2TJQ/bUQe
         KM7BrHOpPxbY7i7jVNDRvSwYGIWboNJtS5PyYnk+TocOgqvk5NwZcMyTVNJtYfOA0TQY
         3HEMaSzSOSLwB3HF4ctcRNXWjlDZpXNBCiDi6h7CeflX0r1jhVVEvhQ1Pwtqu5Irdmxa
         Dw1fYyK6cm5xdbgGKDhavWwUoQN8y3E9F1F6uLZtgXT0ZgJhrM4VUZQ+Dc5tJ/qUxSEl
         OOd5Ck9kSO7dC0E+J/4dRHkpuYiZi6E67/89fz8dNIs3kE/IT6Qb32hS4szt7TPj7/mL
         Ykbw==
X-Gm-Message-State: AOJu0YynIS5YLwFLkb8C/7J0mYfnQ1Sf7n+A+nwVjiy+TDdN6c2dH0ap
	DF9Olh43yYGANxr7KuTYdm+ZSxuG2jPy
X-Google-Smtp-Source: AGHT+IGKRu/2iYM07hmccENrXOs8U8kmdBKoqmwADq2dBvZWUV6UQEgpvceZ37jkzEI8axbDmOWGsQ==
X-Received: by 2002:a05:6512:1586:b0:50e:4509:ef76 with SMTP id bp6-20020a056512158600b0050e4509ef76mr4423792lfb.83.1705487095956;
        Wed, 17 Jan 2024 02:24:55 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id q20-20020a056512211400b0050bea32beeasm206734lfr.216.2024.01.17.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 02:24:55 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>
Cc: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Lukasz Majczak <lma@chromium.org>
Subject: [PATCH] drivers: watchdog: Add ChromeOS EC watchdog
Date: Wed, 17 Jan 2024 10:24:49 +0000
Message-ID: <20240117102450.4080839-1-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds EC-based watchdog support for ChromeOS
based devices equipped with embedded controller (EC).

Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 MAINTAINERS                                   |   6 +
 drivers/mfd/cros_ec_dev.c                     |   9 +
 drivers/watchdog/Kconfig                      |  15 +
 drivers/watchdog/Makefile                     |   3 +
 drivers/watchdog/cros_ec_wdt.c                | 303 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  78 ++---
 6 files changed, 370 insertions(+), 44 deletions(-)
 create mode 100644 drivers/watchdog/cros_ec_wdt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 391bbb855cbe..55cd626a525f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4952,6 +4952,12 @@ R:	Sami Kyöstilä <skyostil@chromium.org>
 S:	Maintained
 F:	drivers/platform/chrome/cros_hps_i2c.c
 
+CHROMEOS EC WATCHDOG
+M:	Lukasz Majczak <lma@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+F:	drivers/watchdog/cros_ec_wdt.c
+
 CHRONTEL CH7322 CEC DRIVER
 M:	Joe Tessler <jrt@google.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 79d393b602bf..60fe831cf30a 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -91,6 +91,10 @@ static const struct mfd_cell cros_usbpd_notify_cells[] = {
 	{ .name = "cros-usbpd-notify", },
 };
 
+static const struct mfd_cell cros_ec_wdt_cells[] = {
+	{ .name = "cros-ec-wdt-drv", }
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -107,6 +111,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_usbpd_charger_cells,
 		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
 	},
+	{
+		.id		= EC_FEATURE_HANG_DETECT,
+		.mfd_cells	= cros_ec_wdt_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7d22051b15a2..1da4be661be8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2251,4 +2251,19 @@ config KEEMBAY_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called keembay_wdt.
 
+#
+# ChromeOS EC-based Watchdog
+#
+
+config CROS_EC_WATCHDOG
+	tristate "ChromeOS EC-based watchdog driver"
+	select WATCHDOG_CORE
+	depends on CROS_EC
+	help
+	  This is the watchdog driver for ChromeOS devices equipped with EC.
+	  The EC watchdog - when enabled - expects to be kicked within a given
+	  time (default set to 30 seconds) otherwise it will simple reboot
+	  the AP. Priori to that it can also send an event (configurable timeout)
+	  about upcoming reboot.
+
 endif # WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 7cbc34514ec1..8295c209ddb0 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -234,3 +234,6 @@ obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
 obj-$(CONFIG_STPMIC1_WATCHDOG) += stpmic1_wdt.o
 obj-$(CONFIG_SL28CPLD_WATCHDOG) += sl28cpld_wdt.o
+
+# Cros EC watchdog
+obj-$(CONFIG_CROS_EC_WATCHDOG) += cros_ec_wdt.o
diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
new file mode 100644
index 000000000000..b461c0613269
--- /dev/null
+++ b/drivers/watchdog/cros_ec_wdt.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_data/cros_ec_commands.h>
+#include <linux/platform_data/cros_ec_proto.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+#include <linux/uaccess.h>
+
+#define CROS_EC_WATCHDOG_DEFAULT_TIME 30 /* seconds */
+
+#define DEV_NAME "cros-ec-wdt-dev"
+#define DRV_NAME "cros-ec-wdt-drv"
+
+static int cros_ec_wdt_ping(struct watchdog_device *wdd);
+static int cros_ec_wdt_start(struct watchdog_device *wdd);
+static int cros_ec_wdt_stop(struct watchdog_device *wdd);
+static int cros_ec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t);
+
+struct cros_ec_wdt_data {
+	bool start_on_resume;
+	bool keepalive_on;
+	struct cros_ec_device *cros_ec;
+	struct watchdog_device *wdd;
+};
+static struct cros_ec_wdt_data wd_data;
+
+static const struct watchdog_info cros_ec_wdt_ident = {
+	.options          = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.firmware_version = 0,
+	.identity         = DRV_NAME,
+};
+
+static const struct watchdog_ops cros_ec_wdt_ops = {
+	.owner		 = THIS_MODULE,
+	.ping		 = cros_ec_wdt_ping,
+	.start		 = cros_ec_wdt_start,
+	.stop		 = cros_ec_wdt_stop,
+	.set_timeout = cros_ec_wdt_set_timeout,
+};
+
+static struct watchdog_device cros_ec_wdd = {
+	.info = &cros_ec_wdt_ident,
+	.ops = &cros_ec_wdt_ops,
+	.timeout = CROS_EC_WATCHDOG_DEFAULT_TIME,
+	.bootstatus = EC_HANG_DETECT_AP_BOOT_NORMAL
+};
+
+static int cros_ec_wdt_send_hang_detect(struct cros_ec_wdt_data *wd_data,
+					uint16_t command,
+					uint16_t reboot_timeout_sec,
+					uint32_t *status)
+{
+	int ret;
+
+	struct {
+		struct cros_ec_command msg;
+		union {
+			struct ec_params_hang_detect req;
+			struct ec_response_hang_detect resp;
+		};
+	} __packed buf = {
+		.msg = {
+			.version = 0,
+			.command = EC_CMD_HANG_DETECT,
+			.insize  = (command == EC_HANG_DETECT_CMD_GET_STATUS) ?
+				   sizeof(struct ec_response_hang_detect) :
+				   0,
+			.outsize = sizeof(struct ec_params_hang_detect),
+		},
+		.req = {
+			.command = command,
+			.reboot_timeout_sec = reboot_timeout_sec,
+		}
+	};
+
+	ret = cros_ec_cmd_xfer_status(wd_data->cros_ec, &buf.msg);
+	if (ret < 0) {
+		dev_warn(wd_data->wdd->parent,
+				 "cros_ec_cmd_xfer_status failed(%d) command (%04x) reboot_timeout_sec(%ds)",
+				 ret, command, reboot_timeout_sec);
+		return ret;
+	}
+
+	if (status && (command == EC_HANG_DETECT_CMD_GET_STATUS)) {
+		*status = buf.resp.status;
+		dev_info(wd_data->wdd->parent, "EC Watchdog boot status (%d)",
+				 buf.resp.status);
+	}
+
+	return 0;
+}
+
+static int cros_ec_wdt_ping(struct watchdog_device *wdd)
+{
+	struct cros_ec_wdt_data *wd_data = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = cros_ec_wdt_send_hang_detect(wd_data, EC_HANG_DETECT_CMD_RELOAD,
+					   0, NULL);
+	if (ret < 0)
+		dev_err(wdd->parent, "%s failed (%d)", __func__, ret);
+	else
+		wd_data->keepalive_on = true;
+
+	return ret;
+}
+
+static int cros_ec_wdt_start(struct watchdog_device *wdd)
+{
+	struct cros_ec_wdt_data *wd_data = watchdog_get_drvdata(wdd);
+	int ret = 0;
+
+	/* Prepare watchdog on EC side */
+	ret = cros_ec_wdt_send_hang_detect(wd_data,
+					EC_HANG_DETECT_CMD_SET_TIMEOUT,
+					wdd->timeout,
+					NULL);
+	if (ret < 0)
+		dev_err(wdd->parent, "%s failed (%d)", __func__, ret);
+
+	return ret;
+}
+
+static int cros_ec_wdt_stop(struct watchdog_device *wdd)
+{
+	struct cros_ec_wdt_data *wd_data = watchdog_get_drvdata(wdd);
+	int ret = 0;
+
+	if (wd_data->keepalive_on) {
+		wd_data->keepalive_on = false;
+		ret = cros_ec_wdt_send_hang_detect(wd_data, EC_HANG_DETECT_CMD_CANCEL,
+						0, NULL);
+		if (ret < 0)
+			dev_err(wdd->parent, "%s failed (%d)", __func__, ret);
+	}
+
+	return ret;
+}
+
+static int cros_ec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
+{
+	struct cros_ec_wdt_data *wd_data = watchdog_get_drvdata(wdd);
+	int ret;
+
+	if (t < EC_HANG_DETECT_MIN_TIMEOUT) {
+		dev_err(wdd->parent,
+				"%s failed, requested timeout is lower than min(%d < %d)",
+				__func__, t, EC_HANG_DETECT_MIN_TIMEOUT);
+		return -EINVAL;
+	}
+
+	ret = cros_ec_wdt_send_hang_detect(wd_data,
+					   EC_HANG_DETECT_CMD_SET_TIMEOUT,
+					   t, NULL);
+	if (ret < 0)
+		dev_err(wdd->parent, "%s failed (%d)", __func__, ret);
+	else
+		wdd->timeout = t;
+
+	return ret;
+}
+
+static int cros_ec_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	/* We need to get a reference to cros_ec_devices
+	 * (provides communication layer) which is a parent of
+	 * the cros-ec-dev (our parent)
+	 */
+	struct cros_ec_device *cros_ec = dev_get_drvdata(dev->parent->parent);
+	int ret = 0;
+	uint32_t bootstatus;
+
+	if (!cros_ec) {
+		ret = -ENODEV;
+		dev_err_probe(dev, ret, "There is no coresponding EC device!");
+		return ret;
+	}
+
+	cros_ec_wdd.parent = &pdev->dev;
+	wd_data.cros_ec = cros_ec;
+	wd_data.wdd = &cros_ec_wdd;
+	wd_data.start_on_resume = false;
+	wd_data.keepalive_on = false;
+	wd_data.wdd->timeout = CROS_EC_WATCHDOG_DEFAULT_TIME;
+
+	watchdog_stop_on_reboot(&cros_ec_wdd);
+	watchdog_stop_on_unregister(&cros_ec_wdd);
+	watchdog_set_drvdata(&cros_ec_wdd, &wd_data);
+	platform_set_drvdata(pdev, &wd_data);
+
+	/* Get current AP boot status */
+	ret = cros_ec_wdt_send_hang_detect(&wd_data, EC_HANG_DETECT_CMD_GET_STATUS, 0,
+					   &bootstatus);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Couldn't get AP boot status from EC");
+		return ret;
+	}
+
+	/*
+	 * If bootstatus is not EC_HANG_DETECT_AP_BOOT_NORMAL
+	 * it mens EC has rebooted the AP due to watchdog timeout.
+	 * Lets translate it to watchdog core status code.
+	 */
+	if (bootstatus != EC_HANG_DETECT_AP_BOOT_NORMAL)
+		wd_data.wdd->bootstatus = WDIOF_CARDRESET;
+
+	ret = watchdog_register_device(&cros_ec_wdd);
+	if (ret < 0)
+		dev_err_probe(dev, ret, "Couldn't get AP boot status from EC");
+
+	return ret;
+}
+
+static int cros_ec_wdt_remove(struct platform_device *pdev)
+{
+	struct cros_ec_wdt_data *wd_data = platform_get_drvdata(pdev);
+
+	watchdog_unregister_device(wd_data->wdd);
+
+	return 0;
+}
+
+static void cros_ec_wdt_shutdown(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_wdt_data *wd_data = platform_get_drvdata(pdev);
+	int ret;
+
+	/*
+	 * Clean only bootstatus flag.
+	 * EC wdt is are already stopped by watchdog framework.
+	 */
+	ret = cros_ec_wdt_send_hang_detect(wd_data,
+					   EC_HANG_DETECT_CMD_CLEAR_STATUS, 0, NULL);
+	if (ret < 0)
+		dev_err(dev, "%s failed (%d)", __func__, ret);
+
+	watchdog_unregister_device(wd_data->wdd);
+}
+
+static int __maybe_unused cros_ec_wdt_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_wdt_data *wd_data = platform_get_drvdata(pdev);
+	int ret;
+
+	if (watchdog_active(wd_data->wdd)) {
+		ret = cros_ec_wdt_send_hang_detect(wd_data,
+						   EC_HANG_DETECT_CMD_CANCEL, 0, NULL);
+		if (ret < 0)
+			dev_err(dev, "%s failed (%d)", __func__, ret);
+		wd_data->start_on_resume = true;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused cros_ec_wdt_resume(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cros_ec_wdt_data *wd_data = platform_get_drvdata(pdev);
+	int ret;
+
+	/* start_on_resume is only set if watchdog was active
+	 * when device was going to sleep
+	 */
+	if (wd_data->start_on_resume) {
+		/* On resume we just need to setup a EC watchdog the same way as
+		 * in cros_ec_wdt_start(). When userspace resumes from suspend
+		 * the watchdog app should just start petting the watchdog again.
+		 */
+		ret = cros_ec_wdt_start(wd_data->wdd);
+		if (ret < 0)
+			dev_err(dev, "%s failed (%d)", __func__, ret);
+
+		wd_data->start_on_resume = false;
+	}
+
+	return 0;
+}
+
+static struct platform_driver cros_ec_wdt_driver = {
+	.probe		= cros_ec_wdt_probe,
+	.remove		= cros_ec_wdt_remove,
+	.shutdown	= cros_ec_wdt_shutdown,
+	.suspend	= pm_ptr(cros_ec_wdt_suspend),
+	.resume		= pm_ptr(cros_ec_wdt_resume),
+	.driver		= {
+		.name	= DRV_NAME,
+	},
+};
+
+module_platform_driver(cros_ec_wdt_driver);
+
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DESCRIPTION("Cros EC Watchdog Device Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 7dae17b62a4d..35a7a2d32819 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3961,60 +3961,50 @@ struct ec_response_i2c_passthru {
 } __ec_align1;
 
 /*****************************************************************************/
-/* Power button hang detect */
-
+/* AP hang detect */
 #define EC_CMD_HANG_DETECT 0x009F
 
-/* Reasons to start hang detection timer */
-/* Power button pressed */
-#define EC_HANG_START_ON_POWER_PRESS  BIT(0)
-
-/* Lid closed */
-#define EC_HANG_START_ON_LID_CLOSE    BIT(1)
-
- /* Lid opened */
-#define EC_HANG_START_ON_LID_OPEN     BIT(2)
-
-/* Start of AP S3->S0 transition (booting or resuming from suspend) */
-#define EC_HANG_START_ON_RESUME       BIT(3)
-
-/* Reasons to cancel hang detection */
+#define EC_HANG_DETECT_MIN_TIMEOUT 5
 
-/* Power button released */
-#define EC_HANG_STOP_ON_POWER_RELEASE BIT(8)
+/* EC hang detect commands */
+enum ec_hang_detect_cmds {
+	/* Reload AP hang detect timer. */
+	EC_HANG_DETECT_CMD_RELOAD = 0x0,
 
-/* Any host command from AP received */
-#define EC_HANG_STOP_ON_HOST_COMMAND  BIT(9)
+	/* Stop AP hang detect timer. */
+	EC_HANG_DETECT_CMD_CANCEL = 0x1,
 
-/* Stop on end of AP S0->S3 transition (suspending or shutting down) */
-#define EC_HANG_STOP_ON_SUSPEND       BIT(10)
+	/* Configure watchdog with given reboot timeout and
+	 * cancel currently running AP hand detect timer.
+	 */
+	EC_HANG_DETECT_CMD_SET_TIMEOUT = 0x2,
 
-/*
- * If this flag is set, all the other fields are ignored, and the hang detect
- * timer is started.  This provides the AP a way to start the hang timer
- * without reconfiguring any of the other hang detect settings.  Note that
- * you must previously have configured the timeouts.
- */
-#define EC_HANG_START_NOW             BIT(30)
+	/* Get last hang status - whether the AP boot was clear or not */
+	EC_HANG_DETECT_CMD_GET_STATUS = 0x3,
 
-/*
- * If this flag is set, all the other fields are ignored (including
- * EC_HANG_START_NOW).  This provides the AP a way to stop the hang timer
- * without reconfiguring any of the other hang detect settings.
- */
-#define EC_HANG_STOP_NOW              BIT(31)
+	/* Clear last hang status. Called when AP is rebooting/shutting down
+	 * gracefully.
+	 */
+	EC_HANG_DETECT_CMD_CLEAR_STATUS = 0x4
+};
 
 struct ec_params_hang_detect {
-	/* Flags; see EC_HANG_* */
-	uint32_t flags;
-
-	/* Timeout in msec before generating host event, if enabled */
-	uint16_t host_event_timeout_msec;
-
-	/* Timeout in msec before generating warm reboot, if enabled */
-	uint16_t warm_reboot_timeout_msec;
-} __ec_align4;
+	uint16_t command; /* enum ec_hang_detect_cmds */
+	/* Timeout in seconds before generating reboot */
+	uint16_t reboot_timeout_sec;
+} __ec_align2;
 
+/* Status codes that describe whether AP has boot normally or the hang has been
+ * detected and EC has reset AP
+ */
+enum ec_hang_detect_status {
+	EC_HANG_DETECT_AP_BOOT_NORMAL = 0x0,
+	EC_HANG_DETECT_AP_BOOT_EC_WDT = 0x1,
+	EC_HANG_DETECT_AP_BOOT_COUNT,
+};
+struct ec_response_hang_detect {
+	uint8_t status; /* enum ec_hang_detect_status */
+} __ec_align1;
 /*****************************************************************************/
 /* Commands for battery charging */
 
-- 
2.43.0.381.gb435a96ce8-goog


