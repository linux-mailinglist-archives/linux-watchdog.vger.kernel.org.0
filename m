Return-Path: <linux-watchdog+bounces-2925-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCCA3370F
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 05:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB403A8606
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2025 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C25C1487F4;
	Thu, 13 Feb 2025 04:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Yl6Ys+b1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080C126F0A
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2025 04:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739422551; cv=none; b=JsMGM9ke2d+vwYph1++DuXFHpGtYmytwF4FzNtUnb2HsleKIxrEIuVvfF+VN6oy4BMhR/YzVzG/8jR5dis+IyWaT3D+IFYP4fjD0o36b5Eg68CWoHF8T0WyjQIAu8w6ULJwhctL469jrHrukjpXiHJf2px1yMFrxNk3iIzAGmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739422551; c=relaxed/simple;
	bh=HvqCw549wJsYuDlVKxt9wyAYBY5B1uz73hA/YCeg37c=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=J5bSqYLsDGE4RiCRUHgHYmdQjoiiywjuNH2g+WzkIUNNHTebYtCB/HWwb4Vti2A4VwPk6GqyVcAm2ePJkHGuDutFsRjPykn4duhfPCZoNMRlHbohiE3mvuoAewSkEYBxfJaTqg+yxzZHQvKLzcRCCZbo4QHDmfPApsiV4cvJQN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Yl6Ys+b1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250213045545epoutp02122b3fff9aa4af2e94a216f89da53547~jq5bWe6-N0874708747epoutp02R
	for <linux-watchdog@vger.kernel.org>; Thu, 13 Feb 2025 04:55:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250213045545epoutp02122b3fff9aa4af2e94a216f89da53547~jq5bWe6-N0874708747epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739422545;
	bh=BQOg/IXGvh6SDS7iD96gUGvCk0+I2oejb562PpnZLcI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Yl6Ys+b1Vz5Aes3ZRxaCTbJXoPGqhrSF+cLgXNxbI2YqTMaZ93q4a3ML+ht+Jr/I1
	 Eh5aDnj/0/lSBaaFTermfP+RAAE4RrWZAHJhwGiZm1f51oulvUjzS5+nVWuN83l2Dq
	 /1ZfDF+G5I6RI7lIK0xbGAIqCoCTC+i4VxcTKxHE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250213045544epcas5p11154a448ba3e6b303b5c342a9196fce4~jq5a53pLf0163501635epcas5p1U;
	Thu, 13 Feb 2025 04:55:44 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YtjYW4D29z4x9Pv; Thu, 13 Feb
	2025 04:55:43 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A6.9B.19933.F4B7DA76; Thu, 13 Feb 2025 13:55:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250213045543epcas5p2ff4ce49a4b047da1fc0a9b75af038c3d~jq5ZJj8mY1585415854epcas5p2x;
	Thu, 13 Feb 2025 04:55:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250213045543epsmtrp17f26c3ff921128ab2f2e77430239ddd2~jq5ZIqF342929129291epsmtrp1-;
	Thu, 13 Feb 2025 04:55:43 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-df-67ad7b4f1e19
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E1.39.18729.E4B7DA76; Thu, 13 Feb 2025 13:55:42 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250213045541epsmtip2537ec173472fd34e28a07f33f7b4cc5d~jq5X1Nn4a2677626776epsmtip2K;
	Thu, 13 Feb 2025 04:55:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Kyunghwan Seo'" <khwan.seo@samsung.com>
