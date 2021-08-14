Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63F3EC356
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Aug 2021 16:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhHNOg6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 14 Aug 2021 10:36:58 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:44185 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238615AbhHNOg6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 14 Aug 2021 10:36:58 -0400
X-Greylist: delayed 552 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Aug 2021 10:36:57 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16117d2b5f1b-8cf97; Sat, 14 Aug 2021 22:27:02 +0800 (CST)
X-RM-TRANSID: 2ee16117d2b5f1b-8cf97
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.22.250.151])
        by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66117d2b0886-2b22d;
        Sat, 14 Aug 2021 22:27:02 +0800 (CST)
X-RM-TRANSID: 2ee66117d2b0886-2b22d
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc:     linux-watchdog@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: [PATCH] watchdog: stm32_iwdg: drop superfluous error message
Date:   Sat, 14 Aug 2021 22:27:41 +0800
Message-Id: <20210814142741.7396-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In the function stm32_iwdg_probe(), devm_platform_ioremap_resource
has already contained error message, so drop the redundant one.

Co-developed-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/watchdog/stm32_iwdg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index a3436c296..570a71509 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -237,10 +237,8 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 
 	/* This is the timer base. */
 	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->regs)) {
-		dev_err(dev, "Could not get resource\n");
+	if (IS_ERR(wdt->regs))
 		return PTR_ERR(wdt->regs);
-	}
 
 	ret = stm32_iwdg_clk_init(pdev, wdt);
 	if (ret)
-- 
2.20.1.windows.1



