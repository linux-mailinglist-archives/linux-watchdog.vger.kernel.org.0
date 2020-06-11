Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3F11F6DE3
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 21:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgFKTSZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 15:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgFKTR7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 15:17:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1732FC08C5CA
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jun 2020 12:17:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi5-0002Md-0z; Thu, 11 Jun 2020 21:17:57 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi4-0001LM-OM; Thu, 11 Jun 2020 21:17:56 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/8] watchdog: f71808e_wdt: rename variant-independent identifiers appropriately
Date:   Thu, 11 Jun 2020 21:17:49 +0200
Message-Id: <20200611191750.28096-9-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200611191750.28096-1-a.fatoum@pengutronix.de>
References: <20200611191750.28096-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Code for the common parts of the driver, either uses watchdog_ as
prefix for the watchdog API or f71808e_ for everything else.

The driver now supports 9 more variants besides the f71808e,
so let's rename the common parts to start with fintek_ instead.

This makes code browsing easier, because it's readily apparent whether a
function is variant-specific or not. Also the watchdog_ namespace isn't
used anymore for the driver-internal functions.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/f71808e_wdt.c | 98 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 7c42cbf9912e..c866d05e8788 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -114,18 +114,18 @@ static inline int superio_enter(int base);
 static inline void superio_select(int base, int ld);
 static inline void superio_exit(int base);
 
-struct watchdog_data;
+struct fintek_wdog_data;
 
