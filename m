Return-Path: <linux-watchdog+bounces-2159-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D908997F51
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 10:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C5F41C23938
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 08:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8C61E00B6;
	Thu, 10 Oct 2024 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="t2v9hUQg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651201E1A1F
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544897; cv=none; b=eFTbgXFMRtHzyjZB/QPubndu+s/cJog0HWHsBR/LmOPNi+Gx4KDJDHNnWt0XBYSOv5/Z4WzSJA3fc0+1qD1tq4e8iVLgUAZl2YwTeRHDkxIuiyeLSO25/CgnLuMZY+EK1mBBQH5vr562CIgMTXKmdrNQpmt7widWzZmJERk0GCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544897; c=relaxed/simple;
	bh=zmmuarEg/meYeS4+x7bOfqQq827p6Hje8eR0+Ub4K1s=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=jg4BKCbAFO5dZmm8WUCtPcyCDoIS3R3jv+6r+CPkNRP2SVAEXexOrIR+JGmPTrJ6wWhXUVN9pL2H+TnUV3d8Scg/6YH7xjeBQomnWxDvXdhEQbn0JChYDcMtsXS19A8eF31IbtlVriZwbasifED/3e4dy+6Zbenz/gExRXq8CKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=t2v9hUQg; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241010072127epoutp04587171890d1f9783e0af32f54e822446~9BmrAeXyJ2941729417epoutp04J
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:21:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241010072127epoutp04587171890d1f9783e0af32f54e822446~9BmrAeXyJ2941729417epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728544887;
	bh=eFHwSunMh4x/STddeWZ+qyxufOABiHlohn26QfKTBqI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=t2v9hUQgF/IhfxYsystjuGRARmQndheiKo1DBx3KMD0LRfhNJT14MY9S/2m9B93k4
	 Uiiu6+JRLLwt/46vrWsB1uCy3bJg2Iwr8qXUbxbXlyrr8qVQIiQoJ8mxdptGC5UbmA
	 wY5KNr/MUoGtWivX9omAPDCVHov/34aGSw30yBuI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241010072126epcas2p204fffa17bc50fb3c8276ed644e9879e9~9BmqWOYw20826408264epcas2p2G;
	Thu, 10 Oct 2024 07:21:26 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XPLlp1bxtz4x9Q8; Thu, 10 Oct
	2024 07:21:26 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	50.9B.09770.67087076; Thu, 10 Oct 2024 16:21:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241010072125epcas2p2e31b8d2e354ada2304272acf39dfded6~9BmpNW5360826408264epcas2p2B;
	Thu, 10 Oct 2024 07:21:25 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010072125epsmtrp1f5319d044989dd177c96c403164144ff~9BmpL4jtU2160921609epsmtrp1P;
	Thu, 10 Oct 2024 07:21:25 +0000 (GMT)
X-AuditID: b6c32a46-00dfa7000000262a-5d-67078076bbd1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.74.07371.57087076; Thu, 10 Oct 2024 16:21:25 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.18.158]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241010072125epsmtip17dde2313a929e8dc583715879f1828f0~9Bmo51Rjk3108931089epsmtip1x;
	Thu, 10 Oct 2024 07:21:25 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Wim Van Sebroeck'"
	<wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob
 Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <faf365a0-dfc4-4d26-9057-a80b977965e3@kernel.org>
