Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209F05203B7
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 19:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239886AbiEIRtT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 13:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbiEIRtR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 13:49:17 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190C228B87C
        for <linux-watchdog@vger.kernel.org>; Mon,  9 May 2022 10:45:21 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249H9FKe008764;
        Mon, 9 May 2022 17:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6u6kL0gfe/p8WBe9l0z/9mCH+rySUqTdxbT3VLKLT1s=;
 b=q6Vfc+P1wQ6yOgU20MF3fGM+ig7Duuk/Ocs39i8Wb0uRy6v9lJqqo6CtpWtqCuj6W6XZ
 LDaBB3sBDGQ/rbV0mph8bB1BbEgUj8yff3Rp4GC099foAu+bp5TXDFGC61PCdiqEC88s
 e+T6KYHJdWohlrb9LrVkpvnLIMGbtAHtYJ83xjTdvINcFB31GxiNQAXOp35oIWOQs9Wm
 18eVSmkCK0x2Nw75QdW+Ii+CmdKcTqgc+k4Zc/tTW+Ij+ZzM0X1ErM7rxPv/n5DI3i6q
 TMs0JHYcm8TXMUZ2W+r9zkMLkBxO2qMC7fZ2R9EuwDKbwTG4t7J/+02KWHiS4XvC9YKy uA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy6vmgt3v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:45:00 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 249HMpPx030967;
        Mon, 9 May 2022 17:45:00 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy6vmgt3r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:45:00 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 249HhYZx029518;
        Mon, 9 May 2022 17:44:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma04dal.us.ibm.com with ESMTP id 3fwgd9um4h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 May 2022 17:44:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 249HivcX28180744
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 May 2022 17:44:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 382AC112065;
        Mon,  9 May 2022 17:44:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 01375112067;
        Mon,  9 May 2022 17:44:57 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon,  9 May 2022 17:44:56 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        nathanl@linux.ibm.com, aik@ozlabs.ru, npiggin@gmail.com,
        vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR virtual watchdog timers
Date:   Mon,  9 May 2022 12:43:57 -0500
Message-Id: <20220509174357.5448-3-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509174357.5448-1-cheloha@linux.ibm.com>
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PbZdE_wWrANpcE0tNqEVGYAcQbE8x0G4
X-Proofpoint-GUID: ydhcnx7pi5BxMhbPbhGiQaIXUZWhtKuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_05,2022-05-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090092
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

PAPR v2.12 defines a new hypercall, H_WATCHDOG.  It permits guest
control of one or more virtual watchdog timers.  The timers have
millisecond granularity and terminate the guest upon expiration.

This patch adds a new driver for these timers, "pseries-wdt".

Unfortunately, these timers defy PowerPC device conventions.  They are
not affixed to any bus, nor do they have full representation in the
device tree.  As a workaround, we represent them as platform devices.
A platform device corresponding to a given timer is registered with
the platform bus via a machine_subsys_initcall() if firmware support
for the H_WATCHDOG hypercall is detected early in boot.

For now, only a single timer is registered with the platform bus and
exposed to userspace.  In the future we could expose additional timers
if there is good reason to do so.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       |   3 +-
 arch/powerpc/platforms/pseries/firmware.c |   1 +
 arch/powerpc/platforms/pseries/setup.c    |  17 ++
 drivers/watchdog/Kconfig                  |   8 +
 drivers/watchdog/Makefile                 |   1 +
 drivers/watchdog/pseries-wdt.c            | 300 ++++++++++++++++++++++
 6 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 drivers/watchdog/pseries-wdt.c

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
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 955ff8aa1644..6e8b67ea2a33 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -14,6 +14,7 @@
 
 #include <linux/cpu.h>
 #include <linux/errno.h>
+#include <linux/platform_device.h>
 #include <linux/sched.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -169,6 +170,22 @@ static void __init fwnmi_init(void)
 #endif
 }
 
