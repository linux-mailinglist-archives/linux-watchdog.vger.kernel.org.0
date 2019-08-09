Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742EE87CEE
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 16:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfHIOmi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 10:42:38 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54689 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIOmh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 10:42:37 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N6JtR-1iOPhO3B3h-016fh0; Fri, 09 Aug 2019 16:42:07 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 03/13] watchdog: pnx4008_wdt: allow compile-testing
Date:   Fri,  9 Aug 2019 16:40:29 +0200
Message-Id: <20190809144043.476786-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809144043.476786-1-arnd@arndb.de>
References: <20190809144043.476786-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2AniHPLvo1jOIHTBA5j2I98sivoZsCAzYNsd3R/3R1uFTaliz4M
 3rsrICP/4PwkInaQhxlJ/le7U5DXD8wWkq4JuseLTYnOxVv5i7Pa66SqiXbaguC3oA5FRw8
 A3xdnI1Rtez1LzDbs+hgxfPKiJyB71Xm8m9gpg8RdpuYwWaPI7c4IElvW/Zfp2Gv0NrqnrX
 jNNC2a7YYGqIrQTGKSpMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Etmti/+xoQU=:l4/pWBsx0O3C1vyi+cIoXU
 B8/q/x2tPsjhwuwTEusw4xO3v3fsMQQTifM0loxUkh38VhpQRY6hhaYq4T0VxVGIgDRL7k4Fz
 jZ7BZJjWaG7sWyYIiHLs5LTGW4Sn3dzTN8w+H2ze/4aaLojYSZISir5/crSN/dM7rEGfJ+688
 5lfVOkA68CmQdirZenGNKTe9XExQI9XCx3Bc9PI/J/Mhkhw/d0rxvIbRg8VrlGutTxVUa7Ee8
 GUGIIM2QpNsQNscwV1Kw9bKmsWzduGGi1t+uRunVn2J7txrxyigBVsDI/Gmklywari3NfJKSH
 gJHVNI/QjS2jBmpNtXXlgOW5X1oxHK4uU3oyz9KzqIy3I/eqBfwOQh0lhMU4RjQeti5VOR9u+
 28FXhIzaucLv9wNiIKCy3nouTqfLJVXwsuozg9GInw0hjxiGg8jTQI3MivqWIHSf6ICQsP4US
 VAqYSNd1sQBqtHincI3+5NGUcPiwZxeav4bfdjIVSa60uo825Red6h1hEGt1XZwBdBTfXSaCm
 ZaYfGakR5giIId/4nDqGSabD0XGEHUqhTaUYwFuHsghmRHYzxm4qqhDZP74Vk8pXeiZlXRcvw
 r1gSQFieBhcZg1nhipaC/BxG29X59rcn49DjnIeO0Q7pDzw1tcrWETEsHxLq+MWgq3jLHxwhe
 AhfrHZ5BvPOVUiEgviEvpJB2WVBOnlB2VatyhjVwe+D0LDYrD3oPjGPCcPdHmZi0GOH8fU8gG
 CO183QaB3b+5OI4Ex4k3snRCyEStnmloMwaR8A==
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The only thing that prevents building this driver on other
platforms is the mach/hardware.h include, which is not actually
used here at all, so remove the line and allow CONFIG_COMPILE_TEST.

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/Kconfig       | 2 +-
 drivers/watchdog/pnx4008_wdt.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 8188963a405b..a45f9e3e442b 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -551,7 +551,7 @@ config OMAP_WATCHDOG
 
 config PNX4008_WATCHDOG
 	tristate "LPC32XX Watchdog"
-	depends on ARCH_LPC32XX
+	depends on ARCH_LPC32XX || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  Say Y here if to include support for the watchdog timer
diff --git a/drivers/watchdog/pnx4008_wdt.c b/drivers/watchdog/pnx4008_wdt.c
index 7b446b696f2b..e0ea133c1690 100644
--- a/drivers/watchdog/pnx4008_wdt.c
+++ b/drivers/watchdog/pnx4008_wdt.c
@@ -30,7 +30,6 @@
 #include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/reboot.h>
-#include <mach/hardware.h>
 
 /* WatchDog Timer - Chapter 23 Page 207 */
 
-- 
2.20.0

