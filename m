Return-Path: <linux-watchdog+bounces-963-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C788A5226
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Apr 2024 15:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7601C223DF
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Apr 2024 13:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B971B5B;
	Mon, 15 Apr 2024 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="lD7Kgz12"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856171B3A
	for <linux-watchdog@vger.kernel.org>; Mon, 15 Apr 2024 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188962; cv=none; b=emnN4Aw8sh+cVmoJa+RXdNJAh6vj3HzB8Gyw70qron+YjkTc89y5o624hmaCzj4U6eYsIgzhhR3Bv5Eg7Zp/K6MmZvBSicvE55U5B3cb/AOXkpT1CHZC9yZR07B7PHvmcbuHa2mSiewjX8K2eO/iAVuh05cDudfN+WrmS5/89ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188962; c=relaxed/simple;
	bh=soG1I0a0y2SeBr5U8E0GtNctOMgDS/QldiOEXLEIOoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ff//dky+I9nkJiqNB9x8GN9733XZStSXsOBgAItDdsTg7/Qa8psqlls++wqAUYDGJR3gpLSzXjquolF0XvHqJIz6kpr7svfp8+23FZOldiSOeJ0L9FOWwNUXwLyIoCg4IAxgyqDwSiprXQy1k9WSAg1midKhJXPPmi25p74AkkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=lD7Kgz12; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 46F3088198;
	Mon, 15 Apr 2024 15:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1713188958;
	bh=FxC43OA359JCVRMPPyYZUmKJYgD2hV9dSK18cXw218E=;
	h=From:To:Cc:Subject:Date:From;
	b=lD7Kgz12N2J0XHlRoY18byD7uiVZJsNlUjy+Rt6LE8lUv2Z6iBxxIPfGSCx1RORjO
	 Gkb4nyXpld3fs9FVMwMeXdAdbq7PcciGfsUktZuZ9HsyvaMCtpOkFAiXyD0NjTbn+I
	 1CHjmseOVylzB1Aik2pDuJdDp4Bi/WT2zmiPBC2m7fK7a0V2jtjDVLnaj6PODc6/R4
	 NDurFEFYmvuRpkovgAyysainjoFJutAgj19TwWbWR2FXTSlWAsUKILMkOJ8xKa75kX
	 aNNFuWuMz/WOLg3K2VsmmEYGLB0TR1Y2OD+jC/2aAfvXw6ZKq3dEkGNpkW2cAtDNgE
	 m146Q+sZNhinw==
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4] watchdog: stm32_iwdg: Add pretimeout support
Date: Mon, 15 Apr 2024 15:48:47 +0200
Message-ID: <20240415134903.8084-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The STM32MP15xx IWDG adds registers which permit this IP to generate
pretimeout interrupt. This interrupt can also be used to wake the CPU
from suspend. Implement support for generating this interrupt and let
userspace configure the pretimeout. In case the pretimeout is not
configured by user, set pretimeout to 3/4 of the WDT timeout cycle.

Reviewed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Tested-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-watchdog@vger.kernel.org
---
V2: - Subtract the pretimeout value from timeout value before writing it
      into the IWDG pretimeout register, because the watchdog counter
      register is counting down, and the pretimeout interrupt triggers
      when watchdog counter register matches the pretimeout register
      content.
    - Set default pretimeout to 3/4 of timeout .
V3: - Use dev instead of pdev->dev
    - Swap order of ret/return 0
    - Split this from the DT changes, which are orthogonal
    - Uh, this patch got stuck in upstreaming queue, sorry
V4: - Update commit message to match V2 default pretimeout to 3/4
    - Add RB/TB from Clément
---
 drivers/watchdog/stm32_iwdg.c | 95 ++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 5404e03876202..d700e0d49bb95 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include <linux/watchdog.h>
 
 #define DEFAULT_TIMEOUT 10
@@ -28,6 +29,7 @@
 #define IWDG_RLR	0x08 /* ReLoad Register */
 #define IWDG_SR		0x0C /* Status Register */
 #define IWDG_WINR	0x10 /* Windows Register */
+#define IWDG_EWCR	0x14 /* Early Wake-up Register */
 
 /* IWDG_KR register bit mask */
 #define KR_KEY_RELOAD	0xAAAA /* reload counter enable */
@@ -47,22 +49,29 @@
 #define SR_PVU	BIT(0) /* Watchdog prescaler value update */
 #define SR_RVU	BIT(1) /* Watchdog counter reload value update */
 
+#define EWCR_EWIT	GENMASK(11, 0) /* Watchdog counter window value */
+#define EWCR_EWIC	BIT(14) /* Watchdog early interrupt acknowledge */
+#define EWCR_EWIE	BIT(15) /* Watchdog early interrupt enable */
+
 /* set timeout to 100000 us */
 #define TIMEOUT_US	100000
 #define SLEEP_US	1000
 
 struct stm32_iwdg_data {
 	bool has_pclk;
+	bool has_early_wakeup;
 	u32 max_prescaler;
 };
 
 static const struct stm32_iwdg_data stm32_iwdg_data = {
 	.has_pclk = false,
+	.has_early_wakeup = false,
 	.max_prescaler = 256,
 };
 
 static const struct stm32_iwdg_data stm32mp1_iwdg_data = {
 	.has_pclk = true,
+	.has_early_wakeup = true,
 	.max_prescaler = 1024,
 };
 
