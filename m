Return-Path: <linux-watchdog+bounces-3124-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396ECA66E6D
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 09:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8710617008C
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Mar 2025 08:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9503C1DF27F;
	Tue, 18 Mar 2025 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LeBCtzEo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49A1F873E
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Mar 2025 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287040; cv=none; b=nvH/ZAobVP2wiQSSIyoDDysnDPJPPY8aiGQmcHTvkGL9fIS/34kTj87Cb1Duz5moRAO9h6ztLRqL8+DYOUUNbLhIU91LRU6AnGn3+VJG3PiVxs92Wd3UUKdEbO9BVbj4m70Lth+xpHfCsaBVHzPOrwoxE9Gpyf07hmgLPEZ8srA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287040; c=relaxed/simple;
	bh=qWB/nQ+WLImLMHG+BXqJEGHrkCPncwaHMm+h04zSxio=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=IRz4pYDKAT2GXCY5CduweutwXP9MzSN6tcNitwXdAfvKW9vX1YR2rgIDV91iQDcCWxZYZMFxRuTABtODQx14+IQGbJD9/aeTDy14uJPyRHk7saor5FfIAXgMNBJfwnt3r+VuCAuodfQmysWMudhqlHyqGYXKcaSgU83lIDjGuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LeBCtzEo; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250318083716epoutp03cabfa053d3e3fba73d26940cc1aeb243~t2NQfYJDE2212122121epoutp03X
	for <linux-watchdog@vger.kernel.org>; Tue, 18 Mar 2025 08:37:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250318083716epoutp03cabfa053d3e3fba73d26940cc1aeb243~t2NQfYJDE2212122121epoutp03X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1742287036;
	bh=zxFBZhSyljfBuZl8+VxXwwW8JZ8C3bgoTt/PQ50CEOw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=LeBCtzEoiyLgF59NjzROr+m9L6DoNiT8auNai344/DxXJqRiaNNQrSapeE80MrSsN
	 LNPZKvbHy4kMkTQFjwAtcpnoRGfLlUbsIzwQiEr4tc5og7BplNJhiF1QnLGDuONnuA
	 WJIrriVb8A2sINVZ8Ftd29qWtF4H/aWv2dkwymHM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20250318083715epcas2p2197f53a56350426ddd7d4888ce055755~t2NP2PUzZ0881708817epcas2p2L;
	Tue, 18 Mar 2025 08:37:15 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.90]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4ZH4vv1Cb2z4x9QL; Tue, 18 Mar
	2025 08:37:15 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	01.6B.32010.AB039D76; Tue, 18 Mar 2025 17:37:15 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250318083714epcas2p3e8276a9ffbaee5c337a7faa4c1709dd1~t2NO5AA_D3071530715epcas2p30;
	Tue, 18 Mar 2025 08:37:14 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250318083714epsmtrp21572390cff081eca95ae04660bee5fa1~t2NO4V67n1843718437epsmtrp2k;
	Tue, 18 Mar 2025 08:37:14 +0000 (GMT)
X-AuditID: b6c32a4d-acffa70000007d0a-ba-67d930ba3166
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	9E.68.33707.AB039D76; Tue, 18 Mar 2025 17:37:14 +0900 (KST)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250318083714epsmtip12723a19d112c17deefb267fd3933a2f2~t2NOqcXlR2646226462epsmtip1k;
	Tue, 18 Mar 2025 08:37:14 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, "'Kyunghwan Seo'" <khwan.seo@samsung.com>
In-Reply-To: <658c00e2-e8ef-4997-bb91-9620e97bafae@kernel.org>
Subject: RE: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
 ExynosAutoV920 SoC
