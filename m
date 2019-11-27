Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7295310AC45
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Nov 2019 09:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfK0Ixt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Nov 2019 03:53:49 -0500
Received: from mail.sysgo.com ([176.9.12.79]:54360 "EHLO mail.sysgo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbfK0Ixt (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Nov 2019 03:53:49 -0500
X-Greylist: delayed 420 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Nov 2019 03:53:49 EST
From:   David Engraf <david.engraf@sysgo.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] watchdog: max77620_wdt: fix potential build errors
Date:   Wed, 27 Nov 2019 09:46:17 +0100
Message-Id: <20191127084617.16937-1-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

max77620_wdt uses watchdog core functions. Enable CONFIG_WATCHDOG_CORE
to fix potential build errors.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 58e7c100b6ad..c9cc34f4e541 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -687,6 +687,7 @@ config MAX63XX_WATCHDOG
 config MAX77620_WATCHDOG
 	tristate "Maxim Max77620 Watchdog Timer"
 	depends on MFD_MAX77620 || COMPILE_TEST
+	select WATCHDOG_CORE
 	help
 	 This is the driver for the Max77620 watchdog timer.
 	 Say 'Y' here to enable the watchdog timer support for
-- 
2.17.1

