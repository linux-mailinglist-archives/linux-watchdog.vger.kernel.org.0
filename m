Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16B43638BD
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Apr 2021 02:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhDSAIf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 18 Apr 2021 20:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhDSAIf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 18 Apr 2021 20:08:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5410C06174A;
        Sun, 18 Apr 2021 17:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=ckUWDp6KdGDf2T4Dj7yPTgziBC5qaZmyaDlZFbkgFC0=; b=sVL3iXUqRXOpjRaZvdqErX3b0q
        3qK6TOJ+yhXvsPLwjJ1qQas+cLmehHJyd5ZcgKZL5A5mMsOWcWVzS6yqvUCOsX5kS1DPc8DZJHyrh
        LWYgD4bfggzFMKTp9zbkdH70ZjXF6llQVQQYrbILbismpWlFSgtT/PMDRf0GLnBSF+R6t6iWYJGSo
        tFvGFQDsV1cqaTiURhQYzTVwhck69KGN2I2tWKW4by2ay+qjyc3QFo5KtYPr0DwvS7TwKYJ62X727
        L8nkP4/KCTlLE7m9yhbiTFX3eySXm8ED+YPu5ynGecT7jfRSBdKMoyTTAbOECMUd4+Tps1wo8qQaO
        R0rEgB5g==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYHRV-00D04w-1D; Mon, 19 Apr 2021 00:07:26 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: clean up the Kconfig file
Date:   Sun, 18 Apr 2021 17:07:03 -0700
Message-Id: <20210419000704.17745-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Change a non-working ftp: URL to https:.
Wrap long lines earlier.
Spell "IP" with capital letters.
Change "it`s" to "it's". The backtick (grave accent) is not an apostrophe.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/Kconfig |   53 ++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 24 deletions(-)

--- linux-next-20210416.orig/drivers/watchdog/Kconfig
+++ linux-next-20210416/drivers/watchdog/Kconfig
@@ -22,9 +22,9 @@ menuconfig WATCHDOG
 
 	  The watchdog is usually used together with the watchdog daemon
 	  which is available from
-	  <ftp://ibiblio.org/pub/Linux/system/daemons/watchdog/>. This daemon can
-	  also monitor NFS connections and can reboot the machine when the process
-	  table is full.
+	  <https://ibiblio.org/pub/Linux/system/daemons/watchdog/>. This daemon
+	  can also monitor NFS connections and can reboot the machine when the
+	  process table is full.
 
 	  If unsure, say N.
 
@@ -302,7 +302,7 @@ config XILINX_WATCHDOG
 	depends on HAS_IOMEM
 	select WATCHDOG_CORE
 	help
-	  Watchdog driver for the xps_timebase_wdt ip core.
+	  Watchdog driver for the xps_timebase_wdt IP core.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called of_xilinx_wdt.
@@ -404,8 +404,8 @@ config ASM9260_WATCHDOG
 	select WATCHDOG_CORE
 	select RESET_CONTROLLER
 	help
-	  Watchdog timer embedded into Alphascale asm9260 chips. This will reboot your
-	  system when the timeout is reached.
+	  Watchdog timer embedded into Alphascale asm9260 chips. This will
+	  reboot your system when the timeout is reached.
 
 config AT91RM9200_WATCHDOG
 	tristate "AT91RM9200 watchdog"
@@ -548,8 +548,9 @@ config OMAP_WATCHDOG
 	depends on ARCH_OMAP16XX || ARCH_OMAP2PLUS || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
-	  Support for TI OMAP1610/OMAP1710/OMAP2420/OMAP3430/OMAP4430 watchdog.  Say 'Y'
-	  here to enable the OMAP1610/OMAP1710/OMAP2420/OMAP3430/OMAP4430 watchdog timer.
+	  Support for TI OMAP1610/OMAP1710/OMAP2420/OMAP3430/OMAP4430 watchdog.
+	  Say 'Y' here to enable the
+	  OMAP1610/OMAP1710/OMAP2420/OMAP3430/OMAP4430 watchdog timer.
 
 config PNX4008_WATCHDOG
 	tristate "LPC32XX Watchdog"
@@ -1096,13 +1097,16 @@ config SBC_FITPC2_WATCHDOG
 	  This is the driver for the built-in watchdog timer on the fit-PC2,
 	  fit-PC2i, CM-iAM single-board computers made by Compulab.
 
-	  It`s possible to enable watchdog timer either from BIOS (F2) or from booted Linux.
-	  When "Watchdog Timer Value" enabled one can set 31-255 s operational range.
-
-	  Entering BIOS setup temporary disables watchdog operation regardless to current state,
-	  so system will not be restarted while user in BIOS setup.
+	  It's possible to enable the watchdog timer either from BIOS (F2) or
+	  from booted Linux.
+	  When the "Watchdog Timer Value" is enabled one can set 31-255 seconds
+	  operational range.
+
+	  Entering BIOS setup temporarily disables watchdog operation regardless
+	  of current state, so system will not be restarted while user is in
+	  BIOS setup.
 
-	  Once watchdog was enabled the system will be restarted every
+	  Once the watchdog is enabled the system will be restarted every
 	  "Watchdog Timer Value" period, so to prevent it user can restart or
 	  disable the watchdog.
 
@@ -1124,11 +1128,12 @@ config IB700_WDT
 	depends on X86
 	help
 	  This is the driver for the hardware watchdog on the IB700 Single
-	  Board Computer produced by TMC Technology (www.tmc-uk.com). This watchdog
-	  simply watches your kernel to make sure it doesn't freeze, and if
-	  it does, it reboots your computer after a certain amount of time.
+	  Board Computer produced by TMC Technology (www.tmc-uk.com). This
+	  watchdog simply watches your kernel to make sure it doesn't freeze,
+	  and if it does, it reboots your computer after a certain amount of time.
 
-	  This driver is like the WDT501 driver but for slightly different hardware.
+	  This driver is like the WDT501 driver but for slightly different
+	  hardware.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called ib700wdt.
@@ -1807,10 +1812,10 @@ config PIC32_DMT
 	select WATCHDOG_CORE
 	depends on MACH_PIC32 || (MIPS && COMPILE_TEST)
 	help
-	  Watchdog driver for PIC32 instruction fetch counting timer. This specific
-	  timer is typically be used in misson critical and safety critical
-	  applications, where any single failure of the software functionality
-	  and sequencing must be detected.
+	  Watchdog driver for PIC32 instruction fetch counting timer. This
+	  specific timer is typically be used in mission critical and safety
+	  critical applications, where any single failure of the software
+	  functionality and sequencing must be detected.
 
 	  To compile this driver as a loadable module, choose M here.
 	  The module will be called pic32-dmt.
@@ -2013,8 +2018,8 @@ config PCWATCHDOG
 	  This card simply watches your kernel to make sure it doesn't freeze,
 	  and if it does, it reboots your computer after a certain amount of
 	  time. This driver is like the WDT501 driver but for different
-	  hardware. Please read <file:Documentation/watchdog/pcwd-watchdog.rst>. The PC
-	  watchdog cards can be ordered from <http://www.berkprod.com/>.
+	  hardware. Please read <file:Documentation/watchdog/pcwd-watchdog.rst>.
+	  The PC watchdog cards can be ordered from <http://www.berkprod.com/>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called pcwd.
