Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3826E152156
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 20:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgBDT5E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 14:57:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46741 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgBDT5E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 14:57:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so24596825wrl.13;
        Tue, 04 Feb 2020 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+yNaJp7oUZoKhcclI8Dxuk5xvWQ6/1nUWlWmNYelU0=;
        b=uXAnnJyOP3XxbaFXyIjwMr/FV8i/RpKXVy2RiVCpSLtnNyTqPeIFDZRRue+N0MZBU0
         VcTurBFWNZJ4CJMSjwV55oquji6gpM6krYS/OvlNS5a7zmBy4HlpgVjXlQm8xkEqlihi
         Jd+kXnkQnb3USQ3SC/KeOd92X+zxtTp6dThrLWPx6wUN7kHYro3z01pYcKl52kGB9Cac
         lhbg8e2VAB4kLuG7N0Y/Hn+LwTsIEJWad645iKYAc8SpAegb0Uvo+WloIG5nPwOjH79O
         dWR3P8WAi775jXVu9D5FtzyM8WB4jTcWRGbMFH1haEIUxGnDkN8aoRxRX8TP2cbZ+VLx
         +RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+yNaJp7oUZoKhcclI8Dxuk5xvWQ6/1nUWlWmNYelU0=;
        b=agRP0pbHno2LtoCKkQ9plNKVM2WZySnEBetr3/u0OYkzPHTeTtCd/H53xl+1BDfsZS
         szB8+rYpYsvhTjEOV6CM/0fZZGMX212eNGIxzXQnxUwB/idivKCMBpjo2BeHgn8SdLtj
         b8Iz9xNqWfkxUVNUaEYn6ikHPDYNxQ3010VCVhGD0qj+qUQtuCVJzqKMcEmDvhpcbmIG
         31g4TqOAKpLePj5Nxp666JIjqq3mYgfQTerwqgYvZ13tEhcFOZ/OfxVtB5fIO6tRiXEI
         IzIBthqTAWAIbYr3w02IW3p/dS0kGRBt+wQVWtsCY5GJHtqJnlKx26viHwMZ8TN/qf/D
         atuQ==
X-Gm-Message-State: APjAAAV/1OR4/ej3MaRwfwEndykFha5tKig3jMEcuqgWqKNuWCAzDKXo
        tQeYti5Ytvkte9EGECaOgo8=
X-Google-Smtp-Source: APXvYqyQx0W0FqnaW4/+81tXXRCLubnvr11FkS+hNIAt/oe7kUrrRQ2gZyVssaB/xpy/R9AFRNQ7hg==
X-Received: by 2002:a5d:5221:: with SMTP id i1mr22164042wra.44.1580846220291;
        Tue, 04 Feb 2020 11:57:00 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id z6sm29710177wrw.36.2020.02.04.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 11:56:59 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: qcom-wdt: disable pretimeout on timer platform
Date:   Tue,  4 Feb 2020 20:56:48 +0100
Message-Id: <20200204195648.23350-1-ansuelsmth@gmail.com>
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
index a494543d3ae1..d13c75028985 100644
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
+	if (!data) {
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

