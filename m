Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D13521F45
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 May 2019 23:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbfEQVCj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 May 2019 17:02:39 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:36100 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729312AbfEQVCj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 May 2019 17:02:39 -0400
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4HL12mX004645;
        Fri, 17 May 2019 21:02:08 GMT
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
        by mx0b-002e3701.pphosted.com with ESMTP id 2sj2yngk0w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 May 2019 21:02:08 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2353.austin.hpe.com (Postfix) with ESMTP id CE1F390;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 836704B;
        Fri, 17 May 2019 21:02:07 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk, jerry.hoemann@hpe.com
Subject: [PATCH 4/6] watchdog/hpwdt: Add module parameter kdumptimeout.
Date:   Fri, 17 May 2019 14:59:41 -0600
Message-Id: <1558126783-4877-5-git-send-email-jerry.hoemann@hpe.com>
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

Instead of unconditionally stopping the watchdog timer after receipt of
a pretimeout NMI, reprogram the timeout based upon module parameter
kdumptimeout.

The provides a more flexible override than the depricated allow_kdump.

Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>
---
 drivers/watchdog/hpwdt.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index aa4101c..dc65006 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -29,7 +29,8 @@
 #define HPWDT_VERSION			"2.0.2"
 #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
 #define TICKS_TO_SECS(ticks)		((ticks) * 128 / 1000)
-#define HPWDT_MAX_TIMER			TICKS_TO_SECS(65535)
+#define HPWDT_MAX_TICKS			65535
+#define HPWDT_MAX_TIMER			TICKS_TO_SECS(HPWDT_MAX_TICKS)
 #define DEFAULT_MARGIN			30
 #define PRETIMEOUT_SEC			9
 
@@ -37,6 +38,7 @@
 static unsigned int soft_margin = DEFAULT_MARGIN;	/* in seconds */
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static bool pretimeout = IS_ENABLED(CONFIG_HPWDT_NMI_DECODING);
+static int kdumptimeout = -1;
 
 static void __iomem *pci_mem_addr;		/* the PCI-memory address */
 static unsigned long __iomem *hpwdt_nmistat;
@@ -56,6 +58,7 @@
 	{0},			/* terminate list */
 };
 
+static struct watchdog_device hpwdt_dev;
 /*
  *	Watchdog operations
  */
@@ -94,12 +97,18 @@ static int hpwdt_stop_core(struct watchdog_device *wdd)
 	return 0;
 }
 
+static void hpwdt_ping_ticks(int val)
+{
+	val = min(val, HPWDT_MAX_TICKS);
+	iowrite16(val, hpwdt_timer_reg);
+}
+
 static int hpwdt_ping(struct watchdog_device *wdd)
 {
 	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
 
 	dev_dbg(wdd->parent, "ping  watchdog 0x%08x:0x%08x\n", wdd->timeout, reload);
-	iowrite16(reload, hpwdt_timer_reg);
+	hpwdt_ping_ticks(reload);
 
 	return 0;
 }
@@ -175,7 +184,14 @@ static int hpwdt_pretimeout(unsigned int ulReason, struct pt_regs *regs)
 	if (ilo5 && !pretimeout && !mynmi)
 		return NMI_DONE;
 
-	hpwdt_stop();
+	if (kdumptimeout < 0)
+		hpwdt_stop();
+	else if (kdumptimeout == 0)
+		;
+	else {
+		unsigned int val = max((unsigned int)kdumptimeout, hpwdt_dev.timeout);
+		hpwdt_ping_ticks(SECS_TO_TICKS(val));
+	}
 
 	hex_byte_pack(panic_msg, mynmi);
 	nmi_panic(regs, panic_msg);
@@ -328,6 +344,7 @@ static int hpwdt_init_one(struct pci_dev *dev,
 		pretimeout = 0;
 	}
 	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
+	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
 
 	hpwdt_dev.parent = &dev->dev;
 	retval = watchdog_register_device(&hpwdt_dev);
@@ -342,6 +359,7 @@ static int hpwdt_init_one(struct pci_dev *dev,
 				hpwdt_dev.timeout, nowayout);
 	dev_info(&dev->dev, "pretimeout: %s.\n",
 				pretimeout ? "on" : "off");
+	dev_info(&dev->dev, "kdumptimeout: %d.\n", kdumptimeout);
 
 	if (dev->subsystem_vendor == PCI_VENDOR_ID_HP_3PAR)
 		ilo5 = true;
@@ -387,6 +405,9 @@ static void hpwdt_exit(struct pci_dev *dev)
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+module_param(kdumptimeout, int, 0444);
+MODULE_PARM_DESC(kdumptimeout, "Timeout applied for crash kernel transition in seconds");
+
 #ifdef CONFIG_HPWDT_NMI_DECODING
 module_param(pretimeout, bool, 0);
 MODULE_PARM_DESC(pretimeout, "Watchdog pretimeout enabled");
-- 
1.8.3.1

