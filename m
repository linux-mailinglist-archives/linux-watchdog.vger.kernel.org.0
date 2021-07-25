Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6123C3D503B
	for <lists+linux-watchdog@lfdr.de>; Sun, 25 Jul 2021 23:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhGYVIE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 25 Jul 2021 17:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhGYVID (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 25 Jul 2021 17:08:03 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B5BC061757;
        Sun, 25 Jul 2021 14:48:32 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c18so7108537qke.2;
        Sun, 25 Jul 2021 14:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ABKMKevEHWFWKoPDDK5G2faUqIuEbxrXlBlb9zRYhEI=;
        b=OnxF7kIKwDBDEIPjzLxaoJ3hh/GE8cxuXUA9gskp7bkMCSyGWBbIizq0szUSGOBbUV
         A4sg7D2KbiaJbsc66m9ko6chFA/Zh9esqmnQT+NFf7ZEg5vlqDERfPAsZX0+D5xY9Mhf
         BhkvBAeTMAxnp+xgR0Vpxr0NTLAbhRKU433DZQym1ZAEHtUcVor+8NmOR+0ORmiO0sFe
         izyylihQJqPew4ic8tYoYz5wkMxhf5t0ZSmw/uF1w4li4qwEOzc8YGN7rCloL9Sv3Raq
         XAcCyaiwOHKqjcgCCssv9IsAb0vKT4m8G9QFh9IjSdumDimBtlHeatykAQ5LkYDISEPr
         ugDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ABKMKevEHWFWKoPDDK5G2faUqIuEbxrXlBlb9zRYhEI=;
        b=ib32kn7QYxDZBVcJvB7UeCsJEYyehKJ55fh1yaJmNJdotgVp/fcHbXzb1zs53l1p6l
         tyb3u1mCv6em7bI+HrmL/Uyt0Y3okHHSsZHH400mhdM14fsYDen+2u0trlaq07AVmz8O
         6jFyoCQmGMpqrEVgiQxFhxY/eZqnhGgAAwhnQTNDCHi2J0It5B4qaeZl5zJY3EDn153X
         ZfRfnZO+V/VUEPRQicL4GRjRHo32JQ6JscBViGejB8E6fFCpgPdQlrJaW5pl2PgPj9ES
         3hgYLUuGBtAe5rMSi+A9G4XxhxZT7wmDig2PkoToMrZ/iFjI9Iq6TpUMdEslMxTw2DeC
         OWMw==
X-Gm-Message-State: AOAM531dgH5yZjpbpTa5iQPRxQ7jlKHy8Dw2rI6uYW4nd+L0GKuiQznZ
        f1NK7xJBtPX3WBgwVttez58=
X-Google-Smtp-Source: ABdhPJwjKGqvJ4PNOwJimmO73TdEFCHFWA6rkY/G2rbwx4xQm5bh0tyLmw1x1BlZ+MsELsjvpv1SdQ==
X-Received: by 2002:a37:38c:: with SMTP id 134mr15708374qkd.182.1627249711845;
        Sun, 25 Jul 2021 14:48:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm2712074qtp.67.2021.07.25.14.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 14:48:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 25 Jul 2021 14:48:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] watchdog: f71808e_wdt: rename variant-independent
 identifiers appropriately
Message-ID: <20210725214830.GC3578169@roeck-us.net>
References: <cover.c711be1db54f4e07c0153266dd1a831e92e3d49d.1626948810.git-series.a.fatoum@pengutronix.de>
 <9ae6ae2ac53cd6f46d3eb32dec35d0c0a7c40ba5.1626948810.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ae6ae2ac53cd6f46d3eb32dec35d0c0a7c40ba5.1626948810.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 22, 2021 at 12:14:41PM +0200, Ahmad Fatoum wrote:
