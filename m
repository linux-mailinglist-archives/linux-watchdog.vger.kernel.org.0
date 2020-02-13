Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA4215C9D5
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2020 19:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgBMSAM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Feb 2020 13:00:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34963 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbgBMSAM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Feb 2020 13:00:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id w12so7831116wrt.2
        for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2020 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXo3L4k48aibe+yP/A4EY8XTS9o1G2cK7ZyRw33XEt8=;
        b=D2KwX3UVhNBaSMtlGygi7ujusj8mKB5CcFanw7hjeEE722YbtHnWTNV13eGfVuFNic
         abEz7lOczVoEbxhOBIjwjHChdsNNJ83vitHq0RgebeASzJqg5/iVqBkCGex1dvQODZ6F
         SBZNsy/HbodwmxtTnB0YGepG07xMUnGSS+u5BDsJAXOya+C134E/cC1GTaIbMsGIp9w6
         v8olvCtghXvcl102ZRlwUmPAav21tepYq5Ogeq6AZQTkK1uoV7/ddYtGfqVcL4c5uza3
         J9SyiO8c6oKS64EbROwk8eV2Pl+ttxALeDPsbZ+xvL6E4tiXuiZdEesuLxpdaQEc5iiN
         h86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXo3L4k48aibe+yP/A4EY8XTS9o1G2cK7ZyRw33XEt8=;
        b=RfOkL+FDSDgN3iJevbqx5MCZnqY/6dfTXpxlDYBDJRh42eYJz/b2osrIzgE85Ip5Iv
         jmPJ6zVpv9yW22QkiyFIt5Xgm68atNRF/ax58PCP1v6n/xgLyW03gv2BbmXMxgFeQ30d
         TQ0kkZouOf3u6wo17FcmhJUmCUDO/FSfqFhkiFmUqPkjuvyj1WT9+xrdW1U/xPlzJ2t7
         iug7HuaeB9b5fq+trtPJJ/bsTf/YurFOdfloWkyK/rE+LUCVXLxhm6QIhctcS56EXyyK
         Y+0i6zDUe0DRwzwH/etc2CT2alNwpPdwuP9JLvGXgF2gPJntSw/Cpgkjs1ErKmRqHsgF
         eZbg==
X-Gm-Message-State: APjAAAUuapaYinmAi84S2vS518ZQiCv2Jq5jul6YEUarCoR9i3hZceh0
        ypLJHQrlsiv6MKX6tKVMbvFrqg==
X-Google-Smtp-Source: APXvYqyUsqTefNHa+WG1XIxQNt/pUPg/0tXe6oyOXxhPFPWFFV3tAT2SQrkX7z4Jz6q1Z1ekN+sbRg==
X-Received: by 2002:a05:6000:10c:: with SMTP id o12mr23253172wrx.106.1581616810553;
        Thu, 13 Feb 2020 10:00:10 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id z11sm3630089wrv.96.2020.02.13.10.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:00:10 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 2/2] watchdog/uapi: Add WDIOS_{RUN,STOP}_ON_REBOOT
Date:   Thu, 13 Feb 2020 17:59:58 +0000
Message-Id: <20200213175958.105914-3-dima@arista.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213175958.105914-1-dima@arista.com>
References: <20200213175958.105914-1-dima@arista.com>
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
 drivers/watchdog/watchdog_dev.c | 12 ++++++++++++
 include/linux/watchdog.h        |  6 ++++++
 include/uapi/linux/watchdog.h   |  3 ++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 8b5c742f24e8..c854cd0245db 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -753,6 +753,18 @@ static long watchdog_ioctl(struct file *file, unsigned int cmd,
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
+			err = 0;
+		} else if (val & WDIOS_STOP_ON_REBOOT) {
+			watchdog_stop_on_reboot(wdd);
+			err = 0;
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

