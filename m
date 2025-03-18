Return-Path: <linux-watchdog+bounces-3126-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C5A66FAF
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 10:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A614222E7
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5555207A02;
	Tue, 18 Mar 2025 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LKJEaoke"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179A2066EF
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Mar 2025 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289943; cv=none; b=h1zYRPeT4QfeFJHeGuww7tyB6QAgLgWZ41cMCO53xMQ/jOlARJNYjPfGotev7nFltsQ6I28BvPl+OtYysjkYccpuoU2y6D0sHBouTRzGPCnSbIY/ZUeRKLZbI5IgD6ac8tNoqJTUxdBv1sjeFIXRU0ueipu9RwiT/tLFdXACkBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289943; c=relaxed/simple;
	bh=QGnOk8KWHcFXXVI+2rZ19t+ophfanXl5WpNFsRcQrzc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=C7wtDbJox5QnT5gAfaPBJrEltCQaSg0A0vnlQZtBquP8QaVuvPuwn9VSj1ctOUZUD6cUI8teZUHWAQ7xr4R7uZrYQrWtyVj6ays6mJYgBtx8Nrq/D1HjHA4Z86VkNMfXndh39trB/43mtfSQhKoPPuu9fI2OL5kjqz0B0Tom01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LKJEaoke; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250318092535epoutp0157d1adafad8343006fde06e0df66fe6d~t23cuQ1Sc0917409174epoutp01o
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Mar 2025 09:25:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250318092535epoutp0157d1adafad8343006fde06e0df66fe6d~t23cuQ1Sc0917409174epoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742289935;
	bh=1StXSRSMkeOQQJsmj1C0eudJiXT7wKXSaOlmhcJowtc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=LKJEaokejmbKBuA3CcmW4dStMaWEEJgX1YNkbdB8gU8Irs0V+Z9Nxp3Qnpq8d5oza
	 Ilx17JGmPSKqMiu3DDWdRiqN85wNMsDm1Lcf1GtDGG40N5H/H8zwhgzRMYI6sZ9De8
	 DxrQBO3iF0do1qm+OJlFbav4jNyJmLukLpOwA7NI=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250318092535epcas2p27b385e97dfcd27e1faefa33898013c4c~t23cQ6pw31410714107epcas2p2h;
	Tue, 18 Mar 2025 09:25:35 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4ZH5zf6rFzz4x9Q1; Tue, 18 Mar
	2025 09:25:34 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.DA.22094.E0C39D76; Tue, 18 Mar 2025 18:25:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250318092534epcas2p47ad924a460ba57696bb993686a534a0f~t23baJoay1336213362epcas2p4G;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250318092534epsmtrp22d88c7873a56fd6c60c64d2103215c28~t23bZeI6k1396413964epsmtrp2H;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-a1-67d93c0e25e6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CF.75.18949.E0C39D76; Tue, 18 Mar 2025 18:25:34 +0900 (KST)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250318092534epsmtip1be7a60dc4f2fe02c3d48480105c7b14e~t23bLjdwH2041320413epsmtip1D;
	Tue, 18 Mar 2025 09:25:34 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Kyunghwan	Seo'" <khwan.seo@samsung.com>
