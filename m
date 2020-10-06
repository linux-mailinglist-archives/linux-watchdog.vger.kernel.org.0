Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F374284DA5
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 16:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgJFO3Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 10:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFO3Q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 10:29:16 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90F2C061755;
        Tue,  6 Oct 2020 07:29:15 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t77so9288329oie.4;
        Tue, 06 Oct 2020 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=gWCvr6jme1sD/L2VS+NEvBVzgBRNU/acJHMvPlKRV3g=;
        b=TY/p8N5LTJziXQ/Itigt48TvXXajZIxPUM+dTMxSyncSk9h4JIsnqa4m7AMQT5282i
         H1xMcTIjTLWQ/XltFZznjx3JLxo68ECPFH7qR1ei8RtghfvsiaElrQ7damhqS/uPCVN5
         Bn7WCYejwSA3hRW0RI6IDqiV/CGDydjtY07nKPvjoSuxAxz5JqPIiRVlplrC1zff1uhZ
         xJ14+yAC/t2MJIf272UdVf/128DUoAIlRO+XI6Qbrn0fx3cnZXTaCoPf3rel1EtFTUKh
         Y4EoukoivcBCYBXekCwwYWAsjRSanghbsqhZ43A8q8gqojvQQI2FycQ4RPrO0drBimlI
         mQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=gWCvr6jme1sD/L2VS+NEvBVzgBRNU/acJHMvPlKRV3g=;
        b=LO/aQXdKA5XC+oFuAcwIkhAIm4GsyfFzbLE23PbgMaCtjZR+uGo9sbzaCyW6UIAaVa
         15B46cX0nHTry238uX9/vrL9Q/ZGOqtOXaVB+03Cn1pjES7gmzG0KlmiVNhaXA/AQsor
         O4IwLiL+YPmH1fXK0Hyftbc/ZoNcwXkzgIAsLmE41c8g519N0vZJ7DtAvu2ku6TXRbnV
         VTGhJiKgIOta/GgR6Ts+XkXuk2RlCXUoUTvQqLntKVNYK5o9EgTdKjq/bocW1h79y4rl
         bke8zui7JO8iXlfMPN64W0bPMNUmP9Mw4w9awTjLxOBFZZYFngFyq8HM/Zk61MbFcAzy
         VRbA==
X-Gm-Message-State: AOAM5325F0RrihDKoXbO7YE2QJIvszNe6Hu5pVRCNOF6EFFi+r06NSM0
        h2W2BrBJP42r+902m1G+9gdecJ57EC0=
X-Google-Smtp-Source: ABdhPJz/RUK51CfJ2t7+19dmuSoLODv64KscwXc87lG4czFNnRdDCHk6EbRHPHYOx0FPZpRdXs9veA==
X-Received: by 2002:aca:2808:: with SMTP id 8mr2845322oix.26.1601994555250;
        Tue, 06 Oct 2020 07:29:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm870751oof.6.2020.10.06.07.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 07:29:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC] Using a watchdog as system reset
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
Date:   Tue, 6 Oct 2020 07:29:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CFSApHr0l3KnAasu368AMnPWby3G87pPq"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CFSApHr0l3KnAasu368AMnPWby3G87pPq
Content-Type: multipart/mixed; boundary="JOX2XH2xOXwD2PyLmn477UaoCed7rcTlq"

