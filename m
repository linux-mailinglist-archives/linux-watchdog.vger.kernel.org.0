Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FCF7CA92F
	for <lists+linux-watchdog@lfdr.de>; Mon, 16 Oct 2023 15:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbjJPNRB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 16 Oct 2023 09:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbjJPNRB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 16 Oct 2023 09:17:01 -0400
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 83579AB
        for <linux-watchdog@vger.kernel.org>; Mon, 16 Oct 2023 06:16:56 -0700 (PDT)
Received: from [172.16.0.112] (unknown [91.223.201.37])
        by srv.wefi.net (Postfix) with ESMTPSA id 030545A3587;
        Mon, 16 Oct 2023 15:16:54 +0200 (CEST)
Message-ID: <87b1c97177c43eeec640483cc2f83f5f4d7b1060.camel@wefi.net>
Subject: [RFC] improve it87_wdt (IT8784/IT8786) / keeping WDTCTRL unchanged
 / deactivate watchdog by setting WDTVALLSB/WDTVALMSB 0
From:   Werner Fischer <devlists@wefi.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hanspeter Portner <dev@open-music-kontrollers.ch>,
        linux-watchdog@vger.kernel.org
Date:   Mon, 16 Oct 2023 15:16:54 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, hi Hanspeter,

I currently testing two devices with IT8784 and IT8786 watchdog timers.
Although the chips are supported by it87_wdt.c after Hanspeter's
patches back in 2020, the watchdog functionality does not work in my
following test:
- Debian 12 using Kernel 6.1.58 or current 6.6-rc
- loading module it87_wdt
- starting wd_keepalive Deamon
- killing wd_keepalive using signal 9
-> system keeps on running even after the configured watchdog timeout

For debugging purposes, I have used the patch below to report the
content of the watchdog registers 0x71 (WDTCTRL), 0x72 (WDTCFG), 0x73
(WDTVALLSB), and 0x74 (WDTVALMSB) to the system log.

It turned out, that 0x71 (WDTCTRL) has initially the following value
set (before the module changes it to 0x00):
- 8 decimal (IT8784 / IT8786)
- 4 decimal (IT8613)

I figured out, that the following code line makes the watchdog of
IT8784 and IT8786 non-functional for me:
  superio_outb(0x00, WDTCTRL);
I have removed this code in my patch below, then the watchdog works for
IT8784 and IT8786.

I'm not sure, why the WDTCTRL register is set to 0x00 in the code. As
it seems, the register can have different meanings for differnt IT8xxx
chips. Accoring to [1] it seems sufficient to set both WDTVALLSB and
WDTVALMSB to 0x00 to deactivate the watchdog timer: "When the WDT Time-
out Value register is set to a non-zero value, the WDT loads the value
and begin counting down from the value."
This happens e.g. also when wd_keepalive is stopped cleanly.

I am open to support to improve the it87_wdt code.

But before I'm writing and sending a patch, I have the following
question:
* What is the reason, why WDTCTRL is set to 0x00 in the code? and
* Could we think about removing this (at least for IT8784/8786)?

Best regards,
Werner

[1] https://www.ite.com.tw/uploads/product_download/IT8781_A_V0.2.2_121712.pdf
---
diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index bb1122909396..4ea5505b1771 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -50,6 +50,7 @@
 /* Chip Id numbers */
 #define NO_DEV_ID	0xffff
 #define IT8607_ID	0x8607
+#define IT8613_ID	0x8613
 #define IT8620_ID	0x8620
 #define IT8622_ID	0x8622
 #define IT8625_ID	0x8625
@@ -152,9 +153,26 @@ static inline int superio_inw(int reg)
 	return val;
 }
 
+static void wdt_debug_registers(unsigned int debugstage)
+{
+	unsigned int wdt_ctrl;
+	unsigned int wdt_cfg;
+	unsigned int wdt_vallsb;
+	unsigned int wdt_valmsb;
+	wdt_ctrl = superio_inb(WDTCTRL);
+	wdt_cfg = superio_inb(WDTCFG);
+	wdt_vallsb = superio_inb(WDTVALLSB);
+	wdt_valmsb = superio_inb(WDTVALMSB);
+	pr_info("DEBUG at stage %d: wdt_ctrl=%d; wdt_cfg=%d; wdt_vallsb=%d, wdt_valmsb=%d\n", debugstage, wdt_ctrl, wdt_cfg, wdt_vallsb, wdt_valmsb);
+}
+
 /* Internal function, should be called after superio_select(GPIO) */
 static void _wdt_update_timeout(unsigned int t)
 {
+	wdt_debug_registers(3);
+	/* test werner reset */
+	/* superio_outb(0x00, WDTCTRL); */
+	wdt_debug_registers(9);
 	unsigned char cfg = WDT_KRST;
 
 	if (testmode)
@@ -172,6 +190,7 @@ static void _wdt_update_timeout(unsigned int t)
 	superio_outb(t, WDTVALLSB);
 	if (max_units > 255)
 		superio_outb(t >> 8, WDTVALMSB);
+	wdt_debug_registers(4);
 }
 
 static int wdt_update_timeout(unsigned int t)
@@ -258,11 +277,13 @@ static int __init it87_wdt_init(void)
 	int rc;
 
 	rc = superio_enter();
+	wdt_debug_registers(0);
 	if (rc)
 		return rc;
 
 	chip_type = superio_inw(CHIPID);
 	chip_rev  = superio_inb(CHIPREV) & 0x0f;
+	wdt_debug_registers(1);
 	superio_exit();
 
 	switch (chip_type) {
@@ -274,9 +295,8 @@ static int __init it87_wdt_init(void)
 		break;
 	case IT8716_ID:
 	case IT8726_ID:
-		max_units = 65535;
-		break;
 	case IT8607_ID:
+	case IT8613_ID:
 	case IT8620_ID:
 	case IT8622_ID:
 	case IT8625_ID:
@@ -310,10 +330,12 @@ static int __init it87_wdt_init(void)
 	rc = superio_enter();
 	if (rc)
 		return rc;
-
+	wdt_debug_registers(10);
 	superio_select(GPIO);
+	wdt_debug_registers(11);
 	superio_outb(WDT_TOV1, WDTCFG);
-	superio_outb(0x00, WDTCTRL);
+	/* superio_outb(0x00, WDTCTRL); */
+	wdt_debug_registers(2);
 	superio_exit();
 
 	if (timeout < 1 || timeout > max_units * 60) {

