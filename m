Return-Path: <linux-watchdog+bounces-3031-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD97A49AF3
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 14:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEAF0174574
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2025 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C81A482EF;
	Fri, 28 Feb 2025 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QZ6EtNDu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0928F6B
	for <linux-watchdog@vger.kernel.org>; Fri, 28 Feb 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750596; cv=none; b=VCctdf+iT+cgR7YIz3uiE+7uveZ4oHcw3ZfEuiZfTH6yZcunbmp1JKCnMdrMor64Zu143vHQzERJLB7nyIUlbusc1j3dFDqtm4xh333yofpWepu8TnLh47S6r3gIxqAPtxnx13ZdZ4e576PHHGz4YkJegOmi+2hmKCnzI4pd7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750596; c=relaxed/simple;
	bh=xaiJfSSXzempBoG76V3ZZy7lTjCZJFyH0OT5znOLuxA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=bG0uM95a2DIqf8xHMwVUuRGP792l2lL1uh+Eq6Wc5vnzMFf+ro/fWV6U7hLmGqfuP+L/GKhjRO6lIDwKMBJf8CTK7P8utN1P3M+kxhTg5HjN+MWUje8mTgC9gp5A00fF8pLB1y3TMwMqZ8Ozurkzi+WbsFLpVAkrkhYs9Ajbg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QZ6EtNDu; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250228134951epoutp044deafc75839b8efb279d8f663b4082e6~oY3C937QJ0697106971epoutp04P
	for <linux-watchdog@vger.kernel.org>; Fri, 28 Feb 2025 13:49:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250228134951epoutp044deafc75839b8efb279d8f663b4082e6~oY3C937QJ0697106971epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740750591;
	bh=KWrW6K5KY4VwtGtgMBYnlUCfIdhY3BPVikVb7QzkEPg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QZ6EtNDu8eo+B+yqVIeiRE+4aErRtpbKIuwzbB7py1y/kFCU8iWMXNr9A+IBHJh0H
	 z+MPzrN1WBnv8Sj69zIpPXHSBI2dy6B41IZrXu/xZFFCsqpJ7wWSuD1z6Jq93k3aFq
	 rEXEhTIA5lOYhUjxarQ8+xArE7A/0mt0XYU21+BY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250228134951epcas5p1eb9181e2986d4f7a690b83532146b4ce~oY3CfvdVr0292402924epcas5p1d;
	Fri, 28 Feb 2025 13:49:51 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z48hs1Ps7z4x9Pp; Fri, 28 Feb
	2025 13:49:49 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B2.26.20052.DFEB1C76; Fri, 28 Feb 2025 22:49:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250228134948epcas5p136027a8eb0e984f9188016011411c13f~oY2-y4Frp2260422604epcas5p1j;
	Fri, 28 Feb 2025 13:49:48 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250228134948epsmtrp255413db93fbe68d59d56721ad2058f41~oY2-yQ6jf2720827208epsmtrp2h;
	Fri, 28 Feb 2025 13:49:48 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-44-67c1befd7b2b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.D4.23488.CFEB1C76; Fri, 28 Feb 2025 22:49:48 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250228134947epsmtip28d31f8cbcbdd85693b6b0742a5f7495d~oY2-E6cLU2327223272epsmtip20;
	Fri, 28 Feb 2025 13:49:47 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net
