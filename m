Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995D5343A08
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Mar 2021 07:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhCVGx6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 02:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhCVGxr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 02:53:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C85CC061574;
        Sun, 21 Mar 2021 23:53:47 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id k128so6425317wmk.4;
        Sun, 21 Mar 2021 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=27K5qkECfhFzk5VC8IxRVcDbc4SHtiSd39PuLbLqj20=;
        b=cYGfSiEIwikFTRUhTNyXlw3FEAcEL1jdtOKdcnpkYCa3GGpG73kLWW85vE5CAUi209
         ELQm0R8K6oGxclG8L3NqsrLDWVLeaSFUklMa2bzhFLDhzjoqCACbk3QScL558RITMXMN
         /j189q/FUYGHgqJRiSq52pfcZjjP7U9GWQNYkm6acQyzlPQp/93qcy2RFqYQQM2lYEef
         HF75fBLeFAzGo5INSHvwogrCUteMJKi6K3vZi5xq/cdN6/JX2DsapCUa+xBcpOMbFj6B
         W8F0NQ/WCFhTXpvKsAZ7IZOa3pH75VhLqC7QhF6YrF7ooE6WYRBcau6VK/aJNlkV/LEE
         5MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=27K5qkECfhFzk5VC8IxRVcDbc4SHtiSd39PuLbLqj20=;
        b=SpVIrhy8YTAuQcDa2/04NN/KlVzsGkc61+DQWdRj3/lkh0t0f5+SqEfuzCntOUP1WC
         84jeIvj8m61WP3fpAmJ1zrhjn0Ix8Ne4qnZenGuq1l0++bhhWUtfDJsJ1cFG0PQB3Cou
         a1yY4e1QzSSkGbvTn7zZVzwa3geXwRSLR/JFpDjnTrQ9eLP/mthtIN+xls68cRoK9Mkh
         MPo0a0RK8lz2wLNnZWw4ITfgQdXxxdNJzRmcm1t9WwhBVR0UkPnGhRkfejIZYDBZtmzr
         PzKkfkA0gobM1+FiLWm7rCo1tjNPEzwW6gjl3ATl68k+OgBK2+U1uYMRi+v4+GTuKYpP
         hzyg==
X-Gm-Message-State: AOAM533FaxHJoJ+T4LZoiyTsCL0VPQM9YFCjKXTui/wW0XbC3CQaKIHq
        7uxkddpH+TOOLBL883HSub8=
X-Google-Smtp-Source: ABdhPJywkgVyp5spT/tZjxgEmDgcKUieibxv+p7AoRl1lfqFRx+jVJBBTyW/2e7EkesSrKbj+VWN1w==
X-Received: by 2002:a1c:f605:: with SMTP id w5mr14678633wmc.66.1616396025735;
        Sun, 21 Mar 2021 23:53:45 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d8a:8e00:f0d7:9c83:eaad:b065])
        by smtp.gmail.com with ESMTPSA id v18sm19777929wru.85.2021.03.21.23.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 23:53:45 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Cc:     Tomas Winkler <tomas.winkler@intel.com>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] watchdog: fix syntactic kernel-doc issues
Date:   Mon, 22 Mar 2021 07:53:37 +0100
Message-Id: <20210322065337.617-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The command 'find drivers/watchdog | xargs ./scripts/kernel-doc -none'
reports a number of kernel-doc warnings in the watchdog subsystem.

Address the kernel-doc warnings that were purely syntactic issues with
kernel-doc comments.

The remaining kernel-doc warnings are of type "Excess function parameter"
and "Function parameter or member not described". These warnings would
need to be addressed in a second pass with a bit more insight into the
APIs and purpose of the functions in the watchdog subsystem.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Guenter, Wim, please pick this minor clean-up patch.

 drivers/watchdog/booke_wdt.c       |  2 +-
 drivers/watchdog/eurotechwdt.c     |  2 +-
 drivers/watchdog/mei_wdt.c         |  8 ++++----
 drivers/watchdog/octeon-wdt-main.c | 12 +++++++-----
 drivers/watchdog/pc87413_wdt.c     |  2 +-
 drivers/watchdog/wdt.c             |  4 ++--
 drivers/watchdog/wdt_pci.c         |  2 +-
 7 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
index 7817fb976f9c..5e4dc1a0f2c6 100644
--- a/drivers/watchdog/booke_wdt.c
+++ b/drivers/watchdog/booke_wdt.c
@@ -148,7 +148,7 @@ static void __booke_wdt_enable(void *data)
 }
 
 /**
- * booke_wdt_disable - disable the watchdog on the given CPU
+ * __booke_wdt_disable - disable the watchdog on the given CPU
  *
  * This function is called on each CPU.  It disables the watchdog on that CPU.
  *
diff --git a/drivers/watchdog/eurotechwdt.c b/drivers/watchdog/eurotechwdt.c
index 2418ebb707bd..ce682942662c 100644
--- a/drivers/watchdog/eurotechwdt.c
+++ b/drivers/watchdog/eurotechwdt.c
@@ -392,7 +392,7 @@ static struct notifier_block eurwdt_notifier = {
 };
 
 /**
- * cleanup_module:
+ * eurwdt_exit:
  *
  * Unload the watchdog. You cannot do this with any file handles open.
  * If your watchdog is set to continue ticking on close and you unload
diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
index e023d7d90d66..c7a7235e6224 100644
--- a/drivers/watchdog/mei_wdt.c
+++ b/drivers/watchdog/mei_wdt.c
@@ -105,7 +105,7 @@ struct mei_wdt {
 #endif /* CONFIG_DEBUG_FS */
 };
 
