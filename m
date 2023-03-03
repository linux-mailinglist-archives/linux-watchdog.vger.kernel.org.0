Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496066AA16D
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjCCVhs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjCCVhm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AA462D9C
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:41 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5u-0000GU-S9; Fri, 03 Mar 2023 22:37:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5t-001eBy-As; Fri, 03 Mar 2023 22:37:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5s-001wyf-HP; Fri, 03 Mar 2023 22:37:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 25/34] watchdog: riowd: Convert to platform remove callback returning void
Date:   Fri,  3 Mar 2023 22:37:07 +0100
Message-Id: <20230303213716.2123717-26-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tjRKZsDzkYhVDX0U2QePSy5P8HALIQ/Qu5/tfhqwcTI=; b=owGbwMvMwMV48I9IxdpTbzgZT6slMaQwZaTxRizN00qbNb9vWSx71K0bZ86qXKwIZ/Gxtw4Q3 XMrOy60k9GYhYGRi0FWTJGlrkhLbILEmv92JUu4YQaxMoFMYeDiFICJ2F5m/80mEf+9nWfNtAyD VPs/+9jPzzn2yjp1c0+Gf0/4F83DrGoeMyVC5ysqr33VOt0uMbzaV+7ruofaW36vVlWdpZnxt+l UQP7f1WL/1NY4r1v672rAm9PtLOolc1Y3HjBg323s3NIbfq7+rfCrmX+ismSFxDhZMx7ETe96qn X5S2L71cOFk8NuZAqEqxmJrM2s/5GiK9XXs+C3TO9xgevBi/yFn7x7yXop8sYMm5mMm/SMwhakl MoUa8sw7GYu0O2RPDlnq+gcmwmi550NtdcmB835xKO3WM1IUORvQ5uxi0UOi5mg6uFdMaEPS44G z2S5/jJjoaIWRxXzdeXGHLVuxfe+iTI5V4QZpRe53pYDAA==
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
 drivers/watchdog/riowd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index 747e346ed06c..c04b383e1712 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -217,14 +217,12 @@ static int riowd_probe(struct platform_device *op)
 	return err;
 }
 
-static int riowd_remove(struct platform_device *op)
+static void riowd_remove(struct platform_device *op)
 {
 	struct riowd *p = platform_get_drvdata(op);
 
 	misc_deregister(&riowd_miscdev);
 	of_iounmap(&op->resource[0], p->regs, 2);
-
-	return 0;
 }
 
 static const struct of_device_id riowd_match[] = {
@@ -241,7 +239,7 @@ static struct platform_driver riowd_driver = {
 		.of_match_table = riowd_match,
 	},
 	.probe		= riowd_probe,
-	.remove		= riowd_remove,
+	.remove_new	= riowd_remove,
 };
 
 module_platform_driver(riowd_driver);
-- 
2.39.1

