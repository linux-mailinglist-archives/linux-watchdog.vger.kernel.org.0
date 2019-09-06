Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFE3AC1B3
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403987AbfIFUyT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 16:54:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32870 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730739AbfIFUyS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 16:54:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so8218542wme.0
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 13:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fcen4t8ALRC/eyTecR6xj2ycvqKCwBYdO81MLFjTX94=;
        b=OVQATcHvrR2G3H50mlV29q3R3sZxjU4siUCn8rM/DditB7+reiuxabkbg49orRaHKY
         NwdNnCoCOvM6Eg8Qd4gSpCR+z5c56WwyEpo0bTkQClbFvy48BMKWK0hJypAoQSx07W9a
         W4hjF5ttQ4wkLS6qffiOUN3ljwOWiAqnm7+RJH0SDSS+haBT5EvoDis3M7e2bOTxej5B
         PAW5wcFYRo/0FtWVYwXoHfTeHbTGwIphie+LtGJEmSvIDG2ZGtWeSp7L3Xsqw7rXfR5o
         vuxK7s1XPg1PM0P5sfmDx6fKLxkIUeDqjN8hKGDLcUyiiN7KslFNxmM9k0jQF36FNlq2
         X36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fcen4t8ALRC/eyTecR6xj2ycvqKCwBYdO81MLFjTX94=;
        b=TnSYwey3veVc8iIAGR/KoqTu1fiwYj64avdO/a0RB8L5zrgIGGti3l/8yYmfHYmV1e
         IqehdPK2NXANdofAQQd4iLF15Oili8Jk5aZpYzGUThetZqJj8SeS3nAqTDWG6XPHnMeI
         5/x4THk0uXHiSyitFWcG9ZH1jMdC/KZ6YCFsoPhV+gbB0RQAw6ExLQ/3NF532eNDoVGa
         ILBiu7E90yEHEhmwBc0/BkYSalpH/8x2Hv8wB9mBYDE4frQM49yaH2MdAHjLuSJkycnm
         bbeyWWs2kKAYp4vD9IiSbtqRnHuvkKl+vWhD7ldPCD5A27S7kd715v8MQ+KP6vxylfW8
         3L2A==
X-Gm-Message-State: APjAAAXWzZp+pGPmhGUR4Ymcc+0MImO1gtmnrSdS98lCU8DGYLriBIbq
        7TAm+HrQmz4KQmgshl6Q+LjHvw==
X-Google-Smtp-Source: APXvYqz8l5Gp8o2izYZAEjl3kHvFNBZNR9bd57fzq9r1AwdI/krZ5I4P8EaB+FNEft4iPL7zcJz8wA==
X-Received: by 2002:a1c:ef13:: with SMTP id n19mr9159278wmh.48.1567803257227;
        Fri, 06 Sep 2019 13:54:17 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q5sm317416wmq.3.2019.09.06.13.54.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:54:16 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        linux@roeck-us.net, wim@linux-watchdog.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] watchdog: qcom: remove unnecessary variable from private storage
Date:   Fri,  6 Sep 2019 22:54:11 +0200
Message-Id: <20190906205411.31666-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
References: <20190906205411.31666-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

there is no need to continue keeping the clock in private storage.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/qcom-wdt.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 935c78a882a3..e98f5a3d83ea 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -42,7 +42,6 @@ static const u32 reg_offset_data_kpss[] = {
 
 struct qcom_wdt {
 	struct watchdog_device	wdd;
-	struct clk		*clk;
 	unsigned long		rate;
 	void __iomem		*base;
 	const u32		*layout;
@@ -189,6 +188,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	const u32 *regs;
 	u32 percpu_offset;
 	int irq, ret;
+	struct clk *clk;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -215,19 +215,18 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	wdt->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(wdt->clk)) {
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
 		dev_err(dev, "failed to get input clock\n");
-		return PTR_ERR(wdt->clk);
+		return PTR_ERR(clk);
 	}
 
-	ret = clk_prepare_enable(wdt->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
 		dev_err(dev, "failed to setup clock\n");
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare,
-				       wdt->clk);
+	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare, clk);
 	if (ret)
 		return ret;
 
@@ -239,7 +238,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	 * that it would bite before a second elapses it's usefulness is
 	 * limited.  Bail if this is the case.
 	 */
-	wdt->rate = clk_get_rate(wdt->clk);
+	wdt->rate = clk_get_rate(clk);
 	if (wdt->rate == 0 ||
 	    wdt->rate > 0x10000000U) {
 		dev_err(dev, "invalid clock rate\n");
-- 
2.23.0

