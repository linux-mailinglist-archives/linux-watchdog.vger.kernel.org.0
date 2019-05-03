Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0412F7D
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 May 2019 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbfECNtF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 May 2019 09:49:05 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14822 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbfECNtF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 May 2019 09:49:05 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x43DaSE4009467;
        Fri, 3 May 2019 15:48:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RqUYsKyNXRA85AH1hilpcenk+kZtsbRK4CMzRm1fwpM=;
 b=rMg/WcxtS8lWYCj53X4cPoUsHijOyIrL4tCziVlpEL/0SiOMMA7xHBu7pzQB+h9CGaFY
 rCr2zlyOwCaFdt0VNlwVNrYivEuqWJ+wlkPmMkcybRWD+5JKU/8dG2CUDBWi202tUiPA
 fxpkar4pivwAbUIJ+3s9fPr3Bl74C3ooPIhYTsYXA3Ccqabckn3eIrcVkLb6peXlv6jH
 csjo6CpscZzFUahc9Nwd+FCRLoN4/iW1l5NFyjYpWRBJbgubjtyVKrVV9PmVxtUoGVl6
 PI/cg3JGusXbvdSwt4qboFEZgqIbWD90h7yPXvncLNQMV7gzZmco9X4PDjU7vVY3kFG4 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xhbpj6e-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 03 May 2019 15:48:32 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4067434;
        Fri,  3 May 2019 13:48:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E29227A4;
        Fri,  3 May 2019 13:48:31 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Fri, 3 May 2019
 15:48:31 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 3 May 2019
 15:48:30 +0200
From:   Ludovic Barre <ludovic.Barre@st.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Ludovic Barre <ludovic.barre@st.com>
Subject: [PATCH V3] watchdog: stm32: add dynamic prescaler support
Date:   Fri, 3 May 2019 15:48:26 +0200
Message-ID: <1556891306-4218-1-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-03_07:,,
 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch allows to define the max prescaler by compatible.
To set a large range of timeout, the prescaler should be set
dynamically (from the timeout request) to improve the resolution
in order to have a timeout close to the expected value.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 84 ++++++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 6f7c2bc..d569a36 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -34,36 +34,44 @@
 #define KR_KEY_EWA	0x5555 /* write access enable */
 #define KR_KEY_DWA	0x0000 /* write access disable */
 
-/* IWDG_PR register bit values */
-#define PR_4		0x00 /* prescaler set to 4 */
-#define PR_8		0x01 /* prescaler set to 8 */
-#define PR_16		0x02 /* prescaler set to 16 */
-#define PR_32		0x03 /* prescaler set to 32 */
-#define PR_64		0x04 /* prescaler set to 64 */
-#define PR_128		0x05 /* prescaler set to 128 */
-#define PR_256		0x06 /* prescaler set to 256 */
+/* IWDG_PR register */
+#define PR_SHIFT	2
+#define PR_MIN		BIT(PR_SHIFT)
 
 /* IWDG_RLR register values */
-#define RLR_MIN		0x07C /* min value supported by reload register */
-#define RLR_MAX		0xFFF /* max value supported by reload register */
+#define RLR_MIN		0x2		/* min value recommended */
+#define RLR_MAX		GENMASK(11, 0)	/* max value of reload register */
 
 /* IWDG_SR register bit mask */
-#define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
-#define FLAG_RVU	BIT(1) /* Watchdog counter reload value update */
+#define SR_PVU	BIT(0) /* Watchdog prescaler value update */
+#define SR_RVU	BIT(1) /* Watchdog counter reload value update */
 
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
 
-#define HAS_PCLK	true
+struct stm32_iwdg_data {
+	bool has_pclk;
+	u32 max_prescaler;
+};
+
+static const struct stm32_iwdg_data stm32_iwdg_data = {
+	.has_pclk = false,
+	.max_prescaler = 256,
+};
+
+static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
+	.has_pclk = true,
+	.max_prescaler = 1024,
+};
 
 struct stm32_iwdg {
 	struct watchdog_device	wdd;
+	const struct stm32_iwdg_data *data;
 	void __iomem		*regs;
 	struct clk		*clk_lsi;
 	struct clk		*clk_pclk;
 	unsigned int		rate;
-	bool			has_pclk;
 };
 
 static inline u32 reg_read(void __iomem *base, u32 reg)
@@ -79,31 +87,35 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
-	u32 val = FLAG_PVU | FLAG_RVU;
-	u32 reload;
+	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
 	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
-	/* prescaler fixed to 256 */
-	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
-			 RLR_MIN, RLR_MAX);
+	tout = clamp_t(unsigned int, wdd->timeout,
+		       wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
+
+	presc = DIV_ROUND_UP(tout * wdt->rate, RLR_MAX + 1);
+
+	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
+	presc = roundup_pow_of_two(presc);
+	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
+	iwdg_rlr = ((tout * wdt->rate) / presc) - 1;
 
 	/* enable write access */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
 
 	/* set prescaler & reload registers */
-	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
-	reg_write(wdt->regs, IWDG_RLR, reload);
+	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
+	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
-	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
-					 !(val & (FLAG_PVU | FLAG_RVU)),
+	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
+					 !(iwdg_sr & (SR_PVU | SR_RVU)),
 					 SLEEP_US, TIMEOUT_US);
 	if (ret) {
-		dev_err(wdd->parent,
-			"Fail to set prescaler or reload registers\n");
+		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
 		return ret;
 	}
 
@@ -156,7 +168,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	}
 
 	/* optional peripheral clock */
-	if (wdt->has_pclk) {
+	if (wdt->data->has_pclk) {
 		wdt->clk_pclk = devm_clk_get(dev, "pclk");
 		if (IS_ERR(wdt->clk_pclk)) {
 			dev_err(dev, "Unable to get pclk clock\n");
@@ -205,8 +217,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
 };
 
 static const struct of_device_id stm32_iwdg_of_match[] = {
-	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
-	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
+	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
+	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
 	{ /* end node */ }
 };
 MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
@@ -215,19 +227,16 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct watchdog_device *wdd;
-	const struct of_device_id *match;
 	struct stm32_iwdg *wdt;
 	int ret;
 
-	match = of_match_device(stm32_iwdg_of_match, dev);
-	if (!match)
-		return -ENODEV;
-
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
-	wdt->has_pclk = match->data;
+	wdt->data = of_device_get_match_data(&pdev->dev);
+	if (!wdt->data)
+		return -ENODEV;
 
 	/* This is the timer base. */
 	wdt->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -242,11 +251,12 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 
 	/* Initialize struct watchdog_device. */
 	wdd = &wdt->wdd;
+	wdd->parent = dev;
 	wdd->info = &stm32_iwdg_info;
 	wdd->ops = &stm32_iwdg_ops;
-	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
-	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
-	wdd->parent = dev;
+	wdd->min_timeout = DIV_ROUND_UP((RLR_MIN + 1) * PR_MIN, wdt->rate);
+	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
+				    1000) / wdt->rate;
 
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
-- 
2.7.4

