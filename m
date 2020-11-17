Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2F422B6890
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Nov 2020 16:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387397AbgKQPWa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 17 Nov 2020 10:22:30 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:36335 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbgKQPWa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 17 Nov 2020 10:22:30 -0500
Received: from orion.localdomain ([95.118.38.12]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M1HqM-1kggRB2LiU-002pZT; Tue, 17 Nov 2020 16:22:15 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 2/3] watchdog: iTCO_wdt: use dev_*() instead of pr_*() for logging
Date:   Tue, 17 Nov 2020 16:22:13 +0100
Message-Id: <20201117152214.32244-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117152214.32244-1-info@metux.net>
References: <20201117152214.32244-1-info@metux.net>
X-Provags-ID: V03:K1:640bmtN/7n8JPjX/mFGVO5iWUCFdEx6tG5obomYNOi0o2RJu9ck
 Isxh7hxYIyitwxAC0mUUiwyysMLKyxuE5v4yx6k87Xh1CC9uOxg8Y1WmLotTcH3gK1E1M8W
 CrDIBydYj5DzBBi0IG18CDvykJx7MzcmjVRycdG1fcjPJOw4W+rYlarDvCfywSeG8tK6P/s
 ljZy8NMU/W0gwOjHiDvIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:heac9O/KLiU=:6XZB0rkyBpOxWx8W4pWxLT
 EexTPfyhPwEWLy02kGJjzen1ykXArTArrtajSV2vC+TT5WyrsWK2NSmPDG/uIXyXWKpVy+RKk
 1ou0aF/fgQZpRGMp2NkeqRRGf3Q1rAYsrBT7E32hjUUwp+RW5JvRJcvb45pFnqvtTWFV0192S
 IW/+n5Jw4/ZPKfOmvPUJEz5WWx4Lgjz6KamINEGcZU/H9xxk+uUiJuF4+F/cfky92PBUnotmd
 gWICxP5XvcPwcbbdbHz9Xm+uBsG/znfg+UJ0XD1Ag+r1QAQ8Qk2NocbBeMDjhhBBMFoi7tOHF
 tt1GKvOXLf/jujlNEthQanNXuwgeca3XUaNX3GT7f2EE7ISj5nVzjpCCfCr3Cpci0arJgzLTb
 xrZwaFlH3nKVIc+1VZ71k9j/FhI4hC89DkgSETFtb22Mj9LbDipPhSMBAtF0c
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

For device log outputs, it's better to have device name / ID
prefixed in all messages, so use the proper dev_*() functions here.

Explicit message on module load/unload don't seem to be really helpful
(we have other means to check which modules have been loaded), instead
just add noise to the kernel log. So, removing them.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/watchdog/iTCO_wdt.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index f2ddc8fc71cd..edc588a06ae6 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -40,8 +40,6 @@
  *	Includes, defines, variables, module parameters, ...
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 /* Module and version information */
 #define DRV_NAME	"iTCO_wdt"
 #define DRV_VERSION	"1.11"
@@ -279,7 +277,7 @@ static int iTCO_wdt_start(struct watchdog_device *wd_dev)
 	/* disable chipset's NO_REBOOT bit */
 	if (p->update_no_reboot_bit(p->no_reboot_priv, false)) {
 		spin_unlock(&p->io_lock);
-		pr_err("failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
+		dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot disabled by hardware/BIOS\n");
 		return -EIO;
 	}
 
@@ -510,7 +508,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	/* Check chipset's NO_REBOOT bit */
 	if (p->update_no_reboot_bit(p->no_reboot_priv, false) &&
 	    iTCO_vendor_check_noreboot_on()) {
-		pr_info("unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
+		dev_info(dev, "unable to reset NO_REBOOT flag, device disabled by hardware/BIOS\n");
 		return -ENODEV;	/* Cannot reset NO_REBOOT bit */
 	}
 
@@ -530,12 +528,12 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	if (!devm_request_region(dev, p->tco_res->start,
 				 resource_size(p->tco_res),
 				 pdev->name)) {
-		pr_err("I/O address 0x%04llx already in use, device disabled\n",
+		dev_err(dev, "I/O address 0x%04llx already in use, device disabled\n",
 		       (u64)TCOBASE(p));
 		return -EBUSY;
 	}
 
-	pr_info("Found a %s TCO device (Version=%d, TCOBASE=0x%04llx)\n",
+	dev_info(dev, "Found a %s TCO device (Version=%d, TCOBASE=0x%04llx)\n",
 		pdata->name, pdata->version, (u64)TCOBASE(p));
 
 	/* Clear out the (probably old) status */
@@ -558,7 +556,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 		break;
 	}
 
-	p->wddev.info =	&ident,
+	p->wddev.info = &ident,
 	p->wddev.ops = &iTCO_wdt_ops,
 	p->wddev.bootstatus = 0;
 	p->wddev.timeout = WATCHDOG_TIMEOUT;
@@ -575,7 +573,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	   if not reset to the default */
 	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
 		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
-		pr_info("timeout value out of range, using %d\n",
+		dev_info(dev, "timeout value out of range, using %d\n",
 			WATCHDOG_TIMEOUT);
 	}
 
@@ -583,11 +581,11 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_unregister(&p->wddev);
 	ret = devm_watchdog_register_device(dev, &p->wddev);
 	if (ret != 0) {
-		pr_err("cannot register watchdog device (err=%d)\n", ret);
+		dev_err(dev, "cannot register watchdog device (err=%d)\n", ret);
 		return ret;
 	}
 
-	pr_info("initialized. heartbeat=%d sec (nowayout=%d)\n",
+	dev_info(dev, "initialized. heartbeat=%d sec (nowayout=%d)\n",
 		heartbeat, nowayout);
 
 	return 0;
-- 
2.11.0

