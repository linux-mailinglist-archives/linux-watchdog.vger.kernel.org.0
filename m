Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489D514420D
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jan 2020 17:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgAUQV6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jan 2020 11:21:58 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36639 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgAUQVz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jan 2020 11:21:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so3941965wru.3
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jan 2020 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AY7gzJpVgwoLzDrLzpZZrpTzP4MowdRWmtZvJqmyD6A=;
        b=d8/NETrSAl8IElP67e8VdOhFfToH/47rwfj11TCQiUFupkvJw7zfh6Fr+eqJQv2WU3
         OyZowoIedHdObkPaaJ/VQ6pXbAkosEJ2hSIxttQELNaDhoQegtkmSacq4P4KUpvFo+kh
         sX/3hxfAEMvhfvBfAh7lh8Hw0BH11E1kjDYKiTk+79ERFaf8ZTUq4lQT3wp6J+9JwWNE
         wKxJdmBr6wLSH5TgVhAe9tk6AduCuzVq41FTVqrRuJcGaIWMT093KDgO6RSZItx6bDuc
         HjAdyfgWuhYfRbMhUpAPacbh9jL8McO9mO4YiRNA/Halfn26MLR4f1EhSzjSgUSegs5X
         g8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AY7gzJpVgwoLzDrLzpZZrpTzP4MowdRWmtZvJqmyD6A=;
        b=OUhqBxL5LzyWz5DUdRVF6YdiMihK1ZiS86RWWjh9fGEYzz1UNxFSy3mDUVJNC6NFqj
         dXcaRBB1gsv3Rt9o490g2jd1CnI7qluKdX04AKYuNWSRCSQ28WN3xVVd+995+msczvWX
         yueyXg+a/hc8lUcVpimf2VK6DXb79Ok3mRg3gCIEz8XmmBN+Ss+MTyiuuZWa0ujDipEb
         xr9Yht9B0gelu6EFVRol5ijJZ57e1iUyJ4z4CcF97kimnsCN3r5t5/sDQcSIRNHg1E7T
         E+hSeWkGvOp4jaHkk9y4xY2WDuqodI0M4bh679ELW0ZCYgYvmbypS+UrgccQYiAXz/NW
         Cgkg==
X-Gm-Message-State: APjAAAXeCx/pCDmXjB6yjZslG/j9SrjV6C1fCbx6BTWqqE8Rlm9Y9f20
        7fLx7OZVaW3KKyI5bBrFG1sqVQ==
X-Google-Smtp-Source: APXvYqyIxrgxURVkWUvZnOLrzwB2hVAuiqTn2hI0/2V6DyeW3ukBp0NMPEMOxAu+iw/Xe39uAXwmRA==
X-Received: by 2002:adf:e683:: with SMTP id r3mr6360502wrm.38.1579623713609;
        Tue, 21 Jan 2020 08:21:53 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k8sm52454388wrl.3.2020.01.21.08.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 08:21:53 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [RFC 2/2] watchdog/uapi: Add WDIOS_{RUN,STOP}_ON_REBOOT
Date:   Tue, 21 Jan 2020 16:21:45 +0000
Message-Id: <20200121162145.166334-3-dima@arista.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200121162145.166334-1-dima@arista.com>
References: <20200121162145.166334-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Many watchdog drivers use watchdog_stop_on_reboot() helper in order
to stop the watchdog on system reboot. Unfortunately, this logic is
coded in driver's probe function and doesn't allows user to decide what
to do during shutdown/reboot.

On the other side, Xen and Qemu watchdog drivers (xen_wdt and i6300esb)
may be configured to either send NMI or turn off/reboot VM as
the watchdog action. As the kernel may stuck at any state, sending NMIs
can't reliably reboot the VM.

At Arista, we benefited from the following set-up: the emulated watchdogs
trigger VM reset and softdog is set to catch less severe conditions to
generate vmcore. Just before reboot watchdog's timeout is increased
to some good-enough value (3 mins). That keeps watchdog always running
and guarantees that VM doesn't stuck.

Provide new WDIOS_RUN_ON_REBOOT and WDIOS_STOP_ON_REBOOT ioctl options
to set up strategy on reboot.

Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 drivers/watchdog/watchdog_dev.c | 10 ++++++++++
 include/linux/watchdog.h        |  6 ++++++
 include/uapi/linux/watchdog.h   |  3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8766dd93028f..00135e698946 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -754,6 +754,16 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
 		}
 		if (val & WDIOS_ENABLECARD)
 			err = watchdog_start(wdd);
+
+		if (val & WDIOS_RUN_ON_REBOOT) {
+			if (val & WDIOS_STOP_ON_REBOOT) {
+				err = -EINVAL;
+				break;
+			}
+			watchdog_run_on_reboot(wdd);
+		} else if (val & WDIOS_STOP_ON_REBOOT) {
+			watchdog_stop_on_reboot(wdd);
+		}
 		break;
 	case WDIOC_KEEPALIVE:
 		if (!(wdd->info->options & WDIOF_KEEPALIVEPING)) {
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 417d9f37077a..9e2ca7754631 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -150,6 +150,12 @@ static inline void watchdog_stop_on_reboot(struct watchdog_device *wdd)
 	set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
 }
 
+/* Use the following function to keep the watchdog running on reboot */
+static inline void watchdog_run_on_reboot(struct watchdog_device *wdd)
+{
+	clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
+}
+
 /* Use the following function to stop the watchdog when unregistering it */
 static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd)
 {
diff --git a/include/uapi/linux/watchdog.h b/include/uapi/linux/watchdog.h
index b15cde5c9054..bf19a5d3c987 100644
--- a/include/uapi/linux/watchdog.h
+++ b/include/uapi/linux/watchdog.h
@@ -53,6 +53,7 @@ struct watchdog_info {
 #define	WDIOS_DISABLECARD	0x0001	/* Turn off the watchdog timer */
 #define	WDIOS_ENABLECARD	0x0002	/* Turn on the watchdog timer */
 #define	WDIOS_TEMPPANIC		0x0004	/* Kernel panic on temperature trip */
-
+#define	WDIOS_RUN_ON_REBOOT	0x0008	/* Keep watchdog enabled on reboot */
+#define	WDIOS_STOP_ON_REBOOT	0x0010	/* Turn off the watchdog on reboot */
 
 #endif /* _UAPI_LINUX_WATCHDOG_H */
-- 
2.25.0