@@ -88,13 +97,18 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
 static int stm32_iwdg_start(struct watchdog_device *wdd)
 {
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
-	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
+	u32 tout, ptot, presc, iwdg_rlr, iwdg_ewcr, iwdg_pr, iwdg_sr;
 	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
+	if (!wdd->pretimeout)
+		wdd->pretimeout = 3 * wdd->timeout / 4;
+
 	tout = clamp_t(unsigned int, wdd->timeout,
 		       wdd->min_timeout, wdd->max_hw_heartbeat_ms / 1000);
+	ptot = clamp_t(unsigned int, tout - wdd->pretimeout,
+		       wdd->min_timeout, tout);
 
 	presc = DIV_ROUND_UP(tout * wdt->rate, RLR_MAX + 1);
 
@@ -102,6 +116,7 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	presc = roundup_pow_of_two(presc);
 	iwdg_pr = presc <= 1 << PR_SHIFT ? 0 : ilog2(presc) - PR_SHIFT;
 	iwdg_rlr = ((tout * wdt->rate) / presc) - 1;
+	iwdg_ewcr = ((ptot * wdt->rate) / presc) - 1;
 
 	/* enable write access */
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_EWA);
@@ -109,6 +124,8 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	/* set prescaler & reload registers */
 	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
 	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
+	if (wdt->data->has_early_wakeup)
+		reg_write(wdt->regs, IWDG_EWCR, iwdg_ewcr | EWCR_EWIE);
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
@@ -151,6 +168,34 @@ static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static int stm32_iwdg_set_pretimeout(struct watchdog_device *wdd,
+				     unsigned int pretimeout)
+{
+	dev_dbg(wdd->parent, "%s pretimeout: %d sec\n", __func__, pretimeout);
+
+	wdd->pretimeout = pretimeout;
+
+	if (watchdog_active(wdd))
+		return stm32_iwdg_start(wdd);
+
+	return 0;
+}
+
+static irqreturn_t stm32_iwdg_isr(int irq, void *wdog_arg)
+{
+	struct watchdog_device *wdd = wdog_arg;
+	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
+	u32 reg;
+
+	reg = reg_read(wdt->regs, IWDG_EWCR);
+	reg |= EWCR_EWIC;
+	reg_write(wdt->regs, IWDG_EWCR, reg);
+
+	watchdog_notify_pretimeout(wdd);
+
+	return IRQ_HANDLED;
+}
+
 static void stm32_clk_disable_unprepare(void *data)
 {
 	clk_disable_unprepare(data);
@@ -207,11 +252,20 @@ static const struct watchdog_info stm32_iwdg_info = {
 	.identity	= "STM32 Independent Watchdog",
 };
 
+static const struct watchdog_info stm32_iwdg_preinfo = {
+	.options	= WDIOF_SETTIMEOUT |
+			  WDIOF_MAGICCLOSE |
+			  WDIOF_KEEPALIVEPING |
+			  WDIOF_PRETIMEOUT,
+	.identity	= "STM32 Independent Watchdog",
+};
+
 static const struct watchdog_ops stm32_iwdg_ops = {
 	.owner		= THIS_MODULE,
 	.start		= stm32_iwdg_start,
 	.ping		= stm32_iwdg_ping,
 	.set_timeout	= stm32_iwdg_set_timeout,
+	.set_pretimeout	= stm32_iwdg_set_pretimeout,
 };
 
 static const struct of_device_id stm32_iwdg_of_match[] = {
@@ -221,6 +275,40 @@ static const struct of_device_id stm32_iwdg_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, stm32_iwdg_of_match);
 
+static int stm32_iwdg_irq_init(struct platform_device *pdev,
+			       struct stm32_iwdg *wdt)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct watchdog_device *wdd = &wdt->wdd;
+	struct device *dev = &pdev->dev;
+	int irq, ret;
+
+	if (!wdt->data->has_early_wakeup)
+		return 0;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq <= 0)
+		return 0;
+
+	if (of_property_read_bool(np, "wakeup-source")) {
+		ret = device_init_wakeup(dev, true);
+		if (ret)
+			return ret;
+
+		ret = dev_pm_set_wake_irq(dev, irq);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_request_irq(dev, irq, stm32_iwdg_isr, 0,
+			       dev_name(dev), wdd);
+	if (ret)
+		return ret;
+
+	wdd->info = &stm32_iwdg_preinfo;
+	return 0;
+}
+
 static int stm32_iwdg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -255,6 +343,11 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
 
+	/* Initialize IRQ, this might override wdd->info, hence it is here. */
+	ret = stm32_iwdg_irq_init(pdev, wdt);
+	if (ret)
+		return ret;
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
 	watchdog_init_timeout(wdd, 0, dev);
-- 
2.43.0


