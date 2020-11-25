Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949342C3AC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 09:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgKYIQe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 03:16:34 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:53917 "EHLO
        ACLMS1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgKYIQd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 03:16:33 -0500
X-Greylist: delayed 1488 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 03:16:22 EST
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS1.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te30c5c67e5ac14014b1470@ACLMS1.advantech.com.tw>;
 Wed, 25 Nov 2020 15:09:18 +0800
Received: from localhost (124.9.5.81) by taipei08.ADVANTECH.CORP
 (172.20.0.235) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 25 Nov
 2020 15:09:16 +0800
From:   Shihlun Lin <shihlun.lin@advantech.com.tw>
To:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Campion Kang <campion.kang@advantech.com.tw>,
        Shihlun Lin <shihlun.lin@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: [RESEND PATCH v4 6/6] watchdog: ahc1ec0-wdt: Add sub-device watchdog for Advantech embedded controller
Date:   Wed, 25 Nov 2020 15:07:44 +0800
Message-ID: <20201125070744.4651-6-shihlun.lin@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.9.5.81]
X-ClientProxiedBy: taipei09.ADVANTECH.CORP (172.20.0.236) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is one of sub-device driver for Advantech embedded controller
AHC1EC0. This driver provide watchdog functionality for Advantech
related applications to restart the system.

Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
---
 drivers/watchdog/Kconfig       |   8 +
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/ahc1ec0-wdt.c | 489 +++++++++++++++++++++++++++++++++
 3 files changed, 498 insertions(+)
 create mode 100644 drivers/watchdog/ahc1ec0-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index fd7968635e6d..82084e5af35e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1634,6 +1634,14 @@ config NIC7018_WDT
 	  To compile this driver as a module, choose M here: the module will be
 	  called nic7018_wdt.
 
+config AHC1EC0_WDT
+	tristate "Advantech EC Watchdog Function"
+	depends on MFD_AHC1EC0
+	help
+	  This is sub-device for Advantech embedded controller AHC1EC0. This
+	  driver provide watchdog functionality for Advantech related
+	  applications to restart the system.
+
 # M68K Architecture
 
 config M54xx_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 071a2e50be98..93d15eed1f7c 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -145,6 +145,7 @@ obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
 obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
 obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
 obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
+obj-$(CONFIG_AHC1EC0_WDT) += ahc1ec0-wdt.o
 obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
 
 # M68K Architecture
