Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8882CE1D6
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Dec 2020 23:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731921AbgLCWen (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Dec 2020 17:34:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:56064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729313AbgLCWen (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Dec 2020 17:34:43 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] watchdog: coh901327: add COMMON_CLK dependency
Date:   Thu,  3 Dec 2020 23:33:42 +0100
Message-Id: <20201203223358.1269372-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang produces a build failure in configurations without COMMON_CLK
when a timeout calculation goes wrong:

arm-linux-gnueabi-ld: drivers/watchdog/coh901327_wdt.o: in function `coh901327_enable':
coh901327_wdt.c:(.text+0x50): undefined reference to `__bad_udelay'

Add a Kconfig dependency to only do build testing when COMMON_CLK
is enabled.

Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 8bdbd125821b..32fa6de7b820 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -631,7 +631,7 @@ config SUNXI_WATCHDOG
 
 config COH901327_WATCHDOG
 	bool "ST-Ericsson COH 901 327 watchdog"
-	depends on ARCH_U300 || (ARM && COMPILE_TEST)
+	depends on ARCH_U300 || (ARM && COMMON_CLK && COMPILE_TEST)
 	default y if MACH_U300
 	select WATCHDOG_CORE
 	help
-- 
2.27.0

