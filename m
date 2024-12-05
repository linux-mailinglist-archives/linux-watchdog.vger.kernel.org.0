Return-Path: <linux-watchdog+bounces-2504-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF59E5559
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 13:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698221883A96
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 12:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941C32185AB;
	Thu,  5 Dec 2024 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EP1p28uE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D678218858
	for <linux-watchdog@vger.kernel.org>; Thu,  5 Dec 2024 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733401528; cv=none; b=TJYgsckr7dYDOh5khdvwgeTvYyiOf66Aqw+MXY2HbnaDrRuNjZbJCehNNgxv3FuWovExPHAk8tMHPKQ4vrOR9hrEe9jguBmmAj2a5bZdoWQpUR9/GQZHbdrf1ceFUBXmM1cnzkxHJRVjg5cZDw/QILI+yrTpRk2mEC/IgKIcIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733401528; c=relaxed/simple;
	bh=WPXMlTZi12QvOahzFxlfj0ZntAWpM5vwwLRm2I9tu2E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=KmUN+SsgNN7SommqvJMeVPhtFsI3vTvEhHQVbEidUFYlkYX3TttF8FctCiH26i85Dn7VB18oH+FjTdTkrYrKfmBor59lcxnW67JR/4jVpHz5YOpQr9FyK6vfGg0MpfYtmA75xFApajS4/+GdOOjfA5U3xjulc8pM0DulERFZuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EP1p28uE; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241205122518epoutp02afd95181a3854095cac4bdd1653a7f7d~OR39Udc040434804348epoutp02W
	for <linux-watchdog@vger.kernel.org>; Thu,  5 Dec 2024 12:25:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241205122518epoutp02afd95181a3854095cac4bdd1653a7f7d~OR39Udc040434804348epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733401518;
	bh=WPXMlTZi12QvOahzFxlfj0ZntAWpM5vwwLRm2I9tu2E=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EP1p28uEugGXbU++hClVaTxLLjdfTy+uFt6cLPfo/bz++b4/PSpA1XU9Qv8s66/ct
	 mddRSPgXWAT6FyWmgdqeNenKJUrZEStG8ZrijVzoU4K2jqj+VHrRueG+YUO7r6v5vI
	 fVF3yi84qD6uFhbumvkv10tKA2WrM6bRkiCOZZH4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241205122517epcas2p4ec38c7b502dbeae3929411f3f27e07a1~OR38LuJSv0892808928epcas2p48;
	Thu,  5 Dec 2024 12:25:17 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Y3trY1ZYSz4x9Pv; Thu,  5 Dec
	2024 12:25:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.73.22094.DAB91576; Thu,  5 Dec 2024 21:25:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241205122516epcas2p40e6821cea8284c7be97e97c39786903d~OR37eqBAC1431414314epcas2p4Z;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241205122516epsmtrp1cf56288ce90ef0b1e0d82733f72324e1~OR37dUsld1598715987epsmtrp1F;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
X-AuditID: b6c32a48-e7eec7000000564e-5a-67519badc2b1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.31.33707.CAB91576; Thu,  5 Dec 2024 21:25:16 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.8.143]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241205122516epsmtip17e3ef31be9c4e9da5215bc7a78d99ca9~OR37PGvFj3180031800epsmtip1n;
	Thu,  5 Dec 2024 12:25:16 +0000 (GMT)
