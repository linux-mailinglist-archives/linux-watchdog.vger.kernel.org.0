Return-Path: <linux-watchdog+bounces-4998-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMGcG+pIoWkirwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4998-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:34:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A81B3F45
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB643066BD9
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF46831197B;
	Fri, 27 Feb 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Nkx7+v2y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191430596F;
	Fri, 27 Feb 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177509; cv=none; b=MiFdWoXMeXO26YmUjD7nj7mhK/A2QnudkPSewUYxBB3jOujJBo3LN+7A3KSK0cW80ajXjipg4HYQ57VMUsxw1r8hHeRIALrfKFM3ILAzFOYp85egwjLlVFbUI9JZyDUBF4y59/W3/XsNcYahkDlLX3It9i1ZWdYFERjI6BAs6Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177509; c=relaxed/simple;
	bh=8+V5iNchIOiwDg9bEpu4sW6lSMdgs6cI02ZreEZunDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQ8JDx2sfvZQcmRaepJtzWDgWuasKb4kqohcIiG47+PE/LvtNtRGC6Hr2ZSGI5gjqRfuKPjmH3AZGdVg0sVssPZWKgPIFnvsFottoY4amFspLN9fFQ3UOGlOsDio6C8RJF2RFMydw0Kd14grO8AS/HTAdS65cSujqw7JJTaPbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Nkx7+v2y; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772177508; x=1803713508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8+V5iNchIOiwDg9bEpu4sW6lSMdgs6cI02ZreEZunDc=;
  b=Nkx7+v2yLfa2Q9xjlChnMGJtLA3I1tHuIJYwIdvgvc+KW+yayJRY7cqs
   pqh1jjycy4Svlw+wOFvmhGEDcBrp5ZOzj59fYSxfiN1Zrj835ivE+FgkR
   3zA1UFCMoxaIIOXB5VEPMLZRvkhIXC5lTVczvZfmWkztSphLfywg0+UAV
   8cW1Wpb/KK9LGB9FWjh2fs0Y9f69oMKx4Fs9BH4EcQOOUicAxeJQOyIRg
   PU3MeJJ+432AcnGoH1/S4LHModVLzv3fURKNT5ARqCExQp+Uqcme2xn7x
   9K45ZQV72QQBb+7C50xPpfwV5WluJPMxioGIkCHZx5pFuhwpdraq92ypQ
   Q==;
X-CSE-ConnectionGUID: /AVa6bwHSqe24h8Jh3J90Q==
X-CSE-MsgGUID: rzaaIrPIRAWfh/6g1hOVTQ==
X-IronPort-AV: E=Sophos;i="6.21,313,1763449200"; 
   d="scan'208";a="54383808"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 00:31:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 00:31:25 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 00:31:21 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>
Subject: [PATCH 1/3] watchdog: at91sam9_wdt.h: Cleanup the header file
Date: Fri, 27 Feb 2026 13:01:14 +0530
Message-ID: <20260227073116.30447-2-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227073116.30447-1-balakrishnan.s@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4998-lists,linux-watchdog=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:mid,microchip.com:dkim,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE0A81B3F45
X-Rspamd-Action: no action

From: Andrei Simion <andrei.simion@microchip.com>

This patch reorganizes the header file by renaming the registers using
a general pattern also this patch simplifies the watchdog disable logic
in the at91sam9_wdt.h header by differentiating between modern
(SAM9X60, SAMA7G5, SAM9X7) and legacy (SAMA5, AT91SAM9261) chips based
on the watchdog disable bit.
For modern chips, the disable bit is at bit 12, while for legacy chips
it is at bit 15.

Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
[Remove Kconfig-based WDDIS selection and define explicit legacy and
modern masks]
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.h | 65 ++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..1e0aeecb489f 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -3,59 +3,58 @@
  * drivers/watchdog/at91sam9_wdt.h
  *
  * Copyright (C) 2007 Andrew Victor
  * Copyright (C) 2007 Atmel Corporation.
  * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
  *
  * Watchdog Timer (WDT) - System peripherals regsters.
  * Based on AT91SAM9261 datasheet revision D.
  * Based on SAM9X60 datasheet.
+ * Based on SAMA7G5 datasheet.
+ * Based on SAM9X75 datasheet.
  *
  */
 
 #ifndef AT91_WDT_H
 #define AT91_WDT_H
 
 #include <linux/bits.h>
 
-#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
-#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
-#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
-
-#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
-#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
-#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
-#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
-#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
+#define AT91_WDT_CR		0x00		/* Watchdog Control Register */
+#define  AT91_WDT_WDRSTT	BIT(0)		/* Restart */
+#define  AT91_WDT_KEY		(0xa5UL << 24)	/* KEY Password */
+#define AT91_WDT_MR		0x04		/* Watchdog Mode Register */
+#define  AT91_WDT_WDV		(0xfffUL << 0)	/* Counter Value */
 #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
-#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
-#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
-#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
-#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
-#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
-#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
-#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
-#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
-
+#define  AT91_WDT_WDRSTEN	BIT(13)
+#define  AT91_WDT_WDRPROC	BIT(14)
+#define  AT91_WDT_WDD		(0xfffUL << 16)
+#define  AT91_WDT_WDDBGHLT	BIT(28)
+#define  AT91_WDT_WDIDLEHLT	BIT(29)
 #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
 #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
 #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
 
-/* Watchdog Timer Value Register */
-#define AT91_SAM9X60_VR		0x08
+#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
+#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
 
-/* Watchdog Window Level Register */
-#define AT91_SAM9X60_WLR	0x0c
-/* Watchdog Period Value */
-#define  AT91_SAM9X60_COUNTER	(0xfffUL << 0)
-#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
+#define AT91_WDT_VR		0x08	/* Watchdog Timer Value Register */
+#define AT91_WDT_ISR		0x1c	/* Interrupt Status Register */
+#define AT91_WDT_IER		0x14	/* Interrupt Enable Register */
+#define AT91_WDT_IDR		0x18	/* Interrupt Disable Register */
+#define AT91_WDT_WLR		0x0c	/* Watchdog Window Level Register */
+#define AT91_WDT_PERIODRST	BIT(4)	/* Period Reset */
+#define AT91_WDT_RPTHRST	BIT(5)		/* Minimum Restart Period */
+#define  AT91_WDT_PERINT	BIT(0)	/* Period Interrupt Enable */
+#define  AT91_WDT_COUNTER	(0xfffUL << 0)	/* Watchdog Period Value */
+#define  AT91_WDT_SET_COUNTER(x)	((x) & AT91_WDT_COUNTER)
 
-/* Interrupt Enable Register */
-#define AT91_SAM9X60_IER	0x14
-/* Period Interrupt Enable */
-#define  AT91_SAM9X60_PERINT	BIT(0)
-/* Interrupt Disable Register */
-#define AT91_SAM9X60_IDR	0x18
-/* Interrupt Status Register */
-#define AT91_SAM9X60_ISR	0x1c
+/*
+ * WDDIS bit differs by SoC:
+ *   - SAMA5, AT91SAM9261: bit 15
+ *   - SAM9X60, SAMA7G5, SAM9X75: bit 12
+ * Select at runtime via compatible string.
+ */
+#define AT91_WDT_WDDIS_LEGACY   BIT(15)
+#define AT91_WDT_WDDIS_MODERN   BIT(12)
 
 #endif
-- 
2.34.1


