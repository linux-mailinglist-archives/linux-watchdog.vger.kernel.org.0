Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FC9330C35
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 12:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhCHLW0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 06:22:26 -0500
Received: from smtp.asem.it ([151.1.184.197]:58542 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229754AbhCHLWI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 06:22:08 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000850607.MSG 
        for <linux-watchdog@vger.kernel.org>; Mon, 08 Mar 2021 12:21:56 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 8 Mar
 2021 12:21:55 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 12:21:55 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v1 1/2] watchdog: add global watchdog kernel module parameters structure
Date:   Mon, 8 Mar 2021 12:21:50 +0100
Message-ID: <20210308112151.716315-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308112151.716315-1-f.suligoi@asem.it>
References: <20210308112151.716315-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F1A.604608D3.00A3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Different watchdog modules frequently require the same type of parameters
(for example: timeout, nowayout feature, start wdog on module insertion,
etc.).
Instead of adding this kind of module parameters independently to each
driver, the best solution is declaring each feature only once,
in the watchdog core.

In this way, each driver can read these "global" parameters and then,
if needed, implements them, according to the particular hw watchdog
characteristic.

Using this approach, it will be possible reduce some duplicate code
in the _new_ watchdog drivers and simplify the code maintenance.
Moreover, the code will be clearer, since the same kind of parameters
are often called with different names.
Just for example, reading the doc file:

Documentation/watchdog/watchdog-parameters.rst

the "timeout" feature is called in the following ways:

- timeout
- riowd_timeout
- margin
- heartbeat
- wdt_time
- timer_margin
- tmr_margin
- soft_margin
- timeout_ms

Obviously, we cannot remove these customized parameters from the code,
for compatibility reasons, but we can use this new "global" parameters
structure for the new watchdog drivers.

This patch adds the base structure to add the global parameters, starting
with some common integer data (timeout, ioport, irq) and a bitwise
"features" flag, where we can store some boolean features (verbose,
test_mode, start_enabled, nowayout, etc.)

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 Documentation/watchdog/index.rst              |  1 +
 .../watchdog-core-global-parameters.rst       | 74 +++++++++++++++++++
 drivers/watchdog/watchdog_core.c              | 74 +++++++++++++++++++
 include/linux/watchdog.h                      | 42 +++++++++++
 4 files changed, 191 insertions(+)
 create mode 100644 Documentation/watchdog/watchdog-core-global-parameters.rst

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index c177645081d8..5f7e0e694c42 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -13,6 +13,7 @@ Linux Watchdog Support
     watchdog-api
     watchdog-kernel-api
     watchdog-parameters
+    watchdog-core-global-parameters
     watchdog-pm
     wdt
     convert_drivers_to_kernel_api
diff --git a/Documentation/watchdog/watchdog-core-global-parameters.rst b/Documentation/watchdog/watchdog-core-global-parameters.rst
new file mode 100644
index 000000000000..332fe0c6ada0
--- /dev/null
+++ b/Documentation/watchdog/watchdog-core-global-parameters.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================
+Watchdog Core Global Parameters
+===============================
+
+Information for watchdog kernel modules developers.
+
+Introduction
+============
+
+Different watchdog modules frequently require the same type of parameters
+(for example: *timeout*, *nowayout* feature, *start_enabled* to start the
+watchdog on module insertion, etc.).
+Instead of adding this kind of module parameters independently to each driver,
+the best solution is declaring each feature only once, in the watchdog core.
+
+In this way, each driver can read these "global" parameters and then,
+if needed, can implement them, according to the particular hw watchdog
+characteristic.
+
+Using this approach, it is possible reduce some duplicate code in the *new*
+watchdog drivers and simplify the code maintenance.  Moreover, the code will
+be clearer, since the same kind of parameters are often called with different
+names (see Documentation/watchdog/watchdog-parameters.rst).
+Obviously, for compatibility reasons, we cannot remove the already existing
+parameters from the code of the various watchdog modules, but we can use this
+"global" approach for the new watchdog drivers.
+
+
+Global parameters declaration
+==============================
+
+The global parameters data structure is declared in include/linux/watchdog.h,
+as::
+
+	struct watchdog_global_parameters_struct {
+		int timeout;
+		int ioport;
+		int irq;
+		unsigned long features;
+		/* Bit numbers for features flags */
+		#define WDOG_GLOBAL_PARAM_VERBOSE	0
+		#define WDOG_GLOBAL_PARAM_TEST_MODE	1
+		#define WDOG_GLOBAL_PARAM_START_ENABLED	2
+		#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
+	};
+
+The variable "feature" is a bitwise flags container, to store boolean
+features, such as:
+
+* nowayout
+* start_enable
+* etc...
+
+Other variables can be added, to store some numerical values and other data
+required.
+
+The global parameters are declared (as usual for the module parameters) in the
+first part of drivers/watchdog/watchdog_core.c file.
+The above global data structure is then managed by the function
+*void global_parameters_init()*, in the same file.
+
+Global parameters use
+=====================
+
+Each watchdog driver, to check if one of the global parameters is enabled, can
+use the corresponding in-line function declared in include/linux/watchdog.h.
+At the moment the following functions are ready to use:
+
+* watchdog_global_param_verbose_enabled()
+* watchdog_global_param_test_mode_enabled()
+* watchdog_global_param_start_enabled()
+* watchdog_global_param_nowayout_enabled()
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 5df0a22e2cb4..fd710be22390 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -43,6 +43,78 @@ static int stop_on_reboot = -1;
 module_param(stop_on_reboot, int, 0444);
 MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
 
