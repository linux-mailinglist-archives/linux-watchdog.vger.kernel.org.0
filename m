Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879CD2598AA
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 18:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730936AbgIAQ3h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 12:29:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730819AbgIAPb6 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 11:31:58 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F80A20E65;
        Tue,  1 Sep 2020 15:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598974317;
        bh=bXz4Z+ByU7oLOWvqxgR/MMJbU7okBrsVzpWrJCsFcyk=;
        h=From:To:Cc:Subject:Date:From;
        b=rKajFz0q4YCyOZCMCE7m2QIBuiozPTmdTA+2K5aHi+owEMvuqVBp0B5msIX5bc0oK
         UbNS0RPWU6SHmmGVD4SwdJ65jalKFts9UsRsQEKawEeF1FC/zPL49ALinycOnl9049
         UMF+1AHLFAGf3yA9IAZCf4/dtkv7gSqFc8I5iYT0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/3] watchdog: cadence: Simplify with dev_err_probe()
Date:   Tue,  1 Sep 2020 17:31:39 +0200
Message-Id: <20200901153141.18960-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/watchdog/cadence_wdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
index 672b184da875..bc99e9164930 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -334,12 +334,9 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 	watchdog_set_drvdata(cdns_wdt_device, wdt);
 
 	wdt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(wdt->clk)) {
-		ret = PTR_ERR(wdt->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "input clock not found\n");
-		return ret;
-	}
+	if (IS_ERR(wdt->clk))
+		return dev_err_probe(dev, PTR_ERR(wdt->clk),
+				     "input clock not found\n");
 
 	ret = clk_prepare_enable(wdt->clk);
 	if (ret) {
-- 
2.17.1

