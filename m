Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BBC37F057
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 02:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbhEMA2W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 20:28:22 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:48136 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237805AbhEMA2A (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 20:28:00 -0400
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14D0IcCr007200;
        Thu, 13 May 2021 00:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id; s=pps0720;
 bh=cCyG1VpPt8D1LHsOI4oEa9q0tI8/XA2xjIMuyYCQnSs=;
 b=AGxuj2J15myNi5UMuPjTT4p9BQodyr1Nle/yUg6zN2q3Z1JDZ+mp5GA5KIq7GCoiyobW
 4Z5dt7wd59IShHZbK7APX9OEpa/jluVwkpPnuKxQGZcoretHRL5Xn5JVyzOUkAXQebTu
 TXVnssQ7OnUOhqCcKyB7J0OZ5Inhx++Hbk4/1GUtzrRF4nfPZNkRyjoDygRwhy0cyLGT
 Nrq1dZ4Xd7sNSBiK4OR/83MkebhKqyoEDS8d+dzz5bpnUf8SUKrXyFGIKXPSyVmaD2FV
 nVRKZ7feIDUZh21SyAusnX9YvUOt/scqPR2LRdMGmF3ADliXVYHI1+9noZOzWd43eonW +w== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0a-002e3701.pphosted.com with ESMTP id 38gpnt934y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 May 2021 00:26:37 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 508DA51;
        Thu, 13 May 2021 00:26:36 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id BBEA545;
        Thu, 13 May 2021 00:26:35 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH] watchdog/hpwdt: New PCI IDs
Date:   Wed, 12 May 2021 18:25:48 -0600
Message-Id: <1620865548-11895-1-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-ORIG-GUID: LIkzzD1VtNO7dtptRhWva1p0gXX4yTvx
X-Proofpoint-GUID: LIkzzD1VtNO7dtptRhWva1p0gXX4yTvx
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-12_13:2021-05-12,2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130000
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

New hardware with new PCI ID info.
---
 drivers/watchdog/hpwdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 22ddba3..a5006a5 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -45,6 +45,7 @@
 static const struct pci_device_id hpwdt_devices[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_COMPAQ, 0xB203) },	/* iLO2 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_HP, 0x3306) },	/* iLO3 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_HP_3PAR, 0x0389) },	/* PCtrl */
 	{0},			/* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, hpwdt_devices);
-- 
1.8.3.1

