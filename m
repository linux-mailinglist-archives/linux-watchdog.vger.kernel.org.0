Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A28100E8A
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 23:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfKRWEq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 17:04:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57711 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726647AbfKRWEn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 17:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574114681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=8VeWVkmCSulVhV1qmByhbdssiRm0kRpI2tILvMyefww=;
        b=Dak+2mg4MizghJ4weYwL8z8fQx+MFi8yyYHd+Nvyt2F2ayhfStL7WM9eYy0dGBglxyoaEw
        Bmb/B7ytbhEMa920wchWkjWnzeSlb5DeYr9Jcw91vOkZKkBMOeKZmQbMpwtjWc/+PolZx5
        k1jh9H3ZiD2sgp+PUL33BV+sxBRHSuY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-UWvQfcYOM2K_6BunviTasg-1; Mon, 18 Nov 2019 17:04:38 -0500
Received: by mail-qk1-f199.google.com with SMTP id q14so4692889qkq.13
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Nov 2019 14:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z42ZjyEIpk4q751ixdMJNzXEB6jCwh7siqWC0h0FGgA=;
        b=GpPSlVsOs95fNzLuNqg2PUQ+TU80w1hFY+HV/ySSvLCTGSfYEUwZv0LRBxO5K1Myiy
         SgdwG2cAsrvlKWcKY/pjm7jYjzrk7xW+fmllSPKt8tLaDTGA04UGcYwl3aDC7Dy2mnNa
         38GG1FcpvqL/3SxMmbSah0MwuqyE65kKITsea7rVXVy2LhErdXDq/xNLuPOFPfiRu4Ge
         XL5vl7TlhJkXHIUV7DARz2uyDCEJ5oJA7vd7ku2uUWGcy6XWMcoO5H4H2HNpPiW7slvr
         pSxLn0Mq2p0qhiv8Y/OkOjja4cyr6nLI2Qr6wqyA036Xso9KZWCiMRYEy+i1mIAUf6sn
         Lplg==
X-Gm-Message-State: APjAAAX5RIlNUqmjLTYpbfKCJxp/axjF38MwIriGCJtKHrAc8B7s4Jgk
        fSyXk/luu/NxTVeY1NQGYVSunmikQZ4JXKVqSWIlPwDrF70Ri9+dHzBZLvQ7Kbg+YyM9zUiSMMC
        Mk/se0rHAv2KRsFW39BoluXjrwuY=
X-Received: by 2002:a05:620a:101a:: with SMTP id z26mr25703938qkj.344.1574114677892;
        Mon, 18 Nov 2019 14:04:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+o/aY3cmRojkGspWCmuDTGdToedB9QFwTcSMURFKAt5Eo4wRhzmz1vyo1v5goX8rthwAO3g==
X-Received: by 2002:a05:620a:101a:: with SMTP id z26mr25703916qkj.344.1574114677452;
        Mon, 18 Nov 2019 14:04:37 -0800 (PST)
Received: from labbott-redhat.redhat.com (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id g11sm9089482qkm.82.2019.11.18.14.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 14:04:36 -0800 (PST)
From:   Laura Abbott <labbott@redhat.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Laura Abbott <labbott@redhat.com>, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] watchdog: Remove iop_wdt
Date:   Mon, 18 Nov 2019 17:04:32 -0500
Message-Id: <20191118220432.1611-1-labbott@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-MC-Unique: UWvQfcYOM2K_6BunviTasg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


Commit 59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
removed support for some old platforms. Given this driver depends on
a now removed platform, just remove the driver.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
Found this while reviewing config options. Not sure if this was kept
around for other reasons or just missed.
---
 drivers/watchdog/Kconfig   |  16 ---
 drivers/watchdog/Makefile  |   1 -
 drivers/watchdog/iop_wdt.c | 249 -------------------------------------
 3 files changed, 266 deletions(-)
 delete mode 100644 drivers/watchdog/iop_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 58e7c100b6ad..fef9078a44b6 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -554,22 +554,6 @@ config PNX4008_WATCHDOG
=20
 =09  Say N if you are unsure.
