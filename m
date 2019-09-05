Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602BDAAD7E
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 23:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388538AbfIEVAt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 17:00:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45826 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388096AbfIEVAt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 17:00:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id l16so4271402wrv.12
        for <linux-watchdog@vger.kernel.org>; Thu, 05 Sep 2019 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nnDoHPMMqk2BqcrsZAHoETbkS1IHUKarK3YqBqfkWc=;
        b=mp29bxwuxcKXa6CxuC8MdfDEU8Gl4WV38Qt61LUV3pUO/YxqUzHCCTtc008aej+JV6
         sj7iYZPRDelw8H+IZyeHB+VauqP9Kocl+OkOev/6253abQrjeBNVEha4KY2wXEijrX3/
         S8XBP2UOiY5oDVvjxSbIWcarF/y09xQYt2lAYoHe+mRBfivPVg/8xp/Ehtp6dAE+UXX9
         N3MU6Z2XWLzKw5zV+wpLqV+kcg0dY0dOwax3tUQPzdVX9CTdOAEw+W9Y/gXA8KalIN9k
         3+ygLZt3+3BDnKg7kehRWL7u6060dTQ+Czfi9RupEVQ0lcfC0x7ulGSBmFO8A3Ezz7Yp
         FHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nnDoHPMMqk2BqcrsZAHoETbkS1IHUKarK3YqBqfkWc=;
        b=hrzrEiwD276gJ3dmxYCk20UiMC4Au5bJdeopyXhGkj8R81HkMuVLyL7lX0NrrbUOxI
         jc5s478Fd75mtj0ceu3p4h3/EtS5JpwSBWVpBF2p6njllbtVW0Y9YGzwW8ZIMK7XJed9
         GfGLUDqyZWSIv7ZbUFulGlTkRIyJC8AWxj97uABj0rPrsQXpm8pA97KvnhaSO2EA5zO5
         miHXXtgMm/XZMG9gt8j18gXt6KMCNZtujrw8hepHFPmRDzwzyR3ujH82a7vVaHE7aitJ
         Vh89BX+8OaqhKn5W+ELQ7m8iLVvxEiLT+wJK/dP2EeUlc2n03WJv7u946j4pg5XPdFZN
         zxWA==
X-Gm-Message-State: APjAAAXTEl7Cb8NlOjmw9oDfhKgr/69wfIC9DdeNGTZazJ0edxN8sxlv
        ihYTQYq5EN84LAStr4oy+SSy3Q==
X-Google-Smtp-Source: APXvYqzibqT3lsfWxmAKV6EIArkBJaPRFSTn+tf8kWxM+dDG27zmfSNTMEboTtU9NcD1GoKe/xSbYw==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr258331wru.3.1567717246455;
        Thu, 05 Sep 2019 14:00:46 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id q25sm2484253wmj.22.2019.09.05.14.00.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 05 Sep 2019 14:00:45 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, agross@kernel.org,
        linux@roeck-us.net, wim@linux-watchdog.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4] watchdog: qcom: support pre-timeout when the bark irq is available
Date:   Thu,  5 Sep 2019 23:00:35 +0200
Message-Id: <20190905210035.9985-1-jorge.ramirez-ortiz@linaro.org>
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
 v4:
     address Guenter Roeck comments as follows:
       remove unnecessary include and private variable
       provide macro for WDT EN register values
       use pretimeout as per its API intent
       handle EPROBE_DEFER on get_irq
     also:
       handle the irq registration as done in pm8916_wdt.c
 v3:
    remove unnecesary variable added to private.

 v2:
    register the pre-timeout notifier instead.

 v1:
 drivers/watchdog/qcom-wdt.c | 64 ++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 7be7f87be28f..0f1d29eeb81d 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 #include <linux/of_device.h>
+#include <linux/interrupt.h>
 
 enum wdt_reg {
 	WDT_RST,
@@ -19,6 +20,9 @@ enum wdt_reg {
 	WDT_BITE_TIME,
 };
 
+#define QCOM_WDT_ENABLE		BIT(0)
+#define QCOM_WDT_ENABLE_IRQ	BIT(1)
+
 static const u32 reg_offset_data_apcs_tmr[] = {
 	[WDT_RST] = 0x38,
 	[WDT_EN] = 0x40,
@@ -54,15 +58,38 @@ struct qcom_wdt *to_qcom_wdt(struct watchdog_device *wdd)
 	return container_of(wdd, struct qcom_wdt, wdd);
 }
 
+static inline int qcom_get_enable(struct watchdog_device *wdd)
+{
+	int enable = QCOM_WDT_ENABLE;
+
+	if (wdd->info->options & WDIOF_PRETIMEOUT)
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
+	unsigned int bark = wdd->timeout;
+
+	if (wdd->pretimeout)
+		bark = bark - wdd->pretimeout;
 
 	writel(0, wdt_addr(wdt, WDT_EN));
 	writel(1, wdt_addr(wdt, WDT_RST));
-	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
+	writel(bark * wdt->rate, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(wdd->timeout * wdt->rate, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
 	return 0;
 }
 
@@ -89,6 +116,13 @@ static int qcom_wdt_set_timeout(struct watchdog_device *wdd,
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
@@ -105,7 +139,7 @@ static int qcom_wdt_restart(struct watchdog_device *wdd, unsigned long action,
 	writel(1, wdt_addr(wdt, WDT_RST));
 	writel(timeout, wdt_addr(wdt, WDT_BARK_TIME));
 	writel(timeout, wdt_addr(wdt, WDT_BITE_TIME));
-	writel(1, wdt_addr(wdt, WDT_EN));
+	writel(qcom_get_enable(wdd), wdt_addr(wdt, WDT_EN));
 
 	/*
 	 * Actually make sure the above sequence hits hardware before sleeping.
@@ -121,6 +155,7 @@ static const struct watchdog_ops qcom_wdt_ops = {
 	.stop		= qcom_wdt_stop,
 	.ping		= qcom_wdt_ping,
 	.set_timeout	= qcom_wdt_set_timeout,
+	.set_pretimeout	= qcom_wdt_set_pretimeout,
 	.restart        = qcom_wdt_restart,
 	.owner		= THIS_MODULE,
 };
@@ -133,6 +168,15 @@ static const struct watchdog_info qcom_wdt_info = {
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
@@ -146,7 +190,7 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const u32 *regs;
 	u32 percpu_offset;
-	int ret;
+	int irq, ret;
 
 	regs = of_device_get_match_data(dev);
 	if (!regs) {
@@ -204,7 +248,17 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	wdt->wdd.info = &qcom_wdt_info;
+	irq = platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		if (devm_request_irq(dev, irq, qcom_wdt_isr,
+				     IRQF_TRIGGER_RISING, "wdt_bark",
+				     &wdt->wdd))
+			irq = 0;
+	} else if (irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	wdt->wdd.info = irq > 0 ? &qcom_wdt_pt_info : &qcom_wdt_info;
+	wdt->wdd.pretimeout = irq > 0 ? 1 : 0;
 	wdt->wdd.ops = &qcom_wdt_ops;
 	wdt->wdd.min_timeout = 1;
 	wdt->wdd.max_timeout = 0x10000000U / wdt->rate;
-- 
2.23.0

