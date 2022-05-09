Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1325F5203BA
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 19:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239771AbiEIRtH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 13:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbiEIRtH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 13:49:07 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF432878F1
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 10:45:12 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249Ge8Z4012590;
        Mon, 9 May 2022 17:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9Wz59AQv5F9c35eNRR5Beoc6oCxG/HJCCp9oNBfcVNc=;
 b=LIpae4zjVq9hBmpLzsJ+eeK8VMlu313bcqIL7HpRbOu06dtLea3FkMqmVcXZHzDryXFn
 73Sm5Tk6s13zR1juqu8zyg26PIhKmWgMWSGaMFesxpmNj1KIH1adeTz/DhQ5lReWwgEV
 orilTZq9Cyv067mdB7laEqksdv0e5nVoRfi6S+yU/LHpOxEH0Xh0JAi7jW1bIVsPLIaA
 hLNKGApWbJ+3ZABoUAtPouaiCiY1X0NN5NhKR8rGseG8JkxIt6660WqlFj8NvuUlea1p
 T+FzHOa/lcjkZAa/QurEs+8b3A1HhnVsv3dMb3SHJgl4ga50q9CWdDmPaKFPtQECnZx5 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy3thn73v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:58 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 249HNKUH010626;
        Mon, 9 May 2022 17:44:57 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy3thn73t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:57 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 249HhbN9009307;
        Mon, 9 May 2022 17:44:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma04wdc.us.ibm.com with ESMTP id 3fwgd9fqv3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 249Hit4c26804620
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 May 2022 17:44:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 29819C6061;
        Mon,  9 May 2022 17:44:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 096AEC605A;
        Mon,  9 May 2022 17:44:55 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  9 May 2022 17:44:54 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [RFC v2 1/2] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
Date:   Mon,  9 May 2022 12:43:56 -0500
Message-Id: <20220509174357.5448-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509174357.5448-1-cheloha@linux.ibm.com>
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S0h120tj9cGNMpOEvhqmAzzIUvSRaDYD
X-Proofpoint-ORIG-GUID: a89uzh8YWUkg87hc4PgXJ2ELCD82FAbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_05,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205090092
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

This patch adds the opcode for the H_WATCHDOG hypercall.  It also
defines H_NOOP, a possible return code for H_WATCHDOG.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index d92a20a85395..4b4f69c35b4f 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -87,6 +87,7 @@
 #define H_P7		-60
 #define H_P8		-61
 #define H_P9		-62
+#define H_NOOP		-63
 #define H_TOO_BIG	-64
 #define H_UNSUPPORTED	-67
 #define H_OVERLAP	-68
@@ -324,7 +325,8 @@
 #define H_RPT_INVALIDATE	0x448
 #define H_SCM_FLUSH		0x44C
 #define H_GET_ENERGY_SCALE_INFO	0x450
-#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
+#define H_WATCHDOG		0x45C
+#define MAX_HCALL_OPCODE	H_WATCHDOG
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
-- 
2.27.0

