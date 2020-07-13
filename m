Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E47F21E1CA
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 22:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgGMU6c (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 16:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgGMU6b (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 16:58:31 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60859C061755;
        Mon, 13 Jul 2020 13:58:31 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 347F8BC07E;
        Mon, 13 Jul 2020 20:58:27 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] watchdog: Replace HTTP links with HTTPS ones
Date:   Mon, 13 Jul 2020 22:58:21 +0200
Message-Id: <20200713205821.38223-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt | 4 ++--
 drivers/watchdog/Kconfig                                   | 2 +-
 drivers/watchdog/dw_wdt.c                                  | 2 +-
 drivers/watchdog/nv_tco.c                                  | 2 +-
 drivers/watchdog/nv_tco.h                                  | 2 +-
 drivers/watchdog/sp5100_tco.c                              | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
index e60b9a13bdcb..aa10b8ec36e2 100644
--- a/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
@@ -11,8 +11,8 @@ Optional properties:
 	   See clock-bindings.txt
 
 Documentation:
-Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
-Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
+Davinci DM646x - https://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
+Keystone - https://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
 
 Examples:
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 4f4687c46d38..ab7aad5a1e69 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1027,7 +1027,7 @@ config ADVANTECH_WDT
 	  If you are configuring a Linux kernel for the Advantech single-board
 	  computer, say `Y' here to support its built-in watchdog timer
 	  feature. More information can be found at
-	  <http://www.advantech.com.tw/products/>
+	  <https://www.advantech.com.tw/products/>
 
 config ALIM1535_WDT
 	tristate "ALi M1535 PMU Watchdog Timer"
diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index fba21de2bbad..57bbc1434341 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright 2010-2011 Picochip Ltd., Jamie Iles
- * http://www.picochip.com
+ * https://www.picochip.com
  *
  * This file implements a driver for the Synopsys DesignWare watchdog device
  * in the many subsystems. The watchdog has 16 different timeout periods
diff --git a/drivers/watchdog/nv_tco.c b/drivers/watchdog/nv_tco.c
index d7a560e348d5..179fb9aa3cf4 100644
--- a/drivers/watchdog/nv_tco.c
+++ b/drivers/watchdog/nv_tco.c
@@ -7,7 +7,7 @@
  *	Based off i8xx_tco.c:
  *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
  *	Reserved.
- *				http://www.kernelconcepts.de
+ *				https://www.kernelconcepts.de
  *
  *	TCO timer driver for NV chipsets
  *	based on softdog.c by Alan Cox <alan@redhat.com>
diff --git a/drivers/watchdog/nv_tco.h b/drivers/watchdog/nv_tco.h
index d325e528010f..c65f82588386 100644
--- a/drivers/watchdog/nv_tco.h
+++ b/drivers/watchdog/nv_tco.h
@@ -9,7 +9,7 @@
  *
  *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
  *	Reserved.
- *				http://www.kernelconcepts.de
+ *				https://www.kernelconcepts.de
  *
  *	Neither kernel concepts nor Nils Faerber admit liability nor provide
  *	warranty for any of this software. This material is provided
diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 93bd302ae7c5..85e9664318c9 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -7,7 +7,7 @@
  *	Based on i8xx_tco.c:
  *	(c) Copyright 2000 kernel concepts <nils@kernelconcepts.de>, All Rights
  *	Reserved.
- *				http://www.kernelconcepts.de
+ *				https://www.kernelconcepts.de
  *
  *	See AMD Publication 43009 "AMD SB700/710/750 Register Reference Guide",
  *	    AMD Publication 45482 "AMD SB800-Series Southbridges Register
-- 
2.27.0

