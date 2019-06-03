Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CD533080
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Jun 2019 15:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfFCNER (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Jun 2019 09:04:17 -0400
Received: from sauhun.de ([88.99.104.3]:37806 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbfFCNER (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Jun 2019 09:04:17 -0400
Received: from localhost (p5486CC42.dip0.t-ipconnect.de [84.134.204.66])
        by pokefinder.org (Postfix) with ESMTPSA id C0D682CF690;
        Mon,  3 Jun 2019 15:04:15 +0200 (CEST)
Date:   Mon, 3 Jun 2019 15:04:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Message-ID: <20190603130415.wfqwyya4etbmmser@ninjato>
References: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="23srq63gohgiezrl"
Content-Disposition: inline
In-Reply-To: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--23srq63gohgiezrl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2019 at 07:36:01PM +0900, Yoshihiro Shimoda wrote:
> According to the hardware manual of R-Car Gen2 and Gen3,
> software should wait a few RLCK cycles as following:
>  - Delay 2 cycles before setting watchdog counter.
>  - Delay 3 cycles before disabling module clock.
>=20
> So, this patch adds such delays.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Despite minor nits:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +static void rwdt_wait(struct rwdt_priv *priv, unsigned int cycles)

I'd think 'rwdt_wait_cycles' would be a more precise name for this
function.

> +	unsigned long delays;

Why not just 'delay'?

> +	/* Delay 3 cycles before disabling module clock */

I like the comments explaining why it is needed.


--23srq63gohgiezrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz1Gs8ACgkQFA3kzBSg
KbbymA//axXJwi+fpPa5kZRiI4YaB3d9YksMoE4NNqH3leyoA/qi3nHInUzDluc6
UvpnncLec9TlhaaqzMHtPI4MlAjspwX7Fdq5e+rzJmWSOC6Aew383GffeAsXRdrm
G5ByGptVJPgOiEbIkqLOjJbfV1ayLgX+BCzRqGadOVZPQteRKbXbb6oXVC/LRcza
3wVkOTj+bz09z6sel4x4tj4K+fn+oOGMiQ+TJOA5b3GF6lK2UcQW8ur87EV2LTj6
kvPStpTNaMNTZE/VSeprhqQxQxTdTfrlK/a1nUNTzuX583+TgWf5gke9Ey33vRVX
F1sCHi48lKETC6gZWaDLGHc0tMSR/5mppCHXXBzxo/3h+1McZjU0j+HuKM5Pb63R
FLB3vmmPrQ/DV1c/3AOfjtcJaQm/bE+pOuiEL9YlC2hbySAQjDPqckzxKzIHU88A
cuM6gKDOXrkkpeekKtce1xBlIda7wlJHuEYxQZgB7l8xyZ162nWCmfefBlbeEpGK
7QZEQSBmi7B/eKEhLUf8XhiycnItA/3gtYYReh9yTMwWNOkFl7DP76BdTybkWy69
neWnnbcxTcxDI/pQ0p88VpCK0qtDRBEt49yf3q/idvT2hL5LCNuqsYVYhm2JDbe0
MIX3IyCYTnXN4iGpI0mTW1ehLJfHnruJuzWrDo2vlnPTvSXsmuk=
=kZHO
-----END PGP SIGNATURE-----

--23srq63gohgiezrl--
