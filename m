Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D756883E9
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 22:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbfHIU3F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 16:29:05 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56971 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfHIU3E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 16:29:04 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M26iv-1htiWo404n-002Ur7; Fri, 09 Aug 2019 22:28:36 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] watchdog: remove w90x900 driver
Date:   Fri,  9 Aug 2019 22:27:34 +0200
Message-Id: <20190809202749.742267-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4aZZJ0adOC4gNbJNr72QyItZi8IyivyiRyv6tRpgrjVP+CGv1cv
 2uO0jATNpCZk/ogPQlZbBKnYr7D679/NRP4wiAo9nJm0x+zBB9ZkQLJxTFOurIoJW5a0MIS
 1bCLvs+82yAUazyFXUIpU1JraDmICYVRBTLPZ4XUa9MJlL+plsL1ZJdU35WHbBHKKLouJg+
 c/buwbH2Oi1MOTjKiLOWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TIiZUlyO4KI=:xMX0wJO46U8BafJBRrX1L/
 euv754YHVVFavyBFIjjId75wTHZUlzd/xcQYQCKFrHI8HwI2Nk+1VpMHwpiidDMsbIuqGFsms
 Gbe1hSoKiA+0Fo3+LncljjMgrxOBRV0Ee9XIuaCTs62/o6RlJ2r/RyukzmfwnLGrpzHMBL4vu
 VeyCLPVbYwashUqOhk1KawscikvyHW8z8cDuNgejY9/grpcG/VxVeYWrAnWIu/cOUK8WP+TvN
 mkwLcp39r8KWQei7FGv6LUGupcRhy0wqdGcwZLCkr9TnjjjeX5h9gOCGjIDnmS3mRxOW9l5cS
 IypKV4hU+8kRNEJhrtPR3yZCJPBxFUeFRP6sn7X2AtR7mPzdHCkxMSd2q3+4vWMxyUGUdB2W7
 Q7Sn6zljTYK/7tzoy7oAl4fa558Fjhk0ZRfv+jNscYRLNCsLcc14msVQGzn53FPDAFx8mKaqH
 YC3vCTFUL1Dj+2kIyVDVVqUHGIdUZGmhhrFJrBJRZ3oGRqfj4PUS/JJCvwMUMaDMgM7PKwT7V
 oU+m1EgG+kwXLGu4GzIfFNa0C01nVGxrN9WJx40RCLHPF0GZwgXzVzXKSDpxMLlLdz6jRl31b
 fZoU/APAHpv8T1/y82xau+xvtPQNqA7P4jajDxMjm2/tsaER8yUbmKsje0gdPhyawgStqSDI/
 0jiCJt/8db5+bQywyof9SDTRsioCZS92yVX+G0YSm6PgBS17tYHVQdCsiS8IluwcvvKmUal23
 8X9iTCz5GpwIeTKgwkAe5yGk86NM1D2m4HCn8g==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The ARM w90x900 platform is getting removed, so this driver is obsolete

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../watchdog/watchdog-parameters.rst          |  10 -
 drivers/watchdog/Kconfig                      |   9 -
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/nuc900_wdt.c                 | 302 ------------------
 4 files changed, 322 deletions(-)
 delete mode 100644 drivers/watchdog/nuc900_wdt.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 226aba56f704..223c99361a30 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -366,16 +366,6 @@ nic7018_wdt:
 
 -------------------------------------------------
 
-nuc900_wdt:
-    heartbeat:
-	Watchdog heartbeats in seconds.
-	(default = 15)
-    nowayout:
-	Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-
--------------------------------------------------
-
 omap_wdt:
     timer_margin:
 	initial watchdog timeout (in seconds)
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e631f1ae303a..0e64f501ef30 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -655,15 +655,6 @@ config STMP3XXX_RTC_WATCHDOG
 	  To compile this driver as a module, choose M here: the
 	  module will be called stmp3xxx_rtc_wdt.
 
-config NUC900_WATCHDOG
-	tristate "Nuvoton NUC900 watchdog"
-	depends on ARCH_W90X900 || COMPILE_TEST
-	help
-	  Say Y here if to include support for the watchdog timer
-	  for the Nuvoton NUC900 series SoCs.
-	  To compile this driver as a module, choose M here: the
-	  module will be called nuc900_wdt.
-
 config TS4800_WATCHDOG
 	tristate "TS-4800 Watchdog"
 	depends on HAS_IOMEM && OF
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 85f55ec76f8d..b5a0aed537af 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -63,7 +63,6 @@ obj-$(CONFIG_RN5T618_WATCHDOG) += rn5t618_wdt.o
 obj-$(CONFIG_COH901327_WATCHDOG) += coh901327_wdt.o
 obj-$(CONFIG_NPCM7XX_WATCHDOG) += npcm_wdt.o
 obj-$(CONFIG_STMP3XXX_RTC_WATCHDOG) += stmp3xxx_rtc_wdt.o
