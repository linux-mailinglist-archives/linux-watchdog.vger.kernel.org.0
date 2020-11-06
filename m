Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F89C2A9321
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 10:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKFJrD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 04:47:03 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39820 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726891AbgKFJrC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 04:47:02 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A69gDXw017313;
        Fri, 6 Nov 2020 10:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mCMhngS0zvQHmaCCNAZOy0n27MjAIHp6acoc6hJ/Vzs=;
 b=0g9xba0yoTV1ZqZ/lbVcG/8+E0dIcQ37O232zz5zi2Uc+DH7YdhdcFhj57LERL/O3GTq
 4rnp34HlmxIZ8HKP7U9ogIEMuZBxNyLCz8Ob50qFmmOikl1lhDAnR5YC8dyyVGss9O+G
 iwHzBGO4ik/NsegiASYhimp25FqnqWZUDLJJIBbF6x7EdGbRlBGCi0Ak7nh+qTTisZgc
 PPrVOUt9wI7tRVmgaUkgXZ3MQPJdruUZLpEHz2EC13hkwzww3EttdbJTkDXvnMSFNTnm
 iLzRtW+eURUE5rY5wUY3hg/DmN67vR7+A3zViGuQPc0mjW9ht9qykipq/zyb4YJ9F/I2 yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00eudhj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 10:46:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DE4110002A;
        Fri,  6 Nov 2020 10:46:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E1FD2365FC;
        Fri,  6 Nov 2020 10:46:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 10:46:38
 +0100
From:   Christophe Roullier <christophe.roullier@st.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-watchdog@vger.kernel.org>, <christophe.roullier@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Etienne Carriere <etienne.carriere@st.com>
Subject: [PATCH  1/1] watchdog: stm32_iwdg: don't print an error on probe deferral
Date:   Fri, 6 Nov 2020 10:46:27 +0100
Message-ID: <20201106094627.21132-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_03:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Do not print an error trace when deferring probe for clock resources.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 25188d6bbe15..1b71c205cee0 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -163,7 +163,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 
 	wdt->clk_lsi = devm_clk_get(dev, "lsi");
 	if (IS_ERR(wdt->clk_lsi)) {
-		dev_err(dev, "Unable to get lsi clock\n");
+		if (PTR_ERR(wdt->clk_lsi) != -EPROBE_DEFER)
+			dev_err(dev, "Unable to get lsi clock\n");
 		return PTR_ERR(wdt->clk_lsi);
 	}
 
@@ -171,7 +172,8 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	if (wdt->data->has_pclk) {
 		wdt->clk_pclk = devm_clk_get(dev, "pclk");
 		if (IS_ERR(wdt->clk_pclk)) {
-			dev_err(dev, "Unable to get pclk clock\n");
+			if (PTR_ERR(wdt->clk_pclk) != -EPROBE_DEFER)
+				dev_err(dev, "Unable to get pclk clock\n");
 			return PTR_ERR(wdt->clk_pclk);
 		}
 
-- 
2.17.1

