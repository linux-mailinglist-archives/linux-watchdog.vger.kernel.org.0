Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C32DC911
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2019 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505254AbfJRPnD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 18 Oct 2019 11:43:03 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50365 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505260AbfJRPm4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 18 Oct 2019 11:42:56 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M8yoa-1iRWGW0hh0-0065Ln; Fri, 18 Oct 2019 17:42:22 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 09/46] watchdog: sa1100: use platform device registration
Date:   Fri, 18 Oct 2019 17:41:24 +0200
Message-Id: <20191018154201.1276638-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qDo493GPFAz++Q7671EcxnlzzinllHVjM/CFjptshgQp1jXIaEq
 axRtNVML8vy7Kbp4of0v0hu4ghjNw3aE8jK7SdTSmW+EEAVTMbaNX5TiikTP/CGsWeRTW1a
 jDtkCfc4qo0wfK2OBYj/vppBfusq6xJ+kSPFzdhz1u0sL3jbFBHkIgoxgG0tK+PbtRGr8sT
 AV/MHCZnZagCepUOJ0ByA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cooY8u8FubQ=:9naSPVnB74pxkfr2WfdM6B
 YeNT+wFevlI1NKfx/E8MzpHOLE7F9qQrw6vMjOaF28mWqlAcc/715U5K6QA0z8VGSpQY2UKpp
 YRJfAzVpPErVlcoW8rezcbrRs6Y/oRGS081gAfbDjSihiaFOd6BTlHZk3RYZzCCclQfTOua/v
 f/+p9w6/AeNv2CcaI1rq+CdLcDQSHwhlbOv32ecniqLuSjkeHbR3OZWkyKo7dlsjDkNuFlHY6
 IvVwszL7uLayFDTaCkxWxzEfdBwhz/hnLUURj55vfuhW0LHIPQvpoqtsAcwDAC1HfInAAG1Iy
 zg4OZqfJF22IxPkZizInuXtX/gAYQF1/0H85zoBjjzpQQ1Hj28xlHkeSKRCF5OAD7Ajljv9FN
 0CdCPBrTGqhKDRUyonjHAFWHtBOsuQ5ntruFLlICo6iSZhUoExIo0RzBz1biSYLiLLh068G3i
 FFJNxHyvqnNrvg6XuCiVaZQRTQtLgkD4D77+3hxp8wr7Y264tirpK2ieKOnTKtHOSz+vOxtdY
 2geU/cIbwJ2iytTCJtuMu/q9SXLRODfsYP9WBUdhFLFpnSt7LmwrmB3/OJrl65NWIQEoA69Jt
 +RtcvhBO46u1kYQTz/ffEFTxH3+jtYppHIvC5S4gBrcuxF/ZIW4OuzUOhwpv3fmIUW7DUhMpA
 Rvbvw6MhfZqrMZCImZmNn9d4BX7nNYHPDeAAi+i18y8nJ80E7XYhPD3/MIbMcmK5p40Ya+7ke
 +TntP/Rd2kC/McQvn6h2rX2Y4a0s54SHOL0RcjoLOyQGP2U6Qj8aVeWYNP/t6O/7o8jAvUAZU
 LqdQGt3ApvkOjmY2WOGY0z49tczcmehFWwz4cRduPqNyjLLKmzMeAhGYDNLj7Z0sTvIlHQVYB
 62ivIlIIoydxX5bXwuuw==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Rather than relying on machine specific headers to
pass down the reboot status and the register locations,
use resources and platform_data.

Aside from this, keep the changes to a minimum.

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/devices.c               | 11 +++
 arch/arm/mach-pxa/include/mach/regs-ost.h |  2 +
 arch/arm/mach-pxa/include/mach/reset.h    |  2 +-
 arch/arm/mach-pxa/pxa25x.c                |  2 +-
 arch/arm/mach-pxa/pxa27x.c                |  2 +-
 arch/arm/mach-pxa/pxa3xx.c                |  2 +-
 arch/arm/mach-pxa/reset.c                 |  3 -
 arch/arm/mach-sa1100/generic.c            |  6 +-
 arch/arm/mach-sa1100/include/mach/reset.h |  1 -
 drivers/watchdog/sa1100_wdt.c             | 87 ++++++++++++++++-------
 10 files changed, 83 insertions(+), 35 deletions(-)