-struct f71808e_variant {
+struct fintek_variant {
 	u16 id;
 	const char *wdt_name; /* NULL if chip lacks watchdog timer */
-	void (*pinconf)(struct watchdog_data *wd);
+	void (*pinconf)(struct fintek_wdog_data *wd);
 };
 
-struct watchdog_data {
+struct fintek_wdog_data {
 	struct watchdog_device wdd;
 	unsigned short	sioaddr;
-	const struct f71808e_variant *variant;
+	const struct fintek_variant *variant;
 	struct watchdog_info ident;
 
 	u8		timer_val;	/* content for the wd_time register */
@@ -134,7 +134,7 @@ struct watchdog_data {
 	char		pulse_mode;	/* enable pulse output mode? */
 };
 
-static inline bool has_f81865_wdo_conf(struct watchdog_data *wd)
+static inline bool has_f81865_wdo_conf(struct fintek_wdog_data *wd)
 {
 	return wd->variant->id == SIO_F81865_ID
 		|| wd->variant->id == SIO_F81866_ID;
@@ -202,9 +202,9 @@ static inline void superio_exit(int base)
 	release_region(base, 2);
 }
 
-static int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
+static int fintek_wdog_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
 {
-	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
+	struct fintek_wdog_data *wd = watchdog_get_drvdata(wdd);
 
 	wdd->timeout = new_timeout;
 	if (new_timeout > 0xff) {
@@ -218,7 +218,7 @@ static int watchdog_set_timeout(struct watchdog_device *wdd, unsigned int new_ti
 	return 0;
 }
 
-static int watchdog_set_pulse_width(struct watchdog_data *wd, unsigned int pw)
+static int fintek_wdog_set_pulse_width(struct fintek_wdog_data *wd, unsigned int pw)
 {
 	unsigned int t1 = 25, t2 = 125, t3 = 5000;
 
@@ -246,9 +246,9 @@ static int watchdog_set_pulse_width(struct watchdog_data *wd, unsigned int pw)
 	return 0;
 }
 
-static int watchdog_keepalive(struct watchdog_device *wdd)
+static int fintek_wdog_keepalive(struct watchdog_device *wdd)
 {
-	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
+	struct fintek_wdog_data *wd = watchdog_get_drvdata(wdd);
 	int err;
 
 	err = superio_enter(wd->sioaddr);
@@ -274,13 +274,13 @@ static int watchdog_keepalive(struct watchdog_device *wdd)
 	return 0;
 }
 
-static int watchdog_start(struct watchdog_device *wdd)
+static int fintek_wdog_start(struct watchdog_device *wdd)
 {
-	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
+	struct fintek_wdog_data *wd = watchdog_get_drvdata(wdd);
 	int err;
 
 	/* Make sure we don't die as soon as the watchdog is enabled below */
-	err = watchdog_keepalive(wdd);
+	err = fintek_wdog_keepalive(wdd);
 	if (err)
 		return err;
 
@@ -328,9 +328,9 @@ static int watchdog_start(struct watchdog_device *wdd)
 	return err;
 }
 
-static int watchdog_stop(struct watchdog_device *wdd)
+static int fintek_wdog_stop(struct watchdog_device *wdd)
 {
-	struct watchdog_data *wd = watchdog_get_drvdata(wdd);
+	struct fintek_wdog_data *wd = watchdog_get_drvdata(wdd);
 	int err;
 
 	err = superio_enter(wd->sioaddr);
@@ -346,21 +346,21 @@ static int watchdog_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
-static const struct watchdog_ops f71808e_wdog_ops = {
+static const struct watchdog_ops fintek_wdog_ops = {
 	.owner = THIS_MODULE,
-	.start = watchdog_start,
-	.stop = watchdog_stop,
-	.ping = watchdog_keepalive,
-	.set_timeout = watchdog_set_timeout,
+	.start = fintek_wdog_start,
+	.stop = fintek_wdog_stop,
+	.ping = fintek_wdog_keepalive,
+	.set_timeout = fintek_wdog_set_timeout,
 };
 
-static bool watchdog_is_running(struct watchdog_data *wd, u8 wdt_conf)
+static bool fintek_wdog_is_running(struct fintek_wdog_data *wd, u8 wdt_conf)
 {
 	return (superio_inb(wd->sioaddr, SIO_REG_ENABLE) & BIT(0))
 		&& (wdt_conf & BIT(F71808FG_FLAG_WD_EN));
 }
 
-static int __init watchdog_init(struct watchdog_data *wd)
+static int __init fintek_wdog_init(struct fintek_wdog_data *wd)
 {
 	struct watchdog_device *wdd = &wd->wdd;
 	int wdt_conf, err = 0;
@@ -390,17 +390,17 @@ static int __init watchdog_init(struct watchdog_data *wd)
 	superio_outb(wd->sioaddr, F71808FG_REG_WDT_CONF,
 		     wdt_conf | BIT(F71808FG_FLAG_WDTMOUT_STS));
 
-	if (watchdog_is_running(wd, wdt_conf))
+	if (fintek_wdog_is_running(wd, wdt_conf))
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 
 	superio_exit(wd->sioaddr);
 
-	err = watchdog_set_pulse_width(wd, pulse_width);
+	err = fintek_wdog_set_pulse_width(wd, pulse_width);
 	if (err)
 		return err;
 
 	wdd->info		= &wd->ident;
-	wdd->ops		= &f71808e_wdog_ops;
+	wdd->ops		= &fintek_wdog_ops;
 	wdd->min_timeout	= 1;
 	wdd->max_timeout	= max_timeout;
 	wdd->timeout		= timeout;
@@ -418,18 +418,18 @@ static int __init watchdog_init(struct watchdog_data *wd)
 	 * WATCHDOG_HANDLE_BOOT_ENABLED can result in keepalive being directly
 	 * called without a set_timeout before, so it needs to be done here once
 	 */
-	watchdog_set_timeout(wdd, wdd->timeout);
+	fintek_wdog_set_timeout(wdd, wdd->timeout);
 
 	return watchdog_register_device(wdd);
 }
 
-static void f71808fg_pinconf(struct watchdog_data *wd)
+static void f71808fg_pinconf(struct fintek_wdog_data *wd)
 {
 	/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
 	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT2, 3);
 	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 3);
 }
-static void f71862fg_pinconf(struct watchdog_data *wd)
+static void f71862fg_pinconf(struct fintek_wdog_data *wd)
 {
 	if (f71862fg_pin == 63) {
 		/* SPI must be disabled first to use this pin! */
@@ -439,23 +439,23 @@ static void f71862fg_pinconf(struct watchdog_data *wd)
 		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
 	}
 }
-static void f71868_pinconf(struct watchdog_data *wd)
+static void f71868_pinconf(struct fintek_wdog_data *wd)
 {
 	/* GPIO14 --> WDTRST# */
 	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT1, 4);
 }
-static void f71882fg_pinconf(struct watchdog_data *wd)
+static void f71882fg_pinconf(struct fintek_wdog_data *wd)
 {
 	/* Set pin 56 to WDTRST# */
 	superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
 }
-static void f71889fg_pinconf(struct watchdog_data *wd)
+static void f71889fg_pinconf(struct fintek_wdog_data *wd)
 {
 	/* set pin 40 to WDTRST# */
 	superio_outb(wd->sioaddr, SIO_REG_MFUNCT3,
 		     superio_inb(wd->sioaddr, SIO_REG_MFUNCT3) & 0xcf);
 }
-static void f81803_pinconf(struct watchdog_data *wd)
+static void f81803_pinconf(struct fintek_wdog_data *wd)
 {
 	/* Enable TSI Level register bank */
 	superio_clear_bit(wd->sioaddr, SIO_REG_CLOCK_SEL, 3);
@@ -463,12 +463,12 @@ static void f81803_pinconf(struct watchdog_data *wd)
 	superio_outb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
 		     superio_inb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL));
 }
-static void f81865_pinconf(struct watchdog_data *wd)
+static void f81865_pinconf(struct fintek_wdog_data *wd)
 {
 	/* Set pin 70 to WDTRST# */
 	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 5);
 }
-static void f81866_pinconf(struct watchdog_data *wd)
+static void f81866_pinconf(struct fintek_wdog_data *wd)
 {
 	/*
 	 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
@@ -484,7 +484,7 @@ static void f81866_pinconf(struct watchdog_data *wd)
 	superio_clear_bit(wd->sioaddr, SIO_F81866_REG_GPIO1, 5);
 }
 
-struct f71808e_variant f71808e_variants[] = {
+struct fintek_variant fintek_variants[] = {
 	{ SIO_F71808_ID,  "f71808fg", f71808fg_pinconf },
 	{ SIO_F71862_ID,  "f71862fg", f71862fg_pinconf },
 	{ SIO_F71868_ID,  "f71868",   f71868_pinconf },
@@ -500,9 +500,9 @@ struct f71808e_variant f71808e_variants[] = {
 	{ /* sentinel */ }
 };
 
