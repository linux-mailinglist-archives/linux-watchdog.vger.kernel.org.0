Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58E4275476
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Sep 2020 11:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIWJZR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Sep 2020 05:25:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41493 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIWJZR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Sep 2020 05:25:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id y4so16612635ljk.8;
        Wed, 23 Sep 2020 02:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k8Kfyehth2WG6E0exvGAjXEpLUhHN58IsH6PFqzcNEM=;
        b=W9zoNR3H1urcZeiDa0VUdJV+BZRFHdTj6TaZOi8zM3yJl5ANgwPqQw1C4+c4aFkKZO
         1oiRZKTqe8Mu+UkeRIvIMQQBQ8b+iraZchKcIGZkUNNwvNzr++5qhKRb6sYMf6CF7uXO
         MbIsYSkyGhu5QwSoqc3KjPksmUfIovf5+vKIy+bodOJ2phIrPxOrBSVVyS1nHBaCrOXe
         fjbuPVzLHk7uAkEZjvKuYbz6GSzsY095QP9+mgMWfsF9xcclsQJQJ7DqOnAqB+2u1+QN
         y2v81ZjhGL6wdNtpgamKyLrt19EUt+eDoH+cKWLmq4IUnIHTHK7QYqE4lPB/w4o64oRQ
         EviA==
X-Gm-Message-State: AOAM531JhpwANlBUykh1Is/Ok2RnT9fzoEiPgd+UsLbycpSsPZu7v34j
        QnOeXMhj6VEkA8g5p2I7Udg=
X-Google-Smtp-Source: ABdhPJy7nhPzKKB7VOzayeHVV9U8oFk4RbZdQUDH897FXsg1fZplQ9BbN1tOUSSbLO+xECAe2buSDQ==
X-Received: by 2002:a2e:7c09:: with SMTP id x9mr2724745ljc.192.1600853113659;
        Wed, 23 Sep 2020 02:25:13 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d1sm4515010lfe.182.2020.09.23.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 02:25:13 -0700 (PDT)
Date:   Wed, 23 Sep 2020 12:25:01 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 3/4] wdt: Support wdt on ROHM BD9576MUF and BD9573MUF
Message-ID: <7d3372a74ef6fd8ea216d1da3a2beb1d77f5cf64.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add Watchdog support for ROHM BD9576MUF and BD9573MUF PMICs which are
mainly used to power the R-Car series processors. The watchdog is
pinged using a GPIO and enabled using another GPIO. Additionally
watchdog time-out can be configured to HW prior starting the watchdog.
Watchdog timeout can be configured to detect only delayed ping or in
a window mode where also too fast pings are detected.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changes since v1:
 - removed unnecessary include
 - ordered includes alphabetically
 - unified error checks in probe

 drivers/watchdog/Kconfig      |  13 ++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/bd9576_wdt.c | 284 ++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)
 create mode 100644 drivers/watchdog/bd9576_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ab7aad5a1e69..d042a517a946 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -172,6 +172,19 @@ config BD70528_WATCHDOG
 	  Alternatively say M to compile the driver as a module,
 	  which will be called bd70528_wdt.
 
+config BD957XMUF_WATCHDOG
+	tristate "ROHM BD9576MUF and BD9573MUF PMIC Watchdog"
+	depends on MFD_ROHM_BD957XMUF
+	select WATCHDOG_CORE
+	help
+	  Support for the watchdog in the ROHM BD9576 and BD9573 PMICs.
+	  These PMIC ICs contain watchdog block which can be configured
+	  to toggle reset line if SoC fails to ping watchdog via GPIO.
+
+	  Say Y here to include support for the ROHM BD9576 or BD9573
+	  watchdog. Alternatively say M to compile the driver as a module,
+	  which will be called bd9576_wdt.
+
 config DA9052_WATCHDOG
 	tristate "Dialog DA9052 Watchdog"
 	depends on PMIC_DA9052 || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 97bed1d3d97c..14d75f98e3df 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -208,6 +208,7 @@ obj-$(CONFIG_XEN_WDT) += xen_wdt.o
 
 # Architecture Independent
 obj-$(CONFIG_BD70528_WATCHDOG) += bd70528_wdt.o
+obj-$(CONFIG_BD957XMUF_WATCHDOG) += bd9576_wdt.o
 obj-$(CONFIG_DA9052_WATCHDOG) += da9052_wdt.o
 obj-$(CONFIG_DA9055_WATCHDOG) += da9055_wdt.o
 obj-$(CONFIG_DA9062_WATCHDOG) += da9062_wdt.o
