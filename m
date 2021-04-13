Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1471A35E31A
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 Apr 2021 17:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237436AbhDMPqS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 13 Apr 2021 11:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbhDMPqS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 13 Apr 2021 11:46:18 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F1AC061574
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 08:45:56 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id r9so26701425ejj.3
        for <linux-watchdog@vger.kernel.org>; Tue, 13 Apr 2021 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Cg7yH5qZaddhcRW67fhSVjpix8T+GjETAHWS1hoQT0=;
        b=qR/xgK+5Sq4Y8fTf5qgyS9UDjqmn66BXnh0/EhybMKXpUtYwChWcnh5POCn3bCjhfV
         4RacQ19vZCg8pN/0V208WTz7DGO+aHr1XwhPhzavJ2yYFeUs96DAQ5Ol3kcd4uk6i4y8
         oQFwqbDs06RY5F5qjvNqAWQMPOu6oMIVWT68eVI59yo5gzKD03beOlTpsXSo83FVaEcC
         ah6VNLhHo+iQ8m6SM4XJrnjPufm1rxxjy5Ds1cKkV9K4Czd3TR/9ztYlboL4coHxUxi8
         PNfrx+TLJ5yhWv4vkcoqt+qviiG4SarOtqqeg0AVmTc2OyaXQMwK0NuhwUdZD3crO1Vn
         DdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Cg7yH5qZaddhcRW67fhSVjpix8T+GjETAHWS1hoQT0=;
        b=WCGRR/v+38nvy3EIL0LCzah7ekk0wjzcejNebmJRhkqYSlsgeA8m4ql1aLCXrbLv67
         86/4qQ3VorUc1n4pGUYAcRBlb6wQSzMh/xBGMdsbOdlNANqu2/6ij87qHI9BoQ55wLfp
         r8CX2joA1I9/bv9TJk+lGZj4SKoEVszV1kEuNyJnHa0TSBjzH1TBWCf/tolVKkBvwDQ/
         RUsEMU3qG9Pr5l0jstsluN+iUDwscHjlaWpbws8vzDLGSQqVkb4M2yuF0TJRVyUKydWA
         g/Me9UXwiPbfwWR0BFPEPFf8ri1rsJ/sOE/zwOtqoDK/UQocFTDstC5M/wqCGjQJX7gC
         VQDA==
X-Gm-Message-State: AOAM530EFEvTGpoQgEGgq1OnmkxIZ/6mq8feCi8LvNGDgPitg5SH7wNv
        ml2JeGFSbD7zrgWD5lTY957qgHDpWUIMPQ==
X-Google-Smtp-Source: ABdhPJzHbJ3YVCNPGfh1TuLmv010wSpH+EXpvnP3qgOVJctxbs3gdHJbA3g/D+J/H2ea//596cf5Rw==
X-Received: by 2002:a17:906:37da:: with SMTP id o26mr14083098ejc.413.1618328755365;
        Tue, 13 Apr 2021 08:45:55 -0700 (PDT)
Received: from eichest-laptop.lan (77-57-203-148.dclient.hispeed.ch. [77.57.203.148])
        by smtp.gmail.com with ESMTPSA id y7sm9822721edq.88.2021.04.13.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:45:54 -0700 (PDT)
From:   Stefan Eichenberger <eichest@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [RFC] watchdog: pretimeout: add a notifier call chain governor
Date:   Tue, 13 Apr 2021 17:45:53 +0200
Message-Id: <20210413154553.1968039-1-eichest@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a governor which calls a notifier call chain. This allows the
registration of custom functions to the watchdog pretimeout. This is
useful when writing out-of-tree kernel modules and it is more similar to
the register_reboot_notifier or register_oom_notifier API.

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/watchdog/Kconfig               | 16 ++++++
 drivers/watchdog/Makefile              |  1 +
 drivers/watchdog/pretimeout_notifier.c | 73 ++++++++++++++++++++++++++
 drivers/watchdog/watchdog_pretimeout.h |  2 +
 include/linux/watchdog.h               |  5 ++
 5 files changed, 97 insertions(+)
 create mode 100644 drivers/watchdog/pretimeout_notifier.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 355100dad60a..ec019120effc 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -105,6 +105,14 @@ config WATCHDOG_PRETIMEOUT_GOV_PANIC
 	  Panic watchdog pretimeout governor, on watchdog pretimeout
 	  event put the kernel into panic.
 
+config WATCHDOG_PRETIMEOUT_GOV_NOTIFIER
+	tristate "Notifier watchdog pretimeout governor"
+	depends on WATCHDOG_CORE
+	default WATCHDOG_CORE
+	help
+	  Notifier watchdog pretimeout governor, on watchdog pretimeout
+	  event call a notifier call chain.
+
 choice
 	prompt "Default Watchdog Pretimeout Governor"
 	default WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
