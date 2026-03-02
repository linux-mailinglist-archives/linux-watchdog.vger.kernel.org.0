Return-Path: <linux-watchdog+bounces-5029-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJAYOKp2pWkNBgYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5029-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:38:18 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 453631D7979
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3019A30AA8B6
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 11:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797313451A9;
	Mon,  2 Mar 2026 11:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HjlmunFN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48803624A5;
	Mon,  2 Mar 2026 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451229; cv=none; b=FSxDeBT3c2AvnhUErrzlNd7fVK+/JEsBL3GRCOWMwpT3QGC1i73U+F3qATVQeNTZTDvkxLVWZcNC+WNa1qBpNRV45FwRNIUVwzpL0J+LKRku4RNNFTLvCAlSssPY7jMgeGYe1T7xflK6Jphh9QDVBVcIR/f3L5r7WNKrtMHr0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451229; c=relaxed/simple;
	bh=Qi6mDeLUYAi34DWMvp/7dxXLg8jcp1nz+M4Ea+q5TZo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NtvT76SNMNQ/DjV6qu+Np5uevKjDw8hIuBcUFUn1wKvxm2FVyvCObGWfdx0/LvZMEE9ENkr/We6EGmR0pvEXfLy5dgSBTo6ri5xKc18hM/dC7mvHN6nKLs3sxMruTYrE8jDa/sTnb38eqiaEeUikchMRAZ6n8TSQphA0YIV3x7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HjlmunFN; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451227; x=1803987227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qi6mDeLUYAi34DWMvp/7dxXLg8jcp1nz+M4Ea+q5TZo=;
  b=HjlmunFNoNCh+AoVK5AGRet6e3Bkr+z+mmw8eaCS67Ed5jKSR3OVDPAy
   DvsSphLm1MoZSQ2ovBhp1NXomlGDdfE++0Y9GNwEfOv3mJFDXfepUKf2s
   EtSgjpm3F0lh7kiMa/3ExkkxEX31waR/LQZBYPwEFmJfQXxa0HmSpdVJC
   rmOpSgtrYTEWC6NX1pvDrV+Z5QDzseODprU0QZ5kP6cZL3mr/dRmDR6U5
   KJ+wH1fpex2i/LvYevwETp/SlOhzDwRykMlTu1V9/ClAV9xuCz13LTo9R
   i3dJv9uYruXeIVY2Tq/9PC7q6i1ITPA/nC/fhWk3+xje4xdzsRenzUpio
   Q==;
X-CSE-ConnectionGUID: R6kAG1m/QI27bcgiSIY67w==
X-CSE-MsgGUID: fBBBJlpLRx+h9sHU7QGuEw==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="61522905"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Mar 2026 04:33:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Mar 2026 04:33:19 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:15 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH 1/2] watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
Date: Mon, 2 Mar 2026 17:03:09 +0530
Message-ID: <20260302113310.133989-2-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302113310.133989-1-balakrishnan.s@microchip.com>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5029-lists,linux-watchdog=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:email]
X-Rspamd-Queue-Id: 453631D7979
X-Rspamd-Action: no action

The driver hardcoded AT91_WDT_WDDIS (bit 15) in wdt_enabled and the
probe initial state readout. SAM9X60 and SAMA7G5 use bit 12
(AT91_SAM9X60_WDDIS), causing incorrect WDDIS detection.

Introduce a per-device wddis_mask field to select the correct WDDIS
bit based on the compatible string.

Fixes: 266da53c35fc ("watchdog: sama5d4: readout initial state")
Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/sama5d4_wdt.c | 48 +++++++++++++++-------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.c
index 13e72918338a..704b786cc2ec 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -24,37 +24,41 @@
 #define WDT_DEFAULT_TIMEOUT	MAX_WDT_TIMEOUT
 
 #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
 
 struct sama5d4_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*reg_base;
 	u32			mr;
 	u32			ir;
