Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D1B21D69C
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jul 2020 15:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgGMNT6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jul 2020 09:19:58 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:35906 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729523AbgGMNTz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jul 2020 09:19:55 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06DDISB4107917;
        Mon, 13 Jul 2020 08:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594646308;
        bh=G4wnnj72ALl51c7aAtn+twNQ2gnUnkuWdD4xZPMkDIs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=B6pBYT/+x3oRTzUwM4Zu3SVwBvMX9OOtqRh6s7Tixw0mGlGmmiR0ViBxKBAiVteGA
         BKeoQh+bRpd8Rz1D5dtWMhTkzws9cWyz+szOFAmbWFuUkNibmp0fNclej32iOK4Pg/
         togcAQh+cdiwwyOuZeE8YiGzPOf7xhyu4HK95tZM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIS0R063774;
        Mon, 13 Jul 2020 08:18:28 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 13
 Jul 2020 08:18:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 13 Jul 2020 08:18:28 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06DDIOXp015417;
        Mon, 13 Jul 2020 08:18:27 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv3 1/4] watchdog: use __watchdog_ping in startup
Date:   Mon, 13 Jul 2020 16:18:15 +0300
Message-ID: <20200713131818.825-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200713131818.825-1-t-kristo@ti.com>
References: <20200713131818.825-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Current watchdog startup functionality does not respect the minimum hw
heartbeat setup and the last watchdog ping timeframe when watchdog is
already running and userspace process attaches to it. Fix this by using
the __watchdog_ping from the startup also. For this code path, we can
also let the __watchdog_ping handle the bookkeeping for the worker and
last keepalive times.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 7e4cd34a8c20..bc1cfa288553 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -275,15 +275,18 @@ static int watchdog_start(struct watchdog_device *wdd)
 	set_bit(_WDOG_KEEPALIVE, &wd_data->status);
 
 	started_at = ktime_get();
-	if (watchdog_hw_running(wdd) && wdd->ops->ping)
-		err = wdd->ops->ping(wdd);
-	else
+	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
+		err = __watchdog_ping(wdd);
+		if (err == 0)
+			set_bit(WDOG_ACTIVE, &wdd->status);
+	} else {
 		err = wdd->ops->start(wdd);
-	if (err == 0) {
-		set_bit(WDOG_ACTIVE, &wdd->status);
-		wd_data->last_keepalive = started_at;
-		wd_data->last_hw_keepalive = started_at;
-		watchdog_update_worker(wdd);
+		if (err == 0) {
+			set_bit(WDOG_ACTIVE, &wdd->status);
+			wd_data->last_keepalive = started_at;
+			wd_data->last_hw_keepalive = started_at;
+			watchdog_update_worker(wdd);
+		}
 	}
 
 	return err;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
