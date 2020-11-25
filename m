Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9342C423C
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgKYOgF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 09:36:05 -0500
Received: from gproxy4-pub.mail.unifiedlayer.com ([69.89.23.142]:60528 "EHLO
        gproxy4-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725616AbgKYOgF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 09:36:05 -0500
X-Greylist: delayed 1337 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 09:36:03 EST
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id 29E45175C40
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Nov 2020 07:13:42 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id hvYDk4PlDdCH5hvYDk9azm; Wed, 25 Nov 2020 07:13:42 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=CKwEoyjD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=CS3NValkAAAA:8
 a=GdcuaSrckRuQCKMtUHEA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=-RoEEKskQ1sA:10:nop_election2020_name_body a=EAZcYiVwDkS75jsqyrV5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ey0CpcZgRuvk62lYkkoBJjGQ8WlBnOY71BmGvPR+jAg=; b=ocG6A4HY0qC7Z2BfT7jW58cRdV
        99HNF9VPN/SXkZyVLpXxPfjXQYUp/YX8LA0gdwlN3lXkyCpcwHhyVfoV+YtVNyxGWaIhP7bY5Y/SM
        IQ1bk8ToUnKk/2prt4vYeyz/Kj3c7RypaBCbWM0nE/8GdASCN+VXZi6czBUaKMc5LBTX4jytHIgw4
        Rmk2T6C9PyARE+Rdxp/FqKBMKGTl25/H4SkD/M2A30gSfziCUvqHPCVjYNo1NHY8mJB+CV8bgC+MB
        k6Rkkkj0gMicorcr/ljA2sLOAH9eXcIoXqhk/apG/eh5fsx9pxu1Q34uiSR6URSryw+SJUqsguK3w
        HRl0ykyg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34392 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1khvYC-002Hdq-Tz; Wed, 25 Nov 2020 14:13:41 +0000
Date:   Wed, 25 Nov 2020 06:13:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Shihlun Lin <shihlun.lin@advantech.com.tw>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Campion Kang <campion.kang@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [RESEND PATCH v4 6/6] watchdog: ahc1ec0-wdt: Add sub-device
 watchdog for Advantech embedded controller
Message-ID: <20201125141340.GB96791@roeck-us.net>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
 <20201125070744.4651-6-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125070744.4651-6-shihlun.lin@advantech.com.tw>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1khvYC-002Hdq-Tz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:34392
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 15
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 25, 2020 at 03:07:44PM +0800, Shihlun Lin wrote:
> This is one of sub-device driver for Advantech embedded controller
> AHC1EC0. This driver provide watchdog functionality for Advantech
> related applications to restart the system.
> 
> Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>

New watchdog drivers must use the watchdog API to register
the watchdog device.

> ---
>  drivers/watchdog/Kconfig       |   8 +
>  drivers/watchdog/Makefile      |   1 +
>  drivers/watchdog/ahc1ec0-wdt.c | 489 +++++++++++++++++++++++++++++++++
>  3 files changed, 498 insertions(+)
>  create mode 100644 drivers/watchdog/ahc1ec0-wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index fd7968635e6d..82084e5af35e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1634,6 +1634,14 @@ config NIC7018_WDT
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called nic7018_wdt.
>  
> +config AHC1EC0_WDT
> +	tristate "Advantech EC Watchdog Function"
> +	depends on MFD_AHC1EC0
> +	help
> +	  This is sub-device for Advantech embedded controller AHC1EC0. This
> +	  driver provide watchdog functionality for Advantech related
> +	  applications to restart the system.
> +
>  # M68K Architecture
>  
>  config M54xx_WATCHDOG
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 071a2e50be98..93d15eed1f7c 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
>  obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
>  obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
>  obj-$(CONFIG_NIC7018_WDT) += nic7018_wdt.o
> +obj-$(CONFIG_AHC1EC0_WDT) += ahc1ec0-wdt.o
>  obj-$(CONFIG_MLX_WDT) += mlx_wdt.o
>  
>  # M68K Architecture
> diff --git a/drivers/watchdog/ahc1ec0-wdt.c b/drivers/watchdog/ahc1ec0-wdt.c
> new file mode 100644
> index 000000000000..3799b99f6423
> --- /dev/null
> +++ b/drivers/watchdog/ahc1ec0-wdt.c
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Watchdog Driver for Advantech controlling EC chip AHC1EC0
> + *
> + * Copyright (C) 2020, Advantech Automation Corp.
> + *
> + * Change Log:
> + *	Version 1.00 <10/10/2014> Sun.Lang
> + *        - Initial version
> + *      Version 1.01 <12/30/2015> Jiangwei.Zhu
> + *        - Modify adv_watchdog_init function to install the driver to
> + *        - the support devices.
> + *      Version 1.02 <03/04/2016> Jiangwei.Zhu
> + *        - Support UNO-1372G-E3AE, TPC-1782H-433AE, APAX-5580-433AE
> + *      Version 1.03 <05/09/2016> Ji.Xu
> + *        - Support EC watchdog mini-board on UNO-3083G/3085G-D44E/D64E
> + *        - APAX-5580-473AE/4C3AE.
> + *        - Modify the timeout unit to 1 second.
> + *        - Modify the device name check method to fuzzy matching.
> + *      Version 1.04 <06/28/2017> Ji.Xu
> + *        - Support EC UNO-2271G-E2xAE.
> + *        - Support EC UNO-2271G-E02xAE.
> + *        - Support EC UNO-2473G-JxAE.
> + *        - Support proc filesystem.
> + *      Version 1.05 <09/20/2017> Ji.Xu
> + *        - Support EC UNO-2484G-633xAE.
> + *        - Support EC UNO-2484G-653xAE.
> + *        - Support EC UNO-2484G-673xAE.
> + *        - Support EC UNO-2484G-733xAE.
> + *        - Support EC UNO-2484G-753xAE.
> + *        - Support EC UNO-2484G-773xAE.
> + *      Version 1.06 <10/26/2017> Ji.Xu
> + *        - Support EC UNO-3283G-674AE
> + *        - Support EC UNO-3285G-674AE
> + *      Version 1.07 <11/16/2017> Zhang.Yang
> + *        - Support EC UNO-1372G-J021AE/J031AE
> + *        - Support EC UNO-2372G
> + *      Version 1.08 <02/02/2018> Ji.Xu
> + *        - Support EC TPC-B500-6??AE
> + *        - Support EC TPC-5???T-6??AE
> + *        - Support EC TPC-5???W-6??AE
> + *      Version 1.09 <03/20/2018> Ji.Xu
> + *        - Support for compiling in kernel-4.10 and below.
> + *      Version 1.10 <02/20/2019> Ji.Xu
> + *        - Support EC UNO-420
> + *        - Support EC TPC-B200-???AE
> + *        - Support EC TPC-2???T-???AE
> + *        - Support EC TPC-2???W-???AE
> + *      Version 1.11 <08/30/2019> Yao.Kang
> + *	  - Support 32-bit programs on 64-bit kernel
> + *      Version 1.12 <12/03/2019> Jianfeng.dai
> + *	  - Support support UNO-2372G watchdog
> + *      Version 1.13 <04/24/2020> Yao.Kang
> + *	  - Support support UNO-2473G
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/watchdog.h>
> +#include <linux/ioport.h>
> +#include <linux/fcntl.h>
> +#include <linux/version.h>
> +#include <linux/ioctl.h>
> +#include <linux/io.h>
> +#include <linux/uaccess.h>
> +#include <linux/uaccess.h>
> +#include <asm/switch_to.h>
> +#include <linux/platform_device.h>
> +#include <linux/notifier.h>
> +#include <linux/reboot.h>
> +#include <linux/init.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/mfd/ahc1ec0.h>
> +#include <linux/seq_file.h>
> +#include <linux/proc_fs.h>

I don't think this large list of include files is needed.

> +
> +#define ADVANTECH_EC_WDT_VER        "1.12"
> +#define ADVANTECH_EC_WDT_DATE       "04/24/2020"
> +
> +#define PROCFS_MAX_SIZE     128
> +
> +static char adv_expect_close;
> +static unsigned long advwdt_is_open;
> +static unsigned short timeout = 450;
> +static unsigned int major;
> +struct mutex lock_ioctl;
> +
> +struct adv_wdt_info {
> +	unsigned char chip_name[32];
> +	unsigned char is_enable[8];
> +	unsigned long current_timeout;
> +};
> +
> +static struct adv_wdt_info wdt_data = {
> +	.chip_name = "Advantech Embedded Controller",
> +	.is_enable = "No",
> +	.current_timeout = 45,
> +};
> +
> +static int wdt_proc_read(struct seq_file *m, void *p);
> +
> +static void *c_start(struct seq_file *m, loff_t *pos)
> +{
> +	return *pos < 1 ? (void *)1 : NULL;
> +}
> +
> +static void *c_next(struct seq_file *m, void *v, loff_t *pos)
> +{
> +	++*pos;
> +	return NULL;
> +}
> +
> +static void c_stop(struct seq_file *m, void *v)
> +{
> +	/*nothing to do*/
> +}
> +
> +static int c_show(struct seq_file *m, void *p)
> +{
> +	wdt_proc_read(m, p);
> +	return 0;
> +}
> +
> +static const struct seq_operations proc_seq_ops = {
> +	.show  = c_show,
> +	.start = c_start,
> +	.next  = c_next,
> +	.stop  = c_stop
> +};
> +
> +static int wdt_proc_open(struct inode *inode, struct file *file)
> +{
> +	int ret;
> +	struct seq_file *m;
> +
> +	ret = seq_open(file, &proc_seq_ops);
> +	m = file->private_data;
> +	m->private = file->f_path.dentry->d_iname;
> +
> +	return ret;
> +}
> +
> +static int wdt_proc_read(struct seq_file *m, void *p)
> +{
> +	unsigned char *chip_name, *is_enable;
> +	unsigned long current_timeout = 0;
> +
> +	chip_name = wdt_data.chip_name;
> +	current_timeout = wdt_data.current_timeout;
> +	is_enable = wdt_data.is_enable;
> +
> +	seq_printf(m, "name       : %s\n", chip_name);
> +	seq_printf(m, "timeout    : %ld\n", current_timeout);
> +	seq_printf(m, "is_enable  : %s\n", is_enable);
> +
> +	return 0;
> +}
> +
> +static const struct proc_ops fops = {
> +	.proc_open  = wdt_proc_open,
> +	.proc_read  = seq_read,
> +};
> +
> +static int wdt_create_proc(char *name)
> +{
> +	struct proc_dir_entry *wdt_proc_entries;
> +	unsigned char proc_name[64] = {0};
> +
> +	sprintf(proc_name, "%s", name);
> +
> +	wdt_proc_entries = proc_create(proc_name, 0644, NULL, &fops);
> +	if (wdt_proc_entries == NULL) {
> +		remove_proc_entry(proc_name, NULL);
> +		pr_err("Error: Could not initialize /proc/%s", proc_name);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +

I don't see the point of adding proc file system nodes for a watchdog driver.

> +static void wdt_remove_proc(char *name)
> +{
> +	unsigned char proc_name[64] = {0};
> +
> +	sprintf(proc_name, "%s", name);
> +	remove_proc_entry(proc_name, NULL);
> +}
> +
> +static int set_delay(unsigned short delay_timeout)
> +{
> +	if (write_hw_ram(EC_RESET_DELAY_TIME_L, delay_timeout & 0x00FF)) {
> +		pr_err("Failed to set Watchdog Retset Time Low byte.");
> +		return -EINVAL;
> +	}
> +
> +	if (write_hw_ram(EC_RESET_DELAY_TIME_H, (delay_timeout & 0xFF00) >> 8)) {
> +		pr_err("Failed to set Watchdog Retset Time Hight byte.");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int advwdt_set_heartbeat(unsigned long t)
> +{
> +	if (t < 1 || t > 6553)
> +		return -EINVAL;
> +
> +	timeout = (t * 10);
> +
> +	return 0;
> +}
> +
> +static long advwdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> +{
> +	unsigned long new_timeout;
> +	void __user *argp = (void __user *)arg;
> +	int __user *p = argp;
> +	int options;
> +	static struct watchdog_info ident = {
> +		.options = WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE,
> +		.firmware_version = 0,
> +		.identity = "Advantech WDT"
> +	};
> +
> +	mutex_lock(&lock_ioctl);
> +	if (advwdt_is_open < 1) {
> +		pr_err("watchdog does not open.");
> +		mutex_unlock(&lock_ioctl);
> +		return -1;
> +	}
> +
> +	switch (cmd) {
> +	case WDIOC_GETSUPPORT:
> +		if (copy_to_user(argp, &ident, sizeof(ident))) {
> +			mutex_unlock(&lock_ioctl);
> +			return -EFAULT;
> +		}
> +		break;
> +
> +	case WDIOC_GETSTATUS:
> +	case WDIOC_GETBOOTSTATUS:
> +		mutex_unlock(&lock_ioctl);
> +		return put_user(0, p);
> +
> +	case WDIOC_KEEPALIVE:
> +		if (write_hwram_command(EC_WDT_RESET)) {
> +			pr_err("Failed to set Watchdog reset.");
> +			return -EINVAL;
> +		}
> +		break;
> +
> +	case WDIOC_SETTIMEOUT:
> +		if (get_user(new_timeout, (unsigned long *)arg)) {
> +			mutex_unlock(&lock_ioctl);
> +			return -EFAULT;
> +		}
> +
> +		if (advwdt_set_heartbeat(new_timeout)) {
> +			pr_err("Advantch WDT: the input timeout is out of range.");
> +			pr_err("Please choose valid data between 1 ~ 6553.");
> +			mutex_unlock(&lock_ioctl);
> +			return -EINVAL;
> +		}
> +
> +		if (set_delay((unsigned short)(timeout - 1))) {
> +			pr_err("Failed to set Watchdog delay.");
> +			return -EINVAL;
> +		}
> +
> +		if (write_hwram_command(EC_WDT_START)) {
> +			pr_err("Failed to set Watchdog start.");
> +			return -EINVAL;
> +		}
> +
> +		wdt_data.is_enable[0] = 'Y';
> +		wdt_data.is_enable[1] = 'e';
> +		wdt_data.is_enable[2] = 's';
> +		wdt_data.current_timeout = timeout / 10;
> +		break;
> +
> +	case WDIOC_GETTIMEOUT:
> +		if (timeout == 0) {
> +			mutex_unlock(&lock_ioctl);
> +			return -EFAULT;
> +		}
> +		mutex_unlock(&lock_ioctl);
> +
> +		return put_user(timeout / 10, (unsigned long *)arg);
> +
> +	case WDIOC_SETOPTIONS:
> +		if (get_user(options, p)) {
> +			mutex_unlock(&lock_ioctl);
> +			return -EFAULT;
> +		}
> +
> +		if (options & WDIOS_DISABLECARD) {
> +			if (write_hwram_command(EC_WDT_STOP)) {
> +				pr_err("Failed to set Watchdog stop.");
> +				return -EINVAL;
> +			}
> +
> +			wdt_data.is_enable[0] = 'N';
> +			wdt_data.is_enable[1] = 'o';
> +			wdt_data.is_enable[2] = '\0';
> +		}
> +
> +		if (options & WDIOS_ENABLECARD) {
> +			if (write_hwram_command(EC_WDT_STOP)) {
> +				pr_err("Failed to set Watchdog stop");
> +				return -EINVAL;
> +			}
> +
> +			if (set_delay((unsigned short)(timeout-1))) {
> +				pr_err("Failed to set Watchdog delay.");
> +				return -EINVAL;
> +			}
> +
> +			if (write_hwram_command(EC_WDT_START)) {
> +				pr_err("Failed to set Watchdog start.");
> +				return -EINVAL;
> +			}
> +
> +			wdt_data.is_enable[0] = 'Y';
> +			wdt_data.is_enable[1] = 'e';
> +			wdt_data.is_enable[2] = 's';
> +		}
> +		mutex_unlock(&lock_ioctl);
> +
> +		return 0;
> +
> +	default:
> +		mutex_unlock(&lock_ioctl);
> +		return -ENOTTY;
> +	}
> +
> +	mutex_unlock(&lock_ioctl);
> +	return 0;
> +}
> +
> +static int advwdt_open(struct inode *inode, struct file *file)
> +{
> +	if (test_and_set_bit(0, &advwdt_is_open))
> +		return -EBUSY;
> +
> +	if (write_hwram_command(EC_WDT_STOP)) {
> +		pr_err("Failed to set Watchdog stop.");
> +		return -EINVAL;
> +	}
> +	wdt_data.is_enable[0] = 'N';
> +	wdt_data.is_enable[1] = 'o';
> +	wdt_data.is_enable[2] = '\0';
> +	return 0;
> +}
> +
> +static int advwdt_close(struct inode *inode, struct file *file)
> +{
> +	clear_bit(0, &advwdt_is_open);
> +	adv_expect_close = 0;
> +
> +	return 0;
> +}
> +
> +/* Notifier for system down */
> +static int advwdt_notify_sys(struct notifier_block *this, unsigned long code, void *unused)
> +{
> +	if (code == SYS_DOWN || code == SYS_HALT) {
> +		/* Turn the WDT off */
> +		if (write_hwram_command(EC_WDT_STOP)) {
> +			pr_err("Failed to set Watchdog stop.");
> +			return -EINVAL;
> +		}
> +		wdt_data.is_enable[0] = 'N';
> +		wdt_data.is_enable[1] = 'o';
> +		wdt_data.is_enable[2] = '\0';
> +		pr_info("%s: notify sys shutdown", __func__);
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +/* Kernel Interfaces */
> +static const struct file_operations advwdt_fops = {
> +	.owner = THIS_MODULE,
> +	.unlocked_ioctl = advwdt_ioctl,
> +	.compat_ioctl = advwdt_ioctl,
> +	.open = advwdt_open,
> +	.release = advwdt_close,
> +};
> +
> +/*
> + *	The WDT needs to learn about soft shutdowns in order to
> + *	turn the timebomb registers off.
> + */
> +static struct notifier_block advwdt_notifier = {
> +	advwdt_notify_sys,
> +	NULL,
> +	0
> +};
> +
> +static struct class *adv_ec_class;
> +static dev_t devno;
> +
> +static int adv_ec_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev;
> +
> +	mutex_init(&lock_ioctl);
> +
> +	major = register_chrdev(0, "adv_watchdog", &advwdt_fops);
> +	if (major < 0) {
> +		pr_err("Advwdt register chrdev failed!");
> +		return major;
> +	}
> +	devno = MKDEV(major, 0);
> +	register_reboot_notifier(&advwdt_notifier);
> +
> +	/* Create /dev/watchdog for userspace access */
> +	adv_ec_class = class_create(THIS_MODULE, "adv_watchdog");
> +	if (IS_ERR(adv_ec_class)) {
> +		pr_err("%s: can't create class", __func__);
> +		unregister_chrdev_region(devno, 1);
> +		return -1;
> +	}
> +
> +	dev = device_create(adv_ec_class, NULL, devno, NULL, "watchdog");
> +	if (IS_ERR(dev)) {
> +		pr_err("%s: can't create device watchdog", __func__);
> +		unregister_chrdev_region(devno, 1);
> +		class_destroy(adv_ec_class);
> +		return -1;
> +	}
> +
> +	wdt_create_proc("advwdtinfo");
> +	wdt_data.current_timeout = timeout / 10;
> +	wdt_data.is_enable[0] = 'N';
> +	wdt_data.is_enable[1] = 'o';
> +	wdt_data.is_enable[2] = '\0';
> +
> +	dev_info(&pdev->dev, "Ver:%s, Data:%s, probe done",
> +			ADVANTECH_EC_WDT_VER, ADVANTECH_EC_WDT_DATE);
> +
> +	return 0;
> +}
> +
> +static int adv_ec_wdt_remove(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = write_hwram_command(EC_WDT_STOP);
> +	if (ret) {
> +		pr_err("Failed to set Watchdog stop.");
> +		return ret;
> +	}
> +
> +	wdt_data.is_enable[0] = 'N';
> +	wdt_data.is_enable[1] = 'o';
> +	wdt_data.is_enable[2] = '\0';
> +	clear_bit(0, &advwdt_is_open);
> +	adv_expect_close = 0;
> +	pr_info("Driver uninstall, set Watchdog stop.");
> +
> +	device_destroy(adv_ec_class, devno);
> +	unregister_chrdev_region(devno, 1);
> +	class_destroy(adv_ec_class);
> +
> +	unregister_reboot_notifier(&advwdt_notifier);
> +	unregister_chrdev(major, "adv_watchdog");
> +
> +	wdt_remove_proc("advwdtinfo");
> +
> +	return 0;
> +}
> +
> +static struct platform_driver adv_wdt_drv = {
> +	.driver = {
> +		.name = "adv-ec-wdt",
> +	},
> +	.probe = adv_ec_wdt_probe,
> +	.remove = adv_ec_wdt_remove,
> +};
> +module_platform_driver(adv_wdt_drv);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Advantech EC Watchdog Driver.");
> -- 
> 2.17.1
> 
