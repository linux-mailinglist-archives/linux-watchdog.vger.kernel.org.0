Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E46D322095
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 21:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhBVUE0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 15:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhBVUEW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 15:04:22 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA20C061574;
        Mon, 22 Feb 2021 12:03:41 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m1so399775wml.2;
        Mon, 22 Feb 2021 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3c2ldEuh0RCCP8SBh45hZ/ZyihQmXVF+de59w6Fhgg=;
        b=OvNEOOnMsN0WjpahXHEKPdVYSuNomh2xUGz+X2G6hdpRPinODijC+UkZmqJ5qNOQtd
         voONZ8oo/ikJbZ8WP81kZp9iuhRC9z1VSbwl0jxU2oNx/V2yOoB2P+VoWCpCpM70dXZe
         qfk0uCFghwy6qIIEUXPy9w+CzVPJPQ5vVDvbs605qYRrh+rVsRcHX4PPc5ZSeY1CQbTo
         QL7aZZRj+6tiivTMcwZF6+yggE/MOjQT3tmRVm1SJIZAeXWD6hyxp+31KS1B76OoQNaq
         puzzkOpcn+Obhica6zKzib5pl8Uz8+J2XKABChBCNNP02hec9E4QyGKI9wdIr90arGLx
         K2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3c2ldEuh0RCCP8SBh45hZ/ZyihQmXVF+de59w6Fhgg=;
        b=q5+n7xAVx+MdyT5GcJDaB+wkdJeVd8VN/gVcjuLQswnMD8Pjkog8TyIN8YHOKYaeew
         +A9Wm19LNWepmL48L8ZJt+69JVba7FXcvH4lTL8K7+rJiM+K8NqNYkWfiidzTVlSOs0F
         l6H/EDWviPVNt/LAB3T/GbocHy2UEC4jsPGEtIGQPqOeKcCfSBL6K0fcER8WHV9JSW4O
         hD1UD5O+Z4ovaQEs917IF2NxXpyOC/brYXDIfTALYgGAY/72r8JBMbtp4qxsDju5TVDP
         WG7yWB0uUzVwyAb2CB+Zpg+eamut0uKzmIL1Of4yUft7GEFsaZlsufWdEtTRXCjFir+m
         J7GA==
X-Gm-Message-State: AOAM532g0I453RRWuD7+/GcwJg9jLwSoOs+/2fSIH46AS9vtMydNxptT
        5WnMd5Iv7VtbMb+dLRyn7SbL3M1Vk2awaA==
X-Google-Smtp-Source: ABdhPJzpGOzgVJnLqkTbZc+I9w7jONhZIYy28B2MTKOYHlSZfckw5kDd5cQYmbIg3WW+3Ja9Jol64w==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr4692263wmm.49.1614024220480;
        Mon, 22 Feb 2021 12:03:40 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id y12sm18001780wrm.33.2021.02.22.12.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:03:39 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] watchdog: bcm7038_wdt: add big endian support
Date:   Mon, 22 Feb 2021 21:03:38 +0100
Message-Id: <20210222200338.24696-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

bcm7038_wdt can be used on bmips (bcm63xx) devices too.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/watchdog/bcm7038_wdt.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 979caa18d3c8..62494da1ac57 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -34,6 +34,24 @@ struct bcm7038_watchdog {
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
+static inline void bcm7038_wdt_write(unsigned long data, void __iomem *reg)
+{
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	__raw_writel(data, reg);
+#else
+	writel(data, reg);
+#endif
+}
+
+static inline unsigned long bcm7038_wdt_read(void __iomem *reg)
+{
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	return __raw_readl(reg);
+#else
+	return readl(reg);
+#endif
+}
+
 static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
 {
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
@@ -41,15 +59,15 @@ static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
 
 	timeout = wdt->rate * wdog->timeout;
 
-	writel(timeout, wdt->base + WDT_TIMEOUT_REG);
+	bcm7038_wdt_write(timeout, wdt->base + WDT_TIMEOUT_REG);
 }
 
 static int bcm7038_wdt_ping(struct watchdog_device *wdog)
 {
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 
-	writel(WDT_START_1, wdt->base + WDT_CMD_REG);
-	writel(WDT_START_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_START_1, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_START_2, wdt->base + WDT_CMD_REG);
 
 	return 0;
 }
@@ -66,8 +84,8 @@ static int bcm7038_wdt_stop(struct watchdog_device *wdog)
 {
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 
-	writel(WDT_STOP_1, wdt->base + WDT_CMD_REG);
-	writel(WDT_STOP_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
 
 	return 0;
 }
@@ -88,7 +106,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 	u32 time_left;
 
-	time_left = readl(wdt->base + WDT_CMD_REG);
+	time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
 
 	return time_left / wdt->rate;
 }
-- 
2.20.1

