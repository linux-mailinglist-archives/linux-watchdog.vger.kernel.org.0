Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88CB452F31F
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352933AbiETShe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 14:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352920AbiETShd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 14:37:33 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB79B195939
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 11:37:30 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KHh9Jb010891;
        Fri, 20 May 2022 18:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BhHz2NWnv5Thv9erLKDeP0DPuizaqMdQMQYzzbc3UzI=;
 b=FmM70RNNLXVhsvAX89beJEA1OMr9sc+k+j5BQZqfATpsHg5BeouFXuJeH13mbXLVX7D9
 alVX3jZE2f/88IseVby7szgjxbjkZmBAZVfHF2mCSO0+11Tg4eYJU/BbN+Dgeq9YsYqs
 wzSH23n7axVqzETwPwjzTykbI+RwPkrIM57iVm0vaRemcRQ8vfe9Q5C2CQ5POkhiQDsY
 Gs9Q0YsaVNuxtNuI55SbeeGmBpJlMdhdwRrltccebrTxh0HYgENWREX2uAMBFEuvwRxY
 nXMZHAtLiyHOTsINExeCvKdizSdzTWrrtdlZmMxk8LI/NYVBdI+vYcfnJR+tDUO4ywSL nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6fmkrubn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 May 2022 18:37:13 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KIVOqM010852;
        Fri, 20 May 2022 18:37:13 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6fmkrubc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 May 2022 18:37:13 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KIJ5aU026256;
        Fri, 20 May 2022 18:37:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma02wdc.us.ibm.com with ESMTP id 3g242acmmq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 May 2022 18:37:12 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24KIbBML62456272
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 May 2022 18:37:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 161BE28058;
        Fri, 20 May 2022 18:37:11 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E5DAE28059;
        Fri, 20 May 2022 18:37:10 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Fri, 20 May 2022 18:37:10 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [PATCH v1 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
Date:   Fri, 20 May 2022 13:35:49 -0500
Message-Id: <20220520183552.33426-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220520183552.33426-1-cheloha@linux.ibm.com>
References: <20220520183552.33426-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hryAVnVsrcR7ySl-yJsTBt57DmGdRAED
X-Proofpoint-ORIG-GUID: yf9AaMuAWztZiKCeQDc3XPn6_MwSx30k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_05,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200117
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

Add the opcode for the H_WATCHDOG hypercall to hvcall.h.  While here,
add a definition for H_NOOP, a possible return code for H_WATCHDOG.

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

