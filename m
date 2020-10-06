Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF60284B2A
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 13:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgJFL4V (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 07:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgJFL4V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 07:56:21 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BF0C061755;
        Tue,  6 Oct 2020 04:56:19 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 26so12300386ois.5;
        Tue, 06 Oct 2020 04:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=JNHgnUkVCcHnTYb9aD+ejOV1q+BxbD2oTjD0QUoKHLM=;
        b=umUwmQCnLwmmp5iMp8nPNFyjp0ehREyrq0z5X2q9Xs2jTgp7kXNvswN+4NPXm9/JZh
         z08dh/uiCCKjl7mFaZgK+IIwc+RzLOC0u3fxxWrLl+KHz2yddjSKo0R4W4mr0HsuXWSY
         5L2d/pP9lOylMF7EGy795YuT2z/hJQme0gM0sLSlg5jF7iJjgToTwFQqsvsdNFwujm8b
         qBfA7VXiSnLYxBwV3eQhY2X4nLHSlWkk2vjgeoeoF/l4sTOpAzcLWjNModx8VbTTDran
         l4btJ5mxhIzL9EdLVIT627pF5c4xVHQVxWICQ5KnWrwRrRnEqq1Coo5eRfi6beIjTY0n
         vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=JNHgnUkVCcHnTYb9aD+ejOV1q+BxbD2oTjD0QUoKHLM=;
        b=SJ7f9UuMzTLx08N4d4lTQzHo4HzFmzO2kpX7oE2z/cUtu/KyilU5Ph+jWVEiC0NkzG
         V17FvHou71JfvsCP1lDx0yysEcR+y/bbzvKwWi5eF9mkKUtpxeelxvhAgVvt0F5DZs5T
         cmnXYTAKQkiXWRQ21Mu9OvRFQsiVqDlpp8x3JSn7APRKpL5naGjTAiPwqx9dQ3+D0oYG
         hpLj15oUFo5ll/u8A+f6l7ECjl6bQLpv4a+JOmbyWDNLvSbThKU+xLa8BoyJfJYoOtkN
         7VhqEJ+cGpNu5aNb8nh6ubS01PX6ihKjXxsyBSfxjxcBJ8obtGrwrNm1xYGNIw6VHKMg
         /NRg==
X-Gm-Message-State: AOAM5315k4uo77lpFbWjrjbIPewUH3NPrObE71BSchQNIy6MfhuhLxGp
        u/R/5npvPXGYzInr6CW7CuY=
X-Google-Smtp-Source: ABdhPJw3573ebO+CDzLiaIx8g3x6CssDiBihHtvtobq1wY1tFMbb1MMikEbtKfWT9BhwW9M0R50vhQ==
X-Received: by 2002:a05:6808:7c9:: with SMTP id f9mr2587971oij.60.1601985379116;
        Tue, 06 Oct 2020 04:56:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u9sm819308otq.54.2020.10.06.04.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 04:56:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC] Using a watchdog as system reset
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
Date:   Tue, 6 Oct 2020 04:56:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WQODpNfZgrxoq7AEGCHz66hUzA9sr7HHw"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WQODpNfZgrxoq7AEGCHz66hUzA9sr7HHw
Content-Type: multipart/mixed; boundary="FyYnKfEh6zJBMIBpR7mCNOTRFUEs2AnEz"