diff --git a/drivers/watchdog/bd9576_wdt.c b/drivers/watchdog/bd9576_wdt.c
new file mode 100644
index 000000000000..bd70a392e56a
--- /dev/null
+++ b/drivers/watchdog/bd9576_wdt.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 ROHM Semiconductors
+ *
+ * ROHM BD9576MUF and BD9573MUF Watchdog driver
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/rohm-bd957x.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+static bool nowayout;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		"Watchdog cannot be stopped once started (default=\"false\")");
+
+#define HW_MARGIN_MIN 2
+#define HW_MARGIN_MAX 4416
+#define BD957X_WDT_DEFAULT_MARGIN 4416
+
+struct bd9576_wdt_priv {
+	struct gpio_desc	*gpiod_ping;
+	struct gpio_desc	*gpiod_en;
+	struct device		*dev;
+	struct regmap		*regmap;
+	bool			always_running;
+	struct watchdog_device	wdd;
+};
+
+static void bd9576_wdt_disable(struct bd9576_wdt_priv *priv)
+{
+	gpiod_set_value_cansleep(priv->gpiod_en, 0);
+}
+
+static int bd9576_wdt_ping(struct watchdog_device *wdd)
+{
+	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
+
+	/* Pulse */
+	gpiod_set_value_cansleep(priv->gpiod_ping, 1);
+	gpiod_set_value_cansleep(priv->gpiod_ping, 0);
+
+	return 0;
+}
+
+static int bd9576_wdt_start(struct watchdog_device *wdd)
+{
+	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
+
+	gpiod_set_value_cansleep(priv->gpiod_en, 1);
+
+	return bd9576_wdt_ping(wdd);
+}
+
+static int bd9576_wdt_stop(struct watchdog_device *wdd)
+{
+	struct bd9576_wdt_priv *priv = watchdog_get_drvdata(wdd);
+
+	if (!priv->always_running)
+		bd9576_wdt_disable(priv);
+	else
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+
+	return 0;
+}
+
+static const struct watchdog_info bd957x_wdt_ident = {
+	.options	= WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
+			  WDIOF_SETTIMEOUT,
+	.identity	= "BD957x Watchdog",
+};
+
+static const struct watchdog_ops bd957x_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= bd9576_wdt_start,
+	.stop		= bd9576_wdt_stop,
+	.ping		= bd9576_wdt_ping,
+};
+
+/* Unit is hundreds of uS */
+#define FASTNG_MIN 23
+
+static int find_closest_fast(int target, int *sel, int *val)
+{
+	int i;
+	int window = FASTNG_MIN;
+
+	for (i = 0; i < 8 && window < target; i++)
+		window <<= 1;
+
+	*val = window;
+	*sel = i;
+
+	if (i == 8)
+		return -EINVAL;
+
+	return 0;
+
+}
+
+static int find_closest_slow_by_fast(int fast_val, int target, int *slowsel)
+{
+	int sel;
+	static const int multipliers[] = {2, 3, 7, 15};
+
+	for (sel = 0; sel < ARRAY_SIZE(multipliers) &&
+	     multipliers[sel] * fast_val < target; sel++)
+		;
+
+	if (sel == ARRAY_SIZE(multipliers))
+		return -EINVAL;
+
+	*slowsel = sel;
+
+	return 0;
+}
+
+static int find_closest_slow(int target, int *slow_sel, int *fast_sel)
+{
+	static const int multipliers[] = {2, 3, 7, 15};
+	int i, j;
+	int val = 0;
+	int window = FASTNG_MIN;
+
+	for (i = 0; i < 8; i++) {
+		for (j = 0; j < ARRAY_SIZE(multipliers); j++) {
+			int slow;
+
+			slow = window * multipliers[j];
+			if (slow >= target && (!val || slow < val)) {
+				val = slow;
+				*fast_sel = i;
+				*slow_sel = j;
+			}
+		}
+		window <<= 1;
+	}
+	if (!val)
+		return -EINVAL;
+
+	return 0;
+}
+
+#define BD957X_WDG_TYPE_WINDOW BIT(5)
+#define BD957X_WDG_TYPE_SLOW 0
+#define BD957X_WDG_TYPE_MASK BIT(5)
+#define BD957X_WDG_NG_RATIO_MASK 0x18
+#define BD957X_WDG_FASTNG_MASK 0x7
+
+static int bd957x_set_wdt_mode(struct bd9576_wdt_priv *priv, int hw_margin,
+			       int hw_margin_min)
+{
+	int ret, fastng, slowng, type, reg, mask;
+	struct device *dev = priv->dev;
+
+	/* convert to 100uS */
+	hw_margin *= 10;
+	hw_margin_min *= 10;
+	if (hw_margin_min) {
+		int min;
+
+		type = BD957X_WDG_TYPE_WINDOW;
+		dev_dbg(dev, "Setting type WINDOW 0x%x\n", type);
+		ret = find_closest_fast(hw_margin_min, &fastng, &min);
+		if (ret) {
+			dev_err(dev, "bad WDT window for fast timeout\n");
+			return ret;
+		}
+
+		ret = find_closest_slow_by_fast(min, hw_margin, &slowng);
+		if (ret) {
+			dev_err(dev, "bad WDT window\n");
+			return ret;
+		}
+
+	} else {
+		type = BD957X_WDG_TYPE_SLOW;
+		dev_dbg(dev, "Setting type SLOW 0x%x\n", type);
+		ret = find_closest_slow(hw_margin, &slowng, &fastng);
+		if (ret) {
+			dev_err(dev, "bad WDT window\n");
+			return ret;
+		}
+	}
+
+	slowng <<= ffs(BD957X_WDG_NG_RATIO_MASK) - 1;
+	reg = type | slowng | fastng;
+	mask = BD957X_WDG_TYPE_MASK | BD957X_WDG_NG_RATIO_MASK |
+	       BD957X_WDG_FASTNG_MASK;
+	ret = regmap_update_bits(priv->regmap, BD957X_REG_WDT_CONF,
+				 mask, reg);
+
+	return ret;
+}
+
+static int bd9576_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->parent->of_node;
+	struct bd9576_wdt_priv *priv;
+	u32 hw_margin = BD957X_WDT_DEFAULT_MARGIN, hw_margin_min = 0;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dev = dev;
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap) {
+		dev_err(dev, "No regmap found\n");
+		return -ENODEV;
+	}
+
+	priv->gpiod_en = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
+						     "rohm,watchdog-enable-gpios",
+						     0, GPIOD_OUT_LOW,
+						     "watchdog-enable");
+	if (IS_ERR(priv->gpiod_en))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_en),
+			      "getting watchdog-enable GPIO failed\n");
+
+	priv->gpiod_ping = devm_gpiod_get_from_of_node(dev, dev->parent->of_node,
+						     "rohm,watchdog-ping-gpios",
+						     0, GPIOD_OUT_LOW,
+						     "watchdog-ping");
+	if (IS_ERR(priv->gpiod_ping))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_ping),
+				     "getting watchdog-ping GPIO failed\n");
+
+	ret = of_property_read_u32(np, "hw_margin_ms", &hw_margin);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = of_property_read_u32(np, "rohm,hw-margin-min-ms", &hw_margin_min);
+	if (ret && ret != -EINVAL)
+		return ret;
+
+	ret = bd957x_set_wdt_mode(priv, hw_margin, hw_margin_min);
+	if (ret)
+		return ret;
+
+	priv->always_running = of_property_read_bool(np, "always-running");
+
+	watchdog_set_drvdata(&priv->wdd, priv);
+
+	priv->wdd.info			= &bd957x_wdt_ident;
+	priv->wdd.ops			= &bd957x_wdt_ops;
+	priv->wdd.min_hw_heartbeat_ms	= hw_margin_min;
+	priv->wdd.max_hw_heartbeat_ms	= hw_margin;
+	priv->wdd.parent		= dev;
+	priv->wdd.timeout		= (hw_margin / 2) * 1000;
+
+	watchdog_init_timeout(&priv->wdd, 0, dev);
+	watchdog_set_nowayout(&priv->wdd, nowayout);
+
+	watchdog_stop_on_reboot(&priv->wdd);
+
+	if (priv->always_running)
+		bd9576_wdt_start(&priv->wdd);
+
+	return devm_watchdog_register_device(dev, &priv->wdd);
+}
+
+static struct platform_driver bd9576_wdt_driver = {
+	.driver	= {
+		.name = "bd9576-wdt",
+	},
+	.probe	= bd9576_wdt_probe,
+};
+
+module_platform_driver(bd9576_wdt_driver);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("ROHM BD9576/BD9573 Watchdog driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:bd9576-wdt");
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
