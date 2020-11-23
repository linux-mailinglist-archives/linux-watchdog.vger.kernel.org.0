Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1288C2BFE1B
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 03:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgKWCJJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 21:09:09 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:51630 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726711AbgKWCJI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 21:09:08 -0500
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AN2123m009997;
        Mon, 23 Nov 2020 02:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pps0720;
 bh=saK8Mgx0V8J6e5TM3dvAqd2zSTb4L7wC/nzpDqq/2Iw=;
 b=YwKnKBdklQf3Lxfn55+JaF31ZKM8IDLEB7c/0GlQAd0sBxNepvxMxU/LeKVq1VvqO8rm
 KQu8BIVwMNLr2PZTKbq0EsWEyuGZucQLOB8Q7fKU5bDUSJ5wlQ1xFSPx7KeKi6xtXrx3
 0cEbGW9uEl5q09WnZqo167KZSfDVrNjHF5wmRvRu8j+xtLxY13I02ICi+tAYFsUd9VYf
 qxi0ncOhEneuSMGVragebIFm3LbKuN66AL+wWa10+cn9x9+8B16RNaH1fxcvwZgzwtda
 GoTYJMOZNH+xQScXRzyq8s3D3IyRrsDqiGk8i4Ip/mmmXtWhpCYgzfqR3XFrQ3y4EHtF rw== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 34yc8wnemx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 23 Nov 2020 02:08:53 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 5383C55;
        Mon, 23 Nov 2020 02:08:52 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 13D974C;
        Mon, 23 Nov 2020 02:08:52 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     kasong@redhat.com, linux-watchdog@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 1/2] watchdog/hpwdt: Disable NMI in Crash Kernel
Date:   Sun, 22 Nov 2020 19:08:39 -0700
Message-Id: <1606097320-56762-2-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
References: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-22_16:2020-11-20,2020-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011230011
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

NMIs received during the crash path are problematic as hpwdt_pretimeout
handling of the NMI would cause a reentry into kdump.

The situation is complicated in that I/O errors can be signaled as NMI
circumventing hpwdt_pretimeout's attempt to not claim NMI not associated
with either the WDT or the iLO NMI switch.  These NMI can additionally
cause a secondary NMI which cause the system to hang.

By disabling pretimeout and hpwdtimeout in crash path we both reduce
the risk of receiving an NMI and simuletaneously leave the WDT running
(if it was already in use) to allow the WDT to break the system out of
hangs by the WDT reset.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 7d34bcf..eeb4df2 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 #include <linux/watchdog.h>
 #include <asm/nmi.h>
+#include <linux/crash_dump.h>
 
 #define HPWDT_VERSION			"2.0.3"
 #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
@@ -334,6 +335,11 @@ static int hpwdt_init_one(struct pci_dev *dev,
 	watchdog_set_nowayout(&hpwdt_dev, nowayout);
 	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
 
+	if (is_kdump_kernel()) {
+		pretimeout = 0;
+		kdumptimeout = 0;
+	}
+
 	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
 		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
 		pretimeout = 0;
-- 
1.8.3.1

