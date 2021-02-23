Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74E23226BD
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Feb 2021 09:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBWIBa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 23 Feb 2021 03:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhBWIB2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 23 Feb 2021 03:01:28 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28928C06174A;
        Tue, 23 Feb 2021 00:00:47 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p3so1477952wmc.2;
        Tue, 23 Feb 2021 00:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yf/jVzF7WeOP+s6t7PSyOM3o8ylPOkh3B5ug40L0s8o=;
        b=r7U+yWY6gmc/AyqP8Zi5+VD8TvOHOr8nyTvhk1Mo8G0maL02gwkWi9I45eV/2gYivV
         GG+KCbDXjZBC9Um2WesRrwLR3rOkYa0cjYu0qkzK894U/FLK6QOqd/o/VR0CFgeJ4VNO
         VoJ5iF2f5ozRTFOR092HGc3RU9xs4mOTx4t3+LEKuP0x9pPyTJkbD35ZCnIs+SoxqGsD
         kVNJZUPYUhbpF69lkGE1HAqnjPtIe2rnHfsMGWTUPrXRfS/Zg2PeXkU79K55De1UgJRe
         2qqyxS86NNhA37q1WWxlK9sT/rvUWhbt+UwgUFQDdLWhVf7wgFSgHHq9W+FPthXrQnC8
         gRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yf/jVzF7WeOP+s6t7PSyOM3o8ylPOkh3B5ug40L0s8o=;
        b=BjRyIm1HX+4RvfrzS3YBDmUCJII2ivMhlgeyznojre+nStGd2xlGnJgMNrFlu1l1g9
         tWvzTbjzJL8H1myeELGRwWe3L6DrP1p7MLcLrcVTauVC10CWE706e3f0UIxwJabpk/fy
         yqnFUDNeoWcz4c3MmNIjFJNzLfxRYlvbjoI9pOGkB2Nv5wBeYSicYKbKDIUekuLQU8Ch
         Y0YtR4vktoJPn1nPeLQUvJkqB9IvZ4Xrj8NcaHIiXGhZPIcaq2/TBILFimzV5eoFoLpB
         uImk3eE4suEaQ+0SQeZXakkG18uUhXNZihPlUOjawz7mmNEYhYxmtADau/kibN03vn51
         w47g==
X-Gm-Message-State: AOAM533spBCTG6YiEaTY9j3MguszAsJ/d3S1jEt0STYqquxG0+xPOpl0
        EA91ByylBtwIA37RA6D7CXh5SPGNp7Dymg==
X-Google-Smtp-Source: ABdhPJx3mdU+xiEyyx4TyfuGJyih99+x9bNyPnGQV3AMfN+2IrCXSwGbLlZyiZPONS6zpdBZFgizTQ==
X-Received: by 2002:a05:600c:2291:: with SMTP id 17mr16099038wmf.169.1614067245855;
        Tue, 23 Feb 2021 00:00:45 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id p16sm1772447wmj.8.2021.02.23.00.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:00:44 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2] watchdog: bcm7038_wdt: add big endian support
Date:   Tue, 23 Feb 2021 09:00:42 +0100
Message-Id: <20210223080042.29569-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222200338.24696-1-noltari@gmail.com>
References: <20210222200338.24696-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

bcm7038_wdt can be used on bmips big endian (bcm63xx) devices too.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: use approach indicated by Florian (same as bcmgenet.c)

 drivers/watchdog/bcm7038_wdt.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 979caa18d3c8..acaaa0005d5b 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -34,6 +34,25 @@ struct bcm7038_watchdog {
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
+static inline void bcm7038_wdt_write(u32 value, void __iomem *addr)
+{
+	/* MIPS chips strapped for BE will automagically configure the
+	 * peripheral registers for CPU-native byte order.
+	 */
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		__raw_writel(value, addr);
+	else
+		writel_relaxed(value, addr);
+}
+
+static inline u32 bcm7038_wdt_read(void __iomem *addr)
+{
+	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
+		return __raw_readl(addr);
+	else
+		return readl_relaxed(addr);
+}
+
 static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
 {
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
@@ -41,15 +60,15 @@ static void bcm7038_wdt_set_timeout_reg(struct watchdog_device *wdog)
 
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
@@ -66,8 +85,8 @@ static int bcm7038_wdt_stop(struct watchdog_device *wdog)
 {
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 
-	writel(WDT_STOP_1, wdt->base + WDT_CMD_REG);
-	writel(WDT_STOP_2, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_STOP_1, wdt->base + WDT_CMD_REG);
+	bcm7038_wdt_write(WDT_STOP_2, wdt->base + WDT_CMD_REG);
 
 	return 0;
 }
@@ -88,7 +107,7 @@ static unsigned int bcm7038_wdt_get_timeleft(struct watchdog_device *wdog)
 	struct bcm7038_watchdog *wdt = watchdog_get_drvdata(wdog);
 	u32 time_left;
 
-	time_left = readl(wdt->base + WDT_CMD_REG);
+	time_left = bcm7038_wdt_read(wdt->base + WDT_CMD_REG);
 
 	return time_left / wdt->rate;
 }
-- 
2.20.1