> Code for the common parts of the driver either uses watchdog_ as
> prefix for the watchdog API or f71808e_ for everything else.
> 
> The driver now supports 9 more variants besides the f71808e,
> so let's rename the common parts to start with fintek_wdt_ instead.
> 
> This makes code browsing easier, because it's readily apparent
> that functions are not variant-specific. Some watchdog_-prefixed
> functions remain, but these will be dropped altogether with the move
> to the kernel watchdog API in a later commit.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/watchdog/f71808e_wdt.c | 66 +++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index f7d82d261913..597eaf6905f4 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -113,7 +113,7 @@ MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>  enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
>  	     f81803, f81865, f81866};
>  
> -static const char *f71808e_names[] = {
> +static const char *fintek_wdt_names[] = {

Nit: checkpatch rightfully complains that this can be

static const char * const fintek_wdt_names[]

>  	"f71808fg",
>  	"f71858fg",
>  	"f71862fg",
> @@ -136,7 +136,7 @@ static inline int superio_enter(int base);
>  static inline void superio_select(int base, int ld);
>  static inline void superio_exit(int base);
>  
> -struct watchdog_data {
> +struct fintek_wdt {
>  	unsigned short	sioaddr;
>  	enum chips	type;
>  	unsigned long	opened;
> @@ -152,7 +152,7 @@ struct watchdog_data {
>  	char		caused_reboot;	/* last reboot was by the watchdog */
>  };
>  
> -static struct watchdog_data watchdog = {
> +static struct fintek_wdt watchdog = {
>  	.lock = __MUTEX_INITIALIZER(watchdog.lock),
>  };
>  
> @@ -218,7 +218,7 @@ static inline void superio_exit(int base)
>  	release_region(base, 2);
>  }
>  
> -static int watchdog_set_timeout(int timeout)
> +static int fintek_wdt_set_timeout(int timeout)
>  {
>  	if (timeout <= 0
>  	 || timeout >  max_timeout) {
> @@ -244,7 +244,7 @@ static int watchdog_set_timeout(int timeout)
>  	return 0;
>  }
>  
> -static int watchdog_set_pulse_width(unsigned int pw)
> +static int fintek_wdt_set_pulse_width(unsigned int pw)
>  {
>  	int err = 0;
>  	unsigned int t1 = 25, t2 = 125, t3 = 5000;
> @@ -278,7 +278,7 @@ static int watchdog_set_pulse_width(unsigned int pw)
>  	return err;
>  }
>  
> -static int watchdog_keepalive(void)
> +static int fintek_wdt_keepalive(void)
>  {
>  	int err = 0;
>  
> @@ -308,13 +308,13 @@ static int watchdog_keepalive(void)
>  	return err;
>  }
>  
> -static int watchdog_start(void)
> +static int fintek_wdt_start(void)
>  {
>  	int err;
>  	u8 tmp;
>  
>  	/* Make sure we don't die as soon as the watchdog is enabled below */
> -	err = watchdog_keepalive();
> +	err = fintek_wdt_keepalive();
>  	if (err)
>  		return err;
>  
> @@ -435,7 +435,7 @@ static int watchdog_start(void)
>  	return err;
>  }
>  
> -static int watchdog_stop(void)
> +static int fintek_wdt_stop(void)
>  {
>  	int err = 0;
>  
> @@ -467,7 +467,7 @@ static int watchdog_get_status(void)
>  	return status;
>  }
>  
> -static bool watchdog_is_running(void)
> +static bool fintek_wdt_is_running(void)
>  {
>  	/*
>  	 * if we fail to determine the watchdog's status assume it to be
> @@ -501,7 +501,7 @@ static int watchdog_open(struct inode *inode, struct file *file)
>  	if (test_and_set_bit(0, &watchdog.opened))
>  		return -EBUSY;
>  
> -	err = watchdog_start();
> +	err = fintek_wdt_start();
>  	if (err) {
>  		clear_bit(0, &watchdog.opened);
>  		return err;
> @@ -519,10 +519,10 @@ static int watchdog_release(struct inode *inode, struct file *file)
>  	clear_bit(0, &watchdog.opened);
>  
>  	if (!watchdog.expect_close) {
> -		watchdog_keepalive();
> +		fintek_wdt_keepalive();
>  		pr_crit("Unexpected close, not stopping watchdog!\n");
>  	} else if (!nowayout) {
> -		watchdog_stop();
> +		fintek_wdt_stop();
>  	}
>  	return 0;
>  }
> @@ -563,7 +563,7 @@ static ssize_t watchdog_write(struct file *file, const char __user *buf,
>  		}
>  
>  		/* someone wrote to us, we should restart timer */
> -		watchdog_keepalive();
> +		fintek_wdt_keepalive();
>  	}
>  	return count;
>  }
> @@ -610,24 +610,24 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
>  			return -EFAULT;
>  
>  		if (new_options & WDIOS_DISABLECARD)
> -			watchdog_stop();
> +			fintek_wdt_stop();
>  
>  		if (new_options & WDIOS_ENABLECARD)
> -			return watchdog_start();
> +			return fintek_wdt_start();
>  		fallthrough;
>  
>  	case WDIOC_KEEPALIVE:
> -		watchdog_keepalive();
> +		fintek_wdt_keepalive();
>  		return 0;
>  
>  	case WDIOC_SETTIMEOUT:
>  		if (get_user(new_timeout, uarg.i))
>  			return -EFAULT;
>  
> -		if (watchdog_set_timeout(new_timeout))
> +		if (fintek_wdt_set_timeout(new_timeout))
>  			return -EINVAL;
>  
> -		watchdog_keepalive();
> +		fintek_wdt_keepalive();
>  		fallthrough;
>  
>  	case WDIOC_GETTIMEOUT:
> @@ -643,7 +643,7 @@ static int watchdog_notify_sys(struct notifier_block *this, unsigned long code,
>  	void *unused)
>  {
>  	if (code == SYS_DOWN || code == SYS_HALT)
> -		watchdog_stop();
> +		fintek_wdt_stop();
>  	return NOTIFY_DONE;
>  }
>  
> @@ -681,7 +681,7 @@ static int __init watchdog_init(int sioaddr)
>  
>  	snprintf(watchdog.ident.identity,
>  		sizeof(watchdog.ident.identity), "%s watchdog",
> -		f71808e_names[watchdog.type]);
> +		fintek_wdt_names[watchdog.type]);
>  
>  	err = superio_enter(sioaddr);
>  	if (err)
> @@ -700,10 +700,10 @@ static int __init watchdog_init(int sioaddr)
>  
>  	superio_exit(sioaddr);
>  
> -	err = watchdog_set_timeout(timeout);
> +	err = fintek_wdt_set_timeout(timeout);
>  	if (err)
>  		return err;
> -	err = watchdog_set_pulse_width(pulse_width);
> +	err = fintek_wdt_set_pulse_width(pulse_width);
>  	if (err)
>  		return err;
>  
> @@ -726,7 +726,7 @@ static int __init watchdog_init(int sioaddr)
>  			goto exit_miscdev;
>  		}
>  
> -		err = watchdog_start();
> +		err = fintek_wdt_start();
>  		if (err) {
>  			pr_err("cannot start watchdog timer\n");
>  			goto exit_miscdev;
> @@ -774,7 +774,7 @@ static int __init watchdog_init(int sioaddr)
>  	return err;
>  }
>  
> -static int __init f71808e_find(int sioaddr)
> +static int __init fintek_wdt_find(int sioaddr)
>  {
>  	u16 devid;
>  	int err = superio_enter(sioaddr);
> @@ -830,14 +830,14 @@ static int __init f71808e_find(int sioaddr)
>  	}
>  
>  	pr_info("Found %s watchdog chip, revision %d\n",
> -		f71808e_names[watchdog.type],
> +		fintek_wdt_names[watchdog.type],
>  		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
>  exit:
>  	superio_exit(sioaddr);
>  	return err;
>  }
>  
> -static int __init f71808e_init(void)
> +static int __init fintek_wdt_init(void)
>  {
>  	static const unsigned short addrs[] = { 0x2e, 0x4e };
>  	int err = -ENODEV;
> @@ -849,7 +849,7 @@ static int __init f71808e_init(void)
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> -		err = f71808e_find(addrs[i]);
> +		err = fintek_wdt_find(addrs[i]);
>  		if (err == 0)
>  			break;
>  	}
> @@ -859,11 +859,11 @@ static int __init f71808e_init(void)
>  	return watchdog_init(addrs[i]);
>  }
>  
> -static void __exit f71808e_exit(void)
> +static void __exit fintek_wdt_exit(void)
>  {
> -	if (watchdog_is_running()) {
> +	if (fintek_wdt_is_running()) {
>  		pr_warn("Watchdog timer still running, stopping it\n");
> -		watchdog_stop();
> +		fintek_wdt_stop();
>  	}
>  	misc_deregister(&watchdog_miscdev);
>  	unregister_reboot_notifier(&watchdog_notifier);
> @@ -873,5 +873,5 @@ MODULE_DESCRIPTION("F71808E Watchdog Driver");
>  MODULE_AUTHOR("Giel van Schijndel <me@mortis.eu>");
>  MODULE_LICENSE("GPL");
>  
> -module_init(f71808e_init);
> -module_exit(f71808e_exit);
> +module_init(fintek_wdt_init);
> +module_exit(fintek_wdt_exit);
> -- 
> git-series 0.9.1
