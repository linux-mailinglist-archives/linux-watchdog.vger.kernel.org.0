Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD2B1E79A8
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 May 2020 11:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE2Jpz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 May 2020 05:45:55 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:58992 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgE2Jpz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 May 2020 05:45:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3391108|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00564441-0.000591423-0.993764;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03305;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.HfKukDl_1590745546;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.HfKukDl_1590745546)
          by smtp.aliyun-inc.com(10.147.41.137);
          Fri, 29 May 2020 17:45:51 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, mripard@kernel.org,
        wens@csie.org
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        wuyan@allwinnertech.com, tiny.windzz@gmail.com,
        Frank Lee <frank@allwinnertech.com>
Subject: [PATCH] watchdog: sunxi_wdt: fix improper error exit code
Date:   Fri, 29 May 2020 17:45:14 +0800
Message-Id: <20200529094514.26374-1-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Martin Wu <wuyan@allwinnertech.com>

sunxi_wdt_probe() should return -ENOMEM when devm_kzalloc() fails.

Signed-off-by: Martin Wu <wuyan@allwinnertech.com>
Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 drivers/watchdog/sunxi_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index 5f05a45ac187..b50757882a98 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -235,7 +235,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
 
 	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
 	if (!sunxi_wdt)
-		return -EINVAL;
+		return -ENOMEM;
 
 	sunxi_wdt->wdt_regs = of_device_get_match_data(dev);
 	if (!sunxi_wdt->wdt_regs)
-- 
2.24.0

