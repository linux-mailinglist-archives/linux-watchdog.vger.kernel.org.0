Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE9511ADD
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 May 2019 16:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfEBOJX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 May 2019 10:09:23 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:35742 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726197AbfEBOJX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 May 2019 10:09:23 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x42Dwv1S002402;
        Thu, 2 May 2019 16:08:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=FVkWMnd5QCZrrAZpQ6NJ9/fjWM/X82CadAEL49V6JPA=;
 b=wZBkWjE5k8IvrxC1KUp/YkYcWWIIqHvhFnML8yz3oiWf3SBqTXDTiNcd9Jcbzqdl7009
 HCH1HYj1BtH8/JvK9PnUvWcH8L8/0SXlHAQJ1yM2OE+6mTrTxk2h+m3HJVrCQRUZywJT
 gFEli0QAc0QiwD17pDBLZV03ai98fMj/GC7kzG1wObEusnqNqN1/l/xhawdW49SBZmOc
 UILLM31en0Vm8iMhHQdr4wRhoQEsmNkTT4FHsk2V1Y05Awc+JQbBKwLszqvsTXU/Qam0
 z82vZYyqjB0rbye3La8XPRQR7C9LzUukDUX/5qD+014i9ZtXx34w+QdphgOUUM6cD75x lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xgcry0q-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 02 May 2019 16:08:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEDE641;
        Thu,  2 May 2019 14:08:48 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 787462730;
        Thu,  2 May 2019 14:08:48 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:48 +0200
Received: from lmecxl0923.lme.st.com (10.48.0.237) by webmail-ga.st.com
 (10.75.90.48) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 2 May 2019
 16:08:47 +0200
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
Subject: [PATCH V2 0/3] watchdog: stm32: add dynamic prescaler support
Date:   Thu, 2 May 2019 16:08:43 +0200
Message-ID: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
X-Mailer: git-send-email 2.7.4
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

This patch series updates stm32 watchdog driver on:
-use devm_watchdog_register_device
-Guenter's recommendation about return value:
set_timeout return 0 on succes, -EINVAL for "parameter out of range"
and -EIO for "could not write value to the watchdog".
Set of reload and prescaler registers are stay in start function,
because the stm32 watchdog must be enabled to write these registers.
-adds dynamic prescaler support

Ludovic Barre (3):
  watchdog: stm32: update to devm_watchdog_register_device
  watchdog: stm32: update return values recommended by watchdog kernel
    api
  watchdog: stm32: add dynamic prescaler support

 drivers/watchdog/stm32_iwdg.c | 96 ++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 42 deletions(-)

-- 
2.7.4

