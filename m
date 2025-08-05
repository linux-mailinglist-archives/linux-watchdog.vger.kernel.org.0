Return-Path: <linux-watchdog+bounces-3962-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74AB1AD17
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 06:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F833B7249
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 04:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56522135A1;
	Tue,  5 Aug 2025 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ubkh80zG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B233597A
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 04:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754367784; cv=none; b=GcqnfXPdnboas2+jINA8BVzqguM6Un7BVQirDiJvJ/YVvSXRWx8EXUuFyAwFDLPqurLFsnKhMP5YQh9Uw/aq2MFCmCNohhhcVPNZ/AHmCQL9i5l9HHWqrg71M3XgrWCi3Pbs19Row/7eHWkImVjHt0mEpd3w91abfNSnRziR0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754367784; c=relaxed/simple;
	bh=x4qAdIOwabgKrjpzT3JrvXoHgiyopFX+ODTpj23JAwI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Nu9k4uy1lTMeUOn5aQdzdUo/D3YlSuUWDWW0GWe4Z8ozi8jJQ8SrvFpo5nbCwqjHcoTLYDGWZ37OADFeNMtk96iUnnVNnvHwsojq0L5m+HBDhhZa7gH5BqkMs4OJDQLCgZ87iwOCH26AS8f+0izcqHFlnl6qJmUTNOzG7S4DkSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ubkh80zG; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250805042259epoutp0439ca26013bbef4085d605f8f7139bbcb~YxDNpF0Gp1682616826epoutp04k
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 04:22:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250805042259epoutp0439ca26013bbef4085d605f8f7139bbcb~YxDNpF0Gp1682616826epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754367779;
	bh=dYOmk++d7CASSvlIW8u4QMsdypGYRvSYn8mi2FnZsnw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ubkh80zGGacpBKtPqHK4g+eF4TdnmFD8gKTFMcafYfhycc1ngt4iJRN4ZqRKcXZF/
	 qPewIL0AEd0gs0Ms1497LBVxAOcui4FJbLkVQBpBLr6buz85zxOsf8vOmxmZwenrDR
	 8M0Uj5VXtcVvZFbq/Ms5affHB8q9+x+e50lKgAHQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805042259epcas2p3a3c30bbe884d5f154777b431b94be1fa~YxDMw1Kf82531325313epcas2p3u;
	Tue,  5 Aug 2025 04:22:59 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bx0dt22cDz6B9mD; Tue,  5 Aug
	2025 04:22:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250805042257epcas2p1be233a189b619f4b6fc2253931a2dfc5~YxDLadew41226612266epcas2p1d;
	Tue,  5 Aug 2025 04:22:57 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805042257epsmtip22d4312d31b3c174c806adc6fe9821709~YxDLWqroy2523925239epsmtip2E;
	Tue,  5 Aug 2025 04:22:57 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Tue, 5 Aug 2025 13:22:57 +0900
Message-ID: <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfw7Pz5ruw
Content-Language: ko
X-CMS-MailID: 20250805042257epcas2p1be233a189b619f4b6fc2253931a2dfc5
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

On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko=40lin=
aro.org> wrote:

> How about something like this instead?
>=20
> 8<--------------------------------------------------------------------->8
> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) =7B
>     const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
>                 S3C2410_WTCON_MAXDIV; /* 32768 */
>     const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
>     u64 t_max =3D n_max / freq;
>=20
>     if (t_max > UINT_MAX)
>         t_max =3D UINT_MAX;
>=20
>     return (unsigned int)t_max;
> =7D
> 8<--------------------------------------------------------------------->8
>=20
> This implementation's result:
>   - is never greater than real timeout, as it loses the decimal part afte=
r
> integer division in t_max
>   - much closer to the real timeout value, as it benefits from very big
> n_max in the numerator (this is the main trick here)
>   - prepared for using 32-bit max counter value in your next patch, as it
> uses u64 type for calculations
>=20
> For example, at the clock frequency of 33 kHz:
>   - real timeout is: 65074.269 sec
>   - old function returns: 65535 sec
>   - your function returns: 32767 sec
>   - the suggested function returns: 65074 sec

Thank you for your feedback.
I'll make the code changes as follows in the next patch set:

static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 =7B
        const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
+       const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
+                       S3C2410_WTCON_MAXDIV;
+       const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
+       u64 t_max =3D n_max / freq;

-       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX +=
 1)
-                                      / S3C2410_WTCON_MAXDIV);
+       if (t_max > UINT_MAX)
+               t_max =3D UINT_MAX;
+
+       return (unsigned int)t_max;
 =7D


