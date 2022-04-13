Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7898C4FFBD6
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Apr 2022 18:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbiDMQ40 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 13 Apr 2022 12:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237080AbiDMQ4Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 13 Apr 2022 12:56:25 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C992669CD1
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Apr 2022 09:54:03 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DGqqDW026843;
        Wed, 13 Apr 2022 16:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/cbsdEZIKTaqYlGs9BB6XT6bqsI2HmFODOXXfay2Zr0=;
 b=b84Gz5B/HAyRm7dsBtXlwHMhAzTsOmEBh6liuXfxOtHhBQJkJ2Ul5k1TIkAxjvjwGiYx
 Vbfxe3FeuRtbZ9ulXAqezvN7aKDFg6jY+zvI36/JfgMTsOHgQwSroZMEKz9Natp5bbJV
 An4F0/UAsJASgt+viOzehONFRPa0X4v8lAnDXALZadTO+phgUyNPn5WH/DYT4E0IUusW
 U12qBGtz492TKqdy0NLgA/yWMzZ7YdEgRaw3ZvML1W/kBJv3emDX0MZDnBp1dF9BI4ou
 9elQQXvfEgrKLFzoyJiFadL9gG9z1RAPzwVtG8Q7itxwXn19sxfYgg0dOROia58YwknT 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fe0hbb6mq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:02 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23DGs2sh029611;
        Wed, 13 Apr 2022 16:54:02 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3fe0hbb6mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:02 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DGrMnv014112;
        Wed, 13 Apr 2022 16:54:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma01dal.us.ibm.com with ESMTP id 3fb1s9sq7f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Apr 2022 16:54:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 23DGrxiG61538654
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Apr 2022 16:53:59 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4E26C124054;
        Wed, 13 Apr 2022 16:53:59 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2A4A6124053;
        Wed, 13 Apr 2022 16:53:59 +0000 (GMT)
Received: from localhost (unknown [9.41.178.250])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 13 Apr 2022 16:53:59 +0000 (GMT)
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     linux-watchdog@vger.kernel.org
Cc:     bjking@linux.ibm.com, nathanl@linux.ibm.com, aik@ozlabs.ru,
        npiggin@gmail.com, vaishnavi@linux.ibm.com, wvoigt@us.ibm.com,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [RFC v1 2/2] watchdog: pseries-wdt: initial support for PAPR virtual watchdog timers
Date:   Wed, 13 Apr 2022 11:51:04 -0500
Message-Id: <20220413165104.179144-3-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220413165104.179144-1-cheloha@linux.ibm.com>
References: <20220413165104.179144-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: opMuTxSAqMtwiDYS_ZEP0geFq5uKQiVU
X-Proofpoint-ORIG-GUID: _z5SYjcVXwgPe2rWfPxQMGyKay5yZxfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_03,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130084
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
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

This patch adds a new watchdog driver for these timers, "pseries-wdt".
For now, the driver only exposes a single timer.  In the future it
could expose additional timers when more than one is available.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 drivers/watchdog/Kconfig       |   8 +
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/pseries-wdt.c | 337 +++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 drivers/watchdog/pseries-wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index c4e82a8d863f..f3e6db5bed74 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1941,6 +1941,14 @@ config WATCHDOG_RTAS
 	  To compile this driver as a module, choose M here. The module
 	  will be called wdrtas.
 
+config PSERIES_WDT
+	tristate "POWER Architecture Platform Watchdog Timer"
+	depends on PPC_PSERIES
+	select WATCHDOG_CORE
+	help
+	  Driver for virtual watchdog timers provided by PAPR
+	  hypervisors (e.g. pHyp, KVM).
+
 # S390 Architecture
 
 config DIAG288_WATCHDOG
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index f7da867e8782..3ae1f7d9f1ec 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -185,6 +185,7 @@ obj-$(CONFIG_MEN_A21_WDT) += mena21_wdt.o
 
 # PPC64 Architecture
 obj-$(CONFIG_WATCHDOG_RTAS) += wdrtas.o
