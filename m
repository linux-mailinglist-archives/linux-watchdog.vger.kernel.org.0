Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B7B184480
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Mar 2020 11:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgCMKLl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Mar 2020 06:11:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48049 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMKLl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Mar 2020 06:11:41 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jChI3-00057s-9Z; Fri, 13 Mar 2020 11:11:39 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH] watchdog: ziirave_wdt: change name to be more specific
Date:   Fri, 13 Mar 2020 11:11:38 +0100
Message-Id: <20200313101138.25915-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The RAVE watchdog is not a full system watchdog, but is used to reset
ethernet switch when required. Change the name to better reflect this
usage.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 4a363a8b2d20..cab86a08456b 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -422,7 +422,7 @@ static int ziirave_firm_upload(struct watchdog_device *wdd,
 
 static const struct watchdog_info ziirave_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
-	.identity = "Zodiac RAVE Watchdog",
+	.identity = "RAVE Switch Watchdog",
 };
 
 static const struct watchdog_ops ziirave_wdt_ops = {
-- 
2.20.1