diff --git a/drivers/watchdog/ahc1ec0-wdt.c b/drivers/watchdog/ahc1ec0-wdt.c
new file mode 100644
index 000000000000..3799b99f6423
--- /dev/null
+++ b/drivers/watchdog/ahc1ec0-wdt.c
@@ -0,0 +1,489 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Watchdog Driver for Advantech controlling EC chip AHC1EC0
+ *
+ * Copyright (C) 2020, Advantech Automation Corp.
+ *
+ * Change Log:
+ *	Version 1.00 <10/10/2014> Sun.Lang
+ *        - Initial version
+ *      Version 1.01 <12/30/2015> Jiangwei.Zhu
+ *        - Modify adv_watchdog_init function to install the driver to
+ *        - the support devices.
+ *      Version 1.02 <03/04/2016> Jiangwei.Zhu
+ *        - Support UNO-1372G-E3AE, TPC-1782H-433AE, APAX-5580-433AE
+ *      Version 1.03 <05/09/2016> Ji.Xu
+ *        - Support EC watchdog mini-board on UNO-3083G/3085G-D44E/D64E
+ *        - APAX-5580-473AE/4C3AE.
+ *        - Modify the timeout unit to 1 second.
+ *        - Modify the device name check method to fuzzy matching.
+ *      Version 1.04 <06/28/2017> Ji.Xu
+ *        - Support EC UNO-2271G-E2xAE.
+ *        - Support EC UNO-2271G-E02xAE.
+ *        - Support EC UNO-2473G-JxAE.
+ *        - Support proc filesystem.
+ *      Version 1.05 <09/20/2017> Ji.Xu
+ *        - Support EC UNO-2484G-633xAE.
+ *        - Support EC UNO-2484G-653xAE.
+ *        - Support EC UNO-2484G-673xAE.
+ *        - Support EC UNO-2484G-733xAE.
+ *        - Support EC UNO-2484G-753xAE.
+ *        - Support EC UNO-2484G-773xAE.
+ *      Version 1.06 <10/26/2017> Ji.Xu
+ *        - Support EC UNO-3283G-674AE
+ *        - Support EC UNO-3285G-674AE
+ *      Version 1.07 <11/16/2017> Zhang.Yang
+ *        - Support EC UNO-1372G-J021AE/J031AE
+ *        - Support EC UNO-2372G
+ *      Version 1.08 <02/02/2018> Ji.Xu
+ *        - Support EC TPC-B500-6??AE
+ *        - Support EC TPC-5???T-6??AE
+ *        - Support EC TPC-5???W-6??AE
+ *      Version 1.09 <03/20/2018> Ji.Xu
+ *        - Support for compiling in kernel-4.10 and below.
+ *      Version 1.10 <02/20/2019> Ji.Xu
+ *        - Support EC UNO-420
+ *        - Support EC TPC-B200-???AE
+ *        - Support EC TPC-2???T-???AE
+ *        - Support EC TPC-2???W-???AE
+ *      Version 1.11 <08/30/2019> Yao.Kang
+ *	  - Support 32-bit programs on 64-bit kernel
+ *      Version 1.12 <12/03/2019> Jianfeng.dai
+ *	  - Support support UNO-2372G watchdog
+ *      Version 1.13 <04/24/2020> Yao.Kang
+ *	  - Support support UNO-2473G
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/watchdog.h>
+#include <linux/ioport.h>
+#include <linux/fcntl.h>
+#include <linux/version.h>
+#include <linux/ioctl.h>
+#include <linux/io.h>
+#include <linux/uaccess.h>
+#include <linux/uaccess.h>
+#include <asm/switch_to.h>
+#include <linux/platform_device.h>
+#include <linux/notifier.h>
+#include <linux/reboot.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/mfd/ahc1ec0.h>
+#include <linux/seq_file.h>
+#include <linux/proc_fs.h>
+
+#define ADVANTECH_EC_WDT_VER        "1.12"
+#define ADVANTECH_EC_WDT_DATE       "04/24/2020"
+
+#define PROCFS_MAX_SIZE     128
+
+static char adv_expect_close;
+static unsigned long advwdt_is_open;
+static unsigned short timeout = 450;
+static unsigned int major;
+struct mutex lock_ioctl;
+
+struct adv_wdt_info {
+	unsigned char chip_name[32];
+	unsigned char is_enable[8];
+	unsigned long current_timeout;
+};
+
+static struct adv_wdt_info wdt_data = {
+	.chip_name = "Advantech Embedded Controller",
+	.is_enable = "No",
+	.current_timeout = 45,
+};
+
+static int wdt_proc_read(struct seq_file *m, void *p);
+
+static void *c_start(struct seq_file *m, loff_t *pos)
+{
+	return *pos < 1 ? (void *)1 : NULL;
+}
+
+static void *c_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	++*pos;
+	return NULL;
+}
+
+static void c_stop(struct seq_file *m, void *v)
+{
+	/*nothing to do*/
+}
+
+static int c_show(struct seq_file *m, void *p)
+{
+	wdt_proc_read(m, p);
+	return 0;
+}
+
+static const struct seq_operations proc_seq_ops = {
+	.show  = c_show,
+	.start = c_start,
+	.next  = c_next,
+	.stop  = c_stop
+};
+
+static int wdt_proc_open(struct inode *inode, struct file *file)
+{
+	int ret;
+	struct seq_file *m;
+
+	ret = seq_open(file, &proc_seq_ops);
+	m = file->private_data;
+	m->private = file->f_path.dentry->d_iname;
+
+	return ret;
+}
+
+static int wdt_proc_read(struct seq_file *m, void *p)
+{
+	unsigned char *chip_name, *is_enable;
+	unsigned long current_timeout = 0;
+
+	chip_name = wdt_data.chip_name;
+	current_timeout = wdt_data.current_timeout;
+	is_enable = wdt_data.is_enable;
+
+	seq_printf(m, "name       : %s\n", chip_name);
+	seq_printf(m, "timeout    : %ld\n", current_timeout);
+	seq_printf(m, "is_enable  : %s\n", is_enable);
+
+	return 0;
+}
+
+static const struct proc_ops fops = {
+	.proc_open  = wdt_proc_open,
+	.proc_read  = seq_read,
+};
+
+static int wdt_create_proc(char *name)
+{
+	struct proc_dir_entry *wdt_proc_entries;
+	unsigned char proc_name[64] = {0};
+
+	sprintf(proc_name, "%s", name);
+
+	wdt_proc_entries = proc_create(proc_name, 0644, NULL, &fops);
+	if (wdt_proc_entries == NULL) {
+		remove_proc_entry(proc_name, NULL);
+		pr_err("Error: Could not initialize /proc/%s", proc_name);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void wdt_remove_proc(char *name)
+{
+	unsigned char proc_name[64] = {0};
+
+	sprintf(proc_name, "%s", name);
+	remove_proc_entry(proc_name, NULL);
+}
+
+static int set_delay(unsigned short delay_timeout)
+{
+	if (write_hw_ram(EC_RESET_DELAY_TIME_L, delay_timeout & 0x00FF)) {
+		pr_err("Failed to set Watchdog Retset Time Low byte.");
+		return -EINVAL;
+	}
+
+	if (write_hw_ram(EC_RESET_DELAY_TIME_H, (delay_timeout & 0xFF00) >> 8)) {
+		pr_err("Failed to set Watchdog Retset Time Hight byte.");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int advwdt_set_heartbeat(unsigned long t)
+{
+	if (t < 1 || t > 6553)
+		return -EINVAL;
+
+	timeout = (t * 10);
+
+	return 0;
+}
+
+static long advwdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	unsigned long new_timeout;
+	void __user *argp = (void __user *)arg;
+	int __user *p = argp;
+	int options;
+	static struct watchdog_info ident = {
+		.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE,
+		.firmware_version = 0,
+		.identity = "Advantech WDT"
+	};
+
+	mutex_lock(&lock_ioctl);
+	if (advwdt_is_open < 1) {
+		pr_err("watchdog does not open.");
+		mutex_unlock(&lock_ioctl);
+		return -1;
+	}
+
+	switch (cmd) {
+	case WDIOC_GETSUPPORT:
+		if (copy_to_user(argp, &ident, sizeof(ident))) {
+			mutex_unlock(&lock_ioctl);
+			return -EFAULT;
+		}
+		break;
+
+	case WDIOC_GETSTATUS:
+	case WDIOC_GETBOOTSTATUS:
+		mutex_unlock(&lock_ioctl);
+		return put_user(0, p);
+
+	case WDIOC_KEEPALIVE:
+		if (write_hwram_command(EC_WDT_RESET)) {
+			pr_err("Failed to set Watchdog reset.");
+			return -EINVAL;
+		}
+		break;
+
+	case WDIOC_SETTIMEOUT:
+		if (get_user(new_timeout, (unsigned long *)arg)) {
+			mutex_unlock(&lock_ioctl);
+			return -EFAULT;
+		}
+
+		if (advwdt_set_heartbeat(new_timeout)) {
+			pr_err("Advantch WDT: the input timeout is out of range.");
+			pr_err("Please choose valid data between 1 ~ 6553.");
+			mutex_unlock(&lock_ioctl);
+			return -EINVAL;
+		}
+
+		if (set_delay((unsigned short)(timeout - 1))) {
+			pr_err("Failed to set Watchdog delay.");
+			return -EINVAL;
+		}
+
+		if (write_hwram_command(EC_WDT_START)) {
+			pr_err("Failed to set Watchdog start.");
+			return -EINVAL;
+		}
+
+		wdt_data.is_enable[0] = 'Y';
+		wdt_data.is_enable[1] = 'e';
+		wdt_data.is_enable[2] = 's';
+		wdt_data.current_timeout = timeout / 10;
+		break;
+
+	case WDIOC_GETTIMEOUT:
+		if (timeout == 0) {
+			mutex_unlock(&lock_ioctl);
+			return -EFAULT;
+		}
+		mutex_unlock(&lock_ioctl);
+
+		return put_user(timeout / 10, (unsigned long *)arg);
+
+	case WDIOC_SETOPTIONS:
+		if (get_user(options, p)) {
+			mutex_unlock(&lock_ioctl);
+			return -EFAULT;
+		}
+
+		if (options & WDIOS_DISABLECARD) {
+			if (write_hwram_command(EC_WDT_STOP)) {
+				pr_err("Failed to set Watchdog stop.");
+				return -EINVAL;
+			}
+
+			wdt_data.is_enable[0] = 'N';
+			wdt_data.is_enable[1] = 'o';
+			wdt_data.is_enable[2] = '\0';
+		}
+
+		if (options & WDIOS_ENABLECARD) {
+			if (write_hwram_command(EC_WDT_STOP)) {
+				pr_err("Failed to set Watchdog stop");
+				return -EINVAL;
+			}
+
+			if (set_delay((unsigned short)(timeout-1))) {
+				pr_err("Failed to set Watchdog delay.");
+				return -EINVAL;
+			}
+
+			if (write_hwram_command(EC_WDT_START)) {
+				pr_err("Failed to set Watchdog start.");
+				return -EINVAL;
+			}
+
+			wdt_data.is_enable[0] = 'Y';
+			wdt_data.is_enable[1] = 'e';
+			wdt_data.is_enable[2] = 's';
+		}
+		mutex_unlock(&lock_ioctl);
+
+		return 0;
+
+	default:
+		mutex_unlock(&lock_ioctl);
+		return -ENOTTY;
+	}
+
+	mutex_unlock(&lock_ioctl);
+	return 0;
+}
+
+static int advwdt_open(struct inode *inode, struct file *file)
+{
+	if (test_and_set_bit(0, &advwdt_is_open))
+		return -EBUSY;
+
+	if (write_hwram_command(EC_WDT_STOP)) {
+		pr_err("Failed to set Watchdog stop.");
+		return -EINVAL;
+	}
+	wdt_data.is_enable[0] = 'N';
+	wdt_data.is_enable[1] = 'o';
+	wdt_data.is_enable[2] = '\0';
+	return 0;
+}
+
+static int advwdt_close(struct inode *inode, struct file *file)
+{
+	clear_bit(0, &advwdt_is_open);
+	adv_expect_close = 0;
+
+	return 0;
+}
+
+/* Notifier for system down */
+static int advwdt_notify_sys(struct notifier_block *this, unsigned long code, void *unused)
+{
+	if (code == SYS_DOWN || code == SYS_HALT) {
+		/* Turn the WDT off */
+		if (write_hwram_command(EC_WDT_STOP)) {
+			pr_err("Failed to set Watchdog stop.");
+			return -EINVAL;
+		}
+		wdt_data.is_enable[0] = 'N';
+		wdt_data.is_enable[1] = 'o';
+		wdt_data.is_enable[2] = '\0';
+		pr_info("%s: notify sys shutdown", __func__);
+	}
+
+	return NOTIFY_DONE;
+}
+
+/* Kernel Interfaces */
+static const struct file_operations advwdt_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = advwdt_ioctl,
+	.compat_ioctl = advwdt_ioctl,
+	.open = advwdt_open,
+	.release = advwdt_close,
+};
+
+/*
+ *	The WDT needs to learn about soft shutdowns in order to
+ *	turn the timebomb registers off.
+ */
+static struct notifier_block advwdt_notifier = {
+	advwdt_notify_sys,
+	NULL,
+	0
+};
+
+static struct class *adv_ec_class;
+static dev_t devno;
+
+static int adv_ec_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev;
+
+	mutex_init(&lock_ioctl);
+
+	major = register_chrdev(0, "adv_watchdog", &advwdt_fops);
+	if (major < 0) {
+		pr_err("Advwdt register chrdev failed!");
+		return major;
+	}
+	devno = MKDEV(major, 0);
+	register_reboot_notifier(&advwdt_notifier);
+
+	/* Create /dev/watchdog for userspace access */
+	adv_ec_class = class_create(THIS_MODULE, "adv_watchdog");
+	if (IS_ERR(adv_ec_class)) {
+		pr_err("%s: can't create class", __func__);
+		unregister_chrdev_region(devno, 1);
+		return -1;
+	}
+
+	dev = device_create(adv_ec_class, NULL, devno, NULL, "watchdog");
+	if (IS_ERR(dev)) {
+		pr_err("%s: can't create device watchdog", __func__);
+		unregister_chrdev_region(devno, 1);
+		class_destroy(adv_ec_class);
+		return -1;
+	}
+
+	wdt_create_proc("advwdtinfo");
+	wdt_data.current_timeout = timeout / 10;
+	wdt_data.is_enable[0] = 'N';
+	wdt_data.is_enable[1] = 'o';
+	wdt_data.is_enable[2] = '\0';
+
+	dev_info(&pdev->dev, "Ver:%s, Data:%s, probe done",
+			ADVANTECH_EC_WDT_VER, ADVANTECH_EC_WDT_DATE);
+
+	return 0;
+}
+
+static int adv_ec_wdt_remove(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = write_hwram_command(EC_WDT_STOP);
+	if (ret) {
+		pr_err("Failed to set Watchdog stop.");
+		return ret;
+	}
+
+	wdt_data.is_enable[0] = 'N';
+	wdt_data.is_enable[1] = 'o';
+	wdt_data.is_enable[2] = '\0';
+	clear_bit(0, &advwdt_is_open);
+	adv_expect_close = 0;
+	pr_info("Driver uninstall, set Watchdog stop.");
+
+	device_destroy(adv_ec_class, devno);
+	unregister_chrdev_region(devno, 1);
+	class_destroy(adv_ec_class);
+
+	unregister_reboot_notifier(&advwdt_notifier);
+	unregister_chrdev(major, "adv_watchdog");
+
+	wdt_remove_proc("advwdtinfo");
+
+	return 0;
+}
+
+static struct platform_driver adv_wdt_drv = {
+	.driver = {
+		.name = "adv-ec-wdt",
+	},
+	.probe = adv_ec_wdt_probe,
+	.remove = adv_ec_wdt_remove,
+};
+module_platform_driver(adv_wdt_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Advantech EC Watchdog Driver.");
-- 
2.17.1

