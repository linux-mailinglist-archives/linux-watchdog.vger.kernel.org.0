Return-Path: <linux-watchdog+bounces-3276-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658EA83F5D
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 11:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69DB19E4586
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Apr 2025 09:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4045A268684;
	Thu, 10 Apr 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Bi8l/MZ2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E052686AB;
	Thu, 10 Apr 2025 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278659; cv=none; b=C1YIgVZZMyeL2yWby1Qu5jq0CVeTwgeOQAZfGNQjA2AjJE4/NaIy8rK9UCf/PUk43Aod3gbk1DDdk7oMO9BXuKIbrcXHIm+n8mGHm5hCopoRQnXVZreXiEocfNV6VPghycVr1CBpM8GYCu/10S108EKz5uKwz6zwOXOnEEmN/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278659; c=relaxed/simple;
	bh=9zwCt4WL9DhM7iAXo1kLqlNoBK9UgBmf+m+uUAiOiwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Abwu1idHmXVeV8spI8vNfq4d+nNj/wWNCC3bSH6DKH80Ph/sLQnF38bAmvYmvk8NjzCkgmpNo9yd02rOsjhPnGhk8mZUXPDgKnsBSp/DBAaBhJ4J0KKVlJ9cIFDtGeVZu5q/YYxvf1FRN0XXa7bwm0U+NgYGTieWhjvN+X0w6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Bi8l/MZ2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5p51r021780;
	Thu, 10 Apr 2025 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=gEDQnPFlGqTWD9lpPPKxCFAgqSawbto+ETElrbgJq
	BM=; b=Bi8l/MZ27LaY9ChO5gKHv+WJBaALCPwbEOoXo81iPthMrruyDnaFiPpHF
	LWCg9wbGEewVowrMB9QxzNmQrhMwX+S0fx+lpodpky6ezaObZaqNRMY1MJSTBnxv
	kQbfF2s3E8NxXy3ETUePBowlPfP9BMb4h3GRWBadYoog4v7bvmmI1LyJFH6525jm
	Kb412OLVArbYayro1jDbeRo8r5UVG6gSkA6sETZKzflBo8pF8pY6/voAjZsHTVWu
	3IVtbQkWUIqXQZ8oWi/ECQgNf5KFLeL0/C0d1wCyX6Q1853Rd7hzxJI6zGPQwNcZ
	iwgMnLW6oJmNS2KdzB1XatZA56Hlw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qbw2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:50:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A8DFRj011062;
	Thu, 10 Apr 2025 09:50:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7ywk2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:50:40 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53A9oa2v46334368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 09:50:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE23E2004D;
	Thu, 10 Apr 2025 09:50:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B46420043;
	Thu, 10 Apr 2025 09:50:36 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 09:50:36 +0000 (GMT)
From: Heiko Carstens <hca@linux.ibm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: [PATCH] watchdog: diag288_wdt: Implement module autoload
Date: Thu, 10 Apr 2025 11:50:36 +0200
Message-ID: <20250410095036.1525057-1-hca@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xszypIP9zJbmL25bdU133rbcGlkcxxoB
X-Proofpoint-ORIG-GUID: xszypIP9zJbmL25bdU133rbcGlkcxxoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100070

The s390 specific diag288_wdt watchdog driver makes use of the virtual
watchdog timer, which is available in most machine configurations.
If executing the diagnose instruction with subcode 0x288 results in an
exception the watchdog timer is not available, otherwise it is available.

In order to allow module autoload of the diag288_wdt module, move the
detection of the virtual watchdog timer to early boot code, and provide
its availability as a cpu feature.

This allows to make use of module_cpu_feature_match() to automatically load
the module iff the virtual watchdog timer is available.

Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Tested-by: Mete Durlu <meted@linux.ibm.com>
Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/boot/startup.c           | 17 ++++++++++
 arch/s390/include/asm/cpufeature.h |  1 +
 arch/s390/include/asm/diag288.h    | 41 +++++++++++++++++++++++
 arch/s390/include/asm/machine.h    |  1 +
 arch/s390/kernel/cpufeature.c      |  5 +++
 drivers/watchdog/diag288_wdt.c     | 53 ++----------------------------
 6 files changed, 68 insertions(+), 50 deletions(-)
 create mode 100644 arch/s390/include/asm/diag288.h

diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
index 06316fb8e0fa..da8337e63a3e 100644
--- a/arch/s390/boot/startup.c
+++ b/arch/s390/boot/startup.c
@@ -6,6 +6,7 @@
 #include <asm/boot_data.h>
 #include <asm/extmem.h>
 #include <asm/sections.h>
+#include <asm/diag288.h>
 #include <asm/maccess.h>
 #include <asm/machine.h>
 #include <asm/sysinfo.h>
@@ -71,6 +72,20 @@ static void detect_machine_type(void)
 		set_machine_feature(MFEATURE_VM);
 }
 
+static void detect_diag288(void)
+{
+	/* "BEGIN" in EBCDIC character set */
+	static const char cmd[] = "\xc2\xc5\xc7\xc9\xd5";
+	unsigned long action, len;
+
+	action = machine_is_vm() ? (unsigned long)cmd : LPARWDT_RESTART;
+	len = machine_is_vm() ? sizeof(cmd) : 0;
+	if (__diag288(WDT_FUNC_INIT, MIN_INTERVAL, action, len))
+		return;
+	__diag288(WDT_FUNC_CANCEL, 0, 0, 0);
+	set_machine_feature(MFEATURE_DIAG288);
+}
+
 static void detect_diag9c(void)
 {
 	unsigned int cpu;
@@ -519,6 +534,8 @@ void startup_kernel(void)
 	detect_facilities();
 	detect_diag9c();
 	detect_machine_type();
+	/* detect_diag288() needs machine type */
+	detect_diag288();
 	cmma_init();
 	sanitize_prot_virt_host();
 	max_physmem_end = detect_max_physmem_end();
diff --git a/arch/s390/include/asm/cpufeature.h b/arch/s390/include/asm/cpufeature.h
index e08169bd63a5..6c6a99660e78 100644
--- a/arch/s390/include/asm/cpufeature.h
+++ b/arch/s390/include/asm/cpufeature.h
@@ -15,6 +15,7 @@ enum {
 	S390_CPU_FEATURE_MSA,
 	S390_CPU_FEATURE_VXRS,
 	S390_CPU_FEATURE_UV,
+	S390_CPU_FEATURE_D288,
 	MAX_CPU_FEATURES
 };
 
diff --git a/arch/s390/include/asm/diag288.h b/arch/s390/include/asm/diag288.h
new file mode 100644
index 000000000000..5e1b43cea9d6
--- /dev/null
+++ b/arch/s390/include/asm/diag288.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_S390_DIAG288_H
+#define _ASM_S390_DIAG288_H
+
+#include <asm/asm-extable.h>
+#include <asm/types.h>
+
+#define MIN_INTERVAL 15	    /* Minimal time supported by diag288 */
+#define MAX_INTERVAL 3600   /* One hour should be enough - pure estimation */
+
+#define WDT_DEFAULT_TIMEOUT 30
+
+/* Function codes - init, change, cancel */
+#define WDT_FUNC_INIT 0
+#define WDT_FUNC_CHANGE 1
+#define WDT_FUNC_CANCEL 2
+#define WDT_FUNC_CONCEAL 0x80000000
+
+/* Action codes for LPAR watchdog */
+#define LPARWDT_RESTART 0
+
+static inline int __diag288(unsigned int func, unsigned int timeout,
+			    unsigned long action, unsigned int len)
+{
+	union register_pair r1 = { .even = func, .odd = timeout, };
+	union register_pair r3 = { .even = action, .odd = len, };
+	int rc = -EINVAL;
+
+	asm volatile(
+		"	diag	%[r1],%[r3],0x288\n"
+		"0:	lhi	%[rc],0\n"
+		"1:"
+		EX_TABLE(0b, 1b)
+		: [rc] "+d" (rc)
+		: [r1] "d" (r1.pair), [r3] "d" (r3.pair)
+		: "cc", "memory");
+	return rc;
+}
+
+#endif /* _ASM_S390_DIAG288_H */
diff --git a/arch/s390/include/asm/machine.h b/arch/s390/include/asm/machine.h
index 54478caa5237..8abe5afdbfc4 100644
--- a/arch/s390/include/asm/machine.h
+++ b/arch/s390/include/asm/machine.h
@@ -18,6 +18,7 @@
 #define MFEATURE_VM		7
 #define MFEATURE_KVM		8
 #define MFEATURE_LPAR		9
+#define MFEATURE_DIAG288	10
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/s390/kernel/cpufeature.c b/arch/s390/kernel/cpufeature.c
index 1b2ae42a0c15..76210f001028 100644
--- a/arch/s390/kernel/cpufeature.c
+++ b/arch/s390/kernel/cpufeature.c
@@ -5,11 +5,13 @@
 
 #include <linux/cpufeature.h>
 #include <linux/bug.h>
+#include <asm/machine.h>
 #include <asm/elf.h>
 
 enum {
 	TYPE_HWCAP,
 	TYPE_FACILITY,
+	TYPE_MACHINE,
 };
 
 struct s390_cpu_feature {
@@ -21,6 +23,7 @@ static struct s390_cpu_feature s390_cpu_features[MAX_CPU_FEATURES] = {
 	[S390_CPU_FEATURE_MSA]	= {.type = TYPE_HWCAP, .num = HWCAP_NR_MSA},
 	[S390_CPU_FEATURE_VXRS]	= {.type = TYPE_HWCAP, .num = HWCAP_NR_VXRS},
 	[S390_CPU_FEATURE_UV]	= {.type = TYPE_FACILITY, .num = 158},
+	[S390_CPU_FEATURE_D288]	= {.type = TYPE_MACHINE, .num = MFEATURE_DIAG288},
 };
 
 /*
@@ -38,6 +41,8 @@ int cpu_have_feature(unsigned int num)
 		return !!(elf_hwcap & BIT(feature->num));
 	case TYPE_FACILITY:
 		return test_facility(feature->num);
+	case TYPE_MACHINE:
+		return test_machine_feature(feature->num);
 	default:
 		WARN_ON_ONCE(1);
 		return 0;
diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index 76dffc89c641..887d5a6c155b 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -29,26 +29,13 @@
 #include <linux/watchdog.h>
 #include <asm/machine.h>
 #include <asm/ebcdic.h>
+#include <asm/diag288.h>
 #include <asm/diag.h>
 #include <linux/io.h>
 
 #define MAX_CMDLEN 240
 #define DEFAULT_CMD "SYSTEM RESTART"
 
-#define MIN_INTERVAL 15     /* Minimal time supported by diag88 */
-#define MAX_INTERVAL 3600   /* One hour should be enough - pure estimation */
-
-#define WDT_DEFAULT_TIMEOUT 30
-
-/* Function codes - init, change, cancel */
-#define WDT_FUNC_INIT 0
-#define WDT_FUNC_CHANGE 1
-#define WDT_FUNC_CANCEL 2
-#define WDT_FUNC_CONCEAL 0x80000000
-
-/* Action codes for LPAR watchdog */
-#define LPARWDT_RESTART 0
-
 static char wdt_cmd[MAX_CMDLEN] = DEFAULT_CMD;
 static bool conceal_on;
 static bool nowayout_info = WATCHDOG_NOWAYOUT;
@@ -75,22 +62,8 @@ static char *cmd_buf;
 static int diag288(unsigned int func, unsigned int timeout,
 		   unsigned long action, unsigned int len)
 {
-	union register_pair r1 = { .even = func, .odd = timeout, };
-	union register_pair r3 = { .even = action, .odd = len, };
-	int err;
-
 	diag_stat_inc(DIAG_STAT_X288);
-
-	err = -EINVAL;
-	asm volatile(
-		"	diag	%[r1],%[r3],0x288\n"
-		"0:	la	%[err],0\n"
-		"1:\n"
-		EX_TABLE(0b, 1b)
-		: [err] "+d" (err)
-		: [r1] "d" (r1.pair), [r3] "d" (r3.pair)
-		: "cc", "memory");
-	return err;
+	return __diag288(func, timeout, action, len);
 }
 
 static int diag288_str(unsigned int func, unsigned int timeout, char *cmd)
@@ -189,8 +162,6 @@ static struct watchdog_device wdt_dev = {
 
 static int __init diag288_init(void)
 {
-	int ret;
-
 	watchdog_set_nowayout(&wdt_dev, nowayout_info);
 
 	if (machine_is_vm()) {
@@ -199,24 +170,6 @@ static int __init diag288_init(void)
 			pr_err("The watchdog cannot be initialized\n");
 			return -ENOMEM;
 		}
-
-		ret = diag288_str(WDT_FUNC_INIT, MIN_INTERVAL, "BEGIN");
-		if (ret != 0) {
-			pr_err("The watchdog cannot be initialized\n");
-			kfree(cmd_buf);
-			return -EINVAL;
-		}
-	} else {
-		if (diag288(WDT_FUNC_INIT, WDT_DEFAULT_TIMEOUT,
-			    LPARWDT_RESTART, 0)) {
-			pr_err("The watchdog cannot be initialized\n");
-			return -EINVAL;
-		}
-	}
-
-	if (diag288(WDT_FUNC_CANCEL, 0, 0, 0)) {
-		pr_err("The watchdog cannot be deactivated\n");
-		return -EINVAL;
 	}
 
 	return watchdog_register_device(&wdt_dev);
@@ -228,5 +181,5 @@ static void __exit diag288_exit(void)
 	kfree(cmd_buf);
 }
 
-module_init(diag288_init);
+module_cpu_feature_match(S390_CPU_FEATURE_D288, diag288_init);
 module_exit(diag288_exit);
-- 
2.45.2


