Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348661CB87F
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 May 2020 21:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgEHTlh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 May 2020 15:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727097AbgEHTlg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 May 2020 15:41:36 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E9CC061A0C
        for <linux-watchdog@vger.kernel.org>; Fri,  8 May 2020 12:41:36 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jX8sH-0001M9-Qg; Fri, 08 May 2020 21:41:34 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id B813E101175; Fri,  8 May 2020 21:41:32 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: watchdog: m54xx: Add missing include
Date:   Fri, 08 May 2020 21:41:32 +0200
Message-ID: <87blmyjjtf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 08 May 2020 21:26:58 +0200

A recent cleanup removed the mm.h include from uaccess_no.h in
m68k. This breaks the build of the m54xx watchdog driver:

  drivers/watchdog/m54xx_wdt.c:49:9: error: implicit declaration of function '__raw_readl'

Due to magic include chains the inclusion of mm.h in uaccess_no.h pulled in io.h.

Include 'linux/io.h' explicitely to fix this.

Fixes: 9e860351550b ("m68knommu: Remove mm.h include from uaccess_no.h")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/m54xx_wdt.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -29,6 +29,7 @@
 #include <linux/bitops.h>
 #include <linux/ioport.h>
 #include <linux/uaccess.h>
+#include <linux/io.h>
 
 #include <asm/coldfire.h>
 #include <asm/m54xxsim.h>
