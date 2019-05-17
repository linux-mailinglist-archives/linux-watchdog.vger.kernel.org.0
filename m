Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEB121F43
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 May 2019 23:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbfEQVCe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 May 2019 17:02:34 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:44328 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729312AbfEQVCb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 May 2019 17:02:31 -0400
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4HL0uWF014001;
        Fri, 17 May 2019 21:02:07 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 2sj1h3s65h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 May 2019 21:02:07 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id 211B463;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id C689E44;
        Fri, 17 May 2019 21:02:06 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk, jerry.hoemann@hpe.com
Subject: [PATCH 2/6] watchdog/hpwdt: Advertize max_hw_heartbeat_ms
Date:   Fri, 17 May 2019 14:59:39 -0600
Message-Id: <1558126783-4877-3-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-17_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170125
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Set max_hw_heartbeat_ms instead of max_timeout so that user client can
set timeout range in excess of what the underlying hardware supports.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 8c49f13..9f7a370 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -62,9 +62,9 @@
 static int hpwdt_start(struct watchdog_device *wdd)
 {
 	int control = 0x81 | (pretimeout ? 0x4 : 0);
-	int reload = SECS_TO_TICKS(wdd->timeout);
+	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
 
-	dev_dbg(wdd->parent, "start watchdog 0x%08x:0x%02x\n", reload, control);
+	dev_dbg(wdd->parent, "start watchdog 0x%08x:0x%08x:0x%02x\n", wdd->timeout, reload, control);
 	iowrite16(reload, hpwdt_timer_reg);
 	iowrite8(control, hpwdt_timer_con);
 
@@ -91,9 +91,9 @@ static int hpwdt_stop_core(struct watchdog_device *wdd)
 
 static int hpwdt_ping(struct watchdog_device *wdd)
 {
-	int reload = SECS_TO_TICKS(wdd->timeout);
+	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
 
-	dev_dbg(wdd->parent, "ping  watchdog 0x%08x\n", reload);
+	dev_dbg(wdd->parent, "ping  watchdog 0x%08x:0x%08x\n", wdd->timeout, reload);
 	iowrite16(reload, hpwdt_timer_reg);
 
 	return 0;
@@ -208,9 +208,9 @@ static int hpwdt_pretimeout(unsigned int ulReason, struct pt_regs *regs)
 	.info		= &ident,
 	.ops		= &hpwdt_ops,
 	.min_timeout	= 1,
-	.max_timeout	= HPWDT_MAX_TIMER,
 	.timeout	= DEFAULT_MARGIN,
 	.pretimeout	= PRETIMEOUT_SEC,
+	.max_hw_heartbeat_ms	= HPWDT_MAX_TIMER * 1000,
 };
 
 
-- 
1.8.3.1

