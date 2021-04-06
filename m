Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFD835504E
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Apr 2021 11:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235677AbhDFJo7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Apr 2021 05:44:59 -0400
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:25370 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233861AbhDFJo6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Apr 2021 05:44:58 -0400
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id D901940032B;
        Tue,  6 Apr 2021 17:44:48 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] softdog: make pretimeout available when SOFT_WATCHDOG_PRETIMEOUT enabled
Date:   Tue,  6 Apr 2021 17:44:37 +0800
Message-Id: <1617702277-17647-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSkwZTkJNTE5CH05DVkpNSkxMS0lJQ0JKSEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OU06TCo6Fz8RQy0JLFEfPRov
        Ky0KCg9VSlVKTUpMTEtJSUNCT0lLVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISVlXWQgBWUFJSExONwY+
X-HM-Tid: 0a78a691fea5d991kuwsd901940032b
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Although softdog supports pretimeout, there is no way to set pretimeout, 
so pretimeout will never be processed in softdog_ping(). 

Here add the configuration mechanism for pretimeout and the default value
is 1 second, so when CONFIG_SOFT_WATCHDOG_PRETIMEOUT is enabled, the 
pretimeout function defaults available.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/watchdog/softdog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 7a10962..79e52791
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -35,6 +35,14 @@ MODULE_PARM_DESC(soft_margin,
 	"Watchdog soft_margin in seconds. (0 < soft_margin < 65536, default="
 					__MODULE_STRING(TIMER_MARGIN) ")");
 
+#ifdef CONFIG_SOFT_WATCHDOG_PRETIMEOUT
+#define PRE_TIMER_MARGIN	1		/* Default is 1 seconds */
+static unsigned int soft_pretimeout = PRE_TIMER_MARGIN;	/* in seconds */
+module_param(soft_pretimeout, uint, 0);
+MODULE_PARM_DESC(soft_pretimeout,
+	"Watchdog soft_pretimeout in seconds. (0 < soft_pretimeout < soft_margin, default=1)");
+#endif
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout,
@@ -177,6 +185,9 @@ static struct watchdog_device softdog_dev = {
 	.min_timeout = 1,
 	.max_timeout = 65535,
 	.timeout = TIMER_MARGIN,
+#ifdef CONFIG_SOFT_WATCHDOG_PRETIMEOUT
+	.pretimeout = PRE_TIMER_MARGIN,
+#endif
 };
 
 static int __init softdog_init(void)
-- 
2.7.4

