Return-Path: <linux-watchdog+bounces-5027-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBlrKlx2pWkNBgYAu9opvQ
	(envelope-from <linux-watchdog+bounces-5027-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:37:00 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DA1D794C
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 12:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932F1302F9B8
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 11:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B5B3451A6;
	Mon,  2 Mar 2026 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kTAkIRzL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35FF32861F;
	Mon,  2 Mar 2026 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451225; cv=none; b=aCXdqrg88/UzR960OkXecCThmt0ftUwdBVqP4IFC8kiLEoeol0owoZC5LBBdrdHiHtpOdyYRD+Wjem+AXRcOvpVWbIBhkahfM6/F58FCU3kFnDMk/21hENR+sjNdcvg3AfFQJHi58hEviMVQogSaSTd5IeSxqnmauG4FMm0ShM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451225; c=relaxed/simple;
	bh=TLAGm/Xm/NIOke7FgpiE5RxbSPLY/5vGq7tktPxAuTs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CrbBoiddO3X7XOWhg3ctpYGZJWIwIo3hPFkTYmGtVyudkC+ND9gbeXIxPKUsvgr2as+yQdwpc7bAGzQwf+l3eaCBWY3o1qMAUHdqQ5Gl89A7t2Y6+42H7J7joUoPN65aqtYRzAdmnhKL5TcTqp5lHJVQ53rGS1oOkio/nCcC3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kTAkIRzL; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772451225; x=1803987225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TLAGm/Xm/NIOke7FgpiE5RxbSPLY/5vGq7tktPxAuTs=;
  b=kTAkIRzL0Uo6pHmZ5M7Sn5EZiIqWi5p1yK8efGJ9TwHInidw+9h0sxyq
   Kp3ecgeSATBWINIH82fNrK+rXrm5e046nZP8aVHBRRTOO9OjazNegkWke
   pdunB5mkQDK0c9HHDfphWBffrOeQcutPhBs+uH2Rvrb5XJlOSHHnBCYOG
   n6ELRPXrYstxTEub3pqmvc3Gj4wiBERlO1ZoBxTVUp4DLLwr8xjLqLTwV
   rC1l2bk8E0v9eb/jjpnIYBuTsE8RTAmvQvAci5JCNPOPRf6PNf8Sirj8f
   jO+451Cv+2Kiufvv1Z4ZQSX+MFz+DlDtX3U7r8bmMvUOOnKTuKIlEqLAE
   g==;
X-CSE-ConnectionGUID: Btinl9WeT2+oaoBxEtKcig==
X-CSE-MsgGUID: vw7UREDWQIqModl2L0GP0g==
X-IronPort-AV: E=Sophos;i="6.21,319,1763449200"; 
   d="scan'208";a="54070300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 04:33:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 2 Mar 2026 04:33:14 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Mar 2026 04:33:11 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<alexandre.belloni@bootlin.com>, <andrei.simion@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/2] watchdog: sama5d4_wdt: Fix WDDIS handling for SAM9X60 and SAMA7G5
Date: Mon, 2 Mar 2026 17:03:08 +0530
Message-ID: <20260302113310.133989-1-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-watchdog@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5027-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 090DA1D794C
X-Rspamd-Action: no action

The sama5d4_wdt driver hardcodes AT91_WDT_WDDIS (bit 15) for WDDIS
detection, which is incorrect for SAM9X60 and SAMA7G5 that use bit 12
(AT91_SAM9X60_WDDIS). This series fixes the detection by introducing
a per-device wddis_mask and documents the bit position difference in
the header.

Changes in v2:
- Reorder patches: fix first, documentation second
- Drop patch 3/3, not needed with wddis_mask approach
- Keep AT91_SAM9X60_* register names, drop _LEGACY/_MODERN naming
- Limit header changes to WDDIS comments and datasheet references

Balakrishnan Sambath (2):
  watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
  watchdog: at91sam9_wdt.h: Document WDDIS bit position per SoC family

 drivers/watchdog/at91sam9_wdt.h |  6 +++--
 drivers/watchdog/sama5d4_wdt.c  | 48 +++++++++++++++------------------
 2 files changed, 25 insertions(+), 29 deletions(-)

-- 
2.34.1


