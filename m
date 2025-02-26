Return-Path: <linux-watchdog+bounces-3013-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E530FA4560B
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 07:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681E51886EFF
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 06:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FB0269AEA;
	Wed, 26 Feb 2025 06:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i0ZxCpgD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B02698A1
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Feb 2025 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740552759; cv=none; b=DNGSJU10vnO4CjjWhaezm+an+CcxS8uNcCV8Nj7cvuUzZvE6jCBgXn1Ss5xUwMvnKT8QhZqR/rAKroTAjw1RlHH4VY4BpH91GLaC+zHRdke04XWlmmMz4o4AvHfM/t0MA9g72htWQrRccDcTE0HOU0u4uraFvmhQcnhqZWkpVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740552759; c=relaxed/simple;
	bh=4rxfz2RBs0i2KkyJbIivqlEYb7DDjtpkcjg98g6MAhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=MIe7pWPVWJJWMaURGKQL5ccFMQPa2qtxBVKlOKJ+Tgnc/xzYpE1Y1vcBRIaDCjKlgzzAZaEO8UeRJT9kIhQGJoIujjSatTdi3Pb7gFFBb2GcHukWOjD1PDxWJBP1342xjJCraopTrIX6+etuuS/BczE2o5tGy9QvDLgpe4PG0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i0ZxCpgD; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250226065228epoutp042f7f3f00f942220254223d973b1cfd9e~nr4DQL1MD2966829668epoutp04G
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Feb 2025 06:52:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250226065228epoutp042f7f3f00f942220254223d973b1cfd9e~nr4DQL1MD2966829668epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740552748;
	bh=VMxy5Fqms/eEj6SG3Fa4iJMOIvJ3Wms8fcLlQ4UDdm4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=i0ZxCpgDq43DKlyT2L+4Tztm/w2bFSKxw+DECGAs7J5kIKZ2UG7RA2WwdTTxmTX4Q
	 6MOUyvYw28/GCxuYJ39PmKzm2G82+LWLeunGKF6SFGv027I5PAGSPoHBrkXe2Btwk0
	 ueKl5smHGvinfzGvQc3ktlbLfR7ZgrD3yA55v69U=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20250226065215epcas2p4a1ff08b37e5b659501c8ccc7cce0781f~nr33D6qDX1242012420epcas2p4a;
	Wed, 26 Feb 2025 06:52:15 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Z2lWz0cVbz4x9Q6; Wed, 26 Feb
	2025 06:52:15 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	6D.46.23368.D1ABEB76; Wed, 26 Feb 2025 15:52:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250226065213epcas2p37d44b987d5bc913cf5f9d5800ff9df8e~nr31N9Bw71726517265epcas2p3V;
	Wed, 26 Feb 2025 06:52:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250226065213epsmtrp1b54a53bd8e040101c302fe1b3a39480c~nr31NNhbx2283422834epsmtrp1X;
	Wed, 26 Feb 2025 06:52:13 +0000 (GMT)
X-AuditID: b6c32a45-db1ed70000005b48-8d-67beba1d77ea
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.10.18729.D1ABEB76; Wed, 26 Feb 2025 15:52:13 +0900 (KST)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250226065213epsmtip2b95aa7fc901ce29e0b96a6a873f6b97f~nr31CCl9Q0556105561epsmtip2I;
	Wed, 26 Feb 2025 06:52:13 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Kyunghwan Seo'" <khwan.seo@samsung.com>