diff --git a/arch/arm/mach-pxa/devices.c b/arch/arm/mach-pxa/devices.c
index 233035e6a2ff..fb9b4f6d32de 100644
--- a/arch/arm/mach-pxa/devices.c
+++ b/arch/arm/mach-pxa/devices.c
@@ -23,6 +23,8 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
+#include <mach/regs-ost.h>
+#include <mach/reset.h>
 #include "devices.h"
 #include "generic.h"
 
@@ -1110,3 +1112,12 @@ void __init pxa2xx_set_dmac_info(struct mmp_dma_platdata *dma_pdata)
 {
 	pxa_register_device(&pxa2xx_pxa_dma, dma_pdata);
 }
+
+void __init pxa_register_wdt(unsigned int reset_status)
+{
+	struct resource res = DEFINE_RES_MEM(OST_PHYS, OST_LEN);
+
+	reset_status &= RESET_STATUS_WATCHDOG;
+	platform_device_register_resndata(NULL, "sa1100_wdt", -1, &res, 1,
+					  &reset_status, sizeof(reset_status));
+}
diff --git a/arch/arm/mach-pxa/include/mach/regs-ost.h b/arch/arm/mach-pxa/include/mach/regs-ost.h
index 109d0ed264df..c8001cfc8d6b 100644
--- a/arch/arm/mach-pxa/include/mach/regs-ost.h
+++ b/arch/arm/mach-pxa/include/mach/regs-ost.h
@@ -7,6 +7,8 @@
 /*
  * OS Timer & Match Registers
  */
+#define OST_PHYS	0x40A00000
+#define OST_LEN		0x00000020
 
 #define OSMR0		io_p2v(0x40A00000)  /* */
 #define OSMR1		io_p2v(0x40A00004)  /* */
diff --git a/arch/arm/mach-pxa/include/mach/reset.h b/arch/arm/mach-pxa/include/mach/reset.h
index e1c4d100fd45..963dd190bc13 100644
--- a/arch/arm/mach-pxa/include/mach/reset.h
+++ b/arch/arm/mach-pxa/include/mach/reset.h
@@ -8,8 +8,8 @@
 #define RESET_STATUS_GPIO	(1 << 3)	/* GPIO Reset */
 #define RESET_STATUS_ALL	(0xf)
 
-extern unsigned int reset_status;
 extern void clear_reset_status(unsigned int mask);
+extern void pxa_register_wdt(unsigned int reset_status);
 
 /**
  * init_gpio_reset() - register GPIO as reset generator
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 305047ebd2f1..dfc90b41fba3 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -240,7 +240,7 @@ static int __init pxa25x_init(void)
 
 	if (cpu_is_pxa25x()) {
 
-		reset_status = RCSR;
+		pxa_register_wdt(RCSR);
 
 		pxa25x_init_pm();
 
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index a81ac88ecbfd..38fdd22c4dc5 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -337,7 +337,7 @@ static int __init pxa27x_init(void)
 
 	if (cpu_is_pxa27x()) {
 
-		reset_status = RCSR;
+		pxa_register_wdt(RCSR);
 
 		pxa27x_init_pm();
 
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index fc84aed99481..7c569fa2a6da 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -463,7 +463,7 @@ static int __init pxa3xx_init(void)
 
 	if (cpu_is_pxa3xx()) {
 
-		reset_status = ARSR;
+		pxa_register_wdt(ARSR);
 
 		/*
 		 * clear RDH bit every time after reset
diff --git a/arch/arm/mach-pxa/reset.c b/arch/arm/mach-pxa/reset.c
index af78405aa4e9..fcb791c5ae3e 100644
--- a/arch/arm/mach-pxa/reset.c
+++ b/arch/arm/mach-pxa/reset.c
@@ -11,9 +11,6 @@
 #include <mach/reset.h>
 #include <mach/smemc.h>
 
-unsigned int reset_status;
-EXPORT_SYMBOL(reset_status);
-
 static void do_hw_reset(void);
 
 static int reset_gpio = -1;
diff --git a/arch/arm/mach-sa1100/generic.c b/arch/arm/mach-sa1100/generic.c
index 4dfb7554649d..6c21f214cd60 100644
--- a/arch/arm/mach-sa1100/generic.c
+++ b/arch/arm/mach-sa1100/generic.c
@@ -39,9 +39,6 @@
 #include "generic.h"
 #include <clocksource/pxa.h>
 
-unsigned int reset_status;
-EXPORT_SYMBOL(reset_status);
-
 #define NR_FREQS	16
 
 /*
@@ -319,10 +316,13 @@ static struct platform_device *sa11x0_devices[] __initdata = {
 
 static int __init sa1100_init(void)
 {
+	struct resource wdt_res = DEFINE_RES_MEM(0x90000000, 0x20);
 	pm_power_off = sa1100_power_off;
 
 	regulator_has_full_constraints();
 
+	platform_device_register_simple("sa1100_wdt", -1, &wdt_res, 1);
+
 	return platform_add_devices(sa11x0_devices, ARRAY_SIZE(sa11x0_devices));
 }
 
diff --git a/arch/arm/mach-sa1100/include/mach/reset.h b/arch/arm/mach-sa1100/include/mach/reset.h
index 27695650a567..a6723d45ae2a 100644
--- a/arch/arm/mach-sa1100/include/mach/reset.h
+++ b/arch/arm/mach-sa1100/include/mach/reset.h
@@ -10,7 +10,6 @@
 #define RESET_STATUS_GPIO	(1 << 3)	/* GPIO Reset */
 #define RESET_STATUS_ALL	(0xf)
 
