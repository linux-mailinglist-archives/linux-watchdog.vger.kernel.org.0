Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F85A53BD9F
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jun 2022 19:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234584AbiFBRyx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jun 2022 13:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236999AbiFBRyw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jun 2022 13:54:52 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ADE2B12C7
        for <linux-watchdog@vger.kernel.org>; Thu,  2 Jun 2022 10:54:51 -0700 (PDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252HFfFl021859;
        Thu, 2 Jun 2022 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+7Sg7OMtej89Qmdgkmlvd2xMwnmgEYj7txYo6rDcbjg=;
 b=SbZn7TjfHddLya4f0Vv8Aiz/wu5SqmcVNbXCl/t5eKACgTm16ogrNtXatzduZlV9r6dv
 7wEVyrSXFoPGA7Eo8LV2tUN2z8QOpbEyVIQY/82p4Ivgjy96WGooBNnAIZyHJhIo3ftr
 v76vIYqLoFeTmvpm72oOYV61qHD8nKuQ3gw+Xco0YSqQG/evceO1PHd1zmJhIHkcjWE3
 cynvt8Md5OjHYqyVpLPmr/8UdyQS7HvZmR0xMIidMRSBKJr+PvHc2q9iqSu0vTmYCv3a
 LWkdRYLetUBdJommK7zzYSQoRxy4QdUR93HYIHVgKfLUvER/CJwQIGG+j64OXNmZfW7I 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gew9cnydr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:29 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252HbCii013883;
        Thu, 2 Jun 2022 17:54:29 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gew9cnydq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252Ho3rd008515;
        Thu, 2 Jun 2022 17:54:28 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma01dal.us.ibm.com with ESMTP id 3gcxt5v40w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jun 2022 17:54:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 252HsQVY27263450
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 2 Jun 2022 17:54:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2DB70AE05C;
        Thu,  2 Jun 2022 17:54:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 09251AE063;
        Thu,  2 Jun 2022 17:54:26 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  2 Jun 2022 17:54:25 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device with platform bus
Date:   Thu,  2 Jun 2022 12:53:52 -0500
Message-Id: <20220602175353.68942-4-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220602175353.68942-1-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t_2Utd-fSi2URAwB81AuFp11Qj-PUZ5R
X-Proofpoint-ORIG-GUID: 6lNjq6fiwRbaHfcdv992gnTBQEFjG_85
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020073
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
guest control of one or more virtual watchdog timers.

These timers do not conform to PowerPC device conventions.  They are
not affixed to any extant bus, nor do they have full representation in
the device tree.

As a workaround we represent them as platform devices.

This patch registers a single platform device, "pseries-wdt", with the
platform bus if the FW_FEATURE_WATCHDOG flag is set.

A driver for this device, "pseries-wdt", will be introduced in a
subsequent patch.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index afb074269b42..233c64f59815 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -14,6 +14,7 @@
 
 #include <linux/cpu.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -169,6 +170,22 @@ static void __init fwnmi_init(void)
 #endif
 }
 
+/*
+ * Affix a device for the first timer to the platform bus if
+ * we have firmware support for the H_WATCHDOG hypercall.
+ */
+static struct platform_device *pseries_wdt_pdev;
+
+static __init int pseries_wdt_init(void)
+{
+	if (!firmware_has_feature(FW_FEATURE_WATCHDOG))
+		return 0;
+	pseries_wdt_pdev = platform_device_register_simple("pseries-wdt",
+							   0, NULL, 0);
+	return 0;
+}
+machine_subsys_initcall(pseries, pseries_wdt_init);
+
 static void pseries_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-- 
2.27.0

