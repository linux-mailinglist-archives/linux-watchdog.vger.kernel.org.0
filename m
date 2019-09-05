Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23BAAADD
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 20:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389882AbfIESY0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 14:24:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37670 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389551AbfIESY0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 14:24:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id i1so3314335wro.4
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Sep 2019 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fa+kyDa0J3UDgtTokX5PSraDFnwKfBrrRUNa7uKQ4zc=;
        b=egglMIP0L9o76Prk2RwMG1+crapx0HRW3AFjHZt3+xYf2mak7Ip2QM/+K9lym4nQKr
         +8/juAojIrEwENufL7O2CNyz4/vaXtBhcNc8CTOut9i6aLQe9Nz6J7H/LCFjtoA+Xzkq
         Ta6BuRU24lH+GgGpc+y8goGQQPwks34+KUcYr46Qfx6ixCtDkm3Xkag72QIzllnBR82v
         BIgCmt2Q+W7R8qDAdVITcLYFyV9jg6c2rhuKk78yVicztdbwdhZ+dSyITLVwxq6RFnOi
         0eXi+6P/SdNJ5vrCv2Q1ByU0o3AEz7KZUhMyZ/rk+ooqrLuXkue5OdfJJebq9lV/t6sP
         ENYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fa+kyDa0J3UDgtTokX5PSraDFnwKfBrrRUNa7uKQ4zc=;
        b=JMmled8v0ofskMdo2w1MbyfH48BX/VgBhFsqqiX4e29NVCGp9zt6vwJXtikCm359oP
         QEqAhZfvr8BT3iXIPy+1iYshmXZ6RUGu5kmftbVm4e0SqPaU2mMxG1fA0aT6/6N2hwWh
         O7Xa6fgjlUkY6sHoOJvl7Hc3IvemvHmt6I0wjCmXaFVefE5RpB5zt2BTVS0ejxJnyK6X
         g0IAk7fPtIwRR7moonAli6svsMVs63DV+HcSYjV0LQnKkwkFgJUB9NjipM/zFSbIeZjZ
         MAHkOFdF3xV5aQ+xmUqnZOecqOwGSapVwPQD1H7ypDjMDSHmToRaYKvV2E/QbSwAvJCx
         0GUw==
X-Gm-Message-State: APjAAAV6tOakWCpFhheIKXSVVH3e8xTk7Dvf0wH+GKzlCN/ixWc6opP/
        SUWa2gGteBizn9ZONsmrvDwJXA==
X-Google-Smtp-Source: APXvYqzAoWh69dxryFmMtb7Y48F22r8XgnXXpcLfia/65KvWJxf0e1JvnELu4CzfFJjl4wNZVFyLuQ==
X-Received: by 2002:adf:e790:: with SMTP id n16mr3666412wrm.120.1567707864040;
        Thu, 05 Sep 2019 11:24:24 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id x5sm4353851wrg.69.2019.09.05.11.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Sep 2019 11:24:23 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: qcom: support pre-timeout when the bark irq is available
Date:   Thu,  5 Sep 2019 20:24:19 +0200
Message-Id: <20190905182419.26539-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
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
 v3:
    remove unnecesary variable added to private.

 v2:
    register the pre-timeout notifier instead.

 v1:
    use the bark irq to notify the user.

 drivers/watchdog/qcom-wdt.c | 60 +++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..847dbf79df1c 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/watchdog.h>
 
 enum wdt_reg {
 	WDT_RST,
@@ -54,15 +56,37 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct qcom_wdt, wdd);
 }
 
+static inline int qcom_wdt_enable(struct watchdog_device *wdd)
+{
+	/* enable the bark interrupt */
+	if (wdd->info->options & WDIOF_PRETIMEOUT)
+		return 3;
+
+	return 1;
+}
+
+static irqreturn_t qcom_wdt_irq(int irq, void *cookie)
+{
+	struct watchdog_device *wdd = (struct watchdog_device *) cookie;
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static int qcom_wdt_start(struct watchdog_device *wdd)
 {
 	struct qcom_wdt *wdt = to_qcom_wdt(wdd);
+	unsigned int bark = wdd->pretimeout;
+
+	if (!(wdd->info->options & WDIOF_PRETIMEOUT))
+		bark = wdd->timeout;
 
 	writel(0, wdt_addr(wdt, WDT_EN));
 	writel(1, wdt_addr(wdt, WDT_RST));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
+	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_wdt_enable(wdd), wdt_addr(wdt, WDT_EN));
 	return 0;
 }
 
@@ -89,6 +113,14 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
 	return qcom_wdt_start(wdd);
 }
 
+static int qcom_wdt_set_pretimeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	wdd->pretimeout = timeout;
+
+	return 0;
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
+	writel(qcom_wdt_enable(wdd), wdt_addr(wdt, WDT_EN));
 
 	/*
 	 * Actually make sure the above sequence hits hardware before sleeping.
@@ -121,11 +153,12 @@ static const struct watchdog_ops qcom_wdt_ops = {
 	.stop		= qcom_wdt_stop,
 	.ping		= qcom_wdt_ping,
 	.set_timeout	= qcom_wdt_set_timeout,
+	.set_pretimeout	= qcom_wdt_set_pretimeout,
 	.restart        = qcom_wdt_restart,
 	.owner		= THIS_MODULE,
 };
 
-static const struct watchdog_info qcom_wdt_info = {
+static struct watchdog_info qcom_wdt_info = {
 	.options	= WDIOF_KEEPALIVEPING
 			| WDIOF_MAGICCLOSE
 			| WDIOF_SETTIMEOUT
@@ -146,7 +179,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const u32 *regs;
 	u32 percpu_offset;
-	int ret;
+	int irq, ret;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -222,6 +255,23 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.timeout = min(wdt->wdd.max_timeout, 30U);
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0) {
+		/* enable the pre-timeout notification */
+		qcom_wdt_info.options |= WDIOF_PRETIMEOUT;
+
+		ret = devm_request_irq(&pdev->dev, irq, qcom_wdt_irq,
+				       IRQF_TRIGGER_RISING, "wdog_bark",
+				       &wdt->wdd);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request irq\n");
+			return ret;
+		}
+	}
+
+	if (qcom_wdt_info.options & WDIOF_PRETIMEOUT)
+		wdt->wdd.pretimeout = wdt->wdd.timeout - 1;
+
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
 	if (ret)
 		return ret;
-- 
2.23.0

