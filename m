Return-Path: <linux-watchdog+bounces-3899-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9542B10043
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 07:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ACCC167E47
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 05:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168E62040B6;
	Thu, 24 Jul 2025 05:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DU4uHM4w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A641F37D4
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753336405; cv=none; b=gSToQwb1DYoAx1RZpXQAbgyc5tv0ISBOdUN7Fvtx07uCa/rdxn/F5DIVBLUGrE18kDPj37H/Csn0aBlCFzNj9fWuaF5fbPRXhyzKJVNhK9HLFjSJGeJeqOnDm/tyay6Z5L/Xr8ew5ngcqphJN8SPpmEUEprdn5Ibf5FgiO/bRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753336405; c=relaxed/simple;
	bh=ayR9Y4fp2fQzI98FxqHZ7jwPWhydQOB4f/Xl2vybRtA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=eMofsFcazo4Yp+SuzhjPHW2Fa+IN1LbOIy/TB5puKR8ITzVqMN+8tFFZiDtRztu+z0Ml5KA/fOs6GlrVWTuQsJJmmlRY9m2vBajd5+TkzGbf6x/dTzrHi+WmpXnmujjdVI034YqZfnvbs4ff8PY4FddVKmzXCtSLC6zPcVmQ2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=DU4uHM4w; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724055319epoutp021646cd4041054268f21c1075ed9d2db7~VGipxynIF2387123871epoutp02Q
	for <linux-watchdog@vger.kernel.org>; Thu, 24 Jul 2025 05:53:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724055319epoutp021646cd4041054268f21c1075ed9d2db7~VGipxynIF2387123871epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336399;
	bh=ayR9Y4fp2fQzI98FxqHZ7jwPWhydQOB4f/Xl2vybRtA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DU4uHM4wtJyq4f8bZZ5P9ix6oq6/Sp0lNOyIxbBa/y3j+/OhmG6XaY6hHilpH6Dz1
	 Dv5ea9JL+o5FL7LGBbJbZCRuB1BqyDWhB2R3htDv7HoLCJOXFRPW6/r/S/ENUNbXdu
	 eK0n1aN9Em5+hX2X+nge8BsVAioiwUfXPqQsbGko=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724055319epcas5p26b747c2e27aea1b2c75dd2c3db41e51b~VGipYvUeQ1149711497epcas5p2F;
	Thu, 24 Jul 2025 05:53:19 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bngCf0PWGz6B9mB; Thu, 24 Jul
	2025 05:53:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250724055317epcas5p169284738fc5866d729b93d7200aedbc1~VGin-GWJw1902819028epcas5p1E;
	Thu, 24 Jul 2025 05:53:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055316epsmtip17afc9426154f08c2ff817c14c315c7df~VGim7j1Fu3061730617epsmtip1B;
	Thu, 24 Jul 2025 05:53:16 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-2-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 1/5] watchdog: s3c2410_wdt: Replace hardcoded
 values with macro definitions
Date: Thu, 24 Jul 2025 11:23:15 +0530
Message-ID: <2b5c01dbfc5f$40a8f970$c1faec50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgHo0cAqAj/2Yo2zzqazIA==
X-CMS-MailID: 20250724055317epcas5p169284738fc5866d729b93d7200aedbc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055853epcas2p1c8a30bbc61045c6a359d32989cfaf2f9@epcas2p1.samsung.com>
	<20250714055440.3138135-2-sw617.shin@samsung.com>

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-watchdog=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; Sangwook Shin <sw617.shin=40samsung.com>
> Subject: =5BPATCH v3 RESEND 1/5=5D watchdog: s3c2410_wdt: Replace hardcod=
ed
> values with macro definitions
>=20
> Modify the code to utilize macro-defined values instead of hardcoded valu=
es.
> The value 0x100 in the s3c2410wdt_set_heartbeat function represents
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its
> meaning difficult to understand and reducing code readability.
>=20
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


