Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8078A573DC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Jul 2022 22:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbiGMUY3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Jul 2022 16:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236836AbiGMUY3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Jul 2022 16:24:29 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8F225C73
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Jul 2022 13:24:27 -0700 (PDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DK9sTg010648;
        Wed, 13 Jul 2022 20:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8pXOPnm5EtZozYCtnUSYm9dERXpW8IZXENIKEKeZyts=;
 b=NFfWJ2gi6fzDQ3aY8GFziD/Ul7QprhAtL0c3RX+aa8RfbaA6ks+1zOixkIgb01+zo6Z/
 KEB58sXMSZX6KZ9mzmEy571OxjJzg+JZoxdg7bjsWg7lMhPZEbtbp/tsoAGy5h9weogp
 BY3FcUW4+nCX48U1kNXsCh6fCZtVlFLk9iBsWZsub+V6cA0RQ5XtDSshLLO7WmfLyX2L
 TWKepn63uF4nilVlACs9Fa9b/TwmnHR6k47N+ko4y7ZBYGlBKEMZFh93+81CxirPZxTY
 l821aulL+jz6lsO6hZ8Di695Jw9ydBSKasORtVwf6T2b1KGe8b841fuybTmVCXKPC0O0 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha4ugg8vp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 20:24:07 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DKB8jb014222;
        Wed, 13 Jul 2022 20:24:06 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha4ugg8ve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 20:24:06 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DJZAQX030006;
        Wed, 13 Jul 2022 20:24:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 3h71a9pb2r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 20:24:06 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DKO4nY30867850
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jul 2022 20:24:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DA8306A051;
        Wed, 13 Jul 2022 20:24:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BEC146A047;
        Wed, 13 Jul 2022 20:24:04 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 13 Jul 2022 20:24:04 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [PATCH v3 2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
Date:   Wed, 13 Jul 2022 15:23:33 -0500
Message-Id: <20220713202335.1217647-3-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220713202335.1217647-1-cheloha@linux.ibm.com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nkmw6zubEKAlTQ1DOOTgj1GsHXSo_ulJ
X-Proofpoint-GUID: MhQqi3FHMfxsjNIUdZpsXa9pnWJSmqZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207130073
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PAPR v2.12 specifies a new optional function set, "hcall-watchdog",
for the /rtas/ibm,hypertas-functions property.  The presence of this
function set indicates support for the H_WATCHDOG hypercall.

Check for this function set and, if present, set the new
FW_FEATURE_WATCHDOG flag.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       | 3 ++-
 arch/powerpc/platforms/pseries/firmware.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 8dddd34b8ecf..398e0b5e485f 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -55,6 +55,7 @@
 #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
 #define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
 #define FW_FEATURE_ENERGY_SCALE_INFO ASM_CONST(0x0000040000000000)
+#define FW_FEATURE_WATCHDOG	ASM_CONST(0x0000080000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -76,7 +77,7 @@ enum {
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
 		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY |
-		FW_FEATURE_ENERGY_SCALE_INFO,
+		FW_FEATURE_ENERGY_SCALE_INFO | FW_FEATURE_WATCHDOG,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 09c119b2f623..080108d129ed 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -67,6 +67,7 @@ hypertas_fw_features_table[] = {
 	{FW_FEATURE_PAPR_SCM,		"hcall-scm"},
 	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
 	{FW_FEATURE_ENERGY_SCALE_INFO,	"hcall-energy-scale-info"},
+	{FW_FEATURE_WATCHDOG,		"hcall-watchdog"},
 };
 
 /* Build up the firmware features bitmask using the contents of
-- 
2.27.0

