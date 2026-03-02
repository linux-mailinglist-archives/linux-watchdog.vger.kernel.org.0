Return-Path: <linux-watchdog+bounces-5028-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHspEJ11pWkNBgYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5028-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:33:49 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B061D78B3
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67F32301A9D1
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 11:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792B63624A5;
	Mon,  2 Mar 2026 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hwPNd3ID"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD43451A9;
	Mon,  2 Mar 2026 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451226; cv=none; b=pGC/XBFYAFDwT//H3UMU98Dcr+7fOoyTXtmKjyQ4bDIaDIzdYrPe2kliJeYMhhViYBkUis9Xz3f4TrmuAv9PtgLN0v59o5YknTwhT4GDp9aXt7W+BNTgselO9sb8YNdLh29bf8Ur1MfjQ40fvBxl0ojxdGQGnQ7dtpfO6gweuvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451226; c=relaxed/simple;
	bh=VPkfhe4C3hHwMYweD5UGKLva5GXNQHDs6Rbi8s6IllE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFzWjZKBpCSZdwx2ivFWQcPUB16aI0sLlNCtS68ssckmkInuF3d51CCPNc9K4ZIZTkmN2MbTiWBL3eaqZKHC+gmzDaqpnJSpv+jEuM2z5aJ7uYnJXrjyJBu/lEGUgiknCY4Jy4P0AlufLnLrKah0IGNSnw824z9av946kLNwcYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hwPNd3ID; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451226; x=1803987226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VPkfhe4C3hHwMYweD5UGKLva5GXNQHDs6Rbi8s6IllE=;
  b=hwPNd3IDswWq2YXWoDcMRxlVV86G6wG9J5awVzoa+oFwHGAXpZm2cm7K
   z7mWffdX3Qv4RvmNZ6tS4LHZqrusPZegSbNSBEwAEhX05rUBlIxfj5Dv3
   92UQl20MQT6LDxf7QuO59DLp5mTqUiyfaUlMk9+E7kUOioZPuSCXibSc5
   cZegDjwg7B+AXaUm7DjXJGETyLx6amI1zHeI6/HEZU6i5vMiVGaPKoyqY
   vsMk2sD+KFAIrr+GlD40s/9zo4KeiGpxhYULlHo+dtW04iT+/W6rl/nLe
   1E/a+Xlbx6VVm8j+WZ/whZ6my/ozmkVAguVicEomM2vvMKFZGNVq6Tqb4
   A==;
X-CSE-ConnectionGUID: Btinl9WeT2+oaoBxEtKcig==
X-CSE-MsgGUID: CTSiwOYrQgG3sQtNUzjZZQ==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="54070301"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:33:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 04:33:23 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:19 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
Subject: [PATCH 2/2] watchdog: at91sam9_wdt.h: Document WDDIS bit position per SoC family
Date: Mon, 2 Mar 2026 17:03:10 +0530
Message-ID: <20260302113310.133989-3-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302113310.133989-1-balakrishnan.s@microchip.com>
References: <20260302113310.133989-1-balakrishnan.s@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5028-lists,linux-watchdog=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:email]
X-Rspamd-Queue-Id: D5B061D78B3
X-Rspamd-Action: no action

AT91_WDT_WDDIS (bit 15) applies to SAMA5/AT91SAM9261 and
AT91_SAM9X60_WDDIS (bit 12) to SAM9X60/SAMA7G5/SAM9X75. Update
comments to reflect this and add SAMA7G5 and SAM9X75 datasheet
references to the file header.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
index 298d545df1a1..2020694f8f6f 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -3,40 +3,42 @@
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
 
 #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
 #define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
 #define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
 
 #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
 #define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
 #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
 #define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
 #define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
 #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
-#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
+#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable (SAM9X60, SAMA7G5, SAM9X75) */
 #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
 #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
-#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
+#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable (SAMA5, AT91SAM9261) */
 #define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
 #define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
 #define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
 #define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
 
 #define AT91_WDT_SR		0x08		/* Watchdog Status Register */
 #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
 #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
 
-- 
2.34.1


