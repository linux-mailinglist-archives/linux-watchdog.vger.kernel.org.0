Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A7A3EEAA0
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Aug 2021 12:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhHQKJZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Aug 2021 06:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234593AbhHQKJZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Aug 2021 06:09:25 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D5CC061764;
        Tue, 17 Aug 2021 03:08:52 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1449794wmc.5;
        Tue, 17 Aug 2021 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zh00csVcR24GvCteUWnjLbhKaagOahS35OfKVu1K6cI=;
        b=YXT15+npH3JaEcn4j/xrQoCAaXWCo7n/OsSvU6BK21/6ZI949r7TuY3Fkl2ZpykFel
         X1AWPeBzkRdX8810b1Jjetx1xTIbVJ4gNuaZPahPN4VGyvN2kKpbYYZ+V/nM95PuwD9U
         FTXHeH/DzH0MTW/dZUFdjISqnrn+TtFRPdxZIxEnZexXq6HYZOBrvPo/wHU0/Uwjr/vF
         QELl0aTQ96Cb1q6RB64saFi0hTUUIw1rkGUX6SxYoRygPuOzBooRq+0A3qryvKwAuuGk
         NNfI9ZjGBCdV78lSuQm7UlvshpZOfdB5asdC5camMsl1UyLpaV1mZI/UFvoeERT0fSrK
         KxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zh00csVcR24GvCteUWnjLbhKaagOahS35OfKVu1K6cI=;
        b=Fwvoedj5npHBuS4NWzP9zdYtU7Vc1u/c8ok8TOfHUb5MR7acOgk060/hRsr7G0K53i
         Zeg40ZAbGrOfbPEQIcWG6iXsPEiAEjWKl9izRFJWd9L9tyE0aEPEJA2/wRxTxw/NKIpQ
         EbKAcz2N4nJ78zNAWN0DMVgPOp7m8nnOBjjd1zFkm/bc78L7pYJ+Zaf/GXWvkytf3CAt
         AUEM4R0iN0bDHCF1wemMkZu3yUsKSwICpX0VIArL6wli0D1G1NWaRflO7jIIeTkurL7b
         GLEymx0zU5BnGJIM5JL9L/599cOCydcAaUiuVh6pjuiy21iCuj1x7777d+G2z6zlATpk
         1pYQ==
X-Gm-Message-State: AOAM532vr+RMQM+7UsMLBvJ2Db+3rYrtzmqZHS3bLyLEw7kxmQN/81WF
        Sh/9rIuVsW+hb+MsuJ+kaP8=
X-Google-Smtp-Source: ABdhPJwuTWwN3RnaUwAFwbSxyWtt7VlXwXLnhE22N/7cKEf/EcY4mHLRI0JAGE1A04PL1ZjrxId8aw==
X-Received: by 2002:a05:600c:1c28:: with SMTP id j40mr2513066wms.104.1629194930548;
        Tue, 17 Aug 2021 03:08:50 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id i9sm2280437wre.36.2021.08.17.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 03:08:49 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] watchdog: remove dead iop watchdog timer driver
Date:   Tue, 17 Aug 2021 12:08:45 +0200
Message-Id: <20210817100845.11626-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
removes the config ARCH_IOP13XX in ./arch/arm/Kconfig.

Hence, since then, the corresponding iop watchdog timer driver is dead
code. Remove this dead driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/watchdog/Kconfig   |  16 ---
 drivers/watchdog/Makefile  |   1 -
 drivers/watchdog/iop_wdt.c | 250 -------------------------------------
 3 files changed, 267 deletions(-)
 delete mode 100644 drivers/watchdog/iop_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0bc7046ab942..bcfb94064c7d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -573,22 +573,6 @@ config PNX4008_WATCHDOG
 
 	  Say N if you are unsure.
 