-/*
+/**
  * struct mei_mc_hdr - Management Control Command Header
  *
  * @command: Management Control (0x2)
@@ -121,7 +121,7 @@ struct mei_mc_hdr {
 };
 
 /**
- * struct mei_wdt_start_request watchdog start/ping
+ * struct mei_wdt_start_request - watchdog start/ping
  *
  * @hdr: Management Control Command Header
  * @timeout: timeout value
@@ -134,7 +134,7 @@ struct mei_wdt_start_request {
 } __packed;
 
 /**
- * struct mei_wdt_start_response watchdog start/ping response
+ * struct mei_wdt_start_response - watchdog start/ping response
  *
  * @hdr: Management Control Command Header
  * @status: operation status
@@ -474,7 +474,7 @@ static void mei_wdt_rx(struct mei_cl_device *cldev)
 		complete(&wdt->response);
 }
 
-/*
+/**
  * mei_wdt_notif - callback for event notification
  *
  * @cldev: bus device
diff --git a/drivers/watchdog/octeon-wdt-main.c b/drivers/watchdog/octeon-wdt-main.c
index fde9e739b436..298c070884c4 100644
--- a/drivers/watchdog/octeon-wdt-main.c
+++ b/drivers/watchdog/octeon-wdt-main.c
@@ -119,7 +119,7 @@ static int cpu2core(int cpu)
 }
 
 /**
- * Poke the watchdog when an interrupt is received
+ * octeon_wdt_poke_irq - Poke the watchdog when an interrupt is received
  *
  * @cpl:
  * @dev_id:
@@ -153,7 +153,7 @@ static irqreturn_t octeon_wdt_poke_irq(int cpl, void *dev_id)
 extern int prom_putchar(char c);
 
 /**
- * Write a string to the uart
+ * octeon_wdt_write_string - Write a string to the uart
  *
  * @str:        String to write
  */
@@ -165,7 +165,7 @@ static void octeon_wdt_write_string(const char *str)
 }
 
 /**
- * Write a hex number out of the uart
+ * octeon_wdt_write_hex() - Write a hex number out of the uart
  *
  * @value:      Number to display
  * @digits:     Number of digits to print (1 to 16)
@@ -192,6 +192,8 @@ static const char reg_name[][3] = {
 };
 
 /**
+ * octeon_wdt_nmi_stage3:
+ *
  * NMI stage 3 handler. NMIs are handled in the following manner:
  * 1) The first NMI handler enables CVMSEG and transfers from
  * the bootbus region into normal memory. It is careful to not
@@ -513,7 +515,7 @@ static struct watchdog_device octeon_wdt = {
 
 static enum cpuhp_state octeon_wdt_online;
 /**
- * Module/ driver initialization.
+ * octeon_wdt_init - Module/ driver initialization.
  *
  * Returns Zero on success
  */
@@ -585,7 +587,7 @@ static int __init octeon_wdt_init(void)
 }
 
 /**
- * Module / driver shutdown
+ * octeon_wdt_cleanup - Module / driver shutdown
  */
 static void __exit octeon_wdt_cleanup(void)
 {
diff --git a/drivers/watchdog/pc87413_wdt.c b/drivers/watchdog/pc87413_wdt.c
index 2d4504302c9e..9f9a340427fc 100644
--- a/drivers/watchdog/pc87413_wdt.c
+++ b/drivers/watchdog/pc87413_wdt.c
@@ -445,7 +445,7 @@ static long pc87413_ioctl(struct file *file, unsigned int cmd,
 /* -- Notifier funtions -----------------------------------------*/
 
 /**
- *	notify_sys:
+ *	pc87413_notify_sys:
  *	@this: our notifier block
  *	@code: the event being reported
  *	@unused: unused
diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
index a9e40b5c633e..183876156243 100644
--- a/drivers/watchdog/wdt.c
+++ b/drivers/watchdog/wdt.c
@@ -494,7 +494,7 @@ static int wdt_temp_release(struct inode *inode, struct file *file)
 }
 
 /**
- *	notify_sys:
+ *	wdt_notify_sys:
  *	@this: our notifier block
  *	@code: the event being reported
  *	@unused: unused
@@ -558,7 +558,7 @@ static struct notifier_block wdt_notifier = {
 };
 
 /**
- *	cleanup_module:
+ *	wdt_exit:
  *
  *	Unload the watchdog. You cannot do this with any file handles open.
  *	If your watchdog is set to continue ticking on close and you unload
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index c3254ba5ace6..d5e56b601351 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -537,7 +537,7 @@ static int wdtpci_temp_release(struct inode *inode, struct file *file)
 }
 
 /**
- *	notify_sys:
+ *	wdtpci_notify_sys:
  *	@this: our notifier block
  *	@code: the event being reported
  *	@unused: unused
-- 
2.17.1

