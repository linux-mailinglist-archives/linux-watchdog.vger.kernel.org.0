Return-Path: <linux-watchdog+bounces-3900-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB19B10045
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 07:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820E01CC5E35
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 05:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB971FECAD;
	Thu, 24 Jul 2025 05:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="r2Bb5hGP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B21F37D4
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336443; cv=none; b=rHzgR+77N5kBXgvJPZWHD2wPoZpv4+r6glgA2KFmx6krLvfacjAo8RaIW/0kJ6aYy8ipK/W+YkxYNavu9CttVzcWbEKBGFgJG2z13wpR6rnCFrthx2jddWojp1Vsj56ovNEadbhFikTUzIMIffmeDY1q67DpxoMlDj/wzON+drg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336443; c=relaxed/simple;
	bh=dBdfiu6t7U+WU5cfAJAOE7FL33khMMuz8IBNKxxkeTM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Afnmrc3CBCAYK2kH/7O7naCgdISVtonVYGSk798CDaV2JXqjH7y/y9dT4rqy+uNzDjttjr1DxW/rgzh/i4JGG+794iBn5tAgakCk+2dAjBMcKtJvEhAifvKEbyK3U6g/FmLlBSg9nVheAwfSMV0MnnK+1QHX0rUIqlHc2Ou7Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=r2Bb5hGP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724055358epoutp02ca6a60078a0ab47cde2b579b0256ba12~VGjNzOH4_2528525285epoutp02g
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:53:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724055358epoutp02ca6a60078a0ab47cde2b579b0256ba12~VGjNzOH4_2528525285epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336438;
	bh=4VpqnVHPg85eREOdigF06VvfI57tksBRXUjYq3epe8Y=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=r2Bb5hGP7PIAj8SUUFd2BGkGbGc7aTmJ0Wnd0y7DcwVEoRiWbQtdf1HYxhvH7fv3a
	 rCpGA23gcw4AtATodDS79IuMznGhuA9O5S8zg4Etg8lRye+et8SP3czr1doVGoLn+x
	 Zf1eKXXc2TTdXODdZibK9Jqh2fUCLLd5bl3Brt6U=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055357epcas5p494818deff8960287b2cf448ea0ef871f~VGjNjNx1W0942409424epcas5p4l;
	Thu, 24 Jul 2025 05:53:57 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bngDP01P7z3hhT3; Thu, 24 Jul
	2025 05:53:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724055356epcas5p391e77debb0c329635c3c3eb0475e5c6c~VGjMOrrf01947019470epcas5p3C;
	Thu, 24 Jul 2025 05:53:56 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055355epsmtip182e0055067acb8ab5444187708a1e627~VGjLLM4HH3049830498epsmtip1y;
	Thu, 24 Jul 2025 05:53:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-3-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 2/5] watchdog: s3c2410_wdt: Fix max_timeout
 being calculated larger
Date: Thu, 24 Jul 2025 11:23:54 +0530
Message-ID: <2b5d01dbfc5f$57d9dd30$078d9790$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgKHMZfiAsMNadizxZtLMA==
X-CMS-MailID: 20250724055356epcas5p391e77debb0c329635c3c3eb0475e5c6c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055857epcas2p18cb516424b84f972970eed1ac5726c54
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055857epcas2p18cb516424b84f972970eed1ac5726c54@epcas2p1.samsung.com>
	<20250714055440.3138135-3-sw617.shin@samsung.com>



> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-watchdog=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; Sangwook Shin <sw617.shin=40samsung.com>
> Subject: =5BPATCH v3 RESEND 2/5=5D watchdog: s3c2410_wdt: Fix max_timeout
> being calculated larger
>=20
> Fix the issue of max_timeout being calculated larger than actual value.
> The calculation result of freq / (S3C2410_WTCON_PRESCALE_MAX + 1) /
> S3C2410_WTCON_MAXDIV is smaller than the actual value because the
> remainder is discarded during the calculation process. This leads to a la=
rger
> calculated value for max_timeout compared to the actual settable value.
> A ceiling operation is applied in the calculation process to resolve this=
.
>=20
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  drivers/watchdog/s3c2410_wdt.c =7C 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/watchdog/s3c2410_wdt.c
> b/drivers/watchdog/s3c2410_wdt.c index 95f7207e390a..31f7e1ec779e
> 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> =40=40 -411,8 +411,8 =40=40 static inline unsigned int
> s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)  =7B
>  	const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>=20
> -	return S3C2410_WTCNT_MAXCNT / (freq /
> (S3C2410_WTCON_PRESCALE_MAX + 1)
> -				       / S3C2410_WTCON_MAXDIV);
> +	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
> +		(S3C2410_WTCON_PRESCALE_MAX + 1) *
> S3C2410_WTCON_MAXDIV);
>  =7D
>=20
>  static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool
> mask)
> --
> 2.25.1