-config IOP_WATCHDOG
-	tristate "IOP Watchdog"
-	depends on ARCH_IOP13XX
-	select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
-	help
-	  Say Y here if to include support for the watchdog timer
-	  in the Intel IOP3XX & IOP13XX I/O Processors.  This driver can
-	  be built as a module by choosing M. The module will
-	  be called iop_wdt.
-
-	  Note: The IOP13XX watchdog does an Internal Bus Reset which will
-	  affect both cores and the peripherals of the IOP.  The ATU-X
-	  and/or ATUe configuration registers will remain intact, but if
-	  operating as an Root Complex and/or Central Resource, the PCI-X
-	  and/or PCIe busses will also be reset.  THIS IS A VERY BIG HAMMER.
-
 config DAVINCI_WATCHDOG
 	tristate "DaVinci watchdog"
 	depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index abaf2ebd814e..a5ecf2287685 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -56,7 +56,6 @@ obj-$(CONFIG_SAMA5D4_WATCHDOG) += sama5d4_wdt.o
 obj-$(CONFIG_DW_WATCHDOG) += dw_wdt.o
 obj-$(CONFIG_EP93XX_WATCHDOG) += ep93xx_wdt.o
 obj-$(CONFIG_PNX4008_WATCHDOG) += pnx4008_wdt.o
-obj-$(CONFIG_IOP_WATCHDOG) += iop_wdt.o
 obj-$(CONFIG_DAVINCI_WATCHDOG) += davinci_wdt.o
 obj-$(CONFIG_K3_RTI_WATCHDOG) += rti_wdt.o
 obj-$(CONFIG_ORION_WATCHDOG) += orion_wdt.o
