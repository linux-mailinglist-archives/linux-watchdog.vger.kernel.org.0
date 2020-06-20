Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3A42025BC
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgFTRuS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:18 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36122 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbgFTRuR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: by mail-ot1-f68.google.com with SMTP id 97so9835424otg.3
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a+OmAdNBC/pnfo+gFZebqjumwX7Z8038L6u6RJcEe9c=;
        b=lAJGLN5gT9xfg/ycOJjQh94VamGGwglaZUg0QuTdyep5Npp9UGwn4uPwit/g29k5UX
         FL6aaTnuGXK1jw/5B8HkNBBqT3Km52XXj4fwYD5PPFA/m50sTxuR5NgHSgEPFIHcDbTp
         BxT0kAOewGb3UuDJ5gCbCMKkz6zxDDZepwKm6qN8CzCf9hvbn4uTcyXsuXW4eKS/msGm
         MuR1vteuj+5Fe57TfiSnpYMFsYEhWlb6Gpn9uicihPR8f0pvxTavkMzjTTitg9TBSF1c
         y1vfixjKV3xp1iqVH8ZHZ2klEVW6yslfKlha6q1WDUWYEcXIpxEnatIR6UzbesyTA2se
         GXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=a+OmAdNBC/pnfo+gFZebqjumwX7Z8038L6u6RJcEe9c=;
        b=olbb7NLX4wBIKLHgBkMBOAdpHJFqE9tHC031pGaZ1nq8ah6r6vwGo6GhCs+p8RpeKS
         PTM7WO3YcoJWMpIafV3Mu1CA/4oBWABG7zoem+r5pporhlBOnvrBY9+nZzACzh+LvA7+
         bVQdXiJkB0nc/Hr8VLPIt+EbmTCP2jSGwGzLDerETM8A5Gyq6vSE+SZPY4I+QZ306DFg
         EG9hgAzMJy59sbcg03tlExX18cXpA7r5znLZucIQF+XoONKAYOq55VH0vmH5nfjOnqKF
         +Yd6MFzUKTH8ooAUN594RLUWugc+NaTi9jLcYoG/fzCI0B7/36Wx7IyTmCG6HJR0XGud
         oYgQ==
X-Gm-Message-State: AOAM530Mv5oEKbcWXlpKeKtMcadbkKcYf2fnT4ehrTg3VUKiIdQ2HN2b
        GbcdnOBXT5Q63MraWjqjMg==
X-Google-Smtp-Source: ABdhPJwLZuWMDioce1b/rAFs7pW4uaQJnUt6xZcWPsg1yD/lMrlTNlVeaBOD2W1BiiCWL7eCQC3wXA==
X-Received: by 2002:a9d:6c50:: with SMTP id g16mr6973095otq.73.1592675356729;
        Sat, 20 Jun 2020 10:49:16 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id i2sm2065728ota.66.2020.06.20.10.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id 09DCA180565;
        Sat, 20 Jun 2020 17:49:12 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 09/10] ipmi:watchdog: Convert over to watchdog framework reboot handling
Date:   Sat, 20 Jun 2020 12:49:06 -0500
Message-Id: <20200620174907.20229-10-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

With the watchdog framework supporting a reboot timeout, we can switch
the IPMI driver over to use that and get rid of some redundance code.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 47 ++-----------------------------
 1 file changed, 3 insertions(+), 44 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 6e0c9faa6e6a..1ee884e6dcac 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -27,7 +27,6 @@
 #include <linux/uaccess.h>
 #include <linux/notifier.h>
 #include <linux/nmi.h>
-#include <linux/reboot.h>
 #include <linux/wait.h>
 #include <linux/poll.h>
 #include <linux/string.h>
@@ -140,9 +139,6 @@ static int pretimeout;
 /* Default timeout to set on panic */
 static int panic_wdt_timeout = 255;
 
