Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC745A2E50
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Aug 2022 20:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344321AbiHZSTx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Aug 2022 14:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344539AbiHZSTv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Aug 2022 14:19:51 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C996325F5
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 11:19:48 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l23so2359976lji.1
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Aug 2022 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=E7bH/uBod3gEArFjBjyqSYswhiWTZ0KzaOc9MDcuJqM=;
        b=W5GGbXhSCCBtbAs+kGwHZ+Le6XC6v1AK39FMzbQpykV1FIS5meiviAM20WXXudoSfI
         4/HFTNKyo6u8f9D/cOd/4nLnE7mMiutO6p/+fKfNTGR5BcWzpJnJuaFUXiA6+/2Kdh9q
         cliiWFUkuppGuRcsPVu8OxGjEDvMD7F+l5NcqXN4uV/ivI7KIG6YUnpaUiRCCIF8QzI/
         K5eAGpyquqGoPJ4hCyv3n9fJJOq05hoxG+ISoBNCrEpxz/4asxdMNb63tqEfaWYbxE2J
         5aLkULFBrQ41Xu/XKx4PH/C9QzUxS/md1xffwNNKsEpzcCBtv67TEgz87OEwnOs9Rafs
         +ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=E7bH/uBod3gEArFjBjyqSYswhiWTZ0KzaOc9MDcuJqM=;
        b=QMtgodF6A5E9/s0F7R6l0xgKii1iBeRXQoZDJEvVvZgRWfRdy/HZxp6+TBobAor+CC
         t/7Cnyhi1Fx7dAeZwni3Ukt6I3UJWHOJxYsupkFZ37C1zIjGM96tI4wnFU7VHK8cAlUl
         CQzx8Q+y4Ybu9oAntDqmEliSXmZ13U7pHMpIarBcOFpsSODZzIeun4hCx4nTuJptGKkA
         6s+rUgO9v7pWpU7lmmjWJT9hY6YUhHlqOgRBbepLVRcwDFu8u16v2QP2Vcje/qGfSKJ2
         0+L5566PkOUUtV4LHXeMtc2B3mPC20vYednsLv1VNnWJol1CJ9id093W/Yj/FvjQ8cBg
         dxAw==
X-Gm-Message-State: ACgBeo07YocJ50v/JfCfuTTcDa7rGuY8iWsh/r8pECi4Y6ynLK5aVFSQ
        eNUzTzbS8Z4QLyWzptt9wyce6Uhu10abNw==
X-Google-Smtp-Source: AA6agR71kWWSlb1W3bwiorWB16vmDq4sfcTPlM0888XkWyF6Lo5VGMB5fSZvMNvVigxrK3eUiQ4s/g==
X-Received: by 2002:a2e:a370:0:b0:25e:502a:5308 with SMTP id i16-20020a2ea370000000b0025e502a5308mr2565290ljn.282.1661537987022;
        Fri, 26 Aug 2022 11:19:47 -0700 (PDT)
Received: from saproj-Latitude-5501.yandex.net ([2a02:6b8:0:40c:577c:85a1:14b0:31a8])
        by smtp.gmail.com with ESMTPSA id e14-20020a05651c038e00b00261e8e4e381sm541594ljp.2.2022.08.26.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 11:19:46 -0700 (PDT)
From:   Sergei Antonov <saproj@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Sergei Antonov <saproj@gmail.com>
Subject: [PATCH] watchdog: ftwdt010_wdt: implement _restart() function
Date:   Fri, 26 Aug 2022 21:19:21 +0300
Message-Id: <20220826181921.3899603-1-saproj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Implement ftwdt010_wdt_restart(). It enables watchdog with timeout = 0
and disabled IRQ. Since it needs code similar to ftwdt010_wdt_start(),
add a new function ftwdt010_enable() and move common code there.

Signed-off-by: Sergei Antonov <saproj@gmail.com>
---
 drivers/watchdog/ftwdt010_wdt.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/ftwdt010_wdt.c b/drivers/watchdog/ftwdt010_wdt.c
index 21dcc7765688..0a5bbfd2823f 100644
--- a/drivers/watchdog/ftwdt010_wdt.c
+++ b/drivers/watchdog/ftwdt010_wdt.c
@@ -47,21 +47,28 @@ struct ftwdt010_wdt *to_ftwdt010_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct ftwdt010_wdt, wdd);
 }
 
-static int ftwdt010_wdt_start(struct watchdog_device *wdd)
+static void ftwdt010_enable(struct ftwdt010_wdt *gwdt,
+			    unsigned int timeout,
+			    bool need_irq)
 {
-	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
 	u32 enable;
 
-	writel(wdd->timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
+	writel(timeout * WDT_CLOCK, gwdt->base + FTWDT010_WDLOAD);
 	writel(WDRESTART_MAGIC, gwdt->base + FTWDT010_WDRESTART);
 	/* set clock before enabling */
 	enable = WDCR_CLOCK_5MHZ | WDCR_SYS_RST;
 	writel(enable, gwdt->base + FTWDT010_WDCR);
-	if (gwdt->has_irq)
+	if (need_irq)
 		enable |= WDCR_WDINTR;
 	enable |= WDCR_ENABLE;
 	writel(enable, gwdt->base + FTWDT010_WDCR);
+}
 
+static int ftwdt010_wdt_start(struct watchdog_device *wdd)
+{
+	struct ftwdt010_wdt *gwdt = to_ftwdt010_wdt(wdd);
+
+	ftwdt010_enable(gwdt, wdd->timeout, gwdt->has_irq);
 	return 0;
 }
 
@@ -93,6 +100,13 @@ static int ftwdt010_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int ftwdt010_wdt_restart(struct watchdog_device *wdd,
+				unsigned long action, void *data)
+{
+	ftwdt010_enable(to_ftwdt010_wdt(wdd), 0, false);
+	return 0;
+}
+
 static irqreturn_t ftwdt010_wdt_interrupt(int irq, void *data)
 {
 	struct ftwdt010_wdt *gwdt = data;
@@ -107,6 +121,7 @@ static const struct watchdog_ops ftwdt010_wdt_ops = {
 	.stop		= ftwdt010_wdt_stop,
 	.ping		= ftwdt010_wdt_ping,
 	.set_timeout	= ftwdt010_wdt_set_timeout,
+	.restart	= ftwdt010_wdt_restart,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.34.1

