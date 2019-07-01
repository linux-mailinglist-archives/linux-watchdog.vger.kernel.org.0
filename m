Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A5542DE9
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Jun 2019 19:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389807AbfFLRyk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Jun 2019 13:54:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40784 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389476AbfFLRxU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 13:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SXHP5HpTCxS0n+0N8Ut+tBqlzcfMCkvKsXH1wZl3iSQ=; b=BLkQcWp4ZBzObgFFYP6IDHUf5h
        FT0Hj8xpMpjaw2+gfaRDD4mVx2rhLU2cYEZiEO5Otua1YOm4h/spFFp9gpR8XdzMkwF+O7uX3LYm9
        ypfnD3dXPLrWmyGKTs7Qf2fahtv4wKF5+kN6ehSxfjckrIpC3/HH+5X1RuacclkCg04f1xYBmwPUs
        I26T4gOE/A9ojo01U4OlbURxAm4xxZ7bcbpMH41Bc/at2WzLNcsGmLejfQpYShyIyNeeAd+h05CS1
        EmdzCDvpDnQtdgx0Y7I20Yp9kYi6NrjwU0R0u/Rk09SmNtPIja6fg1IOZaBXrsPqh6L5fulcZ7qUK
        FzYzl/vA==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hb7Qy-0002Dt-2D; Wed, 12 Jun 2019 17:53:18 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hb7Qq-0001hZ-NA; Wed, 12 Jun 2019 14:53:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v4 25/28] docs: watchdog: convert docs to ReST and rename to *.rst
Date:   Wed, 12 Jun 2019 14:53:01 -0300
Message-Id: <a6bd98ebdef922c793461fda4e4990a231d8151e.1560361364.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560361364.git.mchehab+samsung@kernel.org>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert those documents and prepare them to be part of the kernel
API book, as most of the stuff there are related to the
Kernel interfaces.

Still, in the future, it would make sense to split the docs,
as some of the stuff is clearly focused on sysadmin tasks.

The conversion is actually:
  - add blank lines and identation in order to identify paragraphs;
  - fix tables markups;
  - add some lists markups;
  - mark literal blocks;
  - adjust title markups.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/kernel-per-CPU-kthreads.txt     |   2 +-
 ....txt => convert_drivers_to_kernel_api.rst} | 109 +--
 .../watchdog/{hpwdt.txt => hpwdt.rst}         |  25 +-
 Documentation/watchdog/index.rst              |  25 +
 .../watchdog/{mlx-wdt.txt => mlx-wdt.rst}     |  24 +-
 .../{pcwd-watchdog.txt => pcwd-watchdog.rst}  |  13 +-
 .../{watchdog-api.txt => watchdog-api.rst}    |  76 +-
 ...kernel-api.txt => watchdog-kernel-api.rst} |  91 ++-
 .../watchdog/watchdog-parameters.rst          | 736 ++++++++++++++++++
 .../watchdog/watchdog-parameters.txt          | 410 ----------
 .../{watchdog-pm.txt => watchdog-pm.rst}      |   3 +
 Documentation/watchdog/{wdt.txt => wdt.rst}   |  31 +-
 MAINTAINERS                                   |   2 +-
 drivers/watchdog/Kconfig                      |   6 +-
 drivers/watchdog/smsc37b787_wdt.c             |   2 +-
 16 files changed, 1004 insertions(+), 553 deletions(-)
 rename Documentation/watchdog/{convert_drivers_to_kernel_api.txt => convert_drivers_to_kernel_api.rst} (75%)
 rename Documentation/watchdog/{hpwdt.txt => hpwdt.rst} (79%)
 create mode 100644 Documentation/watchdog/index.rst
 rename Documentation/watchdog/{mlx-wdt.txt => mlx-wdt.rst} (78%)
 rename Documentation/watchdog/{pcwd-watchdog.txt => pcwd-watchdog.rst} (89%)
 rename Documentation/watchdog/{watchdog-api.txt => watchdog-api.rst} (80%)
 rename Documentation/watchdog/{watchdog-kernel-api.txt => watchdog-kernel-api.rst} (90%)
 create mode 100644 Documentation/watchdog/watchdog-parameters.rst
 delete mode 100644 Documentation/watchdog/watchdog-parameters.txt
 rename Documentation/watchdog/{watchdog-pm.txt => watchdog-pm.rst} (92%)
 rename Documentation/watchdog/{wdt.txt => wdt.rst} (68%)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0092a453f7dc..3d072ca532bb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5182,7 +5182,7 @@
 			Default: 3 = cyan.
 
 	watchdog timers	[HW,WDT] For information on watchdog timers,
-			see Documentation/watchdog/watchdog-parameters.txt
+			see Documentation/watchdog/watchdog-parameters.rst
 			or other driver-specific files in the
 			Documentation/watchdog/ directory.
 
diff --git a/Documentation/kernel-per-CPU-kthreads.txt b/Documentation/kernel-per-CPU-kthreads.txt
index 23b0c8b20cd1..5623b9916411 100644
--- a/Documentation/kernel-per-CPU-kthreads.txt
+++ b/Documentation/kernel-per-CPU-kthreads.txt
@@ -348,7 +348,7 @@ To reduce its OS jitter, do at least one of the following:
 2.	Boot with "nosoftlockup=0", which will also prevent these kthreads
 	from being created.  Other related watchdog and softlockup boot
 	parameters may be found in Documentation/admin-guide/kernel-parameters.rst
-	and Documentation/watchdog/watchdog-parameters.txt.
+	and Documentation/watchdog/watchdog-parameters.rst.
 3.	Echo a zero to /proc/sys/kernel/watchdog to disable the
 	watchdog timer.
 4.	Echo a large number of /proc/sys/kernel/watchdog_thresh in
diff --git a/Documentation/watchdog/convert_drivers_to_kernel_api.txt b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
similarity index 75%
rename from Documentation/watchdog/convert_drivers_to_kernel_api.txt
rename to Documentation/watchdog/convert_drivers_to_kernel_api.rst
index 9fffb2958d13..dd934cc08e40 100644
--- a/Documentation/watchdog/convert_drivers_to_kernel_api.txt
+++ b/Documentation/watchdog/convert_drivers_to_kernel_api.rst
@@ -1,6 +1,8 @@
+=========================================================
 Converting old watchdog drivers to the watchdog framework
+=========================================================
+
 by Wolfram Sang <w.sang@pengutronix.de>
-=========================================================
 
 Before the watchdog framework came into the kernel, every driver had to
 implement the API on its own. Now, as the framework factored out the common
@@ -69,16 +71,16 @@ Here is a overview of the functions and probably needed actions:
   -ENOIOCTLCMD, the IOCTLs of the framework will be tried, too. Any other error
   is directly given to the user.
 
-Example conversion:
+Example conversion::
 
--static const struct file_operations s3c2410wdt_fops = {
--       .owner          = THIS_MODULE,
--       .llseek         = no_llseek,
--       .write          = s3c2410wdt_write,
--       .unlocked_ioctl = s3c2410wdt_ioctl,
--       .open           = s3c2410wdt_open,
--       .release        = s3c2410wdt_release,
--};
+  -static const struct file_operations s3c2410wdt_fops = {
+  -       .owner          = THIS_MODULE,
+  -       .llseek         = no_llseek,
+  -       .write          = s3c2410wdt_write,
+  -       .unlocked_ioctl = s3c2410wdt_ioctl,
+  -       .open           = s3c2410wdt_open,
+  -       .release        = s3c2410wdt_release,
+  -};
 
 Check the functions for device-specific stuff and keep it for later
 refactoring. The rest can go.
@@ -89,24 +91,24 @@ Remove the miscdevice
 
 Since the file_operations are gone now, you can also remove the 'struct
 miscdevice'. The framework will create it on watchdog_dev_register() called by
-watchdog_register_device().
+watchdog_register_device()::
 
--static struct miscdevice s3c2410wdt_miscdev = {
--       .minor          = WATCHDOG_MINOR,
--       .name           = "watchdog",
--       .fops           = &s3c2410wdt_fops,
--};
+  -static struct miscdevice s3c2410wdt_miscdev = {
+  -       .minor          = WATCHDOG_MINOR,
+  -       .name           = "watchdog",
+  -       .fops           = &s3c2410wdt_fops,
+  -};
 
 
 Remove obsolete includes and defines
 ------------------------------------
 
 Because of the simplifications, a few defines are probably unused now. Remove
-them. Includes can be removed, too. For example:
+them. Includes can be removed, too. For example::
 
-- #include <linux/fs.h>
-- #include <linux/miscdevice.h> (if MODULE_ALIAS_MISCDEV is not used)
-- #include <linux/uaccess.h> (if no custom IOCTLs are used)
+  - #include <linux/fs.h>
+  - #include <linux/miscdevice.h> (if MODULE_ALIAS_MISCDEV is not used)
+  - #include <linux/uaccess.h> (if no custom IOCTLs are used)
 
 
 Add the watchdog operations
