Return-Path: <linux-watchdog+bounces-2160-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5103997F69
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 10:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70081C20CEC
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 08:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A405C1E7C3C;
	Thu, 10 Oct 2024 07:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RGY6z760"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B481E7C28
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728545140; cv=none; b=UckPbnVhwxnKWu2v8BjIhQLZUS9j/7H5IcDv3k4UkJhoTrwisNGqHVdgwldPDcWLNnX4E1V0/XBN3DSMEVf5TfnbiJjbksLN/0WB+RlC9gHlKoNaD14uXH/hynVWXH1uOr3BrT9oaW95kClAh3+cMzPI9GPZ20pnq7rmboOemcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728545140; c=relaxed/simple;
	bh=vQqyT4RZVokuzbO0JRIrNW/r5/VvefJsEtON0/yUBZ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tcQWl3dDIE12XCEtjszP1PeqlRNJr3JDiY/FlEgxpluU7k06aVj1cVJM1xt7H16ILP6+5lXe+JQHZi6+LZPFd7khTyzn79Kd2mDCChy2T08Q8Kce3Q2ItnkTMuMdDqG5vTTKeTzPnESfrFFC4soVNg5CHNmY+5SzS6CcQjAVVPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RGY6z760; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241010072535epoutp01754db6b6ac760d487908d34f15a2ba34~9BqR_87w_1570215702epoutp01g
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:25:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241010072535epoutp01754db6b6ac760d487908d34f15a2ba34~9BqR_87w_1570215702epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728545135;
	bh=vQqyT4RZVokuzbO0JRIrNW/r5/VvefJsEtON0/yUBZ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RGY6z760Y/GtU/IWIgennM0sTF/7ECkVOaQI5Oszb4HRCZlB0dCfDc5u1eFjle1NB
	 oxVm0BHa6q5jErEXyARvdatFkGYTb+6kI4uVidu+Eyrz3yWr43gcHcu0G+S3fBP44P
	 AL9Evyb+5z8PRrZYRrV8Y0sCLQFIj5l3zXzXhPLo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241010072533epcas2p13f1cf775a6c1bf516e21e7e373b41ee3~9BqPx_qSl1610316103epcas2p1U;
	Thu, 10 Oct 2024 07:25:33 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XPLrX4NSRz4x9QB; Thu, 10 Oct
	2024 07:25:32 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	0B.3A.09776.C6187076; Thu, 10 Oct 2024 16:25:32 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241010072532epcas2p3c18ae14228efb4c8a962ef3e1a4aa974~9BqOtDDlK1398213982epcas2p3R;
	Thu, 10 Oct 2024 07:25:32 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010072532epsmtrp1f4536a1f343bc1f6d51e6e923280039c~9BqOsBits2355123551epsmtrp1h;
	Thu, 10 Oct 2024 07:25:32 +0000 (GMT)
X-AuditID: b6c32a47-d53fa70000002630-6f-6707816c61ea
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.E1.18937.B6187076; Thu, 10 Oct 2024 16:25:31 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.18.158]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241010072531epsmtip19851def528df4e88f2b54050b2e4134a~9BqOfHyNb0096000960epsmtip18;
	Thu, 10 Oct 2024 07:25:31 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: "'Wim Van Sebroeck'" <wim@linux-watchdog.org>, "'Guenter Roeck'"
	<linux@roeck-us.net>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	"'Alim Akhtar'" <alim.akhtar@samsung.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	"'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <CAPLW+4k0rpS0F14sqMGPbq_m=aMqK+g=PZewtZYYroQ+OQBeOQ@mail.gmail.com>
