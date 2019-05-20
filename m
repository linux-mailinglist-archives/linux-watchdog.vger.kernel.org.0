Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E80923AA9
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 16:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387911AbfETOnG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 10:43:06 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37797 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732661AbfETOnF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 10:43:05 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 67E061BF20E;
        Mon, 20 May 2019 14:42:59 +0000 (UTC)
Date:   Mon, 20 May 2019 16:42:58 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Message-ID: <20190520144258.eauhvvwfxuhiczie@flea>
References: <20190518152355.11134-1-peron.clem@gmail.com>
 <20190518152355.11134-2-peron.clem@gmail.com>
 <20190520073529.nxptfbibexrqyzfi@flea>
 <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vpv227evtpkmkqyk"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdrW7RcEKePCr1DaL-be8dA5oOjvHdxYkiu=h37z2e7tw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--vpv227evtpkmkqyk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 10:14:10AM +0200, Cl=E9ment P=E9ron wrote:
> >
> > > +     - "allwinner,sun4i-a10-wdt"
> > > +     - "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> > > +     - "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> > > +       "allwinner,sun6i-a31-wdt"
> >
> > Is there a reason to keep the A64 compatible?
>
> Yes, A64 and H6 has the exact same memory mapping looking at the datashee=
t.
> So if there is an errata or a new feature for the A64, it should be
> also compatible with the H6.
> Which is not the case with A31 (WDT_KEY_FIELD is not preset)

The thing is, if you use those three compatibles, then you're saying
that it's ok for the OS to use first the H6 driver, then the A64
driver, and then the A31 driver.

If the A31 isn't compatible, then it shouldn't be listed there. And if
it is, then you can skip the A64 compatible.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vpv227evtpkmkqyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOK88gAKCRDj7w1vZxhR
xQlAAPsE6kzsQQMSHryqgwmd6OWp/s6AtN+TcU7ip7ukhfmmlgEA24/Tc3t6XRAH
2cNOcp+yz6bb7jinJ2k9sXjsqBcyywo=
=7TNO
-----END PGP SIGNATURE-----

--vpv227evtpkmkqyk--
