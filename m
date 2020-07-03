Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF49C2139BB
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jul 2020 14:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgGCMGI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jul 2020 08:06:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59096 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgGCMGI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063C4LFa110388;
        Fri, 3 Jul 2020 07:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593777861;
        bh=VKk0r+2wsoL3MjGVaSjznFzV0l/708UsUjZION0spOs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vJak7I7pdR9dVnLtJNJMzzOnoT3Co0g30uf7HmTWOh+Edp8tM75ysPDea8zbs13Ga
         bYNf6ELJjrcXMHuHbjCUNeUXJT18Mcmmo/3ohx6b0M1f1lZnjSC2Hp5H+DnF5h57p/
         /aSL6wKGXqUyICfH/1syS4H7I9mM6As2D6gOqEWc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063C4LDl068734
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jul 2020 07:04:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 07:04:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 07:04:20 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Fkg109800;
        Fri, 3 Jul 2020 07:04:19 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv2 2/5] watchdog: add support for adjusting last known HW keepalive time
Date:   Fri, 3 Jul 2020 15:04:03 +0300
Message-ID: <20200703120406.7092-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703120406.7092-1-t-kristo@ti.com>
References: <20200703120406.7092-1-t-kristo@ti.com>
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
 drivers/watchdog/watchdog_dev.c | 23 +++++++++++++++++++++++
 include/linux/watchdog.h        |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index bc1cfa288553..5848551cf29d 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1138,6 +1138,29 @@ void watchdog_dev_unregister(struct watchdog_device *wdd)
 	watchdog_cdev_unregister(wdd);
 }
 
+/*
+ *	watchdog_set_last_hw_keepalive: set last HW keepalive time for watchdog
+ *
+ *	Adjusts the last known HW keepalive time for a watchdog timer.
+ *	This is needed in case where watchdog has been started before
+ *	kernel by someone like bootloader, and it can't be pinged
+ *	immediately. This adjusts the watchdog ping period to match
+ *	the currently running timer.
+ */
+int watchdog_set_last_hw_keepalive(struct watchdog_device *wdd,
+				   unsigned int last_ping_ms)
+{
+	struct watchdog_core_data *wd_data = wdd->wd_data;
+	ktime_t now;
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
