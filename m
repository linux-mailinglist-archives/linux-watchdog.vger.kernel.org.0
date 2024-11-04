Return-Path: <linux-watchdog+bounces-2409-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55A9BA9A7
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 01:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9B61F2143E
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2024 00:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11F62594;
	Mon,  4 Nov 2024 00:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QqHI7rhE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57B800;
	Mon,  4 Nov 2024 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730678532; cv=none; b=F+Uc17Zg6CqQwL9JyZaOwjpIp29xWebepjZZDWfCCfyaRI+rU0wVzTM0B8YF4IxnfhEksSsiU2K/8VXQIEQmrnZ9thjIN4FolQ0HPnnU/YS9LCa55A6EyRyDixAbfn8P5rbHl+zvzmMiaIdz/PSO3ww1jcQ74jHkDyK90yfHVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730678532; c=relaxed/simple;
	bh=cm86/adYBO0QLMJTj80moqy+OSpgRV+dDfE8QASkuLs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BvN4pflApu7cGwmwvEhMb68LDKr5R4OyUkfeiK3G0VDY60NJvfvo/IGXXTj0npgyPqxc0sE25DEPUdorF8m1PKHU1mkCywi3HvqSH2UKn2+CadWpsE0T7rNSn5xCLlNDAx98XJg7gq7ijpEwmpiUTAFOWHm7VuQpUCKxrEumOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QqHI7rhE; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730678522;
	bh=cm86/adYBO0QLMJTj80moqy+OSpgRV+dDfE8QASkuLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QqHI7rhE5NLaRyprE6WKCAik4rWO9TXIZB8hGClSE0eoL/ZotGcXIg8mRB7oU/7xj
	 kKBFAqApO2jqrhOsUaShqbFNdA3JYCPpxtIMhAils8Zcc7L9C4C96eRKrPy1SbdkJX
	 W1euBcmLyVCXNvtuPlToaN7Oi6PgBIa1C8LloZyod9/W8EnmkJkuxNpptAXzgDWqhF
	 DMjeArBbGADfnVWfgqY1Qzf2FofpzPF1RyI1vnwpXbNYdtTRvjjiCqybuSd4Gqt9eG
	 AFwFi9LJRTSw7t/p3RcI3pZEfUUXKRiH3c25Q1/02Gy+kOAxnCREW3CKLmNoHikiHO
	 vVW9CrOl1jbxw==
Received: from [192.168.68.112] (ppp118-210-95-135.adl-adc-lon-bras32.tpg.internode.on.net [118.210.95.135])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EBC66A03A;
	Mon,  4 Nov 2024 08:01:56 +0800 (AWST)
Message-ID: <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, Chin-Ting Kuo
	 <chin-ting_kuo@aspeedtech.com>
Cc: joel@jms.id.au, wim@linux-watchdog.org, linux@roeck-us.net, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com, 
 DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
 chnguyen@amperecomputing.com
Date: Mon, 04 Nov 2024 10:31:55 +1030
In-Reply-To: <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-11-01 at 14:21 -0400, Patrick Williams wrote:
> On Fri, Nov 01, 2024 at 08:11:59PM +0800, Chin-Ting Kuo wrote:
> > The boot status mapping rule follows the latest design guide from
> > the OpenBMC shown as below.
> > https://github.com/openbmc/docs/blob/master/designs/bmc-reboot-cause-up=
date.md#proposed-design
> > - WDIOF_EXTERN1=C2=A0=C2=A0 =3D> system is reset by Software
> > - WDIOF_CARDRESET =3D> system is reset by WDT SoC reset
> > - Others=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> oth=
er reset events, e.g., power on reset.
>=20
> I'm quite surprised that the above is relevant for a kernel driver at
> all.=C2=A0 Isn't "EXTERN1" a name of a real watchdog signal from your
> hardware (my recollection is that there are 2 external watchdogs).

I think you may be referring to WDTRST1 (and WDTRST2) here.

WDIOF_EXTERN1 and WDIOF_EXTERN2 have an unrelated history:

https://github.com/torvalds/linux/blame/master/include/uapi/linux/watchdog.=
h

> =C2=A0 I
> think the point of this referenced design document was that most
> users
> of BMCs have "EXTERN1" used a for software reset conditions.
> `CARDRESET` should be representing resets by the watchdog itself.

I think this is what Chin-Ting is proposing for the Aspeed driver?

>=20
> The purpose of this design proposal was not to require very specific
> changes to individual watchdog drivers, but to align the userspace
> use
> with the best practices already from other watchdog drivers.=C2=A0 I don'=
t
> think the kernel driver should be bending to match a particular
> userspace implementation; you should be exposing the information
> available to your hardware.

I agree with this in principle, but I'm not sure what else is meant to
be done here.

>=20
> Having said that, it was known that there would need to be changes to
> the driver because some of these conditions were not adequately
> exposed
> at all.=C2=A0 I'm just still surprised that we're needing to reference
> that
> document as part of these changes.

I think the main question is whether an internal, graceful (userspace-
requested) reset is a reasonable use of WDIOF_EXTERN[12]. My feeling
no. I wonder whether defining a new flag (WDIOF_REBOOT?
WDIOF_GRACEFUL?) in the UAPI would be acceptable?

Andrew

