Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047D027D64
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 14:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfEWM5V (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 08:57:21 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45715 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfEWM5U (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 08:57:20 -0400
X-Originating-IP: 90.88.22.185
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr [90.88.22.185])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CD843C0010;
        Thu, 23 May 2019 12:57:16 +0000 (UTC)
Date:   Thu, 23 May 2019 14:57:16 +0200
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
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
Message-ID: <20190523125716.g4euwplfsvw4vqzl@flea>
References: <20190521160330.28402-1-peron.clem@gmail.com>
 <20190521160330.28402-4-peron.clem@gmail.com>
 <20190522103243.mmrfato5p2mhtf4j@flea>
 <CAJiuCcdaZVLQyupEf8HPaUySakufXXAhzundo6VeyQaAyZ8Trw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wdtcxmlg6dhvhpqj"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdaZVLQyupEf8HPaUySakufXXAhzundo6VeyQaAyZ8Trw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--wdtcxmlg6dhvhpqj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 06:15:26PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime,
>
> On Wed, 22 May 2019 at 12:32, Maxime Ripard <maxime.ripard@bootlin.com> w=
rote:
> >
> > On Tue, May 21, 2019 at 06:03:28PM +0200, Cl=E9ment P=E9ron wrote:
> > > Allwinner H6 has a second watchdog on the r-blocks which is
> > > compatible with the A31.
> > >
> > > This commit add the H6 compatible for the r_watchdog.
> > >
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >
> > Unless you have some evidence that the two blocks are different, then
> > you should just reuse the same one.
>
> I have no evidence it's different nor identical, it's not documented
> in the user manual.
> I thought it would better to have separate bindings in case there is a
> difference.
> Than don't have and find later that we have to introduce one.

It's a tradeoff. Pushing your logic to the limit, we would have a
compatible for each controller embedded in an SoC.

This would be unmaintainable, and slightly useless since that case is
very unlikely.

However, having differences between SoCs is quite common, hence why we
have different compatibles for each SoC.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wdtcxmlg6dhvhpqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOaYrAAKCRDj7w1vZxhR
xUPnAPsGJnjqxtkcj8BFHo1UbY6rBrhE114RafzPUtXuJD8o4QEAmWfFGwayxZZ0
63T2ZEyt/CbXZE9fTnSFpRsi3BkzQA4=
=Frvc
-----END PGP SIGNATURE-----

--wdtcxmlg6dhvhpqj--
