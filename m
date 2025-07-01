Return-Path: <linux-watchdog+bounces-3781-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08881AEFE0E
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C714A42F2
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF9E27933A;
	Tue,  1 Jul 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="e0VpmjOK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster2-host9-snip4-4.eps.apple.com [57.103.64.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27882777FC
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383539; cv=none; b=dSki1MrsasUbB/epF/YLtyToa4y0r0uDBdi/OP59H/yviDYI0+1WxPeSgrPdp7EgvxazVoqL7rjw/EFZIIqxQuiztiLZhXOy3kTbCX1to+xfuKLFUCNWCtBpVBIVTCRoL5VQPLQceIx9sTgjW5gXBd3bNUd+eZwnE1hBROeydx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383539; c=relaxed/simple;
	bh=/xiHoEfuz6/cTN5j+brnwCFPrNkucrnRkZA7gLvrw18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+gaOkTpfoz+aqLBD6zB+leQ7sOQyUOfYIRyS7t/YZHSoZMqXxJSNzQyxoTn1E+truKm+7fvqn/cUKqMDd11k4g1U6MEC7Yudpdl7EujFyD5QUi2wpZoK1Zpmrm6n9GUD0y4szhhO/5jhjQggODIxl+KX/TvKevcJi9zS7DzMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=e0VpmjOK; arc=none smtp.client-ip=57.103.64.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=3+n81dwkBafL//lMPlx4ETy4nA09EkZFH9IrMca4OF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:x-icloud-hme;
	b=e0VpmjOKWR/TtEwXMHglg+hPYtMAtkte96QbOmQI7JhVo0wEHenyk1SpZjEg5Vvs0
	 VVdyrjCvjvLFDHaQdsHdUrsDYJEBH/Yp8uFUVK/fhZL0z8srsTnfkbXpReP3EsPDK+
	 WQKSAdntCSlUBP90IUPpJi4NMEf5A8h17DiVmj4t3NnEzBwogHAH8J2itNh5y8EzTY
	 9GLQYJJpgchEVmliGVkbA9SMaJgBbVOB9tBpvaJLGfydhe63kPXAbCQzISWDi2pA1k
	 T2q8w/jM0SQVsx0gOVvW0ZijwSOdd6eXUb0SYxQMc5q5UPjmvO7/K7QSm5NIwd9mue
	 wYiW1zGjIuCJg==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id B4A001800310;
	Tue,  1 Jul 2025 15:25:32 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id E3D9D180017B;
	Tue,  1 Jul 2025 15:25:17 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Subject: [PATCH v2 0/9] char: misc: Various cleanup for miscdevice
Date: Tue, 01 Jul 2025 23:24:38 +0800
Message-Id: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALf9Y2gC/1XMQQrCMBCF4auUWZsySYgFV95DRMLMxAZMo4kGo
 fTuBjfi5sG3eP8KVUqUCodhhSIt1piXDrMbgGa/XEVF7gaDxuGEWpVAlxQrsTRlHbO1GmkihP6
 4Fwnx/a2dzt2h5KSecxH/a+wN/jWaVloF9saxQ+PtdMy1jo+Xv1FOaewD2/YBPLFDtacAAAA=
X-Change-ID: 20250701-rfc_miscdev-35dd3310c7c0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfXw3vmlR/rz6EC
 J7f+eSwcTCRJ3b44G6xnwHtcacUqVQgzWrLye/CE8vICli6tMq7httcE9yAVb2kmevlk56H2WOu
 p3MrzrhJFQmQSSgBqutCO+8DMSPF9+WpWOP4FJgbtJwuDAzxcVKiiAibP5GUOF+B0L0fm2kJzlr
 mnLOX1p1hPNYIIXUpiv1PbdH9p/KC+YROHpwiEhR5aIP3YcExOV9y54etMetqguF7DaYGGxsbcp
 Ii3eIEuONZX+NaOIvaLood8HIbPUH8dEhlTL3ScS4XPhd3PIE3keDc+NjpmjgMY6Z9Q0QHLxI=
X-Proofpoint-GUID: TAZS-eDz8OnWu2xISqFutSn1uKq1H9Li
X-Proofpoint-ORIG-GUID: TAZS-eDz8OnWu2xISqFutSn1uKq1H9Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1011 mlxlogscore=973 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

This patch series is to do cleanup for:

- Miscdevice APIs
- Miscdevice kunit test cases
- Drivers which use miscdevice APIs

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Previous discussion link:
https://lore.kernel.org/all/20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com

---
Zijun Hu (9):
      char: misc: Move drivers/misc/misc_minor_kunit.c to drivers/char/
      char: misc: Adapt and add test cases for simple minor space division
      char: misc: Disallow registering miscdevice whose minor > MISC_DYNAMIC_MINOR
      char: misc: Add a reentry test case for dynamic minor request
      char: misc: Make registering dynamic device reentry
      char: misc: Does not request module for miscdevice with dynamic minor
      char: misc: Allocate 4 more fixed minors for watchdog
      char: misc: Define fixed minor EISA_EEPROM_MINOR in linux/miscdevice.h
      sparc: kernel: apc: Remove macro APC_MINOR defination

 arch/sparc/kernel/apc.c                   |  3 +-
 drivers/char/Makefile                     |  1 +
 drivers/char/misc.c                       | 16 +++++-
 drivers/{misc => char}/misc_minor_kunit.c | 95 +++++++++++++++++++++----------
 drivers/hwmon/fschmd.c                    |  3 +-
 drivers/hwmon/w83793.c                    |  3 +-
 drivers/misc/Makefile                     |  1 -
 drivers/parisc/eisa_eeprom.c              |  2 -
 drivers/watchdog/cpwd.c                   |  6 +-
 include/linux/miscdevice.h                | 13 +++++
 10 files changed, 100 insertions(+), 43 deletions(-)
---
base-commit: 626e89412dfb88766d90d842af4d9ec432d8526f
change-id: 20250701-rfc_miscdev-35dd3310c7c0

Best regards,
-- 
Zijun Hu <zijun.hu@oss.qualcomm.com>


