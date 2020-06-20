Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A2A2025BA
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Jun 2020 19:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbgFTRuR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:41590 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgFTRuR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Jun 2020 13:50:17 -0400
Received: by mail-oo1-f66.google.com with SMTP id y45so2544499ooi.8
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Jun 2020 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OncGKKbA6gT/96giqWKN/U+R9TK/ALHmSmRLVCnXkPQ=;
        b=coOuX6XcUTWgRZU300y5NFlNKGVruiqWyAf8Y4qmFdkl4laHxwHPMEazbQYnJ1bXfH
         gLwxYilUECU6f+NfwBfetReR2dO+DcKUuW5jVhgshw5E1pEI1VA371GYwmcbehL+BLPE
         98ugSb2yptFU0b1IpWiHH9YKQcDPxq+41qXmOXpAzHga5RbsZsHKxgZVXstanxK5WV26
         j3Hpt2mQdsvQzaAyWRFuMj7nGv2ymhM5eXiPajx97i2CJIbO1BlkHWCMKJ8PEaU26DQ1
         Lq506g2mOw5yYLcYf+AXRGcs7NMCT0unvswehrRdrpeGNY+teV61B4fWNMnOOPTHIci9
         9z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OncGKKbA6gT/96giqWKN/U+R9TK/ALHmSmRLVCnXkPQ=;
        b=peMKIxPo53A442X/bS81NgiqAQ6YfvsVH6DjUclssFydzZexrHTBN16z5pC1O6zNrO
         skaP6R+7h5psccnBtwMvPxGvppY6TLHfW3bN6fEn5L4AjGSarJnsSTC2uqGVr+eUdyzc
         ZxjK0XRSOQIyqxHseSkUyic8/P7Ge0kEvHoNjqvVG2T//JL/tyqSyRtBKMSIH7k+fp7S
         z+a2EbqfdY7k/A4jCDRh3nJBSQQx2E7LeE2zR4KiewFcsU1qtDuf+Feh0USy4RilUhhZ
         tfCYduOucYErkrpiYRO3kClwga6cjMwM6po+qqgbdbc+Tyl/hxqsENMiCqSN6HqK87+v
         DPow==
X-Gm-Message-State: AOAM531vckvHQGZIA61hyrrmTqJIWvkB20YnySsLh+94VbVue4kYezle
        Skgvr2VPcs+tBsqZes68y5lSnd8=
X-Google-Smtp-Source: ABdhPJxRws+qAhJg9fLrzbvfEra/lWdn7HzVVl8glAC9Z8cWuGzalmAKnpo6z2OOnfAL5PQJgaiQCQ==
X-Received: by 2002:a4a:e58a:: with SMTP id o10mr8185528oov.21.1592675355972;
        Sat, 20 Jun 2020 10:49:15 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
        by smtp.gmail.com with ESMTPSA id e68sm2060840ote.56.2020.06.20.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 10:49:14 -0700 (PDT)
Received: from t560.minyard.net (unknown [IPv6:2001:470:b8f6:1b:98f8:1e34:b5b7:82f7])
        by serve.minyard.net (Postfix) with ESMTPA id DFFB9180563;
        Sat, 20 Jun 2020 17:49:11 +0000 (UTC)
From:   minyard@acm.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 07/10] ipmi:watchdog: Allow the reboot timeout to be specified
Date:   Sat, 20 Jun 2020 12:49:04 -0500
Message-Id: <20200620174907.20229-8-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200620174907.20229-1-minyard@acm.org>
References: <20200620174907.20229-1-minyard@acm.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

It was fixed at 120, allow that to be changed.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index 9265a5145691..6e0c9faa6e6a 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -140,6 +140,9 @@ static int pretimeout;
 /* Default timeout to set on panic */
 static int panic_wdt_timeout = 255;
 
+/* Default timeout to set on reboot */
+static int reboot_wdt_timeout = 120;
+
 /* Default action is to reset the board on a timeout. */
 static unsigned char action_val = WDOG_TIMEOUT_RESET;
 
@@ -318,6 +321,9 @@ MODULE_PARM_DESC(pretimeout, "Pretimeout value in seconds.");
 module_param(panic_wdt_timeout, timeout, 0644);
 MODULE_PARM_DESC(panic_wdt_timeout, "Timeout value on kernel panic in seconds.");
 
+module_param(reboot_wdt_timeout, timeout, 0644);
+MODULE_PARM_DESC(reboot_wdt_timeout, "Timeout value on a reboot in seconds.");
+
 module_param_cb(action, &param_ops_str, action_op, 0644);
 MODULE_PARM_DESC(action, "Timeout action. One of: "
 		 "reset, none, power_cycle, power_off.");
@@ -1077,8 +1083,8 @@ static int wdog_reboot_handler(struct notifier_block *this,
 			/* Set a long timer to let the reboot happen or
 			   reset if it hangs, but only if the watchdog
 			   timer was already running. */
-			if (timeout < 120)
-				timeout = 120;
+			if (timeout < reboot_wdt_timeout)
+				timeout = reboot_wdt_timeout;
 			pretimeout = 0;
 			ipmi_watchdog_state = WDOG_TIMEOUT_RESET;
 			ipmi_set_timeout(&ipmi_wdd, IPMI_SET_TIMEOUT_NO_HB);
-- 
2.17.1

