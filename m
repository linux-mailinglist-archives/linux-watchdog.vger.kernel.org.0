Return-Path: <linux-watchdog+bounces-2211-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D999E5F9
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E432A1F2499C
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Oct 2024 11:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC911684A3;
	Tue, 15 Oct 2024 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KqgOb0G9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ATbUrarh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KqgOb0G9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ATbUrarh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A7E15099D;
	Tue, 15 Oct 2024 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992228; cv=none; b=WWgJcDTBICd4ZtewqmOTPYvt2+Gh9IC4mYHH7ltlrVmT+ZR6IAK6XLaXmoEu1SLruuK4a5Xy/m3YHa5jh+aURnrd9/6Rf+NGVsD5PnVSmmTc6HXYSnabcCqYcV5Ti9e2JqORxru0nJYkPWfjBLiZhQodJCYmcxADxWA2ZFLIwak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992228; c=relaxed/simple;
	bh=aplW5bYtHU/uFNBaJReDdM5cfWzVib2S0Vrzrc6pY64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fjn28e/KYYSwfwtKlOJ0m7n84RjcJqY93tPBUcLl2wZXt9vJF9ikz2nLjlTxLvynBFe/uuiHaYTBuQLJntg8kmeNpxrKp4JxasOb6/L8ofuYw0Xu9bQEN6H4YAVgZa7n2FTe+F4S08DjCYo/FAASrnWpVfEnve3K9Z9//dbc3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KqgOb0G9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ATbUrarh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KqgOb0G9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ATbUrarh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6189C1F7F5;
	Tue, 15 Oct 2024 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728992223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+sQXdKymwWRuf5qHdy/njUd3+BhWuLuFVui8CKEVvUY=;
	b=KqgOb0G9hV6KIcc6aNtPmuFp+XxGA7VCQ1C71IL3p0tdxEheaxC+daTseQiBrOEw9LCMME
	quu474F5+SX07Gh7jPqpyZFwd+jJYuiQbRTfxi0j3c7FW8HM7mA1ya8hVQlY0gMD3uXN/J
	BRGSWcTsY/QteEaZWSQTuoEFbtiRzP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728992223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+sQXdKymwWRuf5qHdy/njUd3+BhWuLuFVui8CKEVvUY=;
	b=ATbUrarhxn74vT3lDupba3OYOYXuDOx7SExBmW+cyHwQlaHQuXDO0hg5nk8vr25d6bcy2I
	RWMghJWeQ3vggTCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KqgOb0G9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ATbUrarh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728992223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+sQXdKymwWRuf5qHdy/njUd3+BhWuLuFVui8CKEVvUY=;
	b=KqgOb0G9hV6KIcc6aNtPmuFp+XxGA7VCQ1C71IL3p0tdxEheaxC+daTseQiBrOEw9LCMME
	quu474F5+SX07Gh7jPqpyZFwd+jJYuiQbRTfxi0j3c7FW8HM7mA1ya8hVQlY0gMD3uXN/J
	BRGSWcTsY/QteEaZWSQTuoEFbtiRzP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728992223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+sQXdKymwWRuf5qHdy/njUd3+BhWuLuFVui8CKEVvUY=;
	b=ATbUrarhxn74vT3lDupba3OYOYXuDOx7SExBmW+cyHwQlaHQuXDO0hg5nk8vr25d6bcy2I
	RWMghJWeQ3vggTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A81113A42;
	Tue, 15 Oct 2024 11:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lhtXCN9TDmccTAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 15 Oct 2024 11:37:03 +0000
Date: Tue, 15 Oct 2024 13:37:01 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] watchdog: Delete the cpu5wdt driver
Message-ID: <20241015133701.35e26fe5@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6189C1F7F5
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This driver has a number of issues (accesses arbitrary I/O ports
without identifying the hardware, doesn't document what hardware it
supports, suspiciously inconsistent locking model, doesn't implement
WDIOC_SETTIMEOUT, potential integer overflow...)

The driver was added in 2003 and there's no evidence that it has any
recent user, all changes seem to be tree-wide, subsystem-wide, or the
result of static code analysis. So I believe we should simply drop
this legacy piece of code.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Message-ID: <20241011170710.484a257a@endymion.delvare>
---
 Documentation/watchdog/watchdog-parameters.rst |   10 
 drivers/watchdog/Kconfig                       |    8 
 drivers/watchdog/Makefile                      |    1 
 drivers/watchdog/cpu5wdt.c                     |  285 -------------------------
 4 files changed, 304 deletions(-)

--- linux-6.11.orig/Documentation/watchdog/watchdog-parameters.rst
+++ linux-6.11/Documentation/watchdog/watchdog-parameters.rst
@@ -120,16 +120,6 @@ modules.
 
 -------------------------------------------------
 
-cpu5wdt:
-    port:
-	base address of watchdog card, default is 0x91
-    verbose:
-	be verbose, default is 0 (no)
-    ticks:
-	count down ticks, default is 10000
-
--------------------------------------------------
-
 cpwd:
     wd0_timeout:
 	Default watchdog0 timeout in 1/10secs
