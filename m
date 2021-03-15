Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F233B14D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 12:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCOLlL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 07:41:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46646 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhCOLlI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 07:41:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4DB931C0B78; Mon, 15 Mar 2021 12:41:06 +0100 (CET)
Date:   Mon, 15 Mar 2021 12:41:05 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/4] leds: simatic-ipc-leds: add new driver for Siemens
 Industial PCs
Message-ID: <20210315114105.GA15281@duo.ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
 <20210302205452.GA32573@duo.ucw.cz>
 <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
 <20210303193134.GB8720@amd>
 <20210303214810.511ad65a@md1za8fc.ad001.siemens.net>
 <20210303215615.64e45720@md1za8fc.ad001.siemens.net>
 <20210305192555.34f7ea0f@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20210305192555.34f7ea0f@md1za8fc.ad001.siemens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Maybe you explain the idea behind choosing only from that namespace? My
> guess would be high-level software being able to toggle leds totally
> indep of the device it runs on. Such software would have to do some
> really nasty directory listing, name parsing, dealing with multiple
> hits. Does such generic software already exist, maybe that would help
> me understand my "mapping problems" ?

It does not, but we want to have one... or at least not have current situat=
ion.

> The current class encodes, color, function and name into "name".
>=20
> Maybe i am all wrong and should go for
>=20
> {1 << 14, "simatic-ipc-error:red:" LED_FUNCTION_STATUS }
> {1 << 15, "simatic-ipc-run-stop:green:" LED_FUNCTION_STATUS}
> {...    , "simatic-ipc-hdd0:red:" LED_FUNCTION_DISK }
> {...    , "simatic-ipc-hdd1:red:" LED_FUNCTION_DISK }

Can you explain in plain english what the leds should do?

We don't want to have simatic-ipc- prefix there. tpacpi was really bad
example.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYE9H0QAKCRAw5/Bqldv6
8m+CAKCA1UK76NPTlLaS6Fi+3p99AXsE3gCdECrX2ojPmDuYIGX5Y0rMrenNHD8=
=mymg
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
