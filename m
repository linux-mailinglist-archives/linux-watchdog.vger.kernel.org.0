Return-Path: <linux-watchdog+bounces-5000-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOrBBw5JoWnWrwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-5000-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:34:38 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A931C1B3F54
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 08:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8984A30D8E19
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Feb 2026 07:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CB931197B;
	Fri, 27 Feb 2026 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Sd8IzB1A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDD4224AF1;
	Fri, 27 Feb 2026 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177517; cv=none; b=TzmI8HWaRcs88Ef1EUA1yEbP+9qc3g0kn8DiqSVA5QLNOWUoGaay4Be15/KrfufEMeRoqg6kAiNTTrS2zQ4eYYDIfKFCOkLYnZUFpjuRh9ihpqhK9z6mdBQtUoSHs320Bm0+XcxeeITDMLzmbmXZfCeSJM5vRMOCW1tcy7zBZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177517; c=relaxed/simple;
	bh=Uw38JxW9SQFg5yvRQWMgdAVRw8MAPa94R0JCVi5ZRg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PVemDdRD2bC5nAMnNV4GIxpFrVamcy1Cn8EEf6flAdLfeVQWnu+ojHWHvtPvKrWXToFvwRIDp4RDC7q6h+4HesRRsfun6CYXK/nuLU6SmoEX7g+7uBRl/fjiBw3P3/ExAa9coLnfaRp9MgoNfrvdW2BvBxglE3U91bU2Y77EnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Sd8IzB1A; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772177517; x=1803713517;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uw38JxW9SQFg5yvRQWMgdAVRw8MAPa94R0JCVi5ZRg4=;
  b=Sd8IzB1Artz2Z5uOhGk3EHxI6zdks9ZiHwP+2y89XWPEkIKPUxDKmGgo
   Yx4zkkSAndAMvFvGWAJ6CZ5X069GTBjlWjoEQZu0A9mMtoEQDqIDWPHrh
   3/zGdapaO6d5yFV5Iv6Lpo8stRjVeNy09KjcOEXzltXEZOE/tjglYPBKu
   x4WJTW6oOeVr8aXXVHtZRz3a+kgJflt2BcNPGcokdle+VjYlUwdcskjSn
   qB7OJtiw5+Z6zmZ1uOThQQj/PqCAqz9jJv2Ue8dofE39cbHme+inLlc3l
   cKsLM0t3kXMrlLfQ1JDabdDcXUmGekNCHo6alcicVPzLEhZTLZnKyXFYl
   w==;
X-CSE-ConnectionGUID: pqQRGmnkTLWZUXpRkz7jXw==
X-CSE-MsgGUID: 2g0Dt5UPR0SRgo8urMj53A==
X-IronPort-AV: E=Sophos;i="6.21,313,1763449200"; 
   d="scan'208";a="285335714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 00:31:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 00:31:35 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 00:31:31 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH 3/3] watchdog: at91sam9_wdt: Rename AT91_WDT_WDDIS to AT91_WDT_WDDIS_LEGACY
Date: Fri, 27 Feb 2026 13:01:16 +0530
Message-ID: <20260227073116.30447-4-balakrishnan.s@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5000-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:mid,microchip.com:dkim,microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A931C1B3F54
X-Rspamd-Action: no action

Replace AT91_WDT_WDDIS with AT91_WDT_WDDIS_LEGACY to match the updated
bit definition naming.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/watchdog/at91sam9_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
index aba66b8e9d03..88a4c1ec99bd 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -162,20 +162,20 @@ static int at91_wdt_init(struct platform_device *pdev, struct at91wdt *wdt)
 
 	tmp = wdt_read(wdt, AT91_WDT_MR);
 	if ((tmp & mask) != (wdt->mr & mask)) {
 		if (tmp == WDT_MR_RESET) {
 			wdt_write(wdt, AT91_WDT_MR, wdt->mr);
 			tmp = wdt_read(wdt, AT91_WDT_MR);
 		}
 	}
 
-	if (tmp & AT91_WDT_WDDIS) {
-		if (wdt->mr & AT91_WDT_WDDIS)
+	if (tmp & AT91_WDT_WDDIS_LEGACY) {
+		if (wdt->mr & AT91_WDT_WDDIS_LEGACY)
 			return 0;
 		dev_err(dev, "watchdog is disabled\n");
 		return -EINVAL;
 	}
 
 	value = tmp & AT91_WDT_WDV;
 	delta = (tmp & AT91_WDT_WDD) >> 16;
 
 	if (delta < value)
@@ -297,20 +297,20 @@ static int of_at91wdt_init(struct device_node *np, struct at91wdt *wdt)
 	} else {
 		wdt->mr |= AT91_WDT_WDRSTEN;
 	}
 
 	if (!of_property_read_string(np, "atmel,reset-type", &tmp) &&
 	    !strcmp(tmp, "proc"))
 		wdt->mr |= AT91_WDT_WDRPROC;
 
 	if (of_property_read_bool(np, "atmel,disable")) {
-		wdt->mr |= AT91_WDT_WDDIS;
-		wdt->mr_mask &= AT91_WDT_WDDIS;
+		wdt->mr |= AT91_WDT_WDDIS_LEGACY;
+		wdt->mr_mask &= AT91_WDT_WDDIS_LEGACY;
 	}
 
 	if (of_property_read_bool(np, "atmel,idle-halt"))
 		wdt->mr |= AT91_WDT_WDIDLEHLT;
 
 	if (of_property_read_bool(np, "atmel,dbg-halt"))
 		wdt->mr |= AT91_WDT_WDDBGHLT;
 
 	wdt->mr |= max | ((max - min) << 16);
-- 
2.34.1


