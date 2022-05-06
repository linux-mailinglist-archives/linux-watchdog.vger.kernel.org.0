Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D2851DF89
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 May 2022 21:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389810AbiEFTQq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 May 2022 15:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351716AbiEFTQq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 May 2022 15:16:46 -0400
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72646213D;
        Fri,  6 May 2022 12:13:01 -0700 (PDT)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246E3SU1005604;
        Fri, 6 May 2022 19:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=4uodzZXaB5PoLqsO6VG4lbGyaD3wSMgxv2wuu7tmua8=;
 b=QZsTUXlf3nGPL6mvzgCsl0kIMEjOv33iKEO7Te5LcY7ZSSPPXLhm+8pMdBkFqz86UgoN
 PHiD+tAjKzZ3QFraBHmgCfsfczfPCBIEY0Gx7DGuS85a1CWSdR6fmaMQiki+bffR1bMW
 quMYBLUr0yR3dKjrySKtW8ETWp+EY8AdbhRhqKXR7JWrn14On3daq+qmnhuGj1usG359
 1MQjsGWAiwoEhYDSq/Hx1ZMVZWK9WvIoyzttNmB9Lcs6bmTkhLCyCYrSoXE88jspSCYG
 KAaHZRk8cb0RXjfkdx3h1XFafgYf7nW+zV7KOYbsjMjhjJzH8Iv3MC1TxR+6Fby04T6T JQ== 
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com [15.241.140.78])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3fw53f2dmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 May 2022 19:12:43 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3425.houston.hpe.com (Postfix) with ESMTP id 1FDFD9D;
        Fri,  6 May 2022 19:12:42 +0000 (UTC)
Received: from hpe.com (cigateway-dev.us.rdlabs.hpecorp.net [10.14.73.30])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 4326E48;
        Fri,  6 May 2022 19:12:41 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick.hawkins@hpe.com, joel@jms.id.au,
        arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v7 3/8] watchdog: hpe-wdt: Introduce HPE GXP Watchdog
Date:   Fri,  6 May 2022 14:13:34 -0500
Message-Id: <20220506191339.78617-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506191339.78617-1-nick.hawkins@hpe.com>
References: <20220506191339.78617-1-nick.hawkins@hpe.com>
X-Proofpoint-GUID: wuxO4D9P_J9kLjzqXHB7gSu-jizT9W_q
X-Proofpoint-ORIG-GUID: wuxO4D9P_J9kLjzqXHB7gSu-jizT9W_q
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_07,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060097
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Add support for the HPE GXP Watchdog. The GXP asic contains a full
complement of timers one of which is the watchdog timer. The watchdog
timer is 16 bit and has 10ms resolution. The watchdog is created as a
child device of timer since the same register range is used.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---
v7:
* Change commit description to replace Adding with Add and compliment
  with complement
* Removed unused include files of_address.h and of_platform.h
* Fixed the max timeout on watchdog to be 655350
* Changed time variable computations in gxp_wdt_set_timeout to be clear
* Decreased reboot delay to 10ms from 100ms
* Added comment to explain why it is necessary to pass the base address
  over a private interface from the timer driver.
v6:
* No code change.
* Fixed commit subject line to match the ones in log.
* Adjusted commit message to be closer to 75 chars per line.
v5:
* Fixed version log
* Added details to Kconfig for module support.
* Adjusted commit messaged
v4:
* Made watchdog a child of timer as they share the same register region
  per change request on dtsi.
* Removed extra parenthesis
* Fixed u8 u32 u64 usage
* Fixed alignment issue
* Reconfigured conditional statement for interrupt setup
* Removed unused gxp_wdt_remove function
v3:
* Put into proper patchset format
v2:
* No change
---
 drivers/watchdog/Kconfig   |  11 +++
 drivers/watchdog/Makefile  |   1 +
 drivers/watchdog/gxp-wdt.c | 173 +++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/watchdog/gxp-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c4e82a8d863f..a591cc6aa152 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1820,6 +1820,17 @@ config RALINK_WDT
 	help
 	  Hardware driver for the Ralink SoC Watchdog Timer.
 
+config GXP_WATCHDOG
+	tristate "HPE GXP watchdog support"
+	depends on ARCH_HPE_GXP
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer
+	  in HPE GXP SoCs.
+
+	  To compile this driver as a module, choose M here.
+	  The module will be called gxp-wdt.
+
 config MT7621_WDT
 	tristate "Mediatek SoC watchdog"
 	select WATCHDOG_CORE
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f7da867e8782..e2acf3a0d0fc 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
 obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
 obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
 obj-$(CONFIG_ARM_SMC_WATCHDOG) += arm_smc_wdt.o
+obj-$(CONFIG_GXP_WATCHDOG) += gxp-wdt.o
 obj-$(CONFIG_VISCONTI_WATCHDOG) += visconti_wdt.o
 obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
 obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