In-Reply-To: <20250213004104.3881711-1-sw617.shin@samsung.com>
Subject: RE: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Thu, 13 Feb 2025 10:25:40 +0530
Message-ID: <001901db7dd3$88f487e0$9add97a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKXLcZq0aZCQuQE4azW7xZbTrDDiAKPHcXRsbjSJvA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmhq5/9dp0g+fn5C3mt19itDh/fgO7
	xabH11gtLu+aw2Yx4/w+Josb6/axWzxZeIbJYsbik2wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OL
	S/PS9fJSS6wMDQyMTIEKE7Iz1l6ex17QzFlx8doJ9gbGvexdjBwcEgImEg8WZ3UxcnEICexm
	lHi2+DMbhPOJUeLP9XVQzjdGiR2LzjJ1MXKCdVxY284IYgsJ7GWU2DAzCKLoJaNE48eTzCAJ
	NgFdiR2L29hAbBGBYol1c2azgBQxCxwAGtsynRUkwSlgJ9H/eT9YkbBAlMTDo9vAmlkEVCW6
	X+0Eq+EVsJT48+UmO4QtKHFy5hMWEJtZQF5i+9s5zBAXKUj8fLqMFWKZlcS9Q3PYIWrEJV4e
	PcIOslhCYCmHxOvPXxkhnnaR2PFXFKJXWOLV8S3sELaUxMv+Nii7WmL9hnksEHYH0GfbayBs
	e4mdj26ygIxhFtCUWL9LH2IVn0Tv7ydMENN5JTrahCCqVSWa312FmiItMbG7mxXC9pDon7qH
	dQKj4iwkj81C8tgsJA/MQli2gJFlFaNkakFxbnpqsWmBUV5qOTy6k/NzNzGCU6yW1w7Ghw8+
	6B1iZOJgPMQowcGsJMIrMW1NuhBvSmJlVWpRfnxRaU5q8SFGU2BoT2SWEk3OByb5vJJ4QxNL
	AxMzMzMTS2MzQyVx3uadLelCAumJJanZqakFqUUwfUwcnFINTN28Z2/a3Dh9z2jLdKWSC8Vy
	nf8uT45a9OT5q3Mh51+u+bTrmXf5l0+5l1TndH9nr96cFCY4J+D7Au3LTd+lkqpWFbxJXHbW
	+1i8V+EC8xccFr2dzyLX7zh/bJJub+M7R4Vbb4IO7zbIcH52vL5/yn97lqdnNYVtxbc8WXV9
	kXQZK3+Bw7Pcyyyxmkz3lhQ5514IO6X6KvDhHEmbS45qMzXU1GTiLOwq722OnSf163+3w3+G
	WmnRbc9CWCZuX1j+S+LTu7uGG3b5Sqvby4VOfBSx6drDpH0/4lfKfFnPEB68NTF6QfNDSaPp
	W/Nl/4m5XVm1272xvfqqkH20NGvk9rMhoccP/JQwvvTnx81SQTElluKMREMt5qLiRAB8a74a
	OgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSvK5f9dp0g8M3rC3mt19itDh/fgO7
	xabH11gtLu+aw2Yx4/w+Josb6/axWzxZeIbJYsbik2wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBlrL89jL2jmrLh47QR7A+Ne9i5GTg4J
	AROJC2vbGbsYuTiEBHYzSuxf/IQFIiEtcX3jBKgiYYmV/56zQxQ9Z5RYvXIhWIJNQFdix+I2
	NhBbRKBc4ta5o0wgNrPAEUaJGZ8tIRr6GSW2PzwMVsQpYCfR/3k/mC0sECGx5sEbVhCbRUBV
	ovvVTjCbV8BS4s+Xm+wQtqDEyZkQFzELaEv0PmxlhLDlJba/ncMMcZ2CxM+ny1ghjrCSuHdo
	DjtEjbjEy6NH2CcwCs9CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0
	veT83E2M4GjT0tzBuH3VB71DjEwcjIcYJTiYlUR4JaatSRfiTUmsrEotyo8vKs1JLT7EKM3B
	oiTOK/6iN0VIID2xJDU7NbUgtQgmy8TBKdXAdIZn7T036yjuc7snRTK6hU/mm7eReSfL1sX6
	e0InFH3fvilH4eXWSwY3MqLWmjBr7PKY+LWh4lDpkb1nAuQ3Sf0UNY2ZYSa5xSc8Z9F8u5zF
	t/JaLX8eM41SYGHyrb73e2vTPoF7B38lbeC7lNfr6fOld9bdbd4Sd/6Yecf/4frgJ9HhdSzi
	/7SvPGbiP9lLhPlr9jkmfWqR2yItM9m6an/z5v/qMg79AtNfz89jmVla1G/7YsHqrvw9T/f2
	fBewu9878enEls12k+uLgpJdy3RN6q6pLzsfFvrklFjJwuq9ajef62kfjO0/faK6YvtXpm3/
	K1yDy+zClGKvXG6/0toXv9Tj6VuLdp09H0VTlViKMxINtZiLihMB9CtZViUDAAA=
X-CMS-MailID: 20250213045543epcas5p2ff4ce49a4b047da1fc0a9b75af038c3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0
References: <CGME20250213004402epcas2p34923dcba3635ceed9b712a24f354d6f0@epcas2p3.samsung.com>
	<20250213004104.3881711-1-sw617.shin@samsung.com>

Hello Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin@samsung.com>
> Sent: Thursday, February 13, 2025 6:11 AM
> To: krzk@kernel.org; alim.akhtar@samsung.com; wim@linux-watchdog.org;
> linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; Kyunghwan Seo <khwan.seo@samsung.com>;
> Sangwook Shin <sw617.shin@samsung.com>
> Subject: [PATCH] watchdog: s3c2410_wdt: Fix PMU register bits for
> ExynosAutoV920 SoC
> 
> From: Kyunghwan Seo <khwan.seo@samsung.com>
> 
> Fix the PMU register bits for the ExynosAutoV920 SoC.
> This SoC has different bit information compared to its previous version,
> ExynosAutoV9, and we have made the necessary adjustments.
> 
> rst_stat_bit:
>     - ExynosAutoV920 cl0 : 0
>     - ExynosAutoV920 cl1 : 1
> 
> cnt_en_bit:
>     - ExynosAutoV920 cl0 : 8
>     - ExynosAutoV920 cl1 : 8
> 
> Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