@@ -121,30 +123,30 @@ change the function header. Other changes are most likely not needed, because
 here simply happens the direct hardware access. If you have device-specific
 code left from the above steps, it should be refactored into these callbacks.
 
-Here is a simple example:
+Here is a simple example::
 
-+static struct watchdog_ops s3c2410wdt_ops = {
-+       .owner = THIS_MODULE,
-+       .start = s3c2410wdt_start,
-+       .stop = s3c2410wdt_stop,
-+       .ping = s3c2410wdt_keepalive,
-+       .set_timeout = s3c2410wdt_set_heartbeat,
-+};
+  +static struct watchdog_ops s3c2410wdt_ops = {
+  +       .owner = THIS_MODULE,
+  +       .start = s3c2410wdt_start,
+  +       .stop = s3c2410wdt_stop,
+  +       .ping = s3c2410wdt_keepalive,
+  +       .set_timeout = s3c2410wdt_set_heartbeat,
+  +};
 
-A typical function-header change looks like:
+A typical function-header change looks like::
 
--static void s3c2410wdt_keepalive(void)
-+static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
- {
-...
-+
-+       return 0;
- }
+  -static void s3c2410wdt_keepalive(void)
+  +static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
+   {
+  ...
+  +
+  +       return 0;
+   }
 
-...
+  ...
 
--       s3c2410wdt_keepalive();
-+       s3c2410wdt_keepalive(&s3c2410_wdd);
+  -       s3c2410wdt_keepalive();
+  +       s3c2410wdt_keepalive(&s3c2410_wdd);
 
 
 Add the watchdog device
@@ -159,12 +161,12 @@ static variables. Those have to be converted to use the members in
 watchdog_device. Note that the timeout values are unsigned int. Some drivers
 use signed int, so this has to be converted, too.
 
-Here is a simple example for a watchdog device:
+Here is a simple example for a watchdog device::
 
-+static struct watchdog_device s3c2410_wdd = {
-+       .info = &s3c2410_wdt_ident,
-+       .ops = &s3c2410wdt_ops,
-+};
+  +static struct watchdog_device s3c2410_wdd = {
+  +       .info = &s3c2410_wdt_ident,
+  +       .ops = &s3c2410wdt_ops,
+  +};
 
 
 Handle the 'nowayout' feature
@@ -173,12 +175,12 @@ Handle the 'nowayout' feature
 A few drivers use nowayout statically, i.e. there is no module parameter for it
 and only CONFIG_WATCHDOG_NOWAYOUT determines if the feature is going to be
 used. This needs to be converted by initializing the status variable of the
-watchdog_device like this:
+watchdog_device like this::
 
         .status = WATCHDOG_NOWAYOUT_INIT_STATUS,
 
 Most drivers, however, also allow runtime configuration of nowayout, usually
-by adding a module parameter. The conversion for this would be something like:
+by adding a module parameter. The conversion for this would be something like::
 
 	watchdog_set_nowayout(&s3c2410_wdd, nowayout);
 
@@ -191,15 +193,15 @@ Register the watchdog device
 
 Replace misc_register(&miscdev) with watchdog_register_device(&watchdog_dev).
 Make sure the return value gets checked and the error message, if present,
-still fits. Also convert the unregister case.
+still fits. Also convert the unregister case::
 
--       ret = misc_register(&s3c2410wdt_miscdev);
-+       ret = watchdog_register_device(&s3c2410_wdd);
+  -       ret = misc_register(&s3c2410wdt_miscdev);
+  +       ret = watchdog_register_device(&s3c2410_wdd);
 
-...
+  ...
 
--       misc_deregister(&s3c2410wdt_miscdev);
-+       watchdog_unregister_device(&s3c2410_wdd);
+  -       misc_deregister(&s3c2410wdt_miscdev);
+  +       watchdog_unregister_device(&s3c2410_wdd);
 
 
 Update the Kconfig-entry
@@ -207,7 +209,7 @@ Update the Kconfig-entry
 
 The entry for the driver now needs to select WATCHDOG_CORE:
 
-+       select WATCHDOG_CORE
+  +       select WATCHDOG_CORE
 
 
 Create a patch and send it to upstream
@@ -215,4 +217,3 @@ Create a patch and send it to upstream
 
 Make sure you understood Documentation/process/submitting-patches.rst and send your patch to
 linux-watchdog@vger.kernel.org. We are looking forward to it :)
-
diff --git a/Documentation/watchdog/hpwdt.txt b/Documentation/watchdog/hpwdt.rst
similarity index 79%
rename from Documentation/watchdog/hpwdt.txt
rename to Documentation/watchdog/hpwdt.rst
index aaa9e4b4bdcd..94a96371113e 100644
--- a/Documentation/watchdog/hpwdt.txt
+++ b/Documentation/watchdog/hpwdt.rst
@@ -1,7 +1,12 @@
+===========================
+HPE iLO NMI Watchdog Driver
+===========================
+
+for iLO based ProLiant Servers
+==============================
+
 Last reviewed: 08/20/2018
 
-                     HPE iLO NMI Watchdog Driver
-                   for iLO based ProLiant Servers
 
  The HPE iLO NMI Watchdog driver is a kernel module that provides basic
  watchdog functionality and handler for the iLO "Generate NMI to System"
@@ -20,23 +25,26 @@ Last reviewed: 08/20/2018
 
  The hpwdt driver also has the following module parameters:
 
- soft_margin - allows the user to set the watchdog timer value.
+ ============  ================================================================
+ soft_margin   allows the user to set the watchdog timer value.
                Default value is 30 seconds.
- timeout     - an alias of soft_margin.
- pretimeout  - allows the user to set the watchdog pretimeout value.
+ timeout       an alias of soft_margin.
+ pretimeout    allows the user to set the watchdog pretimeout value.
                This is the number of seconds before timeout when an
                NMI is delivered to the system. Setting the value to
                zero disables the pretimeout NMI.
                Default value is 9 seconds.
- nowayout    - basic watchdog parameter that does not allow the timer to
+ nowayout      basic watchdog parameter that does not allow the timer to
                be restarted or an impending ASR to be escaped.
                Default value is set when compiling the kernel. If it is set
                to "Y", then there is no way of disabling the watchdog once
                it has been started.
+ ============  ================================================================
 
- NOTE: More information about watchdog drivers in general, including the ioctl
+ NOTE:
+       More information about watchdog drivers in general, including the ioctl
        interface to /dev/watchdog can be found in
-       Documentation/watchdog/watchdog-api.txt and Documentation/IPMI.txt.
+       Documentation/watchdog/watchdog-api.rst and Documentation/IPMI.txt.
 
  Due to limitations in the iLO hardware, the NMI pretimeout if enabled,
  can only be set to 9 seconds.  Attempts to set pretimeout to other
@@ -63,4 +71,3 @@ Last reviewed: 08/20/2018
 
  The HPE iLO NMI Watchdog Driver and documentation were originally developed
  by Tom Mingarelli.
-
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
new file mode 100644
index 000000000000..33a0de631e84
--- /dev/null
+++ b/Documentation/watchdog/index.rst
@@ -0,0 +1,25 @@
+:orphan:
+
+======================
+Linux Watchdog Support
+======================
+
+.. toctree::
+    :maxdepth: 1
+
+    hpwdt
+    mlx-wdt
+    pcwd-watchdog
+    watchdog-api
+    watchdog-kernel-api
+    watchdog-parameters
+    watchdog-pm
+    wdt
+    convert_drivers_to_kernel_api
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/watchdog/mlx-wdt.txt b/Documentation/watchdog/mlx-wdt.rst
similarity index 78%
rename from Documentation/watchdog/mlx-wdt.txt
rename to Documentation/watchdog/mlx-wdt.rst
index 66eeb78505c3..bf5bafac47f0 100644
--- a/Documentation/watchdog/mlx-wdt.txt
+++ b/Documentation/watchdog/mlx-wdt.rst
@@ -1,5 +1,9 @@
-		Mellanox watchdog drivers
-		for x86 based system switches
+=========================
+Mellanox watchdog drivers
+=========================
+
+for x86 based system switches
+=============================
 
 This driver provides watchdog functionality for various Mellanox
 Ethernet and Infiniband switch systems.
@@ -9,16 +13,16 @@ Mellanox watchdog device is implemented in a programmable logic device.
 There are 2 types of HW watchdog implementations.
 
 Type 1:
-Actual HW timeout can be defined as a power of 2 msec.
-e.g. timeout 20 sec will be rounded up to 32768 msec.
-The maximum timeout period is 32 sec (32768 msec.),
-Get time-left isn't supported
+  Actual HW timeout can be defined as a power of 2 msec.
+  e.g. timeout 20 sec will be rounded up to 32768 msec.
+  The maximum timeout period is 32 sec (32768 msec.),
+  Get time-left isn't supported
 
 Type 2:
-Actual HW timeout is defined in sec. and it's the same as
-a user-defined timeout.
-Maximum timeout is 255 sec.
-Get time-left is supported.
+  Actual HW timeout is defined in sec. and it's the same as
+  a user-defined timeout.
+  Maximum timeout is 255 sec.
+  Get time-left is supported.
 
 Type 1 HW watchdog implementation exist in old systems and
 all new systems have type 2 HW watchdog.
diff --git a/Documentation/watchdog/pcwd-watchdog.txt b/Documentation/watchdog/pcwd-watchdog.rst
similarity index 89%
rename from Documentation/watchdog/pcwd-watchdog.txt
rename to Documentation/watchdog/pcwd-watchdog.rst
index b8e60a441a43..405e2a370082 100644
--- a/Documentation/watchdog/pcwd-watchdog.txt
+++ b/Documentation/watchdog/pcwd-watchdog.rst
@@ -1,8 +1,13 @@
+===================================
+Berkshire Products PC Watchdog Card
+===================================
+
 Last reviewed: 10/05/2007
 
-                     Berkshire Products PC Watchdog Card
-                   Support for ISA Cards  Revision A and C
-           Documentation and Driver by Ken Hollis <kenji@bitgate.com>
+Support for ISA Cards  Revision A and C
+=======================================
+
+Documentation and Driver by Ken Hollis <kenji@bitgate.com>
 
  The PC Watchdog is a card that offers the same type of functionality that
  the WDT card does, only it doesn't require an IRQ to run.  Furthermore,
@@ -33,6 +38,7 @@ Last reviewed: 10/05/2007
 	WDIOC_GETSUPPORT
 		This returns the support of the card itself.  This
 		returns in structure "PCWDS" which returns:
+
 			options = WDIOS_TEMPPANIC
 				  (This card supports temperature)
 			firmware_version = xxxx
@@ -63,4 +69,3 @@ Last reviewed: 10/05/2007
 
  -- Ken Hollis
     (kenji@bitgate.com)
-
diff --git a/Documentation/watchdog/watchdog-api.txt b/Documentation/watchdog/watchdog-api.rst
similarity index 80%
rename from Documentation/watchdog/watchdog-api.txt
rename to Documentation/watchdog/watchdog-api.rst
index 0e62ba33b7fb..c6c1e9fa9f73 100644
--- a/Documentation/watchdog/watchdog-api.txt
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -1,7 +1,10 @@
+=============================
+The Linux Watchdog driver API
+=============================
+
 Last reviewed: 10/05/2007
 
 
-The Linux Watchdog driver API.
 
 Copyright 2002 Christer Weingel <wingel@nano-system.com>
 
@@ -10,7 +13,8 @@ driver which is (c) Copyright 2000 Jakob Oestergaard <jakob@ostenfeld.dk>
 
 This document describes the state of the Linux 2.4.18 kernel.
 
-Introduction:
+Introduction
+============
 
 A Watchdog Timer (WDT) is a hardware circuit that can reset the
 computer system in case of a software fault.  You probably knew that
@@ -30,7 +34,8 @@ drivers implement different, and sometimes incompatible, parts of it.
 This file is an attempt to document the existing usage and allow
 future driver writers to use it as a reference.
 
-The simplest API:
+The simplest API
+================
 
 All drivers support the basic mode of operation, where the watchdog
 activates as soon as /dev/watchdog is opened and will reboot unless
@@ -54,7 +59,8 @@ after the timeout has passed. Watchdog devices also usually support
 the nowayout module parameter so that this option can be controlled at
 runtime.
 
-Magic Close feature:
+Magic Close feature
+===================
 
 If a driver supports "Magic Close", the driver will not disable the
 watchdog unless a specific magic character 'V' has been sent to
@@ -64,7 +70,8 @@ will assume that the daemon (and userspace in general) died, and will
 stop pinging the watchdog without disabling it first.  This will then
 cause a reboot if the watchdog is not re-opened in sufficient time.
 
-The ioctl API:
+The ioctl API
+=============
 
 All conforming drivers also support an ioctl API.
 
@@ -73,7 +80,7 @@ Pinging the watchdog using an ioctl:
 All drivers that have an ioctl interface support at least one ioctl,
 KEEPALIVE.  This ioctl does exactly the same thing as a write to the
 watchdog device, so the main loop in the above program could be
-replaced with:
+replaced with::
 
 	while (1) {
 		ioctl(fd, WDIOC_KEEPALIVE, 0);
@@ -82,14 +89,15 @@ replaced with:
 
 the argument to the ioctl is ignored.
 
-Setting and getting the timeout:
+Setting and getting the timeout
+===============================
 
 For some drivers it is possible to modify the watchdog timeout on the
 fly with the SETTIMEOUT ioctl, those drivers have the WDIOF_SETTIMEOUT
 flag set in their option field.  The argument is an integer
 representing the timeout in seconds.  The driver returns the real
 timeout used in the same variable, and this timeout might differ from
-the requested one due to limitation of the hardware.
+the requested one due to limitation of the hardware::
 
     int timeout = 45;
     ioctl(fd, WDIOC_SETTIMEOUT, &timeout);
@@ -99,18 +107,19 @@ This example might actually print "The timeout was set to 60 seconds"
 if the device has a granularity of minutes for its timeout.
 
 Starting with the Linux 2.4.18 kernel, it is possible to query the
-current timeout using the GETTIMEOUT ioctl.
+current timeout using the GETTIMEOUT ioctl::
 
     ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
     printf("The timeout was is %d seconds\n", timeout);
 
-Pretimeouts:
+Pretimeouts
+===========
 
 Some watchdog timers can be set to have a trigger go off before the
 actual time they will reset the system.  This can be done with an NMI,
 interrupt, or other mechanism.  This allows Linux to record useful
 information (like panic information and kernel coredumps) before it
-resets.
+resets::
 
     pretimeout = 10;
     ioctl(fd, WDIOC_SETPRETIMEOUT, &pretimeout);
@@ -121,89 +130,113 @@ the pretimeout.  So, for instance, if you set the timeout to 60 seconds
 and the pretimeout to 10 seconds, the pretimeout will go off in 50
 seconds.  Setting a pretimeout to zero disables it.
 
-There is also a get function for getting the pretimeout:
+There is also a get function for getting the pretimeout::
 
     ioctl(fd, WDIOC_GETPRETIMEOUT, &timeout);
     printf("The pretimeout was is %d seconds\n", timeout);
 
 Not all watchdog drivers will support a pretimeout.
 
-Get the number of seconds before reboot:
+Get the number of seconds before reboot
+=======================================
 
 Some watchdog drivers have the ability to report the remaining time
 before the system will reboot. The WDIOC_GETTIMELEFT is the ioctl
-that returns the number of seconds before reboot.
+that returns the number of seconds before reboot::
 
     ioctl(fd, WDIOC_GETTIMELEFT, &timeleft);
     printf("The timeout was is %d seconds\n", timeleft);
 
-Environmental monitoring:
+Environmental monitoring
+========================
 
 All watchdog drivers are required return more information about the system,
 some do temperature, fan and power level monitoring, some can tell you
 the reason for the last reboot of the system.  The GETSUPPORT ioctl is
-available to ask what the device can do:
+available to ask what the device can do::
 
 	struct watchdog_info ident;
 	ioctl(fd, WDIOC_GETSUPPORT, &ident);
 
 the fields returned in the ident struct are:
 
+	================	=============================================
         identity		a string identifying the watchdog driver
 	firmware_version	the firmware version of the card if available
 	options			a flags describing what the device supports
+	================	=============================================
 
 the options field can have the following bits set, and describes what
 kind of information that the GET_STATUS and GET_BOOT_STATUS ioctls can
 return.   [FIXME -- Is this correct?]
 
+	================	=========================
 	WDIOF_OVERHEAT		Reset due to CPU overheat
+	================	=========================
 
 The machine was last rebooted by the watchdog because the thermal limit was
-exceeded
+exceeded:
 
+	==============		==========
 	WDIOF_FANFAULT		Fan failed
+	==============		==========
 
 A system fan monitored by the watchdog card has failed
 
+	=============		================
 	WDIOF_EXTERN1		External relay 1
+	=============		================
 
 External monitoring relay/source 1 was triggered. Controllers intended for
 real world applications include external monitoring pins that will trigger
 a reset.
 
+	=============		================
 	WDIOF_EXTERN2		External relay 2
+	=============		================
 
 External monitoring relay/source 2 was triggered
 
+	================	=====================
 	WDIOF_POWERUNDER	Power bad/power fault
+	================	=====================
 
 The machine is showing an undervoltage status
 
+	===============		=============================
 	WDIOF_CARDRESET		Card previously reset the CPU
+	===============		=============================
 
 The last reboot was caused by the watchdog card
 
+	================	=====================
 	WDIOF_POWEROVER		Power over voltage
+	================	=====================
 
 The machine is showing an overvoltage status. Note that if one level is
 under and one over both bits will be set - this may seem odd but makes
 sense.
 
+	===================	=====================
 	WDIOF_KEEPALIVEPING	Keep alive ping reply
+	===================	=====================
 
 The watchdog saw a keepalive ping since it was last queried.
 
+	================	=======================
 	WDIOF_SETTIMEOUT	Can set/get the timeout
+	================	=======================
 
 The watchdog can do pretimeouts.
 
+	================	================================
 	WDIOF_PRETIMEOUT	Pretimeout (in seconds), get/set
+	================	================================
 
 
 For those drivers that return any bits set in the option field, the
 GETSTATUS and GETBOOTSTATUS ioctls can be used to ask for the current
-status, and the status at the last reboot, respectively.  
+status, and the status at the last reboot, respectively::
 
     int flags;
     ioctl(fd, WDIOC_GETSTATUS, &flags);
@@ -216,22 +249,23 @@ Note that not all devices support these two calls, and some only
 support the GETBOOTSTATUS call.
 
 Some drivers can measure the temperature using the GETTEMP ioctl.  The
-returned value is the temperature in degrees fahrenheit.
+returned value is the temperature in degrees fahrenheit::
 
     int temperature;
     ioctl(fd, WDIOC_GETTEMP, &temperature);
 
 Finally the SETOPTIONS ioctl can be used to control some aspects of
-the cards operation.
+the cards operation::
 
     int options = 0;
     ioctl(fd, WDIOC_SETOPTIONS, &options);
 
 The following options are available:
 
+	=================	================================
 	WDIOS_DISABLECARD	Turn off the watchdog timer
 	WDIOS_ENABLECARD	Turn on the watchdog timer
 	WDIOS_TEMPPANIC		Kernel panic on temperature trip
+	=================	================================
 
 [FIXME -- better explanations]
-
diff --git a/Documentation/watchdog/watchdog-kernel-api.txt b/Documentation/watchdog/watchdog-kernel-api.rst
similarity index 90%
rename from Documentation/watchdog/watchdog-kernel-api.txt
rename to Documentation/watchdog/watchdog-kernel-api.rst
index 3a91ef5af044..864edbe932c1 100644
--- a/Documentation/watchdog/watchdog-kernel-api.txt
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -1,5 +1,7 @@
-The Linux WatchDog Timer Driver Core kernel API.
 ===============================================
+The Linux WatchDog Timer Driver Core kernel API
+===============================================
+
 Last reviewed: 12-Feb-2013
 
 Wim Van Sebroeck <wim@iguana.be>
@@ -9,7 +11,7 @@ Introduction
 This document does not describe what a WatchDog Timer (WDT) Driver or Device is.
 It also does not describe the API which can be used by user space to communicate
 with a WatchDog Timer. If you want to know this then please read the following
-file: Documentation/watchdog/watchdog-api.txt .
+file: Documentation/watchdog/watchdog-api.rst .
 
 So what does this document describe? It describes the API that can be used by
 WatchDog Timer Drivers that want to use the WatchDog Timer Driver Core
@@ -23,10 +25,10 @@ The API
 Each watchdog timer driver that wants to use the WatchDog Timer Driver Core
 must #include <linux/watchdog.h> (you would have to do this anyway when
 writing a watchdog device driver). This include file contains following
