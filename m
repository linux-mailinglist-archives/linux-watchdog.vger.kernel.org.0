Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75B425988F
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Sep 2020 18:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730853AbgIAQ2N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Sep 2020 12:28:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:35476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730839AbgIAPcC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Sep 2020 11:32:02 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0CFDE21534;
        Tue,  1 Sep 2020 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598974321;
        bh=Z6vnP4+NxuzEHN1LLXN7z5Otdl9HCbvEaUVhEApV3pg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fqfwr9EqXMJY4AgjS+slX8K8xlMBvRbd+HmV4+PYX+k3DPTRiHQzKD0eBs56sZE7A
         aIedGo2IgSlRBYGfqJi7P2C2/LPQXJxSrsEj9zf2ve0IMfwybZQd5GmZkp9veQR5L4
         w+pUzcHh1PSH3V+dy3zb0o3wKEmrrLsQksATYFXA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] watchdog: rti: Simplify with dev_err_probe()
Date:   Tue,  1 Sep 2020 17:31:41 +0200
Message-Id: <20200901153141.18960-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901153141.18960-1-krzk@kernel.org>
References: <20200901153141.18960-1-krzk@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

It is unusual to expect deferred probe from pm_runtime_get()...
---
 drivers/watchdog/rti_wdt.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 705e8f7523e8..836319cbaca9 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -205,11 +205,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk = clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		if (PTR_ERR(clk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get clock\n");
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get clock\n");
 
 	wdt->freq = clk_get_rate(clk);
 
@@ -230,11 +227,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "runtime pm failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "runtime pm failed\n");
 
 	platform_set_drvdata(pdev, wdt);
 
-- 
2.17.1

