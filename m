Return-Path: <linux-watchdog+bounces-2162-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16485997FC9
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 10:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E113281421
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 08:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835191FF7BD;
	Thu, 10 Oct 2024 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ChV48yyD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CD1FF7BE
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546315; cv=none; b=L0ply6HQvPtwmvG0KYRuqAje8L7xFCpHkGBU4FnC3ZpQ3BSJEdOOrQJu5HQITX+2dwHiSPZIpeIwVOr7iVpapeTsmL1qtK4LmslXc4s0uxhYCCj4gNjbgHWNbtXdG40hnTy6tO29oq9qO2UekpVWI3Eap5NKO7r2nDOV/qAoHfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546315; c=relaxed/simple;
	bh=TSE7pLPPpD3mmFhfeY0wTU3ADMzSlt1bwJDfYQt23Tk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=sXcAooWTK41l6klW3rAW+ZkQJxAX/Opl37XAyhJupTXmquKmMU1AIlK7sVs5Arw+fzLnx0Ru2uDGHy+X+cFUDgwQ9qZw4AXT4D+Z6nFYynvyy1AJast7EQi2FTw0MfwfpLyOlrG/cAZdgh/YF+gEuVROs1AemYoQ80E/5DBM03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ChV48yyD; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241010074511epoutp01da3cc7552c9821334724f6bc513afa5e~9B7ZGDZtV0178401784epoutp011
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:45:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241010074511epoutp01da3cc7552c9821334724f6bc513afa5e~9B7ZGDZtV0178401784epoutp011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728546311;
	bh=TSE7pLPPpD3mmFhfeY0wTU3ADMzSlt1bwJDfYQt23Tk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ChV48yyDaR2AaOJT9g39pbRudbTWGMSSQXOYBHpw1ApOMivoGeUygmMVrLrMRSNk5
	 CDnM+RHM5j5rlQBExliNLspIUMTDnJ82Ha0hDznSNuVSabAHE8lBWyYSLR3ByIlBnI
	 FQr7U3rN64FBP4rWpYri9PvhXXVbJ0cHh0zguJQ0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20241010074510epcas5p180fb8c8732c4a446ba98312bac943238~9B7YdspvI1904319043epcas5p11;
	Thu, 10 Oct 2024 07:45:10 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XPMH92dk2z4x9QC; Thu, 10 Oct
	2024 07:45:09 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	53.E2.09420.50687076; Thu, 10 Oct 2024 16:45:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20241010074508epcas5p1488a572a7d6008905d33658962d9f62a~9B7W091sR1904319043epcas5p1v;
	Thu, 10 Oct 2024 07:45:08 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241010074508epsmtrp1121f24c76afc1aaea488849fb10c9e65~9B7W0FM_L0307003070epsmtrp1J;
	Thu, 10 Oct 2024 07:45:08 +0000 (GMT)
X-AuditID: b6c32a49-33dfa700000024cc-8a-67078605c1a5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	88.C7.07371.40687076; Thu, 10 Oct 2024 16:45:08 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241010074506epsmtip2991351e4045c9668aa4b1eb081543a67~9B7U9Fhvc2020720207epsmtip2p;
	Thu, 10 Oct 2024 07:45:06 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: =?UTF-8?B?J+q5gO2DnOyZhCc=?= <trunixs.kim@samsung.com>, "'Sam
	Protsenko'" <semen.protsenko@linaro.org>
Cc: "'Wim Van Sebroeck'" <wim@linux-watchdog.org>, "'Guenter Roeck'"
	<linux@roeck-us.net>, "'Rob Herring'" <robh@kernel.org>, "'Krzysztof
 Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <000101db1ae5$96c111f0$c44335d0$@samsung.com>
Subject: RE: [PATCH 2/3] watchdog: s3c2410_wdt: add support for
 exynosautov920 SoC
