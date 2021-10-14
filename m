Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1C642D6E2
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 12:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhJNKYh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Oct 2021 06:24:37 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.4]:7855 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229912AbhJNKYg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Oct 2021 06:24:36 -0400
Received: from [100.112.192.69] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 54/D0-30013-6E408616; Thu, 14 Oct 2021 10:22:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsWi1/P8kO4zlox
  Eg8nTdSxurNvHbvFk4Rkmi8cv/zE7MHusXLOG1WPn9wZ2j8+b5AKYo1gz85LyKxJYM57tdCi4
  zFbxZOJ6tgbGe6xdjFwcQgILGSVaus4BOZwcvALuElv/tDOB2MIC1hLzDv5kB7HZBHQkFu/7B
  lYjJGAr8XXaa2YQW0TASOLlnzlg9cwCKhKfX7YwgtgsAqoS99YdZoeIa0q0bv8NZosKqEm8Wv
  kIapegxMmZT1ggauQltr+dwwwxX0Xiw+J7YHMkgOLf93xhgrCjJFoO3WeHsDklmqccZ5/AKDA
  LyYpZSMbOQjJ2ASPzKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLI10jAxO9xCrdRL3UUt3y1OIS
  XUO9xPJiveLK3OScFL281JJNjMAQTyk4cGYH46nXH/QOMUpyMCmJ8vozZyQK8SXlp1RmJBZnx
  BeV5qQWH2KU4eBQkuCVB8kJFqWmp1akZeYA4w0mLcHBoyTCa/g/PVGIt7ggMbc4Mx0idYpRUU
  qcNwAYpUICIImM0jy4NliMX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGsGsp0nM68Ebvo
  roMVMQIsDo1JAFpckIqSkGpj2KJlLpgTt0rzCJZh8vzktJNblwXcNhuebnfYv9Xb7qiCeH5P3
  KV3qa8Ks7a1HLh44nT0jYXFGX8Azv0dlehqqvBMVLzQeevg/SG9lk5no1Dc71bmbbjb1iTFxs
  UYx7BR47TLvXOf2mR6BV8Kf3Z4isFq14qvNv7YzVoesryf1bGK9Gjn5kvHnydUK/5olrIOL93
  mXFzSIGJ1QbIuTW5h47SPHdAnxHiXPPTKfMxRffVd9WLhbL8Z4t9qexf+bzips5vrocfPvxDK
  Gx0vn7zflnZhhvU3dcKbH0eT6qJ61Uty96llbt+f6pXP43TUPKty9/6bfrcSqpN8aa+7PLHoi
  YHxfN/SMDXel0NQ7s5VYijMSDbWYi4oTAWqy2QRsAwAA
X-Env-Sender: Walter.Stoll@duagon.com
X-Msg-Ref: server-14.tower-268.messagelabs.com!1634206950!1544963!1
X-Originating-IP: [46.140.231.194]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27462 invoked from network); 14 Oct 2021 10:22:30 -0000
Received: from 46-140-231-194.static.upc.ch (HELO chdua14.duagon.ads) (46.140.231.194)
  by server-14.tower-268.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 14 Oct 2021 10:22:30 -0000
Received: from duagon-vbox (172.17.0.41) by chdua14.duagon.ads (172.16.90.14)
 with Microsoft SMTP Server (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 12:22:29
 +0200
Message-ID: <88a8fe5229cd68fa0f1fd22f5d66666c1b7057a0.camel@duagon.com>
Subject: [PATCH] watchdog: Fix OMAP watchdog early handling
From:   Walter Stoll <walter.stoll@duagon.com>
Reply-To: <06eba290-1794-854a-f999-86668211dcaf@roeck-us.net>
To:     <linux@roeck-us.net>, <wim@linux-watchdog.org>
CC:     <linux-watchdog@vger.kernel.org>
Date:   Thu, 14 Oct 2021 12:22:29 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.0.41]
X-ClientProxiedBy: chdua14.duagon.ads (172.16.90.14) To chdua14.duagon.ads
 (172.16.90.14)
X-Loop: 1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


TI's implementation does not service the watchdog even if the kernel
command line parameter omap_wdt.early_enable is set to 1. This patch
fixes the issue.

Signed-off-by: Walter Stoll <walter.stoll@duagon.com>
---
 drivers/watchdog/omap_wdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 1616f93dfad7..74d785b2b478 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -268,8 +268,12 @@ static int omap_wdt_probe(struct platform_device *pdev)
 			wdev->wdog.bootstatus = WDIOF_CARDRESET;
 	}
 
-	if (!early_enable)
+	if (early_enable) {
+		omap_wdt_start(&wdev->wdog);
+		set_bit(WDOG_HW_RUNNING, &wdev->wdog.status);
+	} else {
 		omap_wdt_disable(wdev);
+	}
 
 	ret = watchdog_register_device(&wdev->wdog);
 	if (ret) {
-- 
2.33.0


