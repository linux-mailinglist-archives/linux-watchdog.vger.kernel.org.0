Return-Path: <linux-watchdog+bounces-2529-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB89EC1B7
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 02:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2846F284079
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Dec 2024 01:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08EF1DF246;
	Wed, 11 Dec 2024 01:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EXeJbGls"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1F1DED47
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Dec 2024 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733881834; cv=none; b=t6BRXwbYWEQopY0X/1GB6M06PgU6HGVseQajFMvl3zS3ExoKaFBnPPmSKWRpE3DsCKKYSPt8sDIbA2UUzduDTz6jbdHwlpiush+2BB41Mk8YMzLIva7obYyXPWcXO16YXeexbIx5+t925ZUqKjOVyEuUQloXlrW9k2KBUV+4g1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733881834; c=relaxed/simple;
	bh=Lz7xFK6ODOj+KNAtcFSOv8d/FZ8I8/XogocvDGICrtY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RjhPG+a43huTu1JfZIRi4vTNstbL5Gbex0A6VFvxEgxRyAhalhOkIWKq9Xj6yQ8X+yqlDkjl4hTDuMXw0eQ7R1qg9ElaM6sj3NVGuM8yO7AmKn77S0Se3z1KjzW++QNIwYRM2b6VnjxuvtNUHrFuSR0FcS3hpwfm/Dn9WE0BTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EXeJbGls; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241211015028epoutp04832956bb7a7488a8f137710667583f4a~P-FZB5W5j0225502255epoutp042
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Dec 2024 01:50:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241211015028epoutp04832956bb7a7488a8f137710667583f4a~P-FZB5W5j0225502255epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733881829;
	bh=cYwHho9KcGwqfLq7T2him2vuLSNJFKniJMfHJ4dX97Q=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EXeJbGlsEJx3WPSg/ybT7TkDCTI4WMYm7zwSq/a/CKx1M06UXPwQA2R/sRlq1QKZs
	 /rMH9m2sfn1xVq0WYBB1qRNCRyfN8KwuuyZyer0De7GwO22QE+D5yFPDSPSW+lB23s
	 i5IKVsuSK2toeh/L1DTmjNYxR5S9JtcaGYFXXang=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241211015028epcas2p1117c5ae9b0a21a62e5b25c293d5dd7d2~P-FYo2o_b0996709967epcas2p1e;
	Wed, 11 Dec 2024 01:50:28 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.89]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Y7JTJ19Nlz4x9Px; Wed, 11 Dec
	2024 01:50:28 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	94.65.22094.4EFE8576; Wed, 11 Dec 2024 10:50:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241211015027epcas2p34d588c74f1db0da0880d2a2a2c49a007~P-FXu9WJZ2078920789epcas2p3E;
	Wed, 11 Dec 2024 01:50:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241211015027epsmtrp1979b564e95793b0897958f8df6cd14d8~P-FXuDubQ2416624166epsmtrp1u;
	Wed, 11 Dec 2024 01:50:27 +0000 (GMT)
X-AuditID: b6c32a46-d31d72400000564e-86-6758efe4b990
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	AC.2A.18729.3EFE8576; Wed, 11 Dec 2024 10:50:27 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.8.143]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20241211015027epsmtip21cd2b237883ed62838960ab799b7c5ba~P-FXgetpC0407204072epsmtip2S;
	Wed, 11 Dec 2024 01:50:27 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Wim Van Sebroeck'"
	<wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob
 Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>
Cc: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, "'Byoungtae Cho'" <bt.cho@samsung.com>
In-Reply-To: <510e826d-a434-437d-8d2e-3f2618c28b7f@kernel.org>
Subject: RE: [PATCH v4 1/1] arm64: dts: exynosautov920: add watchdog DT node
Date: Wed, 11 Dec 2024 10:50:27 +0900
Message-ID: <000101db4b6f$0d31c460$27954d20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGRpYUbE1kmIx7vVDERT7TS+PBmVwKCnclrAeE4rOgCHZavxLM/hzKQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmme6T9xHpBlf62S0ezNvGZnH/Ux+T
	xZq955gs5h85x2rxctY9Novz5zewW2x6fI3V4vKuOWwWM87vY7K4sW4fu8WThWeYLP7v2cFu
	8fjlP2YHXo9NqzrZPFauWcPqsXlJvcfO7w3sHn1bVjF6fN4kF8AWlW2TkZqYklqkkJqXnJ+S
	mZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3SokkJZYk4pUCggsbhYSd/Opii/
	tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y9rMJpaCVVwV3a0rWBsY
	l3F0MXJySAiYSCx618raxcjFISSwg1Gi8clbRgjnE6PEwVMdbBDON0aJS/92McG0LD73lhki
	sZdRonfTcijnBaPEwtbJrCBVbAIWEkuufWACSYgIbGCSmHrmJliCWeA2o8TO98YgNqeAncSy
	u5/B4sICPhKtG1YDNXBwsAioSvx9GggS5hWwlFh+dxsbhC0ocXLmExaIMfIS29/OYYa4SEHi
	59NlYGNEBNwkrs6dxQRRIyIxu7MN7DgJgTMcEk/XrWIEmS8h4CIxYVYdRK+wxKvjW9ghbCmJ
	l/1tUHa+xMqVJ6A+rpG417aLBcK2l1h05ic7yBhmAU2J9bv0ISYqSxy5BXUZn0TH4b/sEGFe
	iY42IQhTVWL6sgCIGdISE2esZZvAqDQLyVuzkLw1C8n5sxBWLWBkWcUollpQnJueWmxUYASP
	6uT83E2M4BSs5baDccrbD3qHGJk4GA8xSnAwK4nwcniHpgvxpiRWVqUW5ccXleakFh9iNAWG
	80RmKdHkfGAWyCuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgalN
	7cyXPKa/alGnDBt/s6w3/ROiHL4x0qneU1d7+uyrp15fY2HX49+tx1p9TX128epzJu/vLHHI
	csyu43G0edVsvmZhqfCBs4oVkqubphucO7HZKGx9mWne+Y9Hg1rCWo0vnlBttvtZVsHw8MGP
	vzG3VX2qdzdeZeK/Ny02YkNgmbWl38WDnv/sXp6YpVis6P+gXdLV/0VP0JG7fQxcrWnFSc65
	rxVONqxfvqdlTdOJM8xTlAuvTUsKk45Z7eL0btfGl5YqzDxbNs9cfepL1b8HE1ujyisbJovt
	WPGxVOTWlcdlt+NObGaLnigQdvXQtpdGzU4FJTsL1b5fMPpbeeXVHdZVD2eczav4+65u9gUl
	luKMREMt5qLiRABkj4wBSgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvO7j9xHpBncuyVg8mLeNzeL+pz4m
	izV7zzFZzD9yjtXi5ax7bBbnz29gt9j0+BqrxeVdc9gsZpzfx2RxY90+dosnC88wWfzfs4Pd
	4vHLf8wOvB6bVnWyeaxcs4bVY/OSeo+d3xvYPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugStj
	2swmloJVXBXdrStYGxiXcXQxcnJICJhILD73lrmLkYtDSGA3o0Rnz1VGiIS0xJHfL9ggbGGJ
	+y1HWCGKnjFKPN/4lhUkwSZgIbHk2gcmkISIwBYmiemvTjGCOMwCDxkl/r86ANXylVFi5rfT
	zCAtnAJ2EsvufgZrFxbwkWjdsBqonYODRUBV4u/TQJAwr4ClxPK729ggbEGJkzOfsIDYzALa
	Ek9vPoWy5SW2v53DDHGegsTPp8vARooIuElcnTuLCaJGRGJ2ZxvzBEbhWUhGzUIyahaSUbOQ
	tCxgZFnFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcl1qaOxi3r/qgd4iRiYPxEKME
	B7OSCC+Hd2i6EG9KYmVValF+fFFpTmrxIUZpDhYlcV7xF70pQgLpiSWp2ampBalFMFkmDk6p
	BqZJzSc+S13kXM/p/WW+QnLokwN7j0/n3npw7ZOKzf0bebNOnzfSediTtdW/NK/yuZWmnN7S
	1q8RjztvttSfjdo7VaujSqt/4kmPDQIKOwpOWnH0WQYX9fDobbQwVZdaXjt94e0Hn/etMDlm
	tnV3xm12d8b39msZ1Ke2RqQve7zuRsH8FdL8hrdb7PcanLVU1DD35Dna/fyxscz+q9urrFoP
	hjyNeyuksZ/zk5hF6x6ubwfK2xte3BA4+ED6oUPi3gxr8WKJpzns3b2KYueOxLy0XJJiJ9U8
	R+T57qPP/wWl/fUxlYwO2bWzvILDlfOSveSdU9NiM1XenQ9Ma1d03pHzWdw/q8FDIfLDhwOs
	7EosxRmJhlrMRcWJAAO9CHY6AwAA
X-CMS-MailID: 20241211015027epcas2p34d588c74f1db0da0880d2a2a2c49a007
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833
References: <20241206025139.2148833-1-trunixs.kim@samsung.com>
	<CGME20241206025156epcas2p4c55f230accc4354e6f4bf324ab9a5833@epcas2p4.samsung.com>
	<20241206025139.2148833-2-trunixs.kim@samsung.com>
	<510e826d-a434-437d-8d2e-3f2618c28b7f@kernel.org>

on 11/12/2024 01:50 UTC+09:00, Taewan Kim wrote:
>> From: Byoungtae Cho <bt.cho@samsung.com>
>>
>> Adds two watchdog devices for ExynosAutoV920 SoC.
>>
>> Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
>> Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
>> ---
>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>> index c759134c909e..7b9591255e91 100644
>> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
>> @@ -183,6 +183,26 @@ cmu_misc: clock-controller@10020000 {
>>  				      "noc";
>>  		};
>>
>> +		watchdog_cl0: watchdog@10060000 {
>
>You need to do careful rebase, not just accept whatever tools shown you.
>
>This is now placed in incorrect order - not keeping sorting by unit address.

I seems to me that the addresses are sorted correctly in order. 
Could you kindly check again?

        clock-controller@1002_0000
                  watchdog@1006_0000 
                  watchdog@1007_0000
    interrupt-controller@1040_0000

And if there are any rules I might not be aware of, please let me know.

Best regards,
Taewan Kim


