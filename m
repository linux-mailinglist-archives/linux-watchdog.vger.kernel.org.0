Return-Path: <linux-watchdog+bounces-3859-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2542B03906
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 10:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F59D3BE57A
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 08:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C5523BD05;
	Mon, 14 Jul 2025 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GPSTHLpv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD51E5B82
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481064; cv=none; b=cS3l2MX+1JHsLxmDU4FsNHfq6TKfzLEUU7/j0/aJwqqTnI7mfUS2aZej3vqpefB7/NymWXpecDqy+lkqlJjvAOUme3Wzdm1CeUF3lUR+kc2Vfl7Rv+hEal8EypdUzLNGaAdIUe6bj+iZpDm7itS709s1YJTc/+Rq01Cjhgg8L1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481064; c=relaxed/simple;
	bh=vuIneu7pM5DIf0S1GOG5o8U5Cu3F83SLWq90fihZ9gA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=W4GHvAAvbgnVdckif5JQLg87oPK/7t9wlAJhVsiDwQXde1W6TAQLWLtGstQLuitVDRLDRAkb2teZWRbVHU2P9bi+j2BtdK2USFgbtXnc2U2kyPNcvhdoBfQZfvEOc9zaJ5ta4ytlZvuZ2PwR+ex2/yU8ThcHXqKk1ayBvnWDmPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GPSTHLpv; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250714081739epoutp01996ee96e087afe9da69ec0943c9b498d~SED0hTXlk2569125691epoutp01V
	for <linux-watchdog@vger.kernel.org>; Mon, 14 Jul 2025 08:17:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250714081739epoutp01996ee96e087afe9da69ec0943c9b498d~SED0hTXlk2569125691epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752481059;
	bh=vuIneu7pM5DIf0S1GOG5o8U5Cu3F83SLWq90fihZ9gA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GPSTHLpvrIdCbHkiVrB8Uo8ZndCQxfWHLVW/ZFGV+G6QkE8ul31rhAy8YHFT4b/Bv
	 L0n3+KUbGgpyKaYVtctzkWtujiCPruPBcrPNhNDfOJfxLsIKMJQY2YW52RtDVp2pYF
	 phsw6gTYCtKrHXUMKbsMl6NGIw0JRnQ4ELUP9WdU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250714081739epcas2p19bbac4165e91d7dacad9ecaeb7ece5f7~SED0G2MI91346213462epcas2p1n;
	Mon, 14 Jul 2025 08:17:39 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bgZtp57PYz2SSKy; Mon, 14 Jul
	2025 08:17:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250714081738epcas2p224d4cc8d164531794da6ce8dfe668ffc~SEDzGQRXB1610116101epcas2p2C;
	Mon, 14 Jul 2025 08:17:38 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250714081738epsmtip207db5f8791a72e34b9535829bb5af1b7~SEDzC9ZwS1814318143epsmtip2Q;
	Mon, 14 Jul 2025 08:17:38 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <alim.akhtar@samsung.com>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <422fc81c-81d7-4473-92b6-9d112e6e247a@kernel.org>
Subject: RE: [PATCH v3 RESEND 3/5] watchdog: s3c2410_wdt: Increase max
 timeout value of watchdog
Date: Mon, 14 Jul 2025 17:17:37 +0900
Message-ID: <001c01dbf497$c2b0b040$481210c0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgF6s7ZMAnq+8xsBNs3P4bO2+lkg
Content-Language: ko
X-CMS-MailID: 20250714081738epcas2p224d4cc8d164531794da6ce8dfe668ffc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055858epcas2p47b849c0141fdb556288333f7abe00372
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055858epcas2p47b849c0141fdb556288333f7abe00372@epcas2p4.samsung.com>
	<20250714055440.3138135-4-sw617.shin@samsung.com>
	<422fc81c-81d7-4473-92b6-9d112e6e247a@kernel.org>

On Mon, 14 Jul 2025 08:04:47 +0200, Krzysztof Kozlowski wrote:
> I claim that this patch fixes nothing, because there is no user of
> QUIRK_HAS_32BIT_MAXCNT.

Dear Krzysztof,

Thank you for your review.
Are you suggesting that we combine the patches labeled as =5Bv3 3/5=5D and =
=5Bv3 4/5=5D into one?

Best regards,
Sangwook Shin