+/* verbose - Global parameter */
+static bool glob_param_verbose;
+module_param_named(verbose, glob_param_verbose, bool, 0);
+MODULE_PARM_DESC(verbose, "Add verbosity/debug messages");
+
+/* test_mode - Global parameter */
+static bool glob_param_test_mode;
+module_param_named(test_mode, glob_param_test_mode, bool, 0);
+MODULE_PARM_DESC(test_mode, "Watchdog testmode (1 = no reboot), default=0");
+
+/* start_enable - Global parameter */
+static bool glob_param_start_enabled;
+module_param_named(start_enabled, glob_param_start_enabled, bool, 0);
+MODULE_PARM_DESC(start_enabled, "Watchdog is started on module insertion "
+		"(default=0)");
+
+/* nowayout - Global parameter */
+static bool glob_param_nowayout = WATCHDOG_NOWAYOUT;
+module_param_named(nowayout, glob_param_nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
+		"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+/*
+ * Watchdog "global" kernel parameters, common for all wdog drivers.
+ *
+ * Sometimes different watchdog modules need the same type of parameters
+ * (for example: timeout, nowayout feature, start wdog on module insertion,
+ * etc.).
+ * Instead of add this kind of module parameters independently to each driver,
+ * the best solution is declare each feature only once, in the watchdog core.
+ *
+ * In this way, each driver can read these "global" parameters and then,
+ * if needed, implements them, according to the particular hw watchdog
+ * characteristic.
+ */
+struct watchdog_global_parameters_struct watchdog_global_parameters;
+EXPORT_SYMBOL_GPL(watchdog_global_parameters);
+
+/*
+ * Global parameters initialization
+ *
+ * Fill the watchdog "global" kernel parameters data structure, using the
+ * above defined module parameters.
+ */
+static void global_parameters_init(void)
+{
+	watchdog_global_parameters.features = 0;
+
+	if (glob_param_verbose) {
+		set_bit(WDOG_GLOBAL_PARAM_VERBOSE,
+			&watchdog_global_parameters.features);
+		pr_info("add verbosity/debug messages\n");
+	}
+
+	if (glob_param_test_mode) {
+		set_bit(WDOG_GLOBAL_PARAM_TEST_MODE,
+			&watchdog_global_parameters.features);
+		pr_info("testmode activated\n");
+	}
+
+	if (glob_param_start_enabled) {
+		set_bit(WDOG_GLOBAL_PARAM_START_ENABLED,
+			&watchdog_global_parameters.features);
+		pr_info("watchdog is started on module insertion\n");
+	}
+
+	if (glob_param_nowayout) {
+		set_bit(WDOG_GLOBAL_PARAM_NOWAYOUT,
+			&watchdog_global_parameters.features);
+		pr_info("watchdog cannot be stopped once started\n");
+	}
+}
+
 /*
  * Deferred Registration infrastructure.
  *
@@ -421,6 +493,8 @@ static int __init watchdog_init(void)
 {
 	int err;
 
+	global_parameters_init();
+
 	err = watchdog_dev_init();
 	if (err < 0)
 		return err;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6bb68b5..049c1f703824 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -119,6 +119,20 @@ struct watchdog_device {
 	struct list_head deferred;
 };
 
+struct watchdog_global_parameters_struct {
+	int timeout;
+	int ioport;
+	int irq;
+	unsigned long features;
+/* Bit numbers for features flags */
+#define WDOG_GLOBAL_PARAM_VERBOSE	0
+#define WDOG_GLOBAL_PARAM_TEST_MODE	1
+#define WDOG_GLOBAL_PARAM_START_ENABLED	2
+#define WDOG_GLOBAL_PARAM_NOWAYOUT	3
+};
+
+extern struct watchdog_global_parameters_struct watchdog_global_parameters;
+
 #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)
 #define WATCHDOG_NOWAYOUT_INIT_STATUS	(WATCHDOG_NOWAYOUT << WDOG_NO_WAY_OUT)
 
@@ -193,6 +207,34 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
 	return wdd->driver_data;
 }
 
+/* Check if the global parameter verbose is enabled */
+static inline bool watchdog_global_param_verbose_enabled(void)
+{
+	return test_bit(WDOG_GLOBAL_PARAM_VERBOSE,
+		&watchdog_global_parameters.features);
+}
+
+/* Check if the global parameter test_mode is enabled */
+static inline bool watchdog_global_param_test_mode_enabled(void)
+{
+	return test_bit(WDOG_GLOBAL_PARAM_TEST_MODE,
+		&watchdog_global_parameters.features);
+}
+
+/* Check if the global parameter start_enabled is enabled */
+static inline bool watchdog_global_param_start_enabled(void)
+{
+	return test_bit(WDOG_GLOBAL_PARAM_START_ENABLED,
+		&watchdog_global_parameters.features);
+}
+
+/* Check if the global parameter nowayout is enabled */
+static inline bool watchdog_global_param_nowayout_enabled(void)
+{
+	return test_bit(WDOG_GLOBAL_PARAM_NOWAYOUT,
+		&watchdog_global_parameters.features);
+}
+
 /* Use the following functions to report watchdog pretimeout event */
 #if IS_ENABLED(CONFIG_WATCHDOG_PRETIMEOUT_GOV)
 void watchdog_notify_pretimeout(struct watchdog_device *wdd);
-- 
2.25.1

