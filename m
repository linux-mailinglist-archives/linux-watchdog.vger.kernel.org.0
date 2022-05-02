Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD1A517855
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 May 2022 22:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387439AbiEBUnM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 May 2022 16:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387443AbiEBUnK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 May 2022 16:43:10 -0400
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D13ABCB3;
        Mon,  2 May 2022 13:39:39 -0700 (PDT)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242HU58L032157;
        Mon, 2 May 2022 20:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=YegLXmWaKq5wX7e+vfumR+s4m6+UjHDwlupSCFBjhqE=;
 b=E0zne5z56AtcpnhzivjKl3l8jjeiC36fI7LtpCDdfCtAnbEgocHZQ0n88gjCg/pB9OxD
 JxNXNZ1tnHhgp4USDs1YHODytf0Ze6moz5UUiq3mn5NaH6R4viMXddYe16YAv/Nh6Tuj
 hLw1xEguCYSITJ3j3pxn56SoodZBjT/nIkR5beru7TjQXr30ZPDqqJ4PgIEEZRv8OAxY
 1G/fMVWiEFDs/S/ZqGMFv65B2z+9lIQRR0y8g54Pppz279lqmiTmL0qn+qoA+bwf64ut
 3Jfz+WHJfb7vOmKH0iUjtld1H53Y+9smnAnSeKQo0h71dRnxy9qXKaNIVJN6xWjFJXVn cw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3ftkrc9n8c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 May 2022 20:39:18 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 8F9A84F;
        Mon,  2 May 2022 20:39:17 +0000 (UTC)
Received: from hpe.com (cigateway-dev.us.rdlabs.hpecorp.net [10.14.73.30])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 2F3254A;
        Mon,  2 May 2022 20:39:17 +0000 (UTC)
From:   nick.hawkins@hpe.com
To:     verdun@hpe.com, nick@hpe.com, joel@jms.id.au, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Nick Hawkins <nick.hawkins@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v6 3/8] watchdog: hpe-wdt: Introduce HPE GXP Watchdog
Date:   Mon,  2 May 2022 15:40:45 -0500
Message-Id: <20220502204050.88316-3-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220502204050.88316-1-nick.hawkins@hpe.com>
References: <20220502204050.88316-1-nick.hawkins@hpe.com>
X-Proofpoint-ORIG-GUID: v0Tiosi1rpmpPpiW-3oxyfdfBsGZ23vE
X-Proofpoint-GUID: v0Tiosi1rpmpPpiW-3oxyfdfBsGZ23vE
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_06,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205020153
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

Adding support for the HPE GXP Watchdog. The GXP asic contains a full
compliment of timers one of which is the watchdog timer. The watchdog
timer is 16 bit and has 10ms resolution. The watchdog is created as a
child device of timer since the same register range is used.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---
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
 drivers/watchdog/gxp-wdt.c | 166 +++++++++++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)
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
index 000000000000..f45ab9a826d6
--- /dev/null
+++ b/drivers/watchdog/gxp-wdt.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/types.h>
+#include <linux/watchdog.h>
+
+#define MASK_WDGCS_ENABLE	0x01
+#define MASK_WDGCS_RELOAD	0x04
+#define MASK_WDGCS_NMIEN	0x08
+#define MASK_WDGCS_WARN		0x80
+
+#define WDT_MAX_TIMEOUT_MS	655000
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
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
+	writew(SECS_TO_WDOG_TICKS(actual), drvdata->base + GXP_WDT_CNT_OFS);
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
+	writew(10, drvdata->base + GXP_WDT_CNT_OFS);
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

