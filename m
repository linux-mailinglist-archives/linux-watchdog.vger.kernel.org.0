Return-Path: <linux-watchdog+bounces-3852-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D976B03661
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 07:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03F33172409
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 05:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD45220685;
	Mon, 14 Jul 2025 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Bd+QEvR2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E2211A11
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472745; cv=none; b=M3RJgLqQi1F+De1TkqsmwEueZP+MYk8b3EqTfKWUFmM/qdpKyLE1+igiQ1AZUZg1sjuCov2x8FWgpJnsFWHkIbr1mMJxqPeFmWic9ffjLfCzzgdzhhq5ymSBa8CCv8qeFoD/2pJNRgl1zZ/dtGZNW3sjL9w2RphHZD6/tlOYqeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472745; c=relaxed/simple;
	bh=EwYKzBt1+rkAxOJiyz3wA8Sjcd2/K/p1f3sgOeujDrk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=q7SGXZjixZgIBkia+ZHaC4p6Hjo1+WgNS85Si59cWVOUcrPEtvTjUHktJU/fG9iz5Be4+B/UddPR8yMVbK0U7jwgfJIr4HjWqwZsOudyDJnniwSYY6X89S4PrRHzmtO4Y8Rev9X4c0H4gfjS+m5abehnW/CwqRiB7O0Hv4++ImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Bd+QEvR2; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250714055900epoutp014a1c28436432c18b0cb3459cb40902c6~SCKwvHI2u0721207212epoutp01i
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250714055900epoutp014a1c28436432c18b0cb3459cb40902c6~SCKwvHI2u0721207212epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472740;
	bh=Ap7Mmdv8Cxqph5dLYnaCd3sCquALNyml1qToeS+NKiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bd+QEvR2JtusDfC/D3c0oABGto9cpqx6OrdzmSV8NiAL8x+WtoatWdOX3IjfiJL6f
	 e1watXcjFGuo+QQ/0D22IkAMmJx76m6TMO7YxhQNwl00SC2IS9Av/xmzwSjXGtyi5p
	 3MFtVK4/8oaUILIoc5qwQXX/XoxM8IS1td13M/BM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250714055900epcas2p3dd2bd5cd93f05360b7ff0aa81b265477~SCKwK0rwo3070030700epcas2p3q;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bgWpq2mRwz6B9mG; Mon, 14 Jul
	2025 05:58:59 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250714055858epcas2p47b849c0141fdb556288333f7abe00372~SCKvAbH620123201232epcas2p4D;
	Mon, 14 Jul 2025 05:58:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055858epsmtip17b1932c6280004c6182095f89fc50a92~SCKu9SZ440363003630epsmtip1o;
	Mon, 14 Jul 2025 05:58:58 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 3/5] watchdog: s3c2410_wdt: Increase max timeout
 value of watchdog
Date: Mon, 14 Jul 2025 14:54:38 +0900
Message-Id: <20250714055440.3138135-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055858epcas2p47b849c0141fdb556288333f7abe00372@epcas2p4.samsung.com>

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
index 31f7e1ec779e..090b78717cd2 100644
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


