Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5EF426D73
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 17:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbhJHP2h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 11:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242662AbhJHP2g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 11:28:36 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2EC0C061570;
        Fri,  8 Oct 2021 08:26:40 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so12130235otx.3;
        Fri, 08 Oct 2021 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvz43kIUDx2A/KQ/yd0MvjWPXZHEOVXQfe4FngXFlq8=;
        b=X0ldjGNKnezUXNARMpk6TRcMW7NFmpqVCL/GWgpNxFbIo2JKPcwtp8oNh57J9He9CU
         LtnxH2cxRbifffpfc4Z6qVuGcoFU7y2WTs4jJoEgL3iYTtx+EB/Z66l13OxYJCIURi2b
         CZdQbjMGEpOglZPG74jlzKv/u7ELC0bu0s6qWXEZvfQ8WlTpEunSIdDyAPMKdSbCMssR
         9HiyNugCalgvas8rCGkyIvZJcoPyq4yg+REGDmMlY96PYGoeLbdcBkzJ5cj/vKltV35y
         Lc4lBjIcC8YVUNvM9O17S+/6ofz3kby/cVYsCiBa3lM8EaFuBCxzmvswu+2OW4d/r0PZ
         uL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rvz43kIUDx2A/KQ/yd0MvjWPXZHEOVXQfe4FngXFlq8=;
        b=Koq/1ofwqK5keJWHAEFfbX4QZmQ0FuqiwG+rVjYCw+qwajvUE7viLlg/L9zPYZDUSk
         Mh75aVHBt42utwc7GJwrWKIcEiAOPDI3Hxp/5skikAvmvUicKkOacy3BsFOsQxb1KYV7
         IZ0n089lupYHfKsu2SuNFWkj8Jx+RHvxDU4UL7MdAMhBNO8mY8qIuuGPQufOMExAF5WW
         Cxfna/RzYYaEawqY781Qdmxv7kQpcn1GVgyBNo4Rs0q76vCMlovLTiGW+Rpud3C+QYdw
         G3SbC1j8e8uCj34uVAgCLlrD7NP25aiAqkeMsptMZFNUDNDQB7PTp/iNCEVi/oT56EFK
         SIHw==
X-Gm-Message-State: AOAM530de9TC+BHlqQCU6/+r+6BBXDJh1kvWxSWXigQgrZyBmLeoHKlM
        izRJX+T3jkVRN2qeCXlFjQo=
X-Google-Smtp-Source: ABdhPJw+EvQ4XzcqKqv+C3eDJNaUDeC9Zt8rH791fXa4t4L8/Rdpb5n7rOUKU64MTQ/HplhXWR1abg==
X-Received: by 2002:a9d:6158:: with SMTP id c24mr8966242otk.197.1633706800165;
        Fri, 08 Oct 2021 08:26:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r4sm732540oiw.36.2021.10.08.08.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:26:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: iTCO: Drop vendor support
Date:   Fri,  8 Oct 2021 08:26:37 -0700
Message-Id: <20211008152637.141673-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

iTCO vendor support was introduced in 2006 to support SuperMicro boards
with Pentium 3 CPUs. It was extended in 2009 to support motherbords
with broken BIOS (specifically Intel DG33TL). The code is long since
obsolete, so let's drop support for it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 .../watchdog/watchdog-parameters.rst          |   7 -
 drivers/watchdog/Kconfig                      |   8 -
 drivers/watchdog/Makefile                     |   3 -
 drivers/watchdog/iTCO_vendor.h                |  14 --
 drivers/watchdog/iTCO_vendor_support.c        | 216 ------------------
 drivers/watchdog/iTCO_wdt.c                   |  17 --
 6 files changed, 265 deletions(-)
 delete mode 100644 drivers/watchdog/iTCO_vendor.h
 delete mode 100644 drivers/watchdog/iTCO_vendor_support.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 223c99361a30..60ecbd53e6aa 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -219,13 +219,6 @@ iTCO_wdt:
 
 -------------------------------------------------
 
-iTCO_vendor_support:
-    vendorsupport:
-	iTCO vendor specific support mode, default=0 (none),
-	1=SuperMicro Pent3, 2=SuperMicro Pent4+, 911=Broken SMI BIOS
-
--------------------------------------------------
-
 ib700wdt:
     timeout:
 	Watchdog timeout in seconds. 0<= timeout <=30, default=30.
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..3fae89be0e27 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1233,14 +1233,6 @@ config ITCO_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called iTCO_wdt.
 
