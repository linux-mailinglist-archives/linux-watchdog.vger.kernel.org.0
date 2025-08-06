Return-Path: <linux-watchdog+bounces-3977-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D0B1C0D2
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 09:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2E51636FD
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 07:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D49121ADB5;
	Wed,  6 Aug 2025 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ymhovyn+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D305216E1B
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463637; cv=none; b=DYs8BIi+OmCgBbi6iRCgbHONryZFuahbJLQBfocInhdQNIIElzjNgnIUheeODxUUMoObiuZRIj/O9RUlpq6rZF/TFF0BKG+/K0d7jOQBoVVWYaNB7dt4TT92PVtbbMFlV+ksSQF0BEJsRx8URZGy0IDh6QG2AjtSKtrp8OQbwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463637; c=relaxed/simple;
	bh=Zak+lA2NlgBcbLZqurtxDfxO5mK6x15806J/6syzwmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=YjC1TNhcHBZlKdgMlI0tCDqBXRpGM3QBTW73UBVCaR0g3JKGKSU7UFShHdAkoVDvOGAZkUX1FKXa25wr9sZHqMyaVhdIrFl1x8bQQloluGS/7fSjA5TRKjl2tRQ0j4V+3D7ZtUyiKSyPdgcaz+OOxUTgO7zXH+y0LNST0eQzw44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ymhovyn+; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250806070032epoutp03428e8dc9a9438164acbc230a0e7dd20d~ZG2DUB40w1979019790epoutp03-
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 07:00:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250806070032epoutp03428e8dc9a9438164acbc230a0e7dd20d~ZG2DUB40w1979019790epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754463632;
	bh=mKTpam8fIwZZjEsxg/48/XZxFSwkIOSsx3tm0VaWfDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ymhovyn+RZVzv3TXs6K4ExBpBnMzeiFvYFFfPFhj0XSmNEE0ALAWPUgeRLi1QftY3
	 3SIbv8FztYIib/4DAstDnPgobj9mNKCr2phBWLZAfX/Jk5kmEKQd+DqmjSti2HZ2j9
	 JRxnKIX2rslnqVBMZO9mRHU6TdLcj9RRGQJUXR7A=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250806070031epcas2p26e495b7671e91a544eed1202f31aaa5f~ZG2CtBliL0387403874epcas2p2j;
	Wed,  6 Aug 2025 07:00:31 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bxh5C242hz6B9m5; Wed,  6 Aug
	2025 07:00:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19~ZG2BBgIB00238902389epcas2p2f;
	Wed,  6 Aug 2025 07:00:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250806070029epsmtip2009cde937e0098d78076564724ab8bec~ZG2A4JwRr2292322923epsmtip25;
	Wed,  6 Aug 2025 07:00:29 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v5 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Wed,  6 Aug 2025 15:55:12 +0900
Message-Id: <20250806065514.3688485-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806065514.3688485-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19
References: <20250806065514.3688485-1-sw617.shin@samsung.com>
	<CGME20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19@epcas2p2.samsung.com>

Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/class/watchdog/watchdog0/max_timeout
3665038

[    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
[    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
[    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: count=0xfffffc87, wtcon=0001ff39
[    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk flags,
and it will operate with a 32-bit counter. If not, it will operate with a 16-bit
counter like in the previous version.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 0a4c0ab2a3d6..673ab6768688 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,7 +34,8 @@
 #define S3C2410_WTCNT		0x08
 #define S3C2410_WTCLRINT	0x0c
 
-#define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_16	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -124,6 +125,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values will be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -131,6 +136,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_CNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -199,6 +205,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	u32 max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 	//(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV = 0x8000
-	u64 t_max = div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
+	u64 t_max = div64_ul((u64)wdt->max_cnt * 0x8000, freq);
 
 	if (t_max > UINT_MAX)
 		t_max = UINT_MAX;
@@ -571,7 +578,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -581,7 +588,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -589,8 +596,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -598,7 +605,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -806,6 +813,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+	else
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_16;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.25.1