-extern unsigned int reset_status;
 static inline void clear_reset_status(unsigned int mask)
 {
 	RCSR = mask;
diff --git a/drivers/watchdog/sa1100_wdt.c b/drivers/watchdog/sa1100_wdt.c
index 0f6ffc1e7f4e..a24d6a07c7a7 100644
--- a/drivers/watchdog/sa1100_wdt.c
+++ b/drivers/watchdog/sa1100_wdt.c
@@ -22,6 +22,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/fs.h>
+#include <linux/platform_device.h>
 #include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/init.h>
@@ -30,16 +31,42 @@
 #include <linux/uaccess.h>
 #include <linux/timex.h>
 
-#ifdef CONFIG_ARCH_PXA
-#include <mach/regs-ost.h>
-#endif
+#define REG_OSMR0  	0x0000  /* OS timer Match Reg. 0 */
+#define REG_OSMR1  	0x0004  /* OS timer Match Reg. 1 */
+#define REG_OSMR2  	0x0008  /* OS timer Match Reg. 2 */
+#define REG_OSMR3  	0x000c  /* OS timer Match Reg. 3 */
+#define REG_OSCR   	0x0010  /* OS timer Counter Reg. */
+#define REG_OSSR   	0x0014  /* OS timer Status Reg. */
+#define REG_OWER   	0x0018  /* OS timer Watch-dog Enable Reg. */
+#define REG_OIER  	0x001C  /* OS timer Interrupt Enable Reg. */
 
-#include <mach/reset.h>
+#define OSSR_M3		(1 << 3)	/* Match status channel 3 */
+#define OSSR_M2		(1 << 2)	/* Match status channel 2 */
+#define OSSR_M1		(1 << 1)	/* Match status channel 1 */
+#define OSSR_M0		(1 << 0)	/* Match status channel 0 */
+
+#define OWER_WME	(1 << 0)	/* Watchdog Match Enable */
+
+#define OIER_E3		(1 << 3)	/* Interrupt enable channel 3 */
+#define OIER_E2		(1 << 2)	/* Interrupt enable channel 2 */
+#define OIER_E1		(1 << 1)	/* Interrupt enable channel 1 */
+#define OIER_E0		(1 << 0)	/* Interrupt enable channel 0 */
 
 static unsigned long oscr_freq;
 static unsigned long sa1100wdt_users;
 static unsigned int pre_margin;
 static int boot_status;
+static void __iomem *reg_base;
+
+static inline void sa1100_wr(u32 val, u32 offset)
+{
+	writel_relaxed(val, reg_base + offset);
+}
+
+static inline u32 sa1100_rd(u32 offset)
+{
+	return readl_relaxed(reg_base + offset);
+}
 
 /*
  *	Allow only one person to hold it open
@@ -50,10 +77,10 @@ static int sa1100dog_open(struct inode *inode, struct file *file)
 		return -EBUSY;
 
 	/* Activate SA1100 Watchdog timer */
-	writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
-	writel_relaxed(OSSR_M3, OSSR);
-	writel_relaxed(OWER_WME, OWER);
-	writel_relaxed(readl_relaxed(OIER) | OIER_E3, OIER);
+	sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
+	sa1100_wr(OSSR_M3, REG_OSSR);
+	sa1100_wr(OWER_WME, REG_OWER);
+	sa1100_wr(sa1100_rd(REG_OIER) | OIER_E3, REG_OIER);
 	return stream_open(inode, file);
 }
 
