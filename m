Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E672300CFC
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 20:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbhAVTzh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 14:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbhAVORX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 09:17:23 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1249C0613D6;
        Fri, 22 Jan 2021 06:16:42 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id d1so5143515otl.13;
        Fri, 22 Jan 2021 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v9j+SJxlcl35ZD9ELLvO0zMDFzGd9f08OD0EKjHUDOs=;
        b=CsnCAZ+u7HYQjVC//ies+ZV/2r5AyOdpH8/gJylmdUBgidX38Rnm56Wz92m69bqDNO
         4Klj5PBuX8IurU68PYv9pbxN09Pzb4NX8KisNbnixeBConXMdJ2RDZ0EldJM7LyarDcl
         cUW49LuldrRq54S7id4fIdE1tncChNETtrK/tlJ9F/ePDHm3eE5YctawaTCuY3fsUNw9
         AEUkTLELlpBOB6peMMaHbWMHEQ3zVn6BlwkWoOC79HPDd+ACEE4vzNysUh/loHluJpER
         LdU451fDpyP02iJd4SD1DwfmeT0110Gplw1nQSpTb3RAS6OUZv+Efs15XD/VCx6HM4od
         V76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v9j+SJxlcl35ZD9ELLvO0zMDFzGd9f08OD0EKjHUDOs=;
        b=EQqOKtwT/uUa2FeDNlcBeJk7kN6sjQz0AIyz+1oJMp4jLCK3FNTliUwwlkFP+6VwC7
         gpo7rnLgq0rp12YxXaJFitVSO6lT1JEIYb5kljKAdzj0n8mhnmDft46JhooN9I7eBfDq
         jnQx4dZEYS38M1wNSw1u0B1IP8fcrjK2zjPE9BYzkwByH9qS749Vgz1J0nYShob69zVz
         C5+ONrrohKrEooLuGCWk22UPG+85o36lxwgSTZDvbfOM8FyK3mFZVF68hg1KK26FQNyf
         bb5DrhK0IdJM1l3cUWPgd/R4bLPS6xBXYjYKoDq9AiTu4HpSOvg2ii+YeO1qJ61gSd/5
         V+Jg==
X-Gm-Message-State: AOAM531r0f/aPO3iDN/kBBUnxtLgctAUBAsrJ4lyUpDyc63CLfYQcDcN
        gLAJHXzMiqseDl6R75aPjMg=
X-Google-Smtp-Source: ABdhPJwhg1UVl9A/wj0juYPGUBZ+8V77AwojhUcMFLdO+fVOBx95S2d6IV4KrDfWhOzZ1Paylw36Lg==
X-Received: by 2002:a9d:4d95:: with SMTP id u21mr3380617otk.11.1611325001959;
        Fri, 22 Jan 2021 06:16:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l64sm1710628oib.13.2021.01.22.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 06:16:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6131ed5f-1bea-2776-4f3e-08c24697ab1b@roeck-us.net>
Date:   Fri, 22 Jan 2021 06:16:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/22/21 4:31 AM, Andy Shevchenko wrote:
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

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

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