--- linux-6.11.orig/drivers/watchdog/Kconfig
+++ linux-6.11/drivers/watchdog/Kconfig
@@ -1524,14 +1524,6 @@ config SBC7240_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called sbc7240_wdt.
 
-config CPU5_WDT
-	tristate "SMA CPU5 Watchdog"
-	depends on (X86 || COMPILE_TEST) && HAS_IOPORT
-	help
-	  TBD.
-	  To compile this driver as a module, choose M here: the
-	  module will be called cpu5wdt.
-
 config SMSC_SCH311X_WDT
 	tristate "SMSC SCH311X Watchdog Timer"
 	depends on (X86 || COMPILE_TEST) && HAS_IOPORT
--- linux-6.11.orig/drivers/watchdog/Makefile
+++ linux-6.11/drivers/watchdog/Makefile
@@ -136,7 +136,6 @@ obj-$(CONFIG_RDC321X_WDT) += rdc321x_wdt
 obj-$(CONFIG_60XX_WDT) += sbc60xxwdt.o
 obj-$(CONFIG_SBC8360_WDT) += sbc8360.o
 obj-$(CONFIG_SBC7240_WDT) += sbc7240_wdt.o
-obj-$(CONFIG_CPU5_WDT) += cpu5wdt.o
 obj-$(CONFIG_SMSC_SCH311X_WDT) += sch311x_wdt.o
 obj-$(CONFIG_SMSC37B787_WDT) += smsc37b787_wdt.o
 obj-$(CONFIG_TQMX86_WDT) += tqmx86_wdt.o
