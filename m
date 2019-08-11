Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC17E89426
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Aug 2019 23:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfHKVXu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 11 Aug 2019 17:23:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38238 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfHKVXt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 11 Aug 2019 17:23:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id z14so11242670pga.5
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Aug 2019 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=H16paC97VhH3eQ9Diydn85E3LXcPUwQZ1GcfXccZw5M=;
        b=jCCmvG/c24HhH4wFTYfQgFKSPEoSa/wVsnYDN76jLNK5SeQBvE7i07JdZ+YVBbH3sM
         bj81tT32vgyxacELWiHxft/BimPgw+pUgY37m2JPwM+0xgcD7Qu7eAUbn4kUSQbTGSpH
         9usPbthvJFSmh4PR5HlAywobDtzIKqBh9rjX4OJ6TFNmC0em9Bm1W3OhULyaT9gQCTG0
         EmrcKYYjm16NR9i2JrHCAXjcEzDDRk09mxzFENYL4ejkQbMTgF+MGZxWe2CPD4GBT9Hi
         MGZL/nuwVC2X7+JHiIIZvOXikJY/CiaqS5ROh5Y2l6cvqLafh9X2zgNilZPSxDtTUxGu
         rMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=H16paC97VhH3eQ9Diydn85E3LXcPUwQZ1GcfXccZw5M=;
        b=ARBVs7vvYpKP+eHjtyb2I3WFw7fbkTcVcnRCgWrSHiLrxwbnDSRYrWjyoepsY9SXrq
         +GvsHGTaw08Wfv6/KGM0ab9p9C7wdlA0jZNUq0XOXE8elYXLfdUzZwnyR5BPWUP0xNlA
         pVFeAPy5WFE5oLixNcAmMFInXs2h7F0sL5Xs06dG0jWl6H4Hd1rPrxd8mPKVRwnY44y0
         AVvRPb61UIRWN7skFpNMRNLofH9CH8rvyXSHQ5QKa8GoC/2ivrA57wtLsZdrRCqdmW17
         3s+Sbe/MNBG1OPEPVIgmbK3JdwUb2sG0AQHpkxI/cSrsLXFOZwneIcN6ZNNjPKn0WsuT
         1f+g==
X-Gm-Message-State: APjAAAXJNVjLchRFlTn2+y1TFqI1+WVn6sZkF8dKzr+dfG+alV2HfLtx
        mJ0E+j5ydVM9fYi04RVSqfw=
X-Google-Smtp-Source: APXvYqxJZcDAwo4qR15elowVSKpw/SbiKOTZ4ymvTgYHOIKHqsXX3Fj1+nYdXUgpslKf+Zm5GJor6A==
X-Received: by 2002:aa7:9edc:: with SMTP id r28mr510817pfq.219.1565558629152;
        Sun, 11 Aug 2019 14:23:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13sm74291690pfn.13.2019.08.11.14.23.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 14:23:48 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Philipp Hachtmann <phacht@de.ibm.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: [PATCH] watchdog: diag288_wdt: Remove leftover includes from conversion to watchdog API
Date:   Sun, 11 Aug 2019 14:23:46 -0700
Message-Id: <1565558626-10351-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Commit f7a94db4e959 ("s390/watchdog: use watchdog API") converted
the driver to use the watchdog API, but some includes as well as
MODULE_ALIAS_MISCDEV() were missed.

Cc: Philipp Hachtmann <phacht@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/diag288_wdt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index 181440b7b4d0..aafc8d98bf9f 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -26,13 +26,11 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
-#include <linux/miscdevice.h>
 #include <linux/watchdog.h>
 #include <linux/suspend.h>
 #include <asm/ebcdic.h>
 #include <asm/diag.h>
 #include <linux/io.h>
-#include <linux/uaccess.h>
 
 #define MAX_CMDLEN 240
 #define DEFAULT_CMD "SYSTEM RESTART"
@@ -70,7 +68,6 @@ MODULE_PARM_DESC(conceal, "Enable the CONCEAL CP option while the watchdog is ac
 module_param_named(nowayout, nowayout_info, bool, 0444);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default = CONFIG_WATCHDOG_NOWAYOUT)");
 
-MODULE_ALIAS_MISCDEV(WATCHDOG_MINOR);
 MODULE_ALIAS("vmwatchdog");
 
 static int __diag288(unsigned int func, unsigned int timeout,
-- 
2.7.4

