Return-Path: <linux-watchdog+bounces-3967-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F9CB1AF4F
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 09:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0003AE1B0
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 07:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C197A239E97;
	Tue,  5 Aug 2025 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RNPy6bg+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAB238C0D
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754378774; cv=none; b=Gwc7hO1l2fko1aG1phcOAMmw1gWwdhh9nTYG5BVaA2i++jsoXyeMn0BGW+pLhUYTw/thX2E666D8NQrwBUBP6N4gTKdpG1cL8OreNqjUEasQXsWtUxt3ijYcWOYzc0VQMsTAgV/93ZUAkCSws/PCt/rXPXKnD/4xJwljNWAzykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754378774; c=relaxed/simple;
	bh=fPHmNA5iNHVa4JmNaWVOI3ppu9LKnt/GbELSlZzLwg0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=WVH/vnIhwm/C6LwqVHpcPaSC1u+fG7NDTGaHzTSkroNX2FCdX5euBM8ZGWWpZqSVkCTh+UioJbr7fh/Y2NcH1siVnrj4sMZw83ueorfSqPkklExJMWGVpHyVUJro8wRevSvfuphVTbwjKlIaGPSmkRSnKT41SuDkI/MMg0UskEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RNPy6bg+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250805072610epoutp043ad9f782172438e5198009da97061e1c~YzjJWRUXA0846408464epoutp04j
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 07:26:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250805072610epoutp043ad9f782172438e5198009da97061e1c~YzjJWRUXA0846408464epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754378770;
	bh=8vtyMqN7BBl94yLtrpE133kapPVMyCygmknIpKLTZQ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RNPy6bg+Fs/jsy4qN/qnWzqrncRwoQ4eTk7b9NqY6hEG3TZajeRK9RlVsltmHRn/o
	 kntzv3/pogUM/z1sQRyPmKrf72DRgrfpO9UpPaD0XHnoatH+0SK+PP0r5jcMgXYE3U
	 vEZeg1dhFWJ+nKtrk6UnkQHH/oow8fvuSrGsh+cs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805072609epcas2p3d840144f6c0c778395d6483e25a7c47d~YzjI2Lt0X2580225802epcas2p3R;
	Tue,  5 Aug 2025 07:26:09 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bx4jF23Txz6B9mQ; Tue,  5 Aug
	2025 07:26:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250805072608epcas2p4afbd5db258530d696c80e4007749953d~YzjHnrh3Z2393223932epcas2p4q;
	Tue,  5 Aug 2025 07:26:08 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805072608epsmtip13df80963802621da648f1f1b2ba181f8~YzjHjiOlZ1882618826epsmtip1i;
	Tue,  5 Aug 2025 07:26:08 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>, "'Guenter Roeck'"
	<linux@roeck-us.net>
Cc: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Tue, 5 Aug 2025 16:26:08 +0900
Message-ID: <008501dc05da$36362600$a2a27200$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfwwEQ7YR8A5N0zr4BpLWR/LPB5rkg
Content-Language: ko
X-CMS-MailID: 20250805072608epcas2p4afbd5db258530d696c80e4007749953d
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

On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko=40lina=
ro.org> wrote:

>=20
> > > +       u64 t_max =3D n_max / freq;
> > >
> >
> > Make sure this compiles on 32-bit builds.
> >
>=20
> Can you please elaborate what might be the possible problem -- just
> curious? I admit I never though about 32-bit case when writing that code,
> but don't see any immediate issues with that too.
>=20

In my opinion, it seems that Gunter Reck's explanation is correct.
I've found out that the error of =22undefined reference to '__aeabi_uldivmo=
d'=22 may occur when compiling new code on a 32-bit architecture.
If you don't mind, I would like to proceed with maintaining the previous re=
vision below.
=46rom my perspective, this approach appears to be the most reasonable solu=
tion for supporting both 32-bit and 64-bit architectures.

=40=40 -411,8 +411,8 =40=40 static inline unsigned int s3c2410wdt_max_timeo=
ut(struct s3c2410_wdt *wdt)
 =7B
 	const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
=20
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 =7D


