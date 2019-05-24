Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D120A2988A
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2019 15:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403815AbfEXNHr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 May 2019 09:07:47 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51989 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391609AbfEXNHq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 May 2019 09:07:46 -0400
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr [90.88.147.134])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 4294A240004;
        Fri, 24 May 2019 13:07:43 +0000 (UTC)
Date:   Fri, 24 May 2019 15:07:42 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Allwinner H6 watchdog support
Message-ID: <20190524130742.blyckr74erre3ekk@flea>
References: <20190523151050.27302-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kp5yz4xxxfd2wshh"
Content-Disposition: inline
In-Reply-To: <20190523151050.27302-1-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--kp5yz4xxxfd2wshh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2019 at 05:10:46PM +0200, Cl=E9ment P=E9ron wrote:
> Hi,
>
> Allwinner H6 SoC has two watchdogs.
>
> As we are not sure that both A64 and H6 are stricly identical, I have
> introduced the H6 bindings.
>
> After investigation it seems that on some boards the first watchdog doesn=
't
> make it properly reboot. Please see details in the commit log.
>
> I think it's proper to add it with a comment anyway.
>
> The r_watchdog is still available and usable on all the H6 boards.

Applied all 4, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--kp5yz4xxxfd2wshh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOfsngAKCRDj7w1vZxhR
xZhmAP9dNnhILxNK6etNTB+zKw2FWxx3f+hVuDnWL6dnrZudwwD8DkKLz0P5oKZC
vjDzU3AcRPlmS3ZNQi7CpQqMK2tE8wg=
=FvXk
-----END PGP SIGNATURE-----

--kp5yz4xxxfd2wshh--
