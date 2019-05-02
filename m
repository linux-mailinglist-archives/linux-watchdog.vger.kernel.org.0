Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B311AE4
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 16:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfEBOJ0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 10:09:26 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35752 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726267AbfEBOJZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 10:09:25 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42Dwtn4002390;
        Thu, 2 May 2019 16:08:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ErLblLqpuz55YxCpK0I2Nnwtday0NkjHtDQvnjNDp9A=;
 b=ipIiiuNp77KGMq39ygECSJuLNSF1W9U95F2YmK3auSgZjwMvLjRlhETE6P84wKjUt3ed
 q3OAspnSrtkcsv/uUvua9Ini5Qydg3o7GVfaxjOPGnJKpzyQxqL+3UAASvLgxqmecsn7
 /C5OqwZx5/cPAkmbO0UsaxHG55qmrgvkAA7AJwWSgYsfh/xB0FM/d0bJ4bOk4P0WZrEj
 u7mj5QhYnyd7T39Mj14B7a+D+kHyzqbbrvdJNaPIQXP+wnDJPTO4imEjWRzv5ujxAsi4
 ocRaiRYMA5mFnXhQxaDyKnaTUFAdlWB7qjLIg5exoUaFwAocJZ5pwNlNWFUrxr0R+XM9 OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xgcry0w-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 02 May 2019 16:08:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B480146;
        Thu,  2 May 2019 14:08:50 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BFA92730;
        Thu,  2 May 2019 14:08:50 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.361.1; Thu, 2 May 2019
 16:08:50 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:49 +0200
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
Subject: [PATCH V2 2/3] watchdog: stm32: update return values recommended by watchdog kernel api
Date:   Thu, 2 May 2019 16:08:45 +0200
Message-ID: <1556806126-15890-3-git-send-email-ludovic.Barre@st.com>
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

This patch updates return values on watchdog-kernel-api.txt:
return 0 on succes, -EINVAL for "parameter out of range"
and -EIO for "could not write value to the watchdog".

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/watchdog/stm32_iwdg.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index e191bd8..f19a6d4 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -81,7 +81,6 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
 	u32 val = FLAG_PVU | FLAG_RVU;
 	u32 reload;
-	int ret;
 
 	dev_dbg(wdd->parent, "%s\n", __func__);
 
@@ -98,13 +97,11 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
 	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
 
 	/* wait for the registers to be updated (max 100ms) */
-	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
-					 !(val & (FLAG_PVU | FLAG_RVU)),
-					 SLEEP_US, TIMEOUT_US);
-	if (ret) {
-		dev_err(wdd->parent,
-			"Fail to set prescaler or reload registers\n");
-		return ret;
+	if (readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, val,
+				       !(val & (FLAG_PVU | FLAG_RVU)),
+				       SLEEP_US, TIMEOUT_US)) {
+		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
+		return -EIO;
 	}
 
 	/* reload watchdog */
@@ -128,8 +125,16 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
 static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
+	unsigned int tout = clamp(timeout, wdd->min_timeout,
+				  wdd->max_hw_heartbeat_ms / 1000);
+
 	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
 
+	if (tout != timeout) {
+		dev_err(wdd->parent, "parameter out of range\n");
+		return -EINVAL;
+	}
+
 	wdd->timeout = timeout;
 
 	if (watchdog_active(wdd))
-- 
2.7.4

