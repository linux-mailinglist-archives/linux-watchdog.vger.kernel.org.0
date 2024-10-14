Return-Path: <linux-watchdog+bounces-2208-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B120D99C8DB
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 13:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D094A1C22ED1
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 11:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E9F19E7D1;
	Mon, 14 Oct 2024 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HPvLcjgs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D9133C5;
	Mon, 14 Oct 2024 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905176; cv=none; b=LKu5jR/ETDL6FgNzsZhXCCHeaPCM9cGq1YyUrqjUi+Wsu5vAqvjwpekIlw5DPLXIM0/r7dT5tVvzZ853B/aOG5TseOc86c8W7sMuiKKexBzDAU8CDH/YM4+03VLyzuHnoBU2fiVenITVG44RHf/U6NLjq0VLjImORw8lswRcygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905176; c=relaxed/simple;
	bh=lO2hoQzycVO4vY/kM7XL90ut+mcmjH5DnO6Bb7YBeGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Msm4M+NB7fbONbdedq3I2iUZP0sNIs+lTB+DnkePYWYY6e634SITQuK5t9srQoNHZbDDZMMqD3Da95HRoXrfIolLldoHjpqU5J9wHLRa1dgIBWY8BsboSWXVxOSszH3/i9lflVYx0R6hxVaoFzEWWT9zZqKJMFjqNcec9dcPTWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HPvLcjgs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EBJnxT005618;
	Mon, 14 Oct 2024 11:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=pp1; bh=i7XDuizXL
	S5XIPcoAE9bkjxG3lEIOziJCAhniyzLsnQ=; b=HPvLcjgsmznVXDad6N7Ib6HsJ
	Rj0GE+5E4FesYbWBhd6j6VyodMoFTPtZCHJq6d8kciS0qUBVRVWuI+ZS29oljX06
	2YP0aNf2pJNyyD75B8gP2NTg+jm+JSIfI01fjCfJkFxJmrgIuSWjwGkWq0T9Pugk
	zqGiV9i0VSyaRAAn6weGjlx998MCd8EUHjJCrDDTGaCGZgr1b/ZSe63l+Yj9tMhP
	QFWAi78gPQ61BsI2+1zZhX6Ig+FCBHhFLnYRseES6hA7O+T3hqFQnquaKda9tUEY
	VBAqvAD4gkBLTKdTDZ6MgUUoSkjGBsMY39aqkpHnGiAH+KCUcuFSP9YeiwQFw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4292ax00re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:25:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49E90AuS004965;
	Mon, 14 Oct 2024 11:25:57 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4285nhwww0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:25:57 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EBPu8S30933358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 11:25:56 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CD6D5805D;
	Mon, 14 Oct 2024 11:25:56 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4554258054;
	Mon, 14 Oct 2024 11:25:55 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 11:25:55 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Mon, 14 Oct 2024 13:25:42 +0200
Subject: [PATCH] watchdog: Add HAS_IOPORT dependency for SBC8360 and
 SBC7240
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-watchdog_sbc_ioport-v1-1-896ccf311839@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIALX/DGcC/x3MQQqAIBBA0avErBPURKirREjppLPJ0KhAvHvS8
 i3+L5AxEWaYugIJb8oUjwbRd2DDenhk5JpBcqkEF4o962WDi97kzRqKZ0wXc5vkgx6VQ6WhlWf
 Cnd7/Oi+1fuVpnjhlAAAA
X-Change-ID: 20241014-watchdog_sbc_ioport-db203694de46
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=lO2hoQzycVO4vY/kM7XL90ut+mcmjH5DnO6Bb7YBeGs=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGNJ5/u/dPyFX+ZyPlvNK5abwScGTOBx2VEutv7ni1owvO
 VOvn86U6ShlYRDjYpAVU2RZ1OXst65giumeoP4OmDmsTCBDGLg4BWAioSsYGf48cF7+JC6PuWY6
 cwbXpncRuw9pbrT55Gu0O6/9TKFmw3mGvyK/pTT43UtF483WCrNt0Kq//ydwjnjSqtM3FhxevsZ
 5OjMA
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: piKwdC9rv2w6ogSCGUJcXQu053stVgLx
X-Proofpoint-GUID: piKwdC9rv2w6ogSCGUJcXQu053stVgLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=753 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140080

Both drivers use I/O port accesses without declaring a dependency on
CONFIG_HAS_IOPORT. For sbc8360_wdt this causes a compile error on UML
once inb()/outb() helpers become conditional.

For sbc7240_wdt this causes no such errors with UML because this driver
depends on both x86_32 and !UML. Nevertheless add HAS_IOPORT as
a dependency for both drivers to be explicit and drop the !UML
dependency for sbc7240_wdt as it is now redundant since UML implies no
HAS_IOPORT.

Fixes: 52df67b6b313 ("watchdog: add HAS_IOPORT dependencies")
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/watchdog/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 684b9fe84fff5b08a35693aefa57db135196b909..94c96bcfefe34778588febba935664158840aae7 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1509,7 +1509,7 @@ config 60XX_WDT
 
 config SBC8360_WDT
 	tristate "SBC8360 Watchdog Timer"
-	depends on X86_32
+	depends on X86_32 && HAS_IOPORT
 	help
 
 	  This is the driver for the hardware watchdog on the SBC8360 Single
@@ -1522,7 +1522,7 @@ config SBC8360_WDT
 
 config SBC7240_WDT
 	tristate "SBC Nano 7240 Watchdog Timer"
-	depends on X86_32 && !UML
+	depends on X86_32 && HAS_IOPORT
 	help
 	  This is the driver for the hardware watchdog found on the IEI
 	  single board computers EPIC Nano 7240 (and likely others). This

---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241014-watchdog_sbc_ioport-db203694de46

Best regards,
-- 
Niklas Schnelle