+obj-$(CONFIG_PSERIES_WDT) += pseries-wdt.o
 
 # S390 Architecture
 obj-$(CONFIG_DIAG288_WATCHDOG) += diag288_wdt.o
diff --git a/drivers/watchdog/pseries-wdt.c b/drivers/watchdog/pseries-wdt.c
new file mode 100644
index 000000000000..0d22ddf12a7f
--- /dev/null
+++ b/drivers/watchdog/pseries-wdt.c
@@ -0,0 +1,337 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#define DRV_NAME "pseries-wdt"
+#define pr_fmt(fmt) DRV_NAME ": " fmt
+
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+/*
+ * The PAPR's MSB->LSB bit ordering is is 0->63.  These macros
+ * simplify defining bitfields as described in the PAPR without
+ * needing to transpose values to the more C-like 63->0 ordering.
+ */
+#define SETFIELD(_v, _b, _e)	\
+    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK(_b, _e))
+#define GETFIELD(_v, _b, _e)	\
+    (((unsigned long)(_v) & PPC_BITMASK(_b, _e)) >> PPC_BITLSHIFT(_e))
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
+static struct platform_device *pseries_wdt_pdev;
+static unsigned long action = PSERIES_WDTF_ACTION_HARD_RESTART;
+static unsigned int min_timeout = 0;
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, S_IRUGO);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
+	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+#define DEFAULT_TIMEOUT	60
+static unsigned int timeout = DEFAULT_TIMEOUT;
+module_param(timeout, uint, S_IRUGO);
+MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds "
+	"(default=" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
+
+struct pseries_wdt {
+	struct watchdog_device wd;
+	unsigned long num;		/* NB: Watchdog numbers are 1-based */
+};
+#define wd_to_pseries_wdt(ptr)	container_of(ptr, struct pseries_wdt, wd)
+
+static int pseries_wdt_start(struct watchdog_device *wdd)
+{
+	struct pseries_wdt *pw = wd_to_pseries_wdt(wdd);
+	unsigned long flags, msecs;
+	long rc;
+
+	flags = PSERIES_WDTF_OP_START | action;
+	msecs = wdd->timeout * 1000UL;
+	rc = plpar_hcall_norets(H_WATCHDOG, flags, pw->num, msecs);
+	if (rc != H_SUCCESS) {
+		pr_crit("H_WATCHDOG: %ld: failed to start timer %lu",
+			rc, pw->num);
+		return -EIO;	/* XXX What is the right errno here? */
+	}
+	return 0;
+}
+
+static int pseries_wdt_stop(struct watchdog_device *wdd)
+{
+	struct pseries_wdt *pw = wd_to_pseries_wdt(wdd);
+	long rc;
+
+	rc = plpar_hcall_norets(H_WATCHDOG, PSERIES_WDTF_OP_STOP, pw->num);
+	if (rc != H_SUCCESS) {
+		pr_crit("H_WATCHDOG: %ld: failed to stop timer %lu",
+			rc, pw->num);
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
+	struct device *dev = &pdev->dev;
+	struct pseries_wdt *pw;
+	int err = 0;
+
+	pw = devm_kzalloc(dev, sizeof *pw, GFP_KERNEL);
+	if (pw == NULL)
+		return -ENOMEM;
+
+	pw->num = 1;
+
+	pw->wd.info = &pseries_wdt_info;
+	pw->wd.ops = &pseries_wdt_ops;
+	pw->wd.min_timeout = min_timeout;
+	watchdog_init_timeout(&pw->wd, timeout, NULL);
+	watchdog_set_nowayout(&pw->wd, nowayout);
+	watchdog_stop_on_reboot(&pw->wd);
+	watchdog_stop_on_unregister(&pw->wd);
+	watchdog_set_drvdata(&pw->wd, pw);
+
+	/* XXX Is it appropriate to call devm_kfree() on registration error? */
+	err = devm_watchdog_register_device(dev, &pw->wd);
+	if (err) {
+		devm_kfree(dev, pw);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, pw);
+
+	/*
+	 * XXX Should we print something to the console about the new
+	 * pseudo-device?  If so, what?
+	 */
+	pr_info("watchdog%d probed\n", pw->wd.id);
+	return 0;
+}
+
+static int pseries_wdt_remove(struct platform_device *pdev)
+{
+	struct pseries_wdt *pw = platform_get_drvdata(pdev);
+
+	/* XXX Should we say something about removing the pseudo-device? */
+	pr_info("watchdog%d removed\n", pw->wd.id);
+
+	/*
+	 * XXX Calling watchdog_unregister_device() here causes the kernel
+	 * to panic later.  What is the proper way to clean up a watchdog
+	 * device at module unload time?
+	 */
+#if 0
+	watchdog_unregister_device(&pw->wd);
+#endif
+	return 0;
+}
+
+static int pseries_wdt_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct pseries_wdt *w;
+
+	w = platform_get_drvdata(pdev);
+	return pseries_wdt_stop(&w->wd);
+}
+
+static int pseries_wdt_resume(struct platform_device *pdev)
+{
+	struct pseries_wdt *w;
+
+	w = platform_get_drvdata(pdev);
+	return pseries_wdt_start(&w->wd);
+}
+
+static struct platform_driver pseries_wdt_driver = {
+	.probe = pseries_wdt_probe,
+	.remove	= pseries_wdt_remove,
+	.suspend = pseries_wdt_suspend,
+	.resume = pseries_wdt_resume,
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+	},
+};
+
+static int __init pseries_wdt_init_module(void)
+{
+	unsigned long ret[PLPAR_HCALL_BUFSIZE] = { 0 };
+	unsigned long cap;
+	long rc;
+	int err;
+
+	rc = plpar_hcall(H_WATCHDOG, ret, PSERIES_WDTF_OP_QUERY);
+	if (rc != H_SUCCESS) {
+		if (rc == H_FUNCTION) {
+			pr_info("hypervisor does not support H_WATCHDOG");
+			return -ENODEV;
+		}
+		pr_err("H_WATCHDOG: %ld: capability query failed", rc);
+		return -EIO;
+	}
+	cap = ret[0];
+	min_timeout = roundup(PSERIES_WDTQ_MIN_TIMEOUT(cap), 1000) / 1000;
+	pr_info("hypervisor supports %lu timer(s), %lums minimum timeout",
+		PSERIES_WDTQ_MAX_NUMBER(cap), PSERIES_WDTQ_MIN_TIMEOUT(cap));
+
+	err = platform_driver_register(&pseries_wdt_driver);
+	if (err)
+		return err;
+
+	/*
+	 * For the moment we only expose the first timer to userspace.
+	 * In the future we could expose more.
+	 */
+	pseries_wdt_pdev = platform_device_register_simple(DRV_NAME,
+							   -1, NULL, 0);
+	if (IS_ERR(pseries_wdt_pdev)) {
+		platform_driver_unregister(&pseries_wdt_driver);
+		return PTR_ERR(pseries_wdt_pdev);
+	}
+
+	return 0;
+}
+
+static void __exit pseries_wdt_cleanup_module(void)
+{
+	platform_device_unregister(pseries_wdt_pdev);
+	platform_driver_unregister(&pseries_wdt_driver);
+}
+
+module_init(pseries_wdt_init_module);
+module_exit(pseries_wdt_cleanup_module);
+
+MODULE_AUTHOR("Alexey Kardashevskiy <aik@ozlabs.ru>");
+MODULE_AUTHOR("Scott Cheloha <cheloha@linux.ibm.com>");
+MODULE_DESCRIPTION("POWER Architecture Platform Watchdog Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.27.0