-static struct f71808e_variant __init *f71808e_find(int sioaddr)
+static struct fintek_variant __init *fintek_wdog_find(int sioaddr)
 {
-	struct f71808e_variant *variant;
+	struct fintek_variant *variant;
 	u16 devid;
 	int err = superio_enter(sioaddr);
 	if (err)
@@ -516,7 +516,7 @@ static struct f71808e_variant __init *f71808e_find(int sioaddr)
 	}
 
 	devid = force_id ? force_id : superio_inw(sioaddr, SIO_REG_DEVID);
-	for (variant = f71808e_variants; variant->id; variant++) {
+	for (variant = fintek_variants; variant->id; variant++) {
 		if (variant->id == devid)
 			break;
 	}
@@ -536,13 +536,13 @@ static struct f71808e_variant __init *f71808e_find(int sioaddr)
 	return variant;
 }
 
-static struct watchdog_data watchdog;
+static struct fintek_wdog_data watchdog;
 
-static int __init f71808e_init(void)
+static int __init fintek_wdog_probe(void)
 {
-	struct watchdog_data *wd = &watchdog;
+	struct fintek_wdog_data *wd = &watchdog;
 	static const unsigned short addrs[] = { 0x2e, 0x4e };
-	struct f71808e_variant *variant;
+	struct fintek_variant *variant;
 	int i;
 
 	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
@@ -551,7 +551,7 @@ static int __init f71808e_init(void)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
-		variant = f71808e_find(addrs[i]);
+		variant = fintek_wdog_find(addrs[i]);
 		if (!IS_ERR(variant))
 			break;
 	}
@@ -561,17 +561,17 @@ static int __init f71808e_init(void)
 	wd->variant = variant;
 	wd->sioaddr = addrs[i];
 
-	return watchdog_init(wd);
+	return fintek_wdog_init(wd);
 }
 
-static void __exit f71808e_exit(void)
+static void __exit fintek_wdog_exit(void)
 {
 	watchdog_unregister_device(&watchdog.wdd);
 }
 
-MODULE_DESCRIPTION("F71808E Watchdog Driver");
+MODULE_DESCRIPTION("Fintek F71808E Watchdog Driver");
 MODULE_AUTHOR("Giel van Schijndel <me@mortis.eu>");
 MODULE_LICENSE("GPL");
 
-module_init(f71808e_init);
-module_exit(f71808e_exit);
+module_init(fintek_wdog_probe);
+module_exit(fintek_wdog_exit);
-- 
2.27.0

