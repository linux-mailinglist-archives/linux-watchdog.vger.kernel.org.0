Return-Path: <linux-watchdog+bounces-3905-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F083BB10312
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 10:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3890AA2318
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 08:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B2F274FE8;
	Thu, 24 Jul 2025 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tjFHGU7k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1003274FC6
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344823; cv=none; b=aXD4NAMRUR0j0Sg3Ei4TP04EaOZ+SkrPu+ObBO6XFTzaR6WSL5sw8cutA1w0/hsf9fvCS4jnhPmaolISFpiJXB7zrDImfiZZP1JbFYwZzf7VNdx66LQGkaWANEmbIoU+osZWhZ8R8xFVLfRgWhUPd32d9U1ltXjvfVckT5Jdatg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344823; c=relaxed/simple;
	bh=ZWAOaUKXYWIvDq+6G8cPvKKClMClTEQPjUFi2Q8Lf8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eCsjBFNDRdjyPrOIeLrP5boBndm8fvWneNPFj63jmk1ACu2Un+FaQS251YrJpyly3tDUMdE45Uxqu5lkhq6g7+VRI1yh60MBxYmOlkLJRyvnCb5FgPzV1AXr81Xhnzad4WV5rqBIHM7Cwb0YVwzQrPgQ+pgeRBX2WO236cXX8i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tjFHGU7k; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724081339epoutp0207eda51564a8ad2ce4c4249e842bc0a2~VIdLB_7KU0996109961epoutp02h
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 08:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724081339epoutp0207eda51564a8ad2ce4c4249e842bc0a2~VIdLB_7KU0996109961epoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=z8gPAdqSivNJX5FYTy2hqPX+3c1Wy7tfFAMQewiXsxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjFHGU7ktg1oQy6J87dXI/DLF7C0QS7LKEkZdw3oNqc/D1KA5k/I0/owk3MfJ/V+T
	 YA/lZ0LYNuBXL9qBQXEyO1RR4ilj0KToztmlh3SLXhs0NRtfXmfMytlsKojP3tgDDM
	 biZg5/SnHa7pf6DvI9+SlS9rxvh9//SorMKJudOs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p2a4d064debb2709b0a9221043a8c93464~VIdKgxGZ90806808068epcas2p2J;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bnkKY5MnJz6B9m6; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956~VIdJOVTH-0887108871epcas2p3J;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip1c4cf361d5b8edd7c5b43dc5ea8a301dd~VIdJIOtO12042020420epsmtip1T;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Thu, 24 Jul 2025 17:08:53 +0900
Message-Id: <20250724080854.3866566-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>

Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_timeout
3664647

[    0.302473] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099394100000, timeout=3664647, freq=300000
[    0.302479] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3664647, divisor=256, count=1099394100000 (fff8feac)
[    0.302510] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.302722] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags, then
it will operation with 32-bit counter. If not, with 16-bit counter like previous.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 31f7e1ec779e..184b1ad46ca6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,6 +34,7 @@
 #define S3C2410_WTCLRINT	0x0c
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -123,6 +124,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values to be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -130,6 +135,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_MAXCNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -198,6 +204,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	unsigned int		max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -349,7 +356,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -362,7 +369,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -411,7 +418,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+	return wdt->max_cnt / DIV_ROUND_UP(freq,
 		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
@@ -566,7 +573,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -576,7 +583,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -584,8 +591,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -593,7 +600,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -801,6 +808,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	wdt->max_cnt = S3C2410_WTCNT_MAXCNT;
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.25.1


