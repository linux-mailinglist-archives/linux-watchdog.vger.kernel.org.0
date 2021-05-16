Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036BA382123
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 May 2021 23:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhEPVSV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 May 2021 17:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233861AbhEPVSU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 May 2021 17:18:20 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D992C061573;
        Sun, 16 May 2021 14:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=USLQCXEHuyoMhA31ke959A5oDOy2U//r8Sz1pr9eLZ4=; b=yK9x3vBiXA6iBpQdver0oQIScK
        EGwxdOVr/jYmCqQ6ON9gH0qcpYMQk6rsGOP0pCffCuLnGJOADzDujZeEgeVIuEr6H4jH6zWpCK/l9
        /rVIu6MFzXg5+js+3fE+KpgfWCqChVGB0LoU/j+zLS1E2C6N5P8C5lkoYE3LIPhi0XCDLmLc6g0Ij
        7MD6bXQe35X00ZnjDNyIVL75aDagj1lO9CNLZjv5xp/8bt7xsvyW1ArhHkOa/t8jNG2qDU9G/bg6z
        lPlB5ta62sPH3O7GvJt+3fR04rizc2ts0Fm03y/T3U92UrBQmuIQzAef11DJbWzW0edMMdwquPWmE
        BoTPb7PQ==;
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liO8F-00DGME-R8; Sun, 16 May 2021 21:17:03 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] watchdog: mtx-1: drop au1000.h header file
Date:   Sun, 16 May 2021 14:17:03 -0700
Message-Id: <20210516211703.25349-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The mtx-1_wdt driver does not need the au1000.h header file.
Instead, the header file causes build errors, so drop it.

This change fixes multiple build errors, all in au1000.h. E.g.:

In file included from ../drivers/watchdog/mtx-1_wdt.c:44:
../arch/mips/include/asm/mach-au1x00/au1000.h: In function 'alchemy_rdsys':
../arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]
  603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
../arch/mips/include/asm/mach-au1x00/au1000.h:603:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);

Fixes: 04bf3b4f5fc0 ("[WATCHDOG] MTX-1 Watchdog driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/mtx-1_wdt.c |    2 --
 1 file changed, 2 deletions(-)

--- linux-next-20210514.orig/drivers/watchdog/mtx-1_wdt.c
+++ linux-next-20210514/drivers/watchdog/mtx-1_wdt.c
@@ -41,8 +41,6 @@
 #include <linux/uaccess.h>
 #include <linux/gpio/consumer.h>
 
-#include <asm/mach-au1x00/au1000.h>
-
 #define MTX1_WDT_INTERVAL	(5 * HZ)
 
 static int ticks = 100 * HZ;