--FyYnKfEh6zJBMIBpR7mCNOTRFUEs2AnEz
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/6/20 3:29 AM, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> I have an i.MX25 system here with an external watchdog (using the
> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
>=20
> The problem with the unused imx2_wdt is that this usually provides the
> restart handler and now a reboot ends with
>=20
> 	reboot: Restarting system
> 	Reboot failed -- System halted
>=20
> until eventually the watchdog bites and resets the machine.
>=20
> I imagine that this is a common enough issue to warrant a generic
> solution. My suggestion is to formalize and implement something like:
>=20
> 	watchdog {
> 		compatible =3D "linux,wdt-gpio";
> 		...
> 		provide-system-reset;
> 	}
>=20
> with the sematic of: "This is the dedicated mechanism to reset this
> machine."
>=20

Some systems have more than one means to reset it, which is why
restart handlers have a priority. This in turn suggests that we should
maybe have a means to set that priority dynamically for the imx2_wdt driv=
er
(or for watchdog drivers in general) instead of having it fixed at 128.
That would also solve your problem, assuming there is a different
(currently lower priority) means to reset the hardware in your system.

Alternatively, can't you just blacklist the imx2-wdt driver ?

> (OK, I could enable the imx2_wdt driver and make sure with some udev
> magic that the gpio watchdog is the one being fed by userspace. But
> having two watchdogs fills me with some trepidation.)
>=20

Hmm - that suggests that the reset may fail  because the reset code
in imx2_wdt doesn't work, not because it isn't wired.
If so, the driver code handling the reset may be buggy or incomplete.
Have you tried setting (or not setting) the fsl,ext-reset-output
property ?

> Having said that, I wonder what the typical restart callback does
> different from setting the timeout to a minimal value, start it and the=
n
> maybe call delay() to not return until the watchdog triggers. At least
> that's what I would do for a watchdog that doesn't provide an explicit
> .restart handler but has the provide-system-reset property.

The intent of the callback was to handle situations where the watchdog
hardware also generates the system reset. The secondary use was for syste=
ms
which don't have a means to reset the system other than what you describe=

above.

Guenter

>=20
> In my eyes this is somewhat of a hardware property, but I can imagine
> that others don't agree and argue this shouldn't go into the device
> tree. @Rob: What is your position here?
>=20
> Does this sound sane? Do we also need a property like
> "no-provide-system-reset" to better maintain backward compatibility?
> (which then would result in not registering the watchdog as reset
> trigger even if the driver provides a .restart.)
> Does someone know a better name for the property?
>=20
> Best regards
> Uwe
>=20



--FyYnKfEh6zJBMIBpR7mCNOTRFUEs2AnEz--

--WQODpNfZgrxoq7AEGCHz66hUzA9sr7HHw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl98W2AACgkQyx8mb86f
mYEx5Q//WnaG1XV8kZRM9t1hTpU954UiTZlKELiWX5w3tF4DQMwpUEBNxPivfSGN
zLqK2oPrdMMQqliT+quFuiw2JqSlguGZEJYvGdZFEV6V1rtgcnYHrUCzoN41Nn5b
wAK24NtPya8OWHiyd8BM+wK0X6fqrJxBo8QusTPJFW3O+i8E1pYpz3Shqqm/KRA5
zfpOk+dEOMK3mfzMbbOwrHDOav1wdaguZIR3rtOjTkcdsS8oXgO4EbjcDrF7uyiX
PLGwGq08VApRollCz/XFwXur8F1fT2JEqmc7HNQPXGbNRVd84jC+6GPDOPFEnE35
Z86TlpurLwefDsi/RV4eTomaC++iOIN98a/gApVogro/Ft6vPh6q5CKNtdHTbm6V
LOBAi26xNSKg7FEsJ3ieLNW+BjOv4yIxbKGWOXGleCjvAr5GgSkB3PQkcIWQH70X
2Mt4GQW8GMxU7jNWgLDBK3xVFUXfogIw4Y5i783x/aJHWQa7kog5lnnN5AgxnyH6
ceXJO2q1FSLJsPpRlpeEUmKJ+ew2vBrVmEVuRrm34s8NmJRO15lrIj1viSNSJnIV
RxMdvV00rJTNSv9GYP9cP/sABrFD5mzTGOdaBzeIhlVPOihgV7udQSlBHNk99vkd
xohWjgKxAVGV/iGfLyXhFzjXvmGJYtFRdvOMWH+O2SrVf14HnPI=
=XKjw
-----END PGP SIGNATURE-----

--WQODpNfZgrxoq7AEGCHz66hUzA9sr7HHw--
