Return-Path: <linux-watchdog+bounces-3470-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD43AB680B
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 11:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44A391B67650
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 May 2025 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7560A25E452;
	Wed, 14 May 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cPgcvyY/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6394625DAFB
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216425; cv=none; b=F3nUATdGA48d8PFlaOXye5XZhh09ftPMy6yZXgp4ixokjdw3bT6CAceUis+5ZBAy+1gknl2J0yghfmiDdHZf9YL2ejDZ7woiC5fFYk25H5cRs9BKroYB3r5bVtnIYR5dZoa82KmUkxcexGCKUEjkmFO1mCdt+qflScGmB9XEQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216425; c=relaxed/simple;
	bh=vR0UQoO2XxwJQek/TZEpTck1zQ7UkY4WavIhIGGCiHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZnD32z9cOlyx5glN4gYkqE7ihurltWAyzJJoe6G3e8MGtz+B/vNNGoqsXxUVFMOTE+4SGGzA2jwkriWxPhKbPUgLtRIeRV7YZIHKkgk7nhHwnOjI2SvEJFMciBk7AtST+fSath2zdz+sEx0O/Sau7b3cWW56rSPFrKfieVLPerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cPgcvyY/; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250514095341epoutp0436e6cf0988f575a1ec95b0f1d0162be2~-XBQONOKJ0311503115epoutp04b
	for <linux-watchdog@vger.kernel.org>; Wed, 14 May 2025 09:53:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250514095341epoutp0436e6cf0988f575a1ec95b0f1d0162be2~-XBQONOKJ0311503115epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747216421;
	bh=M3b1Psw+JucOaMEaVCgfFq85fzdpxooWfq61IOT0Tpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPgcvyY/UF3i4/R78cS6a6Nc4BjrYoyUzGDMr+hJ2BKmIPQ+JkAlmlYWYw0f8FbEh
	 McoPcvXjd4wFGl9RLgakNjj4XXtnBPEDK+TV3UOHt1RBwvR9UsvfuVi4nRybsM/Jyt
	 S1uHlyZ9K5HNWQ712ilJ2bbtDaA4ZwSuLQfPG7MI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514095341epcas2p4a56583edd09d7c993c68efd8667ab8d3~-XBPxewzu0188301883epcas2p4R;
	Wed, 14 May 2025 09:53:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zy7vm5x42z3hhTG; Wed, 14 May
	2025 09:53:40 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e~-XBO7Nqho0657806578epcas2p2d;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095340epsmtrp19c55ac68ac736c446cac4b9212cf74d2~-XBO6ce_J1996219962epsmtrp1Q;
	Wed, 14 May 2025 09:53:40 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-47-68246824665f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.AB.08766.42864286; Wed, 14 May 2025 18:53:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250514095339epsmtip17dca7478570878620e0152c719068ba8~-XBOreiFl3233232332epsmtip1X;
	Wed, 14 May 2025 09:53:39 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH v2 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Wed, 14 May 2025 18:42:18 +0900
Message-Id: <20250514094220.1561378-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250514094220.1561378-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsWy7bCSnK5KhkqGwcnVbBYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZXxqv8xYcF+l4vjkRsYGxity
	XYycHBICJhKPdy9g62Lk4hAS2M0o8f3eWfYuRg6ghJTEu2eWEDXCEvdbjrBC1HxglPi4aj4r
	SIJNQEdi+r/bLCC2iECcxLH2zcwgRcwCjxglrszrYQJJCAuESnx+c54dxGYRUJX4MXMtWJxX
	wFZi/pxudogN8hIzL30HszkF7CTmtrSygRwhBFTTtN0DolxQ4uTMJ2C7mIHKm7fOZp7AKDAL
	SWoWktQCRqZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBoa+luYNx+6oPeocYmTgY
	DzFKcDArifBez1LOEOJNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbL
	xMEp1cC0U2rHsWSjNU1LH6kG336/Y2mI9DV2FwXFBucFO1x/aP1+ue343HVhEy0EhEo+JliE
	brT4tLNrgZKccU7Rnor6aPMiMV2p2PbLM1V+GUq4qLy8Fa3PN9fwW9bSqYsc9h88tu4xk3La
	59rgOwefXTttH8RxZH9M+s5pAev+/lFLZWq259xwarmsX2TAtXlNcrkvEjTCWibXhx9dZPLf
	J0Zz2te+S/nrDtg22r17scO/a8PcNUUnu5u9e5TPZ+3/0eLUynu5TDBo5YSXv5xZRN76fS/8
	78nxpORLwrZH12bp3Mt74/rhe4uUj7rJo6l9cZ6+rsFHNT6bb4jlsXV4vbckt/vGEdbtnFds
	y/qeCxopsRRnJBpqMRcVJwIADso1IewCAAA=
X-CMS-MailID: 20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e
References: <20250514094220.1561378-1-sw617.shin@samsung.com>
	<CGME20250514095340epcas2p2c58454d8e0e27f46d5a71475f22e614e@epcas2p2.samsung.com>

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

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index c6166d927155..1c7299deec5d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,6 +34,7 @@
 #define S3C2410_WTCLRINT	0x0c
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -119,6 +120,10 @@
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
@@ -126,6 +131,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_MAXCNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -194,6 +200,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	unsigned int		max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -379,7 +386,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+	return wdt->max_cnt / DIV_ROUND_UP(freq,
 		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
@@ -534,7 +541,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -544,7 +551,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -552,8 +559,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -561,7 +568,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -764,6 +771,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	wdt->max_cnt = S3C2410_WTCNT_MAXCNT;
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.40.1


