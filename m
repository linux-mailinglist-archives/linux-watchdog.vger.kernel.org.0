Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD54131CBAB
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Feb 2021 15:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhBPOSh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Feb 2021 09:18:37 -0500
Received: from smtp.asem.it ([151.1.184.197]:61312 "EHLO smtp.asem.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229830AbhBPOSf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Feb 2021 09:18:35 -0500
Received: from webmail.asem.it
        by asem.it (smtp.asem.it)
        (SecurityGateway 6.5.2)
        with ESMTP id SG000810734.MSG 
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Feb 2021 15:17:34 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Feb 2021 15:17:32 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 16 Feb 2021 15:17:32 +0100
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] watchdog: wdat_wdg: fix typo
Date:   Tue, 16 Feb 2021 15:17:27 +0100
Message-ID: <20210216141727.641224-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A782F18.602BD3FC.00F3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0 (_st=1 _vt=0 _iwf=0)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the following typo:

"recommeded" --> "recommended"
"firmare"    --> "firmware"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/watchdog/wdat_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
index cec7917790e5..195c8c004b69 100644
--- a/drivers/watchdog/wdat_wdt.c
+++ b/drivers/watchdog/wdat_wdt.c
@@ -208,7 +208,7 @@ static int wdat_wdt_enable_reboot(struct wdat_wdt *wdat)
 	/*
 	 * WDAT specification says that the watchdog is required to reboot
 	 * the system when it fires. However, it also states that it is
-	 * recommeded to make it configurable through hardware register. We
+	 * recommended to make it configurable through hardware register. We
 	 * enable reboot now if it is configurable, just in case.
 	 */
 	ret = wdat_wdt_run_action(wdat, ACPI_WDAT_SET_REBOOT, 0, NULL);
@@ -475,7 +475,7 @@ static int wdat_wdt_suspend_noirq(struct device *dev)
 		return 0;
 
 	/*
-	 * We need to stop the watchdog if firmare is not doing it or if we
+	 * We need to stop the watchdog if firmware is not doing it or if we
 	 * are going suspend to idle (where firmware is not involved). If
 	 * firmware is stopping the watchdog we kick it here one more time
 	 * to give it some time.
-- 
2.25.1

