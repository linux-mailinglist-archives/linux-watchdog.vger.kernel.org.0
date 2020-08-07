Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7847623F53D
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Aug 2020 01:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgHGXam (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Aug 2020 19:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgHGXal (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Aug 2020 19:30:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE279C061756;
        Fri,  7 Aug 2020 16:30:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u128so1937576pfb.6;
        Fri, 07 Aug 2020 16:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=pPcwqC37bWlLnIU95eOzUiAM672CtcaNNJrpAYPnB90=;
        b=N2v+6fRS8A+M4XefPlAIpXLM5S7+CUninSbiOX+T0gsOQjWFa36EKNhG4pEvnaz9ck
         hIHVjEP5VAPZWpEtd+l2Kb2ADen2/Riz9JzStS29W+KBalAIjksqgaYuGrBlQx8NNGN+
         rbSu6xMtSSRMNoBPBiTO2QeE0lgP3p0tQmbC/aIr4dDr4DoUbvC0Qf3D6Y/Mafuw/oW3
         KbgYDJ1L3ke/lcFo5oEnOp3F5ENChz1BRNHwV0wdTgWjUhmgteBPS0ynAY3ksZQz79kC
         aHPWMhCEGoKhJmaCiDZ67oh07iMafRlmOoGyQXy74+f1wmQLDi9l7caX2jUV/Vcs7abk
         uYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=pPcwqC37bWlLnIU95eOzUiAM672CtcaNNJrpAYPnB90=;
        b=I1nh0i06QCju60nYrU1xuvfkCxUuVQB0aoK+GQg/rkjUutFEBQSym0VKBYaqEW2jDd
         55CF/uI9FjH2a9N3UJmGxmyy9ZkxFhV7gA78kB5CY8kjnlXVeyglbUa5f364kZD/BAyn
         EqY6PrHxrod4Tn+TkQo6u+OSG6TsSlc37PHZXEZ8WgqJPpDrhVQLdVYoKsDKI9o38Ohh
         qkHob/aZzxpLZem1/zm5TNHWNCORBox+70r9QZMetXSFlRI57bIBXbVLeY4UFstE4Uk4
         hG063xyeQ/K16diU3UeunNoQ7ZbRCY09VqryaJGTCfzrL3VmiSF5BrHVOnJQxPVPsdIz
         Q8AQ==
X-Gm-Message-State: AOAM531drVBlXv9c+vpkVWFUiWiVud4c45Ds2lliwJMwkRXv/Qs2RWqh
        oC6KcMm9oyRECAfmS0JHIcquu2J5
X-Google-Smtp-Source: ABdhPJxYOL+zg2P09p/L48nVMu9B2FcVxFpRmKb0ZDUNM933Hsx4CabNkpXo2sKa13DK8EBDj67Heg==
X-Received: by 2002:a62:7c4f:: with SMTP id x76mr16168493pfc.124.1596843039699;
        Fri, 07 Aug 2020 16:30:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f63sm11354232pjk.53.2020.08.07.16.30.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 16:30:39 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [RFC/RFT PATCH] watchdog: rdc321x_wdt: Convert to use watchdog subsystem
Date:   Fri,  7 Aug 2020 16:30:33 -0700
Message-Id: <20200807233033.106729-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert driver to use watchdog subsystem.

RFC/RFT: Completely untested. Also see FIXME comments in code.

Notes:
- The driver no longer uses platform data.
  Using resources to pass PCI configuration register addresses
  does not make much sense, and the PCI device can be obtained
  with to_pci_dev(dev->parent).
- WDIOC_GETSTATUS no longer returns the raw watchdog register
  value.
- WDIOS_DISABLECARD no longer returns -EIO but just stops
  the watchdog.

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/rdc321x_wdt.c | 274 +++++++++------------------------
 1 file changed, 69 insertions(+), 205 deletions(-)

diff --git a/drivers/watchdog/rdc321x_wdt.c b/drivers/watchdog/rdc321x_wdt.c
index 57187efeb86f..5a3eaca6b9f8 100644
--- a/drivers/watchdog/rdc321x_wdt.c
+++ b/drivers/watchdog/rdc321x_wdt.c
@@ -8,19 +8,10 @@
  */
 
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/miscdevice.h>
-#include <linux/fs.h>
-#include <linux/ioport.h>
-#include <linux/timer.h>
-#include <linux/completion.h>
-#include <linux/jiffies.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
 #include <linux/mfd/rdc321x.h>
 
 #define RDC_WDT_MASK	0x80000000 /* Mask */
@@ -32,247 +23,120 @@
 #define RDC_WDT_CNT	0x00000001 /* WDT count */
 
 #define RDC_CLS_TMR	0x80003844 /* Clear timer */
+				// xxxx44 -> 2.34s or 2.68s timeout
+				// (or maybe 2.5s / 2.85s)
+				// xxx8xx -> route to irq[1]
+				// xx3xxx -> reserved
+				// (should that have been 3xxxxx ?)
+				// 8xxxxxxx -> not defined in datasheet
 
-#define RDC_WDT_INTERVAL	(HZ/10+1)
+#define DEFAULT_TIMEOUT		30	/* seconds */
 
-static int ticks = 1000;
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
+struct rdc321x_wdt_device {
+	struct watchdog_device wdd;
 	spinlock_t lock;
 	struct pci_dev *sb_pdev;
-	int base_reg;
-} rdc321x_wdt_device;
-
-/* generic helper functions */
+};
 
-static void rdc321x_wdt_trigger(struct timer_list *unused)
+static int rdc321x_wdt_ping(struct watchdog_device *wdd)
 {
+	struct rdc321x_wdt_device *wdt = watchdog_get_drvdata(wdd);
 	unsigned long flags;
 	u32 val;
 
-	if (rdc321x_wdt_device.running)
-		ticks--;
-
-	/* keep watchdog alive */
-	spin_lock_irqsave(&rdc321x_wdt_device.lock, flags);
-	pci_read_config_dword(rdc321x_wdt_device.sb_pdev,
-					rdc321x_wdt_device.base_reg, &val);
+	spin_lock_irqsave(&wdt->lock, flags);
+	/* FIXME it appears that writing RDC_WDT_EN restarts the timer */
+	pci_read_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, &val);
 	val |= RDC_WDT_EN;
-	pci_write_config_dword(rdc321x_wdt_device.sb_pdev,
-					rdc321x_wdt_device.base_reg, val);
-	spin_unlock_irqrestore(&rdc321x_wdt_device.lock, flags);
-
-	/* requeue?? */
-	if (rdc321x_wdt_device.queue && ticks)
-		mod_timer(&rdc321x_wdt_device.timer,
-				jiffies + RDC_WDT_INTERVAL);
-	else {
-		/* ticks doesn't matter anyway */
-		complete(&rdc321x_wdt_device.stop);
-	}
-
-}
-
-static void rdc321x_wdt_reset(void)
-{
-	ticks = rdc321x_wdt_device.default_ticks;
-}
-
-static void rdc321x_wdt_start(void)
-{
-	unsigned long flags;
-
-	if (!rdc321x_wdt_device.queue) {
-		rdc321x_wdt_device.queue = 1;
-
-		/* Clear the timer */
-		spin_lock_irqsave(&rdc321x_wdt_device.lock, flags);
-		pci_write_config_dword(rdc321x_wdt_device.sb_pdev,
-				rdc321x_wdt_device.base_reg, RDC_CLS_TMR);
-
-		/* Enable watchdog and set the timeout to 81.92 us */
-		pci_write_config_dword(rdc321x_wdt_device.sb_pdev,
-					rdc321x_wdt_device.base_reg,
-					RDC_WDT_EN | RDC_WDT_CNT);
-		spin_unlock_irqrestore(&rdc321x_wdt_device.lock, flags);
-
-		mod_timer(&rdc321x_wdt_device.timer,
-				jiffies + RDC_WDT_INTERVAL);
-	}
+	pci_write_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, val);
+	spin_unlock_irqrestore(&wdt->lock, flags);
 