@@ -61,7 +88,7 @@ static int sa1100dog_open(struct inode *inode, struct file *file)
  * The watchdog cannot be disabled.
  *
  * Previous comments suggested that turning off the interrupt by
- * clearing OIER[E3] would prevent the watchdog timing out but this
+ * clearing REG_OIER[E3] would prevent the watchdog timing out but this
  * does not appear to be true (at least on the PXA255).
  */
 static int sa1100dog_release(struct inode *inode, struct file *file)
@@ -76,7 +103,7 @@ static ssize_t sa1100dog_write(struct file *file, const char __user *data,
 {
 	if (len)
 		/* Refresh OSMR3 timer. */
-		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
+		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
 	return len;
 }
 
@@ -110,7 +137,7 @@ static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
 		break;
 
 	case WDIOC_KEEPALIVE:
-		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
+		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
 		ret = 0;
 		break;
 
@@ -125,7 +152,7 @@ static long sa1100dog_ioctl(struct file *file, unsigned int cmd,
 		}
 
 		pre_margin = oscr_freq * time;
-		writel_relaxed(readl_relaxed(OSCR) + pre_margin, OSMR3);
+		sa1100_wr(sa1100_rd(REG_OSCR) + pre_margin, REG_OSMR3);
 		/*fall through*/
 
 	case WDIOC_GETTIMEOUT:
@@ -150,12 +177,22 @@ static struct miscdevice sa1100dog_miscdev = {
 	.fops		= &sa1100dog_fops,
 };
 
-static int margin __initdata = 60;		/* (secs) Default is 1 minute */
+static int margin = 60;		/* (secs) Default is 1 minute */
 static struct clk *clk;
 
-static int __init sa1100dog_init(void)
+static int sa1100dog_probe(struct platform_device *pdev)
 {
 	int ret;
+	int *platform_data;
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENXIO;
+	reg_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	ret = PTR_ERR_OR_ZERO(reg_base);
+	if (ret)
+		return ret;
 
 	clk = clk_get(NULL, "OSTIMER0");
 	if (IS_ERR(clk)) {
@@ -173,13 +210,9 @@ static int __init sa1100dog_init(void)
 
 	oscr_freq = clk_get_rate(clk);
 
-	/*
-	 * Read the reset status, and save it for later.  If
-	 * we suspend, RCSR will be cleared, and the watchdog
-	 * reset reason will be lost.
-	 */
-	boot_status = (reset_status & RESET_STATUS_WATCHDOG) ?
-				WDIOF_CARDRESET : 0;
+	platform_data = pdev->dev.platform_data;
+	if (platform_data && *platform_data)
+		boot_status = WDIOF_CARDRESET;
 	pre_margin = oscr_freq * margin;
 
 	ret = misc_register(&sa1100dog_miscdev);
@@ -195,15 +228,21 @@ static int __init sa1100dog_init(void)
 	return ret;
 }
 
-static void __exit sa1100dog_exit(void)
+static int sa1100dog_remove(struct platform_device *pdev)
 {
 	misc_deregister(&sa1100dog_miscdev);
 	clk_disable_unprepare(clk);
 	clk_put(clk);
+
+	return 0;
 }
 
-module_init(sa1100dog_init);
-module_exit(sa1100dog_exit);
+struct platform_driver sa1100dog_driver = {
+	.driver.name = "sa1100_wdt",
+	.probe	  = sa1100dog_probe,
+	.remove	  = sa1100dog_remove,
+};
+module_platform_driver(sa1100dog_driver);
 
 MODULE_AUTHOR("Oleg Drokin <green@crimea.edu>");
 MODULE_DESCRIPTION("SA1100/PXA2xx Watchdog");
-- 
2.20.0

