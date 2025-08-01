Return-Path: <linux-watchdog+bounces-3938-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA6B180C3
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 13:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62D4A8327B
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Aug 2025 11:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAF623D28C;
	Fri,  1 Aug 2025 11:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWRfwZws"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68801E9B0B;
	Fri,  1 Aug 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046952; cv=none; b=jMr67NfS2lUALh9QmgknOJq312EVgnMAUe9KtU0asUSTPGQvTqmfF3+ijG19sC3/FuPZhmIkvmVcGVO+oOlpLrQMw7LwFNP4uvN4dzg8Z2kEeY3K7/aCMiRvPQtYj3ZvTJvQBv9jbiI8KVXQbKATzJ69NMkzsqMTJ5R/BzgLsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046952; c=relaxed/simple;
	bh=d2LoNBGDHqkG1oI8UNko8tQKxLJHUD+ZPPv10zHQNuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hixklsm9w21VjnRydzNABMrPYW+oeM0bVF6XQQUuc0ravjn1KDMYXJOX+KavHq35boLe31UyQn4pRcNMgT8GXofrFrtQKCt5W7+mbkIBtDzgrGjTIkD72xx5Ckm1nFjhUsLY6OVskXtkyWfl1M6WGbq7zvWAKBWoOl8slX3cwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWRfwZws; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b77b8750acso1185928f8f.0;
        Fri, 01 Aug 2025 04:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754046949; x=1754651749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+BOmaApAnQRani5bFyxdb8l2UHhei1f6sfi+qVNR+c=;
        b=PWRfwZwsKZP2GS6DEnkkgMQ3ZMX0/NRNmxc29RQVLNS8dSBThLX6mqBBUXpgB+yYZD
         83z2q3d+AFChQv5txsKlJpnsPf+O9f/wTv4Vyvp4Z51ACiJr5qh4mixJkD+83Dq3CUvw
         LldWAWck37j8VvMK28SpsrtTpIXWgrzAJcztOZKKcp0AnhASpVldg87Hv8jkhj9+NDpW
         tpEXEKni6oXKHWQmMBtYj5NwVu2LVbEG8LY3gHeKeYLKvFNnrLiOx0kmqZ3zvTCbaG56
         RoYEM+LMDXKvvH0HwYMvyuizex2ZznmqcfORo2p7FwkkiWlgmJLWkFYTo65IayHMw9LD
         nUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046949; x=1754651749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+BOmaApAnQRani5bFyxdb8l2UHhei1f6sfi+qVNR+c=;
        b=La98TElB3MPcoOzRffY0G1SaFOQ5jx60fKce+ZIYXwJlFWF1J+QCmPYyRqybAx6jKm
         BOz4C3Ceia6ZnoKWYqrLXdEzRGFxZrxcQaWqv7+mrkYqeBDSn3pgU3xilk4I5XWCXtqu
         uKO1eMI0B1Wi4G5XFLhmDPfnzyX2s8DbGPusNpixaSabCSe4nMQqBSbm6rM1bSIB+mEf
         yryZpVYbFAz79uHP1W3iFpJwEnOS0jxppCN+XeVZjUfULtjI8jcHSkpOKETCVWrkb2Tb
         hryn8Vq3oiE0E5IfhrKwCGOyEzTvta928AFzJRju+feTvL9kQBuyimvLGZ7e5/DX5RTn
         VxEw==
X-Forwarded-Encrypted: i=1; AJvYcCVZfllFP2JfFRd3mhiV2cakcH9IDY9oDkYtxYUoyWRMSfIEg50gZIr+7fkMXed/i51CmOi9truJ8ZLPYU3XCVI=@vger.kernel.org, AJvYcCVyy9WiKBioq+wTOpj62flTRDiT6fLfCQuu9J6YMiL9VaxnDBmpWyjWNo2NAUNqmYS5FlhyA7aAin1WTO7p@vger.kernel.org, AJvYcCW3RNMS8iQAsIYyDxj7ayZRG0zrP1JyOll9n7Y2Pr4oy1ilh9EOQmtECCo3aSeO/WvFGNY4VtWqxdJR@vger.kernel.org, AJvYcCWum/10Lhbkc+lIcvpkn4mH5yKkgnV5Uod6/n7HMMjbelfW7YOW9gvIYLZXZ+jPuQDKZiadUr7CE3tIzuIdJhePiTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrm3TGqjw2/XR5ismzHKAAsIqsnnyuoHM8vo1yj0d5N7ctOwIT
	zAzGpXJMa6NUjw1PuLC2zXMLI3SmE3THpgXUqFZCmvc5yGN6p/gGJiehOPB3J6AIDzSegkK1Gxb
	Ob6dX5lTTPDRNlXCPo6LZ0zN0mj7WSDY=
X-Gm-Gg: ASbGncvxjuFwhOopuz3Rw/49DPAGwBBsocAC+pj1QqvJccxrZoPlAfhi4moOUwVdWJC
	bTTggrtLv+5e+Qhzmc2GF04f5MFfZDaBqS6Hf6pdsg7rWRwVRpbPNUy8SwBAs670zIhVvUkDVFD
	NmNpZaDYUvkDEx6n5MoIUh+D4etUugZnWfSzIGqdfnpYTYqkZl/0V1fkUBzSegYCSGiPGd0bF33
	OKt75iIfw==
X-Google-Smtp-Source: AGHT+IHsfOy3LeUyGBHi4zzK0MMI7dOLV5vo4mqdDOoXykG8lbptTHP115xcOiuQ3Ftf99FTjWDlH24hasIwiyr4ogw=
X-Received: by 2002:a5d:5d88:0:b0:3a5:8991:64b7 with SMTP id
 ffacd0b85a97d-3b79d813d8dmr4620723f8f.26.1754046948603; Fri, 01 Aug 2025
 04:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250729155915.67758-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <aIw-sxQgdzTSLrJ_@shikoro>
In-Reply-To: <aIw-sxQgdzTSLrJ_@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Aug 2025 12:15:22 +0100
X-Gm-Features: Ac12FXxB7KTWna_KgkuQC2HTkAPiZxLfvyASMmBcJptTa4JiUTiZzqkfcolFBD4
Message-ID: <CA+V-a8se2NMGPEffwnAgDp4NB0vHndf2EQmvNTT5ySzr8c4OMg@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] watchdog: rzv2h: Add support for RZ/T2H
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Fri, Aug 1, 2025 at 5:12=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 29, 2025 at 04:59:14PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the RZ/T2H watchdog timer. The RZ/T2H requires control =
of
> > the watchdog counter using the WDT Debug Control Register (WDTDCR), whi=
ch
> > allows explicitly stopping and starting the counter. This behavior diff=
ers
> > from RZ/V2H, which doesn't use WDTDCR, so the driver is extended to han=
dle
> > this requirement.
>
> Is it really required or is it an additional feature?
>
Sorry for not being clear WDTDCR register is not present on the
RZ/V2H(P) SoC, and is required on RZ/T2H (and RZ/N2H) SoC to
start/stop down counting.

> > To support this, a new `wdtdcr` flag is introduced in the `rzv2h_of_dat=
a`
> > structure. When set, the driver maps the WDTDCR register and uses it to
> > control the watchdog counter in the start, stop, and restart callbacks.
> > Additionally, the clock divisor and count source for RZ/T2H are defined
> > to match its hardware configuration.
>
> Where is the register placed? We need a seperate resource for it? Can
> you kindly give an example DT node for this case?
>
The WDTDCR register is placed somewhere out and yes we need a separate
resource for it.

Below is the node for RZ/T2H SoC:
        wdt0: watchdog@80082000 {
            compatible =3D "renesas,r9a09g077-wdt";
            reg =3D <0 0x80082000 0 0x400>,
                  <0 0x81295100 0 0x04>;
            clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
            clock-names =3D "pclk";
            power-domains =3D <&cpg>;
            status =3D "disabled";
        };

Cheers,
Prabhakar