-	/* if process dies, counter is not decremented */
-	rdc321x_wdt_device.running++;
-}
-
-static int rdc321x_wdt_stop(void)
-{
-	if (rdc321x_wdt_device.running)
-		rdc321x_wdt_device.running = 0;
-
-	ticks = rdc321x_wdt_device.default_ticks;
-
-	return -EIO;
-}
-
-/* filesystem operations */
-static int rdc321x_wdt_open(struct inode *inode, struct file *file)
-{
-	if (test_and_set_bit(0, &rdc321x_wdt_device.inuse))
-		return -EBUSY;
-
-	return stream_open(inode, file);
-}
-
-static int rdc321x_wdt_release(struct inode *inode, struct file *file)
-{
-	clear_bit(0, &rdc321x_wdt_device.inuse);
 	return 0;
 }
 
-static long rdc321x_wdt_ioctl(struct file *file, unsigned int cmd,
-				unsigned long arg)
+static int rdc321x_wdt_start(struct watchdog_device *wdd)
 {
-	void __user *argp = (void __user *)arg;
-	u32 value;
-	static const struct watchdog_info ident = {
-		.options = WDIOF_CARDRESET,
-		.identity = "RDC321x WDT",
-	};
+	struct rdc321x_wdt_device *wdt = watchdog_get_drvdata(wdd);
 	unsigned long flags;
 
-	switch (cmd) {
-	case WDIOC_KEEPALIVE:
-		rdc321x_wdt_reset();
-		break;
-	case WDIOC_GETSTATUS:
-		/* Read the value from the DATA register */
-		spin_lock_irqsave(&rdc321x_wdt_device.lock, flags);
-		pci_read_config_dword(rdc321x_wdt_device.sb_pdev,
-					rdc321x_wdt_device.base_reg, &value);
-		spin_unlock_irqrestore(&rdc321x_wdt_device.lock, flags);
-		if (copy_to_user(argp, &value, sizeof(u32)))
-			return -EFAULT;
-		break;
-	case WDIOC_GETSUPPORT:
-		if (copy_to_user(argp, &ident, sizeof(ident)))
-			return -EFAULT;
-		break;
-	case WDIOC_SETOPTIONS:
-		if (copy_from_user(&value, argp, sizeof(int)))
-			return -EFAULT;
-		switch (value) {
-		case WDIOS_ENABLECARD:
-			rdc321x_wdt_start();
-			break;
-		case WDIOS_DISABLECARD:
-			return rdc321x_wdt_stop();
-		default:
-			return -EINVAL;
-		}
-		break;
-	default:
-		return -ENOTTY;
-	}
+	spin_lock_irqsave(&wdt->lock, flags);
+	/* Clear the timer */
+	pci_write_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, RDC_CLS_TMR);
+	/* Enable watchdog and set the timeout to 81.92 us */
+	// FIXME The above comment doesn't really make sense.
+	// The kernel would be unable to handle a timeout of 81.92 us.
+	// Also, the code used to generate a heartbeat every ~100 ms.
+	pci_write_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, RDC_WDT_EN | RDC_WDT_CNT);
+	spin_unlock_irqrestore(&wdt->lock, flags);
+
 	return 0;
 }
 