In-Reply-To: <81ce5a24-70b4-4dc7-af1c-3a193c5033e8@kernel.org>
Subject: RE: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Tue, 18 Mar 2025 18:25:34 +0900
Message-ID: <001e01db97e7$b3780b30$1a682190$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG67P3IPb+lR6iHsR4BOPQv+XcanAE12wemAZEiIRgBot3M3QJZ7to8AU8euc6zeVzuwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmmS6fzc10g6/zDC0ezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OL
	S/PS9fJSS6wMDQyMTIEKE7IzFnceYS54wVFxcfpK5gbGmexdjBwcEgImEk/ecnYxcnEICexg
	lPjcdZ4FwvnEKHF49WtGCOcbo8SOn4+AHE6wjqYzq9lAbCGBvYwS3T1ZEEUvGSWuTJnNDpJg
	E5CTWNrfxgJiiwhUSbTNOsgGUsQscIBR4s/iWWDdnAJ2Ete/dzCD2MICsRLHj19kArFZBFQl
	9k9aC9bMK2ApsWPSRkYIW1Di5MwnYHFmAXmJ7W/nMENcpCDx8+kyVohlYRKfT5xkgqgRkZjd
	2cYMslhCYC2HxKEXE6EaXCTO7r7EDmELS7w6vgXKlpL4/G4vGyRg8iVOPRGG6G1glHjX/J4N
	osZeYtGZn+DAYxbQlFi/Sx+iXFniyC2o0/gkOg7/hQYvr0RHmxBEo4pEx8/NrDCLjp55wD6B
	UWkWksdmIXlsFpIHZiHsWsDIsopRLLWgODc9tdiowAQe18n5uZsYwclVy2MH4+y3H/QOMTJx
	MB5ilOBgVhLhdX9yPV2INyWxsiq1KD++qDQntfgQoykwqCcyS4km5wPTe15JvKGJpYGJmZmh
	uZGpgbmSOG/1jpZ0IYH0xJLU7NTUgtQimD4mDk6pBia9Oa7vKv9LtxQLns7cwseku0OvLCzk
	xZO33rZC15eU/4qXrXtw4MfLwhOuKVfOG7emyz1e2ubf8K4lv31S04c9Tj7/VuiIsT7bEzAl
	86V08cOkty/m2k2dOn+C4mzfJzF6YuZ8HNpME6ST9vmt/6Q6ITFlu2C0fbSfsejyuN03FW5P
	47W/Y7ZVfptT+7y/PR5NCxY3ee8Ua76/eEtsatmnNVOcjOc/693t2HDzpsfFJOPf7ZyvJW6d
	dfMKX+tZusLjdgDHT6uyDy4X/11NSLvjqGhw5ivfIRHt++lLNOxSS556zpU1qFouNm+ziFq0
	XFrrq8V/yhjbmVMv/bLj6Wev9q9rD3qV5uJwhvuBkxJLcUaioRZzUXEiAG6TLHc3BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSnC6fzc10g8OX+SwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBmLO48wF7zgqLg4fSVzA+NM9i5GTg4J
	AROJpjOr2boYuTiEBHYzSrx98Jepi5EDKCEl8e6ZJUSNsMT9liOsEDXPGSWuv3vGBJJgE5CT
	WNrfxgJiiwjUSay+fJMRpIhZ4AijxNoHU9ghOi4xSTx/vRqsg1PATuL69w5mEFtYIFri+JQr
	YHEWAVWJ/ZPWgk3iFbCU2DFpIyOELShxcuYTsDizgLbE05tPoWx5ie1v5zBDnKcg8fPpMlaI
	K8IkPp84yQRRIyIxu7ONeQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwykst1ytO
	zC0uzUvXS87P3cQIjjYtrR2Me1Z90DvEyMTBeIhRgoNZSYTX/cn1dCHelMTKqtSi/Pii0pzU
	4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYtA4I6i9Zt3Fl8p9vrkVKsqKFCwU/
	TC36O0fwwmXxux4FGZyXJQoPLt3r2pcbOY+nL0Igs6k6oMxrZlSXSenz4rO+nre9tzsv/lZX
	P/3Fyf1lM8V2+RnvS1iYpSR6ruJogoJP2r349uX1YrEppxz5qiVi9uScYTZr8Er8+U/2sM8M
	8zOWizv2+2WU+T2//u2L3Y/XW+Z5rX29/ecCW54l27+8+9qvyRZ0YLl2bufBhgfqD12n6zgq
	SK3N2lx4ZGfar53Hr67IqXOa92HZtqdHNdarbbrxPWfR7OxfpX8fHDhqlP3sht7G+JXs++ru
	HY0P+nGxU8DYKjRD/IiVy5yXKxedMj0gxqeZdlZGadpVASWW4oxEQy3mouJEAD2CxI0lAwAA
X-CMS-MailID: 20250318092534epcas2p47ad924a460ba57696bb993686a534a0f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423
References: <9c94a771-b3e6-4ba4-9b7f-dcd93b53f924@kernel.org>
	<CGME20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423@epcas2p4.samsung.com>
	<20250318004411.695786-1-sw617.shin@samsung.com>
	<658c00e2-e8ef-4997-bb91-9620e97bafae@kernel.org>
	<000001db97e0$f2ef9e60$d8cedb20$@samsung.com>
	<81ce5a24-70b4-4dc7-af1c-3a193c5033e8@kernel.org>

Hello Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, March 18, 2025 5:57 PM
> To: sw617.shin@samsung.com; alim.akhtar@samsung.com; wim@linux-
> watchdog.org; linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; 'Kyunghwan Seo' <khwan.seo@samsung.com>
> Subject: Re: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
> ExynosAutoV920 SoC
> 
> On 18/03/2025 09:37, sw617.shin@samsung.com wrote:
> >> Why do you send patches which were applied?
> >>
> >> Best regards,
> >> Krzysztof
> >
> > I can't see this patch in -next yet.
> > Could you please advise me where it is? Then, I will check again.
> > If there are any missing parts that I need to handle on my end, please
> > let me know.
> I don't think you tried enough.
> 
> Best regards,
> Krzysztof

You're definitely right.
I found it with my colleague's help.
I was monitoring wrong ones.
Thanks for notice and sorry for making you uncomfortable.
Thank you.


