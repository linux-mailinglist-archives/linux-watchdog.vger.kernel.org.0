Return-Path: <linux-watchdog+bounces-2161-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD161997F7A
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 10:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE291F24F47
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 08:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117A9192B78;
	Thu, 10 Oct 2024 07:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UgtOprYx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E21EB9FC
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728545431; cv=none; b=pPpxPQe98AH22kiCIcqb2JdtgqeRb3c3MB8pmz/DHuXUtLc2uWwEkIvXDozBAVYVuySx2pjZdMTaD/coN3VqLxRBq6qDX8vGcYVdKIIq3undHAWOZ63idHy549jCasJ59O+AlBE3eW7ipAfl3tF5ye28wccfIfwvSZcj9bN9L8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728545431; c=relaxed/simple;
	bh=Hl2Okhm50HK6HcdtrudbmJ+fpYvqxsQGocttIQ0xH00=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=CfYuGE6jk/NzeNhJa4UFghaj8If46vUD3kb1z/mN9mnDCWl6Mimht5CcUhQ6zqyIP8oSpXG+CWH94EmpBtW8uI3T8lBlfS23c2A544hxyS99HyuHiTaBVQ7+/Sr+B/+cG3/SiE1EqpvuT1ApQ+ko83ehOVeWjPLOFlXJmnxBYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UgtOprYx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241010073026epoutp02d9b457343c555f5b356fd1ad0e0df030~9BuhSkS9_2493124931epoutp02T
	for <linux-watchdog@vger.kernel.org>; Thu, 10 Oct 2024 07:30:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241010073026epoutp02d9b457343c555f5b356fd1ad0e0df030~9BuhSkS9_2493124931epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728545426;
	bh=ghZ+yu47oN2ivxeOnYRwdmj/6CwQuf55YtNe1ZLDXso=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=UgtOprYx0bvUTOkkGCsmMFJHAc2qpqNbbRryX56zty4Fwf2UrvwEJR9bi2rfZsnjU
	 RMpWR5IKVqLhkJMTGbLhMLksRnX6/c3PVrrpUhrwDzDuX+7wnR00xml0icyg/Zw7xz
	 NY4jMqWIWcG75cWKXNgDPfoMjr2mmBRbWeZY1kaQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241010073026epcas2p1d29fcb63ec7010ef799921d7f27e2f03~9Bug28dNN2959329593epcas2p1r;
	Thu, 10 Oct 2024 07:30:26 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XPLy96vwQz4x9Q6; Thu, 10 Oct
	2024 07:30:25 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	C5.AC.09776.19287076; Thu, 10 Oct 2024 16:30:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241010073025epcas2p2682a6275dacefb759531d2276cf25774~9BugA3PH12004220042epcas2p2U;
	Thu, 10 Oct 2024 07:30:25 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241010073025epsmtrp225d135affe066c450f45f949fc19059e~9BugAB8gp0956709567epsmtrp2A;
	Thu, 10 Oct 2024 07:30:25 +0000 (GMT)
X-AuditID: b6c32a47-aefff70000002630-d8-670782918beb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.E5.07371.19287076; Thu, 10 Oct 2024 16:30:25 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.18.158]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241010073025epsmtip187361f3dbdfae8dc8cfbbf968200caf8~9BufvWEUc0417204172epsmtip1W;
	Thu, 10 Oct 2024 07:30:25 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Wim Van Sebroeck'"
	<wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob
 Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <c3d4c5b5-6c94-4f19-9de1-8f124a91475e@kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Thu, 10 Oct 2024 16:30:24 +0900