-static ssize_t rdc321x_wdt_write(struct file *file, const char __user *buf,
-				size_t count, loff_t *ppos)
+static int rdc321x_wdt_stop(struct watchdog_device *wdd)
 {
-	if (!count)
-		return -EIO;
+	struct rdc321x_wdt_device *wdt = watchdog_get_drvdata(wdd);
 
-	rdc321x_wdt_reset();
+	pci_write_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, 0);
 
-	return count;
+	return 0;
 }
 
-static const struct file_operations rdc321x_wdt_fops = {
-	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
-	.unlocked_ioctl	= rdc321x_wdt_ioctl,
-	.compat_ioctl	= compat_ptr_ioctl,
-	.open		= rdc321x_wdt_open,
-	.write		= rdc321x_wdt_write,
-	.release	= rdc321x_wdt_release,
+static const struct watchdog_ops rdc321x_wdt_ops = {
+	.start = rdc321x_wdt_start,
+	.stop = rdc321x_wdt_stop,
+	.ping = rdc321x_wdt_ping,
+	// FIXME We can't set the timeout since we don't know
+	// how to write the counter register bits.
+	// .set_timeout = rdc321x_wdt_set_timeout,
 };
 
-static struct miscdevice rdc321x_wdt_misc = {
-	.minor	= WATCHDOG_MINOR,
-	.name	= "watchdog",
-	.fops	= &rdc321x_wdt_fops,
+static struct watchdog_info rdc321x_wdt_info = {
+	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_CARDRESET,
+	.identity = "RDC321x WDT",
 };
 
 static int rdc321x_wdt_probe(struct platform_device *pdev)
 {
-	int err;
-	struct resource *r;
-	struct rdc321x_wdt_pdata *pdata;
+	struct device *dev = &pdev->dev;
+	struct rdc321x_wdt_device *wdt;
+	struct watchdog_device *wdd;
+	u32 val;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data supplied\n");
+	if (!dev->parent) {
+		dev_err(dev, "no parent device\n");
 		return -ENODEV;
 	}
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IO, "wdt-reg");
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get wdt-reg resource\n");
-		return -ENODEV;
-	}
+	wdt = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
 
-	rdc321x_wdt_device.sb_pdev = pdata->sb_pdev;
-	rdc321x_wdt_device.base_reg = r->start;
+	wdt->sb_pdev = to_pci_dev(dev->parent);
 
-	err = misc_register(&rdc321x_wdt_misc);
-	if (err < 0) {
-		dev_err(&pdev->dev, "misc_register failed\n");
-		return err;
-	}
+	spin_lock_init(&wdt->lock);
 
-	spin_lock_init(&rdc321x_wdt_device.lock);
+	wdd = &wdt->wdd;
+	wdd->parent = dev;
+	wdd->info = &rdc321x_wdt_info,
+	wdd->min_timeout = 1,
+	// FIXME
+	// wdd->max_hw_heartbeat_ms = 4690,	/* Assumes external clock */
+	wdd->max_hw_heartbeat_ms = 2340,	/* guess */
+	wdd->timeout = DEFAULT_TIMEOUT,
+	wdd->ops = &rdc321x_wdt_ops,
+	watchdog_set_drvdata(wdd, wdt);
 
-	/* Reset the watchdog */
-	pci_write_config_dword(rdc321x_wdt_device.sb_pdev,
-				rdc321x_wdt_device.base_reg, RDC_WDT_RST);
+	pci_read_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, &val);
+	if (val & RDC_WDT_RST)
+		wdd->bootstatus = WDIOF_CARDRESET;
 
-	init_completion(&rdc321x_wdt_device.stop);
-	rdc321x_wdt_device.queue = 0;
+	pci_write_config_dword(wdt->sb_pdev, RDC321X_WDT_CTRL, RDC_WDT_RST);
 
-	clear_bit(0, &rdc321x_wdt_device.inuse);
-
-	timer_setup(&rdc321x_wdt_device.timer, rdc321x_wdt_trigger, 0);
-
-	rdc321x_wdt_device.default_ticks = ticks;
-
-	dev_info(&pdev->dev, "watchdog init success\n");
-
-	return 0;
-}
-
-static int rdc321x_wdt_remove(struct platform_device *pdev)
-{
-	if (rdc321x_wdt_device.queue) {
-		rdc321x_wdt_device.queue = 0;
-		wait_for_completion(&rdc321x_wdt_device.stop);
-	}
-
-	misc_deregister(&rdc321x_wdt_misc);
-
-	return 0;
+	return devm_watchdog_register_device(dev, wdd);
 }
 
 static struct platform_driver rdc321x_wdt_driver = {
 	.probe = rdc321x_wdt_probe,
-	.remove = rdc321x_wdt_remove,
 	.driver = {
 		.name = "rdc321x-wdt",
 	},
-- 
2.17.1

