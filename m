Return-Path: <linux-watchdog+bounces-2831-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88FA28188
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 03:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314771886D87
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 02:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8944820DD47;
	Wed,  5 Feb 2025 02:02:58 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB0157A48;
	Wed,  5 Feb 2025 02:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720978; cv=none; b=tdWvtihNOr0nKcg5CBV42vehjg0CxiK4S1GVPDGSQRfFLRa7gap6zqft9CcTGA3IvgmUfz/4jKSUUe0NYAULT4KoVA93EurHhQIJ//E3xF7HdK7QcC3j1Riijj98fk/crIkAo+vi6YrhpOQ7sWO1FWEj5B422LUcj/2U/F7BGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720978; c=relaxed/simple;
	bh=CNjspU3sLM3zxgThEBLdBjce+XBekEQZc+Iy1foYQU0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ksyYowXYhKNV50tGzQLLtQAXrAh2mkhTWvQp7LRg+TaUPpgfMjLGYQ/AM8Q+YSECqygLHMrZiuytAITV7mlehTQW+dpwBsbUaten3sLEASxJ/5XnZ1W/PAQ83U4ROjj3+t8/Ymg/lJFVyX1aZokFAeEec8z9iqDErIyh0AWjPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ynk1Z45q7z2Fcsf;
	Wed,  5 Feb 2025 09:59:14 +0800 (CST)
Received: from kwepemk500010.china.huawei.com (unknown [7.202.194.95])
	by mail.maildlp.com (Postfix) with ESMTPS id 15B631A0188;
	Wed,  5 Feb 2025 10:02:51 +0800 (CST)
Received: from kwepemk100005.china.huawei.com (7.202.194.53) by
 kwepemk500010.china.huawei.com (7.202.194.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Feb 2025 10:02:50 +0800
Received: from kwepemk100005.china.huawei.com ([7.202.194.53]) by
 kwepemk100005.china.huawei.com ([7.202.194.53]) with mapi id 15.02.1544.011;
 Wed, 5 Feb 2025 10:02:50 +0800
From: "liuchao (CR)" <liuchao173@huawei.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: caihe <caihe@huawei.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, lixiaokeng <lixiaokeng@huawei.com>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
Thread-Topic: Re: [PATCH] watchdog: only print critical log when the watchdog
 fails to be stopped
Thread-Index: Adt3cFQzWu7BSwGARris56ShIulQsA==
Date: Wed, 5 Feb 2025 02:02:50 +0000
Message-ID: <13073a1dfb7946af98565921c609bd6f@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 1/27/2025 22:30, Guenter Roeck wrote:
> On 1/27/25 01:35, liuchao (CR) wrote:
> > On 1/26/25 21:10, Guenter Roeck wrote:
> >> On 1/26/25 00:38, Liu Chao wrote:
> >>> Every time the user echoes 0 > /dev/watchdog0, meaningless critical
> >>> log is printed.
> >>>
> >>
> >> It is not meaningless, and it will still be displayed after this
> >> change, making the change pointless.
> >
> > The change is not pointless. For example, the softdog driver does not
> > invoke watchdog_stop or print logs in the watchdog_release.
> >
>=20
> It seems to me that is a problem in the softdog driver.
>=20
> The change is actually worse than I initially thought.
> The message is _supposed_ to be displayed if watchdog_stop() is not calle=
d while
> the watchdog is running (i.e., if err =3D=3D -EBUSY).
> Otherwise it would not be displayed for real hardware watchdogs which are=
 not
> stopped because they were running and watchdog_stop() is not called becau=
se
> WDIOF_MAGICCLOSE is set in the driver and the magic release byte was not
> written.
>=20
> Specifically, the softdog driver has WDIOF_MAGICCLOSE set. It is not supp=
osed
> to be unloadable (or unloaded) while the watchdog is running.

When echo to /dev/watchdog0, The watchdog_open, watchdog_write, and
watchdog_release functions are invoked in sequence. Do you mean the softdog
driver should not call watchdog_release?

After the user opens /dev/watchdog0, the user feeds the watchdog through io=
ctl
WDIOC_KEEPALIVE and never closes. Is this the correct usage?

>=20
> Guenter


