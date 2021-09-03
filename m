Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC733FFEEE
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 13:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349282AbhICLWG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 07:22:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5252 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349261AbhICLWE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 07:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630668065; x=1662204065;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zZmk/iAAkU8GsDmGbHM9UFqKKqbM3yR1T8nt/G6++VY=;
  b=bIsdfVe3vXRyCt3I/t37iEPpUSTBTSwhniKrFVwKNXvkPy7BqDSsGerI
   0IDSD+2Jh2YkMFC5MD9bgkkbE79cEeDBvK0o+cX+b7HhuPOUnjgYeiFY/
   g4tKH7OXKAejYR0kFuXLtrr2rFihyyd1asGeC4MPy3PXIYGzJ+aNuwQFu
   8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 03 Sep 2021 04:21:04 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2021 04:21:04 -0700
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 3 Sep 2021
 04:21:03 -0700
From:   Jamie Iles <quic_jiles@quicinc.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <zhangshaokun@hisilicon.com>
Subject: [PATCH] watchdog: sbsa: only use 32-bit accessors
Date:   Fri, 3 Sep 2021 12:21:01 +0100
Message-ID: <20210903112101.493552-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SBSA says of the generic watchdog:

  All registers are 32 bits in size and should be accessed using 32-bit
  reads and writes. If an access size other than 32 bits is used then
  the results are IMPLEMENTATION DEFINED.

and for qemu, the implementation will only allow 32-bit accesses
resulting in a synchronous external abort when configuring the watchdog.
Use lo_hi_* accessors rather than a readq/writeq.

Fixes: abd3ac7902fb ("watchdog: sbsa: Support architecture version 1")
Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
---
 drivers/watchdog/sbsa_gwdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index ee9ff38929eb..6f4319bdbc50 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -130,7 +130,7 @@ static u64 sbsa_gwdt_reg_read(struct sbsa_gwdt *gwdt)
 	if (gwdt->version == 0)
 		return readl(gwdt->control_base + SBSA_GWDT_WOR);
 	else
-		return readq(gwdt->control_base + SBSA_GWDT_WOR);
+		return lo_hi_readq(gwdt->control_base + SBSA_GWDT_WOR);
 }
 
 static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
@@ -138,7 +138,7 @@ static void sbsa_gwdt_reg_write(u64 val, struct sbsa_gwdt *gwdt)
 	if (gwdt->version == 0)
 		writel((u32)val, gwdt->control_base + SBSA_GWDT_WOR);
 	else
-		writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
+		lo_hi_writeq(val, gwdt->control_base + SBSA_GWDT_WOR);
 }
 
 /*
-- 
2.30.2