-config ITCO_VENDOR_SUPPORT
-	bool "Intel TCO Timer/Watchdog Specific Vendor Support"
-	depends on ITCO_WDT
-	help
-	  Add vendor specific support to the intel TCO timer based watchdog
-	  devices. At this moment we only have additional support for some
-	  SuperMicro Inc. motherboards.
-
 config IT8712F_WDT
 	tristate "IT8712F (Smart Guardian) Watchdog Timer"
 	depends on X86
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 1bd2d6f37c53..b05a7e611308 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -113,9 +113,6 @@ obj-$(CONFIG_WAFER_WDT) += wafer5823wdt.o
 obj-$(CONFIG_I6300ESB_WDT) += i6300esb.o
 obj-$(CONFIG_IE6XX_WDT) += ie6xx_wdt.o
 obj-$(CONFIG_ITCO_WDT) += iTCO_wdt.o
-ifeq ($(CONFIG_ITCO_VENDOR_SUPPORT),y)
-obj-$(CONFIG_ITCO_WDT) += iTCO_vendor_support.o
-endif
 obj-$(CONFIG_IT8712F_WDT) += it8712f_wdt.o
 obj-$(CONFIG_IT87_WDT) += it87_wdt.o
 obj-$(CONFIG_HP_WATCHDOG) += hpwdt.o
