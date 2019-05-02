Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34EB911AEB
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 16:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfEBOJf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 10:09:35 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:51031 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbfEBOJd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 10:09:33 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42E6GFQ024265;
        Thu, 2 May 2019 16:08:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B2mjvFp5tZAreydQuG21Xnr2OG+nuKN2OB+0hiwhvgw=;
 b=rAdPy5UwUrmDtWn9MfR35H0Q0EXfhwc0y2DbMd1Mo4UdowuuKIMcvkzh6zJ9jpA32KuV
 zSzq1BZt50UZwELV1jP5j+g/uFZVLdEnSw1krUFjaj5dows2NwBWYvr+H0lLGY0PmIs5
 k9e5Vyvy3zSpxfBl7oWxxurUcOSS0FQ0/xTq3N0K7PHTqw2BdkKntKLW/AqfUYl713t+
 YKxOVF9WLzTekqT3/jLmU4nOFXH/3XrAjHhqfCodhR6o7UnUvayy8ExlcMoKql+TfC94
 KxmxLR1+tFtAqytAcWu0N1519LBJADusLXVoujlGk7iYqPMpNoD1tNS+DSFB4s+QVtA9 +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2s6xgrrq00-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 02 May 2019 16:08:53 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20A3441;
        Thu,  2 May 2019 14:08:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEBEC2730;
        Thu,  2 May 2019 14:08:51 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:51 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:51 +0200
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
Subject: [PATCH V2 3/3] watchdog: stm32: add dynamic prescaler support
Date:   Thu, 2 May 2019 16:08:46 +0200
Message-ID: <1556806126-15890-4-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-02_08:,,
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
 drivers/watchdog/stm32_iwdg.c | 76 ++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index f19a6d4..0c765d4 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -34,18 +34,12 @@
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
+#define PR_SHIFT	2
+#define PR_MIN		BIT(PR_SHIFT)
 
 /* IWDG_RLR register values */
-#define RLR_MIN		0x07C /* min value supported by reload register */
-#define RLR_MAX		0xFFF /* max value supported by reload register */
+#define RLR_MIN		0x2		/* min value recommended */
+#define RLR_MAX		GENMASK(11, 0)	/* max value of reload register */
 
 /* IWDG_SR register bit mask */
 #define FLAG_PVU	BIT(0) /* Watchdog prescaler value update */
@@ -55,15 +49,28 @@
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
@@ -79,26 +86,28 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
-	u32 val = FLAG_PVU | FLAG_RVU;
-	u32 reload;
+	u32 presc, iwdg_rlr, iwdg_pr, iwdg_sr;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
-	/* prescaler fixed to 256 */
-	reload = clamp_t(unsigned int, ((wdd->timeout * wdt->rate) / 256) - 1,
-			 RLR_MIN, RLR_MAX);
+	presc = DIV_ROUND_UP(wdd->timeout * wdt->rate, RLR_MAX + 1);
+
+	/* The prescaler is align on power of 2 and start at 2 ^ PR_SHIFT. */
+	presc = roundup_pow_of_two(presc);
+	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
+	iwdg_rlr = ((wdd->timeout * wdt->rate) / presc) - 1;
 
+	/* enable watchdog */
+	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 	/* enable write access */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
-
 	/* set prescaler & reload registers */
-	reg_write(wdt->regs, IWDG_PR, PR_256); /* prescaler fix to 256 */
-	reg_write(wdt->regs, IWDG_RLR, reload);
-	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
+	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
+	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
 
 	/* wait for the registers to be updated (max 100ms) */
-	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
-				       !(val & (FLAG_PVU | FLAG_RVU)),
+	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
+				       !(iwdg_sr & (FLAG_PVU | FLAG_RVU)),
 				       SLEEP_US, TIMEOUT_US)) {
 		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
 		return -EIO;
@@ -155,7 +164,7 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	}
 
 	/* optional peripheral clock */
-	if (wdt->has_pclk) {
+	if (wdt->data->has_pclk) {
 		wdt->clk_pclk = devm_clk_get(&pdev->dev, "pclk");
 		if (IS_ERR(wdt->clk_pclk)) {
 			dev_err(&pdev->dev, "Unable to get pclk clock\n");
@@ -196,8 +205,8 @@ static const struct watchdog_ops stm32_iwdg_ops = {
 };
 
 static const struct of_device_id stm32_iwdg_of_match[] = {
-	{ .compatible = "st,stm32-iwdg", .data = (void *)!HAS_PCLK },
-	{ .compatible = "st,stm32mp1-iwdg", .data = (void *)HAS_PCLK },
+	{ .compatible = "st,stm32-iwdg", .data = &stm32_iwdg_data },
+	{ .compatible = "st,stm32mp1-iwdg", .data = &stm32mp1_iwdg_data },
 	{ /* end node */ }
 };
 MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
@@ -205,20 +214,17 @@ MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
 static int stm32_iwdg_probe(struct platform_device *pdev)
 {
 	struct watchdog_device *wdd;
-	const struct of_device_id *match;
 	struct stm32_iwdg *wdt;
 	struct resource *res;
 	int ret;
 
-	match = of_match_device(stm32_iwdg_of_match, &pdev->dev);
-	if (!match)
-		return -ENODEV;
-
 	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
-	wdt->has_pclk = match->data;
+	wdt->data = of_device_get_match_data(&pdev->dev);
+	if (!wdt->data)
+		return -ENODEV;
 
 	/* This is the timer base. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -236,8 +242,10 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd = &wdt->wdd;
 	wdd->info = &stm32_iwdg_info;
 	wdd->ops = &stm32_iwdg_ops;
-	wdd->min_timeout = ((RLR_MIN + 1) * 256) / wdt->rate;
-	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * 256 * 1000) / wdt->rate;
+	wdd->min_timeout = max_t(unsigned int, 1,
+				 (((RLR_MIN + 1) * PR_MIN) / wdt->rate));
+	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
+				    1000) / wdt->rate;
 	wdd->parent = &pdev->dev;
 
 	watchdog_set_drvdata(wdd, wdt);
-- 
2.7.4

