Return-Path: <linux-watchdog+bounces-2833-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6AA282D7
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 04:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F7047A1E65
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 03:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA302135A3;
	Wed,  5 Feb 2025 03:31:32 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F86213257;
	Wed,  5 Feb 2025 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738726292; cv=none; b=Vh0oIynsaj7WPdm45ggSRP/h6RJ2m7GBy0+Rnq6+GAvyzFE6tC9HSKAbehunev0qcfjO5QCH7xYhBPyk6Izuu4/dWjBa48Qy/23JTTQTN4XScwwwtjWu8ld7zpXjNzpZy4eDsFHk3JjLLZQwqHjvt65vQqb3w6/a1VFPmc2DGNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738726292; c=relaxed/simple;
	bh=urAiWcI+unnf4eqWdfgetoTmXP/X1whvl5UXZGvQbhA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OKn21AzERAfc6gj4pEPDiXI6LSSrLIyQF0qbgoqgIJkjEXLy+cZNrbUHO7MttvYPBllJFxSStAoTD6gf8rvbyMYNsr4oKlF1RcnTzfUWNYUi22ooVaJe5k59PvSSfZWe2sDZyv1UWSz7YVv8RywrxHih2wT2ADnqMEyjS4sOG9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ynlhh5HGSz20nLm;
	Wed,  5 Feb 2025 11:14:44 +0800 (CST)
Received: from kwepemk100010.china.huawei.com (unknown [7.202.194.58])
	by mail.maildlp.com (Postfix) with ESMTPS id B70AA1401F2;
	Wed,  5 Feb 2025 11:14:16 +0800 (CST)
Received: from kwepemk100005.china.huawei.com (7.202.194.53) by
 kwepemk100010.china.huawei.com (7.202.194.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Feb 2025 11:14:16 +0800
Received: from kwepemk100005.china.huawei.com ([7.202.194.53]) by
 kwepemk100005.china.huawei.com ([7.202.194.53]) with mapi id 15.02.1544.011;
 Wed, 5 Feb 2025 11:14:13 +0800
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
Thread-Index: Adt3eoD6Tk0WevgDTROHhRBW5boicg==
Date: Wed, 5 Feb 2025 03:14:13 +0000
Message-ID: <a59651b1a53c4362b0416a3252d9c750@huawei.com>
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

On 2/3/2025 18:35, Guenter Roeck wrote:
> On 2/4/25 18:02, liuchao (CR) wrote:
> > On 1/27/2025 22:30, Guenter Roeck wrote:
> >> On 1/27/25 01:35, liuchao (CR) wrote:
> >>> On 1/26/25 21:10, Guenter Roeck wrote:
> >>>> On 1/26/25 00:38, Liu Chao wrote:
> >>>>> Every time the user echoes 0 > /dev/watchdog0, meaningless
> >>>>> critical log is printed.
> >>>>>
> >>>>
> >>>> It is not meaningless, and it will still be displayed after this
> >>>> change, making the change pointless.
> >>>
> >>> The change is not pointless. For example, the softdog driver does
> >>> not invoke watchdog_stop or print logs in the watchdog_release.
> >>>
> >>
> >> It seems to me that is a problem in the softdog driver.
> >>
> >> The change is actually worse than I initially thought.
> >> The message is _supposed_ to be displayed if watchdog_stop() is not
> >> called while the watchdog is running (i.e., if err =3D=3D -EBUSY).
> >> Otherwise it would not be displayed for real hardware watchdogs which
> >> are not stopped because they were running and watchdog_stop() is not
> >> called because WDIOF_MAGICCLOSE is set in the driver and the magic
> >> release byte was not written.
> >>
> >> Specifically, the softdog driver has WDIOF_MAGICCLOSE set. It is not
> >> supposed to be unloadable (or unloaded) while the watchdog is running.
> >
> > When echo to /dev/watchdog0, The watchdog_open, watchdog_write, and
> > watchdog_release functions are invoked in sequence. Do you mean the
> > softdog driver should not call watchdog_release?
> >
> > After the user opens /dev/watchdog0, the user feeds the watchdog
> > through ioctl WDIOC_KEEPALIVE and never closes. Is this the correct usa=
ge?
> >
>=20
> I tried softdog. It works as advertised. Yes, "echo 0 > watchdog0" trigge=
rs the
> message.
> "sudo modprobe -r softdog" then fails with
>=20
> 	modprobe: FATAL: Module softdog is in use.
>=20
> and, as expected, one minute later (or whatever the timeout is set to) th=
e
> system reboots.
>=20
> There is nothing wrong with the message. The softdog _does_ refuse to be
> unloaded while running, and it _does_ reboot the system after the timeout
> expired. This is all perfectly as expected. The log is not meaningless. I=
nstead, it
> tells the user that the system will reboot after the watchdog expired. Wh=
ich it
> does.

User creates a process and echoes every time to ensure that the system is
normal, the process can be executed properly. Otherwise, the system reboots=
.
So the critical message keeps printing.

Is it reasonable to change it to info level?

>=20
> Guenter


