Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9263D227AD
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 May 2019 19:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfESR1R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 May 2019 13:27:17 -0400
Received: from sauhun.de ([88.99.104.3]:44810 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbfESR1R (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 May 2019 13:27:17 -0400
Received: from localhost (p5486CF3F.dip0.t-ipconnect.de [84.134.207.63])
        by pokefinder.org (Postfix) with ESMTPSA id 0F9082C360B;
        Sun, 19 May 2019 10:32:02 +0200 (CEST)
Date:   Sun, 19 May 2019 10:32:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 11/46] watchdog: digicolor_wdt: drop warning after
 registering device
Message-ID: <20190519083201.GA1003@kunai>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-12-wsa+renesas@sang-engineering.com>
 <87y3332dku.fsf@tarshish>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <87y3332dku.fsf@tarshish>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Do you consider that not important/likely enough to be worth an error
> message in the driver?

This can be discussed as a second step IMO.

I was looking at adding more error strings to the core but then wondered
if we really need error messages for e.g. IDA failures. And if so,
shouldn't those be in the IDA core. Do all IDA users want that?

(Sidenote: to the best of my knowledge, if memory allocation fails, it
will WARN you, so no need to print something in the driver.)

So, I took a step back and saw that watchdog drivers mostly print
"registration failed", not more. Some printed the error code.

This series simplifies the current behaviour. It does not extend it. We
can do that on top of it.

Thanks for the comment!


--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzhFH0ACgkQFA3kzBSg
KbZw0w/9Gv3dmwFrl7MVtrx/ztPaL9efE8e/vPx6jQm4RpWNYcjN/b5N2xZO0vFQ
4hPQyRNTMFbYIjHcjL9xNVHJm4hxnqa/HV8zUqnVoMoXKusBgb3+CtvaMFfSm6Qf
/EQjO0eQc+O/6eO7nfCiCc8HYJwEI+UYjMrBFjOMkRPkJY1Vn/iLpGusO1QbFw8B
tb4UICpBeNa7gFbvmg6CzcTvXfKedsKMSfg2u5TmyKbqBsxdNNwaeirQUyQhpnvd
HIxk0OzwTeqx6UYL3OAbTTXm1k4cA10DnaFt72ZYzJTo1EXXpThVW6JzMn/nX/4/
q1G2LgTr4f1Bzi9FxdXmniSDUw2yrJTp3wwhnO8eE5A/NmRP4Tu6tWwDwCQQh4hL
wMk3HMcQFeuOUUxIn7FEQW+DDxY2bS4OW1NWLUzK7cPjvOl8NgfEO678UK98y/Qs
RPb7povymclkokxztNmlZvxR7b9DwsbZGP8Qa4+MgOeIz4eElJTifpMYvm6hCUQx
Uutu04gTOw3OxWbBH7WNF+98H3HehsCW9pZ0BP25ymXV4sXYgdsUGla7fBUPw56U
j1O4t5YURu/n5nBRuFDM7MhNVD/Fc7JzCUuJ0FWn1oX7qdoizTKUw1Sh7m+JlDZE
P7UrLiB9jG67SkoL0wpTV4KmxQQ1jVGpeinet3xYqjs/bV0T2MY=
=Yp+5
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
