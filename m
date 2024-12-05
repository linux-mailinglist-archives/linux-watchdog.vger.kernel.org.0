Return-Path: <linux-watchdog+bounces-2501-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF539E4B17
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 01:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36E91188125F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Dec 2024 00:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A211C23918E;
	Thu,  5 Dec 2024 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="toGHzvE6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EAA1C36
	for <linux-watchdog@vger.kernel.org>; Thu,  5 Dec 2024 00:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733358494; cv=none; b=FcconsnqOjFSjZBjtyj+rDBmyv/WN93C9kpEd6wZmxxBs5oamigNDy+VrvHLIH7wau+qkt7yeQzXGuHME4ljXlxSHr1+fxx1OIKCCPWnu9M5dJARQrbGf7Ebcka20vHBKFCAdGgta5qQlCQm39qdDZMR88dVMZDg9ga1ukKh3uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733358494; c=relaxed/simple;
	bh=a6stA5ASexUe+YGUItYApNHYpHd6ANHwTZsx7ZD2hH8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UKSeRa3OHuJOcX1icfgchIlwtEHKu3TP8bZK9keBg4O+Gm3KzVUeQwHjLOuL5FpUGAHRNzDgWuzOIomwBbaPNu07yLlcweNfs2FjnmnOij7EgGaJ6EZBiuEfvTFXB6zwxYe+s3hnNIo0LId1ucyPMWRLMobbis8qtTRSHZd/Nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=toGHzvE6; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241205002810epoutp031e22f3a1da39492436899b6ef30982ef~OIFzpHfjR1662816628epoutp03Y
	for <linux-watchdog@vger.kernel.org>; Thu,  5 Dec 2024 00:28:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241205002810epoutp031e22f3a1da39492436899b6ef30982ef~OIFzpHfjR1662816628epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733358490;
	bh=UHsb9uG3lsO2MSDA0jNylxCXRl9bK7Qx7zpPxaTAmzQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=toGHzvE63Ncn8C6Fa3NIJ64vB797mQAlK6A7Lg/QaG7+ipLuX6xvrz0ujqLhr/tpL
	 QCThopQvQADSPfPA6c1i4AMxthgzstP2OK6BrfyjImeetN+qam6+8z8+JPFNCm3yPI
	 cdt+2+UdyOxfmzikR51j0B919e5VJPu2ieTWS18U=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241205002809epcas2p12e68369b9434556e75935c0ccea2e71c~OIFzE1vHr0419504195epcas2p11;
	Thu,  5 Dec 2024 00:28:09 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.99]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Y3Zx46vstz4x9Pt; Thu,  5 Dec
	2024 00:28:08 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.75.22105.693F0576; Thu,  5 Dec 2024 09:28:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241205002806epcas2p458dbe079cd2287366c636d168a998edb~OIFwGtYVX2084520845epcas2p46;
	Thu,  5 Dec 2024 00:28:06 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241205002806epsmtrp28e8e468e1bc5806b7e947f31e2063f04~OIFwE2dkZ1071310713epsmtrp2I;
	Thu,  5 Dec 2024 00:28:06 +0000 (GMT)
