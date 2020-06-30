Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEC520FEB9
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 23:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730691AbgF3V06 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 17:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729804AbgF3V06 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 17:26:58 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4140C061755;
        Tue, 30 Jun 2020 14:26:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id z5so10546782pgb.6;
        Tue, 30 Jun 2020 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9QWwxBuVycDzrvstf3qUVNqhFaJUT9GPVpf1a8kd+5I=;
        b=rHbLfM8cTkyFM4gEt4TojWuVI2x/+6benslJBWrlwIpZtgkcjo6Pr4rXav9V8gRLcp
         zW5V6l7qSDy7Hb3BPhXoHFyj6JmM2epwy/XNaNWB36ekxHzr2RTQdPem4yUMcAdgkS+L
         OMGHgbo2GP3vni2N4yPsvjtDKoRp72vbRdd+UpcZretp0N6SHg0y07jG/FXXpjgW1Ynk
         7e3kAYm76yLySyTTcwESZgszEp12b9mE9vIrtDvBfFDjGyDzEbBs8c/Sop6bpc+ASSQW
         5dmvnAJ2eTMpD8iQtAcFAGgpcQxWy0Ux/Hrf8yc9SHLaX+rAcnPzUktT4HZTDfPLo0QR
         Wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9QWwxBuVycDzrvstf3qUVNqhFaJUT9GPVpf1a8kd+5I=;
        b=Ciai2Eprt5vo3AhwD7XFRcU0R63kleFBfTiqW5fosaCrVU8wGuuJmWXoH7ZU2+4qHx
         tMiyRKtDw0wLJqegYXgHb74jucXbFntqXairSs1haynHa2BwCflZncM0W8W5glLeXSyu
         9c1YNiWVwq2OGPE8rmqJR37fQQRCncvHElNjqPFN0s7ow7tcwtApNjRLJY/tQH1/6js5
         zPorhRJZDQh6FU6auMj1ob0cFqyw5tn1cOcxV+jqEoQIGsH2KY5STkK047XFS0/vKk99
         04RsgdOlBklLMlzSBLs8kmGitWkd3ZrYD/FAAZJLmM0Skt1j4QjltFm1w/1rc7CYbqa2
         b1Bg==
X-Gm-Message-State: AOAM533vdN5sAUy2k3zISmb/Vs0pNYqo8tXumnGJDY98kQS28/4b5FTT
        WvvX6WWeMu0Kpu7RwlVMg2I=
X-Google-Smtp-Source: ABdhPJzfqGsJjMWB8+7z+ch2zsyuW3+h0uBr9GJb4y5cPRGEOiY0GIqNYyNacgEfpwoF0/3JddCQ8Q==
X-Received: by 2002:a62:5bc5:: with SMTP id p188mr21692350pfb.56.1593552417042;
        Tue, 30 Jun 2020 14:26:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m17sm2731183pfo.182.2020.06.30.14.26.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 14:26:56 -0700 (PDT)
Date:   Tue, 30 Jun 2020 14:26:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 7/8] watchdog: f71808e_wdt: migrate to new kernel
 watchdog API
Message-ID: <20200630212655.GA24291@roeck-us.net>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
 <20200611191750.28096-8-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-8-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jun 11, 2020 at 09:17:48PM +0200, Ahmad Fatoum wrote:
> Migrating the driver lets us drop the watchdog misc device boilerplate
> and reduce size by 270~ lines. It also brings us support for new
> functionality like CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
> 
> This changes behavior on module unloading: Whereas before, the watchdog
> was automatically stopped on module unload, now explicit stopping of
> the watchdog before unload is required.
> 

Any chance you can convert the driver to a platform device ?

Thanks,
Guenter

> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/watchdog/Kconfig       |   1 +
>  drivers/watchdog/f71808e_wdt.c | 497 ++++++++-------------------------
>  2 files changed, 111 insertions(+), 387 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 0663c604bd64..c312dd5fc0ca 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1052,6 +1052,7 @@ config EBC_C384_WDT
>  config F71808E_WDT
>  	tristate "Fintek F718xx, F818xx Super I/O Watchdog"
>  	depends on X86
> +	select WATCHDOG_CORE
>  	help
>  	  This is the driver for the hardware watchdog on the Fintek F71808E,
>  	  F71862FG, F71868, F71869, F71882FG, F71889FG, F81803, F81865, and
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index 9299ad4d4a52..7c42cbf9912e 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -9,16 +9,10 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/err.h>
> -#include <linux/fs.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
> -#include <linux/miscdevice.h>
>  #include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/notifier.h>
> -#include <linux/reboot.h>
> -#include <linux/uaccess.h>
>  #include <linux/watchdog.h>
>  
>  #define DRVNAME "f71808e_wdt"
> @@ -129,23 +123,15 @@ struct f71808e_variant {
>  };
>  
>  struct watchdog_data {
> +	struct watchdog_device wdd;
>  	unsigned short	sioaddr;
>  	const struct f71808e_variant *variant;
> -	unsigned long	opened;
> -	struct mutex	lock;
> -	char		expect_close;
>  	struct watchdog_info ident;
>  
> -	unsigned short	timeout;
>  	u8		timer_val;	/* content for the wd_time register */
>  	char		minutes_mode;
>  	u8		pulse_val;	/* pulse width flag */
>  	char		pulse_mode;	/* enable pulse output mode? */
> -	char		caused_reboot;	/* last reboot was by the watchdog */
> -};
> -
> -static struct watchdog_data watchdog = {
> -	.lock = __MUTEX_INITIALIZER(watchdog.lock),
>  };
>  
>  static inline bool has_f81865_wdo_conf(struct watchdog_data *wd)
> @@ -216,487 +202,225 @@ static inline void superio_exit(int base)
>  	release_region(base, 2);
>  }
>  
> -static int watchdog_set_timeout(int timeout)
> +static int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
>  {
> -	if (timeout <= 0
> -	 || timeout >  max_timeout) {
> -		pr_err("watchdog timeout out of range\n");
> -		return -EINVAL;
> -	}
> +	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
>  
> -	mutex_lock(&watchdog.lock);
> -
> -	watchdog.timeout = timeout;
> -	if (timeout > 0xff) {
> -		watchdog.timer_val = DIV_ROUND_UP(timeout, 60);
> -		watchdog.minutes_mode = true;
> +	wdd->timeout = new_timeout;
> +	if (new_timeout > 0xff) {
> +		wd->timer_val = DIV_ROUND_UP(new_timeout, 60);
> +		wd->minutes_mode = true;
>  	} else {
> -		watchdog.timer_val = timeout;
> -		watchdog.minutes_mode = false;
> +		wd->timer_val = new_timeout;
> +		wd->minutes_mode = false;
>  	}
>  
> -	mutex_unlock(&watchdog.lock);
> -
>  	return 0;
>  }
>  
> -static int watchdog_set_pulse_width(unsigned int pw)
> +static int watchdog_set_pulse_width(struct watchdog_data *wd, unsigned int pw)
>  {
> -	int err = 0;
>  	unsigned int t1 = 25, t2 = 125, t3 = 5000;
>  
> -	if (watchdog.variant->id == SIO_F71868_ID) {
> +	if (wd->variant->id == SIO_F71868_ID) {
>  		t1 = 30;
>  		t2 = 150;
>  		t3 = 6000;
>  	}
>  
> -	mutex_lock(&watchdog.lock);
> -
>  	if        (pw <=  1) {
> -		watchdog.pulse_val = 0;
> +		wd->pulse_val = 0;
>  	} else if (pw <= t1) {
> -		watchdog.pulse_val = 1;
> +		wd->pulse_val = 1;
>  	} else if (pw <= t2) {
> -		watchdog.pulse_val = 2;
> +		wd->pulse_val = 2;
>  	} else if (pw <= t3) {
> -		watchdog.pulse_val = 3;
> +		wd->pulse_val = 3;
>  	} else {
>  		pr_err("pulse width out of range\n");
> -		err = -EINVAL;
> -		goto exit_unlock;
> +		return -EINVAL;
>  	}
>  
> -	watchdog.pulse_mode = pw;
> +	wd->pulse_mode = pw;
>  
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> -	return err;
> +	return 0;
>  }
>  
> -static int watchdog_keepalive(void)
> +static int watchdog_keepalive(struct watchdog_device *wdd)
>  {
> -	int err = 0;
> +	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
> +	int err;
>  
> -	mutex_lock(&watchdog.lock);
> -	err = superio_enter(watchdog.sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
> -		goto exit_unlock;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +		return err;
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
> -	if (watchdog.minutes_mode)
> +	if (wd->minutes_mode)
>  		/* select minutes for timer units */
> -		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				F71808FG_FLAG_WD_UNIT);
>  	else
>  		/* select seconds for timer units */
> -		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  				F71808FG_FLAG_WD_UNIT);
>  
>  	/* Set timer value */
> -	superio_outb(watchdog.sioaddr, F71808FG_REG_WD_TIME,
> -			   watchdog.timer_val);
> +	superio_outb(wd->sioaddr, F71808FG_REG_WD_TIME,
> +		     wd->timer_val);
>  
> -	superio_exit(watchdog.sioaddr);
> +	superio_exit(wd->sioaddr);
>  
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> -	return err;
> +	return 0;
>  }
>  
> -static int watchdog_start(void)
> +static int watchdog_start(struct watchdog_device *wdd)
>  {
> +	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
>  	int err;
>  
>  	/* Make sure we don't die as soon as the watchdog is enabled below */
> -	err = watchdog_keepalive();
> +	err = watchdog_keepalive(wdd);
>  	if (err)
>  		return err;
>  
> -	mutex_lock(&watchdog.lock);
> -	err = superio_enter(watchdog.sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
> -		goto exit_unlock;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +		return err;
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
>  	/* Watchdog pin configuration */
> -	watchdog.variant->pinconf(&watchdog);
> +	wd->variant->pinconf(wd);
>  
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> -	superio_set_bit(watchdog.sioaddr, SIO_REG_ENABLE, 0);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_set_bit(wd->sioaddr, SIO_REG_ENABLE, 0);
>  
> -	if (has_f81865_wdo_conf(&watchdog))
> -		superio_set_bit(watchdog.sioaddr, F81865_REG_WDO_CONF,
> +	if (has_f81865_wdo_conf(wd))
> +		superio_set_bit(wd->sioaddr, F81865_REG_WDO_CONF,
>  				F81865_FLAG_WDOUT_EN);
>  	else
> -		superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDO_CONF,
> +		superio_set_bit(wd->sioaddr, F71808FG_REG_WDO_CONF,
>  				F71808FG_FLAG_WDOUT_EN);
>  
> -	superio_set_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> +	superio_set_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  			F71808FG_FLAG_WD_EN);
>  
> -	if (watchdog.pulse_mode) {
> +	set_bit(WDOG_HW_RUNNING, &wdd->status);
> +
> +	if (wd->pulse_mode) {
>  		/* Select "pulse" output mode with given duration */
> -		u8 wdt_conf = superio_inb(watchdog.sioaddr,
> -				F71808FG_REG_WDT_CONF);
> +		u8 wdt_conf = superio_inb(wd->sioaddr, F71808FG_REG_WDT_CONF);
>  
>  		/* Set WD_PSWIDTH bits (1:0) */
> -		wdt_conf = (wdt_conf & 0xfc) | (watchdog.pulse_val & 0x03);
> +		wdt_conf = (wdt_conf & 0xfc) | (wd->pulse_val & 0x03);
>  		/* Set WD_PULSE to "pulse" mode */
>  		wdt_conf |= BIT(F71808FG_FLAG_WD_PULSE);
>  
> -		superio_outb(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> -				wdt_conf);
> +		superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF, wdt_conf);
>  	} else {
>  		/* Select "level" output mode */
> -		superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> -				F71808FG_FLAG_WD_PULSE);
> +		superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
> +				  F71808FG_FLAG_WD_PULSE);
>  	}
>  
> -	superio_exit(watchdog.sioaddr);
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> +	superio_exit(wd->sioaddr);
>  
>  	return err;
>  }
>  
> -static int watchdog_stop(void)
> -{
> -	int err = 0;
> -
> -	mutex_lock(&watchdog.lock);
> -	err = superio_enter(watchdog.sioaddr);
> -	if (err)
> -		goto exit_unlock;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> -
> -	superio_clear_bit(watchdog.sioaddr, F71808FG_REG_WDT_CONF,
> -			F71808FG_FLAG_WD_EN);
> -
> -	superio_exit(watchdog.sioaddr);
> -
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> -
> -	return err;
> -}
> -
> -static int watchdog_get_status(void)
> -{
> -	int status = 0;
> -
> -	mutex_lock(&watchdog.lock);
> -	status = (watchdog.caused_reboot) ? WDIOF_CARDRESET : 0;
> -	mutex_unlock(&watchdog.lock);
> -
> -	return status;
> -}
> -
> -static bool watchdog_is_running(void)
> -{
> -	/*
> -	 * if we fail to determine the watchdog's status assume it to be
> -	 * running to be on the safe side
> -	 */
> -	bool is_running = true;
> -
> -	mutex_lock(&watchdog.lock);
> -	if (superio_enter(watchdog.sioaddr))
> -		goto exit_unlock;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> -
> -	is_running = (superio_inb(watchdog.sioaddr, SIO_REG_ENABLE) & BIT(0))
> -		&& (superio_inb(watchdog.sioaddr, F71808FG_REG_WDT_CONF)
> -			& BIT(F71808FG_FLAG_WD_EN));
> -
> -	superio_exit(watchdog.sioaddr);
> -
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> -	return is_running;
> -}
> -
> -/* /dev/watchdog api */
> -
> -static int watchdog_open(struct inode *inode, struct file *file)
> +static int watchdog_stop(struct watchdog_device *wdd)
>  {
> +	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
>  	int err;
>  
> -	/* If the watchdog is alive we don't need to start it again */
> -	if (test_and_set_bit(0, &watchdog.opened))
> -		return -EBUSY;
> -
> -	err = watchdog_start();
> -	if (err) {
> -		clear_bit(0, &watchdog.opened);
> +	err = superio_enter(wd->sioaddr);
> +	if (err)
>  		return err;
> -	}
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
> -	if (nowayout)
> -		__module_get(THIS_MODULE);
> +	superio_clear_bit(wd->sioaddr, F71808FG_REG_WDT_CONF,
> +			  F71808FG_FLAG_WD_EN);
>  
> -	watchdog.expect_close = 0;
> -	return stream_open(inode, file);
> -}
> -
> -static int watchdog_release(struct inode *inode, struct file *file)
> -{
> -	clear_bit(0, &watchdog.opened);
> +	superio_exit(wd->sioaddr);
>  
> -	if (!watchdog.expect_close) {
> -		watchdog_keepalive();
> -		pr_crit("Unexpected close, not stopping watchdog!\n");
> -	} else if (!nowayout) {
> -		watchdog_stop();
> -	}
>  	return 0;
>  }
>  
> -/*
> - *      watchdog_write:
> - *      @file: file handle to the watchdog
> - *      @buf: buffer to write
> - *      @count: count of bytes
> - *      @ppos: pointer to the position to write. No seeks allowed
> - *
> - *      A write to a watchdog device is defined as a keepalive signal. Any
> - *      write of data will do, as we we don't define content meaning.
> - */
> -
> -static ssize_t watchdog_write(struct file *file, const char __user *buf,
> -			    size_t count, loff_t *ppos)
> -{
> -	if (count) {
> -		if (!nowayout) {
> -			size_t i;
> -
> -			/* In case it was set long ago */
> -			bool expect_close = false;
> -
> -			for (i = 0; i != count; i++) {
> -				char c;
> -				if (get_user(c, buf + i))
> -					return -EFAULT;
> -				if (c == 'V')
> -					expect_close = true;
> -			}
> -
> -			/* Properly order writes across fork()ed processes */
> -			mutex_lock(&watchdog.lock);
> -			watchdog.expect_close = expect_close;
> -			mutex_unlock(&watchdog.lock);
> -		}
> -
> -		/* someone wrote to us, we should restart timer */
> -		watchdog_keepalive();
> -	}
> -	return count;
> -}
> -
> -/*
> - *      watchdog_ioctl:
> - *      @inode: inode of the device
> - *      @file: file handle to the device
> - *      @cmd: watchdog command
> - *      @arg: argument pointer
> - *
> - *      The watchdog API defines a common set of functions for all watchdogs
> - *      according to their available features.
> - */
> -static long watchdog_ioctl(struct file *file, unsigned int cmd,
> -	unsigned long arg)
> -{
> -	int status;
> -	int new_options;
> -	int new_timeout;
> -	union {
> -		struct watchdog_info __user *ident;
> -		int __user *i;
> -	} uarg;
> -
> -	uarg.i = (int __user *)arg;
> -
> -	switch (cmd) {
> -	case WDIOC_GETSUPPORT:
> -		return copy_to_user(uarg.ident, &watchdog.ident,
> -			sizeof(watchdog.ident)) ? -EFAULT : 0;
> -
> -	case WDIOC_GETSTATUS:
> -		status = watchdog_get_status();
> -		if (status < 0)
> -			return status;
> -		return put_user(status, uarg.i);
> -
> -	case WDIOC_GETBOOTSTATUS:
> -		return put_user(0, uarg.i);
> -
> -	case WDIOC_SETOPTIONS:
> -		if (get_user(new_options, uarg.i))
> -			return -EFAULT;
> -
> -		if (new_options & WDIOS_DISABLECARD)
> -			watchdog_stop();
> -
> -		if (new_options & WDIOS_ENABLECARD)
> -			return watchdog_start();
> -		/* fall through */
> -
> -	case WDIOC_KEEPALIVE:
> -		watchdog_keepalive();
> -		return 0;
> -
> -	case WDIOC_SETTIMEOUT:
> -		if (get_user(new_timeout, uarg.i))
> -			return -EFAULT;
> -
> -		if (watchdog_set_timeout(new_timeout))
> -			return -EINVAL;
> -
> -		watchdog_keepalive();
> -		/* fall through */
> -
> -	case WDIOC_GETTIMEOUT:
> -		return put_user(watchdog.timeout, uarg.i);
> -
> -	default:
> -		return -ENOTTY;
> -
> -	}
> -}
> +static const struct watchdog_ops f71808e_wdog_ops = {
> +	.owner = THIS_MODULE,
> +	.start = watchdog_start,
> +	.stop = watchdog_stop,
> +	.ping = watchdog_keepalive,
> +	.set_timeout = watchdog_set_timeout,
> +};
>  
> -static int watchdog_notify_sys(struct notifier_block *this, unsigned long code,
> -	void *unused)
> +static bool watchdog_is_running(struct watchdog_data *wd, u8 wdt_conf)
>  {
> -	if (code == SYS_DOWN || code == SYS_HALT)
> -		watchdog_stop();
> -	return NOTIFY_DONE;
> +	return (superio_inb(wd->sioaddr, SIO_REG_ENABLE) & BIT(0))
> +		&& (wdt_conf & BIT(F71808FG_FLAG_WD_EN));
>  }
>  
> -static const struct file_operations watchdog_fops = {
> -	.owner		= THIS_MODULE,
> -	.llseek		= no_llseek,
> -	.open		= watchdog_open,
> -	.release	= watchdog_release,
> -	.write		= watchdog_write,
> -	.unlocked_ioctl	= watchdog_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> -};
> -
> -static struct miscdevice watchdog_miscdev = {
> -	.minor		= WATCHDOG_MINOR,
> -	.name		= "watchdog",
> -	.fops		= &watchdog_fops,
> -};
> -
> -static struct notifier_block watchdog_notifier = {
> -	.notifier_call = watchdog_notify_sys,
> -};
> -
> -static int __init watchdog_init(int sioaddr)
> +static int __init watchdog_init(struct watchdog_data *wd)
>  {
> +	struct watchdog_device *wdd = &wd->wdd;
>  	int wdt_conf, err = 0;
>  
>  	/* No need to lock watchdog.lock here because no entry points
>  	 * into the module have been registered yet.
>  	 */
> -	watchdog.sioaddr = sioaddr;
> -	watchdog.ident.options = WDIOF_MAGICCLOSE
> +	wd->ident.options = WDIOF_SETTIMEOUT
> +				| WDIOF_MAGICCLOSE
>  				| WDIOF_KEEPALIVEPING
>  				| WDIOF_CARDRESET;
>  
> -	snprintf(watchdog.ident.identity,
> -		sizeof(watchdog.ident.identity), "%s watchdog",
> -		watchdog.variant->wdt_name);
> +	snprintf(wd->ident.identity, sizeof(wd->ident.identity),
> +		 "%s watchdog", wd->variant->wdt_name);
>  
> -	err = superio_enter(sioaddr);
> +	err = superio_enter(wd->sioaddr);
>  	if (err)
>  		return err;
> -	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> +	superio_select(wd->sioaddr, SIO_F71808FG_LD_WDT);
>  
> -	wdt_conf = superio_inb(sioaddr, F71808FG_REG_WDT_CONF);
> -	watchdog.caused_reboot = wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS);
> +	wdt_conf = superio_inb(wd->sioaddr, F71808FG_REG_WDT_CONF);
>  
>  	/*
>  	 * We don't want WDTMOUT_STS to stick around till regular reboot.
>  	 * Write 1 to the bit to clear it to zero.
>  	 */
> -	superio_outb(sioaddr, F71808FG_REG_WDT_CONF,
> +	superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF,
>  		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
>  
> -	superio_exit(sioaddr);
> +	if (watchdog_is_running(wd, wdt_conf))
> +		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  
> -	err = watchdog_set_timeout(timeout);
> -	if (err)
> -		return err;
> -	err = watchdog_set_pulse_width(pulse_width);
> -	if (err)
> -		return err;
> +	superio_exit(wd->sioaddr);
>  
> -	err = register_reboot_notifier(&watchdog_notifier);
> +	err = watchdog_set_pulse_width(wd, pulse_width);
>  	if (err)
>  		return err;
>  
> -	err = misc_register(&watchdog_miscdev);
> -	if (err) {
> -		pr_err("cannot register miscdev on minor=%d\n",
> -		       watchdog_miscdev.minor);
> -		goto exit_reboot;
> -	}
> -
> -	if (start_withtimeout) {
> -		if (start_withtimeout <= 0
> -		 || start_withtimeout >  max_timeout) {
> -			pr_err("starting timeout out of range\n");
> -			err = -EINVAL;
> -			goto exit_miscdev;
> -		}
> -
> -		err = watchdog_start();
> -		if (err) {
> -			pr_err("cannot start watchdog timer\n");
> -			goto exit_miscdev;
> -		}
> -
> -		mutex_lock(&watchdog.lock);
> -		err = superio_enter(sioaddr);
> -		if (err)
> -			goto exit_unlock;
> -		superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
> -
> -		if (start_withtimeout > 0xff) {
> -			/* select minutes for timer units */
> -			superio_set_bit(sioaddr, F71808FG_REG_WDT_CONF,
> -				F71808FG_FLAG_WD_UNIT);
> -			superio_outb(sioaddr, F71808FG_REG_WD_TIME,
> -				DIV_ROUND_UP(start_withtimeout, 60));
> -		} else {
> -			/* select seconds for timer units */
> -			superio_clear_bit(sioaddr, F71808FG_REG_WDT_CONF,
> -				F71808FG_FLAG_WD_UNIT);
> -			superio_outb(sioaddr, F71808FG_REG_WD_TIME,
> -				start_withtimeout);
> -		}
> -
> -		superio_exit(sioaddr);
> -		mutex_unlock(&watchdog.lock);
> -
> -		if (nowayout)
> -			__module_get(THIS_MODULE);
> +	wdd->info		= &wd->ident;
> +	wdd->ops		= &f71808e_wdog_ops;
> +	wdd->min_timeout	= 1;
> +	wdd->max_timeout	= max_timeout;
> +	wdd->timeout		= timeout;
>  
> -		pr_info("watchdog started with initial timeout of %u sec\n",
> -			start_withtimeout);
> -	}
> +	watchdog_set_nowayout(wdd, nowayout);
> +	watchdog_stop_on_unregister(wdd);
> +	watchdog_stop_on_reboot(wdd);
> +	watchdog_init_timeout(wdd, start_withtimeout, NULL);
> +	watchdog_set_drvdata(wdd, wd);
>  
> -	return 0;
> +	if (wdt_conf & BIT(F71808FG_FLAG_WDTMOUT_STS))
> +		wdd->bootstatus	= WDIOF_CARDRESET;
>  
> -exit_unlock:
> -	mutex_unlock(&watchdog.lock);
> -exit_miscdev:
> -	misc_deregister(&watchdog_miscdev);
> -exit_reboot:
> -	unregister_reboot_notifier(&watchdog_notifier);
> +	/*
> +	 * WATCHDOG_HANDLE_BOOT_ENABLED can result in keepalive being directly
> +	 * called without a set_timeout before, so it needs to be done here once
> +	 */
> +	watchdog_set_timeout(wdd, wdd->timeout);
>  
> -	return err;
> +	return watchdog_register_device(wdd);
>  }
>  
>  static void f71808fg_pinconf(struct watchdog_data *wd)
> @@ -812,8 +536,11 @@ static struct f71808e_variant __init *f71808e_find(int sioaddr)
>  	return variant;
>  }
>  
> +static struct watchdog_data watchdog;
> +
>  static int __init f71808e_init(void)
>  {
> +	struct watchdog_data *wd = &watchdog;
>  	static const unsigned short addrs[] = { 0x2e, 0x4e };
>  	struct f71808e_variant *variant;
>  	int i;
> @@ -831,19 +558,15 @@ static int __init f71808e_init(void)
>  	if (i == ARRAY_SIZE(addrs))
>  		return PTR_ERR(variant);
>  
> -	watchdog.variant = variant;
> +	wd->variant = variant;
> +	wd->sioaddr = addrs[i];
>  
> -	return watchdog_init(addrs[i]);
> +	return watchdog_init(wd);
>  }
>  
>  static void __exit f71808e_exit(void)
>  {
> -	if (watchdog_is_running()) {
> -		pr_warn("Watchdog timer still running, stopping it\n");
> -		watchdog_stop();
> -	}
> -	misc_deregister(&watchdog_miscdev);
> -	unregister_reboot_notifier(&watchdog_notifier);
> +	watchdog_unregister_device(&watchdog.wdd);
>  }
>  
>  MODULE_DESCRIPTION("F71808E Watchdog Driver");
