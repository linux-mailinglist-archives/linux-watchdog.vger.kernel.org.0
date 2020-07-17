Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1831F223CBC
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 15:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGQNas (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 09:30:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39676 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgGQNas (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 09:30:48 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06HDUBdD052006;
        Fri, 17 Jul 2020 08:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594992611;
        bh=1f8QGphM1gDJrV+uk7tlCewgRrYPd1fn7gpp9JJzAS0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ha9xdr5caMQ9HSqkgqjaXI0k7GcV8aBYkZVJoojL6WdL76SULLHnqN4n5Cnbu+7UY
         4MOoHS+0GxySsIzt2rER4QqPCgy0ULc20vce7m80L8iJ3C/fRJotuqmRmiXopISStW
         h7lgUhYZwakuVgqgfdxwO+LzgMTPky5kVFMnA6BM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06HDUBup075551;
        Fri, 17 Jul 2020 08:30:11 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 17
 Jul 2020 08:30:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 17 Jul 2020 08:30:11 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06HDU5Ld051528;
        Fri, 17 Jul 2020 08:30:09 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv4 2/4] watchdog: add support for adjusting last known HW keepalive time
Date:   Fri, 17 Jul 2020 16:29:56 +0300
Message-ID: <20200717132958.14304-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717132958.14304-1-t-kristo@ti.com>
References: <20200717132958.14304-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Certain watchdogs require the watchdog only to be pinged within a
specific time window, pinging too early or too late cause the watchdog
to fire. In cases where this sort of watchdog has been started before
kernel comes up, we must adjust the watchdog keepalive window to match
the actually running timer, so add a new driver API for this purpose.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 .../watchdog/watchdog-kernel-api.rst          | 12 ++++++++
 drivers/watchdog/watchdog_dev.c               | 30 +++++++++++++++++++
 include/linux/watchdog.h                      |  2 ++
 3 files changed, 44 insertions(+)

diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
index 068a55ee0d4a..baf44e986b07 100644
--- a/Documentation/watchdog/watchdog-kernel-api.rst
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -336,3 +336,15 @@ an action is taken by a preconfigured pretimeout governor preassigned to
 the watchdog device. If watchdog pretimeout governor framework is not
 enabled, watchdog_notify_pretimeout() prints a notification message to
 the kernel log buffer.
+
+To set the last known HW keepalive time for a watchdog, the following function
+should be used::
+
+  int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
+                                     unsigned int last_ping_ms)
+
+This function must be called immediately after watchdog registration. It
+sets the last known hardware heartbeat to have happened last_ping_ms before
+current time. Calling this is only needed if the watchdog is already running
+when probe is called, and the watchdog can only be pinged after the
+min_hw_heartbeat_ms time has passed from the last ping.
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index bc1cfa288553..e74a0c6811b5 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1138,6 +1138,36 @@ void watchdog_dev_unregister(struct watchdog_device *wdd)
 	watchdog_cdev_unregister(wdd);
 }
 
+/*
+ *	watchdog_set_last_hw_keepalive: set last HW keepalive time for watchdog
+ *	@wdd: watchdog device
+ *	@last_ping_ms: time since last HW heartbeat
+ *
+ *	Adjusts the last known HW keepalive time for a watchdog timer.
+ *	This is needed if the watchdog is already running when the probe
+ *	function is called, and it can't be pinged immediately. This
+ *	function must be called immediately after watchdog registration,
+ *	and min_hw_heartbeat_ms must be set for this to be useful.
+ */
+int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
+				   unsigned int last_ping_ms)
+{
+	struct watchdog_core_data *wd_data;
+	ktime_t now;
+
+	if (!wdd)
+		return -EINVAL;
+
+	wd_data = wdd->wd_data;
+
+	now = ktime_get();
+
+	wd_data->last_hw_keepalive = ktime_sub(now, ms_to_ktime(last_ping_ms));
+
+	return __watchdog_ping(wdd);
+}
+EXPORT_SYMBOL_GPL(watchdog_set_last_hw_keepalive);
+
 /*
  *	watchdog_dev_init: init dev part of watchdog core
  *
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 1464ce6ffa31..9b19e6bb68b5 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -210,6 +210,8 @@ extern int watchdog_init_timeout(struct watchdog_device *wdd,
 extern int watchdog_register_device(struct watchdog_device *);
 extern void watchdog_unregister_device(struct watchdog_device *);
 
+int watchdog_set_last_hw_keepalive(struct watchdog_device *, unsigned int);
+
 /* devres register variant */
 int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
