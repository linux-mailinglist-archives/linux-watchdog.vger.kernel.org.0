Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59631207275
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jun 2020 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390712AbgFXLrY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jun 2020 07:47:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:39522 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388491AbgFXLrY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jun 2020 07:47:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjo1k091844;
        Wed, 24 Jun 2020 06:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592999150;
        bh=bjbtiNoFP+h73n0U4OOkVxf8+tj7HqP/e0mgYCiHNb0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fC/zHVXQ4FDKULA9y3I/ZeJloco/w5BGkh08TBSUbT8V6jtvqKRbLgw+CbMI429S8
         muLysdm5EAYLIKmB7pU5GofTAAYbsOuS8ow4cMo6Lk9PpxjWJ8N1WJpsX18DomvKDs
         tLGxuoJ1QlUt1ZqSGlu4zCVJ94ue6yd4Qmk4W3ZA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjogs076319;
        Wed, 24 Jun 2020 06:45:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 24
 Jun 2020 06:45:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 24 Jun 2020 06:45:49 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05OBjkCM118804;
        Wed, 24 Jun 2020 06:45:48 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <jan.kiszka@siemens.com>
Subject: [PATCH 1/2] watchdog: use __watchdog_ping in startup
Date:   Wed, 24 Jun 2020 14:45:33 +0300
Message-ID: <20200624114534.1362-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624114534.1362-1-t-kristo@ti.com>
References: <20200624114534.1362-1-t-kristo@ti.com>
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
