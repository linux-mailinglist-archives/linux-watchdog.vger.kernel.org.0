Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535E830DEC0
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 16:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbhBCPx7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 10:53:59 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:7796 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234547AbhBCPhE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 10:37:04 -0500
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 113FScLM028909;
        Wed, 3 Feb 2021 15:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pps0720;
 bh=TjXGFSjIrsF9D6J/rfFiujmap1Ho+x7h94Jx7uPXIB4=;
 b=TST+lD1hEnN/Mx2H0PyzZvh432yGDwHvVPHDt9JAbaBLbWH1/fFRZ4j5PKr0dPDBmFPz
 kqKSDw1OAQxFjh1ciAzNUeGPGh7vIBo7imDwMiSfEvQsaW/mfQTtKIRj3Uqw4+Ffi9Oa
 moULlOfPkGXn4DqAV2HahXWT97u6NnRg6JO/13kA1v7eTt1cGiMXu+h6cGqk97zYEYcz
 xQN7StX96EVMG1+4oTc3PiMWD5Mmr7IZQzA4OIi7GXUZ7WNERlEksVK695Mq0/tyP5rD
 PC07m1amZehE9PYVI41cHJ+Wal5KGsIjxVZs5PNNsopHdhA6OOJVRnK5eKHR3EkWqSIS Dg== 
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com [15.241.140.78])
        by mx0b-002e3701.pphosted.com with ESMTP id 36frrkk5y1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Feb 2021 15:36:07 +0000
Received: from g4t3433.houston.hpecorp.net (g4t3433.houston.hpecorp.net [16.208.49.245])
        by g4t3425.houston.hpe.com (Postfix) with ESMTP id 59A28AC;
        Wed,  3 Feb 2021 15:36:07 +0000 (UTC)
Received: from hpnsw4892.rose.rdlabs.hpecorp.net (hpnsw4892.rose.rdlabs.hpecorp.net [15.116.51.176])
        by g4t3433.houston.hpecorp.net (Postfix) with ESMTP id D624846;
        Wed,  3 Feb 2021 15:36:06 +0000 (UTC)
From:   JP Ertola <jp.ertola@hpe.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Cc:     JP Ertola <jp.ertola@hpe.com>
Subject: [PATCH v4] Extend watchdog timeout during kernel panic.
Date:   Wed,  3 Feb 2021 07:36:02 -0800
Message-Id: <20210203153602.82063-1-jp.ertola@hpe.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-03_06:2021-02-03,2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030097
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If the watchdog timeout is set such that the crash kernel does not
have time to collect a coredump and the crash kernel is not equipped to
ping the watchdog timer itself, then a kernel coredump will not be collected
before the watchdog fires. This change registers a panic notifier and
callback so the watchdog timeout can be extended if a kernel panic occurs.
This timeout extension would give the crash kernel enough time to collect
a coredump before the CPU resets. The watchdog timeout is extended if and only
if a crash kernel image is loaded in memory, the watchdog is active at the
time of the panic, and the kconfig setting is set.

A Kconfig option has been added to configure the timeout duration at
compile-time. Default is zero seconds.

Signed-off-by: JP Ertola <jp.ertola@hpe.com>
---
v4: Remove optional callback mechanism alltogether. I agree with Guenter, 
not widely used.
v3: Fix logic so timeout extension is not longer than wdd->max_timeout
v2: Remove dead code and comments.
 drivers/watchdog/Kconfig        | 13 ++++++
 drivers/watchdog/watchdog_dev.c | 80 ++++++++++++++++++++++++++++++++-
 include/linux/watchdog.h        |  1 +
 3 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index fd7968635e6d..f1055985e100 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -141,6 +141,19 @@ comment "Watchdog Device Drivers"
 
 # Architecture Independent
 
+config DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT
+	int "Default timeout for watchdog timer before crash kernel starts (seconds)"
+	default 0
+	help
+	  This option allows an extended timeout to be used for the watchdog when
+	  the kernel panics and a crash kernel is about to start. This is helpful
+	  when the existing WDT timeout value is less than the time required for
+	  crash kernel to run and the crash kernel is unable to handle the
+	  the watchdog itself. The timeout extension happens last in chain of
+	  kernel panic handler callbacks just in case another panic handler
+	  hangs unexpectedly. When this value is set to 0, the watchdog timeout
+	  will not be changed.
+
 config SOFT_WATCHDOG
 	tristate "Software watchdog"
 	select WATCHDOG_CORE
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..cf91c08b0606 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -34,6 +34,7 @@
 #include <linux/init.h>		/* For __init/__exit/... */
 #include <linux/hrtimer.h>	/* For hrtimers */
 #include <linux/kernel.h>	/* For printk/panic/... */