diff --git a/drivers/watchdog/iTCO_vendor.h b/drivers/watchdog/iTCO_vendor.h
deleted file mode 100644
index 69e92e692ae0..000000000000
--- a/drivers/watchdog/iTCO_vendor.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* iTCO Vendor Specific Support hooks */
-#ifdef CONFIG_ITCO_VENDOR_SUPPORT
-extern int iTCO_vendorsupport;
-extern void iTCO_vendor_pre_start(struct resource *, unsigned int);
-extern void iTCO_vendor_pre_stop(struct resource *);
-extern int iTCO_vendor_check_noreboot_on(void);
-#else
-#define iTCO_vendorsupport				0
-#define iTCO_vendor_pre_start(acpibase, heartbeat)	{}
-#define iTCO_vendor_pre_stop(acpibase)			{}
-#define iTCO_vendor_check_noreboot_on()			1
-				/* 1=check noreboot; 0=don't check */
-#endif
diff --git a/drivers/watchdog/iTCO_vendor_support.c b/drivers/watchdog/iTCO_vendor_support.c
deleted file mode 100644
index cf0eaa04b064..000000000000
--- a/drivers/watchdog/iTCO_vendor_support.c
+++ /dev/null
@@ -1,216 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- *	intel TCO vendor specific watchdog driver support
- *
- *	(c) Copyright 2006-2009 Wim Van Sebroeck <wim@iguana.be>.
- *
- *	Neither Wim Van Sebroeck nor Iguana vzw. admit liability nor
- *	provide warranty for any of this software. This material is
- *	provided "AS-IS" and at no charge.
- */
-
-/*
- *	Includes, defines, variables, module parameters, ...
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-/* Module and version information */
-#define DRV_NAME	"iTCO_vendor_support"
-#define DRV_VERSION	"1.04"
-
-/* Includes */
-#include <linux/module.h>		/* For module specific items */
-#include <linux/moduleparam.h>		/* For new moduleparam's */
-#include <linux/types.h>		/* For standard types (like size_t) */
-#include <linux/errno.h>		/* For the -ENODEV/... values */
-#include <linux/kernel.h>		/* For printk/panic/... */
-#include <linux/init.h>			/* For __init/__exit/... */
-#include <linux/ioport.h>		/* For io-port access */
-#include <linux/io.h>			/* For inb/outb/... */
-
-#include "iTCO_vendor.h"
-
-/* List of vendor support modes */
-/* SuperMicro Pentium 3 Era 370SSE+-OEM1/P3TSSE */
-#define SUPERMICRO_OLD_BOARD	1
-/* SuperMicro Pentium 4 / Xeon 4 / EMT64T Era Systems - no longer supported */
-#define SUPERMICRO_NEW_BOARD	2
-/* Broken BIOS */
-#define BROKEN_BIOS		911
-
-int iTCO_vendorsupport;
-EXPORT_SYMBOL(iTCO_vendorsupport);
-
-module_param_named(vendorsupport, iTCO_vendorsupport, int, 0);
-MODULE_PARM_DESC(vendorsupport, "iTCO vendor specific support mode, default="
-			"0 (none), 1=SuperMicro Pent3, 911=Broken SMI BIOS");
-
-/*
- *	Vendor Specific Support
- */
-
-/*
- *	Vendor Support: 1
- *	Board: Super Micro Computer Inc. 370SSE+-OEM1/P3TSSE
- *	iTCO chipset: ICH2
- *
- *	Code contributed by: R. Seretny <lkpatches@paypc.com>
- *	Documentation obtained by R. Seretny from SuperMicro Technical Support
- *
- *	To enable Watchdog function:
- *	    BIOS setup -> Power -> TCO Logic SMI Enable -> Within5Minutes
- *	    This setting enables SMI to clear the watchdog expired flag.
- *	    If BIOS or CPU fail which may cause SMI hang, then system will
- *	    reboot. When application starts to use watchdog function,
- *	    application has to take over the control from SMI.
- *
- *	    For P3TSSE, J36 jumper needs to be removed to enable the Watchdog
- *	    function.
- *
- *	    Note: The system will reboot when Expire Flag is set TWICE.
- *	    So, if the watchdog timer is 20 seconds, then the maximum hang
- *	    time is about 40 seconds, and the minimum hang time is about
- *	    20.6 seconds.
- */
-
-static void supermicro_old_pre_start(struct resource *smires)
-{
-	unsigned long val32;
-
-	/* Bit 13: TCO_EN -> 0 = Disables TCO logic generating an SMI# */
-	val32 = inl(smires->start);
-	val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
-	outl(val32, smires->start);	/* Needed to activate watchdog */
-}
-
-static void supermicro_old_pre_stop(struct resource *smires)
-{
-	unsigned long val32;
-
-	/* Bit 13: TCO_EN -> 1 = Enables the TCO logic to generate SMI# */
-	val32 = inl(smires->start);
-	val32 |= 0x00002000;	/* Turn on SMI clearing watchdog */
-	outl(val32, smires->start);	/* Needed to deactivate watchdog */
-}
-
-/*
- *	Vendor Support: 911
- *	Board: Some Intel ICHx based motherboards
- *	iTCO chipset: ICH7+
- *
- *	Some Intel motherboards have a broken BIOS implementation: i.e.
- *	the SMI handler clear's the TIMEOUT bit in the TC01_STS register
- *	and does not reload the time. Thus the TCO watchdog does not reboot
- *	the system.
- *
- *	These are the conclusions of Andriy Gapon <avg@icyb.net.ua> after
- *	debugging: the SMI handler is quite simple - it tests value in
- *	TCO1_CNT against 0x800, i.e. checks TCO_TMR_HLT. If the bit is set
- *	the handler goes into an infinite loop, apparently to allow the
- *	second timeout and reboot. Otherwise it simply clears TIMEOUT bit
- *	in TCO1_STS and that's it.
- *	So the logic seems to be reversed, because it is hard to see how
- *	TIMEOUT can get set to 1 and SMI generated when TCO_TMR_HLT is set
- *	(other than a transitional effect).
- *
- *	The only fix found to get the motherboard(s) to reboot is to put
- *	the glb_smi_en bit to 0. This is a dirty hack that bypasses the
- *	broken code by disabling Global SMI.
- *
- *	WARNING: globally disabling SMI could possibly lead to dramatic
- *	problems, especially on laptops! I.e. various ACPI things where
- *	SMI is used for communication between OS and firmware.
- *
- *	Don't use this fix if you don't need to!!!
- */
-
-static void broken_bios_start(struct resource *smires)
-{
-	unsigned long val32;
-
-	val32 = inl(smires->start);
-	/* Bit 13: TCO_EN     -> 0 = Disables TCO logic generating an SMI#
-	   Bit  0: GBL_SMI_EN -> 0 = No SMI# will be generated by ICH. */
-	val32 &= 0xffffdffe;
-	outl(val32, smires->start);
-}
-
-static void broken_bios_stop(struct resource *smires)
-{
-	unsigned long val32;
-
-	val32 = inl(smires->start);
-	/* Bit 13: TCO_EN     -> 1 = Enables TCO logic generating an SMI#
-	   Bit  0: GBL_SMI_EN -> 1 = Turn global SMI on again. */
-	val32 |= 0x00002001;
-	outl(val32, smires->start);
-}
-
-/*
- *	Generic Support Functions
- */
-
-void iTCO_vendor_pre_start(struct resource *smires,
-			   unsigned int heartbeat)
-{
-	switch (iTCO_vendorsupport) {
-	case SUPERMICRO_OLD_BOARD:
-		supermicro_old_pre_start(smires);
-		break;
-	case BROKEN_BIOS:
-		broken_bios_start(smires);
-		break;
-	}
-}
-EXPORT_SYMBOL(iTCO_vendor_pre_start);
-
-void iTCO_vendor_pre_stop(struct resource *smires)
-{
-	switch (iTCO_vendorsupport) {
-	case SUPERMICRO_OLD_BOARD:
-		supermicro_old_pre_stop(smires);
-		break;
-	case BROKEN_BIOS:
-		broken_bios_stop(smires);
-		break;
-	}
-}
-EXPORT_SYMBOL(iTCO_vendor_pre_stop);
-
-int iTCO_vendor_check_noreboot_on(void)
-{
-	switch (iTCO_vendorsupport) {
-	case SUPERMICRO_OLD_BOARD:
-		return 0;
-	default:
-		return 1;
-	}
-}
-EXPORT_SYMBOL(iTCO_vendor_check_noreboot_on);
-
-static int __init iTCO_vendor_init_module(void)
-{
-	if (iTCO_vendorsupport == SUPERMICRO_NEW_BOARD) {
-		pr_warn("Option vendorsupport=%d is no longer supported, "
-			"please use the w83627hf_wdt driver instead\n",
-			SUPERMICRO_NEW_BOARD);
-		return -EINVAL;
-	}
-	pr_info("vendor-support=%d\n", iTCO_vendorsupport);
-	return 0;
-}
-
-static void __exit iTCO_vendor_exit_module(void)
-{
-	pr_info("Module Unloaded\n");
-}
-
-module_init(iTCO_vendor_init_module);
-module_exit(iTCO_vendor_exit_module);
-
-MODULE_AUTHOR("Wim Van Sebroeck <wim@iguana.be>, "
-		"R. Seretny <lkpatches@paypc.com>");
-MODULE_DESCRIPTION("Intel TCO Vendor Specific WatchDog Timer Driver Support");
-MODULE_VERSION(DRV_VERSION);
-MODULE_LICENSE("GPL");
diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index ced2fc0deb8c..fc0ed665f7db 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -64,8 +64,6 @@
 #include <linux/platform_data/itco_wdt.h>
 #include <linux/mfd/intel_pmc_bxt.h>
 
