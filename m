Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2132527B5A
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 13:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfEWLGw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 07:06:52 -0400
Received: from sauhun.de ([88.99.104.3]:53254 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728518AbfEWLGw (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 07:06:52 -0400
Received: from localhost (p54B333B6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id 189FA2C0398;
        Thu, 23 May 2019 13:06:50 +0200 (CEST)
Date:   Thu, 23 May 2019 13:06:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, wsa+renesas@sang-engineering.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] watchdog: renesas_wdt: Use 'dev' instead of
 dereferencing it repeatedly
Message-ID: <20190523110649.GB3979@kunai>
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
 <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Content-Disposition: inline
In-Reply-To: <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 23, 2019 at 06:29:38PM +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>=20
> Add helper variable dev =3D &pdev->dev
>=20
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Hmm, I leave the decision to Guenter. Dunno if there is a subsystem
preference. I personally don't think it adds value but I am not against
it.

Regards,

   Wolfram


--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzmfskACgkQFA3kzBSg
KbYa4BAAnAviIhzCcTlXOIklD6iVbQ0leHwq0lhhPe9/mxOxwzy7TyBeFKjhTPrJ
Mlp6WKY99OIRqIe2xNtt6qazhxeBcIe0CqOmsU6VicluUZKcPecJJ8guATH16zB8
vP23v7qSFoL2/kXp+smLwhpfnlV0B0KRurY+J9RzckeLPeaTElZ5VR+t0dEsaMLu
FjsQv2sQ3TXxzo7WNtbvbIWRphQeyBYRgAbodyc0Hcu+5RLsNVhBiASV3lPEYI0Q
Ch83gypPq7Md+7OWwrOrRGJiMLB/Ky8itbjFQmdGCfycNnfYlj3H3TDApAjKL+9A
v/YrdY77Zr1rVJJ9mRMgGd+PdWFbo5KmoiY/9jYEY6thX393796E2eKIGOl+pFgL
aspaR1Kz66np6EqQ9jXVJIMBiw7Tm5kmRf3oV65lu+S+k+526lj1ftwWX7rwfNsK
zXGLIl+gUfuDyc5CEjDn07FQoJIb8lx7CXlwe+7okLZOZv88t6+qvS4q/KAm2kFi
2oYYrgy8r/zY1llAww+JnjSrVaIETNKm92HhXGFV/2FkuGV+jprhxUD+sMOiaet/
XXwE8CLW2R69R+lH9wmR7fMfd3nNn9twVFYrXSgsm4PV/vd0E1115p06vOSprXFP
c1T4F88TAR0TTpjUVaKPtl5ULNnImNETliRx7lYA7KMBJb3si24=
=Fl07
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
