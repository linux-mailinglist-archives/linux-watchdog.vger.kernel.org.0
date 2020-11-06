Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5257B2A97B2
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Nov 2020 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgKFOcy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Nov 2020 09:32:54 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:34404 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727451AbgKFOcx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Nov 2020 09:32:53 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A6EWDku022669;
        Fri, 6 Nov 2020 15:32:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=TqUJuC3My8Iz9+K0q9sV4IpHuACP0Xg9U709fHwKzSI=;
 b=OY+Lsz1AS7s4dhnwlpkEjjLuTq8ydXIjIn//vhe3UoUwSJXfZeeJTC5S2Vlojd1oBPz1
 gqbp8CD5Sz6ND68jsN4uAcbOpudlrjC5tcWkcv9+uQTDs14AAa15Flb8DMHPbZEjFMzI
 IlgLEPMjpEONmM+0SDuJ4LdGKd5Pfib+0C68SpvHPbjzc8Vhlbyko/TjrITfpkwRRKd3
 fkOyIXR8gmWZ+t4lBT7878Jw00whMajQBunv6t6qGmktRnU6WbPGJ9D4MG6GOH5sPNbu
 8WB9xCcoR9EnKXYzIhixweLUcV14clLSA0MvMeWKE8+UJeDD0vGYSvOIuOy6e+ryxWFn Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h00evvkn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Nov 2020 15:32:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B899F1000BC;
        Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A161D2AD2B9;
        Fri,  6 Nov 2020 15:23:55 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 15:23:32
 +0100
From:   Christophe Roullier <christophe.roullier@st.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
CC:     <linux-watchdog@vger.kernel.org>, <christophe.roullier@st.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH V2 0/1]  watchdog: stm32_iwdg: don't print an error on probe deferral
Date:   Fri, 6 Nov 2020 15:23:26 +0100
Message-ID: <20201106142327.3129-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-06_06:2020-11-05,2020-11-06 signatures=0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Do not print an error trace when deferring probe for clock resources.

Version 2: Remark from Guenter and Ahmad
		use dev_err_probe instead 

Etienne Carriere (1):
  watchdog: stm32_iwdg: don't print an error on probe deferral

 drivers/watchdog/stm32_iwdg.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.17.1

