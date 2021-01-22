Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF073006F5
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 16:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbhAVPSG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 10:18:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58445 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729073AbhAVPBL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 10:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611327579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WZUE4zje+gDLlSA7017chGJFgNQlFOEUFnU6nqZIJgA=;
        b=gz20tEza4RD+b21VhWJuPE8Ns3Z7SSm5/jK5Z60+XlQqQ0F6vyCtjSjp0VObCJCDYrhyPn
        NmWlHFT8p5XcE+6hYUe3/6jgq2UEkjJz4E29I4S8wZGN/USnuq/n8wpASCiOBinzVYw2R3
        aq/k10clc2aRl+9IE43hNQxVEMjd+jM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-mELFkd0mMO2YKnr6LqZ5Cw-1; Fri, 22 Jan 2021 09:59:37 -0500
X-MC-Unique: mELFkd0mMO2YKnr6LqZ5Cw-1
Received: by mail-ej1-f70.google.com with SMTP id hd8so759719ejc.22
        for <linux-watchdog@vger.kernel.org>; Fri, 22 Jan 2021 06:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WZUE4zje+gDLlSA7017chGJFgNQlFOEUFnU6nqZIJgA=;
        b=k4q1Qhd4kgMgvtvXAfImyS76Vn7t+vJGq7lhJYrnwbYylstVreOJ2sK3JaUjaUM9VI
         jVzXzlg6lT6mQgl5Wr9CeiYzWBU8oD4ZQWNZGwzh8wOczIG5e+evRBq1NpHIhpIND/+R
         aNvUk6re97VQsfPSEKv7gSKg71cEjzm+9WneGWmXG0eSIPNtQoClINHveb8bA7kTr6h7
         hosOjIgtxed9dQUs0VAnzU594JfCb7lbWf3mrHKNGHSQfy50qQFvVqol+Rw7dY2BSx+4
         /9+6tOpEJkilFa7oqYufoD8q3Ytl813Z10yphANv4b9XXOy/hrokxR5Qagd8fgHo8GCL
         pe3Q==
X-Gm-Message-State: AOAM531Vg2gEWnx+U2mLtBOJozNfkxCsFqenjH5r7lGt5l27SnsrW85g
        hayMyMQrSZFPYvpdXoRFtIUnpeZEs6I06kcQkpXOVdqfn6LgLSnn3EZoy9P7TukHNJfXG5qF3VL
        l2Okw9420ka1xIfjzwNEogCcHfHc=
X-Received: by 2002:a17:906:1c42:: with SMTP id l2mr3284191ejg.390.1611327576114;
        Fri, 22 Jan 2021 06:59:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCvGH0I9fHpEobJLr+qBnuh5oOPfrFvhqzzjqmmDoG3U/N/8F0uTGmGWXF2WQF898l5rYlZw==
X-Received: by 2002:a17:906:1c42:: with SMTP id l2mr3284179ejg.390.1611327575850;
        Fri, 22 Jan 2021 06:59:35 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id f5sm4623411ejz.70.2021.01.22.06.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 06:59:35 -0800 (PST)
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
Date:   Fri, 22 Jan 2021 15:59:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

What is the plan for merging this series ?

It touches files under:
arch/x86
drivers/watchdog
drivers/platform/x86

It is probably best if the entire series is merged through a single
tree. I don't expect this to cause any conflicts with current / upcoming
changes under drivers/platform/x86, so I'm fine with this being merged
through another tree.

Or if I can get an ack for that from the x86 and watchdog maintainers
I can merge the entire series through the pdx86 tree.

Regards,

Hans



