Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171272A97AF
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 15:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgKFOct (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 09:32:49 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:34512 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726565AbgKFOct (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 09:32:49 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6EWDkl022669;
        Fri, 6 Nov 2020 15:32:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=gxL+3W7NeUQn84nqYpY2cBP3e8fFsOZ0M8nvt5bAy4I=;
 b=QHQy1OMl/3gn+e9jj4//ePtm9KdrLveBFJClGr7P3aJwwKrhCdtv5LEBqOrbXiR7Ls3C
 0lv5rmOZA/XhKye9ixg2BsmhCj/INt7NG29Awzh2ysxXQDm+Fifik8zHECdbTbwOHtkn
 buIcr/YMvuTy6QPnQ+b3EAvzcsZDI0hgPylb4PZTSwXYJ6c1Hpw8wRMfo0/SMxHPOyOm
 uMdYa8sSw7+uMljlefDxiM9nLpYA8Apl06r8CTI/WjCzSGtSCb5HiwAs2DaDzjolxHhI
 yeSp8wikLuuK8sBO6mfFyCt5gHEIXudGMkjXVLvrYstJggeovPi+wPiNp0OAlkQCYdJb bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00evvkm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 15:32:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B85871000BB;
        Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8BAB2AD2BA;
        Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 15:23:33
 +0100
From:   Christophe Roullier <christophe.roullier@st.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-watchdog@vger.kernel.org>, <christophe.roullier@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Etienne Carriere <etienne.carriere@st.com>
Subject: [PATCH V2 1/1] watchdog: stm32_iwdg: don't print an error on probe deferral
Date:   Fri, 6 Nov 2020 15:23:27 +0100
Message-ID: <20201106142327.3129-2-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106142327.3129-1-christophe.roullier@st.com>
References: <20201106142327.3129-1-christophe.roullier@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Etienne Carriere <etienne.carriere@st.com>

Do not print an error trace when deferring probe for clock resources.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 25188d6bbe15..a3436c296c97 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -162,18 +162,15 @@ static int stm32_iwdg_clk_init(struct platform_device *pdev,
 	u32 ret;
 
 	wdt->clk_lsi = devm_clk_get(dev, "lsi");
-	if (IS_ERR(wdt->clk_lsi)) {
-		dev_err(dev, "Unable to get lsi clock\n");
-		return PTR_ERR(wdt->clk_lsi);
-	}
+	if (IS_ERR(wdt->clk_lsi))
+		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");
 
 	/* optional peripheral clock */
 	if (wdt->data->has_pclk) {
 		wdt->clk_pclk = devm_clk_get(dev, "pclk");
-		if (IS_ERR(wdt->clk_pclk)) {
-			dev_err(dev, "Unable to get pclk clock\n");
-			return PTR_ERR(wdt->clk_pclk);
-		}
+		if (IS_ERR(wdt->clk_pclk))
+			return dev_err_probe(dev, PTR_ERR(wdt->clk_pclk),
+					     "Unable to get pclk clock\n");
 
 		ret = clk_prepare_enable(wdt->clk_pclk);
 		if (ret) {
-- 
2.17.1