=20
-config IOP_WATCHDOG
-=09tristate "IOP Watchdog"
-=09depends on ARCH_IOP13XX
-=09select WATCHDOG_NOWAYOUT if (ARCH_IOP32X || ARCH_IOP33X)
-=09help
-=09  Say Y here if to include support for the watchdog timer
-=09  in the Intel IOP3XX & IOP13XX I/O Processors.  This driver can
-=09  be built as a module by choosing M. The module will
-=09  be called iop_wdt.
-
-=09  Note: The IOP13XX watchdog does an Internal Bus Reset which will
-=09  affect both cores and the peripherals of the IOP.  The ATU-X
-=09  and/or ATUe configuration registers will remain intact, but if
-=09  operating as an Root Complex and/or Central Resource, the PCI-X
-=09  and/or PCIe busses will also be reset.  THIS IS A VERY BIG HAMMER.
-
 config DAVINCI_WATCHDOG
 =09tristate "DaVinci watchdog"
 =09depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2ee352bf3372..9de21f5ce909 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -55,7 +55,6 @@ obj-$(CONFIG_SAMA5D4_WATCHDOG) +=3D sama5d4_wdt.o
 obj-$(CONFIG_DW_WATCHDOG) +=3D dw_wdt.o
 obj-$(CONFIG_EP93XX_WATCHDOG) +=3D ep93xx_wdt.o
 obj-$(CONFIG_PNX4008_WATCHDOG) +=3D pnx4008_wdt.o
-obj-$(CONFIG_IOP_WATCHDOG) +=3D iop_wdt.o
 obj-$(CONFIG_DAVINCI_WATCHDOG) +=3D davinci_wdt.o
 obj-$(CONFIG_ORION_WATCHDOG) +=3D orion_wdt.o
 obj-$(CONFIG_SUNXI_WATCHDOG) +=3D sunxi_wdt.o
