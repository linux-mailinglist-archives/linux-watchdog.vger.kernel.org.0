Return-Path: <linux-watchdog+bounces-2242-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C89A595E
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 06:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221802815AA
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 04:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45E31CF287;
	Mon, 21 Oct 2024 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="prbskjbr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C34155321
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 04:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729483203; cv=none; b=uWe1eI+mAi0uGyujHxe5amw91vqe95YkXdpYDXHHFtjBa22PL+TD92fyPowMl6/LYxJkURdNk4p6RCvPVIc1DTKBTWmeVy3SePgCvKTCJ1h0Sy2C0bu7XcAvV6HIlc7NvbJIcKKTTFtFMALSoRSJhHPSMXw41Xz604je0E1qHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729483203; c=relaxed/simple;
	bh=DrckcV2kxWdF4O8bs2o6wk3We2ows/aBCuLkrYyGf8E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Se3A40HlscRFhY1TXBM/6FwZ/6jMCXP8ha2u32GD/qSbst/EG0iZ090q14TpOVLtgl///q4LXGkT0OgFflhMsxTCaVbx8+Utf5OzAsRmg5ppfNH6H1QQ4JjvJKV4xAnbC4f8X6Xkpvl3cw2hW1jkrhZgm22vyG0XGgDReaDKz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=prbskjbr; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241021035959epoutp0388314b37953c0020f0350fdbec8a5225~AW85srF920823208232epoutp03l
	for <linux-watchdog@vger.kernel.org>; Mon, 21 Oct 2024 03:59:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241021035959epoutp0388314b37953c0020f0350fdbec8a5225~AW85srF920823208232epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1729483199;
	bh=DrckcV2kxWdF4O8bs2o6wk3We2ows/aBCuLkrYyGf8E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=prbskjbruzN/N3wMXSqN6mbtHVcfizlxljqN6BIyT0SglKP6krFchF++7LjZskNsF
	 eFr8+nuxRdMJuK205aKy0/BiMncmnEHK5uxPk369Xo783Z9DUW6Rd7hxaIpzwNkc28
	 NMlTm0zNDy3fbnafss5FU0Yv9BMw8QJM5ghdHStU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241021035958epcas2p36b1336c717708daf8c2475905002991e~AW85P4xQY2977329773epcas2p3J;
	Mon, 21 Oct 2024 03:59:58 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XX1mG1lccz4x9Pp; Mon, 21 Oct
	2024 03:59:58 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	0E.07.09811.EB1D5176; Mon, 21 Oct 2024 12:59:58 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241021035957epcas2p12cb34aa86daaa4ad40dfc3e9ffa0bd4f~AW84hyfeK0308303083epcas2p1Q;
	Mon, 21 Oct 2024 03:59:57 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241021035957epsmtrp2bc2076bb8b41b96211b8b5ab2110d72a~AW84hAF1c2662026620epsmtrp2h;
	Mon, 21 Oct 2024 03:59:57 +0000 (GMT)
X-AuditID: b6c32a48-84fb870000002653-6f-6715d1be3ef0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.07.07371.DB1D5176; Mon, 21 Oct 2024 12:59:57 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.18.158]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241021035957epsmtip1e4df4989b9e2b0b6d50a96005193f9f5~AW84TW1Ya1845318453epsmtip1j;
	Mon, 21 Oct 2024 03:59:57 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, "'Sam	Protsenko'"
	<semen.protsenko@linaro.org>
Cc: "'Wim Van Sebroeck'" <wim@linux-watchdog.org>, "'Guenter Roeck'"
	<linux@roeck-us.net>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <005c01db1ae8$544a1e40$fcde5ac0$@samsung.com>
