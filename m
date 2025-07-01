Return-Path: <linux-watchdog+bounces-3783-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089DAEFE57
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176A81BC0626
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586CD27E04C;
	Tue,  1 Jul 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="C/VNz0Ph"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster5-host3-snip4-10.eps.apple.com [57.103.66.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5727C172
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383543; cv=none; b=qWf1DDyHDTbgoWbEP6+fVzTE3KxPeevVTduMBxxYLUZiURElD0VK9uIY5uDw1KM9jKDCjzRyt1N2xLPfL5Eq89xHxldjIuTGO8bNcH8b3OvD2vYwb6ns0qMCvlUR0Cwcb4wJCqqUhNDcTi0yYaGkwGGNipmIJuc7WitOD9BLlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383543; c=relaxed/simple;
	bh=a0Fmr5Ma8nogUPchBdjHRJTchby/j/GeMZ1mQtEsXb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRav3I/QokV3kTg2f5GActeoPyEaaOLI04TUoEcBlwaYSCtVQE8D+e6kUyuKrhJK3JW/tP8mZwXKj/I9229ekcoA3OSVuSiyrCpFrblLmYoSRuCMrz33xzgKftIjFkY5HtClGhgMkqplywUicPTk2YD5rz+rMoFsbtqL3mWykFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=C/VNz0Ph; arc=none smtp.client-ip=57.103.66.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=S6JRYwPZKS734gM/R0sULr/pZk9DTkb9x/1Vr4wyhCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=C/VNz0Ph3TyYpSiKfyRC4LW4Jg61oktL/fTP26TQcggJqxgv2p2hH+4y/uxvvViCF
	 5UcdYXEdmgFF0iugqNT+CethejSk69xb1atNo1fphtTxMKN8Xuyp/0Z7FxNqS/QDDA
	 2nc62Ms+L78WSqBRfD86nsfH/wkCu8Ty6II7uaxBKtlD4Qg3MbTzq49ml9QEMPKNFc
	 I0vIcBYVRSgEbOUoh41sLs1kaePnG9zRNMRUG0k3grHN7hZF6dKK+VT4PPAHWvzPSp
	 Zd0q2l8Za3gFqHowBJHgSRvJ8+LAMEywKnOCQzLypU6L9+hEAjl837KxK9tQwC/nlm
	 YlMXayN7A9Gjw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 1C03F1800198;
	Tue,  1 Jul 2025 15:25:37 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 586E91800167;
	Tue,  1 Jul 2025 15:25:28 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:40 +0800
Subject: [PATCH v2 2/9] char: misc: Adapt and add test cases for simple
 minor space division
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-2-3eb22bf533be@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: p9XhtsSexeEv0UKMNOHUUdyp6YpxL9uZ
X-Proofpoint-GUID: p9XhtsSexeEv0UKMNOHUUdyp6YpxL9uZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfX1rfSpScUb4WZ
 ccJTTkIOLRUTOU71wP5BMKdmZyylOeccxYK+xLg2YxrB4DSl+tQZuh/Nw+J2W5HqCQJjSHgRaZU
 UOEGVmAApYST3Km+IB0XUsoEJzCvD4ruftMI7YClO59YZtJZIHr4PRlKDEg6jtKQv+jneZtduN4
 94zTFlBtV8K69Y7nmfhmp2UsUcrtsCGICCrvUJ3oi3XniajSz3snaNA5pvhuTdsAqj3BoFTXGrm
 5HEbSHMdf5R96mt39ar3wrp/LUb/wc5swpZKSgs6UpfwVmXc87QTV5jKg7S6t40P37Vdhm8u4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Adapt and add test cases for next change which Regard minor
which > MISC_DYNAMIC_MINOR as invalid parameter when register
miscdevice, hence get a simple minor space division below:

|<  255 : Fixed minor code
|== 255 : Indicator to request dynamic minor code
|>  255 : Dynamic minor code requested, 1048320 minor codes totally.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc_minor_kunit.c | 51 +++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/char/misc_minor_kunit.c b/drivers/char/misc_minor_kunit.c
index 30eceac5f1b6402b0f918af6f56602ed1a6c14ec..81e2ef488a6f6ae7138c7dd8bcbeffe38aa65933 100644
--- a/drivers/char/misc_minor_kunit.c
+++ b/drivers/char/misc_minor_kunit.c
@@ -7,12 +7,6 @@
 #include <linux/file.h>
 #include <linux/init_syscalls.h>
 
-/* dynamic minor (2) */
-static struct miscdevice dev_dynamic_minor = {
-	.minor  = 2,
-	.name   = "dev_dynamic_minor",
-};
-
 /* static minor (LCD_MINOR) */
 static struct miscdevice dev_static_minor = {
 	.minor  = LCD_MINOR,
@@ -25,16 +19,6 @@ static struct miscdevice dev_misc_dynamic_minor = {
 	.name   = "dev_misc_dynamic_minor",
 };
 
-static void kunit_dynamic_minor(struct kunit *test)
-{
-	int ret;
-
-	ret = misc_register(&dev_dynamic_minor);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-	KUNIT_EXPECT_EQ(test, 2, dev_dynamic_minor.minor);
-	misc_deregister(&dev_dynamic_minor);
-}
-
 static void kunit_static_minor(struct kunit *test)
 {
 	int ret;
@@ -157,13 +141,7 @@ static bool is_valid_dynamic_minor(int minor)
 {
 	if (minor < 0)
 		return false;
-	if (minor == MISC_DYNAMIC_MINOR)
-		return false;
-	if (minor >= 0 && minor <= 15)
-		return false;
-	if (minor >= 128 && minor < MISC_DYNAMIC_MINOR)
-		return false;
-	return true;
+	return minor > MISC_DYNAMIC_MINOR;
 }
 
 static int miscdev_test_open(struct inode *inode, struct file *file)
@@ -557,7 +535,7 @@ static void __init miscdev_test_conflict(struct kunit *test)
 	 */
 	miscstat.minor = miscdyn.minor;
 	ret = misc_register(&miscstat);
-	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
 	if (ret == 0)
 		misc_deregister(&miscstat);
 
@@ -590,8 +568,9 @@ static void __init miscdev_test_conflict_reverse(struct kunit *test)
 	misc_deregister(&miscdyn);
 
 	ret = misc_register(&miscstat);
-	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_EQ(test, miscstat.minor, miscdyn.minor);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	if (ret == 0)
+		misc_deregister(&miscstat);
 
 	/*
 	 * Try to register a dynamic minor after registering a static minor
@@ -601,20 +580,32 @@ static void __init miscdev_test_conflict_reverse(struct kunit *test)
 	miscdyn.minor = MISC_DYNAMIC_MINOR;
 	ret = misc_register(&miscdyn);
 	KUNIT_EXPECT_EQ(test, ret, 0);
-	KUNIT_EXPECT_NE(test, miscdyn.minor, miscstat.minor);
+	KUNIT_EXPECT_EQ(test, miscdyn.minor, miscstat.minor);
 	KUNIT_EXPECT_TRUE(test, is_valid_dynamic_minor(miscdyn.minor));
 	if (ret == 0)
 		misc_deregister(&miscdyn);
+}
 
-	miscdev_test_can_open(test, &miscstat);
+/* Take minor(> MISC_DYNAMIC_MINOR) as invalid when register miscdevice */
+static void __init miscdev_test_invalid_input(struct kunit *test)
+{
+	struct miscdevice misc_test = {
+		.minor = MISC_DYNAMIC_MINOR + 1,
+		.name = "misc_test",
+		.fops = &miscdev_test_fops,
+	};
+	int ret;
 
-	misc_deregister(&miscstat);
+	ret = misc_register(&misc_test);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+	if (ret == 0)
+		misc_deregister(&misc_test);
 }
 
 static struct kunit_case test_cases[] = {
-	KUNIT_CASE(kunit_dynamic_minor),
 	KUNIT_CASE(kunit_static_minor),
 	KUNIT_CASE(kunit_misc_dynamic_minor),
+	KUNIT_CASE(miscdev_test_invalid_input),
 	KUNIT_CASE_PARAM(miscdev_test_twice, miscdev_gen_params),
 	KUNIT_CASE_PARAM(miscdev_test_duplicate_minor, miscdev_gen_params),
 	KUNIT_CASE(miscdev_test_duplicate_name),

-- 
2.34.1


