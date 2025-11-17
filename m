Return-Path: <linux-watchdog+bounces-4603-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F1C6360E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 10:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 935A84EB7AA
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Nov 2025 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDDE30ACE3;
	Mon, 17 Nov 2025 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="UW4ruWy0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CD28506C
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Nov 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373113; cv=none; b=XbX2ew52l4ih/uXIvo8QEWCY+nPi4G1CPliZ+R6kWly35MLYgAZ+ZfTq6zom+zt+55RIlA/u1qwhm5qxYCqU+ZJprMEPwyW//vV8SCvddTW960cczGnxPq0t9x8IeRzysrUYFBApGH4P34vk1BLYz3bzVot7hdv5fl81HGuKcbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373113; c=relaxed/simple;
	bh=fPDsI8TCFZROWUKsui41ul3qMLBB2XlG3YdJoG0H9d8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SK3pMx0pdY6qNdQcDFi0uaDGFlCqURv157+F3i9m5R1Ea/a1OS91j1X0Yg93NlftI5SWketuxPqfP/tGBcsQJ70Il5Bm2ghUPLqRmpkVOjeRd+OvOJMM88ckpDGxOlbpSKUUMwT6MxGHks206ru52TyfbVaD+WltgpAI+YT5rJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=UW4ruWy0; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JiGzCjDWVuPRsqqGvN1m+D1XrRO81A8V467LEGfYCpw=; b=UW4ruWy0UrKd31rIfyi15jEA2H
	hC7Gsfn+iKwpcSMCs2d+jefkfmgaHT0o79aTJQRv3cmdGSVGfHRd1Zd4okNDr/hiLO1rv7MvkrTf/
	HqE3icba+l/7vGQO7K9vT5P+nkK9kr+OhyRqzkBruEpLicgFrM+IqHSuXs0YrxMKz/FYR14n4Eo0+
	7NFZone52W5pj77N/cOR0BKnNvAqm2UgRc83snO5/N6nLvjcOw3WbRRNnPQAWH9RWZD7twXc1Fc1G
	xoLOUs6tYFgNEE08/rzPvXBpW6BESHcZLLUsBIB2pvTT+12BPWO1IF8DGpC1qvsavYiCo5y8yIviO
	TnPqsCLQ==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v3] fix it87_wdt early reboot w/ FW started timer
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <bda0bda0-8e7e-4dd1-8726-30685496e187@roeck-us.net>
Date: Mon, 17 Nov 2025 10:51:44 +0100
Cc: wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <19D0E35F-F928-4372-9328-E571995A99CD@exactco.de>
References: <20251116.145908.308086523429052446.rene@exactcode.com>
 <72606213-bce4-4807-8c04-5dc4221975cd@roeck-us.net>
 <20251116.210920.587481738814327702.rene@exactco.de>
 <bda0bda0-8e7e-4dd1-8726-30685496e187@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

Good morning,

> On 17. Nov 2025, at 01:16, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On 11/16/25 12:09, Ren=C3=A9 Rebe wrote:
>> Some products, such as the Ugreen DXP4800 Plus NAS, ship with the =
it87
>> wdt enabled by the firmware and a broken BIOS option that does not
>> allow to change the default time or turn it off. This makes =
installing
>=20
> Again, "and a broken BIOS option that does not allow to change the =
default
> time or turn it off" is secondary. The key is that the BIOS/firmware =
may have
> enabled the watchdog.

You previously only did not believe me it has a broken BIOS option, you =
did
not yet articulate the information is not relevant. Many patches carry a =
Why?
motivation, and at least for me it is relevant why we even bothered with =
this.

>> Linux difficult and annoyingly rebooting early in an installer; =
unless
>> one loads and starts a watchdogd in the installer environment.
> Also again, please drop irrelevant information (how to work around the
> problem without this patch is irrelevant) and provide a more neutral
> description. Add as much additional details after "---" if you like.

I don=E2=80=99t recall you mentioning that before, but your level not =
nitpicking
here about context and hints is honestly rather strange to me.

>> Change it87_wdt to report a running timer to the watchdog core using
>> the user supplied or module's default time so it is reset before
>> triggering.
>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>> v1:
>> - just clear hw timer register
>> v2:
>> - detect running hw timer and report to watchdog core
>> v3:
>> - multiply TOV1 in _wdt_get_timeout
>> - don't wrongly and superfluously set .max_hw_heartbeat_ms
>> - don't call set_timeout manually
>> --- linux-6.17/drivers/watchdog/it87_wdt.c.orig 2025-09-28 =
23:39:22.000000000 +0200
>> +++ linux-6.17/drivers/watchdog/it87_wdt.c 2025-11-16 =
20:05:01.650672740 +0100
>> @@ -188,6 +190,21 @@
>>   superio_outb(t >> 8, WDTVALMSB);
>>  }
>>  +/* Internal function, should be called after superio_select(GPIO) =
*/
>> +static unsigned int _wdt_get_timeout(void)
>> +{
>> + unsigned int t;
>> + u8 cfg;
>> +
>> + cfg =3D superio_inb(WDTCFG);
>> + t =3D superio_inb(WDTVALLSB);
>> + if (max_units > 255)
>> + t |=3D superio_inb(WDTVALMSB) << 8;
>> + if (cfg & WDT_TOV1)
>> + t *=3D 60;
>> + return t;
>=20
> Given the context, this can be simplified to something like
>=20
> static bool _wdt_running(void)
> {
> return !!(superio_inb(WDTVALLSB) || max_units > 255 && =
superio_inb(WDTVALMSB));
> }
>=20
> [ where the !! isn't really necessary ]

Pity you suggest that change now after making me return the actual time =
multiplied
by the 60s config bit initially. But more than happy to change. Saves =
some ~28 clock
cycles on my i386 ;-)

>> +}
>> +
>>  static int wdt_update_timeout(unsigned int t)
>>  {
>>   int ret;
>> @@ -292,6 +309,7 @@
>>   u8 ctrl;
>>   int quirks =3D 0;
>>   int rc;
>> + unsigned int _timeout;
>>     rc =3D superio_enter();
>>   if (rc)
>> @@ -374,8 +392,6 @@
>>   }
>>   }
>>  - superio_exit();
>> -
>>   if (timeout < 1 || timeout > max_units * 60) {
>>   timeout =3D DEFAULT_TIMEOUT;
>>   pr_warn("Timeout value out of range, use default %d sec\n",
>> @@ -388,6 +404,15 @@
>>   wdt_dev.timeout =3D timeout;
>>   wdt_dev.max_timeout =3D max_units * 60;
>>  + /* wdt already left running by fw bios? */
>> + _timeout =3D _wdt_get_timeout();
>> + if (_timeout) {
>=20
> if (_wdt_running()) {
> }
>=20
> and the code can be moved ahead of the superio_exit() call above,
> avoiding the need to move it.

Yes, indeed, I only moved it down as originally we needed the configured =
timeout
to pass it to your initially suggested max_hw_heartbeat_ms, too. Will =
move it up
and send v4.

Best
	Ren=C3=A9

>> + pr_info("Left running by firmware.\n");
>> + set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
>> + }
>> +
>> + superio_exit();
>> +
>>   watchdog_stop_on_reboot(&wdt_dev);
>>   rc =3D watchdog_register_device(&wdt_dev);
>>   if (rc)
>=20

--=20
https://exactco.de - https://t2linux.com - https://rene.rebe.de


