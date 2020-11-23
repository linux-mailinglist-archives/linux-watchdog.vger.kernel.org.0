Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAC82BFE1A
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 03:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgKWCJJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 21:09:09 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:22120 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726883AbgKWCJI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 21:09:08 -0500
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AN287BB005147;
        Mon, 23 Nov 2020 02:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=g1Ppm9Sf5jSt57qR+VOpWGKclrgw88xXc0p8R5zZegs=;
 b=ONKc3smTliBoP9rkKr+cauayqKSkWZAJRVcY0LMmkO1iieeuVN9pJjSJj2k7x3IiCEzZ
 tt5E/EPnKfuIiSsAoSY1APj2YrkgEgNh88IUR6pRRqEYdyZ69iBhQTelBnD+2LahbGvn
 JHbflRzFWHaePrtV2rQoP0IbvbqFyxYzsLxekHdJF1SCSJ/Le7o4qx5mFDETVCog7GlX
 zfxar0Hp5uzlgZ+QGpatZxy8gLrQFrtYaublCTbl722BY+reYXYrdzitPJb67z5pRma4
 P/y6Pe1ogWedzzrMwXJ+f7E+XLb+9pbsjPFvHvowIq9ZSqW0e9zfCvK7Je2Bi3zFtvw4 GA== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com [15.241.140.73])
        by mx0a-002e3701.pphosted.com with ESMTP id 34ycyfdau1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Nov 2020 02:08:53 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3427.houston.hpe.com (Postfix) with ESMTP id A8B6266;
        Mon, 23 Nov 2020 02:08:52 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 5ED554B;
        Mon, 23 Nov 2020 02:08:52 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     kasong@redhat.com, linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 2/2] watchdog/hpwdt: Reflect changes
Date:   Sun, 22 Nov 2020 19:08:40 -0700
Message-Id: <1606097320-56762-3-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
References: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-22_16:2020-11-20,2020-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011230012
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Bump driver number to reflect recent changes.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index eeb4df2..cbd1498 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -23,7 +23,7 @@
 #include <asm/nmi.h>
 #include <linux/crash_dump.h>
 
-#define HPWDT_VERSION			"2.0.3"
+#define HPWDT_VERSION			"2.0.4"
 #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
 #define TICKS_TO_SECS(ticks)		((ticks) * 128 / 1000)
 #define HPWDT_MAX_TICKS			65535
-- 
1.8.3.1

