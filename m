Return-Path: <linux-watchdog+bounces-4616-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE9C6B749
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 20:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6EB7934329C
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Nov 2025 19:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18AE240611;
	Tue, 18 Nov 2025 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCEd9IFn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A56E2EDD6F
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763494208; cv=none; b=kqzMejVOfp9vmJIbn0roaKIfwBljb3537hxPW5ZdHwOjuhFqCvYXvVl4cFGrZ9dhOp+7sw+a6oNIxxyV/4jsIKDaIJ41I9pqq3PrebNKXJ9L+GJATCX6Kn1IrMOHfFoTh5skSSnHfXPqZ+qKICvsAGyK+Bf+oL/5tUoL53mikho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763494208; c=relaxed/simple;
	bh=BDmwYdodm5ybr3jokc0ci9os6H3SUrfFrHHYg3aNBts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ng2i5dG/A66QmOWbb58bY25jHjMOaYZz4ACKhIf4WjqKHAqWgg6ts0W6FEBNYguzMqYBqat0rh0BSNm04Q20HMpK1zrhES4aSc8w35XZ8VODg9vkMBjSWA0wxl/l9/AshXDKI76u18zbz4hINS/Ab3QahkdGP5pjl048mtPJJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCEd9IFn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ba599137cf8so113716a12.0
        for <linux-watchdog@vger.kernel.org>; Tue, 18 Nov 2025 11:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763494202; x=1764099002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IPA2qG9Moyv81DGwZs8rRFNaKgQiqJZSwK+j3lZBua0=;
        b=MCEd9IFnn9zuA5yP7GwIBXunEOBBokVfB6/PM7F+LhFBLNBzZsG/MqZOfljbZ0Gtjd
         2g20HgFXh6LLWkDUW6pK2kkXudzNQlQetWZ8s255nL9giWP/hm+Ox+yyPe6srQbhpwrG
         NaPx4pcOY9wBL+JdLt+3zWj4hhf6UlJyr5PqjvLqIcSILEcEyuBayYyg1ScJCCH3+Txh
         SNmzrkcVwnqKwq3MUsXtPRFPkYVM2eBIlsk7MkEDttPy/nYa7b+gwkhc7P3ipVKNXvC7
         J8/ZmicwsBoadBpfj1oZO9WqdoXBUjfUwWoFicnjliS5X5cU97HSj/jWegh2+jkwFSfF
         9Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763494202; x=1764099002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPA2qG9Moyv81DGwZs8rRFNaKgQiqJZSwK+j3lZBua0=;
        b=MjJjpQaUgr+LSCSeBc6AFPD+vA86KwLnx8Bz0K5PYiYhm/jBlAsLeRHLYJU1lVZHaD
         HJlGAwwpU6B+oCLMI/ZiGV1B0+R+T8SECb7dh8YmXYYM07vaAcfHo2mpEEe25aEdA4Ra
         Pp90PodT/kTKpWnc/GLqwR3kMdR0Oz0N5AAYH8/A9bS5i2Ki8DkgfpV1CuTQDThuDlf1
         zk1OHFeUrygALEf0SSsLZC+1yv7e+KZ/5/zYPb6i3CpGiLEuhKSBwtISw7YesJvnTEML
         qXnlOhTwK1rWXo01SVbf1n8hMa0EkrxCXeAS5EHuoI0GgweoP5vXmFmaj3CQzSLbbV3P
         BxjA==
X-Gm-Message-State: AOJu0YySgTQMSScMOtslP3DQYckBbDc78g4hZIjO75NOm3mbMMWPnP8u
	F1Qz/WrIKYOjB+EXDI+0LTYoPnOjFU4qEQPiGaib1gGwfx4OxP90wE08
X-Gm-Gg: ASbGncvPnDmG8l3UWq/9XYqErhIy0rbLbGrrGaWOtfqGweJtpJYTHBKfnF+i+luwdex
	nGZTCL3+lWAH68UoxLk+0T6sDGhsLPtmvbGcphAuyZEGVYQeo3yWZgTzgYSY3znkiv4iSBfpiR2
	BWrz9Tf9BKRfAlG8KDyDrvQxG9HlOv9ALj/4NjlpiBqZ0XLZpmGiaOS9lOCKOToSSCCpveEg6TJ
	j5UmqajQaPTNe4FPo7R6poggEvmgegkTvXVMkdnymVVi0xs+4BgY5yZNjmIkGLUw9lD/g2WqvIk
	IzKK5eb4QLZl6HHUIzoLn45hsKOONKBICorRHunRxP93YyxslqGQgHiHvjlDZZf4HDLX3QISm6s
	NNLZwQDm6TQzLQdsQqBzGdCPGP8E7Wz5MK65AJnl9/Vrp7sGjeHzNoCN0OPPLcmelbgO7yCw4Uy
	BBQ9/BSILUI4incft8wVDSGwREgyvjTNdWQw==
X-Google-Smtp-Source: AGHT+IEYyqyxrekNLLE1xkrzbw54yEyRhPZcZk852lWWQerxTs9vRbOEwlVri/S0gPP+iwMfqar/Mg==
X-Received: by 2002:a05:7022:424:b0:119:e569:f85d with SMTP id a92af1059eb24-11c8d971f75mr9835c88.20.1763494202164;
        Tue, 18 Nov 2025 11:30:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db102f5sm48656893eec.4.2025.11.18.11.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:30:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] watchdog: iTCO: Drop vendor support
Date: Tue, 18 Nov 2025 11:29:58 -0800
Message-ID: <20251118192959.2333461-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iTCO vendor support was introduced in 2006 to support SuperMicro boards
with Pentium 3 CPUs. It was extended in 2009 to support motherbords
with broken BIOS (specifically Intel DG33TL). The code is long since
obsolete, so let's drop support for it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased on top of v6.18-rc6
- The checks for turn_SMI_watchdog_clear_off and for update_no_reboot_bit
  in the probe function are still needed.

 .../watchdog/watchdog-parameters.rst          |   7 -
 drivers/watchdog/Kconfig                      |   8 -
 drivers/watchdog/Makefile                     |   3 -
 drivers/watchdog/iTCO_vendor.h                |  14 --
 drivers/watchdog/iTCO_vendor_support.c        | 216 ------------------
 drivers/watchdog/iTCO_wdt.c                   |  12 +-
 6 files changed, 2 insertions(+), 258 deletions(-)
 delete mode 100644 drivers/watchdog/iTCO_vendor.h
 delete mode 100644 drivers/watchdog/iTCO_vendor_support.c

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 0a0119edfa82..773241ed9986 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -209,13 +209,6 @@ iTCO_wdt:
 
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
index 05008d937e40..56d52345c579 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1421,14 +1421,6 @@ config ITCO_WDT
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
 	depends on (X86 || COMPILE_TEST) && HAS_IOPORT
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index b680e4d3c1bc..94cef662621a 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -126,9 +126,6 @@ obj-$(CONFIG_IE6XX_WDT) += ie6xx_wdt.o
 obj-$(CONFIG_ITCO_WDT) += iTCO_wdt.o
 obj-$(CONFIG_LENOVO_SE10_WDT) += lenovo_se10_wdt.o
 obj-$(CONFIG_LENOVO_SE30_WDT) += lenovo_se30_wdt.o
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
index 4ab3405ef8e6..1dec9cd155b1 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -63,8 +63,6 @@
 #include <linux/platform_data/itco_wdt.h>
 #include <linux/mfd/intel_pmc_bxt.h>
 
-#include "iTCO_vendor.h"
-
 /* Address definitions for the TCO */
 /* TCO base address */
 #define TCOBASE(p)	((p)->tco_res->start)
@@ -283,8 +281,6 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
 	struct iTCO_wdt_private *p = watchdog_get_drvdata(wd_dev);
 	unsigned int val;
 
-	iTCO_vendor_pre_start(p->smi_res, wd_dev->timeout);
-
 	/* disable chipset's NO_REBOOT bit */
 	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
 		dev_err(wd_dev->parent, "failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
@@ -314,8 +310,6 @@ static int iTCO_wdt_stop(struct watchdog_device *wd_dev)
 	struct iTCO_wdt_private *p = watchdog_get_drvdata(wd_dev);
 	unsigned int val;
 
-	iTCO_vendor_pre_stop(p->smi_res);
-
 	/* Bit 11: TCO Timer Halt -> 1 = The TCO timer is disabled */
 	val = inw(TCO1_CNT(p));
 	val |= 0x0800;
@@ -488,8 +482,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 			       (u64)SMI_EN(p));
 			return -EBUSY;
 		}
-	} else if (iTCO_vendorsupport ||
-		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
+	} else if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
 		dev_err(dev, "SMI I/O resource is missing\n");
 		return -ENODEV;
 	}
@@ -508,8 +501,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	}
 
 	/* Check chipset's NO_REBOOT bit */
-	if (p->update_no_reboot_bit(p->no_reboot_priv, false) &&
-	    iTCO_vendor_check_noreboot_on()) {
+	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
 		dev_info(dev, "unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
 		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
 	}
-- 
2.45.2


