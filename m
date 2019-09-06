Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEC4AC1B0
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403983AbfIFUyS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 16:54:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39700 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbfIFUyR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 16:54:17 -0400
Received: by mail-wm1-f65.google.com with SMTP id q12so8482150wmj.4
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 13:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qwXLokDJ/37TfRHAsvE0/1njv7WBc49AKQIAlVWAmLM=;
        b=PzqTLNLRT1tud8QVmEGktFRyB88eueo49aN/+xqss+6TmuxIu/fG5nacsOlxOxP+ZY
         vgXAwV7C6ArBOG3HXfJMHEZv1kbvr4TdaS4sbCJwjn0DATBwiBsBamKnL5iHjFJb3uQ5
         u8zudW53uL+ZxhGRx6qfwhpQtjKT1AiFv/tPZsNkjBEfagXy3yptquCwapAf7FX0MJRi
         KO8U3M/A7Xp8ADkwh200FRuiwquLLJM0v5s59v7q6IwprCRmuVyCt0foBEKFn7geS4KR
         5ARJbeFS3OgXqat2XLF9MRN4TvUwMEgWD+Q7T4yYwGTa1Yh+7DJNLAemjuYRsUCXhJq3
         0bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qwXLokDJ/37TfRHAsvE0/1njv7WBc49AKQIAlVWAmLM=;
        b=gZmlTnOu2EixSAFzCQTOXHUE86GRNq+jnbHLl256zdYihFxlnAWB4fj4q6/mM7NQ/7
         bpTJF6Cj1F+/mEv2TkY35UcfdDOedysiKWkOmAZgYNVMNRzLue4esNPtZJ3EuxxroLfD
         W8yTBtF9ElaBv/ZrLsoOp2KXDeaThZPDBlZOuaDpi2YgEbLWMg7/jaELhfmiWUVHg/QD
         lVTKHzUC4R5u05qnOY+xlyyQA7tVGk+xWkFlcuUU/3yDyWMra9MhOno3bpzjLEAXIex6
         us8qwXqwdA1fNBXM6ZbAzdLrEFvwYaq4bn/JNbsGqHfA5d1CI3xL4EQPSKCfaTUYVU6I
         SQ7g==
X-Gm-Message-State: APjAAAUlk/Ot4JmLP7ST67De/i2A/OfWl9OwCcvpoa+IiufJjjUW7F15
        55tvCx+92qiyS7BmTBstfL/wgw==
X-Google-Smtp-Source: APXvYqxofMYafhAXvPe9n1MeEFFNWOEYM0fFE3BRAVg9TltwKyP+yLvXadoNHdXwRTdwRpU3zzFXIA==
X-Received: by 2002:a1c:1bcf:: with SMTP id b198mr9304300wmb.0.1567803256233;
        Fri, 06 Sep 2019 13:54:16 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q5sm317416wmq.3.2019.09.06.13.54.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:54:15 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        linux@roeck-us.net, wim@linux-watchdog.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] watchdog: qcom: support pre-timeout when the bark irq is available
Date:   Fri,  6 Sep 2019 22:54:10 +0200
Message-Id: <20190906205411.31666-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use the bark interrupt as the pre-timeout notifier whenever this
interrupt is available.

By default, the pretimeout notification shall occur one second earlier
than the timeout.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 70 ++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..935c78a882a3 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -19,6 +21,9 @@ enum wdt_reg {
 	WDT_BITE_TIME,
 };
 
+#define QCOM_WDT_ENABLE		BIT(0)
+#define QCOM_WDT_ENABLE_IRQ	BIT(1)
+
 static const u32 reg_offset_data_apcs_tmr[] = {
 	[WDT_RST] = 0x38,
 	[WDT_EN] = 0x40,
@@ -54,15 +59,35 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct qcom_wdt, wdd);
 }
 
+static inline int qcom_get_enable(struct watchdog_device *wdd)
+{
+	int enable = QCOM_WDT_ENABLE;
+
+	if (wdd->pretimeout)
+		enable |= QCOM_WDT_ENABLE_IRQ;
+
+	return enable;
+}
+
+static irqreturn_t qcom_wdt_isr(int irq, void *arg)
+{
+	struct watchdog_device *wdd = arg;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+	unsigned int bark = wdd->timeout - wdd->pretimeout;
 
 	writel(0, wdt_addr(wdt, WDT_EN));
 	writel(1, wdt_addr(wdt, WDT_RST));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
+	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
 	return 0;
 }
 
@@ -89,6 +114,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
 	return qcom_wdt_start(wdd);
 }
 
+static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->pretimeout = timeout;
+	return qcom_wdt_start(wdd);
+}
+
 static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 			    void *data)
 {
@@ -105,7 +137,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	writel(1, wdt_addr(wdt, WDT_RST));
 	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(QCOM_WDT_ENABLE, wdt_addr(wdt, WDT_EN));
 
 	/*
 	 * Actually make sure the above sequence hits hardware before sleeping.
@@ -121,6 +153,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
 	.stop		= qcom_wdt_stop,
 	.ping		= qcom_wdt_ping,
 	.set_timeout	= qcom_wdt_set_timeout,
+	.set_pretimeout	= qcom_wdt_set_pretimeout,
 	.restart        = qcom_wdt_restart,
 	.owner		= THIS_MODULE,
 };
@@ -133,6 +166,15 @@ static const struct watchdog_info qcom_wdt_info = {
 	.identity	= KBUILD_MODNAME,
 };
 
+static const struct watchdog_info qcom_wdt_pt_info = {
+	.options	= WDIOF_KEEPALIVEPING
+			| WDIOF_MAGICCLOSE
+			| WDIOF_SETTIMEOUT
+			| WDIOF_PRETIMEOUT
+			| WDIOF_CARDRESET,
+	.identity	= KBUILD_MODNAME,
+};
+
 static void qcom_clk_disable_unprepare(void *data)
 {
 	clk_disable_unprepare(data);
@@ -146,7 +188,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const u32 *regs;
 	u32 percpu_offset;
-	int ret;
+	int irq, ret;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -204,7 +246,25 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	wdt->wdd.info = &qcom_wdt_info;
+	/* check if there is pretimeout support */
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
+				       IRQF_TRIGGER_RISING,
+				       "wdt_bark", &wdt->wdd);
+		if (ret)
+			return ret;
+
+		wdt->wdd.info = &qcom_wdt_pt_info;
+		wdt->wdd.pretimeout = 1;
+	} else {
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		wdt->wdd.info = &qcom_wdt_info;
+		wdt->wdd.pretimeout = 0;
+	}
+
 	wdt->wdd.ops = &qcom_wdt_ops;
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
-- 
2.23.0

