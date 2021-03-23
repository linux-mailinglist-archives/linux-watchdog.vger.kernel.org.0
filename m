Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFE93455B7
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Mar 2021 03:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhCWCuf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Mar 2021 22:50:35 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:44284 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCWCuH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Mar 2021 22:50:07 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id A8CE79804AC;
        Tue, 23 Mar 2021 10:50:01 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] [v2] drivers: watchdog: Remove duplicate include of kernel.h
Date:   Tue, 23 Mar 2021 10:49:53 +0800
Message-Id: <20210323024953.239233-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZTxoeSRgfTEJDTU8eVkpNSk1PTUxDS0pCSUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OT46DSo*Kj8JEjowSyNOQxgq
        PFFPFBdVSlVKTUpNT01MQ0tJQ0tKVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTklPNwY+
X-HM-Tid: 0a785cfd36f0d992kuwsa8ce79804ac
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

linux/kernel.h has been included at line 22. According to
alphabetic order, we remove the duplicate one at line 17.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/watchdog/dw_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 32d0e1781e63..3aa8bed98759 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -14,7 +14,6 @@
 
 #include <linux/bitops.h>
 #include <linux/limits.h>
-#include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-- 
2.25.1

