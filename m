Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCDF342F93
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 21:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhCTUo0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 16:44:26 -0400
Received: from mout.gmx.net ([212.227.15.18]:42147 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhCTUoV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 16:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616273041;
        bh=I1uxDkqVHbCR5GFqrDLurMaSGLta0rEs3GRT85AXsPI=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=MzsCcUtFxDJcnbKACYU2oKKsK87EVr7b0IlG6b9q5r1wyyR2X2rN2HBXfHA+0Bm1L
         16Bxh+kfBcpvwSWsCSHVPBjd3n6lqFCoNtFLTtfByfmTJgy+F6HiXeSN/z9/jQ3+lm
         YyBdTUoECLThF9/DwoswUPJr61aci3LcMZst7KyA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma20k-1l9MSz0vps-00W0d8; Sat, 20
 Mar 2021 21:44:01 +0100
Date:   Sat, 20 Mar 2021 21:43:59 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH 11/14] watchdog: npcm: Add support for WPCM450
Message-ID: <YFZej3Eg6yfCeGwC@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-12-j.neuschaefer@gmx.net>
 <bd66894d-2ff8-f0cf-7fbc-cf4609094ef2@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Wy8EjUemgdhkONYP"
Content-Disposition: inline
In-Reply-To: <bd66894d-2ff8-f0cf-7fbc-cf4609094ef2@roeck-us.net>
X-Provags-ID: V03:K1:z6wSN01V5RzuYpjYHcKMiN3aHNuJ+jErDxcJ+YqN6xL+k03BK3c
 6HM6wRMf5oj0qXdD6t3o9yhyfz6gGxYUM8dvJJ7eQomrhbeQCz+kyi7PrAvwY5fW5WUqYNf
 4Q9j05nHfNMqTxolzY137kzJt25TN/kbb0z5Df9k/OdkWGctWA0DXeFEsXSe/7/gc6yzEfN
 KAMaoSxIrfgGEb/IF7qBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Lv1DmPc7Kdw=:kSZD6xA/UQCj6o/jl8YIZ1
 EVtHt0jue9Bl2V9Mmrj6R3b5MGYCU586DR2FSy7thVv9U/GzzVulCsvLYKMHplMINV9ekvZFh
 XlwJvIbAxaec0LmkNRAwm78LroNxEThL7eCes29JZ7OmRP0xb2DIuWm1Ej6CkkeTneOKRrx+1
 h4fiP32HZeHF8mw0aH+gkyc5TCdLDYVVtZs/WEjNDcvQWNDJaIWcX4cLBVbxlxSJ831KkjVmn
 w71JBHRu4jsXif5uIjWvJwzGlwy9mE33PzRoRQErKJSOdieHALBRDPsK59ShgpZRojUGmdLuY
 4ap36by0WGd4z2zxAfU42PctoXmQd+F5073Xo7IC8a/BKWko5wRd1j5jWtx+CfXgz61TDKmkZ
 vmxM1FkLWfI5m4KbKs7DWaHDsmCvpwRB6DJ6nTqDlEDskbaPZeD3n6VzUNdN2mwY1aw1aanTy
 OA867lEDdmXJ3u7OZhYrQD8LhI1eBnuke60ERqqRsVoX1w3OXA+PXcjIXkIKiK/1nLCeAVnwM
 rvEkEloygtODM4YKGmF9FQKxEpSJ4yhRdJNlMTbOxLCUcL9P9Tn1KZ4RNELzwUb6dtMiKfcHM
 F/wFkE1F6Ogvux2t4SCNoHxGzvWYlWqKZPU+i81PcU+LLngwHAuZU+2RSWXS3Sgl7oX1xQVCt
 Xoo+cA1U4W8vw6azIVZAMW50FEtERYY5/abJzfbF91SOi3riD3rCaqdwf24oETkJ/Bz0WHg9Y
 QUmYcjEmrrARFMI965ED+pHSagjqIooODe4L1IzN/DkLRNHwdUav11vteGzMB1clsx1uW8zCp
 X8rcpsr1D7mijnwNmQWkh0efO8isvUOc8ZKRTcNFzWTpy66ty7zSr0X5pxx/lcJlqL1VSlbWE
 E9tPLQptBkIymV9u1o+lCKfmw/OcQ2V/TCkFwQmbCTZ0GIIJGxg/ZcrZ11C11JjZluxA93RLD
 tVZy7gGnDFZ5aKSzGxPZKgrh5ltjdXc5I0zcsmtv+dDMcnPUYRZcPbs9nfm5eQglIOWDXUhpG
 jsbJo9Z7QXl/9q7P15on40TDRuwh98RleguptGH/3/wZ0JgcQzYVe5Lk6oa8PBMEiGreqAi8j
 PPGUmWCNZJcBb81Ayl5JNA/tHbKmxMl+kYRD0A9ZXevKgyVo8eYUjI3g6DCRLbbHvZx0ydZgt
 6rqVwKyjScqvkdV1sZvrjC4pCAJBdUiBfIUGD0GRfD4b7aoOWIjhpB55YHweEatQ17PG4EnPb
 JLqZhZe0vt3ywM0Wh
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--Wy8EjUemgdhkONYP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 01:24:31PM -0700, Guenter Roeck wrote:
> On 3/20/21 11:16 AM, Jonathan Neusch=C3=A4fer wrote:
>=20
> Patch description goes here.

Ah right, I forgot to add one. I'll fix it in the next iteration.


Jonathan

--Wy8EjUemgdhkONYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWXoMACgkQCDBEmo7z
X9tPiRAAvkv6tfjOOgM95MG2HhT2PytoRTq2mFRgcZ2Hl+ZrPMtcm9nAEa3Lvz4e
Xuf+zBSF4iebdp5WY1paCHAvM+l23mn3F4HDldEWu7l9vFfysOvDxuaIeMVihC3q
g8cfx7DQfXAMe+R8sdyAbE52lR8ZVSzTWiYh2Lkb23t3zGvtoxtfvcG9IITpXyLP
SWiKl18uHRcMSHPEpB0blgBabE0BkO0Om1Tjsgi/h2Jahxwwio4unsyps/F7YAqi
N8zmr164rt8AIJlFJVED8xpkm/94VJbmJdqpMMsGV0i/itGVHQ4RSHdqe3G3nlWo
GxkJyGrXY6pFD1WfvdyG2SwyQ2zAwhtqn678sLZ8sc5uamkezzvp0AUofgoMSYI7
ebi+l421mQe6fPwyJSufFJ8pDoIa7ohjOJOSpM9wOoyzQSD5RQwDL+JY560PY80i
zN6VS/1/V423GRQxXW0dJ4UdEWtZlfm3r1mwfRFY8kW9SeiT7BVqVrrq0ydG86HN
jejPBByNfDjjtxdGcJhRBO5lwN1Li8d4fR4w0mw1FrBQXm1UGGVSAxsO1/iWRKqe
iEw2xCpVHICnOmQwO+mW4/blErFBuSw6nnQ77zHzgYJI1syy2sbBKKcO4vmq199F
lMr4mOvpuDxtotGlQcqpdvRZxpb2oBjNVohTIc/sl6v2CyNeZrA=
=F2JL
-----END PGP SIGNATURE-----

--Wy8EjUemgdhkONYP--
