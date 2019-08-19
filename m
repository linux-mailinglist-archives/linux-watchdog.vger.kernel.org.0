Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839A694BE8
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 19:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfHSRon (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 13:44:43 -0400
Received: from sauhun.de ([88.99.104.3]:53934 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbfHSRon (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 13:44:43 -0400
Received: from localhost (p54B3355A.dip0.t-ipconnect.de [84.179.53.90])
        by pokefinder.org (Postfix) with ESMTPSA id A30EE2C2868;
        Mon, 19 Aug 2019 19:44:41 +0200 (CEST)
Date:   Mon, 19 Aug 2019 19:44:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] watchdog: renesas_wdt: support handover from
 bootloader
Message-ID: <20190819174441.GA3793@ninjato>
References: <20190819173346.4019-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20190819173346.4019-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> After all these discussions, the patch became quite simple again :/
> Still, thanks for all the discussions to make sure we didn't overlook
> clock handling.

Except for the probe error path, sigh... v3 coming up.


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1a4AUACgkQFA3kzBSg
KbanPRAAqFD22fnOZRneBj5DYMqlP0MxStSlEAIKUiGHbjc7zWbtClxNRIpqsVPC
Rwf4rCMrNYIw//9mRxLSGM8DP2Y+ikHw7gsl5dcxxAKHqYbd4FfUzldzXJyMdlsh
pYdLXZjwLBg15beZ7Kxb2wqhsWXm0AA6LjYmn+4tAc5Dn9y1fXnJGoLotM7nAzdQ
ll7PkNXBUOCq6dWTIt54WN5CPWx5AH8w+CbiieqNk5HFrF9x0ixGyCzJciE2ceKP
oqVdFN8fI1O+NDh6nerBihBA/9SAghSIeRHv28dPK+h9iY9mCxXbyFL6kv/RkB5T
2J2wucv2JnNlQd1VHc+f0CF3WxlKSCJ4nL7m0oV+Ag02n13OdbbHisp8M8bhYkGG
GEsR9XFkLxfMnPY0d7QlfN/NEFUSt0F8P5HsYFKQ7/2vUX5BhQ8eoUCfFY9g/P77
ADfkaP/mzSqkF7iITI05scUffoTdQtGgDwsTC5HtGcjR2KHFr/EsThvHdgppJC8s
hpsW9RP5DdaSUrFNoeaecSlD7U7peAs3wnd+I3hA8ujHTUdtf1HL9B/Kpr/GuZED
OSLHrC8iEQdf7ofWrwlFyhL/ef+f+j7xtUdin56Z6R/Ifo7sgJPqdxUXXnvkdHFm
uhNcevwjuOCHVjdALH3MUxKDIFmdrN6kdJU5B1NNQQ9hcjwymFc=
=rKgn
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
