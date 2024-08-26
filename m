Return-Path: <linux-watchdog+bounces-1527-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1FB95EB39
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 10:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACCE2867E6
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Aug 2024 08:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0256014534A;
	Mon, 26 Aug 2024 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="c1AX3GIC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEED13EFF3;
	Mon, 26 Aug 2024 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.37.86.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724658852; cv=none; b=Rv/qvYEZWZGkdUiWJiBHfFdntr3+GCbPcQHCuE3pyWgLrxeF3VxKdd2IVL/P77GM3gNziBL3+nqpdqucujHjQxCSOXEUcmxRMhaX8bchJobo93OTn5Ay/AS47lMueqg8L7m79wqXWCqMZcjlDa15HVaFuNzrqmlDHpWEOdyifUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724658852; c=relaxed/simple;
	bh=Oi+B0kPRMelYRxWClEb8ARvaX6r/tYTuNt39GlLZJvA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m/UyayPZdGEeoARSv7DakcDZqzVOWK+DP4q9cVIWXsbM/REB5Ul7Zwh+XxihzsuhZQl9ijPW2EWtmml9FcIV9sBaFS/4bquLyoZSS3LAoru59XhOsZAV0tzE8yLkGyAJEGJiVX+X0TJTapwSzcG3261/wuuk5BHxVTSZts0HoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b=c1AX3GIC; arc=none smtp.client-ip=173.37.86.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1212; q=dns/txt; s=iport;
  t=1724658847; x=1725868447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B1FEm6L4bWbz+pJgqwOw+8ENx6wInpwg7Mz4G4vh4fE=;
  b=c1AX3GICX3iosCrU5LotmWRaudBv2CmzeKj2TKHu7bEt78MGdoKHGxcc
   ctdn8KZsU3w+OYP4dFJ4+cfSIRvO+i4DFI3ddH7mxqytgrwVuJiz64Trb
   /84Yp0gkoEPlP0n7IH75dSG3bzFX6DM9uivnD5Ml8TI9RNf2DMyiWZuKg
   M=;
X-CSE-ConnectionGUID: nVnaVUObTkybk5fYfNlUuA==
X-CSE-MsgGUID: rIixp7J8SvG8yk8jA/9PoQ==
X-IronPort-AV: E=Sophos;i="6.10,177,1719878400"; 
   d="scan'208";a="250273246"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 07:53:59 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTP id 47Q7rwm3022358;
	Mon, 26 Aug 2024 07:53:59 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xe-linux-external@cisco.com, Oleksandr Ocheretnyi <oocheret@cisco.com>
Subject: [PATCH v1] iTCO_wdt: ignore NMI_NOW bit on register comparison
Date: Mon, 26 Aug 2024 00:53:01 -0700
Message-Id: <20240826075303.3964392-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.35.6
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com

Commit da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake
PCH iTCO") does not ignore NMI_NOW bit on write operation to TCO1_CNT
register what causes unexpected NMIs due to NMI_NOW bit inversion
during regular crashkernel's workflow with following logs:

iTCO_vendor_support: vendor-support=0
iTCO_wdt iTCO_wdt: unable to reset NO_REBOOT flag, device
                                            disabled by hardware/BIOS

This change clears NMI_NOW bit in the TCO1_CNT register to have no
effect on NMI_NOW bit inversion what can cause NMI immediately.

Fixes: da23b6faa8bf ("watchdog: iTCO: Add support for Cannon Lake PCH iTCO")
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 drivers/watchdog/iTCO_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..679c115ef7d3 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -224,7 +224,7 @@ static int update_no_reboot_bit_cnt(void *priv, bool set)
 		val |= BIT(0);
 	else
 		val &= ~BIT(0);
-	outw(val, TCO1_CNT(p));
+	outw(val & ~BIT(8), TCO1_CNT(p));
 	newval = inw(TCO1_CNT(p));
 
 	/* make sure the update is successful */
-- 
2.39.3