Date: Thu, 10 Oct 2024 13:15:05 +0530
Message-ID: <005c01db1ae8$544a1e40$fcde5ac0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPcUUdHl+Ei7bfUILxdnz4wpISqAFKfb4qAog0DUQCf1lgZgMTgJO5scvAueA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPJsWRmVeSWpSXmKPExsWy7bCmli5rG3u6wbNZQhb3P/UxWazZe47J
	Yv6Rc6wWL2fdY7PY9Pgaq8XlXXPYLGac38dkcWPdPnaLJwvPMFn837OD3eJ5H1Bs0uLzTBaP
	X/5jduD12LSqk83jzrU9bB4r16xh9di8pN5j5/cGdo++LasYPT5vkgtgj8q2yUhNTEktUkjN
	S85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6VkmhLDGnFCgUkFhcrKRv
	Z1OUX1qSqpCRX1xiq5RakJJTYFKgV5yYW1yal66Xl1piZWhgYGQKVJiQnbFw3x62glbuip2/
	b7A0MF7j6mLk4JAQMJF4Pd26i5GLQ0hgN6PE8UNb2CCcT4wS/ScXMkE43xglPnc/BHI4wTpO
	LH3DDJHYyyjxdPlRsISQwAtGiZ6/QSA2m4CuxI7FbWwgtohADtCkfrAGZoGNzBIb2tuZQHZz
	ClhJ7J1iDFIjLBAisaRrMdgcFgFViYlNR1hAbF4BS4m2H1ugbEGJkzOfgNnMAtoSyxa+ZoY4
	SEHi59NlrBC7/CT+nt7FDFEjLvHy6BF2iJoLHBJ/X+tB2C4SLfPvskDYwhKvjm+BqpGSeNnf
	BmVnSxy/OIsNwq6Q6G79CBW3l9j56CYLyPnMApoS63fpQ6zik+j9/YQJEqK8Eh1tQhDVqhLN
	765CbZKWmNjdzQphe0j8v/CcaQKj4iwkj81C8tgsJA/MQli2gJFlFaNkakFxbnpqsWmBYV5q
	OTy2k/NzNzGCU7KW5w7Guw8+6B1iZOJgPMQowcGsJMKru5A1XYg3JbGyKrUoP76oNCe1+BCj
	KTC0JzJLiSbnA7NCXkm8oYmlgYmZmZmJpbGZoZI47+vWuSlCAumJJanZqakFqUUwfUwcnFIN
	TA4l+05P5F9tEP18V7Tdw/opPEVb5bXzNOd4bTy3dvKXR7fcCkte7Ptp+PrkXPXbvx7MmLz6
	4cOvvTe2uD05PUOqf036xc/6z6pPF33ZJH0jau+aQpEsGb9HE6bkRd00eTqtbcXfVVZznzlq
	z5DpjHpte9dS4+LH+K/2Xcvt3eozluXeS4965Hzl7DeHB6WCH1mcjs6bKFO1q6kxPymUwT/X
	8vXylM2MrQor5pvMiHE7LTrty9/UX2KV5kXp9w4+3ijkJLZs4bvtRUJfGCoc6morHp8r/Cqd
	1WpxlJflVsqk8tszEr8HSN7XEzKeMbE91IDL5xvveb/fJ4r/Hw0/qs/lc6h1mtTuvbv92WwS
	syyVWIozEg21mIuKEwFAcsD3UgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsWy7bCSvC5LG3u6wcvNxhb3P/UxWazZe47J
	Yv6Rc6wWL2fdY7PY9Pgaq8XlXXPYLGac38dkcWPdPnaLJwvPMFn837OD3eJ5H1Bs0uLzTBaP
	X/5jduD12LSqk83jzrU9bB4r16xh9di8pN5j5/cGdo++LasYPT5vkgtgj+KySUnNySxLLdK3
	S+DKeHVqKWPBRI6KmYcuszUwfmbrYuTkkBAwkTix9A1zFyMXh5DAbkaJWyuPs0MkpCWub5wA
	ZQtLrPz3nB2i6BmjxOKnz5hAEmwCuhI7FrcBTeLgEBHIkZiwUxmkhllgN7PE5h/LWCAatjFJ
	bJj+jx2kiFPASmLvFGOQXmGBIImW80tZQWwWAVWJiU1HWEBsXgFLibYfW6BsQYmTM5+A2cwC
	2hK9D1sZYexlC18zQxynIPHz6TKwOSICfhJ/T+9ihqgRl3h59Aj7BEbhWUhGzUIyahaSUbOQ
	tCxgZFnFKJlaUJybnptsWGCYl1quV5yYW1yal66XnJ+7iREcnVoaOxjvzf+nd4iRiYPxEKME
	B7OSCK/uQtZ0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryGM2anCAmkJ5akZqemFqQWwWSZODil
	GphinuveF6txZZyuEsHpZC3z48lxdQ35rvpth7eJFG8u6XqlVn+jJoVNvix62fvzKl9Xrt6t
	p3BM+nHB9jqHu9vVNh/a7z8vRT63ynlGV0LrhJ1qmttq2Ja+apsmvCDEYs3fsOdpv1zzdic+
	3fct01bQuz+1bsEbTflv2pMzeNQPOUltnZqo/KRsw4FJGenvumRXd3V++xOefKquL3qVTdzE
	hYYdx2M3Xdtw8fYyqQ7OJtmrsjmWZZGzRU/em6VpcEdBWPHWye/cXMv//Yvd4O2ZM6HB5sv6
	qEc90aUr5+yfyMP23zqh4k3YOU3/OJnrW7/6NihLM5Zc95DdWnr1Qez6evbzLRrSLTvlv29S
	3aTEUpyRaKjFXFScCACRbcVrPQMAAA==