+#include <linux/kexec.h>	/* For checking if crash kernel is loaded */
 #include <linux/kthread.h>	/* For kthread_work */
 #include <linux/miscdevice.h>	/* For handling misc devices */
 #include <linux/module.h>	/* For module stuff/... */
@@ -82,6 +83,8 @@ static bool handle_boot_enabled =
 
 static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
 
+static unsigned int wdt_panic_timeout = CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT;
+
 static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
 {
 	return ktime_after(ktime_get(), data->open_deadline);
@@ -658,6 +661,59 @@ static int watchdog_ioctl_op(struct watchdog_device *wdd, unsigned int cmd,
  *	off the watchdog (if 'nowayout' is not set).
  */
 
+static int watchdog_panic_notifier(struct notifier_block *nb,
+	unsigned long code, void *data)
+{
+	struct watchdog_device *wdd;
+	int ret = 0;
+	unsigned int time_out = wdt_panic_timeout;
+
+	if (wdt_panic_timeout == 0)
+		return NOTIFY_DONE;
+
+	wdd = container_of(nb, struct watchdog_device, panic_nb);
+
+	if (watchdog_timeout_invalid(wdd, wdt_panic_timeout)) {
+		time_out = min(wdt_panic_timeout, wdd->max_timeout);
+		pr_err("watchdog%d: timeout extension value "
+			" invalid. Falling back to %d seconds\n", wdd->id,
+			time_out);
+	}
+
+	if (kexec_crash_image && watchdog_active(wdd)) {
+		int ping_ret = 0;
+
+		pr_info("watchdog%d: Extending watchdog timeout to "
+			"%d seconds\n", wdd->id, time_out);
+
+		ret = watchdog_set_timeout(wdd, time_out);
+
+		if (ret) {
+			pr_err("watchdog%d: Unable to extend watchdog timeout "
+				"before starting crash kernel (%d)",
+				wdd->id, ret);
+		}
+
+		/* Many watchdog implementations will reset the timer
+		* when the timeout is changed, but ping again to be
+		* safe.
+		*/
+		if (wdd->ops->ping) {
+			ping_ret = wdd->ops->ping(wdd);
+			if (ping_ret) {
+				pr_warn("watchdog%d: Unable to ping "
+					"watchdog before starting "
+					"crash kernel (%d)\n",
+					wdd->id, ping_ret);
+			}
+		}
+
+
+	}
+
+	return notifier_from_errno(ret);
+}
+
 static ssize_t watchdog_write(struct file *file, const char __user *data,
 						size_t len, loff_t *ppos)
 {
@@ -1118,8 +1174,25 @@ int watchdog_dev_register(struct watchdog_device *wdd)
 		return ret;
 
 	ret = watchdog_register_pretimeout(wdd);
-	if (ret)
+	if (ret) {
 		watchdog_cdev_unregister(wdd);
+		return ret;
+	}
+
+	/*
+	 * Setting panic_nb priority to minimum ensures the watchdog device
+	 * panic callback runs last in the chain of kernel panic callbacks.
+	 * This way, the watchdog device will still fire in the event another
+	 * panic callback hangs.
+	 */
+	wdd->panic_nb.priority = INT_MIN;
+	wdd->panic_nb.notifier_call = watchdog_panic_notifier;
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list,
+					&wdd->panic_nb);
+	if (ret)
+		pr_err("watchdog%d: Cannot register panic notifier (%d)\n",
+			wdd->id, ret);
 
 	return ret;
 }
@@ -1228,3 +1301,8 @@ module_param(open_timeout, uint, 0644);
 MODULE_PARM_DESC(open_timeout,
 	"Maximum time (in seconds, 0 means infinity) for userspace to take over a running watchdog (default="
 	__MODULE_STRING(CONFIG_WATCHDOG_OPEN_TIMEOUT) ")");
+
+module_param(wdt_panic_timeout, uint, 0444);
+MODULE_PARM_DESC(wdt_panic_timeout,
+	"Watchdog timeout extension duration upon kernel panic. (default="
+	__MODULE_STRING(CONFIG_DEFAULT_WATCHDOG_CRASH_KERNEL_TIMEOUT) " seconds)");
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 9b19e6bb68b5..bc7e6e8aa7ab 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -107,6 +107,7 @@ struct watchdog_device {
 	unsigned int max_hw_heartbeat_ms;
 	struct notifier_block reboot_nb;
 	struct notifier_block restart_nb;
+	struct notifier_block panic_nb;
 	void *driver_data;
 	struct watchdog_core_data *wd_data;
 	unsigned long status;
-- 
2.29.0

