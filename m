Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9176FFAAE
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 May 2023 21:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239516AbjEKTmo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 May 2023 15:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239301AbjEKTmS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 May 2023 15:42:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E569F2114;
        Thu, 11 May 2023 12:41:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 738F76514D;
        Thu, 11 May 2023 19:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8ADC433D2;
        Thu, 11 May 2023 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683834051;
        bh=eUyy4o0ZFlQgxEmoGpUGIqucDH7lEIHYip0rJcopiEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DaLZ2vxkMcHFqmN7vyLaLqTmiV1Pzi13jY7b0JaBiA/eBdDM4pHPEv9bp0mG7+RBt
         JHuCSyJhhfd0Tt1Lx16KZdo4VpV/lK+sVLY5xe4wS3FMhpN9mts+OW+X+57yz3mqb0
         nA98qGPjDLOXflyw0SY0uEC1isffFi+Wl7/ROgo1QrulFtnFvnf3D+Heaoajg3gLnL
         y+gDcwb+L+D1/f7ZadpEJ6HLRVHTRRO42PYgXfXvAtsl7eBUSN+UXJc1jsqV83ewwk
         //593MrkuyEmY3jnNbR+7KwLZlNCjR/8SpRcTHkOk44zrxIK3LwmIOzMGd/3ojw4ce
         pWt8KXJtrwgLA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johannes Thumshirn <jth@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Sasha Levin <sashal@kernel.org>, linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 2/5] watchdog: menz069_wdt: fix watchdog initialisation
Date:   Thu, 11 May 2023 15:40:19 -0400
Message-Id: <20230511194025.623614-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511194025.623614-1-sashal@kernel.org>
References: <20230511194025.623614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Johannes Thumshirn <jth@kernel.org>

[ Upstream commit 87b22656ca6a896d0378e9e60ffccb0c82f48b08 ]

Doing a 'cat /dev/watchdog0' with menz069_wdt as watchdog0 will result in
a NULL pointer dereference.

This happens because we're passing the wrong pointer to
watchdog_register_device(). Fix this by getting rid of the static
watchdog_device structure and use the one embedded into the driver's
per-instance private data.

Signed-off-by: Johannes Thumshirn <jth@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20230418172531.177349-2-jth@kernel.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/menz69_wdt.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
index 8973f98bc6a56..bca0938f3429f 100644
--- a/drivers/watchdog/menz69_wdt.c
+++ b/drivers/watchdog/menz69_wdt.c
@@ -98,14 +98,6 @@ static const struct watchdog_ops men_z069_ops = {
 	.set_timeout = men_z069_wdt_set_timeout,
 };
 
-static struct watchdog_device men_z069_wdt = {
-	.info = &men_z069_info,
-	.ops = &men_z069_ops,
-	.timeout = MEN_Z069_DEFAULT_TIMEOUT,
-	.min_timeout = 1,
-	.max_timeout = MEN_Z069_WDT_COUNTER_MAX / MEN_Z069_TIMER_FREQ,
-};
-
 static int men_z069_probe(struct mcb_device *dev,
 			  const struct mcb_device_id *id)
 {
@@ -125,15 +117,19 @@ static int men_z069_probe(struct mcb_device *dev,
 		goto release_mem;
 
 	drv->mem = mem;
+	drv->wdt.info = &men_z069_info;
+	drv->wdt.ops = &men_z069_ops;
+	drv->wdt.timeout = MEN_Z069_DEFAULT_TIMEOUT;
+	drv->wdt.min_timeout = 1;
+	drv->wdt.max_timeout = MEN_Z069_WDT_COUNTER_MAX / MEN_Z069_TIMER_FREQ;
 
-	drv->wdt = men_z069_wdt;
 	watchdog_init_timeout(&drv->wdt, 0, &dev->dev);
 	watchdog_set_nowayout(&drv->wdt, nowayout);
 	watchdog_set_drvdata(&drv->wdt, drv);
 	drv->wdt.parent = &dev->dev;
 	mcb_set_drvdata(dev, drv);
 
-	return watchdog_register_device(&men_z069_wdt);
+	return watchdog_register_device(&drv->wdt);
 
 release_mem:
 	mcb_release_mem(mem);
-- 
2.39.2