Message-ID: <000d01db1ae6$45a393f0$d0eabbd0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFKfb4qWITpWweaAS1H/eZT7s/knAMLSPb9ApAezI0BMPM8CbNqbPzQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmhe7EJvZ0gxffTS0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Novz5zewW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE748CVD6wFD/gqli98y9rA
	uJmni5GTQ0LAROL++dWMXYxcHEICOxgllh64zwSSEBL4xCixpNcRIvGNUWLu7mXsMB2zbjZB
	dexllHi/+Rg7hPOSUeLCqi0sIFVsAhYSS659YAJJiAhsYJKYeuYmK0iCWeA2o8TO98YgNqeA
	ncSPfX1sILawgKfEt98dYCtYBFQl+mYsB4vzClhKHPiykxnCFpQ4OfMJC8QceYntb+cwQ5yk
	IPHz6TKw+SICbhK/N0yAqhGRmN3ZBlVzhkPizUSzLkYOINtF4ujHcoiwsMSr41ugPpOS+Pxu
	LxuEnS+xcuUJJgi7RuJe2y4WCNteYtGZn+wgY5gFNCXW79KHmKgsceQW1FI+iY7Df9khwrwS
	HW1CEKaqxPRlARAzpCUmzljLNoFRaRaSr2Yh+WoWkutnIaxawMiyilEstaA4Nz212KjAGB7T
	yfm5mxjBCVjLfQfjjLcf9A4xMnEwHmKU4GBWEuHVXciaLsSbklhZlVqUH19UmpNafIjRFBjO
	E5mlRJPzgTkgryTe0MTSwMTMzNDcyNTAXEmc917r3BQhgfTEktTs1NSC1CKYPiYOTqkGpo4Z
	Wq/fWDj+D2e5W8fjdPbDQpWyee3vD22avMbpltzUPvF3m3b6n86I2scuFzJBb8uWB2d9drH/
	ebM8af560UsOgvbsqz2+KTybpnZ1JV+ZiWMgh3hdydFN7jkR9/tXed7+OT++43Ni6LWeBxOn
	375cJt2ed+fXzeLH1r8m/e+4LbH4V0jKGQaTCkH1gn+6Kv8qWbwy/XL/1wrz+hdKBf9j4kiq
	lQsLm/33gtH2w/8yM56+Wu7wZFp8hnPe9S3WU841lSW7KYrLesx73ftzwxrP3gZLP9OVE7I4
	X3bIxbnYad0VnuETcoNz6SfOj1m3RFrCxMIT5mv8cRQKCP9m67tjwrbkmSdOe7rahyl0KrEU
	ZyQaajEXFScCADXZC4tJBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsWy7bCSnO7EJvZ0g/3dYhYP5m1js7j/qY/J
	Ys3ec0wW84+cY7V4Oesem8X58xvYLTY9vsZqcXnXHDaLGef3MVncWLeP3eLJwjNMFv/37GC3
	ePzyH7MDr8emVZ1sHivXrGH12Lyk3mPn9wZ2j74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4Mo4
	cOUDa8EDvorlC9+yNjBu5uli5OSQEDCRmHWzibGLkYtDSGA3o8TXSQ/YIRLSEkd+v2CDsIUl
	7rccYYUoes4oseLON2aQBJuAhcSSax+YQBIiAluYJKa/OgU2ilngIaPE/1cHoFq+Mko0LrzD
	AtLCKWAn8WNfH9hcYQFPiW+/O8D2sQioSvTNWA4W5xWwlDjwZSczhC0ocXLmE7BeZgFtiac3
	n0LZ8hLb385hhrhPQeLn02WsILaIgJvE7w0ToGpEJGZ3tjFPYBSehWTULCSjZiEZNQtJywJG
	llWMkqkFxbnpucmGBYZ5qeV6xYm5xaV56XrJ+bmbGMGRqaWxg/He/H96hxiZOBgPMUpwMCuJ
	8OouZE0X4k1JrKxKLcqPLyrNSS0+xCjNwaIkzms4Y3aKkEB6YklqdmpqQWoRTJaJg1OqgUne
	VPyghPmCN2p5k467LnEInb6n6PPq7LvLGlacN5jiMoO19HRDj9w6kWW1Tjeac/g/7DablHkk
	ZhW7m8YW70Pqt+5+XDrJPn3ZrmlPo83Dg48ofPraFPiCXS24hu/1oknn6h1MnrHMqPr4ujNt
	6ToZ8+mb/pZub5i/daW5YI7Pt8mXawOWfC1KefomYHvv+ZkF9lMkntsG3O4oDba/UvA6tFZA
	hm3ipiXpZ4xlT7PPdNq58DL34QSmbf9Oi931Zmqw2OZqxTT59o80/UtaDwr+ryp8Mkd6/rfb
	4ZUb17CarhHK1zgoZyL6/s6lT7V6d9xf/WK7vfJyU218UUml9cwAu/khc8qrJAq+N9n6bQ5X
	YinOSDTUYi4qTgQAjEiBuTsDAAA=
X-CMS-MailID: 20241010073025epcas2p2682a6275dacefb759531d2276cf25774
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c
References: <20240913080325.3676181-1-trunixs.kim@samsung.com>
	<CGME20240913080347epcas2p46fd90107fe54b8eab3a031cf2fbd592c@epcas2p4.samsung.com>
	<20240913080325.3676181-4-trunixs.kim@samsung.com>
	<c3d4c5b5-6c94-4f19-9de1-8f124a91475e@kernel.org>

Hi,

I will move it between 'chipid@10000000' and 'interrupt-controller@10400000'.
Thank you for pointing.

Best regards,
Taewan Kim.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, September 30, 2024 8:38 PM
> To: Taewan Kim <trunixs.kim@samsung.com>; Wim Van Sebroeck <wim@linux-
> watchdog.org>; Guenter Roeck <linux@roeck-us.net>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; Byoungtae Cho <bt.cho@samsung.com>
> Subject: Re: [PATCH 3/3] arm64: dts: exynosautov920: add watchdog DT node
> 
> On 13/09/2024 10:03, Taewan Kim wrote:
> > From: Byoungtae Cho <bt.cho@samsung.com>
> >
> > Adds two watchdog devices for ExynosAutoV920 SoC.
> >
> > Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
> > Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20
> > +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > index c1c8566d74f5..de210f8e5599 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > @@ -297,6 +297,26 @@ pinctrl_aud: pinctrl@1a460000 {
> >  			compatible = "samsung,exynosautov920-pinctrl";
> >  			reg = <0x1a460000 0x10000>;
> >  		};
> > +
> > +		watchdog_cl0: watchdog@10060000 {
> 
> Does not look like placed in correct location. 1a46 > 1006. Please follow
> DTS coding style in all your works.
> 
> Best regards,
> Krzysztof



