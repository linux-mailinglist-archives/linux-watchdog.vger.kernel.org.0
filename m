Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDCC55C1DB
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 14:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236390AbiF0Nyb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 09:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbiF0Ny2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 09:54:28 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C9CAE54;
        Mon, 27 Jun 2022 06:54:26 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RDhHuN001053;
        Mon, 27 Jun 2022 13:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+cawotrj/1dSxR3/0ou5PM5kym3DFbOzGlpY1H5jZs0=;
 b=aBtgLnVVPt3T06W/R216skhKYQ7e6PhZNANxjFA6Y8JG10CfCXhnrhmlKW+7hmOrnAhW
 /7/KFZhLDQcvzF6bKIvcsbDKS+QwZOKFZ3AQEANZzmm0SgbW1dYqNK9nYO+pQoQZtY0N
 jYLiDtX8ND1q8dBRci5Cf7lBMbbAs2j95Fbh6BMyYDDQS7prn6DVlDEjxC5D2ygpGMWs
 gPug2iLCSzDhFdznIJzxoxd4eyHhsn1SGmlVEP0iRtKwXY1NGj6nEFF2ppsMGMlOMRyp
 wBWrTG4j67zGxyzHtlMCixbvwNRyQj4vOIVyAg2CoElbW++xzco5ccAiskqra1GnJ0bm GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gydpa08vr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 13:53:56 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RDkKON015980;
        Mon, 27 Jun 2022 13:53:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gydpa08us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 13:53:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RDoUlX004750;
        Mon, 27 Jun 2022 13:53:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 3gwt08u13w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 13:53:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RDroDO21496142
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jun 2022 13:53:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 97B21AE053;
        Mon, 27 Jun 2022 13:53:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 205FAAE04D;
        Mon, 27 Jun 2022 13:53:50 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon, 27 Jun 2022 13:53:50 +0000 (GMT)
From:   Laurent Dufour <ldufour@linux.ibm.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, mpe@ellerman.id.au,
        benh@kernel.crashing.org, paulus@samba.org, nathanl@linux.ibm.com,
        haren@linux.vnet.ibm.com, npiggin@gmail.com
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v3 4/4] pseries/mobility: set NMI watchdog factor during LPM
Date:   Mon, 27 Jun 2022 15:53:47 +0200
Message-Id: <20220627135347.32624-5-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627135347.32624-1-ldufour@linux.ibm.com>
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L0pY_-q6hY9VfxBmu9shvaCyp9vOKJUH
X-Proofpoint-GUID: 9qFYSrQaiwpP9SXFE4jv4aYNbhhYBRYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206270059
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

During a LPM, while the memory transfer is in progress on the arrival side,
some latencies is generated when accessing not yet transferred pages on the
arrival side. Thus, the NMI watchdog may be triggered too frequently, which
increases the risk to hit a NMI interrupt in a bad place in the kernel,
leading to a kernel panic.

Disabling the Hard Lockup Watchdog until the memory transfer could be a too
strong work around, some users would want this timeout to be eventually
triggered if the system is hanging even during LPM.

Introduce a new sysctl variable nmi_watchdog_factor. It allows to apply
a factor to the NMI watchdog timeout during a LPM. Just before the CPU are
stopped for the switchover sequence, the NMI watchdog timer is set to
 watchdog_tresh + factor%

A value of 0 has no effect. The default value is 200, meaning that the NMI
watchdog is set to 30s during LPM (based on a 10s watchdog_tresh value).
Once the memory transfer is achieved, the factor is reset to 0.

Setting this value to a high number is like disabling the NMI watchdog
during a LPM.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++
 arch/powerpc/platforms/pseries/mobility.c   | 43 +++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ddccd1077462..0bb0b7f27e96 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -592,6 +592,18 @@ to the guest kernel command line (see
 Documentation/admin-guide/kernel-parameters.rst).
 
 
+nmi_watchdog_factor (PPC only)
+==================================
+
+Factor apply to to the NMI watchdog timeout (only when ``nmi_watchdog`` is
+set to 1). This factor represents the percentage added to
+``watchdog_thresh`` when calculating the NMI watchdog timeout during a
+LPM. The soft lockup timeout is not impacted.
+
+A value of 0 means no change. The default value is 200 meaning the NMI
+watchdog is set to 30s (based on ``watchdog_thresh`` equal to 10).
+
+
 numa_balancing
 ==============
 
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 907a779074d6..649155faafc2 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -48,6 +48,39 @@ struct update_props_workarea {
 #define MIGRATION_SCOPE	(1)
 #define PRRN_SCOPE -2
 
+#ifdef CONFIG_PPC_WATCHDOG
+static unsigned int nmi_wd_factor = 200;
+
+#ifdef CONFIG_SYSCTL
+static struct ctl_table nmi_wd_factor_ctl_table[] = {
+	{
+		.procname	= "nmi_watchdog_factor",
+		.data		= &nmi_wd_factor,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_douintvec_minmax,
+	},
+	{}
+};
+static struct ctl_table nmi_wd_factor_sysctl_root[] = {
+	{
+		.procname       = "kernel",
+		.mode           = 0555,
+		.child          = nmi_wd_factor_ctl_table,
+	},
+	{}
+};
+
+static int __init register_nmi_wd_factor_sysctl(void)
+{
+	register_sysctl_table(nmi_wd_factor_sysctl_root);
+
+	return 0;
+}
+device_initcall(register_nmi_wd_factor_sysctl);
+#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_PPC_WATCHDOG */
+
 static int mobility_rtas_call(int token, char *buf, s32 scope)
 {
 	int rc;
@@ -702,13 +735,20 @@ static int pseries_suspend(u64 handle)
 static int pseries_migrate_partition(u64 handle)
 {
 	int ret;
+	unsigned int factor = 0;
 
+#ifdef CONFIG_PPC_WATCHDOG
+	factor = nmi_wd_factor;
+#endif
 	ret = wait_for_vasi_session_suspending(handle);
 	if (ret)
 		return ret;
 
 	vas_migration_handler(VAS_SUSPEND);
 
+	if (factor)
+		watchdog_nmi_set_lpm_factor(factor);
+
 	ret = pseries_suspend(handle);
 	if (ret == 0) {
 		post_mobility_fixup();
@@ -716,6 +756,9 @@ static int pseries_migrate_partition(u64 handle)
 	} else
 		pseries_cancel_migration(handle, ret);
 
+	if (factor)
+		watchdog_nmi_set_lpm_factor(0);
+
 	vas_migration_handler(VAS_RESUME);
 
 	return ret;
-- 
2.36.1