--JOX2XH2xOXwD2PyLmn477UaoCed7rcTlq
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/6/20 4:56 AM, Guenter Roeck wrote:
> On 10/6/20 3:29 AM, Uwe Kleine-K=F6nig wrote:
>> Hello,
>>
>> I have an i.MX25 system here with an external watchdog (using the
>> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
>>
>> The problem with the unused imx2_wdt is that this usually provides the=

>> restart handler and now a reboot ends with
>>
>> 	reboot: Restarting system
>> 	Reboot failed -- System halted
>>
>> until eventually the watchdog bites and resets the machine.
>>
>> I imagine that this is a common enough issue to warrant a generic
>> solution. My suggestion is to formalize and implement something like:
>>
>> 	watchdog {
>> 		compatible =3D "linux,wdt-gpio";
>> 		...
>> 		provide-system-reset;
>> 	}
>>
>> with the sematic of: "This is the dedicated mechanism to reset this
>> machine."
>>
>=20
> Some systems have more than one means to reset it, which is why
> restart handlers have a priority. This in turn suggests that we should
> maybe have a means to set that priority dynamically for the imx2_wdt dr=
iver
> (or for watchdog drivers in general) instead of having it fixed at 128.=

> That would also solve your problem, assuming there is a different
> (currently lower priority) means to reset the hardware in your system.
>=20
> Alternatively, can't you just blacklist the imx2-wdt driver ?
>=20

After having another couple hours of sleep and a coffee, I wonder if
this is already done, and the reboot just fails _because_ the imx2_wdt
is _not_ loaded. Is that the case ?

If so, it looks like you want the reset functionality of the imx_wdt driv=
er
but not its watchdog functionality. And the above would be a suggestion
to add a "generic" restart functionality into the watchdog subsystem,
one that uses a watchdog with minimum timeout to reset the system,
even if its driver doesn't explicitly register a restart handler.
Is that what you are trying to suggest ?

Thanks,
Guenter

>> (OK, I could enable the imx2_wdt driver and make sure with some udev
>> magic that the gpio watchdog is the one being fed by userspace. But
>> having two watchdogs fills me with some trepidation.)
>>
>=20
> Hmm - that suggests that the reset may fail  because the reset code
> in imx2_wdt doesn't work, not because it isn't wired.
> If so, the driver code handling the reset may be buggy or incomplete.
> Have you tried setting (or not setting) the fsl,ext-reset-output
> property ?
>=20
>> Having said that, I wonder what the typical restart callback does
>> different from setting the timeout to a minimal value, start it and th=
en
>> maybe call delay() to not return until the watchdog triggers. At least=

>> that's what I would do for a watchdog that doesn't provide an explicit=

>> .restart handler but has the provide-system-reset property.
>=20
> The intent of the callback was to handle situations where the watchdog
> hardware also generates the system reset. The secondary use was for sys=
tems
> which don't have a means to reset the system other than what you descri=
be
> above.
>=20
> Guenter
>=20
>>
>> In my eyes this is somewhat of a hardware property, but I can imagine
>> that others don't agree and argue this shouldn't go into the device
>> tree. @Rob: What is your position here?
>>
>> Does this sound sane? Do we also need a property like
>> "no-provide-system-reset" to better maintain backward compatibility?
>> (which then would result in not registering the watchdog as reset
>> trigger even if the driver provides a .restart.)
>> Does someone know a better name for the property?
>>
>> Best regards
>> Uwe
>>
>=20
>=20



--JOX2XH2xOXwD2PyLmn477UaoCed7rcTlq--

--CFSApHr0l3KnAasu368AMnPWby3G87pPq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl98fzcACgkQyx8mb86f
mYFNhA/7B4wtOx2ZYicsiG7HWm10Ntb+WDHweJmWBzQxgcp+Ex2ZO6q9BCWhK0uT
t1AtV4PQMhjKlvWrbDdnV+NXeNZb8T09Nl8yEw/22eNj141HdMaG1xt3Dz49FW53
J328kn+ANk+W9UVNZh71+DnSkugh8jjaszIg1ipBXO3lScaaIiPjOL2LfDrpIkCq
iAp5RbSryEgtcRbxAqj1D/dGVSc0kplHxMsh2bQFR62k/m6sfHtn9piR8/yDl9Vl
EYQAJUu6G9NUxaxSSqSwb3/sp/rAq4Mzrj1fp4wytaU3wdM4dOQPMSrKUJTeCrVc
1DyObi/kfNfBU7Mt0aWl6xZmnp1VqsqWuiKtbK6+aKKFvOGTQbaKwF2URHK4PCUX
tv1bMR/QYv456XnQuDSUgipZjXgoL4MIQdnkDMFzmsjO23FHOBy8j+ZacpQ0MKSg
IIz/xuFSaSeKxVv6Yzc+LpfCWuOC1mLt20ZBcpkiKKi0XhZ/w1V2qdkUIFVMyzid
mIWHxsxE73IGe7SfIfYp5c0LXzhBiDegw1ii9rid8JJRvx13HUCreDngFD1tkzBI
gfhLxq0YERF9mjwRt74NQbEQWX/hI2B50buKRfz6K0p/g1lr8wd/gaimVZ8STU3O
JjWQNtR5ySMLrWnW7+Vn9omGGbYyjLAXzeMjxbbFU8b5dBGwr80=
=OZLL
-----END PGP SIGNATURE-----

--CFSApHr0l3KnAasu368AMnPWby3G87pPq--
