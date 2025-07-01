Return-Path: <linux-watchdog+bounces-3784-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D00AEFE2A
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 17:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F8B24A7557
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9466327E7DF;
	Tue,  1 Jul 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="T6WeffsP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster2-host2-snip4-10.eps.apple.com [57.103.64.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75D27E7DA
	for <linux-watchdog@vger.kernel.org>; Tue,  1 Jul 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383547; cv=none; b=JLAMQV1w+v5jpx0YJ3AEz5lOIQvwt13GYUN+/s+KWcyqH9034Oij4LXwFIB44xYwpW7px1Qfz7rOl6xZ9abpBlcG2yAkduGG+J9skpILgrat8w8uxRjpVpAWibCpxe1uM/pJnDUaWPw7RFNzJ8+PK4fBqJ3wre37Tie6a88+mQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383547; c=relaxed/simple;
	bh=Y6fwgsRleYFe3vmL0Qkpoex3Lw83IPXlvQn/PZLO5R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQ3lWqG2KjRgnYszkC5NDYRYMrgAYaUwEvhtjAiT5ltHSj80Qp/9Zi8PG9pDn5N4N5nYnOQJc3Osb9U53JZEZnBrxqFzH30N/V64XkSjypDja8dqf7Nu6tkAfX0k3vLm8NOxzgF7GZ+sFWCt8veOD3MwHfSUJO5A135DJl/MFzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=T6WeffsP; arc=none smtp.client-ip=57.103.64.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=M9thk0HWSASu15ggFGqvr7qHauPRfJDZWE65nGcVLhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=T6WeffsPWTbmLWdqDUuuRdv50xNAP/shlj3x14HPe5HPZr9hoBqSTH1fhPcnAlsrc
	 ZIQLBalvFCliLLds3wW9WlmcjpZj0RJpLX8cVhNTehTSZNtMHyLaJQeJtbbxKGPFs2
	 PsvwgxCVZeszNwM1EiiLSeE9YBgPum8XVFjBt0U20LZoAEbn0wBROrH1XjCjZXjGiw
	 SFBTpYbyaQS0rGqC7RuVlA8IOtH6QRFVBfgaEsw7fYOEOpH4oWOsVP9fwzTmpOgYVK
	 J2oS7bBBho+PDDqgQoVenDUylCh6c+uIbCKfOv9E6kAZk9Db81ZkXLsz8A3qH6jp58
	 kgiJ4N6ul/+dQ==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 326AC180009F;
	Tue,  1 Jul 2025 15:25:40 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 56B7F18001A6;
	Tue,  1 Jul 2025 15:25:33 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:41 +0800
Subject: [PATCH v2 3/9] char: misc: Disallow registering miscdevice whose
 minor > MISC_DYNAMIC_MINOR
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-3-3eb22bf533be@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfX2eKciueVJqyJ
 CR08dIAkhtsO8MA+fsbyGFkuDcG8yod6ONaXdMJcxquBwdhaHADSp739VMKgrpsJ1msK9BPo+7+
 mldJ/sfRsJkLJJ5eJ0gFLd9fuGyDQFf41uQL1epsdglmcXJmHZIFPuS3JaAj2fnIOK2tpYlwi1n
 Bsla2ye4d8MuDV63XZgiN2M5DLeO4/m59ZE1Hs8WLcgZUesLvP4JsZLvTwkYf+HcIJhq77PySFj
 MjPMktA2VMsXn7o6gUA6BQ/e0pgc/49VqrKnhmrEqtg2CfZeRz/W9XjaECci5D+9yQmQZL7s4=
X-Proofpoint-GUID: c6trp0oY4JwYkK3lGfQeBSo5JLI4xzjd
X-Proofpoint-ORIG-GUID: c6trp0oY4JwYkK3lGfQeBSo5JLI4xzjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

Currently, It is allowed to register miscdevice with minor > 255
which is defined by macro MISC_DYNAMIC_MINOR, and cause:

- Chaos regarding divison and management of minor codes.
- Registering failure if the minor was allocated to other dynamic request.

Fortunately, in-kernel users have not had such usage yet.
Fix by explicitly refusing to register miscdev whose minor > 255.

Also bring in very simple minor code space division and management:

|<  255 : Fixed minor code
|== 255 : Indicator to request dynamic minor code
|>  255 : Dynamic minor code requested, 1048320 minor codes totally
And all fixed minors allocated should be registered in 'linux/miscdevice.h'

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc.c        | 6 ++++++
 include/linux/miscdevice.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index 558302a64dd908aee30341547a5413df1af71459..b8e66466184fa21fb66d968db7950e0b5669ac43 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -210,6 +210,12 @@ int misc_register(struct miscdevice *misc)
 	int err = 0;
 	bool is_dynamic = (misc->minor == MISC_DYNAMIC_MINOR);
 
+	if (misc->minor > MISC_DYNAMIC_MINOR) {
+		pr_err("Invalid fixed minor %d for miscdevice '%s'\n",
+		       misc->minor, misc->name);
+		return -EINVAL;
+	}
+
 	INIT_LIST_HEAD(&misc->list);
 
 	mutex_lock(&misc_mtx);
diff --git a/include/linux/miscdevice.h b/include/linux/miscdevice.h
index 3e6deb00fc8535a7571f85489c74979e18385bad..565b88efeb23d02b7d91df1cd7df4bdcf2898224 100644
--- a/include/linux/miscdevice.h
+++ b/include/linux/miscdevice.h
@@ -71,6 +71,14 @@
 #define USERIO_MINOR		240
 #define VHOST_VSOCK_MINOR	241
 #define RFKILL_MINOR		242
+
+/*
+ * Misc char device minor code space division related to below macro:
+ *
+ * <  255  : Fixed minor code
+ * == 255  : Indicator to request dynamic minor code
+ * >  255  : Dynamic minor code requested, 1048320 minor codes totally.
+ */
 #define MISC_DYNAMIC_MINOR	255
 
 struct miscdevice {

-- 
2.34.1