Subject: RE: [PATCH 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Thu, 10 Oct 2024 16:25:31 +0900
Message-ID: <000101db1ae5$96c111f0$c44335d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPcUUdHl+Ei7bfUILxdnz4wpISqAFKfb4qAog0DUQCf1lgZrHkV7og
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmhW5OI3u6wc2rihYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8Wmx9dYLS7vmsNmMeP8PiaLG+v2sVs8WXiGyeL/nh3sFs/7gGKP
	X/5jduD12LSqk83jzrU9bB4r16xh9di8pN5j5/cGdo++LasYPT5vkgtgj8q2yUhNTEktUkjN
	S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6VkmhLDGnFCgUkFhcrKRv
	Z1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnbH41HLWghkuFd/e
	XGRqYDzh2MXIySEhYCKx88l+9i5GLg4hgR2MEv9+HGSGcD4xSrxYtgXB2bThExNMy+muQ4wg
	tpDATkaJ5y81IYpeMkosftrCDpJgE7CQWHLtA1iDiICRxITlGxlBipgF7jFLvG57D5bgFAiU
	2HThBBuILSwQIrGkazFYnEVAVeLUzEPMIDavgKVEW/dmRghbUOLkzCcsIDazgLbEsoWvmSEu
	UpD4+XQZK8QyN4m9exZD1YhIzO5sA3tBQuAIh0THie+MEA0uEtOWT4N6R1ji1fEt7BC2lMTL
	/jYoO19i5coTUDU1EvfadrFA2PYSi878BKrhAFqgKbF+lz6IKSGgLHHkFtRaPomOw3/ZIcK8
	Eh1tQhCmqsT0ZQEQM6QlJs5YyzaBUWkWkr9mIflrFpL7ZyGsWsDIsopRLLWgODc9tdiowBge
	18n5uZsYwelYy30H44y3H/QOMTJxMB5ilOBgVhLh1V3Imi7Em5JYWZValB9fVJqTWnyI0RQY
	0hOZpUST84EZIa8k3tDE0sDEzMzQ3MjUwFxJnPde69wUIYH0xJLU7NTUgtQimD4mDk6pBqZ5
	Mht+LtZUDA3QPH9fx67O/8M9zeSuolVN0/Z3Jt8/7B9b1BLQpcErwx6rucx3OR8/64JlArl9
	Igzdsw9o7gycIJp6IZ/zUtrnDT8lXZeyvHvzj5F5WnCm5OcbZ+NKL1bdncXvfFGZyTCoXXNx
	Zc+CIEWuy8nun4Ny1UQrJLIahEJVu3Zmeeta5f2bZ1lsdsxP82Zrn0BCue+t6Ucebkp5PDVq
	5mrvpRe9FeY7Wny8cNNtg+L/bRxtsUe3t8tdqjyWGcrjOqf3rPvJhWtWFXx5F9Fzu79K/kHN
	p4Bj4q/F99/5vTJCb9ex8iXOFmuj5rJH6rhcizF/9rvD+ZNgjVtcof1rbuUlh/6K1K/VVGIp
	zkg01GIuKk4EAIn4Kh9QBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnG52I3u6wYkLlhYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8Wmx9dYLS7vmsNmMeP8PiaLG+v2sVs8WXiGyeL/nh3sFs/7gGKP
	X/5jduD12LSqk83jzrU9bB4r16xh9di8pN5j5/cGdo++LasYPT5vkgtgj+KySUnNySxLLdK3
	S+DK+HlmM2PBFp2Kg/uWMDUwzlDsYuTkkBAwkTjddYixi5GLQ0hgO6NEx4PtTBAJaYkjv1+w
	QdjCEvdbjrCC2EICzxklPr2MAbHZBCwkllz7AFYvImAkMWH5RrBBzAIvmCVObr3BBtHQwSQx
	tzcJxOYUCJTYdOEEWFxYIEii5fxSsKEsAqoSp2YeYgaxeQUsJdq6NzNC2IISJ2c+YQGxmQW0
	JZ7efApnL1v4mhniOAWJn0+XsUIc4Saxd89iqBoRidmdbcwTGIVnIRk1C8moWUhGzULSsoCR
	ZRWjaGpBcW56bnKBoV5xYm5xaV66XnJ+7iZGcFRqBe1gXLb+r94hRiYOxkOMEhzMSiK8ugtZ
	04V4UxIrq1KL8uOLSnNSiw8xSnOwKInzKud0pggJpCeWpGanphakFsFkmTg4pRqYxDwqXvEs
	sYks91lkctqywfbOLqbz1bXP1Wds+1D34vrSWVuMnW/7a/ZnhnY8ELpx4u4eSfEbhuo3cnar
	zzjNOy1+klXsVy7LrnNyPhXyjafV2zhX/K35dcu/fMfhmsXeRyJ4jnyqefM/OE7m7r/5vzzP
	lz58d+toAefP9VoFu63+f7uzYYbShIdRSkEzQtcLOgss2yK77MzWqtRPz7+wvPv1iDXjwG7z
	0p/nA6u+cvbpHpsvwnc4cSpzm8hVOZmcXXmnVavmFgclP3I3n2L6KLuUjzls+/00uTftOeer
	vuhOykkStvPuWVS7remnwbQXirw5s+ovrVp+h9f9od6R5fEev9eZbtxlxnf4gf2SFCWW4oxE
	Qy3mouJEAJbfvu45AwAA
X-CMS-MailID: 20241010072532epcas2p3c18ae14228efb4c8a962ef3e1a4aa974
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
References: <CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>
	<20240913080325.3676181-1-trunixs.kim@samsung.com>
	<20240913080325.3676181-3-trunixs.kim@samsung.com>
	<CAPLW+4k0rpS0F14sqMGPbq_m=aMqK+g=PZewtZYYroQ+OQBeOQ@mail.gmail.com>

Hi,

Thank you for your review.
Yes, cl0 is correct not cl1.
I will apply it to v2 patch.

Best regards,
Taewan Kim.

> -----Original Message-----
> From: Sam Protsenko <semen.protsenko=40linaro.org>
> Sent: Tuesday, October 1, 2024 5:15 AM
> To: Taewan Kim <trunixs.kim=40samsung.com>
> Cc: Wim Van Sebroeck <wim=40linux-watchdog.org>; Guenter Roeck <linux=40r=
oeck-
> us.net>; Rob Herring <robh=40kernel.org>; Krzysztof Kozlowski
> <krzk+dt=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>; linux-watchdog=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; Byoung=
tae
> Cho <bt.cho=40samsung.com>
> Subject: Re: =5BPATCH 2/3=5D watchdog: s3c2410_wdt: add support for
> exynosautov920 SoC
>=20
> On Fri, Sep 13, 2024 at 3:04=E2=80=AFAM=20Taewan=20Kim=20<trunixs.kim=40s=
amsung.com>=20wrote:=0D=0A>=20>=0D=0A>=20>=20From:=20Byoungtae=20Cho=20<bt.=
cho=40samsung.com>=0D=0A>=20>=0D=0A>=20>=20Adds=20the=20compatibles=20and=
=20drvdata=20for=20the=20ExynosAuto=20V920=20SoC.=20This=20SoC=0D=0A>=20>=
=20is=20almost=20similar=20to=20ExynosAutoV9,=20but=20some=20CPU=20configur=
ations=20are=0D=0A>=20>=20quite=20different,=20so=20it=20should=20be=20adde=
d.=20Plus=20it=20also=20support=20DBGACK=0D=0A>=20>=20like=20as=0D=0A>=20>=
=20GS101=20SoC.=0D=0A>=20>=0D=0A>=20>=20Signed-off-by:=20Byoungtae=20Cho=20=
<bt.cho=40samsung.com>=0D=0A>=20>=20Signed-off-by:=20Taewan=20Kim=20<trunix=
s.kim=40samsung.com>=0D=0A>=20>=20---=0D=0A>=20>=20=20drivers/watchdog/s3c2=
410_wdt.c=20=7C=2037=0D=0A>=20>=20+++++++++++++++++++++++++++++++++-=0D=0A>=
=20>=20=201=20file=20changed,=2036=20insertions(+),=201=20deletion(-)=0D=0A=
>=20>=0D=0A>=20>=20diff=20--git=20a/drivers/watchdog/s3c2410_wdt.c=0D=0A>=
=20>=20b/drivers/watchdog/s3c2410_wdt.c=20index=20686cf544d0ae..c25133348f0=
e=0D=0A>=20>=20100644=0D=0A>=20>=20---=20a/drivers/watchdog/s3c2410_wdt.c=
=0D=0A>=20>=20+++=20b/drivers/watchdog/s3c2410_wdt.c=0D=0A>=20>=20=40=40=20=
-63,6=20+63,10=20=40=40=0D=0A>=20>=20=20=23define=20EXYNOS850_CLUSTER1_NONC=
PU_INT_EN=20=20=20=20=20=20=200x1644=0D=0A>=20>=20=20=23define=20EXYNOSAUTO=
V9_CLUSTER1_NONCPU_OUT=20=20=20=20=20=20=200x1520=0D=0A>=20>=20=20=23define=
=20EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN=20=20=20=200x1544=0D=0A>=20>=20+=23d=
efine=20EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT=20=20=20=20=200x1420=0D=0A>=20>=
=20+=23define=20EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN=20=200x1444=0D=0A>=20=
>=20+=23define=20EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT=20=20=20=20=200x1720=0D=
=0A>=20>=20+=23define=20EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN=20=200x1744=
=0D=0A>=20>=0D=0A>=20>=20=20=23define=20EXYNOS850_CLUSTER0_WDTRESET_BIT=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=2024=0D=0A>=20>=20=20=23define=
=20EXYNOS850_CLUSTER1_WDTRESET_BIT=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=2023=0D=0A>=20>=20=40=40=20-303,6=20+307,32=20=40=40=20static=20cons=
t=20struct=20s3c2410_wdt_variant=0D=0A>=20drv_data_gs101_cl1=20=3D=20=7B=0D=
=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20QUIRK_HAS_=
DBGACK_BIT,=20=20=7D;=0D=0A>=20>=0D=0A>=20>=20+static=20const=20struct=20s3=
c2410_wdt_variant=20drv_data_exynosautov920_cl0=20=3D=20=7B=0D=0A>=20>=20+=
=20=20=20=20=20=20=20.mask_reset_reg=20=3D=20EXYNOSAUTOV920_CLUSTER0_NONCPU=
_INT_EN,=0D=0A>=20>=20+=20=20=20=20=20=20=20.mask_bit=20=3D=202,=0D=0A>=20>=
=20+=20=20=20=20=20=20=20.mask_reset_inv=20=3D=20true,=0D=0A>=20>=20+=20=20=
=20=20=20=20=20.rst_stat_reg=20=3D=20EXYNOS5_RST_STAT_REG_OFFSET,=0D=0A>=20=
>=20+=20=20=20=20=20=20=20.rst_stat_bit=20=3D=20EXYNOSAUTOV9_CLUSTER0_WDTRE=
SET_BIT,=0D=0A>=20>=20+=20=20=20=20=20=20=20.cnt_en_reg=20=3D=20EXYNOSAUTOV=
920_CLUSTER0_NONCPU_OUT,=0D=0A>=20>=20+=20=20=20=20=20=20=20.cnt_en_bit=20=
=3D=207,=0D=0A>=20>=20+=20=20=20=20=20=20=20.quirks=20=3D=20QUIRK_HAS_WTCLR=
INT_REG=20=7C=20QUIRK_HAS_PMU_MASK_RESET=20=7C=0D=0A>=20>=20+=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20QUIRK_HAS_PMU_RST_STAT=20=7C=20QUIRK=
_HAS_PMU_CNT_EN=20=7C=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20QUIRK_HAS_DBGACK_BIT,=20=7D;=0D=0A>=20>=20+=0D=0A>=20>=20+stati=
c=20const=20struct=20s3c2410_wdt_variant=20drv_data_exynosautov920_cl1=20=
=3D=20=7B=0D=0A>=20>=20+=20=20=20=20=20=20=20.mask_reset_reg=20=3D=20EXYNOS=
AUTOV920_CLUSTER1_NONCPU_INT_EN,=0D=0A>=20>=20+=20=20=20=20=20=20=20.mask_b=
it=20=3D=202,=0D=0A>=20>=20+=20=20=20=20=20=20=20.mask_reset_inv=20=3D=20tr=
ue,=0D=0A>=20>=20+=20=20=20=20=20=20=20.rst_stat_reg=20=3D=20EXYNOS5_RST_ST=
AT_REG_OFFSET,=0D=0A>=20>=20+=20=20=20=20=20=20=20.rst_stat_bit=20=3D=20EXY=
NOSAUTOV9_CLUSTER1_WDTRESET_BIT,=0D=0A>=20>=20+=20=20=20=20=20=20=20.cnt_en=
_reg=20=3D=20EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,=0D=0A>=20>=20+=20=20=20=20=
=20=20=20.cnt_en_bit=20=3D=207,=0D=0A>=20>=20+=20=20=20=20=20=20=20.quirks=
=20=3D=20QUIRK_HAS_WTCLRINT_REG=20=7C=20QUIRK_HAS_PMU_MASK_RESET=20=7C=0D=
=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20QUIRK_HAS_PM=
U_RST_STAT=20=7C=20QUIRK_HAS_PMU_CNT_EN=20=7C=0D=0A>=20>=20+=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20QUIRK_HAS_DBGACK_BIT,=20=7D;=0D=0A>=20>=
=20+=0D=0A>=20>=20=20static=20const=20struct=20of_device_id=20s3c2410_wdt_m=
atch=5B=5D=20=3D=20=7B=0D=0A>=20>=20=20=20=20=20=20=20=20=20=7B=20.compatib=
le=20=3D=20=22google,gs101-wdt=22,=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=
=20.data=20=3D=20&drv_data_gs101_cl0=20=7D,=20=40=40=20-320,6=20+350,8=20=
=40=40=20static=0D=0A>=20>=20const=20struct=20of_device_id=20s3c2410_wdt_ma=
tch=5B=5D=20=3D=20=7B=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20.data=20=
=3D=20&drv_data_exynos850_cl0=20=7D,=0D=0A>=20>=20=20=20=20=20=20=20=20=20=
=7B=20.compatible=20=3D=20=22samsung,exynosautov9-wdt=22,=0D=0A>=20>=20=20=
=20=20=20=20=20=20=20=20=20.data=20=3D=20&drv_data_exynosautov9_cl0=20=7D,=
=0D=0A>=20>=20+=20=20=20=20=20=20=20=7B=20.compatible=20=3D=20=22samsung,ex=
ynosautov920-wdt=22,=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20.data=20=3D=
=20&drv_data_exynosautov920_cl0=7D,=0D=0A>=20>=20=20=20=20=20=20=20=20=20=
=7B=7D,=0D=0A>=20>=20=20=7D;=0D=0A>=20>=20=20MODULE_DEVICE_TABLE(of,=20s3c2=
410_wdt_match);=20=40=40=20-643,7=20+675,8=20=40=40=0D=0A>=20>=20s3c2410_ge=
t_wdt_drv_data(struct=20platform_device=20*pdev,=20struct=0D=0A>=20s3c2410_=
wdt=20*wdt)=0D=0A>=20>=20=20=20=20=20=20=20=20=20/*=20Choose=20Exynos850/Ex=
ynosAutov9=20driver=20data=20w.r.t.=20cluster=20index=0D=0A>=20*/=0D=0A>=20=
>=20=20=20=20=20=20=20=20=20if=20(variant=20=3D=3D=20&drv_data_exynos850_cl=
0=20=7C=7C=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20variant=20=3D=
=3D=20&drv_data_exynosautov9_cl0=20=7C=7C=0D=0A>=20>=20-=20=20=20=20=20=20=
=20=20=20=20=20variant=20=3D=3D=20&drv_data_gs101_cl0)=20=7B=0D=0A>=20>=20+=
=20=20=20=20=20=20=20=20=20=20=20variant=20=3D=3D=20&drv_data_gs101_cl0=20=
=7C=7C=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=20variant=20=3D=3D=20&d=
rv_data_exynosautov920_cl0)=20=7B=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20u32=20index;=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20int=20err;=0D=0A>=20>=0D=0A>=20>=20=40=40=20-662,6=20+=
695,8=20=40=40=20s3c2410_get_wdt_drv_data(struct=20platform_device=0D=0A>=
=20*pdev,=20struct=20s3c2410_wdt=20*wdt)=0D=0A>=20>=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
variant=20=3D=20&drv_data_exynosautov9_cl1;=0D=0A>=20>=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20else=20if=20(variant=
=20=3D=3D=20&drv_data_gs101_cl0)=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20varian=
t=20=3D=20&drv_data_gs101_cl1;=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20else=20if=20(variant=20=3D=3D=0D=0A>=
=20>=20+=20&drv_data_exynosautov920_cl1)=0D=0A>=20=0D=0A>=20Shouldn't=20it=
=20be=20cl0=20here?=0D=0A>=20=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20variant=20=
=3D=0D=0A>=20>=20+=20&drv_data_exynosautov920_cl1;=0D=0A>=20>=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20break;=0D=0A=
>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20default:=0D=0A>=20>=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
return=20dev_err_probe(dev,=20-EINVAL,=20=22wrong=0D=0A>=20>=20cluster=20in=
dex:=20%u=5Cn=22,=20index);=0D=0A>=20>=20--=0D=0A>=20>=202.46.0=0D=0A>=20>=
=0D=0A>=20>=0D=0A=0D=0A

