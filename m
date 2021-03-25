Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2907349017
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Mar 2021 12:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhCYLb7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 25 Mar 2021 07:31:59 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:25172 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhCYL3c (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 25 Mar 2021 07:29:32 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id B905F980397;
        Thu, 25 Mar 2021 19:29:29 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] [v3] drivers: watchdog: Remove duplicate include of kernel.h
Date:   Thu, 25 Mar 2021 19:29:16 +0800
Message-Id: <20210325112916.865510-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHRhIH0NDTkpLTx1DVkpNSk1NTEpMTUJCSUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBA6GQw5Ez8WCj4zQgg9A1ZD
        PyMwCipVSlVKTUpNTUxKTExLSUNDVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFJSkJDNwY+
X-HM-Tid: 0a786925850ad992kuwsb905f980397
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

linux/kernel.h has been included. Remove the duplicate.
Reorder include files to be in alphabetic order.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Changelog:
v3:
- Reorder include files to be in alphabetic order.

v2:
- Remove the duplicate which won't make worse.
---
 drivers/watchdog/dw_wdt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 32d0e1781e63..cd578843277e 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -13,22 +13,21 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/limits.h>
-#include <linux/kernel.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/interrupt.h>
 #include <linux/of.h>
-#include <linux/pm.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/reset.h>
 #include <linux/watchdog.h>
-#include <linux/debugfs.h>
 
 #define WDOG_CONTROL_REG_OFFSET		    0x00
 #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
-- 
2.25.1