Date: Tue, 18 Mar 2025 17:37:13 +0900
Message-ID: <000001db97e0$f2ef9e60$d8cedb20$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG67P3IPb+lR6iHsR4BOPQv+XcanAE12wemAZEiIRgBot3M3bOWmGgw
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqe5ug5vpBqu2MFs8mLeNzWJ++yVG
	i/PnN7BbbHp8jdXi8q45bBYzzu9jsrixbh+7xZOFZ5gsHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTy
	EnNTbZVcfAJ03TJzgI5SUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YW
	l+al6+WlllgZGhgYmQIVJmRntC3fzlRwgqfi66NmlgbGKVxdjJwcEgImEvMPfWbpYuTiEBLY
	wyjx5s46RgjnE6PE41XzmUGqwJxlkzVgOjZeOcIOUbSTUWLu2/fMEM5LRonOL+dZQKrYBOQk
	lva3gdkiAlUSbbMOsoEUMQscYJT40zKdFSTBKWAnMaHvDzuILSwQK3H8+EUmEJtFQFXi47wf
	QA0cHLwClhLnV4uDhHkFBCVOznwCNpNZQF5i+9s5zBAXKUj8fLqMFWKXm8S+k0/YIGpEJGZ3
	toEdJyGwlENi0Yw5bBANLhJHPyxigrCFJV4d38IOYUtJfH63F2yvhEC+xKknwhC9DYwS75rf
	Q/XaSyw685MdpIZZQFNi/S59iHJliSO3oE7jk+g4/JcdIswr0dEmBNGoItHxczMrzKKjZx6w
	T2BUmoXksVlIHpuF5IFZCLsWMLKsYpRKLSjOTU9NNiow1M1LLYfHd3J+7iZGcJLV8t3B+Hr9
	X71DjEwcjIcYJTiYlUR43Z9cTxfiTUmsrEotyo8vKs1JLT7EaAoM7YnMUqLJ+cA0n1cSb2hi
	aWBiZmZobmRqYK4kzlu9oyVdSCA9sSQ1OzW1ILUIpo+Jg1OqgcnIZbdLUNJxw7dfg08WhHDc
	iLfObHjHq1ot5dP96p3yhXPz1116tHNCiHXwxB97Jn/dK/pOstr3nd/h58s/frb7c/yxWa56
	45yNq28b2V+5WZpUUiyb1nFKJt5HctlPv3fp3q/kOP/nv/8m1yd3svmMtPNKiyqFqzfO2WYl
	f+99dVf2UOX53UE8k6Y/FVn4SJDv65ZreRI+jIwP1Y47qipzTGF3XjhTj+N27pvtUryC6kmf
	jrayFjaFr72Xsvf89Fs3Nl4PDKzo/v5FuzZCtX2FfOHUfM4m5kDux/buu1NMdy9/mfja+eRS
	Zr2HnKslQz0uL0367V75wu+SGOMGNZbpJjvcTO1PXqnPDrmvk6fEUpyRaKjFXFScCADAEcS2
	OwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJTneXwc10gy3LVCwezNvGZjG//RKj
	xfnzG9gtNj2+xmpxedccNosZ5/cxWdxYt4/d4snCM0wWj1/+Y3bg9Ni0qpPNY+WaNawem5fU
	e+z83sDu0bdlFaPH501yAWxRXDYpqTmZZalF+nYJXBlty7czFZzgqfj6qJmlgXEKVxcjJ4eE
	gInExitH2LsYuTiEBLYzSnzv/8XaxcgBlJCSePfMEqJGWOJ+yxFWiJrnjBILz2xgB0mwCchJ
	LO1vYwGxRQTqJFZfvskIYjMLHGGUmPHZEqLhE6PE1YVdYEWcAnYSE/r+gDULC0RLHJ9yhQnE
	ZhFQlfg47wcbyGJeAUuJ86vFQcK8AoISJ2c+YYGYqS3x9OZTKFteYvvbOcwQxylI/Hy6jBXi
	BjeJfSefsEHUiEjM7mxjnsAoPAvJqFlIRs1CMmoWkpYFjCyrGEVTC4pz03OTCwz1ihNzi0vz
	0vWS83M3MYIjTCtoB+Oy9X/1DjEycTAeYpTgYFYS4XV/cj1diDclsbIqtSg/vqg0J7X4EKM0
	B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgalVjpV5ngJbgfclVa5g1vLLL0u+yzDrF/00
	esG1ZOpsGWPfZ9lRuzczsLAq6wYLK1x8uOgcf8CH/m1K26vtHsmszIkxPhw6SzcrLly/3OdO
	y/IlQRpnHObt+yfH3i8dnR71vfrR9dRpS7bl77i1xnSOqVhoj1qs1c4/Znu3KX8uLj0hM5+h
	4mlGx1z1Qs4zxcc2X/p8XkLD2nPpdb3/tYL229Ye8mCfwD4vTz59ypcLEu4e3L2zne8zv62V
	jfVkdszP7Hzkd3H/Rf4XPvkzTrOe3XdzVdujL4fLJfi/3ZynKcj9+HpIcb+FjKp1wNF518uT
	fV+HRv+9LdXhyvikh0vIrtbIs0lbSmqJ9H4bJZbijERDLeai4kQAwVYqcx8DAAA=
X-CMS-MailID: 20250318083714epcas2p3e8276a9ffbaee5c337a7faa4c1709dd1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423
References: <9c94a771-b3e6-4ba4-9b7f-dcd93b53f924@kernel.org>
	<CGME20250318005143epcas2p40ebb1954bed8890aaf8d0a641f710423@epcas2p4.samsung.com>
	<20250318004411.695786-1-sw617.shin@samsung.com>
	<658c00e2-e8ef-4997-bb91-9620e97bafae@kernel.org>

Hello, Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, March 18, 2025 4:20 PM
> To: Sangwook Shin <sw617.shin@samsung.com>; alim.akhtar@samsung.com;
> wim@linux-watchdog.org; linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; Kyunghwan Seo <khwan.seo@samsung.com>
> Subject: Re: [PATCH v2] watchdog: s3c2410_wdt: Fix PMU register bits for
> ExynosAutoV920 SoC
> 
> On 18/03/2025 01:44, Sangwook Shin wrote:
> > From: Kyunghwan Seo <khwan.seo@samsung.com>
> >
> > Fix the PMU register bits for the ExynosAutoV920 SoC.
> > This SoC has different bit information compared to its previous
> > version, ExynosAutoV9, and we have made the necessary adjustments.
> >
> > rst_stat_bit:
> >     - ExynosAutoV920 cl0 : 0
> >     - ExynosAutoV920 cl1 : 1
> >
> > cnt_en_bit:
> >     - ExynosAutoV920 cl0 : 8
> >     - ExynosAutoV920 cl1 : 8
> >
> > Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> > Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> > ---
> > v1 -> v2: Restore previous email history and tags.
> >
> 
> Why do you send patches which were applied?
> 
> Best regards,
> Krzysztof

I can't see this patch in -next yet.
Could you please advise me where it is? Then, I will check again.
If there are any missing parts that I need to handle on my end,
please let me know.


