Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C561F6DE1
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jun 2020 21:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgFKTSZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Jun 2020 15:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgFKTR6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Jun 2020 15:17:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B41C08C5C2
        for <linux-watchdog@vger.kernel.org>; Thu, 11 Jun 2020 12:17:57 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi3-0002M3-It; Thu, 11 Jun 2020 21:17:55 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1jjSi3-0001Dr-9W; Thu, 11 Jun 2020 21:17:55 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] watchdog: f71808e_wdt: consolidate variant handling into single array
Date:   Thu, 11 Jun 2020 21:17:47 +0200
Message-Id: <20200611191750.28096-7-a.fatoum@pengutronix.de>
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

Driver has two big switches: one to map hardware ID to an enum constant
one more to map the enum constant to the variant's pin configuration
routine.

Drop the enum and give every variant an array entry identifying it.
This arguably simplifies the code by making it a little more compact.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/watchdog/f71808e_wdt.c | 263 +++++++++++++++------------------
 1 file changed, 121 insertions(+), 142 deletions(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index 9f7823819ed1..9299ad4d4a52 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -110,22 +110,6 @@ module_param(start_withtimeout, uint, 0);
 MODULE_PARM_DESC(start_withtimeout, "Start watchdog timer on module load with"
 	" given initial timeout. Zero (default) disables this feature.");
 
-enum chips { f71808fg, f71858fg, f71862fg, f71868, f71869, f71882fg, f71889fg,
-	     f81803, f81865, f81866};
-
-static const char *f71808e_names[] = {
-	"f71808fg",
-	"f71858fg",
-	"f71862fg",
-	"f71868",
-	"f71869",
-	"f71882fg",
-	"f71889fg",
-	"f81803",
-	"f81865",
-	"f81866",
-};
-
 /* Super-I/O Function prototypes */
 static inline int superio_inb(int base, int reg);
 static inline int superio_inw(int base, int reg);
@@ -136,9 +120,17 @@ static inline int superio_enter(int base);
 static inline void superio_select(int base, int ld);
 static inline void superio_exit(int base);
 
+struct watchdog_data;
+
+struct f71808e_variant {
+	u16 id;
+	const char *wdt_name; /* NULL if chip lacks watchdog timer */
+	void (*pinconf)(struct watchdog_data *wd);
+};
+
 struct watchdog_data {
 	unsigned short	sioaddr;
-	enum chips	type;
+	const struct f71808e_variant *variant;
 	unsigned long	opened;
 	struct mutex	lock;
 	char		expect_close;
@@ -156,6 +148,12 @@ static struct watchdog_data watchdog = {
 	.lock = __MUTEX_INITIALIZER(watchdog.lock),
 };
 
+static inline bool has_f81865_wdo_conf(struct watchdog_data *wd)
+{
+	return wd->variant->id == SIO_F81865_ID
+		|| wd->variant->id == SIO_F81866_ID;
+}
+
 /* Super I/O functions */
 static inline int superio_inb(int base, int reg)
 {
@@ -247,7 +245,7 @@ static int watchdog_set_pulse_width(unsigned int pw)
 	int err = 0;
 	unsigned int t1 = 25, t2 = 125, t3 = 5000;
 
-	if (watchdog.type == f71868) {
+	if (watchdog.variant->id == SIO_F71868_ID) {
 		t1 = 30;
 		t2 = 150;
 		t3 = 6000;
@@ -309,7 +307,6 @@ static int watchdog_keepalive(void)
 static int watchdog_start(void)
 {
 	int err;
-	u8 tmp;
 
 	/* Make sure we don't die as soon as the watchdog is enabled below */
 	err = watchdog_keepalive();
@@ -323,81 +320,12 @@ static int watchdog_start(void)
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 
 	/* Watchdog pin configuration */
-	switch (watchdog.type) {
-	case f71808fg:
-		/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
-		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT2, 3);
-		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 3);
-		break;
-
-	case f71862fg:
-		if (f71862fg_pin == 63) {
-			/* SPI must be disabled first to use this pin! */
-			superio_clear_bit(watchdog.sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
-			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 4);
-		} else if (f71862fg_pin == 56) {
-			superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
-		}
-		break;
-
-	case f71868:
-	case f71869:
-		/* GPIO14 --> WDTRST# */
-		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 4);
-		break;
-
-	case f71882fg:
-		/* Set pin 56 to WDTRST# */
-		superio_set_bit(watchdog.sioaddr, SIO_REG_MFUNCT1, 1);
-		break;
-
-	case f71889fg:
-		/* set pin 40 to WDTRST# */
-		superio_outb(watchdog.sioaddr, SIO_REG_MFUNCT3,
-			superio_inb(watchdog.sioaddr, SIO_REG_MFUNCT3) & 0xcf);
-		break;
-
-	case f81803:
-		/* Enable TSI Level register bank */
-		superio_clear_bit(watchdog.sioaddr, SIO_REG_CLOCK_SEL, 3);
-		/* Set pin 27 to WDTRST# */
-		superio_outb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
-			superio_inb(watchdog.sioaddr, SIO_REG_TSI_LEVEL_SEL));
-		break;
-
-	case f81865:
-		/* Set pin 70 to WDTRST# */
-		superio_clear_bit(watchdog.sioaddr, SIO_REG_MFUNCT3, 5);
-		break;
-
-	case f81866:
-		/*
-		 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
-		 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
-		 *     BIT5: 0 -> WDTRST#
-		 *           1 -> GPIO15
-		 */
-		tmp = superio_inb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL);
-		tmp &= ~(BIT(3) | BIT(0));
-		tmp |= BIT(2);
-		superio_outb(watchdog.sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
-
-		superio_clear_bit(watchdog.sioaddr, SIO_F81866_REG_GPIO1, 5);
-		break;
-
-	default:
-		/*
-		 * 'default' label to shut up the compiler and catch
-		 * programmer errors
-		 */
-		err = -ENODEV;
-		goto exit_superio;
-	}
+	watchdog.variant->pinconf(&watchdog);
 
 	superio_select(watchdog.sioaddr, SIO_F71808FG_LD_WDT);
 	superio_set_bit(watchdog.sioaddr, SIO_REG_ENABLE, 0);
 
-	if (watchdog.type == f81865 || watchdog.type == f81866)
+	if (has_f81865_wdo_conf(&watchdog))
 		superio_set_bit(watchdog.sioaddr, F81865_REG_WDO_CONF,
 				F81865_FLAG_WDOUT_EN);
 	else
@@ -425,7 +353,6 @@ static int watchdog_start(void)
 				F71808FG_FLAG_WD_PULSE);
 	}
 
