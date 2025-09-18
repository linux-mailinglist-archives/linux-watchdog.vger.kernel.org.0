Return-Path: <linux-watchdog+bounces-4259-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED18B82D46
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 05:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C0A17A836F
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Sep 2025 03:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD91623C4E0;
	Thu, 18 Sep 2025 03:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HXLeHgJ0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253723BF9C
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Sep 2025 03:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167633; cv=none; b=NnWedWmCcM6cGoFKdVSRYewDIymBsrgrpTM6XfC76QRwns3FxZF/e9WSAE78lGA4soIU5YnhigaEZEWLu+4oxSG14ny0syf8LMIO8Pv6u1nfF7Njw/nmLN7BLfOtb8dozxFxfvWaUi/ayljdjQqgfUnNLu3IDMfqTCosUtklFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167633; c=relaxed/simple;
	bh=iul9tOgZqa9zFgNM3hOqAt9YEIrgP+mOQqKU3fOup3Y=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=nlcunpPmhkivvsY7jJkwxgjQtcVBkJqjjfePAnan2ItTQDDKjZae2jmx+iyOKVzLMlS4eA4x+b+jNN9ovubQvbtY+zfJ1GDzFF0A0GxR6ZExIIcUAHyqyYPp6mtITEyH0G3F0MIGSmEew1BTcBh63h19lro8nHRvN3kjmd452sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HXLeHgJ0; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250918035349epoutp049cd547e9919d116fceac56c453fac8d1~mRCTCN32S2159621596epoutp04o
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Sep 2025 03:53:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250918035349epoutp049cd547e9919d116fceac56c453fac8d1~mRCTCN32S2159621596epoutp04o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758167629;
	bh=AG+lskbMnjhh54sDPIao2BdJBgoYc2E3bPl5g1IWvfw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HXLeHgJ0Nue9BLNwdCgqYa9Z812NbcXqSTj0Oyy44T/GfAx7lN/3rSzj3kOjGjDNS
	 ekCdisc0bJVqC3PbICACosZ0Dq7DF9tefeZNHeaqOnPF28F+OugL6t6Jogs7yjxAJ/
	 j59IvV8JyariZRhPFac0DaigvHJz8EdHpDWlDag8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250918035348epcas5p2b3ea48f90fd6e94736469d939870ccde~mRCSdRUnU1541615416epcas5p2F;
	Thu, 18 Sep 2025 03:53:48 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS1vv5sk8z2SSKh; Thu, 18 Sep
	2025 03:53:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918035347epcas5p345d313bce95bf0470d0969ebe30ec80c~mRCRKMjA51063310633epcas5p3N;
	Thu, 18 Sep 2025 03:53:47 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918035344epsmtip15d917fc8385d42acf2d7a089c8c59471~mRCOOXWAx0317203172epsmtip1J;
	Thu, 18 Sep 2025 03:53:43 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-4-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout
 value of watchdog
Date: Thu, 18 Sep 2025 09:23:41 +0530
Message-ID: <06c501dc284f$d5da8e70$818fab50$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgGBxYoXAhK/QGyx9FUV8A==
Content-Language: en-us
X-CMS-MailID: 20250918035347epcas5p345d313bce95bf0470d0969ebe30ec80c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>
	<20250818021826.623830-4-sw617.shin@samsung.com>

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, August 18, 2025 7:48 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net; semen.protsenko=40linaro.org;
> dongil01.park=40samsung.com; khwan.seo=40samsung.com
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-watchdog=40vger.kernel.org; linux-kernel=40vger.kernel.org; Sangwoo=
k Shin
> <sw617.shin=40samsung.com>
> Subject: =5BPATCH v6 3/5=5D watchdog: s3c2410_wdt: Increase max timeout v=
alue of
> watchdog
>=20
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>=20
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
>=20
> =5B    0.330082=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> count=3D1099511400000, timeout=3D3665038, freq=3D300000
> =5B    0.330087=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> timeout=3D3665038, divisor=3D256, count=3D1099511400000 (fffffc87)
> =5B    0.330127=5D s3c2410-wdt 10060000.watchdog_cl0: starting watchdog t=
imer
> =5B    0.330134=5D s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog:
> count=3D0xfffffc87, wtcon=3D0001ff39
> =5B    0.330319=5D s3c2410-wdt 10060000.watchdog_cl0: watchdog active, re=
set
> enabled, irq disabled
>=20
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk fl=
ags,
> and it will operate with a 32-bit counter. If not, it will operate with a=
 16-bit
> counter like in the previous version.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>




