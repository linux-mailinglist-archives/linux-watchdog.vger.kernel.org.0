Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22DC4FFBCE
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Apr 2022 18:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbiDMQ4Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 12:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237084AbiDMQ4Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 12:56:24 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0A969703
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 09:54:03 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DGqqdZ031049;
        Wed, 13 Apr 2022 16:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9JlWJyf3cgiwNSPbge/+L8MYwsmorlprkV1xU3w0KM0=;
 b=BH3ODB2VklTmAMG5e2xmemLYAsW/WREimE+C7BItTmQacmEGROdigV4j1FEk1Q21lAjL
 EMY5MlcYKf1wydi4sk9u2o9V2lovts4qO3xpvseB7nJ3JgTzraEMNgCHuKP1Cz47jxlM
 B5nrXfTyQSHP1aTNPwW7qrOvrZCyl3uV9jEB4aRes1GAs8lDp5Xp7ZEXHOCJahM35tpe
 g87v/PzfExOP4VcMDmR+IL/MDoKzK5wMx/tg4EpmjXmFIxmZU9VdS3HW6d353fgEa54x
 8SkE+DZMLaNdEZE5V1EYW27ZiFfVZxzJML6gjg5Qygobt4kNI+qXsxzLNwhrH3r/iLXb rw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fe1xn8r0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:01 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23DGs1tS008309;
        Wed, 13 Apr 2022 16:54:01 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fe1xn8r08-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:01 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DGS9Re009485;
        Wed, 13 Apr 2022 16:54:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma02dal.us.ibm.com with ESMTP id 3fb1sa1pnr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23DGrw2T25952740
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 16:53:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E7BAAC605B;
        Wed, 13 Apr 2022 16:53:57 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CBCF8C6055;
        Wed, 13 Apr 2022 16:53:57 +0000 (GMT)
Received: from localhost (unknown [9.41.178.250])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 13 Apr 2022 16:53:57 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [RFC v1 1/2] powerpc/pseries: hvcall.h: add definitions for H_WATCHDOG hypercall
Date:   Wed, 13 Apr 2022 11:51:03 -0500
Message-Id: <20220413165104.179144-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413165104.179144-1-cheloha@linux.ibm.com>
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hMnQGC50tg2dOrRYWb_kIPOlHLHjZlTk
X-Proofpoint-ORIG-GUID: f7_gHWRr7f_6BfjORwPPg_zS8bw3426S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_03,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130084
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

A future revision of the PAPR will define a new hypercall, H_WATCHDOG.
The hypercall will permit guest control of one or more virtual
watchdog timers.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index d92a20a85395..992fc4b88cb0 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -324,7 +324,8 @@
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

