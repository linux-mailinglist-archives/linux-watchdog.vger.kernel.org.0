Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2068294F22
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbfHSUhR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:17 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40408 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbfHSUhR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:17 -0400
Received: by mail-oi1-f195.google.com with SMTP id h21so2364719oie.7
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to;
        bh=ahYWgNn4ghDOFq3tmvRr1AkEjevCgPd/PVakoGoQrig=;
        b=iuTWR0ozAmPLu+zaANXoa0Kfu/rP0lzX+D/LQspkM9w6485DPEZsfqEHOqf36CXHRl
         28zJ/m5kf7s6J6smK+jNzWg6jgX19Nz1D1kKc+Z/kNRk9obn28o8OXzl5fkBqTXQIkXv
         LTo4hztcLFIIiR1XCRBuupRK+omBjwzxT8iV/DAp3yiEKO0R/njHCJWmvDUopGRyae9b
         8y2R7w9sTmEzLFaBzMWzpwiN35ODlvftxhN74oCuVeYLsmu+nfWecvv/AMrmoCsCIXxh
         Ez+yLagxW4x0j++/3yEa0AHcaVibwZmWBy68KRlAROBV3FtmRDRWhxoh9IQwlRuVR+Q1
         lEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to;
        bh=ahYWgNn4ghDOFq3tmvRr1AkEjevCgPd/PVakoGoQrig=;
        b=MRYRUI2XXAQtYjYFAtDt1QbKQSqL098vBN6SkCi1+zH1K8EsS/AiwOwRxjvJoJHe1Z
         sbVQoCMgolQu9KcKIKnVBdkWpsw7mrLs5L6tIPkjrky+T3vKWh6gyGT2KeaDbwRQHwfs
         m7F5d9HVkUeJn1SHpCtnHE5JQQwNynt/WHR6ii7AaEb8Ant7NVKQIAqpR9ode3lGQXSx
         U6NlpMYfJ6/wa58+teZXDyjsYVOroK6gCv0YX0eYmkH7SEz4GCuBXuTzw8lKQrZJAFrM
         hLKqEXZeCVIasb8znLW2j2XhHvBQbAKVSZVqAEOyCPxQk6XQInazQz6aewWVYMIDelbA
         SQFQ==
X-Gm-Message-State: APjAAAVGTkZz0Ne8vanDZvAO0sUVnuWs3RwJrmTX1Uj74PtKnuUrZ0hp
        gpn3rVhhzIMJXIVwP7gE2A==
X-Google-Smtp-Source: APXvYqwaqWVrtX6M0k9UKLOcEjflh2bf83FT0E0Sju2UR4QDm2RCoCYkt7wmS4nIQfDayV56sdgYZg==
X-Received: by 2002:aca:2109:: with SMTP id 9mr15087198oiz.59.1566247036216;
        Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
        by smtp.gmail.com with ESMTPSA id s24sm5971025otd.81.2019.08.19.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id 25A2A1805A8;
        Mon, 19 Aug 2019 20:37:14 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id 0B6C2302506; Mon, 19 Aug 2019 15:37:14 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 03/12] watchdog: Add a pretimeout governor to provide read data
Date:   Mon, 19 Aug 2019 15:37:02 -0500
Message-Id: <20190819203711.32599-4-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819203711.32599-1-minyard@acm.org>
References: <20190819203711.32599-1-minyard@acm.org>
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

When a pretimeout occurs, provide a byte of data on the watchdog
device.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/watchdog/Kconfig                | 16 +++++++++
 drivers/watchdog/Makefile               |  1 +
 drivers/watchdog/pretimeout_read_data.c | 47 +++++++++++++++++++++++++
 drivers/watchdog/watchdog_pretimeout.h  |  2 ++
 4 files changed, 66 insertions(+)
 create mode 100644 drivers/watchdog/pretimeout_read_data.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 8188963a405b..3578b7bc863c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -105,6 +105,14 @@ config WATCHDOG_PRETIMEOUT_GOV_PANIC
 	  Panic watchdog pretimeout governor, on watchdog pretimeout
 	  event put the kernel into panic.
 
+config WATCHDOG_PRETIMEOUT_GOV_READ_DATA
+	tristate "Read data watchdog pretimeout governor"
+	depends on WATCHDOG_CORE
+	default WATCHDOG_CORE
+	help
+	  Read data watchdog pretimeout governor, on watchdog pretimeout
+	  event provide a byte of data on the watchdog device.
+
 choice
 	prompt "Default Watchdog Pretimeout Governor"
 	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
@@ -129,6 +137,14 @@ config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
 	  a watchdog pretimeout event happens, consider that
 	  a watchdog feeder is dead and reboot is unavoidable.
 
+config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_READ_DATA
+	bool "read_data"
+	depends on WATCHDOG_PRETIMEOUT_GOV_READ_DATA
+	help
+	  Use read data watchdog pretimeout governor by default, if
+	  a watchdog pretimeout event happens, provide a byte of read
+	  data on the watchdog device.
+
 endchoice
 
 endif # WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 7caa920e7e60..9cfe4ad32dc4 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -12,6 +12,7 @@ watchdog-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV)	+= watchdog_pretimeout.o
 
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP)	+= pretimeout_noop.o
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC)	+= pretimeout_panic.o
+obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_READ_DATA)	+= pretimeout_read_data.o
 
 # Only one watchdog can succeed. We probe the ISA/PCI/USB based
 # watchdog-cards first, then the architecture specific watchdog
diff --git a/drivers/watchdog/pretimeout_read_data.c b/drivers/watchdog/pretimeout_read_data.c
new file mode 100644
index 000000000000..197e9d692044
--- /dev/null
+++ b/drivers/watchdog/pretimeout_read_data.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2019 MontaVista Software, LLC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/watchdog.h>
+
+#include "watchdog_pretimeout.h"
+
+/**
+ * pretimeout_read_data - Cause a read to return on the watchdog device.
+ * @wdd - watchdog_device
+ */
+static void pretimeout_read_data(struct watchdog_device *wdd)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&wdd->readlock, flags);
+	wdd->data_to_read = 1;
+	wake_up_interruptible(&wdd->read_q);
+	kill_fasync(&wdd->fasync_q, SIGIO, POLL_IN);
+	spin_unlock_irqrestore(&wdd->readlock, flags);
+}
+
+static struct watchdog_governor watchdog_gov_read_data = {
+	.name		= "read_data",
+	.pretimeout	= pretimeout_read_data,
+};
+
+static int __init watchdog_gov_read_data_register(void)
+{
+	return watchdog_register_governor(&watchdog_gov_read_data);
+}
+
+static void __exit watchdog_gov_read_data_unregister(void)
+{
+	watchdog_unregister_governor(&watchdog_gov_read_data);
+}
+module_init(watchdog_gov_read_data_register);
+module_exit(watchdog_gov_read_data_unregister);
+
+MODULE_AUTHOR("Corey Minyard <cminyard@mvista.com>");
+MODULE_DESCRIPTION("Read data watchdog pretimeout governor");
+MODULE_LICENSE("GPL");
diff --git a/drivers/watchdog/watchdog_pretimeout.h b/drivers/watchdog/watchdog_pretimeout.h
index a3f1abc68839..819517ed0138 100644
--- a/drivers/watchdog/watchdog_pretimeout.h
+++ b/drivers/watchdog/watchdog_pretimeout.h
@@ -28,6 +28,8 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
 #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"noop"
 #elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC)
 #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"panic"
+#elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_READ_DATA)
+#define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"read_data"
 #endif
 
 #else
-- 
2.17.1

