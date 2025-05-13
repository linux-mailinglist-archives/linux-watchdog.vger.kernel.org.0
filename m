Return-Path: <linux-watchdog+bounces-3464-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B1AB5082
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 11:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5FD1654D8
	for <lists+linux-watchdog@lfdr.de>; Tue, 13 May 2025 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287221F180E;
	Tue, 13 May 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="BAG/m49r"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AFF239E6A
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130222; cv=none; b=GhKZDzLARKH8rO9fSLZsGghZAzAZtwKCSo0xc+Z9sbFPI7hpPHGnKHjRA6uOsDIGCcEjTSwnkWQiL/5YoZqyzLdvFe/X0j0WUy0s0gZ1yl1hPDTzRQpgIBKbqj5Qfg13BMjVTz4sAtA9nMw0/OitbNvmsyv5DPB78/QBzuFBsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130222; c=relaxed/simple;
	bh=EZsU08uYmlYoxVpSFP2N7CZVEvoKXD1QJsYs5TeZoBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Mliltr0XU+PSuiuCqTMYXbukKJt1dM2ZFTI3mWmhHkdce0ZjLc3ZAhmXljGNpDI+mqppeBGp5D2BdqUFh7r7RWCDOEuIaSHmA+20/DkD7BsFiYowckp8TWZ5+E/3ltB6PpMw8mWHIM8wRnsxueeLpEaeUkzi31rAHydj6NxZfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=BAG/m49r; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250513095658epoutp043b71d20a7e4952ceee7601bd33990c61~-Da1HoCgL0998509985epoutp04Q
	for <linux-watchdog@vger.kernel.org>; Tue, 13 May 2025 09:56:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250513095658epoutp043b71d20a7e4952ceee7601bd33990c61~-Da1HoCgL0998509985epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130218;
	bh=8WVV/aeNExdtQzMqRCX4jAh+LbGsGqvlebjGbUqK5hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BAG/m49rLswzRZwYZpllTRe3YegmA4aYHJqXo5SWgsu9qFE+SiVAuP5WBP2UIkLob
	 mbSGmKVSGAqPdX2OLBQhwprl5/0F/6EHXxe8brFHcYvegBoyE9yBgTfXhvh2C19UZj
	 IfbEygqC73G/L96rwbW6FsgpGVsIAuKL77SuW+H4=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250513095657epcas2p30c69b6bfa5edf69af131cb8c1798746f~-Da0jTbfQ0169201692epcas2p3h;
	Tue, 13 May 2025 09:56:57 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZxX212hfCz2SSKb; Tue, 13 May
	2025 09:56:57 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095656epcas2p258caa7e4c94ff04ccce72f51b2ba81f4~-DazgJy280683506835epcas2p2k;
	Tue, 13 May 2025 09:56:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250513095656epsmtrp2a30446ccf6fcf1adf1aa56535e0a0320~-DazfdV953173331733epsmtrp2E;
	Tue, 13 May 2025 09:56:56 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-22-68231767a2e6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.57.08805.76713286; Tue, 13 May 2025 18:56:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095655epsmtip227e1c71a7da73675d62d551ee240857b~-DayyKHDS2432124321epsmtip2a;
	Tue, 13 May 2025 09:56:55 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH 1/3] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Tue, 13 May 2025 18:47:09 +0900
Message-Id: <20250513094711.2691059-2-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513094711.2691059-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsWy7bCSvG6GuHKGwYk+GYsH87axWcxvv8Ro
	cf78BnaLTY+vsVpc3jWHzWLG+X1MFjfW7WO3eLLwDJPFjMUn2Swev/zH7MDlsWlVJ5vHyjVr
	WD02L6n32Pm9gd2jb8sqRo/Pm+QC2KK4bFJSczLLUov07RK4Mo4/7WEp2KZccXnNDrYGxlWy
	XYycHBICJhLHFnSzdjFycQgJ7GaU2HD/NlsXIwdQQkri3TNLiBphifstR6BqPjBKvNl5ggUk
	wSagIzH9320wW0QgTuJY+2ZmkCJmgUeMElfm9TCBJIQFgiSW3vzPDDKURUBV4t5md5Awr4Ct
	xO2pF1kgFshLzLz0nR2khFPATuJrizJIWAio5N2cLUwQ5YISJ2c+AStnBipv3jqbeQKjwCwk
	qVlIUgsYmVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgQHvpbWDsY9qz7oHWJk4mA8
	xCjBwawkwtu4XTFDiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+3170pQgLpiSWp2ampBalFMFkm
	Dk6pBqYC0WQ5S47tNXn9Wtkle2s/+AuxhfAxxkXnJyT2Xd9ZsKCGvak8sNL2zowKR7U1Pndr
	zvFfP7RpuV+hiXF9k8yTfKctklOcHiRnGdvHCrtwbLpgeHhx+ubNC7y21X6MmLGibuXph3mZ
	059qH9ljHMW34fbva0/2BAU4/qv1OVJhEeGf+vmLdTunk9rHFcGVkqGivcXqxWWL2GZd3ld7
	79mtEumMp9kdgY12Fx4K5B9Tvrr4lPAUhkVbVP/FlrKZxSw/bj7x8uSrdjs/Vth6/ZfM3xk1
	5bRroFDw5suWfI0yX1hEP3Da1q/0WKobV/C1+PuGW2uP7J36cf7bBx9PmazMSPjT9Pz+r6TS
	2aotfEosxRmJhlrMRcWJAC3Wo5LrAgAA
X-CMS-MailID: 20250513095656epcas2p258caa7e4c94ff04ccce72f51b2ba81f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095656epcas2p258caa7e4c94ff04ccce72f51b2ba81f4
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
	<CGME20250513095656epcas2p258caa7e4c94ff04ccce72f51b2ba81f4@epcas2p2.samsung.com>

Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_timeout
3665038

[    0.208763][    T1] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
[    0.208767][    T1] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
[    0.208799][    T1] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.208969][    T1] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags, then
it will operation with 32-bit counter. If not, with 16-bit counter like previous.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index bdd81d8074b2..a13768a11f20 100644
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
@@ -378,9 +384,13 @@ static inline unsigned long s3c2410wdt_get_freq(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
+	unsigned long max_cnt = S3C2410_WTCNT_MAXCNT;
+
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		max_cnt = S3C2410_WTCNT_MAXCNT_32;
 
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return max_cnt * (S3C2410_WTCON_PRESCALE_MAX + 1)
+				* S3C2410_WTCON_MAXDIV / freq;
 }
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
@@ -534,9 +544,10 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
+	unsigned int max_cnt = S3C2410_WTCNT_MAXCNT;
 
 	if (timeout < 1)
 		return -EINVAL;
@@ -544,7 +555,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -552,16 +563,19 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		max_cnt = S3C2410_WTCNT_MAXCNT_32;
+
+	if (count > max_cnt) {
+		divisor = DIV_ROUND_UP(count, max_cnt);
 
-		if (divisor > 0x100) {
+		if (divisor > (S3C2410_WTCON_PRESCALE_MAX + 1)) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
 			return -EINVAL;
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
-- 
2.40.1