-exit_superio:
 	superio_exit(watchdog.sioaddr);
 exit_unlock:
 	mutex_unlock(&watchdog.lock);
@@ -679,7 +606,7 @@ static int __init watchdog_init(int sioaddr)
 
 	snprintf(watchdog.ident.identity,
 		sizeof(watchdog.ident.identity), "%s watchdog",
-		f71808e_names[watchdog.type]);
+		watchdog.variant->wdt_name);
 
 	err = superio_enter(sioaddr);
 	if (err)
@@ -772,73 +699,123 @@ static int __init watchdog_init(int sioaddr)
 	return err;
 }
 
-static int __init f71808e_find(int sioaddr)
+static void f71808fg_pinconf(struct watchdog_data *wd)
+{
+	/* Set pin 21 to GPIO23/WDTRST#, then to WDTRST# */
+	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT2, 3);
+	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 3);
+}
+static void f71862fg_pinconf(struct watchdog_data *wd)
+{
+	if (f71862fg_pin == 63) {
+		/* SPI must be disabled first to use this pin! */
+		superio_clear_bit(wd->sioaddr, SIO_REG_ROM_ADDR_SEL, 6);
+		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT3, 4);
+	} else if (f71862fg_pin == 56) {
+		superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
+	}
+}
+static void f71868_pinconf(struct watchdog_data *wd)
+{
+	/* GPIO14 --> WDTRST# */
+	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT1, 4);
+}
+static void f71882fg_pinconf(struct watchdog_data *wd)
+{
+	/* Set pin 56 to WDTRST# */
+	superio_set_bit(wd->sioaddr, SIO_REG_MFUNCT1, 1);
+}
+static void f71889fg_pinconf(struct watchdog_data *wd)
+{
+	/* set pin 40 to WDTRST# */
+	superio_outb(wd->sioaddr, SIO_REG_MFUNCT3,
+		     superio_inb(wd->sioaddr, SIO_REG_MFUNCT3) & 0xcf);
+}
+static void f81803_pinconf(struct watchdog_data *wd)
+{
+	/* Enable TSI Level register bank */
+	superio_clear_bit(wd->sioaddr, SIO_REG_CLOCK_SEL, 3);
+	/* Set pin 27 to WDTRST# */
+	superio_outb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL, 0x5f &
+		     superio_inb(wd->sioaddr, SIO_REG_TSI_LEVEL_SEL));
+}
+static void f81865_pinconf(struct watchdog_data *wd)
+{
+	/* Set pin 70 to WDTRST# */
+	superio_clear_bit(wd->sioaddr, SIO_REG_MFUNCT3, 5);
+}
+static void f81866_pinconf(struct watchdog_data *wd)
+{
+	/*
+	 * GPIO1 Control Register when 27h BIT3:2 = 01 & BIT0 = 0.
+	 * The PIN 70(GPIO15/WDTRST) is controlled by 2Ch:
+	 *     BIT5: 0 -> WDTRST#
+	 *           1 -> GPIO15
+	 */
+	u8 tmp = superio_inb(wd->sioaddr, SIO_F81866_REG_PORT_SEL);
+	tmp &= ~(BIT(3) | BIT(0));
+	tmp |= BIT(2);
+	superio_outb(wd->sioaddr, SIO_F81866_REG_PORT_SEL, tmp);
+
+	superio_clear_bit(wd->sioaddr, SIO_F81866_REG_GPIO1, 5);
+}
+
+struct f71808e_variant f71808e_variants[] = {
+	{ SIO_F71808_ID,  "f71808fg", f71808fg_pinconf },
+	{ SIO_F71862_ID,  "f71862fg", f71862fg_pinconf },
+	{ SIO_F71868_ID,  "f71868",   f71868_pinconf },
+	{ SIO_F71869_ID,  "f71869",   f71868_pinconf },
+	{ SIO_F71869A_ID, "f71869",   f71868_pinconf },
+	{ SIO_F71882_ID,  "f71882fg", f71882fg_pinconf },
+	{ SIO_F71889_ID,  "f71889fg", f71889fg_pinconf },
+	{ SIO_F81803_ID,  "f81803",   f81803_pinconf },
+	{ SIO_F81865_ID,  "f81865",   f81865_pinconf },
+	{ SIO_F81866_ID,  "f81866",   f81866_pinconf },
+	/* Confirmed (by datasheet) not to have a watchdog. */
+	{ SIO_F71858_ID,  NULL,       NULL },
+	{ /* sentinel */ }
+};
+
+static struct f71808e_variant __init *f71808e_find(int sioaddr)
 {
+	struct f71808e_variant *variant;
 	u16 devid;
 	int err = superio_enter(sioaddr);
 	if (err)
-		return err;
+		return ERR_PTR(err);
 
 	devid = superio_inw(sioaddr, SIO_REG_MANID);
 	if (devid != SIO_FINTEK_ID) {
 		pr_debug("Not a Fintek device\n");
-		err = -ENODEV;
-		goto exit;
+		superio_exit(sioaddr);
+		return ERR_PTR(-ENODEV);
 	}
 
 	devid = force_id ? force_id : superio_inw(sioaddr, SIO_REG_DEVID);
-	switch (devid) {
-	case SIO_F71808_ID:
-		watchdog.type = f71808fg;
-		break;
-	case SIO_F71862_ID:
-		watchdog.type = f71862fg;
-		break;
-	case SIO_F71868_ID:
-		watchdog.type = f71868;
-		break;
-	case SIO_F71869_ID:
-	case SIO_F71869A_ID:
-		watchdog.type = f71869;
-		break;
-	case SIO_F71882_ID:
-		watchdog.type = f71882fg;
-		break;
-	case SIO_F71889_ID:
-		watchdog.type = f71889fg;
-		break;
-	case SIO_F71858_ID:
-		/* Confirmed (by datasheet) not to have a watchdog. */
-		err = -ENODEV;
-		goto exit;
-	case SIO_F81803_ID:
-		watchdog.type = f81803;
-		break;
-	case SIO_F81865_ID:
-		watchdog.type = f81865;
-		break;
-	case SIO_F81866_ID:
-		watchdog.type = f81866;
-		break;
-	default:
-		pr_info("Unrecognized Fintek device: %04x\n",
-			(unsigned int)devid);
-		err = -ENODEV;
-		goto exit;
+	for (variant = f71808e_variants; variant->id; variant++) {
+		if (variant->id == devid)
+			break;
+	}
+
+	if (!variant->wdt_name) {
+		if (!variant->id)
+			pr_info("Unrecognized Fintek device: %04x\n", devid);
+		superio_exit(sioaddr);
+		return ERR_PTR(-ENODEV);
 	}
 
 	pr_info("Found %s watchdog chip, revision %d\n",
-		f71808e_names[watchdog.type],
-		(int)superio_inb(sioaddr, SIO_REG_DEVREV));
-exit:
+		variant->wdt_name,
+		superio_inb(sioaddr, SIO_REG_DEVREV));
+
 	superio_exit(sioaddr);
-	return err;
+	return variant;
 }
 
 static int __init f71808e_init(void)
 {
 	static const unsigned short addrs[] = { 0x2e, 0x4e };
-	int err = -ENODEV;
+	struct f71808e_variant *variant;
 	int i;
 
 	if (f71862fg_pin != 63 && f71862fg_pin != 56) {
@@ -847,12 +824,14 @@ static int __init f71808e_init(void)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
-		err = f71808e_find(addrs[i]);
-		if (err == 0)
+		variant = f71808e_find(addrs[i]);
+		if (!IS_ERR(variant))
 			break;
 	}
 	if (i == ARRAY_SIZE(addrs))
-		return err;
+		return PTR_ERR(variant);
+
+	watchdog.variant = variant;
 
 	return watchdog_init(addrs[i]);
 }
-- 
2.27.0

