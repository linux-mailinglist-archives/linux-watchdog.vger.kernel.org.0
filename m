Return-Path: <linux-watchdog+bounces-4687-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEBFCB9E99
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E7D3087D7B
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881FB1DF26E;
	Fri, 12 Dec 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="XYKOJ37I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7101D5CC6
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577812; cv=none; b=dhIo/8gYrCpIIWC86tVU1U5e8Kvfl4MIMv7TParcHg9xOctNiGuxMsIR6tN29sj6YCx+dz9W6vc3vPH2PXloa7TXYmxkb8kng2izvppJSaLIHYgNkNukgqwzyz29tdqtM4LmC5NiZzh0ticFSkGGaosr80E+gLu6HsxEYgVPoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577812; c=relaxed/simple;
	bh=pbkk9hiwBYYA0dqMzMYxtmkh26+y5eYhYYlwZ60DSno=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gkMFd3/C0phKAXk9ZpLcUvMjcxCxjK0qXjXr2ZcoEwDMhhJN59Ojfve3sNN0xSQNdGxU40n2VPE837VcFsKqlKXAwJEvLZeDq+jkEbrvuA9lj6mNr2cmDwt94bNbTlno/ei4IEM2xJCRa/rW2U32TKz1h7rJGDH07H6AV2eGUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=XYKOJ37I; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dN0vG8hh/zIrQ5/khNRZY3JwU882xT2WmJ3a9EZKJjY=; b=XYKOJ37IAjJSkBPeY8OyG8uZHg
	YI6g5U/ctlv2q4tm4W3atjd5+KIOePjpcLUoAwGPAynro96elPNF+42OotkOSY4eaVXQDGeJQfCHY
	wtrXKGgQ2QeGo4/TB8HvWNnOVONusKXcuWH27VkDdIhy7ggdaKrgd+xcTfmwh80xfqWvU2m0oY0RT
	6qDEIYV4nMYtjm8boOKrm9rAH7OQZtQUBi+vE4Ftzy7bSlt1O0377RkilCtjWdsIMQMtbMxiZVKM9
	IU+QI0vxnTkZZCLzLrSmmvb/mSlEQ3zb1hYtbTUkvppK/Q8Hkufm+TQLbhdhKV1GRykA0jGZvZqRj
	FHe64UoQ==;
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
In-Reply-To: <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
Date: Fri, 12 Dec 2025 23:16:44 +0100
Cc: Guenter Roeck <linux@roeck-us.net>,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
 <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)


> On 12. Dec 2025, at 23:04, James Hilliard <james.hilliard1@gmail.com> =
wrote:
>=20
> On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck =
<linux@roeck-us.net> wrote:
>>=20
>> On 12/12/25 12:17, James Hilliard wrote:
>> ...
>>>    +       /* wdt already left running by firmware? */
>>>    +       if (_wdt_running()) {
>>>    +               pr_info("Left running by firmware.\n");
>>>=20
>>>=20
>>> I'm wondering, is there a way other than looking at dmesg to =
identify if
>>> a wdt was left running by the firmware? I'm thinking having an ioctl =
or
>>> similar could be useful as a way to notify a user that a BIOS or =
firmware
>>> configuration change may be needed.
>>>=20
>>=20
>> This is not a bug, so there is no need to notify the user in the =
first place.
>> The only reason for accepting the message is that I was tired =
arguing.
>> It is even misleading, because loading the driver, starting the =
watchdog
>> by touching the watchdog device, unloading it, and loading it again =
will
>> likely trigger the message.
>=20
> Yeah, I'm aware it's not a bug, I'm just thinking it might be good to =
have
> watchdog drivers record the initial running state.

The kernel logs so much pointless random stuff; an info about a
running watchdog timer is more than warranted in this case IMHO.
It wasted quite a bit of my valuable time.

>> Userspace can check if a watchdog is running by reading
>> /sys/class/watchdog/watchdog<index>/state. Do that after loading the =
driver
>> and before starting the watchdog daemon and you'll see if the =
watchdog
>> was running when the driver was loaded. But that doesn't mean it was
>> running when the system booted; it only means that the watchdog was =
running
>> when the driver was loaded.
>=20
> Hmm, this seems impossible in some configurations, AFAIU systemd's
> watchdog is integrated into PID 1, so loading a watchdog daemon later
> doesn't appear possible.
>=20
> Maybe it would make sense to have a sysfs variable like
> /sys/class/watchdog/watchdog<index>/initial_state so that
> there's a way for userspace to determine if a watchdog was
> already armed by the time the driver was loaded?

This would be quite wasteful overkill for something that unimportant.
It is rare that firmware leaves a watchdog timer enabled in any case.

	Ren=C3=A9

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


