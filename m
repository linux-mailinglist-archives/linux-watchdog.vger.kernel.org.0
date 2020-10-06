Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1CB285394
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Oct 2020 23:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgJFVEP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 6 Oct 2020 17:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbgJFVEP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 6 Oct 2020 17:04:15 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763C0C061755;
        Tue,  6 Oct 2020 14:04:13 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x69so44150oia.8;
        Tue, 06 Oct 2020 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=nJmaPG9zSbTlYKYnWyvlpWyVGhy2HjgqnatMNpPptfA=;
        b=UwzoyDavTeRYAe1IZb1pyXfEgTVaELAPbuu1Lm661ATTPqHqzzyswrb1z3OvdVyG72
         o0pqqG9Q37Gys531YSKN0xH1cWolvQ2MHgW689w0v6bwdz6FmEIIME/ZOHJsY5NaPNxc
         RdQVoF0KyDFtmke5+z2SRj5PXo33mhLA0ZTvX3AvlB3RUa4miecoxfjSPKrmxjcVp2/C
         GPBshsCcoRyrFdCWVSBlTdkR1gdqaYU24/7IW8FHYbLeOjCNZbevyk7v5EBKKx4Nrf0A
         JRl+G9+5yiIpQC+FjfgcRkKKKpeldp3QWe/sFDn65FyEo5iZfWDiMFQ/UjsmiS6kqSMK
         1Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=nJmaPG9zSbTlYKYnWyvlpWyVGhy2HjgqnatMNpPptfA=;
        b=Qm+6bjOLAWt9sOwHVM0R17O5WpizRjy8f2uZrU5lBy4g+DmI8DUw5C+x6yMeyaiMhn
         5Qnsi7qPFRGT99mUvYMJPg87DVnrjqF6JAk2rJ30YBfkhbCY6b+EK9rKmiVRbqU3mWk1
         hw/p89l0oB6olsjY1ZCCbjJS1wz3mBc307Ia4GgpmnhpJofthLIJ1UZiK3Q+9zXl3LSm
         kaxpg5+Ktd4pGF4G6ri4sKRzyGLNVo9bwT9QmnSYeWLhLFS74fY73bnVGa6GSNk9Lthc
         /gVm9O6tb54Jm+H2OE6SGUlThUZGml7l8mHUqRaZm1FH3Jz024b6HvS8lMPDT+CYSWGE
         wCtA==
X-Gm-Message-State: AOAM530p7wlOjG8v1sMXCbn996Q6s5U45nd9wU7P8SBm9kIsGfGvFRhV
        pGsH5ZPpXCuQLXqQidgA2Vk=
X-Google-Smtp-Source: ABdhPJw/idO0ghrXkHYYOOMoW1mRR+4u55M8ZmGJyF2gGCrtwUiMQheD/X1ZaqIx1IEYdAelap0Nlw==
X-Received: by 2002:aca:cfc9:: with SMTP id f192mr104908oig.146.1602018252820;
        Tue, 06 Oct 2020 14:04:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13sm84350oot.24.2020.10.06.14.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 14:04:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC] Using a watchdog as system reset
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de
References: <20201006102949.dbw6b2mrgt2ltgpw@pengutronix.de>
 <460aa962-9da5-6e1e-b5db-3f9f1d78110a@roeck-us.net>
 <41b0dfcd-adf1-296f-e5be-4db3eac9f097@roeck-us.net>
 <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c989af68-fa7b-e6cb-9306-a5f2e196fb20@roeck-us.net>
Date:   Tue, 6 Oct 2020 14:04:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006184130.r2lajves5l7lm2qk@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xIVJY1PoGcxzPRwbto1UjmdDSfMhXRpZB"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIVJY1PoGcxzPRwbto1UjmdDSfMhXRpZB
Content-Type: multipart/mixed; boundary="mxpy3djKE4CzJ0ziFwCHwEANkddEi7RIf"

