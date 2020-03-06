Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E398217BF19
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Mar 2020 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgCFNiD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Mar 2020 08:38:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:37300 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgCFNiD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Mar 2020 08:38:03 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 763718030786;
        Fri,  6 Mar 2020 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WApw7rWc6R4s; Fri,  6 Mar 2020 16:28:35 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/7] watchdog: dw_wdt: Add DebugFS files
Date:   Fri, 6 Mar 2020 16:27:47 +0300
In-Reply-To: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306132836.763718030786@mail.baikalelectronics.ru>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

For the sake of the easier device-driver debug procedure, we added a
few DebugFS files with the next content: watchdog timeout, watchdog
pre-timeout, watchdog ping/kick operation, watchdog start/stop, device
registers dump. They are available only if kernel is configured with
DebugFS support.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 drivers/watchdog/dw_wdt.c | 150 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 3000120f7e39..9353d83f3e45 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/watchdog.h>
+#include <linux/debugfs.h>
 
 #define WDOG_CONTROL_REG_OFFSET		    0x00
 #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
@@ -38,8 +39,14 @@
 #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
 #define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
 #define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
+#define WDOG_COMP_PARAMS_5_REG_OFFSET       0xe4
+#define WDOG_COMP_PARAMS_4_REG_OFFSET       0xe8
+#define WDOG_COMP_PARAMS_3_REG_OFFSET       0xec
+#define WDOG_COMP_PARAMS_2_REG_OFFSET       0xf0
 #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
 #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
+#define WDOG_COMP_VERSION_REG_OFFSET        0xf8
+#define WDOG_COMP_TYPE_REG_OFFSET           0xfc
 
 /* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
 #define DW_WDT_NUM_TOPS		16
@@ -79,6 +86,10 @@ struct dw_wdt {
 	/* Save/restore */
 	u32			control;
 	u32			timeout;
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry		*dbgfs_dir;
+#endif
 };
 
 #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
@@ -430,6 +441,141 @@ static void dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
 			mult_frac(tops[idx], MSEC_PER_SEC, dw_wdt->rate);
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+static int dw_wdt_dbgfs_timeout_get(void *priv, u64 *val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	*val = dw_wdt_get_timeout(dw_wdt) / MSEC_PER_SEC;
+
+	return 0;
+}
+
+static int dw_wdt_dbgfs_timeout_set(void *priv, u64 val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	return dw_wdt_set_timeout(&dw_wdt->wdd, val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_timeout_fops,
+	dw_wdt_dbgfs_timeout_get, dw_wdt_dbgfs_timeout_set, "%llu\n");
+
+static int dw_wdt_dbgfs_pretimeout_get(void *priv, u64 *val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	*val = dw_wdt->wdd.pretimeout;
+
+	return 0;
+}
+
+static int dw_wdt_dbgfs_pretimeout_set(void *priv, u64 val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	return dw_wdt_set_pretimeout(&dw_wdt->wdd, val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_pretimeout_fops,
+	dw_wdt_dbgfs_pretimeout_get, dw_wdt_dbgfs_pretimeout_set, "%llu\n");
+
+static int dw_wdt_dbgfs_ping_set(void *priv, u64 val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	dw_wdt_ping(&dw_wdt->wdd);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_ping_fops,
+	NULL, dw_wdt_dbgfs_ping_set, "%llu\n");
+
+static int dw_wdt_dbgfs_en_get(void *priv, u64 *val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	*val = !!dw_wdt_is_enabled(dw_wdt);
+
+	return 0;
+}
+
+static int dw_wdt_dbgfs_en_set(void *priv, u64 val)
+{
+	struct dw_wdt *dw_wdt = priv;
+
+	if (val)
+		dw_wdt_start(&dw_wdt->wdd);
+	else
+		dw_wdt_stop(&dw_wdt->wdd);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(dw_wdt_dbgfs_en_fops,
+	dw_wdt_dbgfs_en_get, dw_wdt_dbgfs_en_set, "%llu\n");
+
+#define DW_WDT_DBGFS_REG(_name, _off) \
+{				      \
+	.name = _name,		      \
+	.offset = _off		      \
+}
+
+static const struct debugfs_reg32 dw_wdt_dbgfs_regs[] = {
+	DW_WDT_DBGFS_REG("cr", WDOG_CONTROL_REG_OFFSET),
+	DW_WDT_DBGFS_REG("torr", WDOG_TIMEOUT_RANGE_REG_OFFSET),
+	DW_WDT_DBGFS_REG("ccvr", WDOG_CURRENT_COUNT_REG_OFFSET),
+	DW_WDT_DBGFS_REG("crr", WDOG_COUNTER_RESTART_REG_OFFSET),
+	DW_WDT_DBGFS_REG("stat", WDOG_INTERRUPT_STATUS_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param5", WDOG_COMP_PARAMS_5_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param4", WDOG_COMP_PARAMS_4_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param3", WDOG_COMP_PARAMS_3_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param2", WDOG_COMP_PARAMS_2_REG_OFFSET),
+	DW_WDT_DBGFS_REG("param1", WDOG_COMP_PARAMS_1_REG_OFFSET),
+	DW_WDT_DBGFS_REG("version", WDOG_COMP_VERSION_REG_OFFSET),
+	DW_WDT_DBGFS_REG("type", WDOG_COMP_TYPE_REG_OFFSET)
+};
+
+static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt)
+{
+	struct device *dev = dw_wdt->wdd.parent;
+	struct debugfs_regset32 *regset;
+
+	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
+	if (!regset)
+		return;
+
+	regset->regs = dw_wdt_dbgfs_regs;
+	regset->nregs = ARRAY_SIZE(dw_wdt_dbgfs_regs);
+	regset->base = dw_wdt->regs;
+
+	dw_wdt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
+
+	debugfs_create_regset32("registers", 0444, dw_wdt->dbgfs_dir, regset);
+
+	debugfs_create_file_unsafe("timeout", 0600, dw_wdt->dbgfs_dir,
+				   dw_wdt, &dw_wdt_dbgfs_timeout_fops);
+
+	debugfs_create_file_unsafe("pretimeout", 0600, dw_wdt->dbgfs_dir,
+				   dw_wdt, &dw_wdt_dbgfs_pretimeout_fops);
+
+	debugfs_create_file_unsafe("ping", 0200, dw_wdt->dbgfs_dir,
+				   dw_wdt, &dw_wdt_dbgfs_ping_fops);
+
+	debugfs_create_file_unsafe("enable", 0600, dw_wdt->dbgfs_dir,
+				   dw_wdt, &dw_wdt_dbgfs_en_fops);
+}
+
+static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt)
+{
+	debugfs_remove_recursive(dw_wdt->dbgfs_dir);
+}
+
+#else /* !CONFIG_DEBUG_FS */
+
+static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt) {}
+static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt) {}
+
+#endif /* !CONFIG_DEBUG_FS */
+
 static int dw_wdt_drv_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -544,6 +690,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_disable_pclk;
 
+	dw_wdt_dbgfs_init(dw_wdt);
+
 	return 0;
 
 out_disable_pclk:
@@ -558,6 +706,8 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
 {
 	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
 
+	dw_wdt_dbgfs_clear(dw_wdt);
+
 	watchdog_unregister_device(&dw_wdt->wdd);
 	reset_control_assert(dw_wdt->rst);
 	clk_disable_unprepare(dw_wdt->pclk);
-- 
2.25.1

