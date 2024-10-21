Return-Path: <linux-watchdog+bounces-2243-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC519A5A23
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 08:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6A6281A59
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD77194151;
	Mon, 21 Oct 2024 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="g0MdSgGP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8671946A0
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729490743; cv=none; b=UEkU0HuGigkCXguAhT01eRaK60EHh5z5V2pY9LI52xtIcyfCg4ouHIsYtvSaHMGW/A3QymeMDWARRdzvlld7JlV2b8xxwLfkHeivPPZ9pqQ5Lq/gvr4Bo5JGI2fTk8jmgg154jEeGkEoMvvXdYIr07ZDtQLdVsnzdPZrpdVnrQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729490743; c=relaxed/simple;
	bh=IIWio+BGWaSaW21PnnxARXZp4FionUCKZk/+r1D+oG8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=ZgmN89d6397uvKGxIM869csaD0Jj2LUmRG1DXRKu3NRSzXlsglUhFE9BWgzweNqciqPiS8fVTVT0t0ua5AMMJ22y2kc51MetUTAMrGlx9no+R4YdNkPrL+Z8mQJJE0gOcPaUSaNki664ILdev+nCoJq2qMy9oBiH0uHc6MRZg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=g0MdSgGP; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241021060538epoutp038d54fd5d0c3f76bc7f4f45011c6e83a6~AYqnJLGLP0753507535epoutp03x
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 06:05:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241021060538epoutp038d54fd5d0c3f76bc7f4f45011c6e83a6~AYqnJLGLP0753507535epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729490738;
	bh=cb03jBzckq9Uro4zVi90gsorpfxSmMqhnETvcsGXro4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=g0MdSgGP6pbOZvRs9RMEYa2XzU2jIOV+twWysW48vjYmHvfDq+K2shIludSNSjOCd
	 MviT5gtCmM52jFzhFQPnpGBZJoHsG8I6gakxwFXCAVoiNZHCP68ZDeXgdlUISqrWsr
	 8BTBVTy13SWkmh4Tmb7YBK23e432fiG3Zh8ZtRFA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241021060537epcas2p37bee194c61b47e11eac304db9cf11964~AYqmoU-pd1337213372epcas2p3x;
	Mon, 21 Oct 2024 06:05:37 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.68]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XX4YF2dRwz4x9Pr; Mon, 21 Oct
	2024 06:05:37 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.C8.18950.03FE5176; Mon, 21 Oct 2024 15:05:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241021060535epcas2p1f716c45ee988775fb2a2b9790435126d~AYqkyqKGt1960619606epcas2p1W;
	Mon, 21 Oct 2024 06:05:35 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241021060535epsmtrp2f0b46818128934af63d237155420f084~AYqkxv7BR0397203972epsmtrp2c;
	Mon, 21 Oct 2024 06:05:35 +0000 (GMT)
X-AuditID: b6c32a4d-1f1c070000004a06-6e-6715ef304a3a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.64.08227.F2FE5176; Mon, 21 Oct 2024 15:05:35 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.18.158]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241021060535epsmtip2fea2c687d755854e22e3c927d20cbb56~AYqkfoj_F3072430724epsmtip2O;
	Mon, 21 Oct 2024 06:05:35 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Wim Van Sebroeck'"
	<wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob
 Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <f9bbe108-1a0d-451f-a1c7-14e8aadc76b5@kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: watchdog: Document ExynosAutoV920
 watchdog bindings