-register/unregister routines:
+register/unregister routines::
 
-extern int watchdog_register_device(struct watchdog_device *);
-extern void watchdog_unregister_device(struct watchdog_device *);
+	extern int watchdog_register_device(struct watchdog_device *);
+	extern void watchdog_unregister_device(struct watchdog_device *);
 
 The watchdog_register_device routine registers a watchdog timer device.
 The parameter of this routine is a pointer to a watchdog_device structure.
@@ -40,9 +42,9 @@ The watchdog subsystem includes an registration deferral mechanism,
 which allows you to register an watchdog as early as you wish during
 the boot process.
 
-The watchdog device structure looks like this:
+The watchdog device structure looks like this::
 
-struct watchdog_device {
+  struct watchdog_device {
 	int id;
 	struct device *parent;
 	const struct attribute_group **groups;
@@ -62,9 +64,10 @@ struct watchdog_device {
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
 	struct list_head deferred;
-};
+  };
 
 It contains following fields:
+
 * id: set by watchdog_register_device, id 0 is special. It has both a
   /dev/watchdog0 cdev (dynamic major, minor 0) as well as the old
   /dev/watchdog miscdev. The id is set automatically when calling
@@ -114,9 +117,9 @@ It contains following fields:
 * deferred: entry in wtd_deferred_reg_list which is used to
   register early initialized watchdogs.
 
-The list of watchdog operations is defined as:
+The list of watchdog operations is defined as::
 
-struct watchdog_ops {
+  struct watchdog_ops {
 	struct module *owner;
 	/* mandatory operations */
 	int (*start)(struct watchdog_device *);
@@ -129,7 +132,7 @@ struct watchdog_ops {
 	unsigned int (*get_timeleft)(struct watchdog_device *);
 	int (*restart)(struct watchdog_device *);
 	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
-};
+  };
 
 It is important that you first define the module owner of the watchdog timer
 driver's operations. This module owner will be used to lock the module when
@@ -138,6 +141,7 @@ module and /dev/watchdog is still open).
 
 Some operations are mandatory and some are optional. The mandatory operations
 are:
+
 * start: this is a pointer to the routine that starts the watchdog timer
   device.
   The routine needs a pointer to the watchdog timer device structure as a
@@ -146,51 +150,64 @@ are:
 Not all watchdog timer hardware supports the same functionality. That's why
 all other routines/operations are optional. They only need to be provided if
 they are supported. These optional routines/operations are:
+
 * stop: with this routine the watchdog timer device is being stopped.
+
   The routine needs a pointer to the watchdog timer device structure as a
   parameter. It returns zero on success or a negative errno code for failure.
   Some watchdog timer hardware can only be started and not be stopped. A
   driver supporting such hardware does not have to implement the stop routine.
+
   If a driver has no stop function, the watchdog core will set WDOG_HW_RUNNING
   and start calling the driver's keepalive pings function after the watchdog
   device is closed.
+
   If a watchdog driver does not implement the stop function, it must set
   max_hw_heartbeat_ms.
 * ping: this is the routine that sends a keepalive ping to the watchdog timer
   hardware.
+
   The routine needs a pointer to the watchdog timer device structure as a
   parameter. It returns zero on success or a negative errno code for failure.
+
   Most hardware that does not support this as a separate function uses the
   start function to restart the watchdog timer hardware. And that's also what
   the watchdog timer driver core does: to send a keepalive ping to the watchdog
   timer hardware it will either use the ping operation (when available) or the
   start operation (when the ping operation is not available).
+
   (Note: the WDIOC_KEEPALIVE ioctl call will only be active when the
   WDIOF_KEEPALIVEPING bit has been set in the option field on the watchdog's
   info structure).
 * status: this routine checks the status of the watchdog timer device. The
   status of the device is reported with watchdog WDIOF_* status flags/bits.
+
   WDIOF_MAGICCLOSE and WDIOF_KEEPALIVEPING are reported by the watchdog core;
   it is not necessary to report those bits from the driver. Also, if no status
   function is provided by the driver, the watchdog core reports the status bits
   provided in the bootstatus variable of struct watchdog_device.
+
 * set_timeout: this routine checks and changes the timeout of the watchdog
   timer device. It returns 0 on success, -EINVAL for "parameter out of range"
   and -EIO for "could not write value to the watchdog". On success this
   routine should set the timeout value of the watchdog_device to the
   achieved timeout value (which may be different from the requested one
   because the watchdog does not necessarily have a 1 second resolution).
+
   Drivers implementing max_hw_heartbeat_ms set the hardware watchdog heartbeat
   to the minimum of timeout and max_hw_heartbeat_ms. Those drivers set the
   timeout value of the watchdog_device either to the requested timeout value
   (if it is larger than max_hw_heartbeat_ms), or to the achieved timeout value.
   (Note: the WDIOF_SETTIMEOUT needs to be set in the options field of the
   watchdog's info structure).
+
   If the watchdog driver does not have to perform any action but setting the
   watchdog_device.timeout, this callback can be omitted.
+
   If set_timeout is not provided but, WDIOF_SETTIMEOUT is set, the watchdog
   infrastructure updates the timeout value of the watchdog_device internally
   to the requested value.
+
   If the pretimeout feature is used (WDIOF_PRETIMEOUT), then set_timeout must
   also take care of checking if pretimeout is still valid and set up the timer
   accordingly. This can't be done in the core without races, so it is the
@@ -201,13 +218,16 @@ they are supported. These optional routines/operations are:
   seconds before the actual timeout would happen. It returns 0 on success,
   -EINVAL for "parameter out of range" and -EIO for "could not write value to
   the watchdog". A value of 0 disables pretimeout notification.
+
   (Note: the WDIOF_PRETIMEOUT needs to be set in the options field of the
   watchdog's info structure).
+
   If the watchdog driver does not have to perform any action but setting the
   watchdog_device.pretimeout, this callback can be omitted. That means if
   set_pretimeout is not provided but WDIOF_PRETIMEOUT is set, the watchdog
   infrastructure updates the pretimeout value of the watchdog_device internally
   to the requested value.
+
 * get_timeleft: this routines returns the time that's left before a reset.
 * restart: this routine restarts the machine. It returns 0 on success or a
   negative errno code for failure.
@@ -218,6 +238,7 @@ they are supported. These optional routines/operations are:
 
 The status bits should (preferably) be set with the set_bit and clear_bit alike
 bit-operations. The status bits that are defined are:
+
 * WDOG_ACTIVE: this status bit indicates whether or not a watchdog timer device
   is active or not from user perspective. User space is expected to send
   heartbeat requests to the driver while this flag is set.
@@ -235,22 +256,30 @@ bit-operations. The status bits that are defined are:
 
   To set the WDOG_NO_WAY_OUT status bit (before registering your watchdog
   timer device) you can either:
+
   * set it statically in your watchdog_device struct with
+
 	.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
+
     (this will set the value the same as CONFIG_WATCHDOG_NOWAYOUT) or
-  * use the following helper function:
-  static inline void watchdog_set_nowayout(struct watchdog_device *wdd, int nowayout)
+  * use the following helper function::
+
+	static inline void watchdog_set_nowayout(struct watchdog_device *wdd,
+						 int nowayout)
+
+Note:
+   The WatchDog Timer Driver Core supports the magic close feature and
+   the nowayout feature. To use the magic close feature you must set the
+   WDIOF_MAGICCLOSE bit in the options field of the watchdog's info structure.
 
-Note: The WatchDog Timer Driver Core supports the magic close feature and
-the nowayout feature. To use the magic close feature you must set the
-WDIOF_MAGICCLOSE bit in the options field of the watchdog's info structure.
 The nowayout feature will overrule the magic close feature.
 
 To get or set driver specific data the following two helper functions should be
-used:
+used::
 
-static inline void watchdog_set_drvdata(struct watchdog_device *wdd, void *data)
-static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
+  static inline void watchdog_set_drvdata(struct watchdog_device *wdd,
+					  void *data)
+  static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
 
 The watchdog_set_drvdata function allows you to add driver specific data. The
 arguments of this function are the watchdog device where you want to add the
@@ -260,10 +289,11 @@ The watchdog_get_drvdata function allows you to retrieve driver specific data.
 The argument of this function is the watchdog device where you want to retrieve
 data from. The function returns the pointer to the driver specific data.
 
-To initialize the timeout field, the following function can be used:
+To initialize the timeout field, the following function can be used::
 
-extern int watchdog_init_timeout(struct watchdog_device *wdd,
-                                  unsigned int timeout_parm, struct device *dev);
+  extern int watchdog_init_timeout(struct watchdog_device *wdd,
+                                   unsigned int timeout_parm,
+                                   struct device *dev);
 
 The watchdog_init_timeout function allows you to initialize the timeout field
 using the module timeout parameter or by retrieving the timeout-sec property from
@@ -272,30 +302,33 @@ to set the default timeout value as timeout value in the watchdog_device and
 then use this function to set the user "preferred" timeout value.
 This routine returns zero on success and a negative errno code for failure.
 
-To disable the watchdog on reboot, the user must call the following helper:
+To disable the watchdog on reboot, the user must call the following helper::
 
-static inline void watchdog_stop_on_reboot(struct watchdog_device *wdd);
+  static inline void watchdog_stop_on_reboot(struct watchdog_device *wdd);
 
 To disable the watchdog when unregistering the watchdog, the user must call
 the following helper. Note that this will only stop the watchdog if the
 nowayout flag is not set.
 
-static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd);
+::
+
+  static inline void watchdog_stop_on_unregister(struct watchdog_device *wdd);
 
 To change the priority of the restart handler the following helper should be
-used:
+used::
 
-void watchdog_set_restart_priority(struct watchdog_device *wdd, int priority);
+  void watchdog_set_restart_priority(struct watchdog_device *wdd, int priority);
 
 User should follow the following guidelines for setting the priority:
+
 * 0: should be called in last resort, has limited restart capabilities
 * 128: default restart handler, use if no other handler is expected to be
   available, and/or if restart is sufficient to restart the entire system
 * 255: highest priority, will preempt all other restart handlers
 
-To raise a pretimeout notification, the following function should be used:
+To raise a pretimeout notification, the following function should be used::
 
-void watchdog_notify_pretimeout(struct watchdog_device *wdd)
+  void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 
 The function can be called in the interrupt context. If watchdog pretimeout
 governor framework (kbuild CONFIG_WATCHDOG_PRETIMEOUT_GOV symbol) is enabled,
diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
new file mode 100644
index 000000000000..b121caae7798
--- /dev/null
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -0,0 +1,736 @@
+==========================
+WatchDog Module Parameters
+==========================
+
+This file provides information on the module parameters of many of
+the Linux watchdog drivers.  Watchdog driver parameter specs should
+be listed here unless the driver has its own driver-specific information
+file.
+
+See Documentation/admin-guide/kernel-parameters.rst for information on
+providing kernel parameters for builtin drivers versus loadable
+modules.
+
+-------------------------------------------------
+
+acquirewdt:
+    wdt_stop:
+	Acquire WDT 'stop' io port (default 0x43)
+    wdt_start:
+	Acquire WDT 'start' io port (default 0x443)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+advantechwdt:
+    wdt_stop:
+	Advantech WDT 'stop' io port (default 0x443)
+    wdt_start:
+	Advantech WDT 'start' io port (default 0x443)
+    timeout:
+	Watchdog timeout in seconds. 1<= timeout <=63, default=60.
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+alim1535_wdt:
+    timeout:
+	Watchdog timeout in seconds. (0 < timeout < 18000, default=60
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+alim7101_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=3600, default=30
+    use_gpio:
+	Use the gpio watchdog (required by old cobalt boards).
+	default=0/off/no
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ar7_wdt:
+    margin:
+	Watchdog margin in seconds (default=60)
+    nowayout:
+	Disable watchdog shutdown on close
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+armada_37xx_wdt:
+    timeout:
+	Watchdog timeout in seconds. (default=120)
+    nowayout:
+	Disable watchdog shutdown on close
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+at91rm9200_wdt:
+    wdt_time:
+	Watchdog time in seconds. (default=5)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+at91sam9_wdt:
+    heartbeat:
+	Watchdog heartbeats in seconds. (default = 15)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+bcm47xx_wdt:
+    wdt_time:
+	Watchdog time in seconds. (default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+coh901327_wdt:
+    margin:
+	Watchdog margin in seconds (default 60s)
+
+-------------------------------------------------
+
+cpu5wdt:
+    port:
+	base address of watchdog card, default is 0x91
+    verbose:
+	be verbose, default is 0 (no)
+    ticks:
+	count down ticks, default is 10000
+
+-------------------------------------------------
+
+cpwd:
+    wd0_timeout:
+	Default watchdog0 timeout in 1/10secs
+    wd1_timeout:
+	Default watchdog1 timeout in 1/10secs
+    wd2_timeout:
+	Default watchdog2 timeout in 1/10secs
+
+-------------------------------------------------
+
+da9052wdt:
+    timeout:
+	Watchdog timeout in seconds. 2<= timeout <=131, default=2.048s
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+davinci_wdt:
+    heartbeat:
+	Watchdog heartbeat period in seconds from 1 to 600, default 60
+
+-------------------------------------------------
+
+ebc-c384_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=15300, default=60)
+    nowayout:
+	Watchdog cannot be stopped once started
+
+-------------------------------------------------
+
+ep93xx_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=3600, default=TBD)
+
+-------------------------------------------------
+
+eurotechwdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    io:
+	Eurotech WDT io port (default=0x3f0)
+    irq:
+	Eurotech WDT irq (default=10)
+    ev:
+	Eurotech WDT event type (default is `int`)
+
+-------------------------------------------------
+
+gef_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+geodewdt:
+    timeout:
+	Watchdog timeout in seconds. 1<= timeout <=131, default=60.
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+i6300esb:
+    heartbeat:
+	Watchdog heartbeat in seconds. (1<heartbeat<2046, default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+iTCO_wdt:
+    heartbeat:
+	Watchdog heartbeat in seconds.
+	(2<heartbeat<39 (TCO v1) or 613 (TCO v2), default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+iTCO_vendor_support:
+    vendorsupport:
+	iTCO vendor specific support mode, default=0 (none),
+	1=SuperMicro Pent3, 2=SuperMicro Pent4+, 911=Broken SMI BIOS
+
+-------------------------------------------------
+
+ib700wdt:
+    timeout:
+	Watchdog timeout in seconds. 0<= timeout <=30, default=30.
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ibmasr:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+imx2_wdt:
+    timeout:
+	Watchdog timeout in seconds (default 60 s)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+indydog:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+iop_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+it8712f_wdt:
+    margin:
+	Watchdog margin in seconds (default 60)
+    nowayout:
+	Disable watchdog shutdown on close
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+it87_wdt:
+    nogameport:
+	Forbid the activation of game port, default=0
+    nocir:
+	Forbid the use of CIR (workaround for some buggy setups); set to 1 if
+system resets despite watchdog daemon running, default=0
+    exclusive:
+	Watchdog exclusive device open, default=1
+    timeout:
+	Watchdog timeout in seconds, default=60
+    testmode:
+	Watchdog test mode (1 = no reboot), default=0
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ixp4xx_wdt:
+    heartbeat:
+	Watchdog heartbeat in seconds (default 60s)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ks8695_wdt:
+    wdt_time:
+	Watchdog time in seconds. (default=5)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+machzwd:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    action:
+	after watchdog resets, generate:
+	0 = RESET(*)  1 = SMI  2 = NMI  3 = SCI
+
+-------------------------------------------------
+
+max63xx_wdt:
+    heartbeat:
+	Watchdog heartbeat period in seconds from 1 to 60, default 60
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    nodelay:
+	Force selection of a timeout setting without initial delay
+	(max6373/74 only, default=0)
+
+-------------------------------------------------
+
+mixcomwd:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+mpc8xxx_wdt:
+    timeout:
+	Watchdog timeout in ticks. (0<timeout<65536, default=65535)
+    reset:
+	Watchdog Interrupt/Reset Mode. 0 = interrupt, 1 = reset
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+mv64x60_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ni903x_wdt:
+    timeout:
+	Initial watchdog timeout in seconds (0<timeout<516, default=60)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+nic7018_wdt:
+    timeout:
+	Initial watchdog timeout in seconds (0<timeout<464, default=80)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+nuc900_wdt:
+    heartbeat:
+	Watchdog heartbeats in seconds.
+	(default = 15)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+omap_wdt:
+    timer_margin:
+	initial watchdog timeout (in seconds)
+    early_enable:
+	Watchdog is started on module insertion (default=0
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+orion_wdt:
+    heartbeat:
+	Initial watchdog heartbeat in seconds
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+pc87413_wdt:
+    io:
+	pc87413 WDT I/O port (default: io).
+    timeout:
+	Watchdog timeout in minutes (default=timeout).
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+pika_wdt:
+    heartbeat:
+	Watchdog heartbeats in seconds. (default = 15)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+pnx4008_wdt:
+    heartbeat:
+	Watchdog heartbeat period in seconds from 1 to 60, default 19
+    nowayout:
+	Set to 1 to keep watchdog running after device release
+
+-------------------------------------------------
+
+pnx833x_wdt:
+    timeout:
+	Watchdog timeout in Mhz. (68Mhz clock), default=2040000000 (30 seconds)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    start_enabled:
+	Watchdog is started on module insertion (default=1)
+
+-------------------------------------------------
+
+rc32434_wdt:
+    timeout:
+	Watchdog timeout value, in seconds (default=20)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+riowd:
+    riowd_timeout:
+	Watchdog timeout in minutes (default=1)
+
+-------------------------------------------------
+
+s3c2410_wdt:
+    tmr_margin:
+	Watchdog tmr_margin in seconds. (default=15)
+    tmr_atboot:
+	Watchdog is started at boot time if set to 1, default=0
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    soft_noboot:
+	Watchdog action, set to 1 to ignore reboots, 0 to reboot
+    debug:
+	Watchdog debug, set to >1 for debug, (default 0)
+
+-------------------------------------------------
+
+sa1100_wdt:
+    margin:
+	Watchdog margin in seconds (default 60s)
+
+-------------------------------------------------
+
+sb_wdog:
+    timeout:
+	Watchdog timeout in microseconds (max/default 8388607 or 8.3ish secs)
+
+-------------------------------------------------
+
+sbc60xxwdt:
+    wdt_stop:
+	SBC60xx WDT 'stop' io port (default 0x45)
+    wdt_start:
+	SBC60xx WDT 'start' io port (default 0x443)
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sbc7240_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=255, default=30)
+    nowayout:
+	Disable watchdog when closing device file
+
+-------------------------------------------------
+
+sbc8360:
+    timeout:
+	Index into timeout table (0-63) (default=27 (60s))
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sbc_epx_c3:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sbc_fitpc2_wdt:
+    margin:
+	Watchdog margin in seconds (default 60s)
+    nowayout:
+	Watchdog cannot be stopped once started
+
+-------------------------------------------------
+
+sbsa_gwdt:
+    timeout:
+	Watchdog timeout in seconds. (default 10s)
+    action:
+	Watchdog action at the first stage timeout,
+	set to 0 to ignore, 1 to panic. (default=0)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sc1200wdt:
+    isapnp:
+	When set to 0 driver ISA PnP support will be disabled (default=1)
+    io:
+	io port
+    timeout:
+	range is 0-255 minutes, default is 1
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sc520_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1 <= timeout <= 3600, default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sch311x_wdt:
+    force_id:
+	Override the detected device ID
+    therm_trip:
+	Should a ThermTrip trigger the reset generator
+    timeout:
+	Watchdog timeout in seconds. 1<= timeout <=15300, default=60
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+scx200_wdt:
+    margin:
+	Watchdog margin in seconds
+    nowayout:
+	Disable watchdog shutdown on close
+
+-------------------------------------------------
+
+shwdt:
+    clock_division_ratio:
+	Clock division ratio. Valid ranges are from 0x5 (1.31ms)
+	to 0x7 (5.25ms). (default=7)
+    heartbeat:
+	Watchdog heartbeat in seconds. (1 <= heartbeat <= 3600, default=30
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+smsc37b787_wdt:
+    timeout:
+	range is 1-255 units, default is 60
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+softdog:
+    soft_margin:
+	Watchdog soft_margin in seconds.
+	(0 < soft_margin < 65536, default=60)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+    soft_noboot:
+	Softdog action, set to 1 to ignore reboots, 0 to reboot
+	(default=0)
+
+-------------------------------------------------
+
+stmp3xxx_wdt:
+    heartbeat:
+	Watchdog heartbeat period in seconds from 1 to 4194304, default 19
+
+-------------------------------------------------
+
+tegra_wdt:
+    heartbeat:
+	Watchdog heartbeats in seconds. (default = 120)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+ts72xx_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1 <= timeout <= 8, default=8)
+    nowayout:
+	Disable watchdog shutdown on close
+
+-------------------------------------------------
+
+twl4030_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+txx9wdt:
+    timeout:
+	Watchdog timeout in seconds. (0<timeout<N, default=60)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+uniphier_wdt:
+    timeout:
+	Watchdog timeout in power of two seconds.
+	(1 <= timeout <= 128, default=64)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+w83627hf_wdt:
+    wdt_io:
+	w83627hf/thf WDT io port (default 0x2E)
+    timeout:
+	Watchdog timeout in seconds. 1 <= timeout <= 255, default=60.
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+w83877f_wdt:
+    timeout:
+	Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+w83977f_wdt:
+    timeout:
+	Watchdog timeout in seconds (15..7635), default=45)
+    testmode:
+	Watchdog testmode (1 = no reboot), default=0
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+wafer5823wdt:
+    timeout:
+	Watchdog timeout in seconds. 1 <= timeout <= 255, default=60.
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+wdt285:
+    soft_margin:
+	Watchdog timeout in seconds (default=60)
+
+-------------------------------------------------
+
+wdt977:
+    timeout:
+	Watchdog timeout in seconds (60..15300, default=60)
+    testmode:
+	Watchdog testmode (1 = no reboot), default=0
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+wm831x_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+wm8350_wdt:
+    nowayout:
+	Watchdog cannot be stopped once started
+	(default=kernel config parameter)
+
+-------------------------------------------------
+
+sun4v_wdt:
+    timeout_ms:
+	Watchdog timeout in milliseconds 1..180000, default=60000)
+    nowayout:
+	Watchdog cannot be stopped once started
diff --git a/Documentation/watchdog/watchdog-parameters.txt b/Documentation/watchdog/watchdog-parameters.txt
deleted file mode 100644
index 0b88e333f9e1..000000000000
--- a/Documentation/watchdog/watchdog-parameters.txt
+++ /dev/null
@@ -1,410 +0,0 @@
-This file provides information on the module parameters of many of
-the Linux watchdog drivers.  Watchdog driver parameter specs should
-be listed here unless the driver has its own driver-specific information
-file.
-
-
-See Documentation/admin-guide/kernel-parameters.rst for information on
-providing kernel parameters for builtin drivers versus loadable
-modules.
-
-
--------------------------------------------------
-acquirewdt:
-wdt_stop: Acquire WDT 'stop' io port (default 0x43)
-wdt_start: Acquire WDT 'start' io port (default 0x443)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-advantechwdt:
-wdt_stop: Advantech WDT 'stop' io port (default 0x443)
-wdt_start: Advantech WDT 'start' io port (default 0x443)
-timeout: Watchdog timeout in seconds. 1<= timeout <=63, default=60.
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-alim1535_wdt:
-timeout: Watchdog timeout in seconds. (0 < timeout < 18000, default=60
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-alim7101_wdt:
-timeout: Watchdog timeout in seconds. (1<=timeout<=3600, default=30
-use_gpio: Use the gpio watchdog (required by old cobalt boards).
-	default=0/off/no
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ar7_wdt:
-margin: Watchdog margin in seconds (default=60)
-nowayout: Disable watchdog shutdown on close
-	(default=kernel config parameter)
--------------------------------------------------
-armada_37xx_wdt:
-timeout: Watchdog timeout in seconds. (default=120)
-nowayout: Disable watchdog shutdown on close
-	(default=kernel config parameter)
--------------------------------------------------
-at91rm9200_wdt:
-wdt_time: Watchdog time in seconds. (default=5)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-at91sam9_wdt:
-heartbeat: Watchdog heartbeats in seconds. (default = 15)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-bcm47xx_wdt:
-wdt_time: Watchdog time in seconds. (default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-coh901327_wdt:
-margin: Watchdog margin in seconds (default 60s)
--------------------------------------------------
-cpu5wdt:
-port: base address of watchdog card, default is 0x91
-verbose: be verbose, default is 0 (no)
-ticks: count down ticks, default is 10000
--------------------------------------------------
-cpwd:
-wd0_timeout: Default watchdog0 timeout in 1/10secs
-wd1_timeout: Default watchdog1 timeout in 1/10secs
-wd2_timeout: Default watchdog2 timeout in 1/10secs
--------------------------------------------------
-da9052wdt:
-timeout: Watchdog timeout in seconds. 2<= timeout <=131, default=2.048s
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-davinci_wdt:
-heartbeat: Watchdog heartbeat period in seconds from 1 to 600, default 60
--------------------------------------------------
-ebc-c384_wdt:
-timeout: Watchdog timeout in seconds. (1<=timeout<=15300, default=60)
-nowayout: Watchdog cannot be stopped once started
--------------------------------------------------
-ep93xx_wdt:
-nowayout: Watchdog cannot be stopped once started
-timeout: Watchdog timeout in seconds. (1<=timeout<=3600, default=TBD)
--------------------------------------------------
-eurotechwdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-io: Eurotech WDT io port (default=0x3f0)
-irq: Eurotech WDT irq (default=10)
-ev: Eurotech WDT event type (default is `int')
--------------------------------------------------
-gef_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-geodewdt:
-timeout: Watchdog timeout in seconds. 1<= timeout <=131, default=60.
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-i6300esb:
-heartbeat: Watchdog heartbeat in seconds. (1<heartbeat<2046, default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-iTCO_wdt:
-heartbeat: Watchdog heartbeat in seconds.
-	(2<heartbeat<39 (TCO v1) or 613 (TCO v2), default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-iTCO_vendor_support:
-vendorsupport: iTCO vendor specific support mode, default=0 (none),
-	1=SuperMicro Pent3, 2=SuperMicro Pent4+, 911=Broken SMI BIOS
--------------------------------------------------
-ib700wdt:
-timeout: Watchdog timeout in seconds. 0<= timeout <=30, default=30.
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ibmasr:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-imx2_wdt:
-timeout: Watchdog timeout in seconds (default 60 s)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-indydog:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-iop_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-it8712f_wdt:
-margin: Watchdog margin in seconds (default 60)
-nowayout: Disable watchdog shutdown on close
-	(default=kernel config parameter)
--------------------------------------------------
-it87_wdt:
-nogameport: Forbid the activation of game port, default=0
-nocir: Forbid the use of CIR (workaround for some buggy setups); set to 1 if
-system resets despite watchdog daemon running, default=0
-exclusive: Watchdog exclusive device open, default=1
-timeout: Watchdog timeout in seconds, default=60
-testmode: Watchdog test mode (1 = no reboot), default=0
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ixp4xx_wdt:
-heartbeat: Watchdog heartbeat in seconds (default 60s)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ks8695_wdt:
-wdt_time: Watchdog time in seconds. (default=5)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-machzwd:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-action: after watchdog resets, generate:
-	0 = RESET(*)  1 = SMI  2 = NMI  3 = SCI
--------------------------------------------------
-max63xx_wdt:
-heartbeat: Watchdog heartbeat period in seconds from 1 to 60, default 60
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-nodelay: Force selection of a timeout setting without initial delay
-	(max6373/74 only, default=0)
--------------------------------------------------
-mixcomwd:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-mpc8xxx_wdt:
-timeout: Watchdog timeout in ticks. (0<timeout<65536, default=65535)
-reset: Watchdog Interrupt/Reset Mode. 0 = interrupt, 1 = reset
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-mv64x60_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ni903x_wdt:
-timeout: Initial watchdog timeout in seconds (0<timeout<516, default=60)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-nic7018_wdt:
-timeout: Initial watchdog timeout in seconds (0<timeout<464, default=80)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-nuc900_wdt:
-heartbeat: Watchdog heartbeats in seconds.
-	(default = 15)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-omap_wdt:
-timer_margin: initial watchdog timeout (in seconds)
-early_enable: Watchdog is started on module insertion (default=0
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-orion_wdt:
-heartbeat: Initial watchdog heartbeat in seconds
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-pc87413_wdt:
-io: pc87413 WDT I/O port (default: io).
-timeout: Watchdog timeout in minutes (default=timeout).
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-pika_wdt:
-heartbeat: Watchdog heartbeats in seconds. (default = 15)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-pnx4008_wdt:
-heartbeat: Watchdog heartbeat period in seconds from 1 to 60, default 19
-nowayout: Set to 1 to keep watchdog running after device release
--------------------------------------------------
-pnx833x_wdt:
-timeout: Watchdog timeout in Mhz. (68Mhz clock), default=2040000000 (30 seconds)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-start_enabled: Watchdog is started on module insertion (default=1)
--------------------------------------------------
-rc32434_wdt:
-timeout: Watchdog timeout value, in seconds (default=20)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-riowd:
-riowd_timeout: Watchdog timeout in minutes (default=1)
--------------------------------------------------
-s3c2410_wdt:
-tmr_margin: Watchdog tmr_margin in seconds. (default=15)
-tmr_atboot: Watchdog is started at boot time if set to 1, default=0
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-soft_noboot: Watchdog action, set to 1 to ignore reboots, 0 to reboot
-debug: Watchdog debug, set to >1 for debug, (default 0)
--------------------------------------------------
-sa1100_wdt:
-margin: Watchdog margin in seconds (default 60s)
--------------------------------------------------
-sb_wdog:
-timeout: Watchdog timeout in microseconds (max/default 8388607 or 8.3ish secs)
--------------------------------------------------
-sbc60xxwdt:
-wdt_stop: SBC60xx WDT 'stop' io port (default 0x45)
-wdt_start: SBC60xx WDT 'start' io port (default 0x443)
-timeout: Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sbc7240_wdt:
-timeout: Watchdog timeout in seconds. (1<=timeout<=255, default=30)
-nowayout: Disable watchdog when closing device file
--------------------------------------------------
-sbc8360:
-timeout: Index into timeout table (0-63) (default=27 (60s))
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sbc_epx_c3:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sbc_fitpc2_wdt:
-margin: Watchdog margin in seconds (default 60s)
-nowayout: Watchdog cannot be stopped once started
--------------------------------------------------
-sbsa_gwdt:
-timeout: Watchdog timeout in seconds. (default 10s)
-action: Watchdog action at the first stage timeout,
-	set to 0 to ignore, 1 to panic. (default=0)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sc1200wdt:
-isapnp: When set to 0 driver ISA PnP support will be disabled (default=1)
-io: io port
-timeout: range is 0-255 minutes, default is 1
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sc520_wdt:
-timeout: Watchdog timeout in seconds. (1 <= timeout <= 3600, default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sch311x_wdt:
-force_id: Override the detected device ID
-therm_trip: Should a ThermTrip trigger the reset generator
-timeout: Watchdog timeout in seconds. 1<= timeout <=15300, default=60
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-scx200_wdt:
-margin: Watchdog margin in seconds
-nowayout: Disable watchdog shutdown on close
--------------------------------------------------
-shwdt:
-clock_division_ratio: Clock division ratio. Valid ranges are from 0x5 (1.31ms)
-	to 0x7 (5.25ms). (default=7)
-heartbeat: Watchdog heartbeat in seconds. (1 <= heartbeat <= 3600, default=30
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-smsc37b787_wdt:
-timeout: range is 1-255 units, default is 60
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-softdog:
-soft_margin: Watchdog soft_margin in seconds.
-	(0 < soft_margin < 65536, default=60)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
-soft_noboot: Softdog action, set to 1 to ignore reboots, 0 to reboot
-	(default=0)
--------------------------------------------------
-stmp3xxx_wdt:
-heartbeat: Watchdog heartbeat period in seconds from 1 to 4194304, default 19
--------------------------------------------------
-tegra_wdt:
-heartbeat: Watchdog heartbeats in seconds. (default = 120)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-ts72xx_wdt:
-timeout: Watchdog timeout in seconds. (1 <= timeout <= 8, default=8)
-nowayout: Disable watchdog shutdown on close
--------------------------------------------------
-twl4030_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-txx9wdt:
-timeout: Watchdog timeout in seconds. (0<timeout<N, default=60)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-uniphier_wdt:
-timeout: Watchdog timeout in power of two seconds.
-	(1 <= timeout <= 128, default=64)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-w83627hf_wdt:
-wdt_io: w83627hf/thf WDT io port (default 0x2E)
-timeout: Watchdog timeout in seconds. 1 <= timeout <= 255, default=60.
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-w83877f_wdt:
-timeout: Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-w83977f_wdt:
-timeout: Watchdog timeout in seconds (15..7635), default=45)
-testmode: Watchdog testmode (1 = no reboot), default=0
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-wafer5823wdt:
-timeout: Watchdog timeout in seconds. 1 <= timeout <= 255, default=60.
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-wdt285:
-soft_margin: Watchdog timeout in seconds (default=60)
--------------------------------------------------
-wdt977:
-timeout: Watchdog timeout in seconds (60..15300, default=60)
-testmode: Watchdog testmode (1 = no reboot), default=0
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-wm831x_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-wm8350_wdt:
-nowayout: Watchdog cannot be stopped once started
-	(default=kernel config parameter)
--------------------------------------------------
-sun4v_wdt:
-timeout_ms: Watchdog timeout in milliseconds 1..180000, default=60000)
-nowayout: Watchdog cannot be stopped once started
--------------------------------------------------
diff --git a/Documentation/watchdog/watchdog-pm.txt b/Documentation/watchdog/watchdog-pm.rst
similarity index 92%
rename from Documentation/watchdog/watchdog-pm.txt
rename to Documentation/watchdog/watchdog-pm.rst
index 7a4dd46e0d24..646e1f28f31f 100644
--- a/Documentation/watchdog/watchdog-pm.txt
+++ b/Documentation/watchdog/watchdog-pm.rst
@@ -1,5 +1,7 @@
+===============================================
 The Linux WatchDog Timer Power Management Guide
 ===============================================
+
 Last reviewed: 17-Dec-2018
 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
@@ -16,4 +18,5 @@ On resume, a watchdog timer shall be reset to its selected value to give
 userspace enough time to resume. [1] [2]
 
 [1] https://patchwork.kernel.org/patch/10252209/
+
 [2] https://patchwork.kernel.org/patch/10711625/
diff --git a/Documentation/watchdog/wdt.txt b/Documentation/watchdog/wdt.rst
similarity index 68%
rename from Documentation/watchdog/wdt.txt
rename to Documentation/watchdog/wdt.rst
index ed2f0b860869..d97b0361535b 100644
--- a/Documentation/watchdog/wdt.txt
+++ b/Documentation/watchdog/wdt.rst
@@ -1,11 +1,14 @@
+============================================================
+WDT Watchdog Timer Interfaces For The Linux Operating System
+============================================================
+
 Last Reviewed: 10/05/2007
 
-	WDT Watchdog Timer Interfaces For The Linux Operating System
-		Alan Cox <alan@lxorguk.ukuu.org.uk>
+Alan Cox <alan@lxorguk.ukuu.org.uk>
 
-	ICS	WDT501-P
-	ICS	WDT501-P (no fan tachometer)
-	ICS	WDT500-P
+	- ICS	WDT501-P
+	- ICS	WDT501-P (no fan tachometer)
+	- ICS	WDT500-P
 
 All the interfaces provide /dev/watchdog, which when open must be written
 to within a timeout or the machine will reboot. Each write delays the reboot
@@ -21,19 +24,26 @@ degrees Fahrenheit. Each read returns a single byte giving the temperature.
 The third interface logs kernel messages on additional alert events.
 
 The ICS ISA-bus wdt card cannot be safely probed for. Instead you need to
-pass IO address and IRQ boot parameters.  E.g.:
+pass IO address and IRQ boot parameters.  E.g.::
+
 	wdt.io=0x240 wdt.irq=11
 
 Other "wdt" driver parameters are:
+
+	===========	======================================================
 	heartbeat	Watchdog heartbeat in seconds (default 60)
 	nowayout	Watchdog cannot be stopped once started (kernel
-				build parameter)
+			build parameter)
 	tachometer	WDT501-P Fan Tachometer support (0=disable, default=0)
 	type		WDT501-P Card type (500 or 501, default=500)
+	===========	======================================================
 
 Features
 --------
-		WDT501P		WDT500P
+
+================   =======	   =======
+		   WDT501P	   WDT500P
+================   =======	   =======
 Reboot Timer	   X               X
 External Reboot	   X	           X
 I/O Port Monitor   o		   o
@@ -42,9 +52,12 @@ Fan Speed          X		   o
 Power Under	   X               o
 Power Over         X               o
 Overheat           X               o
+================   =======	   =======
 
 The external event interfaces on the WDT boards are not currently supported.
 Minor numbers are however allocated for it.
 
 
-Example Watchdog Driver:  see samples/watchdog/watchdog-simple.c
+Example Watchdog Driver:
+
+	see samples/watchdog/watchdog-simple.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 71b4754ea7c3..b0b674f5aaca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7040,7 +7040,7 @@ F:	drivers/media/usb/hdpvr/
 HEWLETT PACKARD ENTERPRISE ILO NMI WATCHDOG DRIVER
 M:	Jerry Hoemann <jerry.hoemann@hpe.com>
 S:	Supported
-F:	Documentation/watchdog/hpwdt.txt
+F:	Documentation/watchdog/hpwdt.rst
 F:	drivers/watchdog/hpwdt.c
 
 HEWLETT-PACKARD SMART ARRAY RAID DRIVER (hpsa)
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index ffe754539f5a..6cad0b33d7ad 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -18,7 +18,7 @@ menuconfig WATCHDOG
 	  reboot the machine) and a driver for hardware watchdog boards, which
 	  are more robust and can also keep track of the temperature inside
 	  your computer. For details, read
-	  <file:Documentation/watchdog/watchdog-api.txt> in the kernel source.
+	  <file:Documentation/watchdog/watchdog-api.rst> in the kernel source.
 
 	  The watchdog is usually used together with the watchdog daemon
 	  which is available from
@@ -1870,7 +1870,7 @@ config BOOKE_WDT
 	  Watchdog driver for PowerPC Book-E chips, such as the Freescale
 	  MPC85xx SOCs and the IBM PowerPC 440.
 
-	  Please see Documentation/watchdog/watchdog-api.txt for
+	  Please see Documentation/watchdog/watchdog-api.rst for
 	  more information.
 
 config BOOKE_WDT_DEFAULT_TIMEOUT
@@ -2019,7 +2019,7 @@ config PCWATCHDOG
 	  This card simply watches your kernel to make sure it doesn't freeze,
 	  and if it does, it reboots your computer after a certain amount of
 	  time. This driver is like the WDT501 driver but for different
-	  hardware. Please read <file:Documentation/watchdog/pcwd-watchdog.txt>. The PC
+	  hardware. Please read <file:Documentation/watchdog/pcwd-watchdog.rst>. The PC
 	  watchdog cards can be ordered from <http://www.berkprod.com/>.
 
 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/watchdog/smsc37b787_wdt.c b/drivers/watchdog/smsc37b787_wdt.c
index 13c817ea1d6a..f5713030d0f7 100644
--- a/drivers/watchdog/smsc37b787_wdt.c
+++ b/drivers/watchdog/smsc37b787_wdt.c
@@ -36,7 +36,7 @@
  *  mknod /dev/watchdog c 10 130
  *
  * For an example userspace keep-alive daemon, see:
- *   Documentation/watchdog/wdt.txt
+ *   Documentation/watchdog/wdt.rst
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.21.0