diff --git a/drivers/watchdog/iop_wdt.c b/drivers/watchdog/iop_wdt.c
deleted file mode 100644
index a9ccdb9a9159..000000000000
--- a/drivers/watchdog/iop_wdt.c
+++ /dev/null
@@ -1,249 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * drivers/char/watchdog/iop_wdt.c
- *
- * WDT driver for Intel I/O Processors
- * Copyright (C) 2005, Intel Corporation.
- *
- * Based on ixp4xx driver, Copyright 2004 (c) MontaVista, Software, Inc.
- *
- *=09Curt E Bruns <curt.e.bruns@intel.com>
- *=09Peter Milne <peter.milne@d-tacq.com>
- *=09Dan Williams <dan.j.williams@intel.com>
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
-static bool nowayout =3D WATCHDOG_NOWAYOUT;
-static unsigned long wdt_status;
-static unsigned long boot_status;
-static DEFINE_SPINLOCK(wdt_lock);
-
-#define WDT_IN_USE=09=090
-#define WDT_OK_TO_CLOSE=09=091
-#define WDT_ENABLED=09=092
-
-static unsigned long iop_watchdog_timeout(void)
-{
-=09return (0xffffffffUL / get_iop_tick_rate());
-}
-
-/**
- * wdt_supports_disable - determine if we are accessing a iop13xx watchdog
- * or iop3xx by whether it has a disable command
- */
-static int wdt_supports_disable(void)
-{
-=09int can_disable;
-
-=09if (IOP_WDTCR_EN_ARM !=3D IOP_WDTCR_DIS_ARM)
-=09=09can_disable =3D 1;
-=09else
-=09=09can_disable =3D 0;
-
-=09return can_disable;
-}
-
-static void wdt_enable(void)
-{
-=09/* Arm and enable the Timer to starting counting down from 0xFFFF.FFFF
-=09 * Takes approx. 10.7s to timeout
-=09 */
-=09spin_lock(&wdt_lock);
-=09write_wdtcr(IOP_WDTCR_EN_ARM);
-=09write_wdtcr(IOP_WDTCR_EN);
-=09spin_unlock(&wdt_lock);
-}
-
-/* returns 0 if the timer was successfully disabled */
-static int wdt_disable(void)
-{
-=09/* Stop Counting */
-=09if (wdt_supports_disable()) {
-=09=09spin_lock(&wdt_lock);
-=09=09write_wdtcr(IOP_WDTCR_DIS_ARM);
-=09=09write_wdtcr(IOP_WDTCR_DIS);
-=09=09clear_bit(WDT_ENABLED, &wdt_status);
-=09=09spin_unlock(&wdt_lock);
-=09=09pr_info("Disabled\n");
-=09=09return 0;
-=09} else
-=09=09return 1;
-}
-
-static int iop_wdt_open(struct inode *inode, struct file *file)
-{
-=09if (test_and_set_bit(WDT_IN_USE, &wdt_status))
-=09=09return -EBUSY;
-
-=09clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-=09wdt_enable();
-=09set_bit(WDT_ENABLED, &wdt_status);
-=09return stream_open(inode, file);
-}
-
-static ssize_t iop_wdt_write(struct file *file, const char *data, size_t l=
en,
-=09=09  loff_t *ppos)
-{
-=09if (len) {
-=09=09if (!nowayout) {
-=09=09=09size_t i;
-
-=09=09=09clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-
-=09=09=09for (i =3D 0; i !=3D len; i++) {
-=09=09=09=09char c;
-
-=09=09=09=09if (get_user(c, data + i))
-=09=09=09=09=09return -EFAULT;
-=09=09=09=09if (c =3D=3D 'V')
-=09=09=09=09=09set_bit(WDT_OK_TO_CLOSE, &wdt_status);
-=09=09=09}
-=09=09}
-=09=09wdt_enable();
-=09}
-=09return len;
-}
-
-static const struct watchdog_info ident =3D {
-=09.options =3D WDIOF_CARDRESET | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
-=09.identity =3D "iop watchdog",
-};
-
-static long iop_wdt_ioctl(struct file *file,
-=09=09=09=09unsigned int cmd, unsigned long arg)
-{
-=09int options;
-=09int ret =3D -ENOTTY;
-=09int __user *argp =3D (int __user *)arg;
-
-=09switch (cmd) {
-=09case WDIOC_GETSUPPORT:
-=09=09if (copy_to_user(argp, &ident, sizeof(ident)))
-=09=09=09ret =3D -EFAULT;
-=09=09else
-=09=09=09ret =3D 0;
-=09=09break;
-
-=09case WDIOC_GETSTATUS:
-=09=09ret =3D put_user(0, argp);
-=09=09break;
-
-=09case WDIOC_GETBOOTSTATUS:
-=09=09ret =3D put_user(boot_status, argp);
-=09=09break;
-
-=09case WDIOC_SETOPTIONS:
-=09=09if (get_user(options, (int *)arg))
-=09=09=09return -EFAULT;
-
-=09=09if (options & WDIOS_DISABLECARD) {
-=09=09=09if (!nowayout) {
-=09=09=09=09if (wdt_disable() =3D=3D 0) {
-=09=09=09=09=09set_bit(WDT_OK_TO_CLOSE, &wdt_status);
-=09=09=09=09=09ret =3D 0;
-=09=09=09=09} else
-=09=09=09=09=09ret =3D -ENXIO;
-=09=09=09} else
-=09=09=09=09ret =3D 0;
-=09=09}
-=09=09if (options & WDIOS_ENABLECARD) {
-=09=09=09wdt_enable();
-=09=09=09ret =3D 0;
-=09=09}
-=09=09break;
-
-=09case WDIOC_KEEPALIVE:
-=09=09wdt_enable();
-=09=09ret =3D 0;
-=09=09break;
-
-=09case WDIOC_GETTIMEOUT:
-=09=09ret =3D put_user(iop_watchdog_timeout(), argp);
-=09=09break;
-=09}
-=09return ret;
-}
-
-static int iop_wdt_release(struct inode *inode, struct file *file)
-{
-=09int state =3D 1;
-=09if (test_bit(WDT_OK_TO_CLOSE, &wdt_status))
-=09=09if (test_bit(WDT_ENABLED, &wdt_status))
-=09=09=09state =3D wdt_disable();
-
-=09/* if the timer is not disabled reload and notify that we are still
-=09 * going down
-=09 */
-=09if (state !=3D 0) {
-=09=09wdt_enable();
-=09=09pr_crit("Device closed unexpectedly - reset in %lu seconds\n",
-=09=09=09iop_watchdog_timeout());
-=09}
-
-=09clear_bit(WDT_IN_USE, &wdt_status);
-=09clear_bit(WDT_OK_TO_CLOSE, &wdt_status);
-
-=09return 0;
-}
-
-static const struct file_operations iop_wdt_fops =3D {
-=09.owner =3D THIS_MODULE,
-=09.llseek =3D no_llseek,
-=09.write =3D iop_wdt_write,
-=09.unlocked_ioctl =3D iop_wdt_ioctl,
-=09.open =3D iop_wdt_open,
-=09.release =3D iop_wdt_release,
-};
-
-static struct miscdevice iop_wdt_miscdev =3D {
-=09.minor =3D WATCHDOG_MINOR,
-=09.name =3D "watchdog",
-=09.fops =3D &iop_wdt_fops,
-};
-
-static int __init iop_wdt_init(void)
-{
-=09int ret;
-
-=09/* check if the reset was caused by the watchdog timer */
-=09boot_status =3D (read_rcsr() & IOP_RCSR_WDT) ? WDIOF_CARDRESET : 0;
-
-=09/* Configure Watchdog Timeout to cause an Internal Bus (IB) Reset
-=09 * NOTE: An IB Reset will Reset both cores in the IOP342
-=09 */
-=09write_wdtsr(IOP13XX_WDTCR_IB_RESET);
-
-=09/* Register after we have the device set up so we cannot race
-=09   with an open */
-=09ret =3D misc_register(&iop_wdt_miscdev);
-=09if (ret =3D=3D 0)
-=09=09pr_info("timeout %lu sec\n", iop_watchdog_timeout());
-
-=09return ret;
-}
-
-static void __exit iop_wdt_exit(void)
-{
-=09misc_deregister(&iop_wdt_miscdev);
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
--=20
2.21.0