@@ -129,6 +137,14 @@ config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC
 	  a watchdog pretimeout event happens, consider that
 	  a watchdog feeder is dead and reboot is unavoidable.
 
+config WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOTIFIER
+	bool "notifier"
+	depends on WATCHDOG_PRETIMEOUT_GOV_NOTIFIER
+	help
+	  Use notifier watchdog pretimeout governor by default,
+	  if a watchdog pretiemout event happens, a notifier
+	  call chain is called.
+
 endchoice
 
 endif # WATCHDOG_PRETIMEOUT_GOV
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index a7eade8b4d45..cb63f4eb89bf 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -12,6 +12,7 @@ watchdog-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV)	+= watchdog_pretimeout.o
 
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP)	+= pretimeout_noop.o
 obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC)	+= pretimeout_panic.o
+obj-$(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOTIFIER)	+= pretimeout_notifier.o
 
 # Only one watchdog can succeed. We probe the ISA/PCI/USB based
 # watchdog-cards first, then the architecture specific watchdog
diff --git a/drivers/watchdog/pretimeout_notifier.c b/drivers/watchdog/pretimeout_notifier.c
new file mode 100644
index 000000000000..3f845c77ec44
--- /dev/null
+++ b/drivers/watchdog/pretimeout_notifier.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 Stefan Eichenberger <eichest@gmail.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/watchdog.h>
+
+#include "watchdog_pretimeout.h"
+
+BLOCKING_NOTIFIER_HEAD(watchdog_pretimeout_notifier_list);
+
+/**
+ * register_watchdog_pretimeout_notifier - Register function to be called on pretimeout
+ * @nb: Info about notifier function to be called
+ *
+ * Registers a function with the list of functions to be called when a watchdog pretimeout occurs.
+ *
+ * Currently always returns zero, as blocking_notifier_chain_register()
+ * always returns zero.
+ */
+int register_watchdog_pretimeout_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&watchdog_pretimeout_notifier_list, nb);
+}
+EXPORT_SYMBOL(register_watchdog_pretimeout_notifier);
+
+/**
+ * unregister_watchdog_pretimeout_notifier - Unregister previously registered pretimeout notifier
+ * @nb: Hook to be unregistered
+ *
+ * Unregisters a previously registered watchdog pretimeout notifier function.
+ *
+ * Returns zero on success, or %-ENOENT on failure.
+ */
+int unregister_watchdog_pretimeout_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&watchdog_pretimeout_notifier_list, nb);
+}
+EXPORT_SYMBOL(unregister_watchdog_pretimeout_notifier);
+
+/**
+ * pretimeout_notifier - Notify registred methods on pretimeout
+ * @wdd - watchdog_device
+ *
+ * Notify, watchdog has not been fed till pretimeout event.
+ */
+static void pretimeout_notifier(struct watchdog_device *wdd)
+{
+	blocking_notifier_call_chain(&watchdog_pretimeout_notifier_list, 0, wdd);
+}
+
+static struct watchdog_governor watchdog_gov_notifier = {
+	.name		= "notifier",
+	.pretimeout	= pretimeout_notifier,
+};
+
+static int __init watchdog_gov_notifier_register(void)
+{
+	return watchdog_register_governor(&watchdog_gov_notifier);
+}
+
+static void __exit watchdog_gov_notifier_unregister(void)
+{
+	watchdog_unregister_governor(&watchdog_gov_notifier);
+}
+module_init(watchdog_gov_notifier_register);
+module_exit(watchdog_gov_notifier_unregister);
+
+MODULE_AUTHOR("Stefan Eichenberger <eichest@gmail.com>");
+MODULE_DESCRIPTION("Notifier watchdog pretimeout governor");
+MODULE_LICENSE("GPL");
diff --git a/drivers/watchdog/watchdog_pretimeout.h b/drivers/watchdog/watchdog_pretimeout.h
index a3f1abc68839..bb00ca1fcadd 100644
--- a/drivers/watchdog/watchdog_pretimeout.h
+++ b/drivers/watchdog/watchdog_pretimeout.h
@@ -28,6 +28,8 @@ int watchdog_pretimeout_governor_set(struct watchdog_device *wdd,
 #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"noop"
 #elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC)
 #define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"panic"
+#elif IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOTIFIER)
+#define WATCHDOG_PRETIMEOUT_DEFAULT_GOV		"notifier"
 #endif
 
 #else
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6bb68b5..760beab1007f 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -215,4 +215,9 @@ int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
 /* devres register variant */
 int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
 
+#if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOTIFIER)
+int register_watchdog_pretimeout_notifier(struct notifier_block *nb);
+int unregister_watchdog_pretimeout_notifier(struct notifier_block *nb);
+#endif
+
 #endif  /* ifndef _LINUX_WATCHDOG_H */
-- 
2.27.0

