Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2F27B4D
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 13:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfEWLEz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 07:04:55 -0400
Received: from sauhun.de ([88.99.104.3]:53208 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbfEWLEy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 07:04:54 -0400
Received: from localhost (p54B333B6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id D0CC12C0398;
        Thu, 23 May 2019 13:04:51 +0200 (CEST)
Date:   Thu, 23 May 2019 13:04:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, wsa+renesas@sang-engineering.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] watchdog: renesas_wdt: Fix interrupt enable for timer
Message-ID: <20190523110451.GA3979@kunai>
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 23, 2019 at 06:29:37PM +0900, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>=20
> Fix setting for bit WOVFE of RWTCSRA. Keep it enable follow hardware docu=
ment.

Hmm, I can't find it in the docs. Which version of the documentation do
you use?


> -	rwdt_write(priv, priv->cks, RWTCSRA);
> +	val |=3D priv->cks;
> +	rwdt_write(priv, val, RWTCSRA);

Have you tested this successfully? According to the docs, CKS bits are
all 1 by default. So, your |=3D operation should be a NOP and we can't
select a CKS value anymore if I am not mistaken.

>  	rwdt_write(priv, 0, RWTCSRB);
> =20
>  	while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
>  		cpu_relax();
> -
> -	rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> +	/* Enable interrupt and timer */
> +	rwdt_write(priv, val | RWTCSRA_WOVFE | RWTCSRA_TME, RWTCSRA);

What is the use of enabling an interrupt without having an interrupt
handler? (And I never understood why there is an interrupt for an
overflowing watchdog. We won't have time to serve it, or am I
overlooking something obvious?)

Kind regards,

   Wolfram


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzmfk8ACgkQFA3kzBSg
Kbavhg//fYTO7jvzinLCh+cVNLmhCpeufWNaUmCKaAAfFWsjbPaPMqqAzem6yOLB
RFWoaucO/TW+s0/s/xrdDD5OGawk9AKgr5m8224cUPUvddvJHkOCRKaMjOP97d32
hTyHrSmtwNpZdbbGHUj7e1nzGddSuCEr3ztTcqQ5vmyC3JEHGYgzC7ik/p7M2PV2
W1d4ZgaOzRkK/VV8D0iU2CjLkSIGj6cNpqswyw7VcblImLNZxMOAxD+I9zWwLCZa
z0vahSdRQaIaHtcxwbjh9owdUMQ8URagSmf3hHzXexH4dHamEHMT4tIvh9QgQKrV
3H00biv+Ib8KwbgnaHLJGm9BKMBEgQHYr+Jud9qvbFjNVkKspU+M+wtIwHXDqxXP
cdiXes9nSMEoOxjo5GA42lufMCi3pInwTqU9viVYzxJRkP8huAuaA0/Wuq4g3tlk
QoWTsKdHOaVlddgptSnDvI1O5SjT3TTsTBhkLpYNW+wAqoH3498CB0dsFwTt5Fl8
FIJjitct1jIC8rCgLKTI5xt5tlyl4GN+0F8Fy1d0YgJ/+uGdT4iDczuDdfCTWp9V
juW7j3nH2NwMohYvduyxqYdmxuDpLUByK8UqYj6tv21z/sGlzssnaAosq1vRrKUH
op+PsDnh21ESq0WTkyKED2cS4nP0oSfC/AjLfvZKqZ/Wdo7gj0c=
=D6oR
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
