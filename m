Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D7A21F4D
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 May 2019 23:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729421AbfEQVCj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 May 2019 17:02:39 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:37874 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729408AbfEQVCi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 May 2019 17:02:38 -0400
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4HL0nJM012571;
        Fri, 17 May 2019 21:02:08 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0b-002e3701.pphosted.com with ESMTP id 2sj1f516rs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 May 2019 21:02:08 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2354.austin.hpe.com (Postfix) with ESMTP id 7859EB5;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 2BE1537;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk, jerry.hoemann@hpe.com
Subject: [PATCH 3/6] watchdog/hpwdt: Have core ping watchdog.
Date:   Fri, 17 May 2019 14:59:40 -0600
Message-Id: <1558126783-4877-4-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-17_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=792 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170125
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Instead of stopping the hw timer during probe, have the core update
the timer if the timer is already running.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index 9f7a370..aa4101c 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -59,6 +59,11 @@
 /*
  *	Watchdog operations
  */
+static int hpwdt_hw_is_running(void)
+{
+	return ioread8(hpwdt_timer_con) & 0x01;
+}
+
 static int hpwdt_start(struct watchdog_device *wdd)
 {
 	int control = 0x81 | (pretimeout ? 0x4 : 0);
@@ -302,8 +307,11 @@ static int hpwdt_init_one(struct pci_dev *dev,
 	hpwdt_timer_reg = pci_mem_addr + 0x70;
 	hpwdt_timer_con = pci_mem_addr + 0x72;
 
-	/* Make sure that timer is disabled until /dev/watchdog is opened */
-	hpwdt_stop();
+	/* Have the core update running timer until user space is ready */
+	if (hpwdt_hw_is_running()) {
+		dev_info(&dev->dev, "timer is running\n");
+		set_bit(WDOG_HW_RUNNING, &hpwdt_dev.status);
+	}
 
 	/* Initialize NMI Decoding functionality */
 	retval = hpwdt_init_nmi_decoding(dev);
-- 
1.8.3.1

