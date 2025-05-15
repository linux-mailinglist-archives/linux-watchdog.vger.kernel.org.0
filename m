Return-Path: <linux-watchdog+bounces-3482-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA71AB7F9D
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 10:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115B11B6843E
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 08:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73F4283FD5;
	Thu, 15 May 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="d6TDFNKk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940A283FD6
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296193; cv=none; b=Fxswn6kVteLLSmsl9seFSQxGys6cFT27ScWXH89mmANT+nGdhHlx/ipFRpaX6zLesgUuVf+Pyg1VpsJF+fpsXxQlM8/D+wa6w95KUBvMvgpsC9KBxTZZAzZItYdcEfcwpsdTSgDYteY56CIQ0RxzSaqwsJdhqC3WwoRhxopeQwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296193; c=relaxed/simple;
	bh=k/EN1xunh0Y89PyU6CdcCeFSTvK/TGqlV9c+DhCqBeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=hWkmGoz9aAW7EZHjK/P3eHpeVwRVF7Idpz66OxP0gSRIrjGn4PCCAsKq39nAG0pK7agEZDwaaA9V6+AVSzohpGK/jRX4QBDu78Mw+ZJ7KkLpfJsETnVnqmou7dURgPytDJD25cypY5FUz6ZTpKLbGIWlRGAuGNlezIpJ6s9jPeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=d6TDFNKk; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515080309epoutp0176a1c558146e47f8f0435bc7f0ca8acd~-pKB-WmSy0978009780epoutp01V
	for <linux-watchdog@vger.kernel.org>; Thu, 15 May 2025 08:03:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515080309epoutp0176a1c558146e47f8f0435bc7f0ca8acd~-pKB-WmSy0978009780epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296189;
	bh=glGyEXi0QZpDgdf+QBJO5sMYl1AOPW1Yz+35AUaf0fQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6TDFNKkUgpr2sAhv5OUZU7v6kcn61D0DMOal1wEyQlS5Kjn3JpSA0qVW8cPMEWwk
	 XdFkLtebmE6ROuLalqadvpq+5+9yJs3N97BduRVDt0szFm71KAkZHGL2VUgyfS2575
	 VoFx7MXD5/PLvv1WcaC4a3Ee/N/4BTiY0erQ8KgI=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080309epcas2p330e7b7168e831d899750bc2174a7c844~-pKBjVzxT0239902399epcas2p3s;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZyjPm68NVz3hhTN; Thu, 15 May
	2025 08:03:08 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080308epcas2p23dcfda26ccbb9376d400af0017b55247~-pKAuG6Hd1485714857epcas2p2T;
	Thu, 15 May 2025 08:03:08 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250515080308epsmtrp1083deebc5acfa82e7517bde59f074a57~-pKAoSJ3O2250622506epsmtrp1B;
	Thu, 15 May 2025 08:03:08 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-81-68259fbcd430
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.86.08805.CBF95286; Thu, 15 May 2025 17:03:08 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080308epsmtip2135cebdbb929a513a5543301eec0c26c~-pKAcXscJ1287212872epsmtip2n;
	Thu, 15 May 2025 08:03:08 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Thu, 15 May 2025 16:53:48 +0900
Message-Id: <20250515075350.3368635-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsWy7bCSvO6e+aoZBj+nclg8mLeNzeL8+Q3s
	FpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4RkmixmLT7JZPH75j9mB02PTqk42j5Vr1rB6bF5S
	77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGUcmb6AtWClSsWLnu9MDYyL5boYOTkk
	BEwkLi9Zx9TFyMUhJLCbUWLij/vMXYwcQAkpiXfPLCFqhCXutxxhhaj5wChx9vUeFpAEm4CO
	xPR/t8FsEYE4iWPtm5lBipgFdjJKtEz/zQySEBYIlWh48RCsiEVAVeLWyu+sIDavgK3E5nXH
	WSE2yEvMvPSdHcTmFLCTmHhxFyOILQRUc3jPEzaIekGJkzOfgM1hBqpv3jqbeQKjwCwkqVlI
	UgsYmVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgSHvJbWDsY9qz7oHWJk4mA8xCjB
	wawkwns9SzlDiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkmDk6p
	BqaVip3lLM8M2JayVry5rCazj9+347WyjOaURat0vLbyTefUqlU2f193Je3eY8eQb+66BTM7
	tnQJpimtEDSp7isOVEjkqbEKOCejkdS3g9mIuTEpOPh/eJiZgtQWrbq9ZfJOC3qqDzSw5b9O
	2JZ71NQ0ctaf7y9WrYsNL5crDCkIztNvvWt801RQ5vq5Ir+Z9Qd5lNRqmz3X8xy5+3B7fN7v
	xRpt/1aenXRH/cXf7pkq026fUvX9n7Kc7/73X14b3shJ/3ZiP6bwKHb6rwnS7XPfhM3JqGKY
	+8Ow4Jr/yfJZ7mZbmg1DfLsExYWz2EwmJCno/0le1mZ6vLy0MvWxypyPT4J1Z7zk2XVqgqel
	EktxRqKhFnNRcSIAUUvpr+gCAAA=
X-CMS-MailID: 20250515080308epcas2p23dcfda26ccbb9376d400af0017b55247
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080308epcas2p23dcfda26ccbb9376d400af0017b55247
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080308epcas2p23dcfda26ccbb9376d400af0017b55247@epcas2p2.samsung.com>

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