X-CMS-MailID: 20241010074508epcas5p1488a572a7d6008905d33658962d9f62a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b
References: <CGME20240913080347epcas2p4b5694797cff88a22fd815a9de989d20b@epcas2p4.samsung.com>
	<20240913080325.3676181-1-trunixs.kim@samsung.com>
	<20240913080325.3676181-3-trunixs.kim@samsung.com>
	<CAPLW+4k0rpS0F14sqMGPbq_m=aMqK+g=PZewtZYYroQ+OQBeOQ@mail.gmail.com>
	<000101db1ae5$96c111f0$c44335d0$@samsung.com>

Hi Taewan

> -----Original Message-----
> From: =EA=B9=80=ED=83=9C=EC=99=84=20<trunixs.kim=40samsung.com>=0D=0A>=20=
Sent:=20Thursday,=20October=2010,=202024=2012:56=20PM=0D=0A>=20To:=20'Sam=
=20Protsenko'=20<semen.protsenko=40linaro.org>=0D=0A>=20Cc:=20'Wim=20Van=20=
Sebroeck'=20<wim=40linux-watchdog.org>;=20'Guenter=20Roeck'=0D=0A>=20<linux=
=40roeck-us.net>;=20'Rob=20Herring'=20<robh=40kernel.org>;=20'Krzysztof=0D=
=0A>=20Kozlowski'=20<krzk+dt=40kernel.org>;=20'Conor=20Dooley'=20<conor+dt=
=40kernel.org>;=0D=0A>=20'Alim=20Akhtar'=20<alim.akhtar=40samsung.com>;=20l=
inux-=0D=0A>=20watchdog=40vger.kernel.org;=20devicetree=40vger.kernel.org;=
=20linux-=0D=0A>=20kernel=40vger.kernel.org;=20linux-arm-kernel=40lists.inf=
radead.org;=20linux-=0D=0A>=20samsung-soc=40vger.kernel.org;=20'Byoungtae=
=20Cho'=20<bt.cho=40samsung.com>=0D=0A>=20Subject:=20RE:=20=5BPATCH=202/3=
=5D=20watchdog:=20s3c2410_wdt:=20add=20support=20for=0D=0A>=20exynosautov92=
0=20SoC=0D=0A>=20=0D=0A>=20Hi,=0D=0A>=20=0D=0A>=20Thank=20you=20for=20your=
=20review.=0D=0A>=20Yes,=20cl0=20is=20correct=20not=20cl1.=0D=0A>=20I=20wil=
l=20apply=20it=20to=20v2=20patch.=0D=0A>=20=0D=0ADon=E2=80=99t=20send=20a=
=20top=20up=20reply,=20context=20get=20lost.=20Configure=20your=20email=20c=
lient=20properly=20to=20send=20a=20inline=20reply.=20=0D=0A=0D=0A>=20Best=
=20regards,=0D=0A>=20Taewan=20Kim.=0D=0A>=20=0D=0A=0D=0A

