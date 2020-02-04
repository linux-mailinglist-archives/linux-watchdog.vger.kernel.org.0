Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFEA5152092
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 19:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgBDSpV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 13:45:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39794 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgBDSpU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 13:45:20 -0500
Received: by mail-wm1-f68.google.com with SMTP id c84so4961128wme.4;
        Tue, 04 Feb 2020 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMFlsR7qx6bXagNyx7Jox688AU9bV//h/0L/xQvnsPg=;
        b=fOcBN9StwGkaLrKF+J/rKCMTCwU0dw6sZohy0g7LtyYkHUaa4UIc6rHsycYiVpKZhE
         OR3B+3AUPQottL62OyLos7vQEBed5nURTV/jZ1HYiNmv7b77oRKJpBxB5Nf6E/FvLqwK
         bhgxKtasWzYxdQVYbD78nlY7B4BrWlf7/I8I5qCU2v9JoDb27c34eB010ueIQ33AJsIk
         IvQ19BEtA/quV7pBKKkdvyC4A9b0xf2PDO7AojyMPQ42nlHk301mhqDNzLuJ8wECIRYM
         KRvAimac4WuZopJmls/K95DpUhoztPgB08WI0vWjAOoa5w/JxuAEHyGg535YuN/0Gndy
         x1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMFlsR7qx6bXagNyx7Jox688AU9bV//h/0L/xQvnsPg=;
        b=REv1Y5qnnXXueC4Gu3rLasNIFVOFE/PFTYhmNa7Qd1xTmvLgUvpyu47z5ZRO5a5KUt
         zw34jHrR0LxQEb+KRaEIwaKnzLTmfs9svriUP4AKGowzRGI9+T7ON+/SRWfh+UwuqSo5
         oUMqrg7IfqoNNoUglubIbEJU/Kiid+ru1sZcMbkoQWG9lksWDoJMOjw/pwN5+86r41zm
         MnL6IwfIHLXTUbY0zUsym246AL4Thzpbxzf952ZJVUWsUokJJ7/dkEYl5oCR+0xE5XU1
         H89ldVlxy/lmYJGgz3qWZNhBH1w7WZiuad6RN58fOCgYMqfeNI+km4nxQvG/y5F2JL8d
         zWAg==
X-Gm-Message-State: APjAAAX/5BQGOckAK5czZaPYkxamXn9QkQX0w91F+LZNwsIaAOyMjc5K
        zAkPvgeOi5IElzCrsgDyLGk=
X-Google-Smtp-Source: APXvYqzpyJ2XJn3Vu5i3/57l1+hlgEKhgUhyGoqkcsutpcrYkMih0C3gFUT4rldnXNmvcxNUQhstrA==
X-Received: by 2002:a05:600c:146:: with SMTP id w6mr424786wmm.180.1580841918481;
        Tue, 04 Feb 2020 10:45:18 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id s1sm23254118wro.66.2020.02.04.10.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 10:45:17 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: qcom-wdt: disable pretimeout on timer platform
Date:   Tue,  4 Feb 2020 19:43:22 +0100
Message-Id: <20200204184322.22744-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Some platform like ipq806x doesn't support pretimeout and define
some interrupts used by qcom,msm-timer. Change the driver to check
and use pretimeout only on qcom,kpss-wdt as it's the only platform
that actually supports it.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/watchdog/qcom-wdt.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index a494543d3ae1..195fe49ca32e 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -40,6 +40,11 @@ static const u32 reg_offset_data_kpss[] = {
 	[WDT_BITE_TIME] = 0x14,
 };
 
+struct qcom_wdt_match_data {
+	const u32 *offset;
+	bool pretimeout;
+};
+
 struct qcom_wdt {
 	struct watchdog_device	wdd;
 	unsigned long		rate;
@@ -179,19 +184,29 @@ static void qcom_clk_disable_unprepare(void *data)
 	clk_disable_unprepare(data);
 }
 
+static const struct qcom_wdt_match_data match_data_apcs_tmr = {
+	.offset = reg_offset_data_apcs_tmr,
+	.pretimeout = false,
+};
+
+static const struct qcom_wdt_match_data match_data_kpss = {
+	.offset = reg_offset_data_kpss,
+	.pretimeout = true,
+};
+
 static int qcom_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qcom_wdt *wdt;
 	struct resource *res;
 	struct device_node *np = dev->of_node;
-	const u32 *regs;
+	const struct qcom_wdt_match_data *data;
 	u32 percpu_offset;
 	int irq, ret;
 	struct clk *clk;
 
-	regs = of_device_get_match_data(dev);
-	if (!regs) {
+	data = of_device_get_match_data(dev);
+	if (!data && !data->offset) {
 		dev_err(dev, "Unsupported QCOM WDT module\n");
 		return -ENODEV;
 	}
@@ -247,7 +262,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 
 	/* check if there is pretimeout support */
 	irq = platform_get_irq(pdev, 0);
-	if (irq > 0) {
+	if (data->pretimeout && irq > 0) {
 		ret = devm_request_irq(dev, irq, qcom_wdt_isr,
 				       IRQF_TRIGGER_RISING,
 				       "wdt_bark", &wdt->wdd);
@@ -267,7 +282,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
 	wdt->wdd.parent = dev;
-	wdt->layout = regs;
+	wdt->layout = data->offset;
 
 	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
@@ -311,9 +326,9 @@ static int __maybe_unused qcom_wdt_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(qcom_wdt_pm_ops, qcom_wdt_suspend, qcom_wdt_resume);
 
 static const struct of_device_id qcom_wdt_of_table[] = {
-	{ .compatible = "qcom,kpss-timer", .data = reg_offset_data_apcs_tmr },
-	{ .compatible = "qcom,scss-timer", .data = reg_offset_data_apcs_tmr },
-	{ .compatible = "qcom,kpss-wdt", .data = reg_offset_data_kpss },
+	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
+	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
+	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_wdt_of_table);
-- 
2.24.0