From: =?UTF-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <171072ed-c35f-430e-a8c0-5cf718efed0c@kernel.org>
Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Thu, 5 Dec 2024 21:25:16 +0900
Message-ID: <000101db4710$bdac8310$39058930$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMd16p+X2UldERt9X3UXGHKyeOT/gFfR1PzAhOyk7QBWm0aqwINNyvVAoah3z0BqLdGjwJ1Uc7oAYTj+0gB7mXbwQHAQo3Er7zbaRA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqe7a2YHpBrN7OSwezNvGZrFm7zkm
	i/lHzrFavJx1j83i/PkN7BabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awO3B7bFrV
	yeaxeUm9x87vDewefVtWMXp83iQXwBqVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGto
	aWGupJCXmJtqq+TiE6DrlpkDdJmSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8C8
	QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvjcNMx9oJ+9oqF3a+ZGxivs3YxcnJICJhI9DTeYOli
	5OIQEtjBKNG2aQ+U84lRorOrlRXOeTnrCjtMy5PGf0wQiZ2MEs/XzWWGcF4wSuzeexmon4OD
	TcBCYlZfJkiDiICuxOYby8GamQVamSX2XhUDsTkF7CRubbvFBGILC/hIzN97jhnEZhFQkfg5
	8RNYnFfAUuLz/F4WCFtQ4uTMJywQc+Qltr+dwwxxkILEz6fLWCF2lUnsmbyNCaJGRGJ2ZxvY
	bRICazkkWjYsZYJocJH43PoW6hthiVfHt0DZUhIv+9ug7HyJlStPQNXXSNxr28UCYdtLLDrz
	kx3kR2YBTYn1u/RBTAkBZYkjt6BO45PoOPyXHSLMK9HRJgRhqkpMXxYAMUNaYuKMtWwTGJVm
	IflrFpK/ZiG5fxbCqgWMLKsYxVILinPTU4uNCkzgUZ2cn7uJEZxktTx2MM5++0HvECMTB+Mh
	RgkOZiUR3sqwwHQh3pTEyqrUovz4otKc1OJDjKbAkJ7ILCWanA9M83kl8YYmlgYmZmaG5kam
	BuZK4rz3WuemCAmkJ5akZqemFqQWwfQxcXBKNTDNErx57Fdjwtcjd3vcGeU8lE93yv9857Tj
	Z+6PvT+il+rMnR/gcJ0p4JzNtXkmn+SfNnwUzBacIeCiqfqBfUvSpD6nk/kNHzbn1PW72oeV
	snVdZEx45rzdefvc0rzNp9PrPsunrnm2UF1GtvP6t1a/C1L9LV8cFknkrSnZuuCWlafPtD33
	s2/r7MzVayv0ibBUM5XKf6m/8E5d3uI98z4/ktHZd6I3edna2oy912Y4NbNktVo7a0mtr/PY
	0nlANFDOYeXryV+OPBe5cfbh3CNzzzQsNmXXP7PY55HcG/WPdYy8GSblJWVPw2bO8FvHWOIa
	F8vx4TfLjSlzu2+HXZQIXjbL9m+tsrFB2s/iWRVKLMUZiYZazEXFiQDqOH4HOwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnO6a2YHpBk1bNC0ezNvGZrFm7zkm
	i/lHzrFavJx1j83i/PkN7BabHl9jtbi8aw6bxYzz+5gsbqzbx27xZOEZJov/e3awO3B7bFrV
	yeaxeUm9x87vDewefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlXG46Rh7QT97xcLu18wNjNdZ
	uxg5OSQETCSeNP5j6mLk4hAS2M4o8XTFFXaIhLTEkd8v2CBsYYn7LUdYIYqeMUp8mXEaqIOD
	g03AQmJWXyZIjYiArsTmG8vZQWqYBXqZJfbf3skM0XCcRWLjyUVMIFWcAnYSt7bdArOFBXwk
	5u89xwxiswioSPyc+AkszitgKfF5fi8LhC0ocXLmEzCbWUBbovdhKyOELS+x/e0cZojrFCR+
	Pl3GCnFFmcSeyduYIGpEJGZ3tjFPYBSehWTULCSjZiEZNQtJywJGllWMoqkFxbnpuckFhnrF
	ibnFpXnpesn5uZsYwfGmFbSDcdn6v3qHGJk4GA8xSnAwK4nwVoYFpgvxpiRWVqUW5ccXleak
	Fh9ilOZgURLnVc7pTBESSE8sSc1OTS1ILYLJMnFwSjUwhaTtZzB7dd9tU+nzeMZbrbPn+7hz
	K3M1HPRx/RMg8mqOs3RQ2ZV8mXl79C8ebP1Wzvpt1bNlpceXcZmdiWuWVX+ksm6Oefglp/V/
	PP+8efXjw7Iqp4hNHA/2xTRGcnBPWnXx6twQWYaJP/yNf85JDW7WDb17ZePa440PPBvV1tzf
	W7P9LcfKGHW2jMTEc0IXYpUlC84tmXRGplzGnPP1x2XmH1feOr6pv6vj/hGWB+sDpommVVp1
	Nj9U6S4T6Am8VrDURVF8a6z6vdWqT56xcVioLkxuPOF6VzhJSM6ozbzMcdXRS26X8qZ9VuPr
	m/HbZqOm5+e5xznfngi7Z2flEjfz3cHLf2/oR+j9csuOVmIpzkg01GIuKk4EAMJ1jYQmAwAA
X-CMS-MailID: 20241205122516epcas2p40e6821cea8284c7be97e97c39786903d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc
References: <20241021063903.793166-1-trunixs.kim@samsung.com>
	<CGME20241021063938epcas2p1c01c89badb532f08a46087a4907df7dc@epcas2p1.samsung.com>
	<20241021063903.793166-4-trunixs.kim@samsung.com>
	<961e1aca-cd90-4db1-87d7-afd2e542421e@kernel.org>
	<20241107103331.GA4818@www.linux-watchdog.org>
	<589c40e1-6a1c-4ef7-b0d8-b761b132578a@kernel.org>
	<20241107113325.GA5284@www.linux-watchdog.org>
	<c487babb-84a5-4e47-a58f-75fec55cbabb@kernel.org>
	<000201db46ac$8d7cfee0$a876fca0$@samsung.com>
	<88950a3a-c3de-4ff5-9ff8-9b85e1b0ad14@kernel.org>
	<171072ed-c35f-430e-a8c0-5cf718efed0c@kernel.org>

on 05/12/2024 12:25 UTC+09:00, Taewan Kim wrote:
>>>>> But that's a never ending discussion, so we won't go into that :-).
>>>>
>>>> DTS is hardware description independent from Linux, therefore always
>>>> goes separate way than Linux drivers.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> I found that the first two patches have been added to the linux-next
>>> git, but the last patch has not yet been reviewed.
>>>
>>> I would appreciate it if you could take a look at this patch.
>>
>> Since this patch was applied, I dropped from my queue. I don't have it
>> in my inbox anymore. Please rebase, resolve any comments and resend.
>
>I found it in my inbox and tried to apply but it fails:
>error: patch failed: arch/arm64/boot/dts/exynos/exynosautov920.dtsi:172
>
>
>please rebase and resend.

Thanks to your hard work, I will resend it after rebase.

Best regards,
Taewan Kim