--mxpy3djKE4CzJ0ziFwCHwEANkddEi7RIf
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/6/20 11:41 AM, Uwe Kleine-K=F6nig wrote:
> Hello Guenter,
>=20
> On Tue, Oct 06, 2020 at 07:29:11AM -0700, Guenter Roeck wrote:
>> On 10/6/20 4:56 AM, Guenter Roeck wrote:
>>> On 10/6/20 3:29 AM, Uwe Kleine-K=F6nig wrote:
>>>> Hello,
>>>>
>>>> I have an i.MX25 system here with an external watchdog (using the
>>>> gpio_wdt driver). So the internal watchdog (imx2_wdt) is unused.
>>>>
>>>> The problem with the unused imx2_wdt is that this usually provides t=
he
>>>> restart handler and now a reboot ends with
>>>>
>>>> 	reboot: Restarting system
>>>> 	Reboot failed -- System halted
>>>>
>>>> until eventually the watchdog bites and resets the machine.
>>>>
>>>> I imagine that this is a common enough issue to warrant a generic
>>>> solution. My suggestion is to formalize and implement something like=
:
>>>>
>>>> 	watchdog {
>>>> 		compatible =3D "linux,wdt-gpio";
>>>> 		...
>>>> 		provide-system-reset;
>>>> 	}
>>>>
>>>> with the sematic of: "This is the dedicated mechanism to reset this
>>>> machine."
>>>>
>>>
>>> Some systems have more than one means to reset it, which is why
>>> restart handlers have a priority. This in turn suggests that we shoul=
d
>>> maybe have a means to set that priority dynamically for the imx2_wdt =
driver
>>> (or for watchdog drivers in general) instead of having it fixed at 12=
8.
>>> That would also solve your problem, assuming there is a different
>>> (currently lower priority) means to reset the hardware in your system=
=2E
>>>
>>> Alternatively, can't you just blacklist the imx2-wdt driver ?
>>
>> After having another couple hours of sleep and a coffee, I wonder if
>> this is already done, and the reboot just fails _because_ the imx2_wdt=

>> is _not_ loaded. Is that the case ?
>=20
> Right, I disabled the imx2_wdt driver.
> =20
>> If so, it looks like you want the reset functionality of the imx_wdt d=
river
>> but not its watchdog functionality.
>=20
> My thought was to use the gpio-watchdog as reset source, but using the
> imx-watchdog only for reset but not watchdog is an obvious alternative =
I
> didn't think about.
>=20
It isn't really something I would have thought to ever be relevant: If
a watchdog can be used to reset the system, and that method to reset
the system is known to work and supposed to be used, why not use it as
system watchdog ? So that use case is quite odd, especially since the
watchdog on that system can apparently be used to trigger an external
pin.

If we assume that there was a reason for not using the SoC watchdog,
we must also assume that using it to reset the system does not really
work (otherwise, what would be the point of having a separate gpio
based watchdog in that system ?).

With that in mind, your other option kind of makes sense. The only
question would be how to express this in devicetree. I am certainly
open to accepting a patch introducing such a property/functionality
into the watchdog core.

Thanks,
Guenter

> So I either want to make the gpio-watchdog provide a restart handler or=

> use the imx-watchdog driver to only provide a restart handler (but no
> watchdog functionality).
>=20
>> And the above would be a suggestion to add a "generic" restart
>> functionality into the watchdog subsystem, one that uses a watchdog
>> with minimum timeout to reset the system, even if its driver doesn't
>> explicitly register a restart handler.  Is that what you are trying to=

>> suggest ?
>=20
> Yes, every watchdog could provide a restart handler with just using the=

> watchdog callbacks.
>=20
> Best regards
> Uwe
>=20



--mxpy3djKE4CzJ0ziFwCHwEANkddEi7RIf--

--xIVJY1PoGcxzPRwbto1UjmdDSfMhXRpZB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl9828oACgkQyx8mb86f
mYHhXA/+KXyy2q5+YjZs5xhhwoigl06v0VyOa1Cjk2YZnm0G/yi/xqrt6vsrVWNI
g1307pLbATa8ZRvy9j8wFAPpgeBdjqXgAE+DQT1QATOFrBEhzaYOKa2gs8ex/E2O
+zQ81gZm7hTRTAjYyEYff4lUZ5GKCx5lXB3YMsPHVZBYEVghUpeety3tUH+bA58f
Fd82LPBaP2JIqsmd18GlnAbwNaqjKcchcJyeBYPOGCndIKilCBMRCnI2CGssUykG
Q/w29kixte0WsN5byNhpEEbETigTUDKJemZp4zpltByR8UFI0hQsOAfxelebroOn
Zf4NxokBrvMVq1RjN9KL7a3LQXaTNxYn+T77mVvKDpb8OXEaKFUCof0ZAFy61Wlk
Hb0apwjqX1fxjzTTTOUup0v1GPoR4rMQjTRHKojKJyib958sfqRSRU44S8rtFPJQ
NoVyg5Ys9cwQJGHvU+7SRFqihJfC5VplgdnbQ0hPHj/iJ1t8ydPN6RFjLtEaSKYm
JRDP/J1QBLpru8wFLCwN2Ez0KCG6RCDC6D+FlGZy+ZhvPtEjDjG+G/RJCx8S4pnY
aBDOA2o+38/xrEXLPZi+EQimJj9UxCou1Ksvt0jbKP4LjduGsJmOlqB/4AQVRJzZ
0TDv3FrMryK+gNUKwV47Cp/FZ6aVtHHSvNuLvUYKCTW6ijhPg2k=
=6Tp2
-----END PGP SIGNATURE-----

--xIVJY1PoGcxzPRwbto1UjmdDSfMhXRpZB--
