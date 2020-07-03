Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9052139B7
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Jul 2020 14:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgGCMGB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Jul 2020 08:06:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42092 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgGCMGB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 063C4K1A000964;
        Fri, 3 Jul 2020 07:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1593777860;
        bh=G4wnnj72ALl51c7aAtn+twNQ2gnUnkuWdD4xZPMkDIs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZpxkDVXTdUupeQsRZnwHUKQTbCGi3vzBauisDrGAFo7H0lY6+IKULRhlEmy38I7wz
         T4n0iNWGJ57b+kkObhx0i5pHnNImaH9Oj1aLMIoXtxrcXvhZtGh7V9TpiGNsoTdC5U
         QWuBNaSlVD5WaamHtBnBjZV/4d0GPlYairhNC0dM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 063C4JnN078667
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Jul 2020 07:04:20 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 07:04:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 07:04:19 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 063C4Fkf109800;
        Fri, 3 Jul 2020 07:04:18 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCHv2 1/5] watchdog: use __watchdog_ping in startup
Date:   Fri, 3 Jul 2020 15:04:02 +0300
Message-ID: <20200703120406.7092-2-t-kristo@ti.com>
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
