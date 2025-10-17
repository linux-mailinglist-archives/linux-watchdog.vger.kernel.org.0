Return-Path: <linux-watchdog+bounces-4396-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A6DBE8059
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 076FF400ACD
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Oct 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF452DEA9E;
	Fri, 17 Oct 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aWSJzda9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA262D6E5B
	for <linux-watchdog@vger.kernel.org>; Fri, 17 Oct 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696171; cv=none; b=DC8TC66gjKlQcPyjs82Rw+pCxEl2D30aDh/irRPva+3NEpYhba/cEKlk7uSqtAFdeYjYztGgbFVOkKpmt2o8SbncPhqdJZH+2RFVwUJXkmeXA/+6zucmnXrRbdbzaxJLUKhhlg2NdMVnPsf9M2FKf9gnoH+xHZK5F+GA8gqm9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696171; c=relaxed/simple;
	bh=vMSn8yjCZzU54W7MftqW4XqFFKberbqrACM/RdZnh9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBUMEeJLL2O7zOn0avODhIlbTYluEl/uWPw0jv/+r876ZmFmAtS1eauzalNp6LFCbEbW7VeqObua1UCIxUFjj5hJEXRF92C4Kspi26VHyvI2I2kIiD+e/NVI6NFiT2IGXlMrTVJalV+Bbjtij1d4suaJwpKdQ+5VC9QCgmqShu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aWSJzda9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=r+ihKEvJ3gg6fiHaJJ6qF4/SlebrWP8El/H6p7rO5wc=; b=aWSJzd
	a9zs3URVlvef5U8u/ziAcqSe/znUF8I8gDSKdt3H6CU/2lGA5alpT3ZiuOS+e5ZJ
	l6Qw4ZW03Fx6lhUHZVXYYrQa/CisHjFZMj85Rd6nXi6WACp33KDAI8O0XPZws1n/
	lX9qccYvVhGwSiWEd4RnxzWdBCCmWlik7QxMCUzAmttw9Pkxmjj/v2povDb15BA0
	g3/0TzO2zpjYP+w4ncHVIKAt627NPSfzXRgVlWkOHL2CLBV2SrEPCEZryh+KBK4t
	+lMWfpWIDkn3GdxsEQN64vNhoialtl320bFInIlz7MOezQlUK+dCegMgL5HZg3+X
	T7CFk6KhIBqGV7RQ==
Received: (qmail 4183361 invoked from network); 17 Oct 2025 12:16:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 12:16:07 +0200
X-UD-Smtp-Session: l3s3148p1@JqCVBVhBENwgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 2/2] watchdog: renesas_wwdt: add driver
Date: Fri, 17 Oct 2025 12:15:49 +0200
Message-ID: <20251017101549.4275-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
References: <20251017101549.4275-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver adds support for the Renesas Window Watchdog Timer (WWDT).
Because it can only be setup once after boot and we cannot know if this
already happened in early boot stages, it is mandated that the firmware
configures the watchdog. Linux then adapts according to the given
setup. Note that this watchdog only reports an overflow to the Error
Control Module (ECM) and does not reset the SoC on its own.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v2:

* use container_of instead of drvdata (Guenter)
* explain ECM connection a little more
* added tag from Guenter (Thanks!)

Changes since v1:

* support not only V4H but all Gen3/4 SoCs having this WWDT
* update commit message and add introductory comment to explain how
  this WWDT is handled as a "read-only" device basically
* dropped pretimeout flag because this feature cannot be configured
  from userspace
* added bitfield.h to prevent build failures
* switched to "GPL" licence string
* cosmetic updates

 drivers/watchdog/Kconfig        |   8 ++
 drivers/watchdog/Makefile       |   1 +
 drivers/watchdog/renesas_wwdt.c | 163 ++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/watchdog/renesas_wwdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 05008d937e40..792d0d831336 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -969,6 +969,14 @@ config RENESAS_WDT
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas R-Car and other SH-Mobile SoCs (usually named RWDT or SWDT).
 
+config RENESAS_WWDT
+	tristate "Renesas Window WWDT Watchdog"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This driver adds watchdog support for a window timer found in some
+	  Renesas R-Car Gen3 and later SoCs.
+
 config RENESAS_RZAWDT
 	tristate "Renesas RZ/A WDT Watchdog"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b680e4d3c1bc..ba52099b1253 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
 obj-$(CONFIG_LPC18XX_WATCHDOG) += lpc18xx_wdt.o
 obj-$(CONFIG_BCM7038_WDT) += bcm7038_wdt.o
 obj-$(CONFIG_RENESAS_WDT) += renesas_wdt.o
+obj-$(CONFIG_RENESAS_WWDT) += renesas_wwdt.o
 obj-$(CONFIG_RENESAS_RZAWDT) += rza_wdt.o
 obj-$(CONFIG_RENESAS_RZN1WDT) += rzn1_wdt.o
 obj-$(CONFIG_RENESAS_RZG2LWDT) += rzg2l_wdt.o
