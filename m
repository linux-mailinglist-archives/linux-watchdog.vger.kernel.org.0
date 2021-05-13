Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4307D37F1D3
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 May 2021 06:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhEMEFq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 May 2021 00:05:46 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:41840 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229459AbhEMEFl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 May 2021 00:05:41 -0400
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14D43Uid021561;
        Thu, 13 May 2021 04:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=6eMUPALFTiZDWx7EIoYjvK5pO2c4/K8tGruXkQUJhME=;
 b=AZEXzKU7LlbNy+lhIUlG2nBv2zX5KZcdl9+oohOSR7R3UHSxUeNc8YH0BkQaoq02jyPk
 HlAReO+GyCiaVgEnhF8pyV8e6Cp/QeDlUyPbEFX5u+Shy7mhLTAYIcIHMPRtn1lZ51BD
 4al2iEADjXtfpDMNVathQREp6ovJFQjQTTLFyc2GEy5K5EdS7NYyzJ7DquTJkP9/cvvI
 T9cExQhvUTDBvI77/845eiO9zXZkDqcP3nBjzQesiUeO/Tu6qH7EZyv9IxAO5T+wjQDJ
 2ILCGHc6rTcvV+0RcVBCLTY2PJFaNqtcpyhdxYuPF/E7tiWAoQzHCjnczYQ+ykXdK75m qA== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 38gpsna7gb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 May 2021 04:04:19 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id 253249B;
        Thu, 13 May 2021 04:04:19 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id DBA0D3A;
        Thu, 13 May 2021 04:04:18 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH V2] watchdog/hpwdt: New PCI IDs
Date:   Wed, 12 May 2021 22:03:32 -0600
Message-Id: <1620878612-24736-2-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620878612-24736-1-git-send-email-jerry.hoemann@hpe.com>
References: <1620878612-24736-1-git-send-email-jerry.hoemann@hpe.com>
X-Proofpoint-GUID: E2VL-OpkSb7qxDj0hvUBfKJFlhogfC_U
X-Proofpoint-ORIG-GUID: E2VL-OpkSb7qxDj0hvUBfKJFlhogfC_U
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-13_01:2021-05-12,2021-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=971 bulkscore=0 clxscore=1015 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105130028
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

New hardware with new PCI ID info.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
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