Subject: RE: [PATCH 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Thu, 10 Oct 2024 16:21:24 +0900
Message-ID: <000001db1ae5$03d44ec0$0b7cec40$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFKfb4qWITpWweaAS1H/eZT7s/knAIPcUUdAog0DUQCYGjah7NpDXcQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmqW5ZA3u6weWTLBYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8X58xvYLTY9vsZqcXnXHDaLGef3MVncWLeP3eLJwjNMFv/37GC3
	ePzyH7MDr8emVZ1sHivXrGH12Lyk3mPn9wZ2j74tqxg9Pm+SC2CLyrbJSE1MSS1SSM1Lzk/J
	zEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpUSaEsMacUKBSQWFyspG9nU5Rf
	WpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdsbPpL2PBE/mKe53fWBsY
	V0l1MXJySAiYSCw69Im9i5GLQ0hgB6PEg5k/2EASQgKfGCX29HBBJL4xSly/38II0/HuyG1W
	iMReRonlR9qYIZyXjBIvz51lAaliE7CQWHLtAxNIQkRgA5PE1DM3WUESzAK3GSV2vjcGsTkF
	7CTuPb0ONlZYIERiSddiJhCbRUBV4sueC+wgNq+ApcSL01OYIWxBiZMzn7BAzJGX2P52DjPE
	SQoSP58uA5svIuAm8ef+FXaIGhGJ2Z0Q10kInOGQmDvhIFSDi8TkL1NZIWxhiVfHt7BD2FIS
	L/vboOx8iZUrTzBB2DUS99p2sUDY9hKLzvwEquEAWqApsX6XPogpIaAsceQW1Gl8Eh2H/7JD
	hHklOtqEIExVienLAiBmSEtMnLGWbQKj0iwkf81C8tcsJPfPQli1gJFlFaNYakFxbnpqsVGB
	ETyuk/NzNzGCk7CW2w7GKW8/6B1iZOJgPMQowcGsJMKru5A1XYg3JbGyKrUoP76oNCe1+BCj
	KTCkJzJLiSbnA/NAXkm8oYmlgYmZmaG5kamBuZI4773WuSlCAumJJanZqakFqUUwfUwcnFIN
	TBWlRj8PCJrErjWSltzvJ6nEFmYTeO70mmXB7rWaxg0R3ydeTVXUi3kdu7RHXGXyi298P6dk
	nzyckb3CdZ1605WQhCVFj77Nv14Z9+jFNf8H6z18v9zO4NcSiPd+K6i1lF3860PXw4uvOhZU
	XDjxjbX8TmvpjO5Vy2bz9X/mNpFiep0vZeZrcMp/6a+b3zYenb5JbPVMw4ZjOT1zdj/6yy+x
	xuhhwKka7V3qWb8bDqkraGWKnElJnCix7Nqt5pX797Ko/ntyuNP/nv/KK3ecvqksYBU/7d3z
	7n9a64O+ia/X/uZcuEh5w9NAJ/a04EKD3PjDX10nfL46YcHStwr+y3UFbhtwpZt/aH620CVB
	6K0SS3FGoqEWc1FxIgCKGOnUSwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSnG5pA3u6QcMVaYsH87axWdz/1Mdk
	sWbvOSaL+UfOsVq8nHWPzeL8+Q3sFpseX2O1uLxrDpvFjPP7mCxurNvHbvFk4Rkmi/97drBb
	PH75j9mB12PTqk42j5Vr1rB6bF5S77HzewO7R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGXs
	bPrLWPBEvuJe5zfWBsZVUl2MnBwSAiYS747cZu1i5OIQEtjNKHGo+RQbREJa4sjvF1C2sMT9
	liNQRc8ZJbaePsUOkmATsJBYcu0DE0hCRGALk8T0V6cYQRxmgYeMEv9fHYBq+coosWDdarBZ
	nAJ2EveeXmcEsYUFgiRazi9lBbFZBFQlvuy5ADaWV8BS4sXpKcwQtqDEyZlPWEBsZgFtiac3
	n0LZ8hLb385hhrhPQeLn02Vgc0QE3CT+3L/CDlEjIjG7s415AqPwLCSjZiEZNQvJqFlIWhYw
	sqxilEwtKM5Nz002LDDMSy3XK07MLS7NS9dLzs/dxAiOTC2NHYz35v/TO8TIxMF4iFGCg1lJ
	hFd3IWu6EG9KYmVValF+fFFpTmrxIUZpDhYlcV7DGbNThATSE0tSs1NTC1KLYLJMHJxSDUyM
	KXoNsVYcc3tnlxfV/jz/iW3pfheVn1dWuH2/et41LuPF8Wf9U9XcZXYsEDA0kVh0o+y8YM8d
	tVtVscuVZ6xSNa9SDtaw/5m9z39P2v8133yvn5Zse6b6vNWgeJbXvgMKrR4i4T83fGBrXifb
	M/v6w/9RJ8LezHldcDt5prBo90vLDRVpkivd7qaKa/24U3s4uo1bpFFeplvr6oR7+lt/cGto
	SCzeweiecT4jZ/mPkGmd066JenKwsIl3RP+X/r05TWcez2/9qAcLg/brvNITf7c04e3JlokV
	75Tuzwyf39T88u+RXZ+3HF27k8ln9aojxY/DTJ7zC7/a+nTFso0ffskxbLql/eFvTIKgl6qQ
	EktxRqKhFnNRcSIAH5ck5DsDAAA=
X-CMS-MailID: 20241010072125epcas2p2e31b8d2e354ada2304272acf39dfded6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
	<CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>
	<20240913080325.3676181-3-trunixs.kim@samsung.com>
	<faf365a0-dfc4-4d26-9057-a80b977965e3@kernel.org>

Hi,

Thank you for your review.
I will apply your point to v2 patch.

Best regards,
Taewan Kim.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, September 30, 2024 9:05 PM
> To: Taewan Kim <trunixs.kim@samsung.com>; Wim Van Sebroeck <wim@linux-
> watchdog.org>; Guenter Roeck <linux@roeck-us.net>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; Byoungtae Cho <bt.cho@samsung.com>
> Subject: Re: [PATCH 2/3] watchdog: s3c2410_wdt: add support for
> exynosautov920 SoC
> 
> On 13/09/2024 10:03, Taewan Kim wrote:
> > From: Byoungtae Cho <bt.cho@samsung.com>
> >
> > Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
> > is almost similar to ExynosAutoV9, but some CPU configurations are
> > quite different, so it should be added. Plus it also support DBGACK
> > like as
> > GS101 SoC.
> >
> > Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> > Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> > ---
> >  drivers/watchdog/s3c2410_wdt.c | 37
> > +++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c
> > b/drivers/watchdog/s3c2410_wdt.c index 686cf544d0ae..c25133348f0e
> > 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -63,6 +63,10 @@
> >  #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
> >  #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
> >  #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
> > +#define EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT	0x1420
> > +#define EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN	0x1444
> > +#define EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT	0x1720
> > +#define EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN	0x1744
> >
> >  #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
> >  #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
> > @@ -303,6 +307,32 @@ static const struct s3c2410_wdt_variant
> drv_data_gs101_cl1 = {
> >  		  QUIRK_HAS_DBGACK_BIT,
> >  };
> >
> > +static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
> > +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
> > +	.mask_bit = 2,
> > +	.mask_reset_inv = true,
> > +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> > +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
> > +	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
> > +	.cnt_en_bit = 7,
> > +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> > +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > +		  QUIRK_HAS_DBGACK_BIT,
> > +};
> > +
> > +static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
> > +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
> > +	.mask_bit = 2,
> > +	.mask_reset_inv = true,
> > +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
> > +	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
> > +	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
> > +	.cnt_en_bit = 7,
> > +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> > +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> > +		  QUIRK_HAS_DBGACK_BIT,
> > +};
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] = {
> >  	{ .compatible = "google,gs101-wdt",
> >  	  .data = &drv_data_gs101_cl0 },
> > @@ -320,6 +350,8 @@ static const struct of_device_id s3c2410_wdt_match[]
> = {
> >  	  .data = &drv_data_exynos850_cl0 },
> >  	{ .compatible = "samsung,exynosautov9-wdt",
> >  	  .data = &drv_data_exynosautov9_cl0 },
> > +	{ .compatible = "samsung,exynosautov920-wdt",
> > +	  .data = &drv_data_exynosautov920_cl0},
> 
> Missing space before }
> 
> >  	{},
> >  };
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof



