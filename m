Return-Path: <linux-watchdog+bounces-3670-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF228AE0249
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 12:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD4D4A1A2A
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Jun 2025 10:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE14C221546;
	Thu, 19 Jun 2025 10:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2v0YqdU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648C220F27;
	Thu, 19 Jun 2025 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750327409; cv=none; b=neQBGVvqzvogzGQQ1tK+1dnoOtANpTIhRCzz5PcABjKhkpT3lVQb7WhMDz2/oL7EoNh3ZfqxWqN/tsoMfgLzTf+0tevHiKx+8pAnKGvI4c1lez+Lo63ZIp0FUkHJ+NGTWkCWmJ4WinEvLEdnxyWLM7cB60mXNshQIKUCkZ3nDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750327409; c=relaxed/simple;
	bh=703KiELmDjP8Uw1qN8XJ8LZkYlIjoyRI6q6sVdlOWGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxweLC2WjyZ8Bu2yQCotgZK2/D9bhxZfKqEv9Y7K98X9c/xswfsIyProajflZjYUHl1BPUXlyR0UXDD7PFI2qv7NFZ53S4qGLdxjDaxk7AGwcFEz6mZMgKcshqOi0a+X4lLNsx4MXvNRm8FWm+gMndz+kejEaXaxpTY7NixpJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2v0YqdU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cf214200so5225865e9.1;
        Thu, 19 Jun 2025 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750327406; x=1750932206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6cusTDU2sumyTVDYQ9G+PYn6zrx6R2pwR2MrJ1EXiEo=;
        b=f2v0YqdU2nekC/dRFrqpKDvhsAfxbomcx5byp/ExSaLNkTToOsU7vKxqxFbrUJjcPz
         UZgT7uek5NR8hmafHxszhe8XJFPwUSIxBaVj8AxdFef4IaTJfm091QVzfxOoc8ra9Okx
         gaH19k3Bb+VNjPsN7yf+fU9QsMF4fEte1f/VPHnhoTvkLK8EvpDW0RI7X/rR8okdQhaY
         GmNQ33PIAVszVmOSVEVOv8bSpH3q+Q4hH2YelM07ve7ZySys3GDiE1GUP06t2x62Kd+k
         Ws7ubsQRMBqUsVp/YytuLQWzsmCagX7FleXYNblmnrTHXj21AC08Nv541VDxWJzgI2os
         J6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750327406; x=1750932206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cusTDU2sumyTVDYQ9G+PYn6zrx6R2pwR2MrJ1EXiEo=;
        b=RnfHp3gPE2jpx6kiM3y3jadAGzeORPn1w4tFhpPv/NsszVzDW2IJLZDkX2GtYKoQaZ
         XwokU62A1K0zEscPz/sbghMpYqBl8RKTUn+QkO6pBBCjRmJgHbVndy7uproM93PWU14U
         et55GnRLD5O6g0dfWrToGeMEGDlvv42EN7T1Hka9FaJpxkpe268eY2mAGS9a0X4/wWrY
         durxVVd9VOVuCR1jH+6TIcS0JZq9gWfEbP8Dauc/IwV2fMt9GoNTRA6PFq43ALIVqZ6Z
         2RAzPoRNqgBsWDttveAP6GUfC3WMG1BKq9t9IZk/zrWGYAAT0z0UqD2j95U44WGai4T1
         1kXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3jSGukzTqdF+C7HXN7RfrqolTtKMtUTpUaZFz1uCKM7qbzlh0y3eE7N5XnSpW3wpMM5Mbxt45GRCshj0=@vger.kernel.org, AJvYcCVRStXsQIcm7tu+Q5YQhER/QPJIqvONSGenuDMhrAFJolInTLu6CBdV6kLgdPvXIGVFh3SHpbj/rmwcIu93Cw4=@vger.kernel.org, AJvYcCVkoCu0qUHLGc61IUebQQrn8+kDnpCLrlvOKEc+6425i9d2pAhcrFWQbp0atfJaiViVSzDHcvnssv8eHWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6WPVxh+8fSiFWC4+7HMGLwiSY/w8/CEgQuESrLLz/ZDcmND4
	6iGC8zUEU3okxxX1kiZUXf/Qzcp8AK+aZBWkXTJFV6Ha5ghDjHQjlAW9
X-Gm-Gg: ASbGnct5vym5ua4Y41ptCxhMXVuW7R++1u0xrnN8DvUraSwZanNyKJL6iFdf70d+CS2
	PH9+BEkrY979HNcvtkp/RhIYxE6BisnoThl0hckxZCn4k+a8BLl9jmjhm1t5wVTEhKyoROH9YzA
	60R1rS+rgmKpMBpkyYCnMAnmTjuCeKMeDmhfH1GuBgRPiZT/wzmPuwb0qm3eU51uY0Ukr+N7XS+
	mSA/98bQpViF1cFUKphup8P24r2XH/KQ2/mVCQeKNVMd+Y3IV9sNFa/1YR3JyiL0fbtm5S2rnQc
	GngC/V5YY3TPUhNahwAxYGtMMo8vqL5ivFxrp+hjxscE+TO57Ani9JMbNihkLLlDQhvwi6GxHYK
	NKWQQo7ugqymrtTqxGy28+BgX0JBKnoV64Y9DtFW/smCG3xbh
X-Google-Smtp-Source: AGHT+IFei2sv4Is4eRKDMO6SQ5KWPDd3+hXWSApQVxlUQKGGKcBG83g5eVrYF8DApk8Damil4kEEGw==
X-Received: by 2002:a05:6000:288a:b0:3a5:27ba:47d0 with SMTP id ffacd0b85a97d-3a572e5737bmr17084853f8f.56.1750327405682;
        Thu, 19 Jun 2025 03:03:25 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm19311952f8f.63.2025.06.19.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 03:03:23 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:03:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Lin <robelin@nvidia.com>, daniel.lezcano@linaro.org, 
	jonathanh@nvidia.com, tglx@linutronix.de, pohsuns@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, sumitg@nvidia.com, 
	linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH v8 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <nzuhltjezafyjekctgdazcfayxa2jyk3k2qhfssxfqtmce2nor@sd2s7hvjdpqr>
References: <20250507044311.3751033-1-robelin@nvidia.com>
 <20250507044311.3751033-2-robelin@nvidia.com>
 <5c5ba239-f8e4-43b5-ab58-b3850c57d74b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zc6ugy6dzkprjq5r"
Content-Disposition: inline
In-Reply-To: <5c5ba239-f8e4-43b5-ab58-b3850c57d74b@roeck-us.net>


--zc6ugy6dzkprjq5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
MIME-Version: 1.0

On Fri, Jun 13, 2025 at 06:24:40AM -0700, Guenter Roeck wrote:
> Hi,
>=20
> On Wed, May 07, 2025 at 12:43:09PM +0800, Robert Lin wrote:
> > From: Pohsun Su <pohsuns@nvidia.com>
> >=20
> > This change adds support for WDIOC_GETTIMELEFT so userspace
> > programs can get the number of seconds before system reset by
> > the watchdog timer via ioctl.
> >=20
> > Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> > Signed-off-by: Robert Lin <robelin@nvidia.com>
> > ---
> >  drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
> >  1 file changed, 63 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource=
/timer-tegra186.c
> > index ea742889ee06..e3ea6110e6f5 100644
> > --- a/drivers/clocksource/timer-tegra186.c
> > +++ b/drivers/clocksource/timer-tegra186.c
> > @@ -1,8 +1,9 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> > + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
> >   */
> > =20
> > +#include <linux/bitfield.h>
> >  #include <linux/clocksource.h>
> >  #include <linux/module.h>
> >  #include <linux/interrupt.h>
> > @@ -30,6 +31,7 @@
> > =20
> >  #define TMRSR 0x004
> >  #define  TMRSR_INTR_CLR BIT(30)
> > +#define  TMRSR_PCV GENMASK(28, 0)
> > =20
> >  #define TMRCSSR 0x008
> >  #define  TMRCSSR_SRC_USEC (0 << 0)
> > @@ -46,6 +48,9 @@
> >  #define  WDTCR_TIMER_SOURCE_MASK 0xf
> >  #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
> > =20
> > +#define WDTSR 0x004
> > +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> > +
> >  #define WDTCMDR 0x008
> >  #define  WDTCMDR_DISABLE_COUNTER BIT(1)
> >  #define  WDTCMDR_START_COUNTER BIT(0)
> > @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchd=
og_device *wdd,
> >  	return 0;
> >  }
> > =20
> > +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *=
wdd)
> > +{
> > +	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
> > +	u32 expiration, val;
> > +	u64 timeleft;
> > +
> > +	if (!watchdog_active(&wdt->base)) {
> > +		/* return zero if the watchdog timer is not activated. */
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * Reset occurs on the fifth expiration of the
> > +	 * watchdog timer and so when the watchdog timer is configured,
> > +	 * the actual value programmed into the counter is 1/5 of the
> > +	 * timeout value. Once the counter reaches 0, expiration count
> > +	 * will be increased by 1 and the down counter restarts.
> > +	 * Hence to get the time left before system reset we must
> > +	 * combine 2 parts:
> > +	 * 1. value of the current down counter
> > +	 * 2. (number of counter expirations remaining) * (timeout/5)
> > +	 */
> > +
> > +	/* Get the current number of counter expirations. Should be a
> > +	 * value between 0 and 4
> > +	 */
> > +	val =3D readl_relaxed(wdt->regs + WDTSR);
> > +	expiration =3D FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> > +	if (WARN_ON_ONCE(expiration > 4))
> > +		return 0;
> > +
> > +	/* Get the current counter value in microsecond. */
> > +	val =3D readl_relaxed(wdt->tmr->regs + TMRSR);
> > +	timeleft =3D FIELD_GET(TMRSR_PCV, val);
> > +
> > +	/*
> > +	 * Calculate the time remaining by adding the time for the
> > +	 * counter value to the time of the counter expirations that
> > +	 * remain.
> > +	 */
> > +	timeleft +=3D (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - ex=
piration);
>=20
> This results in
>=20
> xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra=
186_timer_remove':
> timer-tegra186.c:(.text+0x350): undefined reference to `__udivdi3'
> xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra=
186_wdt_get_timeleft':
> timer-tegra186.c:(.text+0x52c): undefined reference to `__udivdi3'

I'm unable to reproduce this. I wonder if maybe I have a different
toolchain that doesn't have this issue? Do you have a link so I can try
to get closer to the setup you have?

Thanks,
Thierry

--zc6ugy6dzkprjq5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhT4GkACgkQ3SOs138+
s6G35Q/+OscriuS9td/FzsgIvIf5uyQsg8UDu9ZMHYSd65WppQmg4rENctRq3+oH
1Sbytk8z2Hl6putu7F8uQRO477ps2n1EeJ7+3bGO2fnOMNMns3IIV8yHBjsKGrpM
RKNho5Z42xTcavdrLTzNQMG0ZRpEGGFZKn+mo2aPqA6nTiJtap7q95m2Yh2P7CgV
K4YpbcmKi7QufChQXnGUMdsLTK4ahKrBkBSC78w7oCnW/tywWTgi9ESx2kRTHLL0
3Dl4/dnWnEWkqeM7Y6mMQlar1qYW+4hjXjBlrvbMBms9W+hvoF4FNKQ5v/mFE2WB
et4bMjhHe9jMacG4ZZN2//mbSw8jHKmZ0/JYp244/xo97Dawpkgy59auHEjj7Zs9
h2f3yrw+HUgbumNAuRzkS8TUwvHAcg3MlaZXZB5qIdP0dhryhRTqBvfLTfQQfI3p
DyNibyuu0XGmgNaW//UhAR5LnQIJ+Q6161gd7TKSgYLCep+ABu4RmV8agerRxa28
HDvFEKE/dxmUSOTSyeSljckseB7vEnxd8IMeD2VLWdTXY+WO9uHqEhsoRvh5rWYU
iHwK6gasv9Zrk6rpY/77+o+FR31FPl56N6N95f+jdEdtGDld45LS7MSRF5+N+cfh
iAqZLBUQlSEP1mVmbXKSz5vRSBMP1wuWy9vdR4cHG5cVLyDhzH0=
=CR/o
-----END PGP SIGNATURE-----

--zc6ugy6dzkprjq5r--

