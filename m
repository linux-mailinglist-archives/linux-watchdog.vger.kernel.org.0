Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04940E8E75
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 18:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfJ2Rkr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 13:40:47 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44028 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbfJ2Rkq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 13:40:46 -0400
Received: by mail-qk1-f193.google.com with SMTP id a194so13074672qkg.10
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2019 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/LNOlHf2rDm22wEkTsouArIOxVXq1gxd46OR69rUm3k=;
        b=EPYWlJ86L4Djyk4xMC4yRspSA8HN8+v55zNkN212xDFpGxJu/FDeYEFol8FnkFwzr9
         deiV9oqTkU6aXWKdYZdpN2koF89XJPpBTb3WCC03SXqC3Hacy5jJEoDVl1uM+VZHqRXd
         1nE0JZ02oNJvg1DcO9mzx1Q2CYHpy1AtygOb4i7dpM1VzmFFR/EiJkahk+Dsy7nIDrrS
         6kmwuQ+2T25E4qDMYoPRHZnpTjWFwbd35HnRcR9fSAqNNE3y+oLpJ2XJ4X3ZVeLb/oHD
         j6KakXpH1QMUQhggVqc3O+6LFgLmrgX5hdXlRNPlFFFiWz29B/1SAme7Oc4KL9Q9aOuu
         a6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/LNOlHf2rDm22wEkTsouArIOxVXq1gxd46OR69rUm3k=;
        b=bT3MG6WvPLRIveInIQdhOz9RL9rXga9UA6WbWEjkX6zZVq7iq79ETjYmcOlk9i85Fb
         0ZLJ8J2O4bXiW6BLJpQ5BLnZhg0jh5ISuw1AgA+iDToRmkrJHinmOthbC5Fm0JWEcM8N
         Dp5HbqEG8ehL+JIj8wL9SBL75ZR1H7s8Mw2Io6adttaxJXq+/DR8LTwEiHsnsYnYW/6c
         bKycXrAUUXW+rzbPtn2+xj0F2Vt6JOnCB1N539CsYkMUxEmHYMy3vZoY3vRWqGLiwsyK
         mKAic65Ltds6gyv8o3d3Z5jgmB0ssAXczr8LsFurbK1UTuwT+iXdGU8FZJVgW2SQd8UZ
         LhTA==
X-Gm-Message-State: APjAAAWuUbkWgILSzsH8axHKU6ObCGj8sSf3KbywzO/p1y3az+UKKzJw
        HIxJgczhoyGP80Am75/LjvQ=
X-Google-Smtp-Source: APXvYqwgSeTRcFyhLfDgzwCX20cxjCvPj8kSVkOmRvXOaVBsp82Cy/sIcSQb3V3gIjXW3y8VMXjsyA==
X-Received: by 2002:a05:620a:68c:: with SMTP id f12mr22837966qkh.501.1572370844375;
        Tue, 29 Oct 2019 10:40:44 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id c21sm7417725qtg.61.2019.10.29.10.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:40:43 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/5] watchdog: imx7ulp: Pass the wdog instance inimx7ulp_wdt_enable()
Date:   Tue, 29 Oct 2019 14:40:34 -0300
Message-Id: <20191029174037.25381-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029174037.25381-1-festevam@gmail.com>
References: <20191029174037.25381-1-festevam@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

It is more natural to pass the watchdog instance inside
imx7ulp_wdt_enable() instead of the base address.

This also has the benefit to reduce the code a bit.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index ba5d535a6db2..eea415609d44 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -47,15 +47,17 @@ struct imx7ulp_wdt_device {
 	struct clk *clk;
 };
 
-static inline void imx7ulp_wdt_enable(void __iomem *base, bool enable)
+static inline void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
 {
-	u32 val = readl(base + WDOG_CS);
+	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
+
+	u32 val = readl(wdt->base + WDOG_CS);
 
-	writel(UNLOCK, base + WDOG_CNT);
+	writel(UNLOCK, wdt->base + WDOG_CNT);
 	if (enable)
-		writel(val | WDOG_CS_EN, base + WDOG_CS);
+		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
 	else
-		writel(val & ~WDOG_CS_EN, base + WDOG_CS);
+		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
 }
 
 static inline bool imx7ulp_wdt_is_enabled(void __iomem *base)
@@ -76,18 +78,15 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
 
 static int imx7ulp_wdt_start(struct watchdog_device *wdog)
 {
-	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
 
-	imx7ulp_wdt_enable(wdt->base, true);
+	imx7ulp_wdt_enable(wdog, true);
 
 	return 0;
 }
 
 static int imx7ulp_wdt_stop(struct watchdog_device *wdog)
 {
-	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
-
-	imx7ulp_wdt_enable(wdt->base, false);
+	imx7ulp_wdt_enable(wdog, false);
 
 	return 0;
 }
@@ -109,10 +108,8 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
 static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
 			       unsigned long action, void *data)
 {
-	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
-
-	imx7ulp_wdt_enable(wdt->base, true);
-	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
+	imx7ulp_wdt_enable(wdog, true);
+	imx7ulp_wdt_set_timeout(wdog, 1);
 
 	/* wait for wdog to fire */
 	while (true)
-- 
2.17.1


