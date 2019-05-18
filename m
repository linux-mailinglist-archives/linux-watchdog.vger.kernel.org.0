Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDBA22509
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 May 2019 23:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfERV2L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 18 May 2019 17:28:11 -0400
Received: from sauhun.de ([88.99.104.3]:35766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727600AbfERV2K (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 18 May 2019 17:28:10 -0400
Received: from localhost (p5486CE4C.dip0.t-ipconnect.de [84.134.206.76])
        by pokefinder.org (Postfix) with ESMTPSA id 7CC142C0590;
        Sat, 18 May 2019 23:28:08 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/46] watchdog: make watchdog_deferred_registration_add() void
Date:   Sat, 18 May 2019 23:27:16 +0200
Message-Id: <20190518212801.31010-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

It cannot fail, so no return value needed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/watchdog_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 62be9e52a4de..9fd096af0cc5 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -60,11 +60,10 @@ static DEFINE_MUTEX(wtd_deferred_reg_mutex);
 static LIST_HEAD(wtd_deferred_reg_list);
 static bool wtd_deferred_reg_done;
 
-static int watchdog_deferred_registration_add(struct watchdog_device *wdd)
+static void watchdog_deferred_registration_add(struct watchdog_device *wdd)
 {
 	list_add_tail(&wdd->deferred,
 		      &wtd_deferred_reg_list);
-	return 0;
 }
 
 static void watchdog_deferred_registration_del(struct watchdog_device *wdd)
@@ -265,13 +264,13 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 
 int watchdog_register_device(struct watchdog_device *wdd)
 {
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&wtd_deferred_reg_mutex);
 	if (wtd_deferred_reg_done)
 		ret = __watchdog_register_device(wdd);
 	else
-		ret = watchdog_deferred_registration_add(wdd);
+		watchdog_deferred_registration_add(wdd);
 	mutex_unlock(&wtd_deferred_reg_mutex);
 	return ret;
 }
-- 
2.19.1

