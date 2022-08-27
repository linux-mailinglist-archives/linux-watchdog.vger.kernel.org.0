Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550A05A3819
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Aug 2022 16:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiH0OYU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Aug 2022 10:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiH0OYT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Aug 2022 10:24:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B506732EEB
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Aug 2022 07:24:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id n24so4018584ljc.13
        for <linux-watchdog@vger.kernel.org>; Sat, 27 Aug 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=HbdXU7dzIwy7ZvY124oLhnsZyjXer1TmfSb8KrfKrFE=;
        b=SFF9ubXZmlFRUsGpdhM7KBqVRuGFX4XPu8u4cql+Dlqk1QCAEVXgFwD7nhDzv79ZHO
         RQcJJ34oYFtPNRtN52BWNvVVzITa4OuPoCUzy0Q182jkRa8T4hcbOffYv78SJmVNJda8
         I59tFF5a6UZYmFaDYwnA5uFDs5ps9oOOHiSJa7C2rtQEJZidF+wttekhES5ABCLAPci6
         5qsV/EkXn7O/sPWh1f/FD6cInfNPo8gD1E8VhxKukGbJ0qCuVoCqH8llMl0dLpfLdVk0
         mMg3byW1NzTMGRwAuYV2OEZZFO7UwbQK1bxZkEaot1EhciRtQ9+eY2CSZwxiVfc8FxbR
         JO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=HbdXU7dzIwy7ZvY124oLhnsZyjXer1TmfSb8KrfKrFE=;
        b=tK9XaqwJOZt6nZzNIw/m+Mc3wxcl4O4O1BJY+P1E8bxZbdu3mjIyaf1X9ouE7/q6e0
         HmAzeUyMvl6pLrBTmhXKxdIcupqYdU2pnWJDtmrJnvb4/+TOFmXmU0/I4AAupyo9uxsm
         RWCbMurBYTkHxDCkHYfjsMi5Wh/vBuxHQMrGyqS3KcUmg1OU8SuvJdoruBY2EEpAt5Tn
         Lhn+ix6zjD8z7FD/XmPdMYBjiYgrKz6MikFj9s/qyb5iWnh4Ut08otq2DkCKant/nWm/
         YyWE80UlVtnfgTUq/wSEiXPs5mRpHAZCEJ/bUyNOlVF3ug7X9aeldT9050+gaxDuUdWY
         QEoQ==
X-Gm-Message-State: ACgBeo26dw4kHaYIHJ+b9OrCUfVpxDpAO0liuBrXF7+X8vRw870Bpr5u
        ZJ1lDWtjhwMHcA+BefRL8oPagCd0eIaPIQ==
X-Google-Smtp-Source: AA6agR7G46LEaDtTtAtEOaIAbXKrvTHmMoOhYfj4gJ8n9GRzmPpJ9gzjQ835NMMiaERbT+bhhVF1Ew==
X-Received: by 2002:a05:651c:2102:b0:25a:42ee:49ae with SMTP id a2-20020a05651c210200b0025a42ee49aemr3456381ljq.200.1661610257012;
        Sat, 27 Aug 2022 07:24:17 -0700 (PDT)
Received: from saproj-Latitude-5501.yandex.net ([2a02:6b8:0:40c:577c:85a1:14b0:31a8])
        by smtp.gmail.com with ESMTPSA id w20-20020a05651234d400b0048b0099f40fsm676538lfr.216.2022.08.27.07.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 07:24:16 -0700 (PDT)
From:   Sergei Antonov <saproj@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Sergei Antonov <saproj@gmail.com>
Subject: [PATCH v2] watchdog: ftwdt010_wdt: implement _restart() function
Date:   Sat, 27 Aug 2022 17:24:14 +0300
Message-Id: <20220827142414.4017751-1-saproj@gmail.com>
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

v1 -> v2:
Do not let IRQ trigger when restarting.
Add a helper function ftwdt010_enable().

Suggested-by: Guenter Roeck <linux@roeck-us.net>
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

