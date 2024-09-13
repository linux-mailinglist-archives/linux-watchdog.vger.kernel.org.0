Return-Path: <linux-watchdog+bounces-1895-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 248219788AD
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 21:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC671C21C2A
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Sep 2024 19:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92C212F588;
	Fri, 13 Sep 2024 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="hQeNxFnT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464B126C01;
	Fri, 13 Sep 2024 19:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254860; cv=none; b=NDicB8py9msPptj/fvU3+nBkudH37I2ZYgcZB9GXD07Y7WoRXfeGqXj0jwMvRigKKklkgGxYaJCRxCnBt9R+DlRkrMgQB1eZvpRrTuOwOFH6cFN692B+3F356ESD/UhaoP0mzWs6IebyY/6PpC2x+h8mX1dw6SLcAncAXaAxstg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254860; c=relaxed/simple;
	bh=/UgSpW0hgUU/FLQJT1+DwxpiBNcC2UvFUbEyxpkpqaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5/T/A41E9Wbck0NlYqBr6ks/IjNOe8oitEgnh3fdkBrjSlZCTQiI51moRtRtJDVUaWtBCUS4UU0IP6eoDtKhKuE2Q1wqobD5GkUeMBYoVEqe2Ir3OIDMC4k6ydirC4b+M/I8Kwk4vmOgfJPJiQNlIBiXsLJ5PvrmmNyFCPkKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=hQeNxFnT; arc=none smtp.client-ip=173.37.86.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2369; q=dns/txt; s=iport;
  t=1726254858; x=1727464458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jge+dJKKcmr8yk6ZPqFxdRKFfC5Hixcc5LyZ8XwQZmc=;
  b=hQeNxFnTOE5F9EpW1N1//3QSdg7LqStgPOEujwrrqLU8K0GnKGh0sjeS
   Ttvaa6aP1di0Qv8NpjnEJis2nGA0dziowNLWVXEgcW4BFzBHFhn5uH4AO
   Fo9LDE0nVuyilVDD7wpw7CoAuYjFVbNdonXudySWk3JZZxkOImPsd5LHK
   s=;
X-CSE-ConnectionGUID: m9cj2+bLTnW3u057odBuiA==
X-CSE-MsgGUID: pdw0ZxwRRxinSjyHkOye8w==
X-IronPort-AV: E=Sophos;i="6.10,226,1719878400"; 
   d="scan'208";a="260643594"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 19:14:06 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTP id 48DJE5E8029696;
	Fri, 13 Sep 2024 19:14:05 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.de, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, mika.westerberg@linux.intel.com,
        oocheret@cisco.com, wim@linux-watchdog.org, wsa@kernel.org,
        xe-linux-external@cisco.com
Subject: [PATCH v3] iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
Date: Fri, 13 Sep 2024 12:14:03 -0700
Message-Id: <20240913191403.2560805-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <cc652ed1-32c7-4ea2-b494-698b344f24a0@roeck-us.net>
References: <cc652ed1-32c7-4ea2-b494-698b344f24a0@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com

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
 V2 -> V3: Removed not necessary variable 'mask', updated multi-line comments
 V1 -> V2: Provided comments and macro define with bit description

 drivers/watchdog/iTCO_wdt.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..dd297dcd524c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -82,6 +82,13 @@
 #define TCO2_CNT(p)	(TCOBASE(p) + 0x0a) /* TCO2 Control Register	*/
 #define TCOv2_TMR(p)	(TCOBASE(p) + 0x12) /* TCOv2 Timer Initial Value*/
 
+/*
+ * NMI_NOW is bit 8 of TCO1_CNT register
+ * Read/Write
+ * This bit is implemented as RW but has no effect on HW.
+ */
+#define NMI_NOW		BIT(8)
+
 /* internal variables */
 struct iTCO_wdt_private {
 	struct watchdog_device wddev;
@@ -219,13 +226,23 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
 	struct iTCO_wdt_private *p = priv;
 	u16 val, newval;
 
-	val = inw(TCO1_CNT(p));
+	/*
+	 * writing back 1b1 to NMI_NOW of TCO1_CNT register
+	 * causes NMI_NOW bit inversion what consequently does
+	 * not allow to perform the register's value comparison
+	 * properly.
+	 *
+	 * NMI_NOW bit masking for TCO1_CNT register values
+	 * helps to avoid possible NMI_NOW bit inversions on
+	 * following write operation.
+	 */
+	val = inw(TCO1_CNT(p)) & ~NMI_NOW;
 	if (set)
 		val |= BIT(0);
 	else
 		val &= ~BIT(0);
 	outw(val, TCO1_CNT(p));
-	newval = inw(TCO1_CNT(p));
+	newval = inw(TCO1_CNT(p)) & ~NMI_NOW;
 
 	/* make sure the update is successful */
 	return val != newval ? -EIO : 0;
-- 
2.39.3


