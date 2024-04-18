Return-Path: <linux-watchdog+bounces-976-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815258A9C5F
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Apr 2024 16:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37AE91F213EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Apr 2024 14:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75637165FA3;
	Thu, 18 Apr 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU+ctp1t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2A15F409
	for <linux-watchdog@vger.kernel.org>; Thu, 18 Apr 2024 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449716; cv=none; b=XQ17S32hv904iTtawLBpCzf6BCr4p4SVo0fCDP9b6yUIV9/bDwvlyBiOGleESPTom88jEitHl6iWxLrcC5AzD00Fl8pozcMg6imqjN9p5e3YHnTYGv7KWzib39Lr161ZahgMy3PZmZPvkkYVDTAvvteQdv0SvIpoTTEYoAvV/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449716; c=relaxed/simple;
	bh=kEU8pg5x/u3kCeO1AkCEa9X4vxxjtiSQ6fE84z9fXE4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxv48XaXDte/LKOOP7YYFWleT1/W5Hl2LwSSISPTxfBtunoZL1+Nf1shBlteTjyl8pNAWD2AuKbGANhYauWderdbHmEaHkHlWJkKvKpGXPS9LBI2bloRfbLBvnd2cT+NCmZnqbcjcuzN8HlqB4RwQ58nlnXekSl80+CrMvkx6d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU+ctp1t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A731EC113CC;
	Thu, 18 Apr 2024 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713449715;
	bh=kEU8pg5x/u3kCeO1AkCEa9X4vxxjtiSQ6fE84z9fXE4=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=sU+ctp1t3S5vaMl+Ofb9aSpNLyCLSyP54gWSHD34ji5tgyQUC99dTq6wqQgB+OS6O
	 EuT9oyfDsgoHWkLa74UGw+XNYH0n6cGIq13KzaIbVx4kuOvaXxPNKfFWAHPtqhuUmo
	 +fJjB1H0SK9lHlnCW6LaSbQ8eHUVhMBanjMvQFtw7L8ScRutkdMWnqhRWJo/95vRXq
	 a7SumTdz0ob57DEO9MQS7WMjbH7JpzNzN0w4nLVOzkrHiNUVs/Siho7/Jk8i9nO7w0
	 dGc5LEDid1X2BLSgec/OlDkbVAQ1RIQW6TrQSB+zJiZiEjDC+XIyU3kDiXM5Iy/U/u
	 G0M/DM0k2wAlQ==
Date: Thu, 18 Apr 2024 16:15:10 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Andy Shevchenko <andy@kernel.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 arm@kernel.org
Subject: Re: [PATCH v6 05/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
Message-ID: <20240418161510.5ff0dc46@dellmb>
In-Reply-To: <b0cce881-f42b-469f-a4db-dcfcf89738f5@roeck-us.net>
References: <20240418121116.22184-1-kabel@kernel.org>
	<20240418121116.22184-6-kabel@kernel.org>
	<b0cce881-f42b-469f-a4db-dcfcf89738f5@roeck-us.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Apr 2024 06:26:04 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Apr 18, 2024 at 02:11:10PM +0200, Marek Beh=C3=BAn wrote:
> > Add support for the watchdog mechanism provided by the MCU.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org> =20
>=20
> This driver should reside in driver/watchdog and use a generic API
> such as regmap to access chip registers.

Hi Guenter,

I have these points against that:

- the regmap API is not applicable in a sane way to the Turris Omnia
  MCU interface. I was trying to do this 5 years ago. An explanation
  can be found at
    https://www.spinics.net/lists/linux-leds/msg11583.html
  (the LED driver uses same interface as the MCU driver, LED controller
   is implemented by the MCU).

  so were the watchdog driver a separate module, we would either need
  to rape the regmap API to do this, or come up with a new API specific
  for Turris Omnia, which seems like an unnecessary complication just
  for one device

- this watchdog is specific for Turris Omnia, the driver can not be
  reused anywhere else

- there are several other multifunction drivers in kernel registering
  watchdog that do not live in drivers/watchdog/

- leaving it in platform/cznic/turris-omnia-mcu* keeps all these
  turris-omnia-mcu features together and they are all implemented
  by one .ko module

Marek

