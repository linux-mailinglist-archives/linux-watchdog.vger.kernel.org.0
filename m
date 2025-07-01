Return-Path: <linux-watchdog+bounces-3782-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36065AEFE1A
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 837EB4A61E4
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8832027BF6C;
	Tue,  1 Jul 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="X8KQSdvp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster5-host1-snip4-6.eps.apple.com [57.103.66.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D99279DB6
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383540; cv=none; b=mN36TGMVzVB3JtxY4FTYWgQP6knN1Ua9TL/fnWpwGu6XrBeVohPLwL9YiG47169y8BLjpmd5UntjbWz11hTuJzJHkqkTAxjZ/WQxYd3oq+WrQ69ULZGbLHzEl9K+di/PGFPPlV8BnPX51pZNYD+JWwZDRQ3C/vGbLEShJJPQsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383540; c=relaxed/simple;
	bh=ToT/qrB5vmw8oj3wHwC2wdBpYqz1cqLUWloS/5fBO0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCXRlTif1+63Tl2TTBiuZ7E1lZWILAQywgFbGSl+3ly/ZykAzEdMV3pr1raXZxmPgMC02GJ+HlmVpHaDFG3Z+uywo4rhd7D5gRKPuypPWT4A8L9oa8KetIdWWOfCHs2cpOb768/SqjKHnjNMh582PdETQUAtIltrfGhj0vF36qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=X8KQSdvp; arc=none smtp.client-ip=57.103.66.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=MUmH/dSLuMIQ3BghP0YpZ08ZyiT9o160Xdozk2ClE7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=X8KQSdvplGYOrBJa08wp8/uD5Vxiefd2KUe8kIX9eUeXj4zQPRS+63MfHIM2+3Wdw
	 Nzf0hg9aN2I05BR5D9CYHAXbBNhcI1NdcMgdqnex8gTrloyZaEYPz9tfDP4n3Rj521
	 WcFKyVnfhNY8ZVD7qjlvu98UxrK5rnnhgpCQWsVzu5NPQT81PLPdWPGNLvJPJ+/aXn
	 tMoAZ9HPf70M7YMf625/yFr0uncsvlU8lk1WXpj3NuCwVk0M//Rqb0QRg7at9OJJN2
	 6L7frFbEVyB0hRHXYF8/BVAati/Ce94Dtg5k53GOFW7Tn5vSXhfBBM9yYXvubo7vnb
	 hpJnq4Cp3FJCg==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id BD95A1800169;
	Tue,  1 Jul 2025 15:25:35 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 5B00818000B4;
	Tue,  1 Jul 2025 15:25:23 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:39 +0800
Subject: [PATCH v2 1/9] char: misc: Move drivers/misc/misc_minor_kunit.c to
 drivers/char/
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-1-3eb22bf533be@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfX0aIv1eQUrHuN
 thMTjwjJOzYamKeHqq9XE0RTZeiLkc5SwVnwO1Em4ojdU683RuII+VtgwXlArIZ3pIedAJCSpi4
 6mXfBHTRrhIRKX1cSwc+IcV72pCOMZHWlSegA4Ahl7TwBCKJJh8PQvEdtZUvUciml779PGhc5xZ
 UPi7B5Cqo5+9ZDZE5hvtvERirDUpgS7i9Rl+3R8pSHMaku24tVBVO7Ifi9ngyx2tovERx9qtijw
 x9jjUOpcHpxN3juAGeZAmEO+IXm7tve2jlf6BGkqgajRldPPpFZfHbTn/V99Uwek+AZQ1Xtfk=
X-Proofpoint-GUID: COsbJGt4oiL_TVfqkY23ieirxVF4HMrO
X-Proofpoint-ORIG-GUID: COsbJGt4oiL_TVfqkY23ieirxVF4HMrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=915 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

drivers/misc/misc_minor_kunit.c is to test miscdevice APIs defined in
drivers/char/misc.c, but is not in the same directory as the later.

Move misc_minor_kunit.c to drivers/char/.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/Makefile                     | 1 +
 drivers/{misc => char}/misc_minor_kunit.c | 0
 drivers/misc/Makefile                     | 1 -
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index e9b360cdc99a7fee9c70eabcffe9caf763552aa2..7d10d92edcedbff5957d6c5c3426aa9400c94e43 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -6,6 +6,7 @@
 obj-y				+= mem.o random.o
 obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
 obj-y				+= misc.o
+obj-$(CONFIG_TEST_MISC_MINOR)   += misc_minor_kunit.o
 obj-$(CONFIG_ATARI_DSP56K)	+= dsp56k.o
 obj-$(CONFIG_VIRTIO_CONSOLE)	+= virtio_console.o
 obj-$(CONFIG_UV_MMTIMER)	+= uv_mmtimer.o
diff --git a/drivers/misc/misc_minor_kunit.c b/drivers/char/misc_minor_kunit.c
similarity index 100%
rename from drivers/misc/misc_minor_kunit.c
rename to drivers/char/misc_minor_kunit.c
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 917b9a7183aa1db63cc4049c042c3437f6756a1a..94f44e6c2db79dedc3839bbfb53e10cde103fbc6 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
 obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
-obj-$(CONFIG_TEST_MISC_MINOR)	+= misc_minor_kunit.o
 obj-$(CONFIG_SGI_XP)		+= sgi-xp/
 obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
 obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o

-- 
2.34.1


