Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8EA2573A71
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Jul 2022 17:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236963AbiGMPsJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Jul 2022 11:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236971AbiGMPsH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Jul 2022 11:48:07 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D204F19B;
        Wed, 13 Jul 2022 08:48:07 -0700 (PDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DFCICs024483;
        Wed, 13 Jul 2022 15:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OqEsGehoDv7WhZIWjrAncQCiO+QkUV2kIJiuCbfX46c=;
 b=IcU9eY3ZkVEYPEGHwYf6kJx35SUocyJ2UoV1otKhae4IDG4ARoiFBtQPgnvKmnyLp6K1
 RrS40QPFiOoWUU2Kmni8Bg7fOcGHcdDmhGXMGjb1dMm8nRHiUlhs07f5IP8929TFHxcz
 Bn2jfSvaAVP3dMB9hvQdRbyC04/EQ0fm96wN88AY4xalX6xahgSxT+olpdG553B9zK87
 ORiYWHfTaSrxx1hum7mHCQ6ohSLN41QOzPEwk8xxZL6SbDF8J+oB8d0iMtgBb1/4/pPu
 vHcunGsbXZP0ZMv6pRJBBheH/2oBTnFFZCzZnT580+e+w04sclyBUgE3XVBMBb+WaTHo fg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0g111cb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 15:47:38 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DFCx38026640;
        Wed, 13 Jul 2022 15:47:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0g111bd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 15:47:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DFOLHt008933;
        Wed, 13 Jul 2022 15:47:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3h71a8wvgc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 15:47:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DFlgHo33030590
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 15:47:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0A0C4AE045;
        Wed, 13 Jul 2022 15:47:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7850FAE055;
        Wed, 13 Jul 2022 15:47:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.2.121])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 13 Jul 2022 15:47:31 +0000 (GMT)
From:   Laurent Dufour <ldufour@linux.ibm.com>
To:     mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        wim@linux-watchdog.org, linux@roeck-us.net, nathanl@linux.ibm.com,
        rdunlap@infradead.org
Cc:     haren@linux.vnet.ibm.com, hch@infradead.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v5 2/4] watchdog: export lockup_detector_reconfigure
Date:   Wed, 13 Jul 2022 17:47:27 +0200
Message-Id: <20220713154729.80789-3-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220713154729.80789-1-ldufour@linux.ibm.com>
References: <20220713154729.80789-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rqJP_mbwYCmnQydzmQ3Ap22ZOt3BR0mg
X-Proofpoint-GUID: A8FtXGMeQqSr63HUK0sI1DiJRnUWJEq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_04,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130062
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

In some circumstances it may be interesting to reconfigure the watchdog
from inside the kernel.

On PowerPC, this may helpful before and after a LPAR migration (LPM) is
initiated, because it implies some latencies, watchdog, and especially NMI
watchdog is expected to be triggered during this operation. Reconfiguring
the watchdog with a factor, would prevent it to happen too frequently
during LPM.

Rename lockup_detector_reconfigure() as __lockup_detector_reconfigure() and
create a new function lockup_detector_reconfigure() calling
__lockup_detector_reconfigure() under the protection of watchdog_mutex.

Cc: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 include/linux/nmi.h |  2 ++
 kernel/watchdog.c   | 21 ++++++++++++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 750c7f395ca9..f700ff2df074 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -122,6 +122,8 @@ int watchdog_nmi_probe(void);
 int watchdog_nmi_enable(unsigned int cpu);
 void watchdog_nmi_disable(unsigned int cpu);
 
+void lockup_detector_reconfigure(void);
+
 /**
  * touch_nmi_watchdog - restart NMI watchdog timeout.
  *
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 20a7a55e62b6..90e6c41d5e33 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -541,7 +541,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void lockup_detector_reconfigure(void)
+static void __lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
@@ -561,6 +561,13 @@ static void lockup_detector_reconfigure(void)
 	__lockup_detector_cleanup();
 }
 
+void lockup_detector_reconfigure(void)
+{
+	mutex_lock(&watchdog_mutex);
+	__lockup_detector_reconfigure();
+	mutex_unlock(&watchdog_mutex);
+}
+
 /*
  * Create the watchdog infrastructure and configure the detector(s).
  */
@@ -577,13 +584,13 @@ static __init void lockup_detector_setup(void)
 		return;
 
 	mutex_lock(&watchdog_mutex);
-	lockup_detector_reconfigure();
+	__lockup_detector_reconfigure();
 	softlockup_initialized = true;
 	mutex_unlock(&watchdog_mutex);
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void lockup_detector_reconfigure(void)
+void __lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
@@ -591,9 +598,13 @@ static void lockup_detector_reconfigure(void)
 	watchdog_nmi_start();
 	cpus_read_unlock();
 }
+static inline void lockup_detector_reconfigure(void)
+{
+	__lockup_detector_reconfigure();
+}
 static inline void lockup_detector_setup(void)
 {
-	lockup_detector_reconfigure();
+	__lockup_detector_reconfigure();
 }
 #endif /* !CONFIG_SOFTLOCKUP_DETECTOR */
 
@@ -633,7 +644,7 @@ static void proc_watchdog_update(void)
 {
 	/* Remove impossible cpus to keep sysctl output clean. */
 	cpumask_and(&watchdog_cpumask, &watchdog_cpumask, cpu_possible_mask);
-	lockup_detector_reconfigure();
+	__lockup_detector_reconfigure();
 }
 
 /*
-- 
2.37.0

