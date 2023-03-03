Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0816AA157
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjCCVhk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbjCCVhi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E04462D8E
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:37 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-00008s-Ku; Fri, 03 Mar 2023 22:37:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5r-001eB1-0g; Fri, 03 Mar 2023 22:37:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-001wxx-2q; Fri, 03 Mar 2023 22:37:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 14/34] watchdog: ib700wdt: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:36:56 +0100
Message-Id: <20230303213716.2123717-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qX312mK73J6n8dWMC9RwhZKepqeQdygjvCLx7DBJEpU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmhAwKsbP/lUEFd5Shvrll6qyjt20n4yuxnQr Qn0eQwlL7+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoQAAKCRDB/BR4rcrs Cce7B/4mAMIDk6bNtuNdbmHiecaVavoGC67qx0j2WGWkyLbpeCnzZcTP1GP1FFmNfwTC2RHGCF9 19FTL0w2joxzqt6zNoJGoPEv8aYyp69KfCxLuOGL0LkCtWtVFbfZeuD4k6EtvMMMZvfTs0Y0Ccx s7rU9UxDspsQHx8U2ZGQVVkFYuM/3GricYWl8bMfkmi7UvoZTsA3FDlXsFLWW55drA5b4P986mx ydXpm2HfkD8bbrzQ9a8pv0wvDdE5EMeQq8kEi1CsN0IZPKYkz5gA6hlOlne/tvupsi5MetsQLCb hDWE2ghG42OmSNhZwwm1bVdhe7+uE5kMzNCXfoNaEDngQhpJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/ib700wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/ib700wdt.c b/drivers/watchdog/ib700wdt.c
index a0ddedc362fc..39ea97009abd 100644
--- a/drivers/watchdog/ib700wdt.c
+++ b/drivers/watchdog/ib700wdt.c
@@ -316,14 +316,13 @@ static int __init ibwdt_probe(struct platform_device *dev)
 	return res;
 }
 
-static int ibwdt_remove(struct platform_device *dev)
+static void ibwdt_remove(struct platform_device *dev)
 {
 	misc_deregister(&ibwdt_miscdev);
 	release_region(WDT_START, 1);
 #if WDT_START != WDT_STOP
 	release_region(WDT_STOP, 1);
 #endif
-	return 0;
 }
 
 static void ibwdt_shutdown(struct platform_device *dev)
@@ -333,7 +332,7 @@ static void ibwdt_shutdown(struct platform_device *dev)
 }
 
 static struct platform_driver ibwdt_driver = {
-	.remove		= ibwdt_remove,
+	.remove_new	= ibwdt_remove,
 	.shutdown	= ibwdt_shutdown,
 	.driver		= {
 		.name	= DRV_NAME,
-- 
2.39.1

