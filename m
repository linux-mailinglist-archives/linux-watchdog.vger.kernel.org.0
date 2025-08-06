Return-Path: <linux-watchdog+bounces-3973-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8918B1BFB7
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 06:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98B6E623125
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Aug 2025 04:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBAA1E521B;
	Wed,  6 Aug 2025 04:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jr5wS6qo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D441CAA7B
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 04:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754455866; cv=none; b=K48gsYRm7Jzo9BlJEbgNaAtSYKhfwzktpOxqdkb98V+QRu1O68yPApo1CYBFv2P++9Y57V+cxx06W6Wsg7Lt3LbEWk9JBPG04QwozBOY+p3XwZcU8VfxSiqcs+TqekvDnwibJGnv1K+63WuQ38v/BYOH/LpJPwnXcebqxn6ZZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754455866; c=relaxed/simple;
	bh=5Wntl6eu7ezcflQfPQPNfQG7jWvlblggiiBPfMJcGUs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=uopwE54ML7L19OAy3PNWS6wnHjfbfQ4ywF4LvrlscKZ08eB/p2Kw3ILEJ5xbXzHidi9YYFz9U8HeiR/vzfd7HQ5kLmkK8xFQiuEBjNKZ/mRB7NSKmVhNqXzMg5ZOzHqNTehzzJGYb3m9oaf2zFeHIE5Q3U0Jx3nwx3glSCbzL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jr5wS6qo; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250806045102epoutp01af13e293b622ce4c26f14cb43cac27be~ZFE-NGjvW0445104451epoutp01c
	for <linux-watchdog@vger.kernel.org>; Wed,  6 Aug 2025 04:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250806045102epoutp01af13e293b622ce4c26f14cb43cac27be~ZFE-NGjvW0445104451epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754455862;
	bh=YU3uFobEDt7UCHiGq89i23dmZccxqlh+VM2cnKCVKRQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jr5wS6qoyXUUUyapJtuC/sEXHT6KHoIOpku1UzgGlPod23OVYzctfcMV1B/KX66iq
	 8kHWfekH2qCnwX9GWez0Dkpv1RaeoNxUBjfzZDuEAbGltQzltfm3Xm7Vfy5QukAVvU
	 SwKypBpZKDPD1xzsgIvQNSkrb8+xb0p6mwtPyECk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250806045101epcas2p3f00ba8fa50537d7010600e037a49d7bc~ZFE_XFbdR2005420054epcas2p3-;
	Wed,  6 Aug 2025 04:51:01 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxdCn40Vxz3hhT9; Wed,  6 Aug
	2025 04:51:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250806045100epcas2p4f12e6b71c1d6e474e049a9c22f4c9e3d~ZFE9Uzwwh0063400634epcas2p4q;
	Wed,  6 Aug 2025 04:51:00 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250806045100epsmtip27d9e91b14160102a5feba58a6b8eb732~ZFE9Q6bIV0726907269epsmtip2G;
	Wed,  6 Aug 2025 04:51:00 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: "'Guenter Roeck'" <linux@roeck-us.net>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Wed, 6 Aug 2025 13:51:00 +0900
Message-ID: <01e001dc068d$b4b94b70$1e2be250$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfwwEQ7YR8A5N0zr4BpLWR/AENAjt5APhqm1WzsyI8gA==
Content-Language: ko
X-CMS-MailID: 20250806045100epcas2p4f12e6b71c1d6e474e049a9c22f4c9e3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p38e95932ddc5c702e05a6436f05582993
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
	<20250724080854.3866566-1-sw617.shin@samsung.com>
	<20250724080854.3866566-3-sw617.shin@samsung.com>
	<CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
	<000a01dc05c0$9f0ab110$dd201330$@samsung.com>
	<18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
	<CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
	<008501dc05da$36362600$a2a27200$@samsung.com>
	<CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>

On Wednesday, August 6, 2025 at 7:53 AM Sam Protsenko <semen.protsenko=40li=
naro.org> wrote:

>=20
> I don't mind, although it's quite easy to fix the code I suggested by
> replacing this line:
>=20
>     u64 t_max =3D n_max / freq;
>=20
> with this one:
>=20
>     u64 t_max =3D div64_ul(n_max, freq);
>=20
> from <math64.h>, as Guenter suggested. But I'm totally fine with your
> implementation as well.

Sam Protsenko and Guenter Roeck, thank you for your kind advice.
As you mentioned, I will proceed with the following code for the next patch=
 set.

=40=40 -27,6 +27,7 =40=40
 =23include <linux/mfd/syscon.h>
 =23include <linux/regmap.h>
 =23include <linux/delay.h>
+=23include <linux/math64.h>

 =23define S3C2410_WTCON          0x00
 =23define S3C2410_WTDAT          0x04
=40=40 -410,9 +411,13 =40=40 static inline unsigned long s3c2410wdt_get_fre=
q(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 =7B
        const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
+       //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x800=
0
+       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);

-       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX +=
 1)
-                                      / S3C2410_WTCON_MAXDIV);
+       if (t_max > UINT_MAX)
+               t_max =3D UINT_MAX;
+
+       return t_max;
 =7D


