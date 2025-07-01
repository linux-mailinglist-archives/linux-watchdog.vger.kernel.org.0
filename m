Return-Path: <linux-watchdog+bounces-3785-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF74AEFE5A
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21CA61BC6FDF
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617FB279DC6;
	Tue,  1 Jul 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="j/MYLgGF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster4-host6-snip4-8.eps.apple.com [57.103.65.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6B27EFF1
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383553; cv=none; b=Ce4FgIxqyK9z6Bulzog71vpaADjcAdbWiNsndTiJPH4DjhxuEa4UayIC4bxIx2PoBfDFQO7c0Clwg5Pp7P9TBxHO+Eb1PPGNfHrsxaHgqlW8hQRjIDLqS5HJ5OY1ilz0sJ5uwzapmCLq4+YipQyAmFESNJ6eAfQ5pezQk2r8zTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383553; c=relaxed/simple;
	bh=eDFAjlhHJSW5X2fZbEtsYeL02eHd3XwjtVhkzfcoyEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA8OZNNPaiqwY8I5CCSWE79mLTWgkKe3YM7zWS3nt80Ae8YJz9Wkvav8KkY7ZNWPdaUbhR0O1QIx8UX3lDTh9QFLOZVmx+CcBSjk6BPvb/unXNTs2CcMdQBXAx8Txszx3GgvXGEgO64rzCwsz1zaLtypZ/tK1hS43f7xRmuQtlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=j/MYLgGF; arc=none smtp.client-ip=57.103.65.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=ZqSgMaAkXfnb4u/5m9fwC8YtQuLdUtL+vDaKunquJH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=j/MYLgGF5C/BRyv+Wd27WfIX1yFmyZ1RueTpEjokbBDNUmdCDdY2Xv9ivnYS4GfIv
	 lIZ3q8XW/8mJIWTDbZJ4lMlVSOn5Dyet8SLmzsLx3GOufoAo6KGxlHmeaFOig73L37
	 9hgnEuZpnJHE99nB3MrKJJYX5X7CvxtGdMzNXApIfT852mZhpfKW6iEAANDxCMwTSe
	 mEppSGKIoOZIYA5+15epP+6udBPLeT+jiiTj+B/hQKzMZdF4JVGNnuXBJoa80KmXk5
	 2N4gvpgSf5sbxeJpVu94dGCn8F5aEiM9dXOP75Ylhz/uX7hn5XnDqGUehf6mZDq68s
	 /eDE2WCkm1gYw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id EFD1518000B3;
	Tue,  1 Jul 2025 15:25:45 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 27CB618001B4;
	Tue,  1 Jul 2025 15:25:38 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:42 +0800
Subject: [PATCH v2 4/9] char: misc: Add a reentry test case for dynamic
 minor request
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-4-3eb22bf533be@oss.qualcomm.com>
References: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
In-Reply-To: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rudolf Marek <r.marek@assembler.cz>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: LL_-ZMrQBZamLncVkvMk3GHieCBgHCQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfX8ebekPWSu1Vf
 Rr7G8gRIfG/3wPLgGGBS5pf98/UIAQrwzUVlZWgtuOFUyV+0ctv2THS7zvFJq/ha7RT1pGtEipm
 QJGinP9oHmny2r+ARnDolhpomTcd1dx0KMCSDi3/58Zv3wj6M6leqzxoXIyPXBW8Obx7AwUf+eb
 xns54uJ59tXfD7IpI0IXD00HZ1Pw40b6DFCCCTVY8/W9wfebCRTspVdEa7gfD8JN/saaABVsW4G
 E5BCmWiSnIpinu8KtStUYHO1zMWs4jm7tw2UzQYN1MQKET1ViyM5KEDzakSwQJt+EUJrxjXPY=
X-Proofpoint-GUID: LL_-ZMrQBZamLncVkvMk3GHieCBgHCQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Add a case to test reentry for requesting dynamic minor:

1) Provide Both @dev_A and @dev_B want to request dynamic minor by
   initializing their member minor to MISC_DYNAMIC_MINOR.

2) Register then de-register @dev_A.

3) Register @dev_B.

4) Register @dev_A again without reinitialization.

5) Check if @dev_A can be registered successfully.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc_minor_kunit.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/char/misc_minor_kunit.c b/drivers/char/misc_minor_kunit.c
index 81e2ef488a6f6ae7138c7dd8bcbeffe38aa65933..9f1f77c04f9f1be56bc94cab4127ecb941e128b2 100644
--- a/drivers/char/misc_minor_kunit.c
+++ b/drivers/char/misc_minor_kunit.c
@@ -602,6 +602,49 @@ static void __init miscdev_test_invalid_input(struct kunit *test)
 		misc_deregister(&misc_test);
 }
 
+/*
+ * Verify if @miscdyn_a can still be registered successfully without
+ * reinitialization even if its minor ever owned was requested by
+ * another miscdevice such as @miscdyn_b.
+ */
+static void __init miscdev_test_dynamic_reentry(struct kunit *test)
+{
+	struct miscdevice miscdyn_a = {
+		.name = "miscdyn_a",
+		.minor = MISC_DYNAMIC_MINOR,
+		.fops = &miscdev_test_fops,
+	};
+	struct miscdevice miscdyn_b = {
+		.name = "miscdyn_b",
+		.minor = MISC_DYNAMIC_MINOR,
+		.fops = &miscdev_test_fops,
+	};
+	int ret, minor_a;
+
+	ret = misc_register(&miscdyn_a);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn_a.minor));
+	minor_a = miscdyn_a.minor;
+	if (ret != 0)
+		return;
+	misc_deregister(&miscdyn_a);
+
+	ret = misc_register(&miscdyn_b);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, miscdyn_b.minor, minor_a);
+	if (ret != 0)
+		return;
+
+	ret = misc_register(&miscdyn_a);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn_a.minor));
+	KUNIT_EXPECT_NE(test, miscdyn_a.minor, miscdyn_b.minor);
+	if (ret == 0)
+		misc_deregister(&miscdyn_a);
+
+	misc_deregister(&miscdyn_b);
+}
+
 static struct kunit_case test_cases[] = {
 	KUNIT_CASE(kunit_static_minor),
 	KUNIT_CASE(kunit_misc_dynamic_minor),
@@ -611,6 +654,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(miscdev_test_duplicate_name),
 	KUNIT_CASE(miscdev_test_duplicate_name_leak),
 	KUNIT_CASE_PARAM(miscdev_test_duplicate_error, miscdev_gen_params),
+	KUNIT_CASE(miscdev_test_dynamic_reentry),
 	{}
 };
 

-- 
2.34.1


