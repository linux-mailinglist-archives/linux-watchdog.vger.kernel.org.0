Return-Path: <linux-watchdog+bounces-2796-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F03A1D3CC
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 10:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A91165616
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Jan 2025 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E41F1FDA9C;
	Mon, 27 Jan 2025 09:45:01 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D31FDA63;
	Mon, 27 Jan 2025 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971101; cv=none; b=pEjc3gJiFhmOrZiEqoadpMjM/o0LjAC1hwQCOgTX74gfC/G0d36EOM5f8v9VwYmFBkkqeobJZILN5Mkzhu2QqpCojPo5aCuj8X75mNWJVYpk7oQuQeNw2BJ1eRGUFUqVCxwsKuyp+KKfQ6E8UPrqODRACLslkGcYwa/LtjLZpa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971101; c=relaxed/simple;
	bh=4xWljYUxMNE1AYxRbJL46EyrYgndypFdacnb2A1/f5E=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d1f16vz+xztF9n9fTi+23HV22JAGfYmaVgBYe1k1DJVIg06wqNMCAHzkeX5UX2RufF4lxLhBHRKZvdkd9uh5sTgIAAPFayba7falAEoNLHb+QrcGZ35I4ULAiO+i9kwH+2tbqn0ZkMOrFzZmN05Q1xr6YjWRj7I97ExXTXmUjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YhNj5553Sz1V5f2;
	Mon, 27 Jan 2025 17:41:29 +0800 (CST)
Received: from kwepemk200004.china.huawei.com (unknown [7.202.194.70])
	by mail.maildlp.com (Postfix) with ESMTPS id C65801402CB;
	Mon, 27 Jan 2025 17:44:55 +0800 (CST)
Received: from kwepemk100005.china.huawei.com (7.202.194.53) by
 kwepemk200004.china.huawei.com (7.202.194.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 27 Jan 2025 17:44:55 +0800
Received: from kwepemk100005.china.huawei.com ([7.202.194.53]) by
 kwepemk100005.china.huawei.com ([7.202.194.53]) with mapi id 15.02.1544.011;
 Mon, 27 Jan 2025 17:44:55 +0800
From: "liuchao (CR)" <liuchao173@huawei.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: caihe <caihe@huawei.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "liuchao (CR)" <liuchao173@huawei.com>,
	lixiaokeng <lixiaokeng@huawei.com>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>
Subject: Re: [PATCH] watchdog: only print critical log when the watchdog fails
 to be stopped
Thread-Topic: Re: [PATCH] watchdog: only print critical log when the watchdog
 fails to be stopped
Thread-Index: Adtwn8wqWNX0k++8Q4G2qo1rZ35Bww==
Date: Mon, 27 Jan 2025 09:44:55 +0000
Message-ID: <f703a1e24583494eb813867c8d25e311@huawei.com>
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

On 1/26/25 21:10, Guenter Roeck wrote:
> On 1/26/25 00:38, Liu Chao wrote:
> > Every time the user echoes 0 > /dev/watchdog0, meaningless critical=20
> > log is printed.
> >
>=20
> It is not meaningless, and it will still be displayed after this=20
> change, making the change pointless.

The change is not pointless. For example, the softdog driver does not invok=
e
watchdog_stop or print logs in the watchdog_release.

Liu Chao

>=20
> Guenter
>=20
> > Signed-off-by: Liu Chao <liuchao173@huawei.com>
> > ---
> >   drivers/watchdog/watchdog_dev.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/watchdog/watchdog_dev.c=20
> > b/drivers/watchdog/watchdog_dev.c index e2bd266b1b5b..0a9d5e6f3a88
> > 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -960,14 +960,15 @@ static int watchdog_release(struct inode=20
> > *inode,
> struct file *file)
> >   	if (!watchdog_active(wdd))
> >   		err =3D 0;
> >   	else if (test_and_clear_bit(_WDOG_ALLOW_RELEASE,
> &wd_data->status) ||
> > -		 !(wdd->info->options & WDIOF_MAGICCLOSE))
> > +		 !(wdd->info->options & WDIOF_MAGICCLOSE)) {
> >   		err =3D watchdog_stop(wdd);
> > +		if (err < 0)
> > +			pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
> > +	}
> >
> >   	/* If the watchdog was not stopped, send a keepalive ping */
> > -	if (err < 0) {
> > -		pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
> > +	if (err < 0)
> >   		watchdog_ping(wdd);
> > -	}
> >
> >   	watchdog_update_worker(wdd);
> >