Date: Mon, 21 Oct 2024 15:05:35 +0900
Message-ID: <003f01db237f$3e707de0$bb5179a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKShxVw65UJgYXARO76wzJ5NcLQ6AK2VKhSAdj3/m8BY0zLI7DyOOGg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRmVeSWpSXmKPExsWy7bCmqa7Be9F0gyNTuC0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Novz5zewW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y+PHSYwFBwQr5p39y9TA
	eIuvi5GTQ0LAROLhm7ksXYxcHEICexgl5j47zQThfGKUWPPkJyuE841RYtGOG2wwLRv/nINK
	7GWUmL/jKzOE85JRYvX6BcwgVWwCFhJLrn0AmyUisIFJYuqZm6wgCWaB24wSO98bg9icAnYS
	DzpWs4DYwgJxEm23L4E1swioSsxeuoMdxOYVsJS4f+w3C4QtKHFy5hMWiDnyEtvfzmGGOElB
	4ufTZWDzRQTcJHY+6GCGqBGRmN3ZBnadhMAZDonX81ewQjS4SPzc9xzqH2GJV8e3sEPYUhKf
	3+2FiudLrFx5ggnCrpG417aLBcK2l1h05idQPQfQAk2J9bv0QUwJAWWJI7egTuOT6Dj8lx0i
	zCvR0SYEYapKTF8WADFDWmLijLVsExiVZiH5axaSv2YhuX8WwqoFjCyrGKVSC4pz01OTjQoM
	dfNSy+ERnpyfu4kRnI61fHcwvl7/V+8QIxMH4yFGCQ5mJRFepRLRdCHelMTKqtSi/Pii0pzU
	4kOMpsDQnsgsJZqcD8wIeSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFx
	cEo1MFk3v33mUh3pr9NukMyYL9X1+84j7rrQZsVVtx38pt7b8Cg6ZWteT3rHpPSvEUbrflVk
	Hmvc9VRRniGy+cChTbekZbYdsX187sTEk1yHukUZX8YtC7oQ9+9ix6L17n68XyYFT+hzffBx
	Pe/vooNH19nlGhUant4iV7Bh5q1Z3ybaxWr8ntCZ3VW0YvqrD/2rNGIWeJjUP4tasa1h9vMH
	1zkVAs7Eqm5O3Mjz117HsP1WB6fhI8l9YaHbKxhVH19cUDv7L9PNsJBTO3Ydfjj5j2zzBKu5
	T3SfPUvY/kpBRvJH7ctDnypXn64WONy760pSzrZLHRoqu9fKVGk6l+n/56s/YOrA6sl74Vkm
	e3hFFIcSS3FGoqEWc1FxIgBcolYoUAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSvK7+e9F0g7trlS0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Novz5zewW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWx
	8eMkxoIDghXzzv5lamC8xdfFyMkhIWAisfHPOdYuRi4OIYHdjBI/+n6zQySkJY78fsEGYQtL
	3G85AlX0nFHizPtOVpAEm4CFxJJrH5hAEiICW5gkpr86xQjiMAs8ZJT4/+oAVMtXRon+3Y9Y
	QFo4BewkHnSsBrOFBWIkDq48ywhiswioSsxeugNsN6+ApcT9Y79ZIGxBiZMzn4DZzALaEk9v
	PoWy5SW2v53DDHGfgsTPp8vAThIRcJPY+aCDGaJGRGJ2ZxvzBEbhWUhGzUIyahaSUbOQtCxg
	ZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcmVpaOxj3rPqgd4iRiYPxEKMEB7OS
	CK9SiWi6EG9KYmVValF+fFFpTmrxIUZpDhYlcd5vr3tThATSE0tSs1NTC1KLYLJMHJxSDUzS
	rDeuPQvRd186jWfy/sdJTJ5qTtLZhZvk7Rsd597oVpp167JexekDzBFflFZ8WHvj7c4lapE/
	BdYb6Ry6/0bC4sj0KxaL+tyfV02OObI5JrX7zkf3OUF3ljHMuLv/veqxhoMahwvfe0gd2h80
	d2X+By3bzm97VSK3qEn1bzxpfa5v4YcqycorMkJuj/8lWJXs7NMLe6+YoWQnt4A77sIXj2Az
	y8yqcpenqsqzr+18v1sxIMOD6dmONf1phw0/zNoT83VZbZ5WdfGftNBzkrZr+Ni790/LmfGn
	l/Gfs91dtcM//3db8PLM/3F4sa2L2umjiilcu3azr2gV5f+iIligUWGymcG4JOHS7neXJhQr
	sRRnJBpqMRcVJwIAzR8uDzsDAAA=
X-CMS-MailID: 20241021060535epcas2p1f716c45ee988775fb2a2b9790435126d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93
References: <20241010111807.3635504-1-trunixs.kim@samsung.com>
	<CGME20241010111837epcas2p11dddc10945ca0648997dccaaf4854d93@epcas2p1.samsung.com>
	<20241010111807.3635504-2-trunixs.kim@samsung.com>
	<f9bbe108-1a0d-451f-a1c7-14e8aadc76b5@kernel.org>

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, October 10, 2024 8:47 PM
> To: Taewan Kim <trunixs.kim@samsung.com>; Wim Van Sebroeck <wim@linux-
> watchdog.org>; Guenter Roeck <linux@roeck-us.net>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; Byoungtae Cho <bt.cho@samsung.com>
> Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Document ExynosAutoV920
> watchdog bindings
> 
> On 10/10/2024 13:18, Taewan Kim wrote:
> > From: Byoungtae Cho <bt.cho@samsung.com>
> >
> > Add "samsung-exynosautov920-wdt" compatible to the dt-schema document.
> > ExynosAutoV920 is new SoC for automotive, similar to
> > exynosautov9 but some CPU configurations are quite different.
> >
> > Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> > Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> 
> Shall we do the work twice?

I missed it by mistake, I'm sorry.
I will push v3 with tags.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions,
> under or above your Signed-off-by tag. Tag is "received", when provided in
> a message replied to you on the mailing list. Tools like b4 can help here.
> However, there's no need to repost patches *only* to add the tags. The
> upstream maintainer will do that for tags received on the version they
> apply.
> 
> https://protect2.fireeye.com/v1/url?k=19c96b19-46525206-19c8e056-
> 000babdfecba-8f51e01dd01bb666&q=1&e=eb401f36-1904-4376-adea-
> 9688adb1d657&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.5-
> rc3%2Fsource%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%23L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof



