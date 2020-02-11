Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAE615933B
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 Feb 2020 16:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbgBKPeU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 Feb 2020 10:34:20 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50479 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbgBKPeU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 Feb 2020 10:34:20 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so4096069wmb.0
        for <linux-watchdog@vger.kernel.org>; Tue, 11 Feb 2020 07:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gaMBkxIEADyOXYD+m1B71q6f40Ft/0OxAlwSgeW5wfA=;
        b=lFsBW6NdC7MfU5CLv6IRxqCkHvmPkDb85IcKSpBizTC8NeOMPVtw9yYwPYi/8SGzJZ
         XpzdL8blUUOFabnKVH7n9euT16lWxcFhBb+yCFV1/Be91esLVpjdVdRV3VCFvUETSnaP
         /RnHHhsUAR41crWtqIfDKW1wLXlF35Fu3bMevp+/lCK4nYZYEXy2+3pHBD/T+25rPhA4
         adr9NVepY7/N2MJXLHswuv5N2/4jiNPqx7UxnCfQbJ+x+LRdGML0gSYfcQswWPlocggA
         BmdaEMR1Owmbnnwbqw08dGCtIDT2i6vxwjMYSdKzbmbGZguqNRLiP6hd5XYumGW9KPFt
         9u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gaMBkxIEADyOXYD+m1B71q6f40Ft/0OxAlwSgeW5wfA=;
        b=pT2fYm0f/4mKftqw0eW5HEdNwRGbkiWhilHu0myV0WDDI/NFGfI25Y19M3yXpdEugK
         t6726HSkE2ReODLQnS29mTSZDnchk7/qWq34jLg8H1cIvOHLcCe71DOvaDUpnE3agiR9
         mO5YBzEqMWlUQViH1RNXUzSNj+iGySG6ahg4DzfPDnPtMv23DIIi2fDHr41jFrxrWkOe
         GFSVeAWnbVVUr4aGu5yxme6GBLVxEX4cOl4H7LxyQVsjuZ9ekhgVlEy4k+4UuFCBHlRz
         zpa5Z65D9UehXugLTgjveDDx8QA1TJlgxiB0zE+jzB/M/Pz+OEdCyZ3AyYk9PgA5CLWa
         zFFQ==
X-Gm-Message-State: APjAAAXe7Zbhyefa/dC+qByJd4b8WgKqvB4Dr6z8TB/Mi14dbMQqf5RY
        As3N9W9gIrOCFPkINKWF9tf0vw==
X-Google-Smtp-Source: APXvYqyLBtxEowztihqQPFRW4TAySU04wCU9yDXJhtugFo7bNmOnLvDdHuVlqLV50jfMYDXMzCH8Pg==
X-Received: by 2002:a05:600c:410f:: with SMTP id j15mr6001839wmi.132.1581435257750;
        Tue, 11 Feb 2020 07:34:17 -0800 (PST)
Received: from localhost.localdomain ([172.111.156.65])
        by smtp.gmail.com with ESMTPSA id s23sm5634505wra.15.2020.02.11.07.34.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 11 Feb 2020 07:34:17 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] watchdog: pm8916_wdt: Add system sleep callbacks
Date:   Tue, 11 Feb 2020 16:38:03 +0100
Message-Id: <1581435483-6796-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add suspend and resume pm operations.
Tested on dragonboard-410c.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/watchdog/pm8916_wdt.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 1213179..0937b8d3 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -192,6 +192,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	wdt->wdev.timeout = PM8916_WDT_DEFAULT_TIMEOUT;
 	wdt->wdev.pretimeout = 0;
 	watchdog_set_drvdata(&wdt->wdev, wdt);
+	platform_set_drvdata(pdev, wdt);
 
 	watchdog_init_timeout(&wdt->wdev, 0, dev);
 	pm8916_wdt_configure_timers(&wdt->wdev);
@@ -199,6 +200,29 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, &wdt->wdev);
 }
 
+static int __maybe_unused pm8916_wdt_suspend(struct device *dev)
+{
+	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdev))
+		return pm8916_wdt_stop(&wdt->wdev);
+
+	return 0;
+}
+
+static int __maybe_unused pm8916_wdt_resume(struct device *dev)
+{
+	struct pm8916_wdt *wdt = dev_get_drvdata(dev);
+
+	if (watchdog_active(&wdt->wdev))
+		return pm8916_wdt_start(&wdt->wdev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(pm8916_wdt_pm_ops, pm8916_wdt_suspend,
+			 pm8916_wdt_resume);
+
 static const struct of_device_id pm8916_wdt_id_table[] = {
 	{ .compatible = "qcom,pm8916-wdt" },
 	{ }
@@ -210,6 +234,7 @@ static struct platform_driver pm8916_wdt_driver = {
 	.driver = {
 		.name = "pm8916-wdt",
 		.of_match_table = of_match_ptr(pm8916_wdt_id_table),
+		.pm = &pm8916_wdt_pm_ops,
 	},
 };
 module_platform_driver(pm8916_wdt_driver);
-- 
2.7.4

