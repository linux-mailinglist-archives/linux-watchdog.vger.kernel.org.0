Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2062C609B
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Nov 2020 08:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbgK0HoN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Nov 2020 02:44:13 -0500
Received: from inva021.nxp.com ([92.121.34.21]:48048 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgK0HoN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Nov 2020 02:44:13 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A6302008C8;
        Fri, 27 Nov 2020 08:44:11 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E45B20081E;
        Fri, 27 Nov 2020 08:44:09 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9ED5040323;
        Fri, 27 Nov 2020 08:44:05 +0100 (CET)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH] wdt: sp805: add watchdog_stop on reboot
Date:   Fri, 27 Nov 2020 15:52:17 +0800
Message-Id: <20201127075217.31312-1-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

Call watchdog_stop_on_reboot in probe func

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 drivers/watchdog/sp805_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 190d26e..958dc32 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -291,6 +291,7 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	watchdog_stop_on_reboot(&wdt->wdd);
 	ret = watchdog_register_device(&wdt->wdd);
 	if (ret)
 		goto err;
-- 
2.7.4