+	u32			wddis_mask;
 	unsigned long		last_ping;
 	bool			need_irq;
 	bool			sam9x60_support;
 };
 
 static int wdt_timeout;
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
 module_param(wdt_timeout, int, 0);
 MODULE_PARM_DESC(wdt_timeout,
 	"Watchdog timeout in seconds. (default = "
 	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
 
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout,
 	"Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-#define wdt_enabled (!(wdt->mr & AT91_WDT_WDDIS))
+static inline bool wdt_enabled(struct sama5d4_wdt *wdt)
+{
+	return !(wdt->mr & wdt->wddis_mask);
+}
 
 #define wdt_read(wdt, field) \
 	readl_relaxed((wdt)->reg_base + (field))
 
 /* 4 slow clock periods is 4/32768 = 122.07µs*/
 #define WDT_DELAY	usecs_to_jiffies(123)
 
 static void wdt_write(struct sama5d4_wdt *wdt, u32 field, u32 val)
 {
@@ -75,55 +79,49 @@ static void wdt_write_nosleep(struct sama5d4_wdt *wdt, u32 field, u32 val)
 		udelay(123);
 	writel_relaxed(val, wdt->reg_base + field);
 	wdt->last_ping = jiffies;
 }
 
 static int sama5d4_wdt_start(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
-	if (wdt->sam9x60_support) {
+	if (wdt->sam9x60_support)
 		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
-		wdt->mr &= ~AT91_SAM9X60_WDDIS;
-	} else {
-		wdt->mr &= ~AT91_WDT_WDDIS;
-	}
+	wdt->mr &= ~wdt->wddis_mask;
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 
 	return 0;
 }
 
 static int sama5d4_wdt_stop(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
-	if (wdt->sam9x60_support) {
+	if (wdt->sam9x60_support)
 		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
-		wdt->mr |= AT91_SAM9X60_WDDIS;
-	} else {
-		wdt->mr |= AT91_WDT_WDDIS;
-	}
+	wdt->mr |= wdt->wddis_mask;
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 
 	return 0;
 }
 
 static int sama5d4_wdt_ping(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 
 	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
 
 	return 0;
 }
 
 static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
-				 unsigned int timeout)
+				    unsigned int timeout)
 {
 	struct sama5d4_wdt *wdt = watchdog_get_drvdata(wdd);
 	u32 value = WDT_SEC2TICKS(timeout);
 
 	if (wdt->sam9x60_support) {
 		wdt_write(wdt, AT91_SAM9X60_WLR,
 			  AT91_SAM9X60_SET_COUNTER(value));
 
 		wdd->timeout = timeout;
@@ -134,20 +132,20 @@ static int sama5d4_wdt_set_timeout(struct watchdog_device *wdd,
 	wdt->mr |= AT91_WDT_SET_WDV(value);
 
 	/*
 	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
 	 * setting the WDDIS bit, and while it is set, the fields WDV and WDD
 	 * must not be modified.
 	 * If the watchdog is enabled, then the timeout can be updated. Else,
 	 * wait that the user enables it.
 	 */
-	if (wdt_enabled)
-		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~AT91_WDT_WDDIS);
+	if (wdt_enabled(wdt))
+		wdt_write(wdt, AT91_WDT_MR, wdt->mr & ~wdt->wddis_mask);
 
 	wdd->timeout = timeout;
 
 	return 0;
 }
 
 static const struct watchdog_info sama5d4_wdt_info = {
 	.options = WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
 	.identity = "Atmel SAMA5D4 Watchdog",
@@ -178,22 +176,19 @@ static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
 	}
 
 	return IRQ_HANDLED;
 }
 
 static int of_sama5d4_wdt_init(struct device_node *np, struct sama5d4_wdt *wdt)
 {
 	const char *tmp;
 
-	if (wdt->sam9x60_support)
-		wdt->mr = AT91_SAM9X60_WDDIS;
-	else
-		wdt->mr = AT91_WDT_WDDIS;
+	wdt->mr = wdt->wddis_mask;
 
 	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
 	    !strcmp(tmp, "software"))
 		wdt->need_irq = true;
 
 	if (of_property_read_bool(np, "atmel,idle-halt"))
 		wdt->mr |= AT91_WDT_WDIDLEHLT;
 
 	if (of_property_read_bool(np, "atmel,dbg-halt"))
@@ -207,27 +202,23 @@ static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
 	u32 reg, val;
 
 	val = WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
 	/*
 	 * When booting and resuming, the bootloader may have changed the
 	 * watchdog configuration.
 	 * If the watchdog is already running, we can safely update it.
 	 * Else, we have to disable it properly.
 	 */
-	if (!wdt_enabled) {
+	if (!wdt_enabled(wdt)) {
 		reg = wdt_read(wdt, AT91_WDT_MR);
-		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
-			wdt_write_nosleep(wdt, AT91_WDT_MR,
-					  reg | AT91_SAM9X60_WDDIS);
-		else if (!wdt->sam9x60_support &&
-			 (!(reg & AT91_WDT_WDDIS)))
+		if (!(reg & wdt->wddis_mask))
 			wdt_write_nosleep(wdt, AT91_WDT_MR,
-					  reg | AT91_WDT_WDDIS);
+					  reg | wdt->wddis_mask);
 	}
 
 	if (wdt->sam9x60_support) {
 		if (wdt->need_irq)
 			wdt->ir = AT91_SAM9X60_PERINT;
 		else
 			wdt->mr |= AT91_SAM9X60_PERIODRST;
 
 		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
@@ -267,18 +258,21 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 	wdd->ops = &sama5d4_wdt_ops;
 	wdd->min_timeout = MIN_WDT_TIMEOUT;
 	wdd->max_timeout = MAX_WDT_TIMEOUT;
 	wdt->last_ping = jiffies;
 
 	if (of_device_is_compatible(dev->of_node, "microchip,sam9x60-wdt") ||
 	    of_device_is_compatible(dev->of_node, "microchip,sama7g5-wdt"))
 		wdt->sam9x60_support = true;
 
+	wdt->wddis_mask = wdt->sam9x60_support ? AT91_SAM9X60_WDDIS
+						: AT91_WDT_WDDIS;
+
 	watchdog_set_drvdata(wdd, wdt);
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
 	wdt->reg_base = regs;
 
 	ret = of_sama5d4_wdt_init(dev->of_node, wdt);
@@ -300,20 +294,20 @@ static int sama5d4_wdt_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(dev, "cannot register interrupt handler\n");
 			return ret;
 		}
 	}
 
 	watchdog_init_timeout(wdd, wdt_timeout, dev);
 
 	reg = wdt_read(wdt, AT91_WDT_MR);
-	if (!(reg & AT91_WDT_WDDIS)) {
-		wdt->mr &= ~AT91_WDT_WDDIS;
+	if (!(reg & wdt->wddis_mask)) {
+		wdt->mr &= ~wdt->wddis_mask;
 		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
 	ret = sama5d4_wdt_init(wdt);
 	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(wdd, nowayout);
 
-- 
2.34.1