-/* Default timeout to set on reboot */
-static int reboot_wdt_timeout = 120;
-
 /* Default action is to reset the board on a timeout. */
 static unsigned char action_val = WDOG_TIMEOUT_RESET;
 
@@ -321,7 +317,7 @@ MODULE_PARM_DESC(pretimeout, "Pretimeout value in seconds.");
 module_param(panic_wdt_timeout, timeout, 0644);
 MODULE_PARM_DESC(panic_wdt_timeout, "Timeout value on kernel panic in seconds.");
 
-module_param(reboot_wdt_timeout, timeout, 0644);
+module_param_named(reboot_wdt_timeout, ipmi_wdd.reboot_timeout, timeout, 0644);
 MODULE_PARM_DESC(reboot_wdt_timeout, "Timeout value on a reboot in seconds.");
 
 module_param_cb(action, &param_ops_str, action_op, 0644);
@@ -825,10 +821,12 @@ static struct watchdog_info ipmi_wdog_info = {
 static struct watchdog_device ipmi_wdd = {
 	.ops = &ipmi_wdog_ops,
 	.info = &ipmi_wdog_info,
+	.status = 1 << WDOG_STOP_ON_REBOOT,
 	.min_timeout = 1,
 	.max_timeout = 6553,
 	.min_hw_heartbeat_ms = 1,
 	.max_hw_heartbeat_ms = 65535,
+	.reboot_timeout = 120,
 };
 
 static void ipmi_wdog_msg_handler(struct ipmi_recv_msg *msg,
@@ -1065,40 +1063,6 @@ ipmi_nmi(unsigned int val, struct pt_regs *regs)
 }
 #endif
 
-static int wdog_reboot_handler(struct notifier_block *this,
-			       unsigned long         code,
-			       void                  *unused)
-{
-	static int reboot_event_handled;
-
-	if ((watchdog_user) && (!reboot_event_handled)) {
-		/* Make sure we only do this once. */
-		reboot_event_handled = 1;
-
-		if (code == SYS_POWER_OFF || code == SYS_HALT) {
-			/* Disable the WDT if we are shutting down. */
-			ipmi_watchdog_state = WDOG_TIMEOUT_NONE;
-			ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
-		} else if (ipmi_watchdog_state != WDOG_TIMEOUT_NONE) {
-			/* Set a long timer to let the reboot happen or
-			   reset if it hangs, but only if the watchdog
-			   timer was already running. */
-			if (timeout < reboot_wdt_timeout)
-				timeout = reboot_wdt_timeout;
-			pretimeout = 0;
-			ipmi_watchdog_state = WDOG_TIMEOUT_RESET;
-			ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
-		}
-	}
-	return NOTIFY_OK;
-}
-
-static struct notifier_block wdog_reboot_notifier = {
-	.notifier_call	= wdog_reboot_handler,
-	.next		= NULL,
-	.priority	= 0
-};
-
 static void ipmi_new_smi(int if_num, struct device *device)
 {
 	ipmi_register_watchdog(if_num);
@@ -1232,15 +1196,12 @@ static int __init ipmi_wdog_init(void)
 
 	check_parms();
 
-	register_reboot_notifier(&wdog_reboot_notifier);
-
 	rv = ipmi_smi_watcher_register(&smi_watcher);
 	if (rv) {
 #ifdef HAVE_DIE_NMI
 		if (nmi_handler_registered)
 			unregister_nmi_handler(NMI_UNKNOWN, "ipmi");
 #endif
-		unregister_reboot_notifier(&wdog_reboot_notifier);
 		pr_warn("can't register smi watcher\n");
 		return rv;
 	}
@@ -1259,8 +1220,6 @@ static void __exit ipmi_wdog_exit(void)
 	if (nmi_handler_registered)
 		unregister_nmi_handler(NMI_UNKNOWN, "ipmi");
 #endif
-
-	unregister_reboot_notifier(&wdog_reboot_notifier);
 }
 module_exit(ipmi_wdog_exit);
 module_init(ipmi_wdog_init);
-- 
2.17.1