--- linux-6.11.orig/drivers/watchdog/cpu5wdt.c
+++ /dev/null
@@ -1,285 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * sma cpu5 watchdog driver
- *
- * Copyright (C) 2003 Heiko Ronsdorf <hero@ihg.uni-duisburg.de>
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/miscdevice.h>
-#include <linux/fs.h>
-#include <linux/ioport.h>
-#include <linux/timer.h>
-#include <linux/completion.h>
-#include <linux/jiffies.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
-#include <linux/watchdog.h>
-
-/* adjustable parameters */
-
-static int verbose;
-static int port = 0x91;
-static int ticks = 10000;
-static DEFINE_SPINLOCK(cpu5wdt_lock);
-
-#define PFX			"cpu5wdt: "
-
-#define CPU5WDT_EXTENT          0x0A
-
-#define CPU5WDT_STATUS_REG      0x00
-#define CPU5WDT_TIME_A_REG      0x02
-#define CPU5WDT_TIME_B_REG      0x03
-#define CPU5WDT_MODE_REG        0x04
-#define CPU5WDT_TRIGGER_REG     0x07
-#define CPU5WDT_ENABLE_REG      0x08
-#define CPU5WDT_RESET_REG       0x09
-
-#define CPU5WDT_INTERVAL	(HZ/10+1)
-
-/* some device data */
-
-static struct {
-	struct completion stop;
-	int running;
-	struct timer_list timer;
-	int queue;
-	int default_ticks;
-	unsigned long inuse;
-} cpu5wdt_device;
-
-/* generic helper functions */
-
-static void cpu5wdt_trigger(struct timer_list *unused)
-{
-	if (verbose > 2)
-		pr_debug("trigger at %i ticks\n", ticks);
-
-	if (cpu5wdt_device.running)
-		ticks--;
-
-	spin_lock(&cpu5wdt_lock);
-	/* keep watchdog alive */
-	outb(1, port + CPU5WDT_TRIGGER_REG);
-
-	/* requeue?? */
-	if (cpu5wdt_device.queue && ticks)
-		mod_timer(&cpu5wdt_device.timer, jiffies + CPU5WDT_INTERVAL);
-	else {
-		/* ticks doesn't matter anyway */
-		complete(&cpu5wdt_device.stop);
-	}
-	spin_unlock(&cpu5wdt_lock);
-
-}
-
-static void cpu5wdt_reset(void)
-{
-	ticks = cpu5wdt_device.default_ticks;
-
-	if (verbose)
-		pr_debug("reset (%i ticks)\n", (int) ticks);
-
-}
-
-static void cpu5wdt_start(void)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cpu5wdt_lock, flags);
-	if (!cpu5wdt_device.queue) {
-		cpu5wdt_device.queue = 1;
-		outb(0, port + CPU5WDT_TIME_A_REG);
-		outb(0, port + CPU5WDT_TIME_B_REG);
-		outb(1, port + CPU5WDT_MODE_REG);
-		outb(0, port + CPU5WDT_RESET_REG);
-		outb(0, port + CPU5WDT_ENABLE_REG);
-		mod_timer(&cpu5wdt_device.timer, jiffies + CPU5WDT_INTERVAL);
-	}
-	/* if process dies, counter is not decremented */
-	cpu5wdt_device.running++;
-	spin_unlock_irqrestore(&cpu5wdt_lock, flags);
-}
-
-static int cpu5wdt_stop(void)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&cpu5wdt_lock, flags);
-	if (cpu5wdt_device.running)
-		cpu5wdt_device.running = 0;
-	ticks = cpu5wdt_device.default_ticks;
-	spin_unlock_irqrestore(&cpu5wdt_lock, flags);
-	if (verbose)
-		pr_crit("stop not possible\n");
-	return -EIO;
-}
-
-/* filesystem operations */
-
-static int cpu5wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &cpu5wdt_device.inuse))
-		return -EBUSY;
-	return stream_open(inode, file);
-}
-
-static int cpu5wdt_release(struct inode *inode, struct file *file)
-{
-	clear_bit(0, &cpu5wdt_device.inuse);
-	return 0;
-}
-
-static long cpu5wdt_ioctl(struct file *file, unsigned int cmd,
-						unsigned long arg)
-{
-	void __user *argp = (void __user *)arg;
-	int __user *p = argp;
-	unsigned int value;
-	static const struct watchdog_info ident = {
-		.options = WDIOF_CARDRESET,
-		.identity = "CPU5 WDT",
-	};
-
-	switch (cmd) {
-	case WDIOC_GETSUPPORT:
-		if (copy_to_user(argp, &ident, sizeof(ident)))
-			return -EFAULT;
-		break;
-	case WDIOC_GETSTATUS:
-		value = inb(port + CPU5WDT_STATUS_REG);
-		value = (value >> 2) & 1;
-		return put_user(value, p);
-	case WDIOC_GETBOOTSTATUS:
-		return put_user(0, p);
-	case WDIOC_SETOPTIONS:
-		if (get_user(value, p))
-			return -EFAULT;
-		if (value & WDIOS_ENABLECARD)
-			cpu5wdt_start();
-		if (value & WDIOS_DISABLECARD)
-			cpu5wdt_stop();
-		break;
-	case WDIOC_KEEPALIVE:
-		cpu5wdt_reset();
-		break;
-	default:
-		return -ENOTTY;
-	}
-	return 0;
-}
-
-static ssize_t cpu5wdt_write(struct file *file, const char __user *buf,
-						size_t count, loff_t *ppos)
-{
-	if (!count)
-		return -EIO;
-	cpu5wdt_reset();
-	return count;
-}
-
-static const struct file_operations cpu5wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.unlocked_ioctl	= cpu5wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= cpu5wdt_open,
-	.write		= cpu5wdt_write,
-	.release	= cpu5wdt_release,
-};
-
-static struct miscdevice cpu5wdt_misc = {
-	.minor	= WATCHDOG_MINOR,
-	.name	= "watchdog",
-	.fops	= &cpu5wdt_fops,
-};
-
-/* init/exit function */
-
-static int cpu5wdt_init(void)
-{
-	unsigned int val;
-	int err;
-
-	if (verbose)
-		pr_debug("port=0x%x, verbose=%i\n", port, verbose);
-
-	init_completion(&cpu5wdt_device.stop);
-	cpu5wdt_device.queue = 0;
-	timer_setup(&cpu5wdt_device.timer, cpu5wdt_trigger, 0);
-	cpu5wdt_device.default_ticks = ticks;
-
-	if (!request_region(port, CPU5WDT_EXTENT, PFX)) {
-		pr_err("request_region failed\n");
-		err = -EBUSY;
-		goto no_port;
-	}
-
-	/* watchdog reboot? */
-	val = inb(port + CPU5WDT_STATUS_REG);
-	val = (val >> 2) & 1;
-	if (!val)
-		pr_info("sorry, was my fault\n");
-
-	err = misc_register(&cpu5wdt_misc);
-	if (err < 0) {
-		pr_err("misc_register failed\n");
-		goto no_misc;
-	}
-
-
-	pr_info("init success\n");
-	return 0;
-
-no_misc:
-	release_region(port, CPU5WDT_EXTENT);
-no_port:
-	return err;
-}
-
-static int cpu5wdt_init_module(void)
-{
-	return cpu5wdt_init();
-}
-
-static void cpu5wdt_exit(void)
-{
-	if (cpu5wdt_device.queue) {
-		cpu5wdt_device.queue = 0;
-		wait_for_completion(&cpu5wdt_device.stop);
-		timer_shutdown_sync(&cpu5wdt_device.timer);
-	}
-
-	misc_deregister(&cpu5wdt_misc);
-
-	release_region(port, CPU5WDT_EXTENT);
-
-}
-
-static void cpu5wdt_exit_module(void)
-{
-	cpu5wdt_exit();
-}
-
-/* module entry points */
-
-module_init(cpu5wdt_init_module);
-module_exit(cpu5wdt_exit_module);
-
-MODULE_AUTHOR("Heiko Ronsdorf <hero@ihg.uni-duisburg.de>");
-MODULE_DESCRIPTION("sma cpu5 watchdog driver");
-MODULE_LICENSE("GPL");
-
-module_param_hw(port, int, ioport, 0);
-MODULE_PARM_DESC(port, "base address of watchdog card, default is 0x91");
-
-module_param(verbose, int, 0);
-MODULE_PARM_DESC(verbose, "be verbose, default is 0 (no)");
-
-module_param(ticks, int, 0);
-MODULE_PARM_DESC(ticks, "count down ticks, default is 10000");


-- 
Jean Delvare
SUSE L3 Support

