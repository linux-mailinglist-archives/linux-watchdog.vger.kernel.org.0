Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6792250A
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfERV2L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from sauhun.de ([88.99.104.3]:35780 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728435AbfERV2K (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:10 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 135652C059D;
        Sat, 18 May 2019 23:28:09 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/46] watchdog: let core print error message when registering device fails
Date:   Sat, 18 May 2019 23:27:17 +0200
Message-Id: <20190518212801.31010-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

So we can remove boilerplate code from drivers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/watchdog_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 9fd096af0cc5..cf3247224a6e 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -264,6 +264,7 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 
 int watchdog_register_device(struct watchdog_device *wdd)
 {
+	const char *dev_str;
 	int ret = 0;
 
 	mutex_lock(&wtd_deferred_reg_mutex);
@@ -272,6 +273,14 @@ int watchdog_register_device(struct watchdog_device *wdd)
 	else
 		watchdog_deferred_registration_add(wdd);
 	mutex_unlock(&wtd_deferred_reg_mutex);
+
+	if (ret) {
+		dev_str = wdd->parent ? dev_name(wdd->parent) :
+			  (const char *)wdd->info->identity;
+		pr_err("%s: failed to register watchdog device (err = %d)\n",
+			dev_str, ret);
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(watchdog_register_device);
-- 
2.19.1

