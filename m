Return-Path: <linux-watchdog+bounces-3788-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C38AEFE3A
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEB814A70B1
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D859827AC2A;
	Tue,  1 Jul 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="0qWDiqUx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster2-host10-snip4-4.eps.apple.com [57.103.64.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511827AC35
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383567; cv=none; b=CgcMhbra03Oa4APN6hxg7CXSvjSqsWKT/eeXQFeiXjezfv76esCrGABOg1lVylgR3Hky5cD5df3TKfYAz45lNSqlfuGVHJ6DZrfmaoSLakhsmB8aV4WBe7ckKMLvQyJBxIbEYmV1CWSAm3XqeJ6XETC9+6+hg4yIyyTrTB/7MWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383567; c=relaxed/simple;
	bh=hm08xCVJpifK1YGvN6kpdjEx3Zi2cHVqnSWYXayo0H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssKLwVAcS4UCalb+sNwC7zubSeg2/aSdxOUkrcwurdfLHZD4ZrsD3buf8MEgU1K1jdIYdUCSKRKrzVt6QQc2pB1BwNcPi3whlJv0HgajpdgCOxODhUQ5SlIsj1EF/FH5AVEoTE9oFq25XCSV2nne/wSfL0y/CccFpeSMmiX3in4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=0qWDiqUx; arc=none smtp.client-ip=57.103.64.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=UKT3gxNRl5YzBh1j6iMSlGrirc7wdEcjwd4FP2M5g20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=0qWDiqUxSnHKSByqeX2WrUgUNexAH9BabYUSnuQRFiYl7Dwy2V5X4bsb8brAFlVJL
	 4MaaytGECwCFQEvTliyVZl9UrbfZ+g4gIL3MqbeRK3dru/kOb+6f9+gterUmN2oJ14
	 WsEEE9NOW81NYfAZch7I1StNnOvzk1DQc5ji4o8N2SEP30rGXUyHy9YsVUdJcO/Ptw
	 MVLdJMDWy8eiLlG48F+9IjxCsg6h6P2FMAfkBKnNdXud/mTowru8APuHOLLHEkyoQb
	 UnuCr2Et9QQ13DMCjGmWqjic3uMYku/sAb3a/f1JWyVfMUyk9Yhvx4GqiW2wATpWPE
	 xe9txV19nHgwg==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id D96B7180017A;
	Tue,  1 Jul 2025 15:25:59 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 2ECD51800158;
	Tue,  1 Jul 2025 15:25:53 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:45 +0800
Subject: [PATCH v2 7/9] char: misc: Allocate 4 more fixed minors for
 watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-7-3eb22bf533be@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 55bD6wZGHtVnRw82wihzjhfWwCxW8amE
X-Proofpoint-GUID: 55bD6wZGHtVnRw82wihzjhfWwCxW8amE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfXyUgjBjbjo1he
 rt59MqEt3fUk7SOuIJ5RMrZEwvu5DOA4B4/R8uMx+FdmRLjePBAplhvd5lWdT4bNP04E7Fcoj9p
 PWqSmPH4OSZ3IoVxCYy4myMsJdK6lJFtZ56P5GRnu9qWQx84yyuauhcEaXtBFbDEFg6J1RQWwxw
 U2208GsXxxgeC+8dAg3tny0nLvb98iACqTvNSFkO7oxGFHfjHW7q0w7M8T4ArjHioTuHtHbUm/Z
 FiaUdKu9EsyUfie9951gwbYMWErlcXoOkejbfE3toT/TB+Cz8bAlsNeBpZOHnTUTNK9Enh710=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

There are drivers which needs more fixed minors for watchdog, but
watchdog only has one fixed minor currently, it causes hardcoded and
unregistered fixed minors are used by these drivers.

Allocate 4 more fixed minors and apply for these drivers.
---
 drivers/hwmon/fschmd.c     | 3 ++-
 drivers/hwmon/w83793.c     | 3 ++-
 drivers/watchdog/cpwd.c    | 6 +++---
 include/linux/miscdevice.h | 4 ++++
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
index a303959879efddd9bfc02e8c25766e67b1a4af8e..7ffaec12eea8473a7dd17d7477db9157230e7f31 100644
--- a/drivers/hwmon/fschmd.c
+++ b/drivers/hwmon/fschmd.c
@@ -1084,7 +1084,8 @@ static int fschmd_probe(struct i2c_client *client)
 	struct fschmd_data *data;
 	static const char * const names[7] = { "Poseidon", "Hermes", "Scylla",
 				"Heracles", "Heimdall", "Hades", "Syleus" };
-	static const int watchdog_minors[] = { WATCHDOG_MINOR, 212, 213, 214, 215 };
+	static const int watchdog_minors[] = { WATCHDOG_MINOR, WATCHDOG_MINOR_1,
+		WATCHDOG_MINOR_2, WATCHDOG_MINOR_3, WATCHDOG_MINOR_4 };
 	int i, err;
 	enum chips kind = (uintptr_t)i2c_get_match_data(client);
 
diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index 67728f60333fe351715ccc03097f9aa2e135f384..fb4d76c87ea26366586f6f6bc2bee4f76a430880 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -1642,7 +1642,8 @@ static int w83793_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	static const int watchdog_minors[] = {
-		WATCHDOG_MINOR, 212, 213, 214, 215
+		WATCHDOG_MINOR, WATCHDOG_MINOR_1, WATCHDOG_MINOR_2,
+		WATCHDOG_MINOR_3, WATCHDOG_MINOR_4
 	};
 	struct w83793_data *data;
 	int i, tmp, val, err;
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 13a4d47e68cd82572f103c37ec066384cc5f7cd7..7891ea8f87451ddfb377e90706310a73324fb0ce 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -44,9 +44,9 @@
 #define WD_BTIMEOUT	(jiffies + (HZ * 1000))
 #define WD_BLIMIT	0xFFFF
 
-#define WD0_MINOR	212
-#define WD1_MINOR	213
-#define WD2_MINOR	214
+#define WD0_MINOR	WATCHDOG_MINOR_1
+#define WD1_MINOR	WATCHDOG_MINOR_2
+#define WD2_MINOR	WATCHDOG_MINOR_3
 
 /* Internal driver definitions.  */
 #define WD0_ID			0
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index 565b88efeb23d02b7d91df1cd7df4bdcf2898224..c33839df8bd261bf1ab841b7e50afe3f8b0b007e 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -52,6 +52,10 @@
 #define PXA3XX_GCU_MINOR	197
 #define TUN_MINOR		200
 #define CUSE_MINOR		203
+#define WATCHDOG_MINOR_1	212
+#define WATCHDOG_MINOR_2	213
+#define WATCHDOG_MINOR_3	214
+#define WATCHDOG_MINOR_4	215
 #define MWAVE_MINOR		219	/* ACP/Mwave Modem */
 #define MPT_MINOR		220
 #define MPT2SAS_MINOR		221

-- 
2.34.1