diff --git a/drivers/watchdog/gxp-wdt.c b/drivers/watchdog/gxp-wdt.c
new file mode 100644
index 000000000000..2605249e35d1
--- /dev/null
+++ b/drivers/watchdog/gxp-wdt.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define MASK_WDGCS_ENABLE	0x01
+#define MASK_WDGCS_RELOAD	0x04
+#define MASK_WDGCS_NMIEN	0x08
+#define MASK_WDGCS_WARN		0x80
+
+#define WDT_MAX_TIMEOUT_MS	655350
+#define WDT_DEFAULT_TIMEOUT	30
+#define SECS_TO_WDOG_TICKS(x) ((x) * 100)
+#define WDOG_TICKS_TO_SECS(x) ((x) / 100)
+
+#define GXP_WDT_CNT_OFS		0x10
+#define GXP_WDT_CTRL_OFS	0x16
+
+struct gxp_wdt {
+	void __iomem *base;
+	struct watchdog_device wdd;
+};
+
+static void gxp_wdt_enable_reload(struct gxp_wdt *drvdata)
+{
+	u8 val;
+
+	val = readb(drvdata->base + GXP_WDT_CTRL_OFS);
+	val |= (MASK_WDGCS_ENABLE | MASK_WDGCS_RELOAD);
+	writeb(val, drvdata->base + GXP_WDT_CTRL_OFS);
+}
+
+static int gxp_wdt_start(struct watchdog_device *wdd)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+
+	writew(SECS_TO_WDOG_TICKS(wdd->timeout), drvdata->base + GXP_WDT_CNT_OFS);
+	gxp_wdt_enable_reload(drvdata);
+	return 0;
+}
+
+static int gxp_wdt_stop(struct watchdog_device *wdd)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+	u8 val;
+
+	val = readb_relaxed(drvdata->base + GXP_WDT_CTRL_OFS);
+	val &= ~MASK_WDGCS_ENABLE;
+	writeb(val, drvdata->base + GXP_WDT_CTRL_OFS);
+	return 0;
+}
+
+static int gxp_wdt_set_timeout(struct watchdog_device *wdd,
+			       unsigned int timeout)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+	u32 actual;
+
+	wdd->timeout = timeout;
+	actual = min(timeout * 100, wdd->max_hw_heartbeat_ms / 10);
+	writew(actual, drvdata->base + GXP_WDT_CNT_OFS);
+
+	return 0;
+}
+
+static unsigned int gxp_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+	u32 val = readw(drvdata->base + GXP_WDT_CNT_OFS);
+
+	return WDOG_TICKS_TO_SECS(val);
+}
+
+static int gxp_wdt_ping(struct watchdog_device *wdd)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+
+	gxp_wdt_enable_reload(drvdata);
+	return 0;
+}
+
+static int gxp_restart(struct watchdog_device *wdd, unsigned long action,
+		       void *data)
+{
+	struct gxp_wdt *drvdata = watchdog_get_drvdata(wdd);
+
+	writew(1, drvdata->base + GXP_WDT_CNT_OFS);
+	gxp_wdt_enable_reload(drvdata);
+	mdelay(100);
+	return 0;
+}
+
+static const struct watchdog_ops gxp_wdt_ops = {
+	.owner =	THIS_MODULE,
+	.start =	gxp_wdt_start,
+	.stop =		gxp_wdt_stop,
+	.ping =		gxp_wdt_ping,
+	.set_timeout =	gxp_wdt_set_timeout,
+	.get_timeleft =	gxp_wdt_get_timeleft,
+	.restart =	gxp_restart,
+};
+
+static const struct watchdog_info gxp_wdt_info = {
+	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.identity = "HPE GXP Watchdog timer",
+};
+
+static int gxp_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gxp_wdt *drvdata;
+	int err;
+	u8 val;
+
+	drvdata = devm_kzalloc(dev, sizeof(struct gxp_wdt), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	/* The register area where the timer and watchdog reside is disarranged.
+	 * Hence mapping individual register blocks for the timer and watchdog
+	 * is not recommended as they would have access to each others
+	 * registers. Based on feedback the watchdog is no longer part of the
+	 * device tree file and the timer driver now creates the watchdog as a
+	 * child device. During the watchdogs creation, the timer driver passes
+	 * the base address to the watchdog over the private interface.
+	 */
+
+	drvdata->base = (void __iomem *)dev->platform_data;
+
+	drvdata->wdd.info = &gxp_wdt_info;
+	drvdata->wdd.ops = &gxp_wdt_ops;
+	drvdata->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
+	drvdata->wdd.parent = dev;
+	drvdata->wdd.timeout = WDT_DEFAULT_TIMEOUT;
+
+	watchdog_set_drvdata(&drvdata->wdd, drvdata);
+	watchdog_set_nowayout(&drvdata->wdd, WATCHDOG_NOWAYOUT);
+
+	val = readb(drvdata->base + GXP_WDT_CTRL_OFS);
+
+	if (val & MASK_WDGCS_ENABLE)
+		set_bit(WDOG_HW_RUNNING, &drvdata->wdd.status);
+
+	watchdog_set_restart_priority(&drvdata->wdd, 128);
+
+	watchdog_stop_on_reboot(&drvdata->wdd);
+	err = devm_watchdog_register_device(dev, &drvdata->wdd);
+	if (err) {
+		dev_err(dev, "Failed to register watchdog device");
+		return err;
+	}
+
+	dev_info(dev, "HPE GXP watchdog timer");
+
+	return 0;
+}
+
+static struct platform_driver gxp_wdt_driver = {
+	.probe = gxp_wdt_probe,
+	.driver = {
+		.name =	"gxp-wdt",
+	},
+};
+module_platform_driver(gxp_wdt_driver);
+
+MODULE_AUTHOR("Nick Hawkins <nick.hawkins@hpe.com>");
+MODULE_AUTHOR("Jean-Marie Verdun <verdun@hpe.com>");
+MODULE_DESCRIPTION("Driver for GXP watchdog timer");
-- 
2.17.1

