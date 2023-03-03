Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22786AA17E
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjCCVhz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbjCCVhq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:37:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D330762D86
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:37:45 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5q-0008Uv-9m; Fri, 03 Mar 2023 22:37:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001eA4-VA; Fri, 03 Mar 2023 22:37:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYD5n-001wxA-BV; Fri, 03 Mar 2023 22:37:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Doug Anderson <dianders@chromium.org>,
        Leela Krishna Amudala <leela.krishna@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 01/34] watchdog: s3c2410: Don't skip cleanup in remove's error path
Date:   Fri,  3 Mar 2023 22:36:43 +0100
Message-Id: <20230303213716.2123717-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dH5K8jSqecnVYqdbPPG8j+uJBNtwI1UmMnEH81NXN2o=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAmgSDlZ9h3UXAn5MUbhKAXXOUHQmQQZBssmp9 ybpzz62ncCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJoEgAKCRDB/BR4rcrs CQKUCACesLXMrz4kUplOzOB+eOBKfnhFGAVh1/Lw/nAQfuyvdVV/xHHrJgU9VIvKm5t3HGQnqhB UOz7IPMuVr0tQ6vS+BVA/IFwum94L2lgwcOLzYMIQmvBFbZNG9LKDQp+VzvatcJRnhaj8drhjIm 0vks5wkawx6BfUQsCkWmKk7EVEvsrcNaw3fe3CLr622YCoD7OLVT0dto2YWJHn3C/6k7n49BD6M /ncSMYvsfECmFlEgzWwdfjZNUgQP/21sBIQja2xqKhW4DB5lp8DhzdFSDzH2aXoHJRgWqk81gdY eCzuBYAoeuW9A9QaDT00vN6LKHsqXtrcB3gIN5n/HReqcDEd
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Returning early in a platform driver's remove callback is wrong. In this
case the watchdog device is never removed although it's parent is gone
which likely can trigger a use-after-free in sysfs. Also the two used
clocks will never be disabled.

Instead only warn if s3c2410wdt_enable() fails and cleanup. Note that
returning 0 is the right thing to do then to suppress another warning
message by the driver core.

Fixes: 4f1f653a68d6 ("watchdog: s3c2410_wdt: use syscon regmap interface to configure pmu register")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/watchdog/s3c2410_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 200ba236a72e..cf104a844a43 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -782,7 +782,8 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 
 	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
-		return ret;
+		dev_warn(&dev->dev,
+			 "Failed to disable watchdog (%pe)\n", ERR_PTR(ret));
 
 	watchdog_unregister_device(&wdt->wdt_device);
 
-- 
2.39.1