Subject: [PATCH V1 RESEND] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Wed, 26 Feb 2025 15:52:13 +0900
Message-ID: <000001db881a$f7364da0$e5a2e8e0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AduIGjfKeJ5dyM0LTxaz6ymXUsgWdA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGJsWRmVeSWpSXmKPExsWy7bCmha7crn3pBvv2MFs8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YW
	l+al6+WlllgZGhgYmQIVJmRnvF05kamgka/i5/enLA2MZ7m7GDk5JARMJLbf+MbSxcjFISSw
	g1Hi5+4j7BDOJ0aJLx/aoJxvjBIzfp1ng2npWXmACSKxl1Hi/4rXUM5LRokHsx6xglSxCchJ
	LO1vYwGxRQSKJHb++Aq2hFngAKPEn5bpYEXCAgkSS6dPYAKxWQRUJe4sbwezeQUsJc7duMcK
	YQtKnJz5BGwQs4C8xPa3c5ghzlCQ+Pl0GSvEAj2JLQt7oGpEJGZ3tjGDLJMQmMghca+zjxGi
	wUWiecYOKFtY4tXxLewQtpTEy36QRzmA7HyJU0+EIXobGCXeNb+H+tleYtGZn2A1zAKaEut3
	6UOUK0scuQW1lk+i4/BfqCm8Eh1tQhCNKhIdPzezwiw6euYB1FIPiSvX21knMCrOQvLkLCRP
	zkLyzCyEvQsYWVYxiqUWFOempxYbFRjCYzs5P3cTIzjBarnuYJz89oPeIUYmDsZDjBIczEoi
	vJyZe9KFeFMSK6tSi/Lji0pzUosPMZoCg30is5Rocj4wxeeVxBuaWBqYmJkZmhuZGpgrifNW
	72hJFxJITyxJzU5NLUgtgulj4uCUamBK+huS8X9aqBhLsh3XGdW1CTvuhZucvrlPY6Xvoqcz
	tu30ef3vbBmHwOYezt2+y2f+/fn1CefEFU8LNM5eOfevk3XLtqdlk76s1rl77uqMiR8+HV/z
	/eyC9sLo5usbFrUYMFRtCU5b5ZrSor9EKPZG3hzlhR1Gu0+fkH+cH/eg7tOTCpEZEtUPHn/f
	W7N0/vO0rWdCuO5u2VTpNeFHRmh+9vG/q2JTjlRbFMyLMMlzbXe5fTZxsZ6b/rkNeY6cOorV
	N9YsqDzo+cr4HPOkVf9UHzqpzArSK34zscSr5zxDydMrZ/KsL7M41hdO/PWnc+6CzmPbDu4K
	Fehbcfh2qNPxzSfM27dWR2j4W/VKrXlel6XEUpyRaKjFXFScCABROjBpOQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvK7srn3pBi131SwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBlvV05kKmjkq/j5/SlLA+NZ7i5GTg4J
	AROJnpUHmLoYuTiEBHYzSnTP2sjSxcgBlJCSePfMEqJGWOJ+yxFWiJrnjBKtr1eygiTYBOQk
	lva3sYDYIgJlElsbtzKD2MwCRxglZnwGaxYWiJNoe7CaEcRmEVCVuLO8nQnE5hWwlDh34x4r
	hC0ocXLmExaIXm2JpzefQtnyEtvfzmGGOEJB4ufTZawQu/QktizsgaoRkZjd2cY8gVFwFpJR
	s5CMmoVk1CwkLQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+duYgRHjpbmDsbtqz7o
	HWJk4mA8xCjBwawkwsuZuSddiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/4i94UIYH0xJLU7NTU
	gtQimCwTB6dUA9OOlQssf7+4N12fcW7wLbkpaYzFgt2fSu6/SC/t43b27e7JZEn2mBd6Vv6K
	nMyke4G95eVr5S6Yz3Qx9vgx951Qp6RSmKxZd0WbeUbZ3+17BD49XPFRR3LVzdr3r4/09xx7
	8XWNo+PPRO0+9vLXxy6uPnJM5vcH78fvouYonuA3b73QfGTLgY0nOfs1pz54/nGiwap/Pm+d
	HNwTTJK+T1bf4KA2d8uFdzcirfY2N9W1WG1mnBihxr2R/8LOOcf0BA9s6fCZ6pZyeXbE8Q+e
	7at2H7bozDvbcCGRf9HkR+VMWf25T08uO//yjlj4heSLzku/d30pXXA3i+neJPuKjLVlivNX
	zFvrJpt+6evNo73zlFiKMxINtZiLihMBm2ZU5wsDAAA=
X-CMS-MailID: 20250226065213epcas2p37d44b987d5bc913cf5f9d5800ff9df8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250226065213epcas2p37d44b987d5bc913cf5f9d5800ff9df8e
References: <CGME20250226065213epcas2p37d44b987d5bc913cf5f9d5800ff9df8e@epcas2p3.samsung.com>

This is a friendly reminder for this patch.

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar@samsung.com>
> Sent: Thursday, February 13, 2025 1:56 PM
> To: 'Sangwook Shin' <sw617.shin@samsung.com>; krzk@kernel.org; wim@linux-
> watchdog.org; linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; 'Kyunghwan Seo' <khwan.seo@samsung.com>
> Subject: RE: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
> ExynosAutoV920 SoC
> 
> Hello Sangwook
> 
> > -----Original Message-----
> > From: Sangwook Shin <sw617.shin@samsung.com>
> > Sent: Thursday, February 13, 2025 6:11 AM
> > To: krzk@kernel.org; alim.akhtar@samsung.com; wim@linux-watchdog.org;
> > linux@roeck-us.net
> > Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> > soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Kyunghwan Seo <khwan.seo@samsung.com>;
> > Sangwook Shin <sw617.shin@samsung.com>
> > Subject: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
> > ExynosAutoV920 SoC
> >
> > From: Kyunghwan Seo <khwan.seo@samsung.com>
> >
> > Fix the PMU register bits for the ExynosAutoV920 SoC.
> > This SoC has different bit information compared to its previous
> > version, ExynosAutoV9, and we have made the necessary adjustments.
> >
> > rst_stat_bit:
> >     - ExynosAutoV920 cl0 : 0
> >     - ExynosAutoV920 cl1 : 1
> >
> > cnt_en_bit:
> >     - ExynosAutoV920 cl0 : 8
> >     - ExynosAutoV920 cl1 : 8
> >
> > Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
> > Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> > ---
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> 