On 1/22/21 1:31 PM, Andy Shevchenko wrote:
> Intel Moorestown and Medfield are quite old Intel Atom based
> 32-bit platforms, which were in limited use in some Android phones,
> tablets and consumer electronics more than eight years ago.
> 
> There are no bugs or problems ever reported outside from Intel
> for breaking any of that platforms for years. It seems no real
> users exists who run more or less fresh kernel on it. The commit
> 05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
> with this theory.
> 
> Due to above and to reduce a burden of supporting outdated drivers
> we remove the support of outdated platforms completely.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/watchdog/Kconfig              |   9 -
>  drivers/watchdog/Makefile             |   1 -
>  drivers/watchdog/intel_scu_watchdog.c | 533 --------------------------
>  drivers/watchdog/intel_scu_watchdog.h |  50 ---
>  4 files changed, 593 deletions(-)
>  delete mode 100644 drivers/watchdog/intel_scu_watchdog.c
>  delete mode 100644 drivers/watchdog/intel_scu_watchdog.h
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7ff941e71b79..6b9e93d8532b 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1219,15 +1219,6 @@ config IE6XX_WDT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ie6xx_wdt.
>  
> -config INTEL_SCU_WATCHDOG
> -	bool "Intel SCU Watchdog for Mobile Platforms"
> -	depends on X86_INTEL_MID
> -	help
> -	  Hardware driver for the watchdog time built into the Intel SCU
> -	  for Intel Mobile Platforms.
> -
> -	  To compile this driver as a module, choose M here.
> -
>  config INTEL_MID_WATCHDOG
>  	tristate "Intel MID Watchdog Timer"
>  	depends on X86_INTEL_MID
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 5c74ee19d441..74f61e4105d8 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -140,7 +140,6 @@ obj-$(CONFIG_W83877F_WDT) += w83877f_wdt.o
>  obj-$(CONFIG_W83977F_WDT) += w83977f_wdt.o
>  obj-$(CONFIG_MACHZ_WDT) += machzwd.o
>  obj-$(CONFIG_SBC_EPX_C3_WATCHDOG) += sbc_epx_c3.o
> -obj-$(CONFIG_INTEL_SCU_WATCHDOG) += intel_scu_watchdog.o
>  obj-$(CONFIG_INTEL_MID_WATCHDOG) += intel-mid_wdt.o
>  obj-$(CONFIG_INTEL_MEI_WDT) += mei_wdt.o
>  obj-$(CONFIG_NI903X_WDT) += ni903x_wdt.o
> diff --git a/drivers/watchdog/intel_scu_watchdog.c b/drivers/watchdog/intel_scu_watchdog.c
> deleted file mode 100644
> index 804e35940983..000000000000
> --- a/drivers/watchdog/intel_scu_watchdog.c
> +++ /dev/null
> @@ -1,533 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - *      Intel_SCU 0.2:  An Intel SCU IOH Based Watchdog Device
> - *			for Intel part #(s):
> - *				- AF82MP20 PCH
> - *
> - *      Copyright (C) 2009-2010 Intel Corporation. All rights reserved.
> - */
> -
> -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> -
> -#include <linux/compiler.h>
> -#include <linux/kernel.h>
> -#include <linux/moduleparam.h>
> -#include <linux/types.h>
> -#include <linux/miscdevice.h>
> -#include <linux/watchdog.h>
> -#include <linux/fs.h>
> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/init.h>
> -#include <linux/jiffies.h>
> -#include <linux/uaccess.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -#include <linux/interrupt.h>
> -#include <linux/delay.h>
> -#include <linux/sched.h>
> -#include <linux/signal.h>
> -#include <linux/sfi.h>
> -#include <asm/irq.h>
> -#include <linux/atomic.h>
> -#include <asm/intel_scu_ipc.h>
> -#include <asm/apb_timer.h>
> -#include <asm/intel-mid.h>
> -
> -#include "intel_scu_watchdog.h"
> -
> -/* Bounds number of times we will retry loading time count */
> -/* This retry is a work around for a silicon bug.	   */
> -#define MAX_RETRY 16
> -
> -#define IPC_SET_WATCHDOG_TIMER	0xF8
> -
> -static int timer_margin = DEFAULT_SOFT_TO_HARD_MARGIN;
> -module_param(timer_margin, int, 0);
> -MODULE_PARM_DESC(timer_margin,
> -		"Watchdog timer margin"
> -		"Time between interrupt and resetting the system"
> -		"The range is from 1 to 160"
> -		"This is the time for all keep alives to arrive");
> -
> -static int timer_set = DEFAULT_TIME;
> -module_param(timer_set, int, 0);
> -MODULE_PARM_DESC(timer_set,
> -		"Default Watchdog timer setting"
> -		"Complete cycle time"
> -		"The range is from 1 to 170"
> -		"This is the time for all keep alives to arrive");
> -
> -/* After watchdog device is closed, check force_boot. If:
> - * force_boot == 0, then force boot on next watchdog interrupt after close,
> - * force_boot == 1, then force boot immediately when device is closed.
> - */
> -static int force_boot;
> -module_param(force_boot, int, 0);
> -MODULE_PARM_DESC(force_boot,
> -		"A value of 1 means that the driver will reboot"
> -		"the system immediately if the /dev/watchdog device is closed"
> -		"A value of 0 means that when /dev/watchdog device is closed"
> -		"the watchdog timer will be refreshed for one more interval"
> -		"of length: timer_set. At the end of this interval, the"
> -		"watchdog timer will reset the system."
> -		);
> -
> -/* there is only one device in the system now; this can be made into
> - * an array in the future if we have more than one device */
> -
> -static struct intel_scu_watchdog_dev watchdog_device;
> -
> -/* Forces restart, if force_reboot is set */
> -static void watchdog_fire(void)
> -{
> -	if (force_boot) {
> -		pr_crit("Initiating system reboot\n");
> -		emergency_restart();
> -		pr_crit("Reboot didn't ?????\n");
> -	}
> -
> -	else {
> -		pr_crit("Immediate Reboot Disabled\n");
> -		pr_crit("System will reset when watchdog timer times out!\n");
> -	}
> -}
> -
> -static int check_timer_margin(int new_margin)
> -{
> -	if ((new_margin < MIN_TIME_CYCLE) ||
> -	    (new_margin > MAX_TIME - timer_set)) {
> -		pr_debug("value of new_margin %d is out of the range %d to %d\n",
> -			 new_margin, MIN_TIME_CYCLE, MAX_TIME - timer_set);
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -/*
> - * IPC operations
> - */
> -static int watchdog_set_ipc(int soft_threshold, int threshold)
> -{
> -	u32	*ipc_wbuf;
> -	u8	 cbuf[16] = { '\0' };
> -	int	 ipc_ret = 0;
> -
> -	ipc_wbuf = (u32 *)&cbuf;
> -	ipc_wbuf[0] = soft_threshold;
> -	ipc_wbuf[1] = threshold;
> -
> -	ipc_ret = intel_scu_ipc_command(
> -			IPC_SET_WATCHDOG_TIMER,
> -			0,
> -			ipc_wbuf,
> -			2,
> -			NULL,
> -			0);
> -
> -	if (ipc_ret != 0)
> -		pr_err("Error setting SCU watchdog timer: %x\n", ipc_ret);
> -
> -	return ipc_ret;
> -};
> -
> -/*
> - *      Intel_SCU operations
> - */
> -
> -/* timer interrupt handler */
> -static irqreturn_t watchdog_timer_interrupt(int irq, void *dev_id)
> -{
> -	int int_status;
> -	int_status = ioread32(watchdog_device.timer_interrupt_status_addr);
> -
> -	pr_debug("irq, int_status: %x\n", int_status);
> -
> -	if (int_status != 0)
> -		return IRQ_NONE;
> -
> -	/* has the timer been started? If not, then this is spurious */
> -	if (watchdog_device.timer_started == 0) {
> -		pr_debug("spurious interrupt received\n");
> -		return IRQ_HANDLED;
> -	}
> -
> -	/* temporarily disable the timer */
> -	iowrite32(0x00000002, watchdog_device.timer_control_addr);
> -
> -	/* set the timer to the threshold */
> -	iowrite32(watchdog_device.threshold,
> -		  watchdog_device.timer_load_count_addr);
> -
> -	/* allow the timer to run */
> -	iowrite32(0x00000003, watchdog_device.timer_control_addr);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static int intel_scu_keepalive(void)
> -{
> -
> -	/* read eoi register - clears interrupt */
> -	ioread32(watchdog_device.timer_clear_interrupt_addr);
> -
> -	/* temporarily disable the timer */
> -	iowrite32(0x00000002, watchdog_device.timer_control_addr);
> -
> -	/* set the timer to the soft_threshold */
> -	iowrite32(watchdog_device.soft_threshold,
> -		  watchdog_device.timer_load_count_addr);
> -
> -	/* allow the timer to run */
> -	iowrite32(0x00000003, watchdog_device.timer_control_addr);
> -
> -	return 0;
> -}
> -
> -static int intel_scu_stop(void)
> -{
> -	iowrite32(0, watchdog_device.timer_control_addr);
> -	return 0;
> -}
> -
> -static int intel_scu_set_heartbeat(u32 t)
> -{
> -	int			 ipc_ret;
> -	int			 retry_count;
> -	u32			 soft_value;
> -	u32			 hw_value;
> -
> -	watchdog_device.timer_set = t;
> -	watchdog_device.threshold =
> -		timer_margin * watchdog_device.timer_tbl_ptr->freq_hz;
> -	watchdog_device.soft_threshold =
> -		(watchdog_device.timer_set - timer_margin)
> -		* watchdog_device.timer_tbl_ptr->freq_hz;
> -
> -	pr_debug("set_heartbeat: timer freq is %d\n",
> -		 watchdog_device.timer_tbl_ptr->freq_hz);
> -	pr_debug("set_heartbeat: timer_set is %x (hex)\n",
> -		 watchdog_device.timer_set);
> -	pr_debug("set_heartbeat: timer_margin is %x (hex)\n", timer_margin);
> -	pr_debug("set_heartbeat: threshold is %x (hex)\n",
> -		 watchdog_device.threshold);
> -	pr_debug("set_heartbeat: soft_threshold is %x (hex)\n",
> -		 watchdog_device.soft_threshold);
> -
> -	/* Adjust thresholds by FREQ_ADJUSTMENT factor, to make the */
> -	/* watchdog timing come out right. */
> -	watchdog_device.threshold =
> -		watchdog_device.threshold / FREQ_ADJUSTMENT;
> -	watchdog_device.soft_threshold =
> -		watchdog_device.soft_threshold / FREQ_ADJUSTMENT;
> -
> -	/* temporarily disable the timer */
> -	iowrite32(0x00000002, watchdog_device.timer_control_addr);
> -
> -	/* send the threshold and soft_threshold via IPC to the processor */
> -	ipc_ret = watchdog_set_ipc(watchdog_device.soft_threshold,
> -				   watchdog_device.threshold);
> -
> -	if (ipc_ret != 0) {
> -		/* Make sure the watchdog timer is stopped */
> -		intel_scu_stop();
> -		return ipc_ret;
> -	}
> -
> -	/* Soft Threshold set loop. Early versions of silicon did */
> -	/* not always set this count correctly.  This loop checks */
> -	/* the value and retries if it was not set correctly.     */
> -
> -	retry_count = 0;
> -	soft_value = watchdog_device.soft_threshold & 0xFFFF0000;
> -	do {
> -
> -		/* Make sure timer is stopped */
> -		intel_scu_stop();
> -
> -		if (MAX_RETRY < retry_count++) {
> -			/* Unable to set timer value */
> -			pr_err("Unable to set timer\n");
> -			return -ENODEV;
> -		}
> -
> -		/* set the timer to the soft threshold */
> -		iowrite32(watchdog_device.soft_threshold,
> -			watchdog_device.timer_load_count_addr);
> -
> -		/* read count value before starting timer */
> -		ioread32(watchdog_device.timer_load_count_addr);
> -
> -		/* Start the timer */
> -		iowrite32(0x00000003, watchdog_device.timer_control_addr);
> -
> -		/* read the value the time loaded into its count reg */
> -		hw_value = ioread32(watchdog_device.timer_load_count_addr);
> -		hw_value = hw_value & 0xFFFF0000;
> -
> -
> -	} while (soft_value != hw_value);
> -
> -	watchdog_device.timer_started = 1;
> -
> -	return 0;
> -}
> -
> -/*
> - * /dev/watchdog handling
> - */
> -
> -static int intel_scu_open(struct inode *inode, struct file *file)
> -{
> -
> -	/* Set flag to indicate that watchdog device is open */
> -	if (test_and_set_bit(0, &watchdog_device.driver_open))
> -		return -EBUSY;
> -
> -	/* Check for reopen of driver. Reopens are not allowed */
> -	if (watchdog_device.driver_closed)
> -		return -EPERM;
> -
> -	return stream_open(inode, file);
> -}
> -
> -static int intel_scu_release(struct inode *inode, struct file *file)
> -{
> -	/*
> -	 * This watchdog should not be closed, after the timer
> -	 * is started with the WDIPC_SETTIMEOUT ioctl
> -	 * If force_boot is set watchdog_fire() will cause an
> -	 * immediate reset. If force_boot is not set, the watchdog
> -	 * timer is refreshed for one more interval. At the end
> -	 * of that interval, the watchdog timer will reset the system.
> -	 */
> -
> -	if (!test_and_clear_bit(0, &watchdog_device.driver_open)) {
> -		pr_debug("intel_scu_release, without open\n");
> -		return -ENOTTY;
> -	}
> -
> -	if (!watchdog_device.timer_started) {
> -		/* Just close, since timer has not been started */
> -		pr_debug("closed, without starting timer\n");
> -		return 0;
> -	}
> -
> -	pr_crit("Unexpected close of /dev/watchdog!\n");
> -
> -	/* Since the timer was started, prevent future reopens */
> -	watchdog_device.driver_closed = 1;
> -
> -	/* Refresh the timer for one more interval */
> -	intel_scu_keepalive();
> -
> -	/* Reboot system (if force_boot is set) */
> -	watchdog_fire();
> -
> -	/* We should only reach this point if force_boot is not set */
> -	return 0;
> -}
> -
> -static ssize_t intel_scu_write(struct file *file,
> -			      char const *data,
> -			      size_t len,
> -			      loff_t *ppos)
> -{
> -
> -	if (watchdog_device.timer_started)
> -		/* Watchdog already started, keep it alive */
> -		intel_scu_keepalive();
> -	else
> -		/* Start watchdog with timer value set by init */
> -		intel_scu_set_heartbeat(watchdog_device.timer_set);
> -
> -	return len;
> -}
> -
> -static long intel_scu_ioctl(struct file *file,
> -			   unsigned int cmd,
> -			   unsigned long arg)
> -{
> -	void __user *argp = (void __user *)arg;
> -	u32 __user *p = argp;
> -	u32 new_margin;
> -
> -
> -	static const struct watchdog_info ident = {
> -		.options =          WDIOF_SETTIMEOUT
> -				    | WDIOF_KEEPALIVEPING,
> -		.firmware_version = 0,  /* @todo Get from SCU via
> -						 ipc_get_scu_fw_version()? */
> -		.identity =         "Intel_SCU IOH Watchdog"  /* len < 32 */
> -	};
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(argp,
> -				    &ident,
> -				    sizeof(ident)) ? -EFAULT : 0;
> -	case WDIOC_GETSTATUS:
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, p);
> -	case WDIOC_KEEPALIVE:
> -		intel_scu_keepalive();
> -
> -		return 0;
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_margin, p))
> -			return -EFAULT;
> -
> -		if (check_timer_margin(new_margin))
> -			return -EINVAL;
> -
> -		if (intel_scu_set_heartbeat(new_margin))
> -			return -EINVAL;
> -		return 0;
> -	case WDIOC_GETTIMEOUT:
> -		return put_user(watchdog_device.soft_threshold, p);
> -
> -	default:
> -		return -ENOTTY;
> -	}
> -}
> -
> -/*
> - *      Notifier for system down
> - */
> -static int intel_scu_notify_sys(struct notifier_block *this,
> -			       unsigned long code,
> -			       void *another_unused)
> -{
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		/* Turn off the watchdog timer. */
> -		intel_scu_stop();
> -	return NOTIFY_DONE;
> -}
> -
> -/*
> - *      Kernel Interfaces
> - */
> -static const struct file_operations intel_scu_fops = {
> -	.owner          = THIS_MODULE,
> -	.llseek         = no_llseek,
> -	.write          = intel_scu_write,
> -	.unlocked_ioctl = intel_scu_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> -	.open           = intel_scu_open,
> -	.release        = intel_scu_release,
> -};
> -
> -static int __init intel_scu_watchdog_init(void)
> -{
> -	int ret;
> -	u32 __iomem *tmp_addr;
> -
> -	/*
> -	 * We don't really need to check this as the SFI timer get will fail
> -	 * but if we do so we can exit with a clearer reason and no noise.
> -	 *
> -	 * If it isn't an intel MID device then it doesn't have this watchdog
> -	 */
> -	if (!intel_mid_identify_cpu())
> -		return -ENODEV;
> -
> -	/* Check boot parameters to verify that their initial values */
> -	/* are in range. */
> -	/* Check value of timer_set boot parameter */
> -	if ((timer_set < MIN_TIME_CYCLE) ||
> -	    (timer_set > MAX_TIME - MIN_TIME_CYCLE)) {
> -		pr_err("value of timer_set %x (hex) is out of range from %x to %x (hex)\n",
> -		       timer_set, MIN_TIME_CYCLE, MAX_TIME - MIN_TIME_CYCLE);
> -		return -EINVAL;
> -	}
> -
> -	/* Check value of timer_margin boot parameter */
> -	if (check_timer_margin(timer_margin))
> -		return -EINVAL;
> -
> -	watchdog_device.timer_tbl_ptr = sfi_get_mtmr(sfi_mtimer_num-1);
> -
> -	if (watchdog_device.timer_tbl_ptr == NULL) {
> -		pr_debug("timer is not available\n");
> -		return -ENODEV;
> -	}
> -	/* make sure the timer exists */
> -	if (watchdog_device.timer_tbl_ptr->phys_addr == 0) {
> -		pr_debug("timer %d does not have valid physical memory\n",
> -			 sfi_mtimer_num);
> -		return -ENODEV;
> -	}
> -
> -	if (watchdog_device.timer_tbl_ptr->irq == 0) {
> -		pr_debug("timer %d invalid irq\n", sfi_mtimer_num);
> -		return -ENODEV;
> -	}
> -
> -	tmp_addr = ioremap(watchdog_device.timer_tbl_ptr->phys_addr,
> -			20);
> -
> -	if (tmp_addr == NULL) {
> -		pr_debug("timer unable to ioremap\n");
> -		return -ENOMEM;
> -	}
> -
> -	watchdog_device.timer_load_count_addr = tmp_addr++;
> -	watchdog_device.timer_current_value_addr = tmp_addr++;
> -	watchdog_device.timer_control_addr = tmp_addr++;
> -	watchdog_device.timer_clear_interrupt_addr = tmp_addr++;
> -	watchdog_device.timer_interrupt_status_addr = tmp_addr++;
> -
> -	/* Set the default time values in device structure */
> -
> -	watchdog_device.timer_set = timer_set;
> -	watchdog_device.threshold =
> -		timer_margin * watchdog_device.timer_tbl_ptr->freq_hz;
> -	watchdog_device.soft_threshold =
> -		(watchdog_device.timer_set - timer_margin)
> -		* watchdog_device.timer_tbl_ptr->freq_hz;
> -
> -
> -	watchdog_device.intel_scu_notifier.notifier_call =
> -		intel_scu_notify_sys;
> -
> -	ret = register_reboot_notifier(&watchdog_device.intel_scu_notifier);
> -	if (ret) {
> -		pr_err("cannot register notifier %d)\n", ret);
> -		goto register_reboot_error;
> -	}
> -
> -	watchdog_device.miscdev.minor = WATCHDOG_MINOR;
> -	watchdog_device.miscdev.name = "watchdog";
> -	watchdog_device.miscdev.fops = &intel_scu_fops;
> -
> -	ret = misc_register(&watchdog_device.miscdev);
> -	if (ret) {
> -		pr_err("cannot register miscdev %d err =%d\n",
> -		       WATCHDOG_MINOR, ret);
> -		goto misc_register_error;
> -	}
> -
> -	ret = request_irq((unsigned int)watchdog_device.timer_tbl_ptr->irq,
> -		watchdog_timer_interrupt,
> -		IRQF_SHARED, "watchdog",
> -		&watchdog_device.timer_load_count_addr);
> -	if (ret) {
> -		pr_err("error requesting irq %d\n", ret);
> -		goto request_irq_error;
> -	}
> -	/* Make sure timer is disabled before returning */
> -	intel_scu_stop();
> -	return 0;
> -
> -/* error cleanup */
> -
> -request_irq_error:
> -	misc_deregister(&watchdog_device.miscdev);
> -misc_register_error:
> -	unregister_reboot_notifier(&watchdog_device.intel_scu_notifier);
> -register_reboot_error:
> -	intel_scu_stop();
> -	iounmap(watchdog_device.timer_load_count_addr);
> -	return ret;
> -}
> -late_initcall(intel_scu_watchdog_init);
> diff --git a/drivers/watchdog/intel_scu_watchdog.h b/drivers/watchdog/intel_scu_watchdog.h
> deleted file mode 100644
> index fb12a25ee417..000000000000
> --- a/drivers/watchdog/intel_scu_watchdog.h
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - *      Intel_SCU 0.2:  An Intel SCU IOH Based Watchdog Device
> - *			for Intel part #(s):
> - *				- AF82MP20 PCH
> - *
> - *      Copyright (C) 2009-2010 Intel Corporation. All rights reserved.
> - */
> -
> -#ifndef __INTEL_SCU_WATCHDOG_H
> -#define __INTEL_SCU_WATCHDOG_H
> -
> -#define WDT_VER "0.3"
> -
> -/* minimum time between interrupts */
> -#define MIN_TIME_CYCLE 1
> -
> -/* Time from warning to reboot is 2 seconds */
> -#define DEFAULT_SOFT_TO_HARD_MARGIN 2
> -
> -#define MAX_TIME 170
> -
> -#define DEFAULT_TIME 5
> -
> -#define MAX_SOFT_TO_HARD_MARGIN (MAX_TIME-MIN_TIME_CYCLE)
> -
> -/* Ajustment to clock tick frequency to make timing come out right */
> -#define FREQ_ADJUSTMENT 8
> -
> -struct intel_scu_watchdog_dev {
> -	ulong driver_open;
> -	ulong driver_closed;
> -	u32 timer_started;
> -	u32 timer_set;
> -	u32 threshold;
> -	u32 soft_threshold;
> -	u32 __iomem *timer_load_count_addr;
> -	u32 __iomem *timer_current_value_addr;
> -	u32 __iomem *timer_control_addr;
> -	u32 __iomem *timer_clear_interrupt_addr;
> -	u32 __iomem *timer_interrupt_status_addr;
> -	struct sfi_timer_table_entry *timer_tbl_ptr;
> -	struct notifier_block intel_scu_notifier;
> -	struct miscdevice miscdev;
> -};
> -
> -extern int sfi_mtimer_num;
> -
> -/* extern struct sfi_timer_table_entry *sfi_get_mtmr(int hint); */
> -#endif /* __INTEL_SCU_WATCHDOG_H */
> 