diff --git a/drivers/watchdog/iop_wdt.c b/drivers/watchdog/iop_wdt.c
deleted file mode 100644
index 6bf68d4750de..000000000000
--- a/drivers/watchdog/iop_wdt.c
+++ /dev/null
@@ -1,250 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * drivers/char/watchdog/iop_wdt.c
- *
- * WDT driver for Intel I/O Processors
- * Copyright (C) 2005, Intel Corporation.
- *
- * Based on ixp4xx driver, Copyright 2004 (c) MontaVista, Software, Inc.
- *
- *	Curt E Bruns <curt.e.bruns@intel.com>
- *	Peter Milne <peter.milne@d-tacq.com>
- *	Dan Williams <dan.j.williams@intel.com>
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/init.h>
-#include <linux/device.h>
-#include <linux/miscdevice.h>
-#include <linux/watchdog.h>
-#include <linux/uaccess.h>
-#include <mach/hardware.h>
-
-static bool nowayout = WATCHDOG_NOWAYOUT;
-static unsigned long wdt_status;
-static unsigned long boot_status;
-static DEFINE_SPINLOCK(wdt_lock);
-
-#define WDT_IN_USE		0
-#define WDT_OK_TO_CLOSE		1
-#define WDT_ENABLED		2
-
-static unsigned long iop_watchdog_timeout(void)
-{
-	return (0xffffffffUL / get_iop_tick_rate());
-}
-
-/**
- * wdt_supports_disable - determine if we are accessing a iop13xx watchdog
- * or iop3xx by whether it has a disable command
- */
-static int wdt_supports_disable(void)
-{
-	int can_disable;
-
-	if (IOP_WDTCR_EN_ARM != IOP_WDTCR_DIS_ARM)
-		can_disable = 1;
-	else
-		can_disable = 0;
-
-	return can_disable;
-}
-
-static void wdt_enable(void)
-{
-	/* Arm and enable the Timer to starting counting down from 0xFFFF.FFFF
-	 * Takes approx. 10.7s to timeout
-	 */
-	spin_lock(&wdt_lock);
-	write_wdtcr(IOP_WDTCR_EN_ARM);
-	write_wdtcr(IOP_WDTCR_EN);
-	spin_unlock(&wdt_lock);
-}
-
-/* returns 0 if the timer was successfully disabled */
-static int wdt_disable(void)
-{
-	/* Stop Counting */
-	if (wdt_supports_disable()) {
-		spin_lock(&wdt_lock);
-		write_wdtcr(IOP_WDTCR_DIS_ARM);
-		write_wdtcr(IOP_WDTCR_DIS);
-		clear_bit(WDT_ENABLED, &wdt_status);
-		spin_unlock(&wdt_lock);
-		pr_info("Disabled\n");
-		return 0;
-	} else
-		return 1;
-}
-
-static int iop_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(WDT_IN_USE, &wdt_status))
-		return -EBUSY;
-
-	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-	wdt_enable();
-	set_bit(WDT_ENABLED, &wdt_status);
-	return stream_open(inode, file);
-}
-
-static ssize_t iop_wdt_write(struct file *file, const char *data, size_t len,
-		  loff_t *ppos)
-{
-	if (len) {
-		if (!nowayout) {
-			size_t i;
-
-			clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-
-			for (i = 0; i != len; i++) {
-				char c;
-
-				if (get_user(c, data + i))
-					return -EFAULT;
-				if (c == 'V')
-					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
-			}
-		}
-		wdt_enable();
-	}
-	return len;
-}
-
-static const struct watchdog_info ident = {
-	.options = WDIOF_CARDRESET | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
-	.identity = "iop watchdog",
-};
-
-static long iop_wdt_ioctl(struct file *file,
-				unsigned int cmd, unsigned long arg)
-{
-	int options;
-	int ret = -ENOTTY;
-	int __user *argp = (int __user *)arg;
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		if (copy_to_user(argp, &ident, sizeof(ident)))
-			ret = -EFAULT;
-		else
-			ret = 0;
-		break;
-
-	case WDIOC_GETSTATUS:
-		ret = put_user(0, argp);
-		break;
-
-	case WDIOC_GETBOOTSTATUS:
-		ret = put_user(boot_status, argp);
-		break;
-
-	case WDIOC_SETOPTIONS:
-		if (get_user(options, (int *)arg))
-			return -EFAULT;
-
-		if (options & WDIOS_DISABLECARD) {
-			if (!nowayout) {
-				if (wdt_disable() == 0) {
-					set_bit(WDT_OK_TO_CLOSE, &wdt_status);
-					ret = 0;
-				} else
-					ret = -ENXIO;
-			} else
-				ret = 0;
-		}
-		if (options & WDIOS_ENABLECARD) {
-			wdt_enable();
-			ret = 0;
-		}
-		break;
-
-	case WDIOC_KEEPALIVE:
-		wdt_enable();
-		ret = 0;
-		break;
-
-	case WDIOC_GETTIMEOUT:
-		ret = put_user(iop_watchdog_timeout(), argp);
-		break;
-	}
-	return ret;
-}
-
-static int iop_wdt_release(struct inode *inode, struct file *file)
-{
-	int state = 1;
-	if (test_bit(WDT_OK_TO_CLOSE, &wdt_status))
-		if (test_bit(WDT_ENABLED, &wdt_status))
-			state = wdt_disable();
-
-	/* if the timer is not disabled reload and notify that we are still
-	 * going down
-	 */
-	if (state != 0) {
-		wdt_enable();
-		pr_crit("Device closed unexpectedly - reset in %lu seconds\n",
-			iop_watchdog_timeout());
-	}
-
-	clear_bit(WDT_IN_USE, &wdt_status);
-	clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-
-	return 0;
-}
-
-static const struct file_operations iop_wdt_fops = {
-	.owner = THIS_MODULE,
-	.llseek = no_llseek,
-	.write = iop_wdt_write,
-	.unlocked_ioctl = iop_wdt_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-	.open = iop_wdt_open,
-	.release = iop_wdt_release,
-};
-
-static struct miscdevice iop_wdt_miscdev = {
-	.minor = WATCHDOG_MINOR,
-	.name = "watchdog",
-	.fops = &iop_wdt_fops,
-};
-
-static int __init iop_wdt_init(void)
-{
-	int ret;
-
-	/* check if the reset was caused by the watchdog timer */
-	boot_status = (read_rcsr() & IOP_RCSR_WDT) ? WDIOF_CARDRESET : 0;
-
-	/* Configure Watchdog Timeout to cause an Internal Bus (IB) Reset
-	 * NOTE: An IB Reset will Reset both cores in the IOP342
-	 */
-	write_wdtsr(IOP13XX_WDTCR_IB_RESET);
-
-	/* Register after we have the device set up so we cannot race
-	   with an open */
-	ret = misc_register(&iop_wdt_miscdev);
-	if (ret == 0)
-		pr_info("timeout %lu sec\n", iop_watchdog_timeout());
-
-	return ret;
-}
-
-static void __exit iop_wdt_exit(void)
-{
-	misc_deregister(&iop_wdt_miscdev);
-}
-
-module_init(iop_wdt_init);
-module_exit(iop_wdt_exit);
-
-module_param(nowayout, bool, 0);
-MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started");
-
-MODULE_AUTHOR("Curt E Bruns <curt.e.bruns@intel.com>");
-MODULE_DESCRIPTION("iop watchdog timer driver");
-MODULE_LICENSE("GPL");
-- 
2.26.2

