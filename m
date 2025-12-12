Return-Path: <linux-watchdog+bounces-4689-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6BCB9F40
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A45403008EB5
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C045D254AE1;
	Fri, 12 Dec 2025 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="JhyyNkDI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017FA26F2BC
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578889; cv=none; b=NUASWuo4l09wyQVbItPSu1p/G6Dtp6Bp+KjD6NVTuJPSPCYcOQViv3PJ0aTooerkfB/yqQ1CEcBeS/9O0yuGyg46zoH+k6v68/MHu0NgliSzZQ1+JFVHpbpYBE0efCdkSm5zzzacYH67v4eTRkg3+zWCl9EBzF2xDy2gk5GdgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578889; c=relaxed/simple;
	bh=vJ+ny7m9HTJbTvRgGM91LBSlUzqvnrYk3nGEzJnEQfs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DeGG6RUXO8JTDBLL7hE6liTqVxETl/fCtLap0DUAKmdwF87BRGAHY5viU6dC4o2Ojim/QgLchSivIE6LB/wFaibct25EOH1BuQSQ5hnmiDvcLekZzXxm5z8H+48p89KvR2COOYl3vSgm2hm2SZ7+uHQL4E+58PECmph1bYuzM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=JhyyNkDI; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ewv/PlRXIV94KBHb6A9RE6bYKUdehxbKpCat/rkeomg=; b=JhyyNkDIFokisO4ZJXIaKW98n1
	IkauoFRhqDSgpGCCBQULLn2zw436n05L1e45izXcHxST+R1tZbHDUmekikVhCEV4GcizQ3vmTuhjo
	dIgW7zeWKp9igC5qxkaydfojWC61igZvdn0I1UMY0sKnTlguBo7FALmXiE85BbnfUJ6haZ7DZlP9+
	TgEVk3iUvuBKUPwKai9PMSLLKWLaTtba5rujrNe22nbMCJP2E+38uC6t3wfAiUC6hL4UrS0nEw5AI
	6uE//1GsusHkpmYDHfavr8Ymkf952MoIBh3IW6fDc6P3PoBWzV+6YSfO0UZJ85xWuBBSZpqKJVmvu
	GrLehpfQ==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
Date: Fri, 12 Dec 2025 23:34:43 +0100
Cc: Guenter Roeck <linux@roeck-us.net>,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de>
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
 <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
 <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
 <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

> On 12. Dec 2025, at 23:28, James Hilliard <james.hilliard1@gmail.com> =
wrote:
>=20
> On Fri, Dec 12, 2025 at 3:16=E2=80=AFPM Ren=C3=A9 Rebe =
<rene@exactco.de> wrote:
>>=20
>>=20
>>> On 12. Dec 2025, at 23:04, James Hilliard =
<james.hilliard1@gmail.com> wrote:
>>>=20
>>> On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck =
<linux@roeck-us.net> wrote:
>>>>=20
>>>> On 12/12/25 12:17, James Hilliard wrote:
>>>> ...
>>>>>   +       /* wdt already left running by firmware? */
>>>>>   +       if (_wdt_running()) {
>>>>>   +               pr_info("Left running by firmware.\n");
>>>>>=20
>>>>>=20
>>>>> I'm wondering, is there a way other than looking at dmesg to =
identify if
>>>>> a wdt was left running by the firmware? I'm thinking having an =
ioctl or
>>>>> similar could be useful as a way to notify a user that a BIOS or =
firmware
>>>>> configuration change may be needed.
>>>>>=20
>>>>=20
>>>> This is not a bug, so there is no need to notify the user in the =
first place.
>>>> The only reason for accepting the message is that I was tired =
arguing.
>>>> It is even misleading, because loading the driver, starting the =
watchdog
>>>> by touching the watchdog device, unloading it, and loading it again =
will
>>>> likely trigger the message.
>>>=20
>>> Yeah, I'm aware it's not a bug, I'm just thinking it might be good =
to have
>>> watchdog drivers record the initial running state.
>>=20
>> The kernel logs so much pointless random stuff; an info about a
>> running watchdog timer is more than warranted in this case IMHO.
>> It wasted quite a bit of my valuable time.
>>=20
>>>> Userspace can check if a watchdog is running by reading
>>>> /sys/class/watchdog/watchdog<index>/state. Do that after loading =
the driver
>>>> and before starting the watchdog daemon and you'll see if the =
watchdog
>>>> was running when the driver was loaded. But that doesn't mean it =
was
>>>> running when the system booted; it only means that the watchdog was =
running
>>>> when the driver was loaded.
>>>=20
>>> Hmm, this seems impossible in some configurations, AFAIU systemd's
>>> watchdog is integrated into PID 1, so loading a watchdog daemon =
later
>>> doesn't appear possible.
>>>=20
>>> Maybe it would make sense to have a sysfs variable like
>>> /sys/class/watchdog/watchdog<index>/initial_state so that
>>> there's a way for userspace to determine if a watchdog was
>>> already armed by the time the driver was loaded?
>>=20
>> This would be quite wasteful overkill for something that unimportant.
>> It is rare that firmware leaves a watchdog timer enabled in any case.
>=20
> I think your presumption that a watchdog is unimportant is wrong,
> in my case I want to identify systems and send alerts if it's detected
> that a watchdog was NOT armed by the firmware.
>=20
> I manage a bunch of x86_64 based embedded systems and
> we always want the watchdog enabled, including in the BIOS,
> however unlike on your system the watchdogs on my systems are
> disabled by default and must be manually configured in the BIOS.
> We do still arm them from Linux either way but it would be nice
> to warn users that their systems have bad BIOS settings, on the
> systems I work with failing to arm the watchdog in both the BIOS
> and Linux can result in the watchdog failing to fire when we need
> it to under some circumstances(we're not sure exactly why this
> happens but failing to arm the watchdog in the BIOS can result
> in the watchdog not always firing if the system freezes during a
> reboot from what we can tell, although it's difficult to reproduce
> this issue in our hardware testing lab).

Instead of adding new kernel state, you could probably just read
the initial state as suggested by Guenter.

	Ren=C3=A9

>>=20
>>        Ren=C3=A9
>>=20
>> --
>> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe
>>=20

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


