Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90FA359949
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Apr 2021 11:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDIJez (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Apr 2021 05:34:55 -0400
Received: from smtp.asem.it ([151.1.184.197]:60344 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231920AbhDIJex (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Apr 2021 05:34:53 -0400
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 8.0.0)
        with ESMTP id 0f1f874f5440409cb4c03deac448506e.MSG
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Apr 2021 11:34:37 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 9 Apr
 2021 11:34:35 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 9 Apr 2021 11:34:35 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1] watchdog: add new parameter to start the watchdog on module insertion
Date:   Fri, 9 Apr 2021 11:34:34 +0200
Message-ID: <20210409093434.2089459-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F16.60701FAC.0082,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The new parameter "start_enabled" starts the watchdog at the same time
of the module insertion.
This feature is very useful in embedded systems, to avoid cases where
the system hangs before reaching userspace.

This function can be also enabled in the kernel config, so can be
used when the watchdog driver is build as built-in.

This parameter involves the "core" section of the watchdog driver;
in this way it is common for all the watchdog hardware implementations.

Note: to use only for watchdog drivers which doesn't support this
      parameter by itself.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/watchdog/watchdog-parameters.rst |  5 +++++
 drivers/watchdog/Kconfig                       | 14 ++++++++++++++
 drivers/watchdog/watchdog_core.c               | 12 ++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 223c99361a30..623fd064df91 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -21,6 +21,11 @@ watchdog core:
 	timeout. Setting this to a non-zero value can be useful to ensure that
 	either userspace comes up properly, or the board gets reset and allows
 	fallback logic in the bootloader to try something else.
+    start_enabled:
+	Watchdog is started on module insertion. This option can be also
+	selected by kernel config (default=kernel config parameter).
+	Use only for watchdog drivers which doesn't support this parameter
+	by itself.
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0470dc15c085..c2a668d6bbbc 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -47,6 +47,20 @@ config WATCHDOG_NOWAYOUT
 	  get killed. If you say Y here, the watchdog cannot be stopped once
 	  it has been started.
 
+config WATCHDOG_START_ENABLED
+	bool "Start watchdog on module insertion"
+	help
+	  Say Y if you want to start the watchdog at the same time when the
+	  driver is loaded.
+	  This feature is very useful in embedded systems, to avoid cases where
+	  the system could hang before reaching userspace.
+	  This parameter involves the "core" section of the watchdog driver,
+	  in this way it is common for all the watchdog hardware
+	  implementations.
+
+	  Note: to use only for watchdog drivers which doesn't support this
+	        parameter by itself.
+
 config WATCHDOG_HANDLE_BOOT_ENABLED
 	bool "Update boot-enabled watchdog until userspace takes over"
 	default y
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 5df0a22e2cb4..5052ae355219 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -43,6 +43,11 @@ static int stop_on_reboot = -1;
 module_param(stop_on_reboot, int, 0444);
 MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
 
+static bool start_enabled = IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
+module_param(start_enabled, bool, 0444);
+MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion (default="
+	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED)) ")");
+
 /*
  * Deferred Registration infrastructure.
  *
@@ -224,6 +229,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	 * corrupted in a later stage then we expect a kernel panic!
 	 */
 
+	/* If required, start the watchdog immediately */
+	if (start_enabled) {
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		wdd->ops->start(wdd);
+		pr_info("Watchdog enabled\n");
+	}
+
 	/* Use alias for watchdog id if possible */
 	if (wdd->parent) {
 		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
-- 
2.25.1

