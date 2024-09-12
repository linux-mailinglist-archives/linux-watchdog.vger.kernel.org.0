Return-Path: <linux-watchdog+bounces-1877-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157C976BCD
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 16:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0DD51F230C9
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Sep 2024 14:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5261A4E7E;
	Thu, 12 Sep 2024 14:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="OvTJJspy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E981A0BDF;
	Thu, 12 Sep 2024 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.142.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150775; cv=none; b=lsuywGzabz4LUj+bH8qBe5SFMRIECToWFU8yWl+eZtTIzqOfRz438nG/T4mXxrdrGnk6N7aPCjhBABd0pTlqN5Q0iOL4AP7U6+qPwpWIx7srt104kBcxkwwi6ccY+EvMfeZalhqfMeRuxqa784Lw2xQjgPF9h+P8EU7WG6PsmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150775; c=relaxed/simple;
	bh=t2mQwJo8APQZjTDExku0tcmE5K7kPNwIXQv3lZfWQCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNRxJTb7JiE8/yoXzgoan9QVGtV/Ajj203v1Dtet7NiAALbBFDjoaql/FOszEFEGuJoT03FS/zJf3Y9ZGo8toLh1bUHwC3nzyaW+stt/1kbr71bkXBaMLhKOWVEiIpbHYPYzxU6bZ8Y2ftsnQIfSCEmUrseVEgLboeNfITyPHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=OvTJJspy; arc=none smtp.client-ip=173.37.142.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2312; q=dns/txt; s=iport;
  t=1726150773; x=1727360373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aoEE5RzvQEUmldkzRvDhp7X1WP97oJd1VWVMHtU+Yk=;
  b=OvTJJspycjgQCq8X36yn+Tzd3oxDxV7BjYGH/4CSfPKHRdZUWep1OQvW
   F0+5nHdGtYbVdg5C+BFbBiQvqbflhVhDZT8e21RHqDFplGkwHx25QgY0j
   vMHc0TKt+7HxV0QeefGdWCjJG8ORqqcttXiEPiEvfWiGYpkDoiFMXlRRp
   Y=;
X-CSE-ConnectionGUID: fl1e6fgZS1m1XvieohE2Ow==
X-CSE-MsgGUID: +wC4hs95TWeivNzCb3BoJg==
X-IronPort-AV: E=Sophos;i="6.10,223,1719878400"; 
   d="scan'208";a="343594541"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 14:19:32 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTP id 48CEJVhM031210;
	Thu, 12 Sep 2024 14:19:31 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.de, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, mika.westerberg@linux.intel.com,
        oocheret@cisco.com, wim@linux-watchdog.org, wsa@kernel.org,
        xe-linux-external@cisco.com
Subject: [PATCH v2] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
Date: Thu, 12 Sep 2024 07:19:31 -0700
Message-Id: <20240912141931.2447826-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <9afcde72-6720-494e-9a02-b0089253c121@roeck-us.net>
References: <9afcde72-6720-494e-9a02-b0089253c121@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: alln-core-8.cisco.com

Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
PCH iTCO") does not mask NMI_NOW bit during TCO1_CNT register's
value comparison for update_no_reboot_bit() call causing following
failure:

   ...
   iTCO_vendor_support: vendor-support=0
   iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
                                    disabled by hardware/BIOS
   ...

and this can lead to unexpected NMIs later during regular
crashkernel's workflow because of watchdog probe call failures.

This change masks NMI_NOW bit for TCO1_CNT register values to
avoid unexpected NMI_NOW bit inversions.

Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 drivers/watchdog/iTCO_wdt.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..46c09359588f 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -82,6 +82,12 @@
 #define TCO2_CNT(p)	(TCOBASE(p) + 0x0a) /* TCO2 Control Register	*/
 #define TCOv2_TMR(p)	(TCOBASE(p) + 0x12) /* TCOv2 Timer Initial Value*/
 
+/* NMI_NOW is bit 8 of TCO1_CNT register
+ * Read/Write
+ * This bit is implemented as RW but has no effect on HW.
+ */
+#define NMI_NOW		BIT(8)
+
 /* internal variables */
 struct iTCO_wdt_private {
 	struct watchdog_device wddev;
@@ -217,15 +223,24 @@ static int update_no_reboot_bit_mem(void *priv, bool set)
 static int update_no_reboot_bit_cnt(void *priv, bool set)
 {
 	struct iTCO_wdt_private *p = priv;
-	u16 val, newval;
-
-	val = inw(TCO1_CNT(p));
+	u16 val, newval, mask = (~NMI_NOW);
+
+	/* writing back 1b1 to NMI_NOW of TCO1_CNT register
+	 * causes NMI_NOW bit inversion what consequently does
+	 * not allow to perform the register's value comparison
+	 * properly.
+	 *
+	 * NMI_NOW bit masking for TCO1_CNT register values
+	 * helps to avoid possible NMI_NOW bit inversions on
+	 * following write operation.
+	 */
+	val = inw(TCO1_CNT(p)) & mask;
 	if (set)
 		val |= BIT(0);
 	else
 		val &= ~BIT(0);
 	outw(val, TCO1_CNT(p));
-	newval = inw(TCO1_CNT(p));
+	newval = inw(TCO1_CNT(p)) & mask;
 
 	/* make sure the update is successful */
 	return val != newval ? -EIO : 0;
-- 
2.35.6