Cc: anindya.sg@samsung.com
Subject: [PATCH] watchdog: hpwdt: fixed a spelling error
Date: Fri, 28 Feb 2025 18:37:13 +0530
Message-Id: <20250228130713.6911-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7bCmpu7ffQfTDf7t5rTY0biR3eLyrjls
	FjfW7WO3eLLwDJMDi8fO7w3sHn1bVjF6fN4kF8AclW2TkZqYklqkkJqXnJ+SmZduq+QdHO8c
	b2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA7RNSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKr
	lFqQklNgUqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdsefweeaCDewVC5beYW5gnMfWxcjJISFg
	IvHz6DPWLkYuDiGB3YwSizpXMkE4nxgl3l9+xQLhfGOUOLl9GwtMy4s/j6ASexkl/q3YC+U0
	M0ks/ncTaDAHB5uAsUTbg0qQBhGBMInZZw4xg9jMAlIST/f+ZgexhQUsJO42ngKzWQRUJTb8
	fgVm8wpYSXxqaWWHWCYvsXrDAWaQ+RIC7ewS6z5dY4JIuEg8XNbNDGELS7w6vgWqQUri87u9
	YDdICORLLDmbDRHOkTiw/AFUq73EgStzWEBKmAU0Jdbv0oc4jU+i9/cTJohOXomONiEIU0Vi
	YgcLzOzZP3ZA7fSQ2HtjC1hcSCBW4s25DewTGGVmIcxcwMi4ilEytaA4Nz212LTAMC+1HB4z
	yfm5mxjBqUbLcwfj3Qcf9A4xMnEwHmKU4GBWEuGdFXsgXYg3JbGyKrUoP76oNCe1+BCjKTCQ
	JjJLiSbnA5NdXkm8oYmlgYmZmZmJpbGZoZI4b/POlnQhgfTEktTs1NSC1CKYPiYOTqkGpoWH
	lcPsfr97cf84u7ziny9WE/fNnz/r48Rb5u6ht7vdVwofiH4gEvS+uTkhWS5n5uWLD2RXzWLr
	0dtgmOtj7Bm4wvfr8W8spYH87ZoL+IXuXM2YfNXrchKv6w62TMlPxttzFrNluaQv0v4s7lt5
	OWj2/Q/zMx9t6t72/0rTu2j23UUT7s3bdCuow3Y5px5XzpvclA0yvZEefh1HenSz7k9b85SZ
	nXud1/W0sLkfzZzFGu6oxJ04f/FDSk4s03b7vIXPJAoezWU4kb72K1uhrEKwx1omns9Zzd6+
	n24yeOYdE0nYUdSuu59dqMoizi80vj193d2KnJvNblePKfFoqSYY25b6znLVYp/mabZWiaU4
	I9FQi7moOBEALc7pEr4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCJMWRmVeSWpSXmKPExsWy7bCSvO6ffQfTDea0i1nsaNzIbnF51xw2
	ixvr9rFbPFl4hsmBxWPn9wZ2j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4MrYc/g8c8EG9ooF
	S+8wNzDOY+ti5OSQEDCRePHnEQuILSSwm1Fi3RR/iLiUxO3/nYwQtrDEyn/P2bsYuYBqGpkk
	fi/8ztzFyMHBJmAs0fagEqRGRCBC4mXHdWYQmxmo9+ne3+wgtrCAhcTdxlNgNouAqsSG36/A
	bF4BK4lPLa3sEPPlJVZvOMA8gZFnASPDKkbJ1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT83E2M
	4IDQ0tjB+O5bk/4hRiYOxkOMEhzMSiK8s2IPpAvxpiRWVqUW5ccXleakFh9ilOZgURLnXWkY
	kS4kkJ5YkpqdmlqQWgSTZeLglGpg0jdgnH9ee59OTt+VM7u0p9UmBmYobH0Qf3nSs5BLfQEy
	N1+U9wiHT4mUm3Vtsl5e+8ZLqtvNzuyd8vXb88xvnTwFF7yNvgc8DNxy5+WDmryYkmuOvi3/
	C9gXKx6cs8Xz9YXb0Xn3tJ5MVz2jkJTfxa2/xNEx63Pg9j+MKzOYbEVtHdsY3tTPfCdzvOHI
	pUsb2x82HLZStny6dt0xxdjoPxssV+2z8Ga0Tt1/yMvPYOv7G1Vnr/9dy5jcID9Dy3BDRmuO
	6IZrgb6WQvfdlu0VledOjfvgsHDytLcpwnftnfsfh61MkD8ovSripP9CV9YiwYyML1aP21eH
	ftC1d1Nft5xfq5bzjeO9jVw1Na51SizFGYmGWsxFxYkAzSmJdHcCAAA=
X-CMS-MailID: 20250228134948epcas5p136027a8eb0e984f9188016011411c13f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250228134948epcas5p136027a8eb0e984f9188016011411c13f
References: <CGME20250228134948epcas5p136027a8eb0e984f9188016011411c13f@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

Corrected a spelling mistake in the hpwdt driver to improve code
readability. No functional changes were made.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/watchdog/hpwdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index ae30e394d176..5909da9a7eae 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -52,7 +52,7 @@ static const struct pci_device_id hpwdt_devices[] = {
 MODULE_DEVICE_TABLE(pci, hpwdt_devices);
 
 static const struct pci_device_id hpwdt_blacklist[] = {
-	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP, 0x1979) }, /* auxilary iLO */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP, 0x1979) }, /* auxiliary iLO */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_HP, 0x3306, PCI_VENDOR_ID_HP_3PAR, 0x0289) },  /* CL */
 	{0},			/* terminate list */
 };
-- 
2.17.1


