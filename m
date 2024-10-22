Return-Path: <linux-watchdog+bounces-2250-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E99A9F12
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Oct 2024 11:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EEE41F22B00
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Oct 2024 09:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC19199238;
	Tue, 22 Oct 2024 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JH2EdeBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c6xXT0dh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JH2EdeBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="c6xXT0dh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E671991B9;
	Tue, 22 Oct 2024 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590458; cv=none; b=l+9CaNULZoeFaaHEKEhmE8U+ntpCZdCl/MDb5k2jp76zLpSZzNnA8zwEcj3+dE20WqkmNpoXdHn+EZlQipmhvf7eHTY5TTUtARcomX17zlPpFFiKPW0iPGLZEflvq/Lt04ZzgxZ7DPrjPUeM6hpMrxPQ+YS3qKQEp50LBRjyt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590458; c=relaxed/simple;
	bh=My+YrkLVVsT8EkUEUy6mzj/J7s59eJHeNDTpiwibzco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g7nk0sWMLBbcK7tsnNZnHD5GjhANAzdbiY+/KQgeY+UCzqPKA/C6YTFWyWXUcSe0zDztb13KaJV8UN6e9M6hw+S9zXy5YV/gjGQyiyMmaPL5bNXynZ823bSb9bZ+lhr5e7Q++y/3pfQ7JRQZxv/LkQlY/rhmH+tuuI+MFvNrjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JH2EdeBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c6xXT0dh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JH2EdeBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=c6xXT0dh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69DBD1F8D9;
	Tue, 22 Oct 2024 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729590453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=64SDeF50SuG3oSBjT7Kq1HXlFV5nyOqGo3psR3iL3Ug=;
	b=JH2EdeBEeoT8mjedlx94Mi/IlnQOdggVxlNPZXhk8ZV1Bq0SHY6TlcSZEVVXqG+OhEhJEd
	l7b2DrxrKZa3UkhCeBreLyoKLNNQ1FCJZbNTVTV3R/+lqsamSJo/6AGpocvDpg6MoKUuoS
	/4nHtRkqx8xzoWvUbsD0k2mq+hYmuyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729590453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=64SDeF50SuG3oSBjT7Kq1HXlFV5nyOqGo3psR3iL3Ug=;
	b=c6xXT0dhIb6Iyn9xn0AIl53v0w7mHpQv7M7Umjf+m1JLzj0kE9YLYjVULBRA780r8MDIWE
	kmt0MPe2IYhJRIAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JH2EdeBE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c6xXT0dh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729590453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=64SDeF50SuG3oSBjT7Kq1HXlFV5nyOqGo3psR3iL3Ug=;
	b=JH2EdeBEeoT8mjedlx94Mi/IlnQOdggVxlNPZXhk8ZV1Bq0SHY6TlcSZEVVXqG+OhEhJEd
	l7b2DrxrKZa3UkhCeBreLyoKLNNQ1FCJZbNTVTV3R/+lqsamSJo/6AGpocvDpg6MoKUuoS
	/4nHtRkqx8xzoWvUbsD0k2mq+hYmuyQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729590453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=64SDeF50SuG3oSBjT7Kq1HXlFV5nyOqGo3psR3iL3Ug=;
	b=c6xXT0dhIb6Iyn9xn0AIl53v0w7mHpQv7M7Umjf+m1JLzj0kE9YLYjVULBRA780r8MDIWE
	kmt0MPe2IYhJRIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A16013AC9;
	Tue, 22 Oct 2024 09:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id amFJCLV0F2dWFgAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 22 Oct 2024 09:47:33 +0000
Date: Tue, 22 Oct 2024 11:47:31 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck 
 <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] watchdog: Delete the cpu5wdt driver
Message-ID: <20241022114731.31f69c94@endymion.delvare>
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
X-Rspamd-Queue-Id: 69DBD1F8D9
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v2:
 * Rebased on top of v6.12-rc4.

 Documentation/watchdog/watchdog-parameters.rst |   10 
 drivers/watchdog/Kconfig                       |    8 
 drivers/watchdog/Makefile                      |    1 
 drivers/watchdog/cpu5wdt.c                     |  284 -------------------------
 4 files changed, 303 deletions(-)

--- linux-6.12-rc4.orig/Documentation/watchdog/watchdog-parameters.rst
+++ linux-6.12-rc4/Documentation/watchdog/watchdog-parameters.rst
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
--- linux-6.12-rc4.orig/drivers/watchdog/Kconfig
+++ linux-6.12-rc4/drivers/watchdog/Kconfig
@@ -1533,14 +1533,6 @@ config SBC7240_WDT
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
--- linux-6.12-rc4.orig/drivers/watchdog/Makefile
+++ linux-6.12-rc4/drivers/watchdog/Makefile
@@ -137,7 +137,6 @@ obj-$(CONFIG_RDC321X_WDT) += rdc321x_wdt
 obj-$(CONFIG_60XX_WDT) += sbc60xxwdt.o
 obj-$(CONFIG_SBC8360_WDT) += sbc8360.o
 obj-$(CONFIG_SBC7240_WDT) += sbc7240_wdt.o
-obj-$(CONFIG_CPU5_WDT) += cpu5wdt.o
 obj-$(CONFIG_SMSC_SCH311X_WDT) += sch311x_wdt.o
 obj-$(CONFIG_SMSC37B787_WDT) += smsc37b787_wdt.o
 obj-$(CONFIG_TQMX86_WDT) += tqmx86_wdt.o
--- linux-6.12-rc4.orig/drivers/watchdog/cpu5wdt.c
+++ /dev/null
@@ -1,284 +0,0 @@
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

