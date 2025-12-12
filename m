Return-Path: <linux-watchdog+bounces-4691-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711ACB9FB8
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 23:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1519030AC66F
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 22:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75252D9EE6;
	Fri, 12 Dec 2025 22:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="wL3a8jxx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C32DC765
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579500; cv=none; b=Gba1WTwsG4LSMEBggEI0+SWfbfBgGoaTaA0djahY4XNasXW4NVfB6DE4FhpHjiBq+KBCCDlR+XhjA2xpIZ1xVLlJ4rHMKhcg05W5guC0Vk7vcOS9gu5Q/29hAfkd/NvgIFfxrfemRCyxL0qh20ZylLRDa03DP4kEXFbOmv2Bfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579500; c=relaxed/simple;
	bh=lVvPCoZu1VXJmKcAMO7Z24qJnMq/TcAqRepEkPe8Gtg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V/KrEkA03nF2wL8HZq4jHA3XWNk+jUcMhddGprw6KxT1tnhQFva5zgbdRii4CUuJ/jVC38TArIcbqAT5I3ZZwacC/djz5mi8FYh7jjf5u2HcE5eofaEPyOtyZVNw/tX765Mi0op4T6H0MOTMg5PHu3E5IXqMEHXGHu8AhgALv70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=wL3a8jxx; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qhMQ2yD0gTc4Ok9u6I9+yH4bdFzu0NWcEgcyIDNfzoc=; b=wL3a8jxxWZnvI8GVo3EGjQuvi8
	pPJGpEbd5fvD/75gXozBhNAFzUJhfzx9bnfY6rWCQ+2P+6UWHAPY3MKs1PRRsWcMnCgaxAk0AKG/T
	rWnHjOu9E4yQ02qZRrRd1sN20EFDFBVW64FzXAPt3sFEc7Xit6hj5l9veUXW5QRj6qW422x/whXuM
	wjIWROO3qtTTDcuRde9nK4GN3l4b6ERrHHv4ePN8+8xambZDEQcyGXKgC75ds7JGlSRQQ0YLlyNf4
	6GdgKScQg3N5BAZz84NDyAcNNUSpBixV7oDKZPWv91Ae51koIb9CyprnOo+doR3Y/xazT+wDTzjTX
	i1VLPvww==;
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
In-Reply-To: <CADvTj4qWfq4OgGfYECuepazbwNWWhtH7qy6cAzCYeFKYDFGt-w@mail.gmail.com>
Date: Fri, 12 Dec 2025 23:44:55 +0100
Cc: Guenter Roeck <linux@roeck-us.net>,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D6B291A1-0657-4DA6-A7F8-40C19AB9064D@exactco.de>
References: <20251117.131124.1452225967649047223.rene@exactco.de>
 <CADvTj4po1bx6AVfGKoxF38pzKURxryC17Up5Z7Ne+P5XBMZFmQ@mail.gmail.com>
 <b828fd88-5efa-4916-a781-17df6bd100a2@roeck-us.net>
 <CADvTj4okwTFALbEWtYKju2Q7MRFJOwRk4PEC77w9+Pk9nRBtzQ@mail.gmail.com>
 <DE34C809-E782-485E-AE17-62D5EB08F4E3@exactco.de>
 <CADvTj4oz6gA3Z1dxHok1Q31x1ziaERS04G4_gwBmZrVwrM59Xw@mail.gmail.com>
 <65A6FF07-20ED-45DB-BA3E-458662B93EA3@exactco.de>
 <CADvTj4qWfq4OgGfYECuepazbwNWWhtH7qy6cAzCYeFKYDFGt-w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)