diff --git a/drivers/watchdog/renesas_wwdt.c b/drivers/watchdog/renesas_wwdt.c
new file mode 100644
index 000000000000..b250913c349a
--- /dev/null
+++ b/drivers/watchdog/renesas_wwdt.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Renesas Window Watchdog Timer (WWDT)
+ *
+ * The WWDT can only be setup once after boot. Because we cannot know if this
+ * already happened in early boot stages, it is mandated that the firmware
+ * configures the watchdog. Linux then adapts according to the given setup.
+ * Note that this watchdog reports in the default configuration an overflow to
+ * the Error Control Module which then decides further actions. Or the WWDT is
+ * configured to generate an interrupt.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define WDTA0WDTE	0x00
+#define WDTA0RUN	BIT(7)
+#define WDTA0_KEY	0x2c
+
+#define WDTA0MD		0x0c
+#define WDTA0OVF(x)	FIELD_GET(GENMASK(6, 4), x)
+#define WDTA0WIE	BIT(3)
+#define WDTA0ERM	BIT(2)
+#define WDTA0WS(x)	FIELD_GET(GENMASK(1, 0), x)
+
+struct wwdt_priv {
+	void __iomem *base;
+	struct watchdog_device wdev;
+};
+
+static int wwdt_start(struct watchdog_device *wdev)
+{
+	struct wwdt_priv *priv = container_of(wdev, struct wwdt_priv, wdev);
+
+	writeb(WDTA0RUN | WDTA0_KEY, priv->base + WDTA0WDTE);
+	return 0;
+}
+
+static const struct watchdog_info wwdt_ident = {
+	.options = WDIOF_KEEPALIVEPING | WDIOF_ALARMONLY,
+	.identity = "Renesas Window Watchdog",
+};
+
+static const struct watchdog_ops wwdt_ops = {
+	.owner = THIS_MODULE,
+	.start = wwdt_start,
+};
+
+static irqreturn_t wwdt_error_irq(int irq, void *dev_id)
+{
+	struct device *dev = dev_id;
+
+	dev_warn(dev, "Watchdog timed out\n");
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wwdt_pretimeout_irq(int irq, void *dev_id)
+{
+	struct watchdog_device *wdev = dev_id;
+
+	watchdog_notify_pretimeout(wdev);
+	return IRQ_HANDLED;
+}
+
+static int wwdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct wwdt_priv *priv;
+	struct watchdog_device *wdev;
+	struct clk *clk;
+	unsigned long rate;
+	unsigned int interval, window_size;
+	int ret;
+	u8 val;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	clk = devm_clk_get(dev, "cnt");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	rate = clk_get_rate(clk);
+	if (!rate)
+		return -EINVAL;
+
+	wdev = &priv->wdev;
+
+	val = readb(priv->base + WDTA0WDTE);
+	if (val & WDTA0RUN)
+		set_bit(WDOG_HW_RUNNING, &wdev->status);
+
+	val = readb(priv->base + WDTA0MD);
+	interval = 1 << (9 + WDTA0OVF(val));
+	/* size of the closed(!) window per mille */
+	window_size = 250 * (3 - WDTA0WS(val));
+
+	wdev->info = &wwdt_ident;
+	wdev->ops = &wwdt_ops;
+	wdev->parent = dev;
+	wdev->min_hw_heartbeat_ms = window_size * interval / rate;
+	wdev->max_hw_heartbeat_ms = 1000 * interval / rate;
+	wdev->timeout = DIV_ROUND_UP(wdev->max_hw_heartbeat_ms, 1000);
+	watchdog_set_nowayout(wdev, true);
+
+	if (!(val & WDTA0ERM)) {
+		ret = platform_get_irq_byname(pdev, "error");
+		if (ret < 0)
+			return ret;
+
+		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_error_irq,
+						IRQF_ONESHOT, NULL, dev);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (val & WDTA0WIE) {
+		ret = platform_get_irq_byname(pdev, "pretimeout");
+		if (ret < 0)
+			return ret;
+
+		ret = devm_request_threaded_irq(dev, ret, NULL, wwdt_pretimeout_irq,
+						IRQF_ONESHOT, NULL, wdev);
+		if (ret < 0)
+			return ret;
+	}
+
+	devm_watchdog_register_device(dev, wdev);
+
+	return 0;
+}
+
+static const struct of_device_id renesas_wwdt_ids[] = {
+	{ .compatible = "renesas,rcar-gen3-wwdt", },
+	{ .compatible = "renesas,rcar-gen4-wwdt", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, renesas_wwdt_ids);
+
+static struct platform_driver renesas_wwdt_driver = {
+	.driver = {
+		.name = "renesas_wwdt",
+		.of_match_table = renesas_wwdt_ids,
+	},
+	.probe = wwdt_probe,
+};
+module_platform_driver(renesas_wwdt_driver);
+
+MODULE_DESCRIPTION("Renesas Window Watchdog (WWDT) Driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Wolfram Sang <wsa+renesas@sang-engineering.com>");
-- 
2.47.2


