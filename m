Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0227233B1B9
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 12:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhCOLtr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 07:49:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47712 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhCOLtc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 07:49:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0C7F81C0B78; Mon, 15 Mar 2021 12:49:30 +0100 (CET)
Date:   Mon, 15 Mar 2021 12:49:29 +0100
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
Message-ID: <20210315114929.GA17127@duo.ucw.cz>
References: <20210302163309.25528-1-henning.schild@siemens.com>
 <20210302163309.25528-3-henning.schild@siemens.com>
 <20210302205452.GA32573@duo.ucw.cz>
 <20210303141052.30641e6b@md1za8fc.ad001.siemens.net>
 <20210303193134.GB8720@amd>
 <20210303214810.511ad65a@md1za8fc.ad001.siemens.net>
 <20210303215615.64e45720@md1za8fc.ad001.siemens.net>
 <20210305192555.34f7ea0f@md1za8fc.ad001.siemens.net>
 <20210306135453.6dc186d2@md1za8fc.ad001.siemens.net>
 <20210306140633.57f28b05@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20210306140633.57f28b05@md1za8fc.ad001.siemens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I would also be happy to include a fix to that script. My suggestion
> > would be to allow bus=3Dplatform, in which case a "devicename" will be
> > required and is allowed to have any value.
>=20
> Furthermore it might be good to catch that in the led core instead of
> that script. Maybe warn() on dev registration when function/color/name
> seem off. Could later become "return -EINVAL"

I'm not sure if we want to change _existing_ funny names.

Would document such as below be helpful?

Could you describe the LEDs you have in similar format?

Best regards,
								Pavel

-*- org -*-

It is somehow important to provide consistent interface to the
userland. LED devices have one problem there, and that is naming of
directories in /sys/class/leds. It would be nice if userland would
just know right "name" for given LED function, but situation got more
complex.

Anyway, if backwards compatibility is not an issue, new code should
use one of the "good" names from this list, and you should extend the
list where applicable.

Bad names are listed, too; in case you are writing application that
wants to use particular feature, you should probe for good name, first,
but then try the bad ones, too.

* Keyboards
 =20
Good: "input*:*:capslock"
Good: "input*:*:scrolllock"
Good: "input*:*:numlock"
Bad: "shift-key-light" (Motorola Droid 4, capslock)

Set of common keyboard LEDs, going back to PC AT or so.

Good: "platform::kbd_backlight"
Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)

Frontlight/backlight of main keyboard.

Bad: "button-backlight" (Motorola Droid 4)

Some phones have touch buttons below screen; it is different from main
keyboard. And this is their backlight.

* Sound subsystem

Good: "platform:*:mute"
Good: "platform:*:micmute"

LEDs on notebook body, indicating that sound input / output is muted.

* System notification

Good: "status-led:{red,green,blue}" (Motorola Droid 4)
Bad: "lp5523:{r,g,b}" (Nokia N900)

Phones usually have multi-color status LED.

* Power management

Good: "platform:*:charging" (allwinner sun50i)

* Screen

Good: ":backlight" (Motorola Droid 4)


--=20
http://www.livejournal.com/~pavelmachek

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYE9JyQAKCRAw5/Bqldv6
8qL1AJ9fhBVoLp9LZkPwJCXTzhKG7oDscwCgvQjgYrt6l9FPpZiyYene5dzSDLY=
=vid5
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
