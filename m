Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2384811AE6
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 16:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfEBOJc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 10:09:32 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35780 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726267AbfEBOJb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 10:09:31 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42Dwv1T002402;
        Thu, 2 May 2019 16:08:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=DotoY9nutLi40qa0Yd+weRq6+JlgwWdEZ7kKUqLTC+4=;
 b=Vfg77em4dNL5X+jwogs1tuWzG2L5MbFsl2dJnKokYyvhnkgXiihj+AsV6es0FjC/r0Z9
 VQZBKjiWr8SSOqA9b7YZrJm1kATEoepRXa2FWkgA7Q4IPNKWZVvRBNJJBfwID8HfEtjZ
 oNhF2+U5PJw/xsxFc2yjfSsjDJJv8+eqkQd3Wgwy8tiIn92rijFtJ6/t8oNlhfrL1A/B
 LugMZAoFrzk2UOK9mw609YDPvtxgV59SMPY1Rvi8yBvXFBsFQZr+YFDkTcUy6kw7WhOv
 wnz1ydmF4BwOsLTWyI2j8ckhrylvZmL2o/mOqYA6uM6zvdUkmfRxAmMceA8uVrEzrHex Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xgcry0r-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 02 May 2019 16:08:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2C8F42;
        Thu,  2 May 2019 14:08:49 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7ECA22731;
        Thu,  2 May 2019 14:08:49 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 2 May 2019
 16:08:49 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:48 +0200
From:   Ludovic Barre <ludovic.Barre@st.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Ludovic Barre <ludovic.barre@st.com>
Subject: [PATCH V2 1/3] watchdog: stm32: update to devm_watchdog_register_device
Date:   Thu, 2 May 2019 16:08:44 +0200
Message-ID: <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.237]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-02_08:,,
 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch updates to devm_watchdog_register_device interface

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e00e3b3..e191bd8 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "unable to set timeout value, using default\n");
 
-	ret = watchdog_register_device(wdd);
+	ret = devm_watchdog_register_device(&pdev->dev, wdd);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register watchdog device\n");
 		goto err;
@@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
 {
 	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
 
-	watchdog_unregister_device(&wdt->wdd);
 	clk_disable_unprepare(wdt->clk_lsi);
 	clk_disable_unprepare(wdt->clk_pclk);
 
-- 
2.7.4

