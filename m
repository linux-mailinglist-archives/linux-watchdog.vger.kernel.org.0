Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEAE2AAC9D
	for <lists+linux-watchdog@lfdr.de>; Sun,  8 Nov 2020 18:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgKHR0r (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Nov 2020 12:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHR0r (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Nov 2020 12:26:47 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD84C0613CF;
        Sun,  8 Nov 2020 09:26:47 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id j7so7518260oie.12;
        Sun, 08 Nov 2020 09:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fC3cq0uBZqkhaNQqksnQnxREd7m2PmQwquzQSlPlbj0=;
        b=uv7iPl/guKKD83LHhLPC1XQ83hDy+DJFF8gZxq0oH9GRdll/JXnuYMeOEkZIkTFOsh
         rA12NvOXQQcXt5dN7s2cN64GUMo+YxeD0lyvarKHl8Xw97LJGdLBL59w6T8K2FmP9/h+
         zaNVNTZ5Ox4ar5j+mQfvD9OBFDHInhdVYlie9cFYC+OYeVB6daUilceZv7s/Lj2CY94L
         Uj+/MQxJ1sdKY6qu7QZ5Leg/UTHA6evk8B+TVJW+ahQLhEyaNe0onSqe4JJyfDIlH4OC
         xD+0YbtDLIp4tXgFgjmsO7r3hjn9OmCbscehDUL4fCQSamyj/cGjx4P5pwhKEJ7UXiJG
         WxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fC3cq0uBZqkhaNQqksnQnxREd7m2PmQwquzQSlPlbj0=;
        b=WDnfejNqwS2hcD+9w7OPxfiN0NZwYjQQ3ulVbQ5kmvxKMWOluevxfo91t+IJIeVGOf
         OXJueBO8aQcQ+6m30GsX6O2DQWjYjyKM+j2SVuQLOS1OZtsi/IPFtZcogi6OgbE6gDaW
         HHmtvLz1+slBu5QA4M51WR2gD5aoEGIyUZi1WRpEBpDIT9kn9cKg/EyrcdYfMUfII7Tf
         lTYFgvEHctg0ojLmocAgAUcBHruIIlo81GiqpMhsx+sp0Fk07nMivMGDRWnfRvuvKjld
         juWw/ORfLroxeAyzyphe2XNazjJkGV+WOqtWthNktQDz0Z0gYpOt6WswS8gJjzPl4AcT
         tmeg==
X-Gm-Message-State: AOAM53141cMOUc9TSnE6lrjA72ghNSDvsOMWt1CQlJsX4tB9URpz5ZYH
        +EC5azJNhnfsXNzm0PKZ+3kW+8j7K9A=
X-Google-Smtp-Source: ABdhPJxTXpGwKs9voABGylOdRCzGNbxqzmWE7ZAhesw0NCUVnMKfNA9/ZavgGqBBPX5D18SufbiEfA==
X-Received: by 2002:aca:3542:: with SMTP id c63mr6684594oia.61.1604856406139;
        Sun, 08 Nov 2020 09:26:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r4sm1892633otd.66.2020.11.08.09.26.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 09:26:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 8 Nov 2020 09:26:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] watchdog: f71808e_wdt: refactor to platform
 device/driver pair
Message-ID: <20201108172644.GA30164@roeck-us.net>
References: <20201020062112.6762-1-a.fatoum@pengutronix.de>
 <20201020062112.6762-2-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020062112.6762-2-a.fatoum@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 20, 2020 at 08:21:11AM +0200, Ahmad Fatoum wrote:
> Driver so far wasn't ported to the driver model and set up its
> miscdevice out of the init after probing the I/O ports for a watchdog
> with correct vendor and device revision.
> 
> Keep the device detection part at init time, but move watchdog setup
> to a platform driver probe function.
> 
> While at it, refactor some of the driver code we have to now touch
> anyway:
> 
>  - platform_device_id is used instead of the two big switches mapping
>    hardware ID to an enum and then mapping it to a pinconf function
>  - we rename f71808e_ and watchdog_data to fintek_wdt, to avoid mix up
>    of the generic parts up with the device specific parts
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Sorry, I just found this. Sorry, it got lost.
The changes you are making here go way beyond a conversion to a platform
driver. I am not necessarily opposed to the changes, but they should be
split into multiple patches to simlify (and to a large degree enable)
a meaningful review. More comments inline.

> ---
>  drivers/watchdog/f71808e_wdt.c | 377 +++++++++++++++++++--------------
>  1 file changed, 215 insertions(+), 162 deletions(-)
> 
> diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
> index f60beec1bbae..4ff7a2509125 100644
> --- a/drivers/watchdog/f71808e_wdt.c
> +++ b/drivers/watchdog/f71808e_wdt.c
> @@ -9,12 +9,15 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/err.h>
> +#include <linux/slab.h>
>  #include <linux/fs.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/ioport.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/mutex.h>
>  #include <linux/notifier.h>
>  #include <linux/reboot.h>
> @@ -110,22 +113,6 @@ module_param(start_withtimeout, uint, 0);
>  MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
>  	" given initial timeout. Zero (default) disables this feature.");
>  
> -enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
> -	     f81803, f81865, f81866};
> -
> -static const char *f71808e_names[] = {
> -	"f71808fg",
> -	"f71858fg",
> -	"f71862fg",
> -	"f71868",
> -	"f71869",
> -	"f71882fg",
> -	"f71889fg",
> -	"f81803",
> -	"f81865",
> -	"f81866",
> -};
> -
>  /* Super-I/O Function prototypes */
>  static inline int superio_inb(int base, int reg);
>  static inline int superio_inw(int base, int reg);
> @@ -136,9 +123,17 @@ static inline int superio_enter(int base);
>  static inline void superio_select(int base, int ld);
>  static inline void superio_exit(int base);
>  
> -struct watchdog_data {
> +struct fintek_wdt;
> +
> +struct fintek_wdt_variant {
> +	u16 id;
> +	void (*pinconf)(struct fintek_wdt *wd);
> +	const char *identity_override;
> +};
> +
> +struct fintek_wdt {
>  	unsigned short	sioaddr;
> -	enum chips	type;
> +	const struct fintek_wdt_variant *variant;

I'd rather have this all in here. Just add 
	void (*pinconf)(struct fintek_wdt *wd);
and assign it in the probe function, or call it
from an array indexed with type.

This change is also independent of the conversion to a platform
driver and should be done in a separate patch.

>  	unsigned long	opened;
>  	struct mutex	lock;
>  	char		expect_close;
> @@ -152,10 +147,15 @@ struct watchdog_data {
>  	char		caused_reboot;	/* last reboot was by the watchdog */
>  };
>  
> -static struct watchdog_data watchdog = {
> +static struct fintek_wdt watchdog = {
>  	.lock = __MUTEX_INITIALIZER(watchdog.lock),
>  };
>  
> +static inline bool has_f81865_wdo_conf(struct fintek_wdt *wd)
> +{
> +	return wd->variant->id == SIO_F81865_ID || wd->variant->id == SIO_F81866_ID;
> +}
> +
This change is independent of the conversion to a platform driver
and should be a separate patch.

>  /* Super I/O functions */
>  static inline int superio_inb(int base, int reg)
>  {
> @@ -247,7 +247,7 @@ static int watchdog_set_pulse_width(unsigned int pw)
>  	int err = 0;
>  	unsigned int t1 = 25, t2 = 125, t3 = 5000;
>  
> -	if (watchdog.type == f71868) {
> +	if (watchdog.variant->id == SIO_F71868_ID) {

I am not sure if dropping watchdog.type and replacing it with SIO_F71868_ID
is a good idea. In the current code, there is no 1:1 match of those,
specifically for SIO_F71869_ID/SIO_F71869A_ID. Deviating from that only
complicates the code.

>  		t1 = 30;
>  		t2 = 150;
>  		t3 = 6000;
> @@ -309,7 +309,6 @@ static int watchdog_keepalive(void)
>  static int watchdog_start(void)
>  {
>  	int err;
> -	u8 tmp;
>  
>  	/* Make sure we don't die as soon as the watchdog is enabled below */
>  	err = watchdog_keepalive();
> @@ -323,81 +322,12 @@ static int watchdog_start(void)
>  	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
>  
>  	/* Watchdog pin configuration */
> -	switch (watchdog.type) {
> -	case f71808fg:
> -		/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT2, 3);
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 3);
> -		break;
> -
> -	case f71862fg:
> -		if (f71862fg_pin == 63) {
> -			/* SPI must be disabled first to use this pin! */
> -			superio_clear_bit(watchdog.sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> -			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 4);
> -		} else if (f71862fg_pin == 56) {
> -			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
> -		}
> -		break;
> -
> -	case f71868:
> -	case f71869:
> -		/* GPIO14 --> WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 4);
> -		break;
> -
> -	case f71882fg:
> -		/* Set pin 56 to WDTRST# */
> -		superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
> -		break;
> -
> -	case f71889fg:
> -		/* set pin 40 to WDTRST# */
> -		superio_outb(watchdog.sioaddr, SIO_REG_MFUNCT3,
> -			superio_inb(watchdog.sioaddr, SIO_REG_MFUNCT3) & 0xcf);
> -		break;
> -
> -	case f81803:
> -		/* Enable TSI Level register bank */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_CLOCK_SEL, 3);
> -		/* Set pin 27 to WDTRST# */
> -		superio_outb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
> -			superio_inb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL));
> -		break;
> -
> -	case f81865:
> -		/* Set pin 70 to WDTRST# */
> -		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 5);
> -		break;
> -
> -	case f81866:
> -		/*
> -		 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
> -		 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
> -		 *     BIT5: 0 -> WDTRST#
> -		 *           1 -> GPIO15
> -		 */
> -		tmp = superio_inb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL);
> -		tmp &= ~(BIT(3) | BIT(0));
> -		tmp |= BIT(2);
> -		superio_outb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
> -
> -		superio_clear_bit(watchdog.sioaddr, SIO_F81866_REG_GPIO1, 5);
> -		break;
> -
> -	default:
> -		/*
> -		 * 'default' label to shut up the compiler and catch
> -		 * programmer errors
> -		 */
> -		err = -ENODEV;
> -		goto exit_superio;
> -	}
> +	watchdog.variant->pinconf(&watchdog);
>  
>  	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
>  	superio_set_bit(watchdog.sioaddr, SIO_REG_ENABLE, 0);
>  
> -	if (watchdog.type == f81865 || watchdog.type == f81866)
> +	if (has_f81865_wdo_conf(&watchdog))
>  		superio_set_bit(watchdog.sioaddr, F81865_REG_WDO_CONF,
>  				F81865_FLAG_WDOUT_EN);
>  	else
> @@ -425,7 +355,6 @@ static int watchdog_start(void)
>  				F71808FG_FLAG_WD_PULSE);
>  	}
>  
> -exit_superio:
>  	superio_exit(watchdog.sioaddr);
>  exit_unlock:
>  	mutex_unlock(&watchdog.lock);
> @@ -665,21 +594,39 @@ static struct notifier_block watchdog_notifier = {
>  	.notifier_call = watchdog_notify_sys,
>  };
>  
> -static int __init watchdog_init(int sioaddr)
> +static int fintek_wdt_probe(struct platform_device *pdev)
>  {
> +	const struct platform_device_id *id;
> +	unsigned short sioaddr;
> +	struct resource *res;
>  	int wdt_conf, err = 0;
> +	const char *identity;
> +
> +	if (watchdog_miscdev.parent)
> +		return -EBUSY;
> +
> +	watchdog_miscdev.parent = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!res)
> +		return -ENXIO;
> +
> +	id = platform_get_device_id(pdev);
> +	watchdog.variant = (void *)id->driver_data;
> +	if (!watchdog.variant)
> +		return -ENODEV;
>  
>  	/* No need to lock watchdog.lock here because no entry points
>  	 * into the module have been registered yet.
>  	 */
> -	watchdog.sioaddr = sioaddr;
> +	watchdog.sioaddr = res->start;
>  	watchdog.ident.options = WDIOF_MAGICCLOSE
>  				| WDIOF_KEEPALIVEPING
>  				| WDIOF_CARDRESET;
>  
> -	snprintf(watchdog.ident.identity,
> -		sizeof(watchdog.ident.identity), "%s watchdog",
> -		f71808e_names[watchdog.type]);
> +	identity = watchdog.variant->identity_override ?: id->name;
> +
> +	memcpy(watchdog.ident.identity, identity, sizeof(watchdog.ident.identity));
>  
>  	err = superio_enter(sioaddr);
>  	if (err)
> @@ -772,73 +719,176 @@ static int __init watchdog_init(int sioaddr)
>  	return err;
>  }
>  
> -static int __init f71808e_find(int sioaddr)
> +static void f71808fg_pinconf(struct fintek_wdt *wd)
>  {
> +	/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
> +	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT2, 3);
> +	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 3);
> +}
> +
> +static void f71862fg_pinconf(struct fintek_wdt *wd)
> +{
> +	if (f71862fg_pin == 63) {
> +		/* SPI must be disabled first to use this pin! */
> +		superio_clear_bit(wd->sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
> +		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT3, 4);
> +	} else if (f71862fg_pin == 56) {
> +		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
> +	}
> +}
> +
> +static void f71868_pinconf(struct fintek_wdt *wd)
> +{
> +	/* GPIO14 --> WDTRST# */
> +	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT1, 4);
> +}
> +
> +static void f71882fg_pinconf(struct fintek_wdt *wd)
> +{
> +	/* Set pin 56 to WDTRST# */
> +	superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
> +}
> +
> +static void f71889fg_pinconf(struct fintek_wdt *wd)
> +{
> +	/* set pin 40 to WDTRST# */
> +	superio_outb(wd->sioaddr, SIO_REG_MFUNCT3,
> +		     superio_inb(wd->sioaddr, SIO_REG_MFUNCT3) & 0xcf);
> +}
> +
> +static void f81803_pinconf(struct fintek_wdt *wd)
> +{
> +	/* Enable TSI Level register bank */
> +	superio_clear_bit(wd->sioaddr, SIO_REG_CLOCK_SEL, 3);
> +	/* Set pin 27 to WDTRST# */
> +	superio_outb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
> +		     superio_inb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL));
> +}
> +
> +static void f81865_pinconf(struct fintek_wdt *wd)
> +{
> +	/* Set pin 70 to WDTRST# */
> +	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 5);
> +}
> +
> +static void f81866_pinconf(struct fintek_wdt *wd)
> +{
> +	u8 tmp;
> +	/*
> +	 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
> +	 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
> +	 *     BIT5: 0 -> WDTRST#
> +	 *           1 -> GPIO15
> +	 */
> +	tmp = superio_inb(wd->sioaddr, SIO_F81866_REG_PORT_SEL);
> +	tmp &= ~(BIT(3) | BIT(0));
> +	tmp |= BIT(2);
> +	superio_outb(wd->sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
> +
> +	superio_clear_bit(wd->sioaddr, SIO_F81866_REG_GPIO1, 5);
> +}
> +
> +#define FINTEK_DRV_DATA(...) \
> +	(kernel_ulong_t)(&(struct fintek_wdt_variant) { __VA_ARGS__ })
> +
> +/*
> + * Array is used by both platform bus to map name to driver data and by
> + * init below to map id in driver_data to name for device creation.
> + */
> +static const struct platform_device_id fintek_wdt_id_table[] = {
> +	{ "f71808fg watchdog", FINTEK_DRV_DATA(SIO_F71808_ID,  f71808fg_pinconf) },
> +	{ "f71862fg watchdog", FINTEK_DRV_DATA(SIO_F71862_ID,  f71862fg_pinconf) },
> +	{ "f71868 watchdog",   FINTEK_DRV_DATA(SIO_F71868_ID,  f71868_pinconf) },
> +	{ "f71869 watchdog",   FINTEK_DRV_DATA(SIO_F71869_ID,  f71868_pinconf) },
> +	/* For backwards-compatibility, we define a different watchdog identity name */
> +	{ "f71869a watchdog",  FINTEK_DRV_DATA(SIO_F71869A_ID, f71868_pinconf,
> +					       .identity_override = "f71869 watchdog") },

I don't think .identity_override adds real value.

> +	{ "f71882fg watchdog", FINTEK_DRV_DATA(SIO_F71882_ID,  f71882fg_pinconf) },
> +	{ "f71889fg watchdog", FINTEK_DRV_DATA(SIO_F71889_ID,  f71889fg_pinconf) },
> +	{ "f81803 watchdog",   FINTEK_DRV_DATA(SIO_F81803_ID,  f81803_pinconf) },
> +	{ "f81865 watchdog",   FINTEK_DRV_DATA(SIO_F81865_ID,  f81865_pinconf) },
> +	{ "f81866 watchdog",   FINTEK_DRV_DATA(SIO_F81866_ID,  f81866_pinconf) },

I am not entirely sure I understand exactly what the macro does, and checkpatch
doesn't like it either.

Anyway, I don't think this complexity is necessary. Other similar drivers add
device information as platform driver data (using platform_device_add_data)
and get it using dev_get_platdata(). That would be much simpler and more
straightforward.

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, fintek_wdt_id_table);
> +
> +/* Confirmed (by datasheet) not to have a watchdog.
> + * We list this here anyway to maintain backwards-compatibility in not warning about them
> + */
> +static const u16 fintek_no_wdt_table[] = { SIO_F71858_ID, 0 };
> +
> +static int fintek_wdt_remove(struct platform_device *pdev)
> +{
> +	if (watchdog_is_running()) {
> +		pr_warn("Watchdog timer still running, stopping it\n");
> +		watchdog_stop();
> +	}
> +	misc_deregister(&watchdog_miscdev);
> +	unregister_reboot_notifier(&watchdog_notifier);
> +	return 0;
> +}
> +
> +static struct platform_driver fintek_wdt_driver = {
> +	.probe		= fintek_wdt_probe,
> +	.remove		= fintek_wdt_remove,
> +	.id_table	= fintek_wdt_id_table,
> +	.driver		= {
> +		.name	= DRVNAME,
> +	},
> +};
> +
> +static struct platform_device *fintek_wdt_pdev;
> +
> +static __init const char *fintek_wdt_find(int sioaddr)
> +{
> +	const char *name = ERR_PTR(-ENODEV);
> +	const struct platform_device_id *id;
> +	struct fintek_wdt_variant *variant;
>  	u16 devid;
> -	int err = superio_enter(sioaddr);
> +	const u16 *pdevid;
> +	int err;
> +
> +	err = superio_enter(sioaddr);
>  	if (err)
> -		return err;
> +		return ERR_PTR(err);
>  
>  	devid = superio_inw(sioaddr, SIO_REG_MANID);
>  	if (devid != SIO_FINTEK_ID) {
>  		pr_debug("Not a Fintek device\n");
> -		err = -ENODEV;
> -		goto exit;
> +		goto out;
>  	}
>  
>  	devid = force_id ? force_id : superio_inw(sioaddr, SIO_REG_DEVID);
> -	switch (devid) {
> -	case SIO_F71808_ID:
> -		watchdog.type = f71808fg;
> -		break;
> -	case SIO_F71862_ID:
> -		watchdog.type = f71862fg;
> -		break;
> -	case SIO_F71868_ID:
> -		watchdog.type = f71868;
> -		break;
> -	case SIO_F71869_ID:
> -	case SIO_F71869A_ID:
> -		watchdog.type = f71869;
> -		break;
> -	case SIO_F71882_ID:
> -		watchdog.type = f71882fg;
> -		break;
> -	case SIO_F71889_ID:
> -		watchdog.type = f71889fg;
> -		break;
> -	case SIO_F71858_ID:
> -		/* Confirmed (by datasheet) not to have a watchdog. */
> -		err = -ENODEV;
> -		goto exit;
> -	case SIO_F81803_ID:
> -		watchdog.type = f81803;
> -		break;
> -	case SIO_F81865_ID:
> -		watchdog.type = f81865;
> -		break;
> -	case SIO_F81866_ID:
> -		watchdog.type = f81866;
> -		break;
> -	default:
> -		pr_info("Unrecognized Fintek device: %04x\n",
> -			(unsigned int)devid);
> -		err = -ENODEV;
> -		goto exit;
> +	for (id = fintek_wdt_id_table; id->driver_data; id++) {
> +		variant = (void *)id->driver_data;
> +		if (variant->id == devid) {
> +			name = id->name;
> +			pr_info("Found %s chip, revision %d\n",
> +				name, superio_inb(sioaddr, SIO_REG_DEVREV));
> +			goto out;
> +		}
> +	}
> +
> +	for (pdevid = fintek_no_wdt_table; *pdevid; pdevid++) {
> +		if (*pdevid == devid)
> +			goto out;

I'd rather keep the old code here. I don't see a substantial benefit in
its replacement.

>  	}
>  
> -	pr_info("Found %s watchdog chip, revision %d\n",
> -		f71808e_names[watchdog.type],
> -		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
> -exit:
> +	pr_info("Unrecognized Fintek device: %04x\n", devid);
> +out:
>  	superio_exit(sioaddr);
> -	return err;
> +	return name;
>  }
>  
> -static int __init f71808e_init(void)
> +static struct resource wdt_res = {
> +	.name = "superio port",
> +	.flags = IORESOURCE_IO,
> +};
> +
> +static int __init fintek_wdt_init(void)
>  {
> -	static const unsigned short addrs[] = { 0x2e, 0x4e };
> -	int err = -ENODEV;
> +	unsigned short addrs[] = { 0x2e, 0x4e };

Why drop the static here ? It won't change.

> +	const char *wdt_name;
>  	int i;
>  
>  	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
> @@ -846,30 +896,33 @@ static int __init f71808e_init(void)
>  		return -EINVAL;
>  	}
>  
> +	platform_driver_register(&fintek_wdt_driver);
> +

The driver should only be registered if a watchdog device is found.

>  	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
> -		err = f71808e_find(addrs[i]);
> -		if (err == 0)
> +		wdt_name = fintek_wdt_find(addrs[i]);
> +		if (!IS_ERR(wdt_name))
>  			break;
>  	}
> +
>  	if (i == ARRAY_SIZE(addrs))
> -		return err;
> +		return PTR_ERR(wdt_name);
> +
> +	wdt_res.start = addrs[i];
> +	wdt_res.end = wdt_res.start + 1;
>  
> -	return watchdog_init(addrs[i]);
> +	fintek_wdt_pdev = platform_device_register_simple(wdt_name, -1, &wdt_res, 1);
> +	return PTR_ERR_OR_ZERO(fintek_wdt_pdev);
>  }
>  
> -static void __exit f71808e_exit(void)
> +static void __exit fintek_wdt_exit(void)
>  {
> -	if (watchdog_is_running()) {
> -		pr_warn("Watchdog timer still running, stopping it\n");
> -		watchdog_stop();
> -	}
> -	misc_deregister(&watchdog_miscdev);
> -	unregister_reboot_notifier(&watchdog_notifier);
> +	platform_device_unregister(fintek_wdt_pdev);
> +	platform_driver_unregister(&fintek_wdt_driver);
>  }
>  
>  MODULE_DESCRIPTION("F71808E Watchdog Driver");
>  MODULE_AUTHOR("Giel van Schijndel <me@mortis.eu>");
>  MODULE_LICENSE("GPL");
>  
> -module_init(f71808e_init);
> -module_exit(f71808e_exit);
> +module_init(fintek_wdt_init);
> +module_exit(fintek_wdt_exit);