-obj-$(CONFIG_NUC900_WATCHDOG) += nuc900_wdt.o
 obj-$(CONFIG_TS4800_WATCHDOG) += ts4800_wdt.o
 obj-$(CONFIG_TS72XX_WATCHDOG) += ts72xx_wdt.o
 obj-$(CONFIG_IMX2_WDT) += imx2_wdt.o
diff --git a/drivers/watchdog/nuc900_wdt.c b/drivers/watchdog/nuc900_wdt.c
deleted file mode 100644
index db124cebe838..000000000000
--- a/drivers/watchdog/nuc900_wdt.c
+++ /dev/null
@@ -1,302 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2009 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/bitops.h>
-#include <linux/errno.h>
-#include <linux/fs.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/kernel.h>
-#include <linux/miscdevice.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/interrupt.h>
-#include <linux/types.h>
-#include <linux/watchdog.h>
-#include <linux/uaccess.h>
-
-#define REG_WTCR		0x1c
-#define WTCLK			(0x01 << 10)
-#define WTE			(0x01 << 7)	/*wdt enable*/
-#define WTIS			(0x03 << 4)
-#define WTIF			(0x01 << 3)
-#define WTRF			(0x01 << 2)
-#define WTRE			(0x01 << 1)
-#define WTR			(0x01 << 0)
-/*
- * The watchdog time interval can be calculated via following formula:
- * WTIS		real time interval (formula)
- * 0x00		((2^ 14 ) * ((external crystal freq) / 256))seconds
- * 0x01		((2^ 16 ) * ((external crystal freq) / 256))seconds
- * 0x02		((2^ 18 ) * ((external crystal freq) / 256))seconds
- * 0x03		((2^ 20 ) * ((external crystal freq) / 256))seconds
- *
- * The external crystal freq is 15Mhz in the nuc900 evaluation board.
- * So 0x00 = +-0.28 seconds, 0x01 = +-1.12 seconds, 0x02 = +-4.48 seconds,
- * 0x03 = +- 16.92 seconds..
- */
-#define WDT_HW_TIMEOUT		0x02
-#define WDT_TIMEOUT		(HZ/2)
-#define WDT_HEARTBEAT		15
-
-static int heartbeat = WDT_HEARTBEAT;
-module_param(heartbeat, int, 0);
-MODULE_PARM_DESC(heartbeat, "Watchdog heartbeats in seconds. "
-	"(default = " __MODULE_STRING(WDT_HEARTBEAT) ")");
-
-static bool nowayout = WATCHDOG_NOWAYOUT;
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
-	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
-
-struct nuc900_wdt {
-	struct clk	 *wdt_clock;
-	struct platform_device *pdev;
-	void __iomem	 *wdt_base;
-	char		 expect_close;
-	struct timer_list timer;
-	spinlock_t       wdt_lock;
-	unsigned long next_heartbeat;
-};
-
-static unsigned long nuc900wdt_busy;
-static struct nuc900_wdt *nuc900_wdt;
-
-static inline void nuc900_wdt_keepalive(void)
-{
-	unsigned int val;
-
-	spin_lock(&nuc900_wdt->wdt_lock);
-
-	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
-	val |= (WTR | WTIF);
-	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
-
-	spin_unlock(&nuc900_wdt->wdt_lock);
-}
-
-static inline void nuc900_wdt_start(void)
-{
-	unsigned int val;
-
-	spin_lock(&nuc900_wdt->wdt_lock);
-
-	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
-	val |= (WTRE | WTE | WTR | WTCLK | WTIF);
-	val &= ~WTIS;
-	val |= (WDT_HW_TIMEOUT << 0x04);
-	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
-
-	spin_unlock(&nuc900_wdt->wdt_lock);
-
-	nuc900_wdt->next_heartbeat = jiffies + heartbeat * HZ;
-	mod_timer(&nuc900_wdt->timer, jiffies + WDT_TIMEOUT);
-}
-
-static inline void nuc900_wdt_stop(void)
-{
-	unsigned int val;
-
-	del_timer(&nuc900_wdt->timer);
-
-	spin_lock(&nuc900_wdt->wdt_lock);
-
-	val = __raw_readl(nuc900_wdt->wdt_base + REG_WTCR);
-	val &= ~WTE;
-	__raw_writel(val, nuc900_wdt->wdt_base + REG_WTCR);
-
-	spin_unlock(&nuc900_wdt->wdt_lock);
-}
-
-static inline void nuc900_wdt_ping(void)
-{
-	nuc900_wdt->next_heartbeat = jiffies + heartbeat * HZ;
-}
-
-static int nuc900_wdt_open(struct inode *inode, struct file *file)
-{
-
-	if (test_and_set_bit(0, &nuc900wdt_busy))
-		return -EBUSY;
-
-	nuc900_wdt_start();
-
-	return stream_open(inode, file);
-}
-
-static int nuc900_wdt_close(struct inode *inode, struct file *file)
-{
-	if (nuc900_wdt->expect_close == 42)
-		nuc900_wdt_stop();
-	else {
-		dev_crit(&nuc900_wdt->pdev->dev,
-			"Unexpected close, not stopping watchdog!\n");
-		nuc900_wdt_ping();
-	}
-
-	nuc900_wdt->expect_close = 0;
-	clear_bit(0, &nuc900wdt_busy);
-	return 0;
-}
-
-static const struct watchdog_info nuc900_wdt_info = {
-	.identity	= "nuc900 watchdog",
-	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
-						WDIOF_MAGICCLOSE,
-};
-
-static long nuc900_wdt_ioctl(struct file *file,
-					unsigned int cmd, unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-	int __user *p = argp;
-	int new_value;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		return copy_to_user(argp, &nuc900_wdt_info,
-				sizeof(nuc900_wdt_info)) ? -EFAULT : 0;
-	case WDIOC_GETSTATUS:
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
-
-	case WDIOC_KEEPALIVE:
-		nuc900_wdt_ping();
-		return 0;
-
-	case WDIOC_SETTIMEOUT:
-		if (get_user(new_value, p))
-			return -EFAULT;
-
-		heartbeat = new_value;
-		nuc900_wdt_ping();
-
-		return put_user(new_value, p);
-	case WDIOC_GETTIMEOUT:
-		return put_user(heartbeat, p);
-	default:
-		return -ENOTTY;
-	}
-}
-
-static ssize_t nuc900_wdt_write(struct file *file, const char __user *data,
-						size_t len, loff_t *ppos)
-{
-	if (!len)
-		return 0;
-
-	/* Scan for magic character */
-	if (!nowayout) {
-		size_t i;
-
-		nuc900_wdt->expect_close = 0;
-
-		for (i = 0; i < len; i++) {
-			char c;
-			if (get_user(c, data + i))
-				return -EFAULT;
-			if (c == 'V') {
-				nuc900_wdt->expect_close = 42;
-				break;
-			}
-		}
-	}
-
-	nuc900_wdt_ping();
-	return len;
-}
-
-static void nuc900_wdt_timer_ping(struct timer_list *unused)
-{
-	if (time_before(jiffies, nuc900_wdt->next_heartbeat)) {
-		nuc900_wdt_keepalive();
-		mod_timer(&nuc900_wdt->timer, jiffies + WDT_TIMEOUT);
-	} else
-		dev_warn(&nuc900_wdt->pdev->dev, "Will reset the machine !\n");
-}
-
-static const struct file_operations nuc900wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.unlocked_ioctl	= nuc900_wdt_ioctl,
-	.open		= nuc900_wdt_open,
-	.release	= nuc900_wdt_close,
-	.write		= nuc900_wdt_write,
-};
-
-static struct miscdevice nuc900wdt_miscdev = {
-	.minor		= WATCHDOG_MINOR,
-	.name		= "watchdog",
-	.fops		= &nuc900wdt_fops,
-};
-
-static int nuc900wdt_probe(struct platform_device *pdev)
-{
-	int ret = 0;
-
-	nuc900_wdt = devm_kzalloc(&pdev->dev, sizeof(*nuc900_wdt),
-				GFP_KERNEL);
-	if (!nuc900_wdt)
-		return -ENOMEM;
-
-	nuc900_wdt->pdev = pdev;
-
-	spin_lock_init(&nuc900_wdt->wdt_lock);
-
-	nuc900_wdt->wdt_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(nuc900_wdt->wdt_base))
-		return PTR_ERR(nuc900_wdt->wdt_base);
-
-	nuc900_wdt->wdt_clock = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nuc900_wdt->wdt_clock)) {
-		dev_err(&pdev->dev, "failed to find watchdog clock source\n");
-		return PTR_ERR(nuc900_wdt->wdt_clock);
-	}
-
-	clk_enable(nuc900_wdt->wdt_clock);
-
-	timer_setup(&nuc900_wdt->timer, nuc900_wdt_timer_ping, 0);
-
-	ret = misc_register(&nuc900wdt_miscdev);
-	if (ret) {
-		dev_err(&pdev->dev, "err register miscdev on minor=%d (%d)\n",
-			WATCHDOG_MINOR, ret);
-		goto err_clk;
-	}
-
-	return 0;
-
-err_clk:
-	clk_disable(nuc900_wdt->wdt_clock);
-	return ret;
-}
-
-static int nuc900wdt_remove(struct platform_device *pdev)
-{
-	misc_deregister(&nuc900wdt_miscdev);
-
-	clk_disable(nuc900_wdt->wdt_clock);
-
-	return 0;
-}
-
-static struct platform_driver nuc900wdt_driver = {
-	.probe		= nuc900wdt_probe,
-	.remove		= nuc900wdt_remove,
-	.driver		= {
-		.name	= "nuc900-wdt",
-	},
-};
-
-module_platform_driver(nuc900wdt_driver);
-
-MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
-MODULE_DESCRIPTION("Watchdog driver for NUC900");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:nuc900-wdt");
-- 
2.20.0