Subject: RE: [PATCH 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Mon, 21 Oct 2024 12:59:57 +0900
Message-ID: <000001db236d$b18432c0$148c9840$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPcUUdHl+Ei7bfUILxdnz4wpISqAFKfb4qAog0DUQCf1lgZgMTgJO5AgAvTqixzJ6GIA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJsWRmVeSWpSXmKPExsWy7bCmue6+i6LpBk8Xclk8mLeNzeL+pz4m
	izV7zzFZzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awWzzvA4o9
	fvmP2YHXY9OqTjaPO9f2sHmsXLOG1WPzknqPnd8b2D36tqxi9Pi8SS6APSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWiWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdkbvxjfsBd0iFefu
	tTI1MG4U7mLk5JAQMJF43XWTtYuRi0NIYAejROvx80wQzidGiVcvDzJDON8YJY7u/8kO0/Li
	9WsWiMReRomXE86zQzgvGSW2v2tgA6liE7CQWHLtA9AsDg4RgXiJfW+VQWqYBTYyS2xobweL
	cwpYSfxZywhSLiwQIrGkazETiM0ioCrx4dpnFhCbV8BSorfrMyuELShxcuYTsDizgLbEsoWv
	mSEOUpD4+XQZWI2IQJjEjQ2nmSFqRCRmd7ZB1ZzhkFh+JALCdpE4f/U81DPCEq+Ob4GypSQ+
	v9vLBmHnS6xceYIJwq6RuNe2iwXCtpdYdAYUEBxA8zUl1u/SBzElBJQljtyCuoxPouPwX3aI
	MK9ER5sQhKkqMX1ZAMQMaYmJM9ayTWBUmoXkrVlI3pqF5PxZCKsWMLKsYhRLLSjOTU8tNiow
	gcd0cn7uJkZwKtby2ME4++0HvUOMTByMhxglOJiVRHiVSkTThXhTEiurUovy44tKc1KLDzGa
	AgN6IrOUaHI+MBvklcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXA
	1LLKPGPf8i9B+zYeC7i/Q37261uL7MXmvhb8Mq2U65ThtPzX870+2P1s2Zc4YZdSze6FMa+k
	nXcGSzyM8r3q4fPQIPTKPzEN8ble5/cuFZNl1bE+z3Xpv4OOH3Pn19IpnJNOachdXbJCi+GX
	tdinDd2Tt5vUtIe22TxNLFd5t23DOfeFL2d12lXd+7NHwUq8VfDTkRf7D0yYG7Npq16N+uy+
	WIXQ3BMxPWfXnYs63OPYJLMzc7F0nppga6WvqdpywbPrG6Ss3KznzD59aSrrX4ONM9bXxTAL
	HLvgprnsXmbM8sf7j5zJ+5uiYqKyf0OArYSAeUkng9XJFaYZnIcS+xdu9Hplx3rg9qoztdpl
	QUosxRmJhlrMRcWJAKRhgKNOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSnO7ei6LpBjMuaVk8mLeNzeL+pz4m
	izV7zzFZzD9yjtXi5ax7bBabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awWzzvA4o9
	fvmP2YHXY9OqTjaPO9f2sHmsXLOG1WPzknqPnd8b2D36tqxi9Pi8SS6APYrLJiU1J7MstUjf
	LoEr49fm16wFb/kq3p65xtLAeJKni5GTQ0LAROLF69csXYxcHEICuxklln09xgKRkJY48vsF
	G4QtLHG/5QgrRNFzRonupitgRWwCFhJLrn1gArFFBOIl/l84zwZSxCywm1li849lUGOfMEms
	P9zJ3sXIwcEpYCXxZy0jSIOwQJBEy/mlrCA2i4CqxIdrn8GG8gpYSvR2fWaFsAUlTs58AhZn
	FtCWeHrzKZy9bOFrZojrFCR+Pl3GCnFEmMSNDaeZIWpEJGZ3tjFPYBSehWTULCSjZiEZNQtJ
	ywJGllWMkqkFxbnpucmGBYZ5qeV6xYm5xaV56XrJ+bmbGMHxqaWxg/He/H96hxiZOBgPMUpw
	MCuJ8CqViKYL8aYkVlalFuXHF5XmpBYfYpTmYFES5zWcMTtFSCA9sSQ1OzW1ILUIJsvEwSnV
	wNR9avY5t6Zz5/f9vZV+JG+6pllFQaPNWm3jKoHTByZkWIamvF10ovpe8ME/2yuNf835UR64
	n1WKtc9LKjK/2PnpfM/F7f19lboHBXXUb/X5PZPO7Cu4c64hraT44ZKHJveYqldsEp897f88
	t0CvV3MP6W+5/WfzjwO6Nf7cUxPN918Qu679qGNasor82k3FJxfpKoqyRsb7eZ8UZOlaYN99
	ke2G76TnVg0zzz4oOsboICLwiOvb3/0xDVMefEuJe7WI79QlrsK683J/vzy9IJ6qdfhc/epj
	C1gF/lmkfah3eiWa1aTOZs/8nP1RgAbHkwMzkr+IH9a2LpS74hcb4mUgG5D0Wvw5s4rDBq7L
	65RYijMSDbWYi4oTASwKGuE+AwAA
X-CMS-MailID: 20241021035957epcas2p12cb34aa86daaa4ad40dfc3e9ffa0bd4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
References: <CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>
	<20240913080325.3676181-1-trunixs.kim@samsung.com>
	<20240913080325.3676181-3-trunixs.kim@samsung.com>
	<CAPLW+4k0rpS0F14sqMGPbq_m=aMqK+g=PZewtZYYroQ+OQBeOQ@mail.gmail.com>
	<000101db1ae5$96c111f0$c44335d0$@samsung.com>
	<005c01db1ae8$544a1e40$fcde5ac0$@samsung.com>

Hi Alim,

> -----Original Message-----
> From: Alim Akhtar <alim.akhtar=40samsung.com>
> Sent: Thursday, October 10, 2024 4:45 PM
> To: '=EA=B9=80=ED=83=9C=EC=99=84'=20<trunixs.kim=40samsung.com>;=20'Sam=
=20Protsenko'=0D=0A>=20<semen.protsenko=40linaro.org>=0D=0A>=20Cc:=20'Wim=
=20Van=20Sebroeck'=20<wim=40linux-watchdog.org>;=20'Guenter=20Roeck'=0D=0A>=
=20<linux=40roeck-us.net>;=20'Rob=20Herring'=20<robh=40kernel.org>;=20'Krzy=
sztof=20=0D=0A>=20Kozlowski'=20<krzk+dt=40kernel.org>;=20'Conor=20Dooley'=
=20<conor+dt=40kernel.org>;=0D=0A>=20linux-watchdog=40vger.kernel.org;=20de=
vicetree=40vger.kernel.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org;=20l=
inux-arm-kernel=40lists.infradead.org;=20linux-=0D=0A>=20samsung-soc=40vger=
.kernel.org;=20'Byoungtae=20Cho'=20<bt.cho=40samsung.com>=0D=0A>=20Subject:=
=20RE:=20=5BPATCH=202/3=5D=20watchdog:=20s3c2410_wdt:=20add=20support=20for=
=0D=0A>=20exynosautov920=20SoC=0D=0A>=20=0D=0A>=20Hi=20Taewan=0D=0A>=20=0D=
=0A>=20>=20-----Original=20Message-----=0D=0A>=20>=20From:=20=EA=B9=80=ED=
=83=9C=EC=99=84=20<trunixs.kim=40samsung.com>=0D=0A>=20>=20Sent:=20Thursday=
,=20October=2010,=202024=2012:56=20PM=0D=0A>=20>=20To:=20'Sam=20Protsenko'=
=20<semen.protsenko=40linaro.org>=0D=0A>=20>=20Cc:=20'Wim=20Van=20Sebroeck'=
=20<wim=40linux-watchdog.org>;=20'Guenter=20Roeck'=0D=0A>=20>=20<linux=40ro=
eck-us.net>;=20'Rob=20Herring'=20<robh=40kernel.org>;=20'Krzysztof=0D=0A>=
=20>=20Kozlowski'=20<krzk+dt=40kernel.org>;=20'Conor=20Dooley'=20<conor+dt=
=40kernel.org>;=0D=0A>=20>=20'Alim=20Akhtar'=20<alim.akhtar=40samsung.com>;=
=20linux-=0D=0A>=20>=20watchdog=40vger.kernel.org;=20devicetree=40vger.kern=
el.org;=20linux-=0D=0A>=20>=20kernel=40vger.kernel.org;=20linux-arm-kernel=
=40lists.infradead.org;=20linux-=0D=0A>=20>=20samsung-soc=40vger.kernel.org=
;=20'Byoungtae=20Cho'=20<bt.cho=40samsung.com>=0D=0A>=20>=20Subject:=20RE:=
=20=5BPATCH=202/3=5D=20watchdog:=20s3c2410_wdt:=20add=20support=20for=0D=0A=
>=20>=20exynosautov920=20SoC=0D=0A>=20>=0D=0A>=20>=20Hi,=0D=0A>=20>=0D=0A>=
=20>=20Thank=20you=20for=20your=20review.=0D=0A>=20>=20Yes,=20cl0=20is=20co=
rrect=20not=20cl1.=0D=0A>=20>=20I=20will=20apply=20it=20to=20v2=20patch.=0D=
=0A>=20>=0D=0A>=20Don=E2=80=99t=20send=20a=20top=20up=20reply,=20context=20=
get=20lost.=20Configure=20your=20email=20client=0D=0A>=20properly=20to=20se=
nd=20a=20inline=20reply.=0D=0A=0D=0AThanks.=20I'll=20bear=20that=20in=20min=
d.=0D=0A>=20=0D=0A>=20>=20Best=20regards,=0D=0A>=20>=20Taewan=20Kim.=0D=0A>=
=20>=0D=0A>=20=0D=0A=0D=0A=0D=0A