> On 12. Dec 2025, at 23:41, James Hilliard <james.hilliard1@gmail.com> =
wrote:
>=20
> On Fri, Dec 12, 2025 at 3:34=E2=80=AFPM Ren=C3=A9 Rebe =
<rene@exactco.de> wrote:
>>=20
>>> On 12. Dec 2025, at 23:28, James Hilliard =
<james.hilliard1@gmail.com> wrote:
>>>=20
>>> On Fri, Dec 12, 2025 at 3:16=E2=80=AFPM Ren=C3=A9 Rebe =
<rene@exactco.de> wrote:
>>>>=20
>>>>=20
>>>>> On 12. Dec 2025, at 23:04, James Hilliard =
<james.hilliard1@gmail.com> wrote:
>>>>>=20
>>>>> On Fri, Dec 12, 2025 at 2:50=E2=80=AFPM Guenter Roeck =
<linux@roeck-us.net> wrote:
>>>>>>=20
>>>>>> On 12/12/25 12:17, James Hilliard wrote:
>>>>>> ...
>>>>>>>  +       /* wdt already left running by firmware? */
>>>>>>>  +       if (_wdt_running()) {
>>>>>>>  +               pr_info("Left running by firmware.\n");
>>>>>>>=20
>>>>>>>=20
>>>>>>> I'm wondering, is there a way other than looking at dmesg to =
identify if
>>>>>>> a wdt was left running by the firmware? I'm thinking having an =
ioctl or
>>>>>>> similar could be useful as a way to notify a user that a BIOS or =
firmware
>>>>>>> configuration change may be needed.
>>>>>>>=20
>>>>>>=20
>>>>>> This is not a bug, so there is no need to notify the user in the =
first place.
>>>>>> The only reason for accepting the message is that I was tired =
arguing.
>>>>>> It is even misleading, because loading the driver, starting the =
watchdog
>>>>>> by touching the watchdog device, unloading it, and loading it =
again will
>>>>>> likely trigger the message.
>>>>>=20
>>>>> Yeah, I'm aware it's not a bug, I'm just thinking it might be good =
to have
>>>>> watchdog drivers record the initial running state.
>>>>=20
>>>> The kernel logs so much pointless random stuff; an info about a
>>>> running watchdog timer is more than warranted in this case IMHO.
>>>> It wasted quite a bit of my valuable time.
>>>>=20
>>>>>> Userspace can check if a watchdog is running by reading
>>>>>> /sys/class/watchdog/watchdog<index>/state. Do that after loading =
the driver
>>>>>> and before starting the watchdog daemon and you'll see if the =
watchdog
>>>>>> was running when the driver was loaded. But that doesn't mean it =
was
>>>>>> running when the system booted; it only means that the watchdog =
was running
>>>>>> when the driver was loaded.
>>>>>=20
>>>>> Hmm, this seems impossible in some configurations, AFAIU systemd's
>>>>> watchdog is integrated into PID 1, so loading a watchdog daemon =
later
>>>>> doesn't appear possible.
>>>>>=20
>>>>> Maybe it would make sense to have a sysfs variable like
>>>>> /sys/class/watchdog/watchdog<index>/initial_state so that
>>>>> there's a way for userspace to determine if a watchdog was
>>>>> already armed by the time the driver was loaded?
>>>>=20
>>>> This would be quite wasteful overkill for something that =
unimportant.
>>>> It is rare that firmware leaves a watchdog timer enabled in any =
case.
>>>=20
>>> I think your presumption that a watchdog is unimportant is wrong,
>>> in my case I want to identify systems and send alerts if it's =
detected
>>> that a watchdog was NOT armed by the firmware.
>>>=20
>>> I manage a bunch of x86_64 based embedded systems and
>>> we always want the watchdog enabled, including in the BIOS,
>>> however unlike on your system the watchdogs on my systems are
>>> disabled by default and must be manually configured in the BIOS.
>>> We do still arm them from Linux either way but it would be nice
>>> to warn users that their systems have bad BIOS settings, on the
>>> systems I work with failing to arm the watchdog in both the BIOS
>>> and Linux can result in the watchdog failing to fire when we need
>>> it to under some circumstances(we're not sure exactly why this
>>> happens but failing to arm the watchdog in the BIOS can result
>>> in the watchdog not always firing if the system freezes during a
>>> reboot from what we can tell, although it's difficult to reproduce
>>> this issue in our hardware testing lab).
>>=20
>> Instead of adding new kernel state, you could probably just read
>> the initial state as suggested by Guenter.
>=20
> As I mentioned earlier, I don't think we can read initial state since
> AFAIU systemd PID1 will immediately arm the watchdog prior
> to anything else running, so by the time we could read the state
> variable the watchdog would have already been armed so the
> state var would be meaningless in regards to determining if the
> firmware armed the watchdog.

You can either adjust systemd accordingly or add a /sbin/init
wrapper for systemd to check the state before executing init.

With the added benefit of working with older kernels.

	Ren=C3=A9

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


