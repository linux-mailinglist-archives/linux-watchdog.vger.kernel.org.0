Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0D34AB2C8
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Feb 2022 00:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbiBFXCg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 6 Feb 2022 18:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbiBFXCf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 6 Feb 2022 18:02:35 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF816C06173B
        for <linux-watchdog@vger.kernel.org>; Sun,  6 Feb 2022 15:02:33 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id t7so17095737ljc.10
        for <linux-watchdog@vger.kernel.org>; Sun, 06 Feb 2022 15:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9L10ZDl9aZ/w7AJUl2eVhvDOvE2ohq7Zlt8FTkSDmIA=;
        b=ize7Ab+dPu3GP95r8nY2oHXUxxksSA+av0ohe2REbJtwEzXdS6m6g4zm58XUuoQPRv
         EXS4jHi3Xo1df2LZoQDDeYLFxAINuUoPhicQ8YZDcQjI60Fg3/yAggwGIME+XPzVmLZ+
         1uuU0V5an2SzLNVNnwLKj9P+kwiiVx38R6zpcs9jrxyUh2EkiF6lXtC/joQmiebiBWv7
         fuyW4fkw/cDCCdfKA5DlZ5D32J70sJ9LtyqlKAjh4F0vRRPj/Yiy7spsiRQrwjJF7Exq
         z+0wc378F9anDfl1PVdXNbHc5caKqxLlRlpHBdcAByqNfUyZrnT+7iKyxfQYNihZ/Ftg
         Wwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9L10ZDl9aZ/w7AJUl2eVhvDOvE2ohq7Zlt8FTkSDmIA=;
        b=6twdScFUkk/OZ9IhMMJCNMfqq2H+jGIoVj8HFHxgG+ZuDbdB4Uija6HQCeKGDOi/No
         Wh1rDcUSDM9jIPRFpZSfFWyk6gZfqubw8HWxh61kr2g4QorL1DoyqBixt2R7yRrfwWX7
         WLpbQJdlmTjuxqli1/QDvqSw1HQaB+1pCof5DSJaWPw2QuhZlcn8TcVtGPlaoVFO1Ft1
         ih0vXmRQxLKBWuCEVR87HG520ZwvbB13x/tBbDA0u0QZ/TK72KwZf4BOcMH43QVC7vAn
         tI9aPr1rQQaUiV6biuVFQqlfgyCvJ+LaS+1feWrct//RdWpOVqHa+GR4zK8V5yLIrJsA
         7boQ==
X-Gm-Message-State: AOAM531bBmtcz0nFa2UIn8v3XOrTR775m20QfR2Or3VeRirTQpHWKZ7o
        odvkkI3pPEHQhmul3G03MIYpe94p2SyKgg==
X-Google-Smtp-Source: ABdhPJzo9v4jjedzfsTeeSYIN8+88n1MgSbahS2a3wofIrOp6vNohjl7BebOrlUB5Xpaqnan52Xf2g==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr6975875ljn.504.1644188552132;
        Sun, 06 Feb 2022 15:02:32 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id t6sm1255324lfl.150.2022.02.06.15.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 15:02:31 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] watchdog: ixp4xx: Implement restart
Date:   Mon,  7 Feb 2022 00:00:28 +0100
Message-Id: <20220206230028.476659-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Implement watchdog restart in the IXP4xx watchdog timer.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop the msleep(1000) - it works fine without!
---
 drivers/watchdog/ixp4xx_wdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/watchdog/ixp4xx_wdt.c b/drivers/watchdog/ixp4xx_wdt.c
index 31b03fa71341..281a48d9889f 100644
--- a/drivers/watchdog/ixp4xx_wdt.c
+++ b/drivers/watchdog/ixp4xx_wdt.c
@@ -84,10 +84,24 @@ static int ixp4xx_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int ixp4xx_wdt_restart(struct watchdog_device *wdd,
+                              unsigned long action, void *data)
+{
+	struct ixp4xx_wdt *iwdt = to_ixp4xx_wdt(wdd);
+
+	__raw_writel(IXP4XX_WDT_KEY, iwdt->base + IXP4XX_OSWK_OFFSET);
+	__raw_writel(0, iwdt->base + IXP4XX_OSWT_OFFSET);
+	__raw_writel(IXP4XX_WDT_COUNT_ENABLE | IXP4XX_WDT_RESET_ENABLE,
+		     iwdt->base + IXP4XX_OSWE_OFFSET);
+
+	return 0;
+}
+
 static const struct watchdog_ops ixp4xx_wdt_ops = {
 	.start = ixp4xx_wdt_start,
 	.stop = ixp4xx_wdt_stop,
 	.set_timeout = ixp4xx_wdt_set_timeout,
+	.restart = ixp4xx_wdt_restart,
 	.owner = THIS_MODULE,
 };
 
-- 
2.34.1

