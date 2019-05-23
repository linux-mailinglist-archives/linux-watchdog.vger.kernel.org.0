Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98A1027934
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 11:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfEWJ3x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 05:29:53 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:10903 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbfEWJ3w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 05:29:52 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x4N9TooG043808;
        Thu, 23 May 2019 18:29:50 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Thu, 23 May 2019 18:29:50 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x4N9Ti5e043748
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 23 May 2019 18:29:50 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, wsa+renesas@sang-engineering.com
Cc:     kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] watchdog: renesas_wdt: Use 'dev' instead of dereferencing it repeatedly
Date:   Thu, 23 May 2019 18:29:38 +0900
Message-Id: <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

Add helper variable dev = &pdev->dev

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/watchdog/renesas_wdt.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/renesas_wdt.c b/drivers/watchdog/renesas_wdt.c
index 565dbc1..d8ac229 100644
--- a/drivers/watchdog/renesas_wdt.c
+++ b/drivers/watchdog/renesas_wdt.c
@@ -175,15 +175,16 @@ static inline bool rwdt_blacklisted(struct device *dev) { return false; }
 
 static int rwdt_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rwdt_priv *priv;
 	struct clk *clk;
 	unsigned long clks_per_sec;
 	int ret, i;
 
-	if (rwdt_blacklisted(&pdev->dev))
+	if (rwdt_blacklisted(dev))
 		return -ENODEV;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -191,16 +192,16 @@ static int rwdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	clk = devm_clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
 	priv->clk_rate = clk_get_rate(clk);
 	priv->wdev.bootstatus = (readb_relaxed(priv->base + RWTCSRA) &
 				RWTCSRA_WOVF) ? WDIOF_CARDRESET : 0;
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put(dev);
 
 	if (!priv->clk_rate) {
 		ret = -ENOENT;
@@ -216,14 +217,14 @@ static int rwdt_probe(struct platform_device *pdev)
 	}
 
 	if (i < 0) {
-		dev_err(&pdev->dev, "Can't find suitable clock divider\n");
+		dev_err(dev, "Can't find suitable clock divider\n");
 		ret = -ERANGE;
 		goto out_pm_disable;
 	}
 
 	priv->wdev.info = &rwdt_ident;
 	priv->wdev.ops = &rwdt_ops;
-	priv->wdev.parent = &pdev->dev;
+	priv->wdev.parent = dev;
 	priv->wdev.min_timeout = 1;
 	priv->wdev.max_timeout = DIV_BY_CLKS_PER_SEC(priv, 65536);
 	priv->wdev.timeout = min(priv->wdev.max_timeout, RWDT_DEFAULT_TIMEOUT);
@@ -235,7 +236,7 @@ static int rwdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_unregister(&priv->wdev);
 
 	/* This overrides the default timeout only if DT configuration was found */
-	watchdog_init_timeout(&priv->wdev, 0, &pdev->dev);
+	watchdog_init_timeout(&priv->wdev, 0, dev);
 
 	ret = watchdog_register_device(&priv->wdev);
 	if (ret < 0)
@@ -244,7 +245,7 @@ static int rwdt_probe(struct platform_device *pdev)
 	return 0;
 
  out_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
-- 
2.7.4

