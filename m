Return-Path: <linux-watchdog+bounces-4591-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FAEC5E9C0
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 18:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDAD24E28A4
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Nov 2025 17:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E356633EAF9;
	Fri, 14 Nov 2025 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="wJbfQAM+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831333CEB4
	for <linux-watchdog@vger.kernel.org>; Fri, 14 Nov 2025 17:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763141448; cv=none; b=NYnK9Gs1I1lspy9sSKZfHrmAi9oA4gVO5rEROP9rtfFKfg5+TE6c4TR+2wSWtQWfMm4ho2zaA6k1UTuAFy3VzmkQ+6oLBvXnpDyIbrWcYEcF+T0HPCompG0IlX9cRnFojBIcRzeut43VOqgvXgC/riYrjJMjEPgwyEb4+AWJaOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763141448; c=relaxed/simple;
	bh=2OLICC/+N2g9ue8f/rwQkU+b5KU76OXVptVVkNeVlNU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cCH5uo4QL0fYbKD+zq7akqxRL8bwDRRVoV3JMj+XrVXJeORVLU+ev2QUUD798e5iGgsTuBRW/wvjNbPqIJSQvN4KZFFY3FRwSuPI9THOJgOnTn2pI2BungoQyu9DGQmxvepUn/f12euLB8TFk6NdLLboT481aSIO/IOMW24xgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=wJbfQAM+; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b+0p+aC8eX090SNiKyFXOgQtfITWn4BJPvRlDuO2Z4k=; b=wJbfQAM+uzH9lrxMM9UEPrE85C
	HrIZGnwNCyNrZmEAJ8c6mHQ9TUw5nHcg/Svj1dGHC8UyTy+67kLO1F+cJ99Rakj2DRLckh3ivhYKY
	VK1Dr72N40fLNa8Minjp/P2TGY4atTXcIj5aUFdArMT61gc6IMFN6g+bJWYW753iY3PNKvzrAi7Ap
	kY2K00jgkJ8vHUVqMW03uwpJj6q2DHRnXUUVPweGQ9h9m05xpDWLy85tci2ZunmeinvBjK1UzSby3
	z9xLJg7vQv24Nw2kEGrL2svpwiitNph7p4hkCtwdiekMPmreJ36dXIwjmcmxLdQE3bSunmkJh5RdQ
	EJIDY3gg==;
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] init it87_wdt to prevert early reboot
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <0d406a59-ea24-43a0-bf2d-5f53ef8450a3@roeck-us.net>
Date: Fri, 14 Nov 2025 18:30:42 +0100
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC92E78A-64C6-4FA0-9E45-AE66B40A7155@exactco.de>
References: <20251114.163911.1677511234058361014.rene@exactco.de>
 <0d406a59-ea24-43a0-bf2d-5f53ef8450a3@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

Hi,

> On 14. Nov 2025, at 18:25, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On 11/14/25 07:39, Ren=C3=A9 Rebe wrote:
>> Some products, such as the Ugreen dxp4800 plus NAS, ship with the =
it87
>> wdt enabled by the firmware and a broken BIOS option that does not
>> allow to change the defautl time or turn it off. This makes =
installing
>> Linux difficult and annoying instantly rebooting early in an
>> installer; unless one loads and starts a watchdogd in the installer
>> environment.
>> Change it87_wdt to initialize the hw wdt register to 0 to make sure =
it
>> is disabled until it is actually requested to be used.
>=20
> Wrong solution. The driver should set .max_hw_heartbeat_ms and, if the
> watchdog is running, mark it as running by setting WDOG_HW_RUNNING.

Just to clarify, your proposal is supposed to solves the BIOS already =
enabling
the hw watchdog during boot and just initializing the linux it87_wdt =
with your
proposal would trigger setting it to 0 to disable it?

	Ren=C3=A9

> Guenter
>=20
>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>> --- a/drivers/watchdog/it87_wdt.c 2025-11-06 16:36:17.474866809 +0100
>> +++ b/drivers/watchdog/it87_wdt.c 2025-11-06 16:43:56.756190409 +0100
>> @@ -374,6 +374,9 @@
>>   }
>>   }
>>  + /* disable, might be left active by the fw, e.g. Ugreen dxp4800+ =
*/
>> + _wdt_update_timeout(0);
>> +
>>   superio_exit();
>>     if (timeout < 1 || timeout > max_units * 60) {
>> =20
>=20

--=20
https://exactco.de - https://t2linux.com - https://rene.rebe.de