X-AuditID: b6c32a47-fd1c970000005659-11-6750f3969cb5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EE.A0.18729.693F0576; Thu,  5 Dec 2024 09:28:06 +0900 (KST)
Received: from KORCO119526 (unknown [10.229.8.143]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241205002805epsmtip1b76984dc726d58d245434a8f166ae988~OIFv4NdDI1474514745epsmtip1u;
	Thu,  5 Dec 2024 00:28:05 +0000 (GMT)
From: =?utf-8?B?6rmA7YOc7JmE?= <trunixs.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: "'Guenter Roeck'" <linux@roeck-us.net>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, "'Alim Akhtar'" <alim.akhtar@samsung.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <c487babb-84a5-4e47-a58f-75fec55cbabb@kernel.org>
Subject: RE: [PATCH v3 3/3] arm64: dts: exynosautov920: add watchdog DT node
Date: Thu, 5 Dec 2024 09:28:05 +0900
Message-ID: <000201db46ac$8d7cfee0$a876fca0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMd16p+X2UldERt9X3UXGHKyeOT/gFfR1PzAhOyk7QBWm0aqwINNyvVAoah3z0BqLdGjwJ1Uc7or+WuLIA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmqe60zwHpBi9OqFg8mLeNzWLN3nNM
	FvOPnGO1eDnrHpvF+fMb2C02Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgd+D22LSq
	k81j85J6j53fG9g9+rasYvT4vEkugDUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ
	0sJcSSEvMTfVVsnFJ0DXLTMH6DIlhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFKToF5
	gV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGm/6dTAXv2SvOXtvA1MD4l7WLkZNDQsBEYnPTMcYu
	Ri4OIYEdjBK3Dr5hgnA+MUos3nsJyvnGKHF98QZ2mJbXLW+YIRJ7GSUWPN3LCuG8YJR4fGk7
	M0gVm4CFxJJrH5hAbBEBXYnNN5aDdTMLtDJL7L0qBmJzCthJHJx1AywuLOAjMX/vObBeFgEV
	iUkbe8HivAKWEueXP2WFsAUlTs58wgIxR15i+9s5zBAXKUj8fLoMqIYDaFeSRMMTEYgSEYnZ
	nW1gh0oIbOGQ2H10ElS9i8Sco5OgvhGWeHV8C5QtJfH53V42CDtfYuXKE0wQdo3EvbZdLBC2
	vcSiMz/ZQXYxC2hKrN+lD2JKCChLHLkFdRmfRMfhv+wQYV6JjjYhCFNVYvqyAIgZ0hITZ6xl
	m8CoNAvJW7OQvDULyf2zEFYtYGRZxSiWWlCcm55abFRgDI/q5PzcTYzgJKvlvoNxxtsPeocY
	mTgYDzFKcDArifAGaQekC/GmJFZWpRblxxeV5qQWH2I0BQb0RGYp0eR8YJrPK4k3NLE0MDEz
	MzQ3MjUwVxLnvdc6N0VIID2xJDU7NbUgtQimj4mDU6qBSXddTnl2+vIdbtvylrSYvk60Mcme
	J87NunY3Q/B97ZRv0/qSDTozYqWfpi058MO8nv/pjPRTjy1+mIeUPXLOWrhWaqeFR/O3B3Yf
	Ts6b9ebc/laR2MXrDwsKyyXLH2WZub4k+kFslWbBT7OXUbqlfvUPFzjE8v249WT3DJeGc1c1
	kwPP7WqWfRrKFflo7/3rDTMtJvkuOjFrWp7n8Qvcr+bvD2cufK6+wcBJ7tTmHJfn0RXBvIEb
	T1f737IzUj33f/nf2KhbgpoyThGW2duvSjA0+/mbHXB4rzZp1veFyRk/zrhUFhkfnq5weGZq
	IIOGdZL/C8+bVucnFKy5q8Q6ozbBYOPeesUIk3rNW4kGSizFGYmGWsxFxYkAEEYtKTsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSnO60zwHpBn9+s1o8mLeNzWLN3nNM
	FvOPnGO1eDnrHpvF+fMb2C02Pb7GanF51xw2ixnn9zFZ3Fi3j93iycIzTBb/9+xgd+D22LSq
	k81j85J6j53fG9g9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+NN/06mgvfsFWevbWBqYPzL
	2sXIySEhYCLxuuUNcxcjF4eQwG5GieO7HkMlpCWO/H7BBmELS9xvOcIKUfSMUaJvwSewIjYB
	C4kl1z4wgdgiAroSm28sZwcpYhboZZbYf3sn1NitzBJfVhwH6+AUsJM4OOsGO4gtLOAjMX/v
	OWYQm0VARWLSxl6wOK+ApcT55U9ZIWxBiZMzn7CA2MwC2hJPbz6FsuUltr+dwwxxnoLEz6fL
	gOo5gK5Ikmh4IgJRIiIxu7ONeQKj8Cwkk2YhmTQLyaRZSFoWMLKsYpRMLSjOTc8tNiwwzEst
	1ytOzC0uzUvXS87P3cQIjjstzR2M21d90DvEyMTBeIhRgoNZSYQ3SDsgXYg3JbGyKrUoP76o
	NCe1+BCjNAeLkjiv+IveFCGB9MSS1OzU1ILUIpgsEwenVANT4nkR/sJrZs1rTnny2YasaFFx
	1Ptp1npfomDyAuVHOzLuFnkYzTobkei4UZ1vZcP9xy0HQqwUZY80Mr3hmJlsWekpwf3qyLOO
	u2LvtS9y8Up7vc965PpVZYXgHAZG+wzh1zMOVZg+e55+sGaiUdCU4595z3ZKbcnSL0rmmcNz
	+f7VR+vUVeIui75PXMEqvr+W4eP8RZ6suzuUP+tWcTzUY3wckDjr+e4nwtffl7Ieuvnbl5nt
	+ISpU4QP1cwNdazsDTI2+bSmO8SQ6aBHelS7BlPW3rJWswPfHjXtcQjYUrCKJ6Hg3fLHl+6e
	LG1dW+PxOn1F/XfOa5I8+XOW3CprWpjasKXI0b7l6bOHMtZKLMUZiYZazEXFiQDV5FOYKgMA
	AA==
X-CMS-MailID: 20241205002806epcas2p458dbe079cd2287366c636d168a998edb
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

Hi Krzysztof,

> On 07/11/2024 12:33, Wim Van Sebroeck wrote:
> >>> Seems like you are having a hard day.
> >>> The 3 patches are dropped. I presume that you will take them all
> through your tree then?
> >>
> >> I meant only this one patch, not entire patchset. The bindings and
> >> watchdog driver are for you. I commented only about this patch here -
> DTS.
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > I added the first two patches again. Even when it sounds more logical to
> me to keep the 3 together.
> 
> Thank you.
> 
> > But that's a never ending discussion, so we won't go into that :-).
> 
> DTS is hardware description independent from Linux, therefore always goes
> separate way than Linux drivers.
> 
> Best regards,
> Krzysztof

I found that the first two patches have been added to the linux-next git, 
but the last patch has not yet been reviewed.

I would appreciate it if you could take a look at this patch.

Best regards,
Taewan Kim.