+/*
+ * Affix a device for the first timer to the platform bus if
+ * we have firmware support for the H_WATCHDOG hypercall.
+ */
+static struct platform_device *pseries_wdt_pdev;
+
+static __init int pseries_wdt_init(void)
+{
+	if (!firmware_has_feature(FW_FEATURE_WATCHDOG))
+		return 0;
+	pseries_wdt_pdev = platform_device_register_simple("pseries-wdt",
+							   0, NULL, 0);
+	return 0;
+}
+machine_subsys_initcall(pseries, pseries_wdt_init);
+
 static void pseries_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c4e82a8d863f..c5755f1e4540 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1932,6 +1932,14 @@ config MEN_A21_WDT
 
 # PPC64 Architecture
 
+config PSERIES_WDT
+	tristate "POWER Architecture Platform Watchdog Timer"
+	depends on PPC_PSERIES
+	select WATCHDOG_CORE
+	help
+	  Driver for virtual watchdog timers provided by PAPR
+	  hypervisors (e.g. pHyp, KVM).
+
 config WATCHDOG_RTAS
 	tristate "RTAS watchdog"
 	depends on PPC_RTAS
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f7da867e8782..f35660409f17 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -184,6 +184,7 @@ obj-$(CONFIG_BOOKE_WDT) += booke_wdt.o
 obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
 
 # PPC64 Architecture
+obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
 obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
 
 # S390 Architecture
diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
new file mode 100644
index 000000000000..501211bd3f26
--- /dev/null
+++ b/drivers/watchdog/pseries-wdt.c
@@ -0,0 +1,300 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/*
+ * Copyright (c) 2022 International Business Machines, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define DRV_NAME "pseries-wdt"
+
+/*
+ * The PAPR's MSB->LSB bit ordering is is 0->63.  These macros
+ * simplify defining bitfields as described in the PAPR without
+ * needing to transpose values to the more C-like 63->0 ordering.
+ */
+#define SETFIELD(_v, _b, _e)	\
+    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), (_e)))
+#define GETFIELD(_v, _b, _e)	\
+    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> PPC_BITLSHIFT(_e))
+
+/*
+ * H_WATCHDOG Hypercall Input
+ *
+ * R4: "flags":
+ *
+ *     A 64-bit value structured as follows:
+ *
+ *         Bits 0-46: Reserved (must be zero).
+ */
+#define PSERIES_WDTF_RESERVED	PPC_BITMASK(0, 46)
+
+/*
+ *         Bit 47: "leaveOtherWatchdogsRunningOnTimeout"
+ *
+ *             0  Stop outstanding watchdogs on timeout.
+ *             1  Leave outstanding watchdogs running on timeout.
+ */
+#define PSERIES_WDTF_LEAVE_OTHER	PPC_BIT(47)
+
+/*
+ *         Bits 48-55: "operation"
+ *
+ *             0x01  Start Watchdog
+ *             0x02  Stop Watchdog
+ *             0x03  Query Watchdog Capabilities
+ *             0x04  Query Watchdog LPM Requirement
+ */
+#define PSERIES_WDTF_OP(op)		SETFIELD((op), 48, 55)
+#define PSERIES_WDTF_OP_START		PSERIES_WDTF_OP(0x1)
+#define PSERIES_WDTF_OP_STOP		PSERIES_WDTF_OP(0x2)
+#define PSERIES_WDTF_OP_QUERY		PSERIES_WDTF_OP(0x3)
+#define PSERIES_WDTF_OP_QUERY_LPM	PSERIES_WDTF_OP(0x4)
+
+/*
+ *         Bits 56-63: "timeoutAction"
+ *
+ *             0x01  Hard poweroff
+ *             0x02  Hard restart
+ *             0x03  Dump restart
+ */
+#define PSERIES_WDTF_ACTION(ac)			SETFIELD(ac, 56, 63)
+#define PSERIES_WDTF_ACTION_HARD_POWEROFF	PSERIES_WDTF_ACTION(0x1)
+#define PSERIES_WDTF_ACTION_HARD_RESTART	PSERIES_WDTF_ACTION(0x2)
+#define PSERIES_WDTF_ACTION_DUMP_RESTART	PSERIES_WDTF_ACTION(0x3)
+
+/*
+ * R5: "watchdogNumber":
+ *
+ *     The target watchdog.  Watchdog numbers are 1-based.  The
+ *     maximum supported watchdog number may be obtained via the
+ *     "Query Watchdog Capabilities" operation.
+ *
+ *     This input is ignored for the "Query Watchdog Capabilities"
+ *     operation.
+ *
+ * R6: "timeoutInMs":
+ *
+ *     The timeout in milliseconds.  The minimum supported timeout may
+ *     be obtained via the "Query Watchdog Capabilities" operation.
+ *
+ *     This input is ignored for the "Stop Watchdog", "Query Watchdog
+ *     Capabilities", and "Query LPM Requirement" operations.
+ */
+
+/*
+ * H_WATCHDOG Hypercall Output
+ *
+ * R3: Return code
+ *
+ *     H_SUCCESS    The operation completed.
+ *
+ *     H_BUSY	    The hypervisor is too busy; retry the operation.
+ *
+ *     H_PARAMETER  The given "flags" are somehow invalid.  Either the
+ *                  "operation" or "timeoutAction" is invalid, or a
+ *                  reserved bit is set.
+ *
+ *     H_P2         The given "watchdogNumber" is zero or exceeds the
+ *                  supported maximum value.
+ *
+ *     H_P3         The given "timeoutInMs" is below the supported
+ *                  minimum value.
+ *
+ *     H_NOOP       The given "watchdogNumber" is already stopped.
+ *
+ *     H_HARDWARE   The operation failed for ineffable reasons.
+ *
+ *     H_FUNCTION   The H_WATCHDOG hypercall is not supported by this
+ *                  hypervisor.
+ *
+ * R4:
+ *
+ * - For the "Query Watchdog Capabilities" operation, a 64-bit
+ *   structure defined as:
+ *
+ *       Bits  0-15: The minimum supported timeout in milliseconds.
+ *       Bits 16-31: The number of watchdogs supported.
+ *       Bits 32-63: Reserved.
+ */
+#define PSERIES_WDTQ_MIN_TIMEOUT(cap)	GETFIELD((cap), 0, 15)
+#define PSERIES_WDTQ_MAX_NUMBER(cap)	GETFIELD((cap), 16, 31)
+#define PSERIES_WDTQ_RESERVED		PPC_BITMASK(32, 63)
+
+/*
+ * - For the "Query Watchdog LPM Requirement" operation:
+ *
+ *       1  The given "watchdogNumber" must be stopped prior to
+ *          suspending.
+ *
+ *       2  The given "watchdogNumber" does not have to be stopped
+ *          prior to suspending.
+ */
+#define PSERIES_WDTQL_MUST_STOP       	1
+#define PSERIES_WDTQL_NEED_NOT_STOP	2
+
+static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
+static int action_set(const char *val, const struct kernel_param *kp)
+{
+	if (strcmp(val, "hard-poweroff") == 0) {
+		action = PSERIES_WDTF_ACTION_HARD_POWEROFF;
+		return 0;
+	}
+	if (strcmp(val, "hard-restart") == 0) {
+		action = PSERIES_WDTF_ACTION_HARD_RESTART;
+		return 0;
+	}
+	if (strcmp(val, "dump-restart") == 0) {
+		action = PSERIES_WDTF_ACTION_DUMP_RESTART;
+		return 0;
+	}
+	return -EINVAL;
+}
+static const struct kernel_param_ops action_ops = { .set = action_set };
+module_param_cb(action, &action_ops, NULL, S_IRUGO);
+MODULE_PARM_DESC(action, "Action taken when watchdog expires: \"hard-poweroff\", \"hard-restart\", or \"dump-restart\" (default=\"hard-restart\")");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, S_IRUGO);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+#define WATCHDOG_TIMEOUT 60
+static unsigned int timeout = WATCHDOG_TIMEOUT;
+module_param(timeout, uint, S_IRUGO);
+MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds (default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
+
+struct pseries_wdt {
+	struct watchdog_device wd;
+	unsigned long num;		/* NB: Watchdog numbers are 1-based */
+};
+
+static int pseries_wdt_start(struct watchdog_device *wdd)
+{
+	struct device *dev = wdd->parent;
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
+	unsigned long flags, msecs;
+	long rc;
+
+	flags = action | PSERIES_WDTF_OP_START;
+	msecs = wdd->timeout * 1000UL;
+	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
+	if (rc != H_SUCCESS) {
+		dev_crit(dev, "H_WATCHDOG: %ld: failed to start timer %lu",
+			 rc, pw->num);
+	       	return -EIO;
+	}
+	return 0;
+}
+
+static int pseries_wdt_stop(struct watchdog_device *wdd)
+{
+	struct device *dev = wdd->parent;
+	struct pseries_wdt *pw = watchdog_get_drvdata(wdd);
+	long rc;
+
+	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
+	if (rc != H_SUCCESS && rc != H_NOOP) {
+		dev_crit(dev, "H_WATCHDOG: %ld: failed to stop timer %lu",
+			 rc, pw->num);
+		return -EIO;
+	}
+	return 0;
+}
+
+static struct watchdog_info pseries_wdt_info = {
+	.identity = DRV_NAME,
+	.options = WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT \
+	    | WDIOF_PRETIMEOUT,
+};
+
+static const struct watchdog_ops pseries_wdt_ops = {
+	.owner = THIS_MODULE,
+	.ping = pseries_wdt_start,
+	.start = pseries_wdt_start,
+	.stop = pseries_wdt_stop,
+};
+
+static int pseries_wdt_probe(struct platform_device *pdev)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
+	unsigned long cap, min_timeout_ms;
+	long rc;
+	struct pseries_wdt *pw;
+	int err;
+
+	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
+	if (rc != H_SUCCESS)
+		return (rc == H_FUNCTION) ? -ENODEV : -EIO;
+	cap = ret[0];
+
+	/*
+	 * If the underlying id exceeds the number of available timers
+	 * there is a bug in the platform device registration code.
+	 */
+	if (pdev->id < 0 || pdev->id >= PSERIES_WDTQ_MAX_NUMBER(cap))
+		return -ENODEV;
+
+	pw = devm_kzalloc(&pdev->dev, sizeof *pw, GFP_KERNEL);
+	if (pw == NULL)
+		return -ENOMEM;
+	pw->num = pdev->id + 1;		/* 0-based -> 1-based */
+	pw->wd.parent = &pdev->dev;
+	pw->wd.info = &pseries_wdt_info;
+	pw->wd.ops = &pseries_wdt_ops;
+	min_timeout_ms = PSERIES_WDTQ_MIN_TIMEOUT(cap);
+	pw->wd.min_timeout = roundup(min_timeout_ms, 1000) / 1000;
+	pw->wd.max_timeout = UINT_MAX;
+	watchdog_init_timeout(&pw->wd, timeout, NULL);
+	watchdog_set_nowayout(&pw->wd, nowayout);
+	watchdog_stop_on_reboot(&pw->wd);
+	watchdog_stop_on_unregister(&pw->wd);
+	watchdog_set_drvdata(&pw->wd, pw);
+
+	err = devm_watchdog_register_device(&pdev->dev, &pw->wd);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, &pw->wd);
+
+	return 0;
+}
+
+static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct watchdog_device *wd = platform_get_drvdata(pdev);
+
+	if (watchdog_active(wd))
+		return pseries_wdt_stop(wd);
+	return 0;
+}
+
+static int pseries_wdt_resume(struct platform_device *pdev)
+{
+	struct watchdog_device *wd = platform_get_drvdata(pdev);
+
+	if (watchdog_active(wd))
+		return pseries_wdt_start(wd);
+	return 0;
+}
+
+static struct platform_driver pseries_wdt_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+	},
+	.probe = pseries_wdt_probe,
+	.resume = pseries_wdt_resume,
+	.suspend = pseries_wdt_suspend,
+};
+module_platform_driver(pseries_wdt_driver);
+
+MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
+MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
+MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