-#include "iTCO_vendor.h"
-
 /* Address definitions for the TCO */
 /* TCO base address */
 #define TCOBASE(p)	((p)->tco_res->start)
@@ -272,8 +270,6 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
 
 	spin_lock(&p->io_lock);
 
-	iTCO_vendor_pre_start(p->smi_res, wd_dev->timeout);
-
 	/* disable chipset's NO_REBOOT bit */
 	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
 		spin_unlock(&p->io_lock);
@@ -307,8 +303,6 @@ static int iTCO_wdt_stop(struct watchdog_device *wd_dev)
 
 	spin_lock(&p->io_lock);
 
-	iTCO_vendor_pre_stop(p->smi_res);
-
 	/* Bit 11: TCO Timer Halt -> 1 = The TCO timer is disabled */
 	val = inw(TCO1_CNT(p));
 	val |= 0x0800;
@@ -483,10 +477,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 			       (u64)SMI_EN(p));
 			return -EBUSY;
 		}
-	} else if (iTCO_vendorsupport ||
-		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
-		dev_err(dev, "SMI I/O resource is missing\n");
-		return -ENODEV;
 	}
 
 	iTCO_wdt_no_reboot_bit_setup(p, pdev, pdata);
@@ -505,13 +495,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 			return PTR_ERR(p->gcs_pmc);
 	}
 
-	/* Check chipset's NO_REBOOT bit */
-	if (p->update_no_reboot_bit(p->no_reboot_priv, false) &&
-	    iTCO_vendor_check_noreboot_on()) {
-		dev_info(dev, "unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
-		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
-	}
-
 	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
 	p->update_no_reboot_bit(p->no_reboot_priv, true);
 
-- 
2.33.0

