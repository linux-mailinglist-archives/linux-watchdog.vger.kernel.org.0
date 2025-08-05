Return-Path: <linux-watchdog+bounces-3963-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B378FB1AD1A
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 06:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C1E23BAC87
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 04:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805AC215793;
	Tue,  5 Aug 2025 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ux1+JGHt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B015E8B
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 04:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754367794; cv=none; b=aiK011nI/h4zkhi15JdPy61eOHMn9XWN9BJlkriXGBIhhsIuIm/3zjY9xaA/E3XghghCSyqR+YF/Kpmm0fmau2DxUSpkDAQF6cRnyNitrHWAid6BQb9+zWhT7Nka1Iz+g2fYLvxP5SXvOJ24D7EB9ycxoKiH7DuV8IWuLQtrAUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754367794; c=relaxed/simple;
	bh=KgsmaWW7HUfv7iH6PDeWSdc3OrMR3oQEfCBeLi5HsKU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=af8RHLHKYHcpW+Y+8vtrM9f8ZN1SQ9mYtXzk0QZ/ZJ1p6jH9YJrnl6fQW/SSFZ/QVX3T3xJec6XTp+YvP5ImQWKDIuLbRBM0p8yxeZ4Aq2MXk3uHlcCI/tFvBN9pTbxQeZVKEsEdFHk+D5dt/wrGqrTLcndVEdkyNWX53syCqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ux1+JGHt; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250805042310epoutp049121bd0bd0951d86e5675329d230216f~YxDXRJ4Rl1778417784epoutp04M
	for <linux-watchdog@vger.kernel.org>; Tue,  5 Aug 2025 04:23:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250805042310epoutp049121bd0bd0951d86e5675329d230216f~YxDXRJ4Rl1778417784epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754367790;
	bh=93RMbm5SKNflblhVrJyyxp0txQQjOtZTPLHGHfyzito=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ux1+JGHtQ3TnK0axEQp416CxCEIpNtJ2XFLFsabuyDT/uL55mn0wOy5+8+nl2rs6G
	 4MMm1rP2A/wnmzLTYT0+WnBnkQ2j0+v55ItczdqjcZMMM2kLmbgtCIWhw8CsKx3yxt
	 vA7cCxZQ9uGF+za1rRnprmAiN8TuFcfhp8MnqEzA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805042309epcas2p3a618dd03f3aa8edc603f3dfc684d4c2d~YxDWKXeRn1049210492epcas2p3L;
	Tue,  5 Aug 2025 04:23:09 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.97]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bx0f4376Qz6B9mG; Tue,  5 Aug
	2025 04:23:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250805042307epcas2p13d0351a2844bd7d0722465a583872ae9~YxDU0O1He2419224192epcas2p1h;
	Tue,  5 Aug 2025 04:23:07 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805042307epsmtip11cf83298c76842cede495c9321ec9af3~YxDUwVqMH0149401494epsmtip1a;
	Tue,  5 Aug 2025 04:23:07 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4mo-Fw5+KmwHdZGAM4uNpOWL6QakTgP-wMSxR=+dMGqsQ@mail.gmail.com>
Subject: RE: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout
 value of watchdog
Date: Tue, 5 Aug 2025 13:23:07 +0900
Message-ID: <000b01dc05c0$a50f5f20$ef2e1d60$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH7/+RjFbVE2jnD64dQEr81dlMExQKQWbtpAqIFhIYBnLj3r7Pc8T5Q
Content-Language: ko
X-CMS-MailID: 20250805042307epcas2p13d0351a2844bd7d0722465a583872ae9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956
References: <CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>
	<20250724080854.3866566-1-sw617.shin@samsung.com>
	<20250724080854.3866566-4-sw617.shin@samsung.com>
	<CAPLW+4mo-Fw5+KmwHdZGAM4uNpOWL6QakTgP-wMSxR=+dMGqsQ@mail.gmail.com>

On Saturday, August 2, 2025 at 1:37 PM Sam Protsenko <semen.protsenko=40lin=
aro.org> wrote:
> Not a strong point, but I'd break this patch into two:
>   1. Add 32-bit counter feature (without enabling it in exynosautov920
> implementation)
>   2. Enable 32-bit counter feature in exynosautov920
>=20

I'll break this patch into two in the next patch set.

> >  =23define S3C2410_WTCNT_MAXCNT   0xffff
>=20
> Suggest renaming this to S3C2410_WTCNT_MAXCNT_16, to emphasize the fact
> this value is for 16-bit counters. And for consistency with the below one=
.
>=20
> > +=23define S3C2410_WTCNT_MAXCNT_32        0xffffffff
> >

I'll rename this to S3C2410_WTCNT_MAXCNT_16 in the next patch set.

> > + * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers.
> > + With these
>=20
> Why not name it like QUIRK_HAS_32BIT_CNT or QUIRK_HAS_32BIT_COUNTER?
> As I understand, the quirk means that the chip has 32-bit counter, so MAX
> bit is not really needed?
>=20
> > + * 32-bit registers, larger values to be set, which means that larger
> > + timeouts
>=20
> Spelling: =22to be set=22 -> =22will be set=22 (or =22have to be set=22).

I'll modify this in the next patch set.

> > +       unsigned int            max_cnt;
>=20
> Maybe make it u32? It definitely refers to a 32-bit register value, so
> will be more explicit that way. Not a strong opinion though.
>=20

I'll change this to u32 in the next patch set.

> >  =7D;
> >
> >  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D =7B
> > =40=40 -349,7 +356,7 =40=40 static const struct s3c2410_wdt_variant
> drv_data_exynosautov920_cl0 =3D =7B
> >         .cnt_en_bit =3D 8,
> >         .quirks =3D QUIRK_HAS_WTCLRINT_REG =7C QUIRK_HAS_PMU_MASK_RESET=
 =7C
> >                   QUIRK_HAS_PMU_RST_STAT =7C QUIRK_HAS_PMU_CNT_EN =7C
> > -                 QUIRK_HAS_DBGACK_BIT,
> > +                 QUIRK_HAS_DBGACK_BIT =7C QUIRK_HAS_32BIT_MAXCNT,
> >  =7D;
> >
> >  static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 =
=3D =7B
> > =40=40 -362,7 +369,7 =40=40 static const struct s3c2410_wdt_variant
> drv_data_exynosautov920_cl1 =3D =7B
> >         .cnt_en_bit =3D 8,
> >         .quirks =3D QUIRK_HAS_WTCLRINT_REG =7C QUIRK_HAS_PMU_MASK_RESET=
 =7C
> >                   QUIRK_HAS_PMU_RST_STAT =7C QUIRK_HAS_PMU_CNT_EN =7C
> > -                 QUIRK_HAS_DBGACK_BIT,
> > +                 QUIRK_HAS_DBGACK_BIT =7C QUIRK_HAS_32BIT_MAXCNT,
>=20
> Yeah, I think it would be easier to review and handle further if this
> exynosautov920 enablement is extracted into a separate patch.
>=20

I'll break this patch into two in the next patch set.

> >
> > -       if (count >=3D 0x10000) =7B
> > -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> > +       if (count > wdt->max_cnt) =7B
>=20
> wdt->max_cnt + 1?
>=20

Yes, 0x10000 represented 'wdt->max_cnt + 1.'
Would you like to suggest any revisions?

> > +       wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
> > +       if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
>=20
> Double braces don't seem to be needed.
>=20
> > +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> > +
>=20
> Style (minor nitpick): this block can be more explicit, i.e.:
>=20
>        if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
>                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
>        else
>                wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT;
>=20

I'll fix these in the next patch set.




