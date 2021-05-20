Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504D6389DF3
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 May 2021 08:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbhETGcS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 02:32:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55557 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbhETGcR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 02:32:17 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1ljcCt-0002AX-Rh
        for linux-watchdog@vger.kernel.org; Thu, 20 May 2021 06:30:55 +0000
Received: by mail-ed1-f72.google.com with SMTP id h16-20020a0564020950b029038cbdae8cbaso8974159edz.6
        for <linux-watchdog@vger.kernel.org>; Wed, 19 May 2021 23:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version;
        bh=T8MGweMWh8G1Vb1FxsntXZZXVCiDZgcu3o7qGFDrNfw=;
        b=fmdktWQ8E/uIwawBVGO10EcwCeglmYzma7mmUG5Dkg1qPkQKlVGOZBLFcZAh5zslzv
         VVdl1PbzcSMfFQzpfwjSU7SPo9oYEmxCwGVD+EgJ4F/jhc3z0tA5ON9pKHhA7MwCR4Kl
         Qck16af+z24Dk9XZkMMxKYJTEQElb+r2wF37pYc5pMyCn4TujRIuP9NHXZLtET4F/6cq
         i/GTt1V7YkHajOjzofRJRqMHluhaUMA8BCyVGpfInBKihEgiHWpPafzhBQQFxKO3OGxb
         31Hy+WsiWN0WHJRyaGQKgbd1DYnADvKjwe0c/7fu632TFRdCYfk+ZcbVkAVjY9qBbwl/
         loEw==
X-Gm-Message-State: AOAM5331z0pJVvj/5qdN+e0VTr009vgUn/iyL69TSVouXXXe37p1K1j4
        k8rqxG0k0x+Wa6gCWoXYr9aN1KkdnqU3b8hM8kSv/emiQ20Gf+qH208zw1Qvbkvmqw1ajbEVMzD
        XnC+Z6GOZubXj5K+fNuSBs4Bh6EAsZ/Hxr30UTRgarSfU
X-Received: by 2002:a50:ff13:: with SMTP id a19mr3255218edu.300.1621492255640;
        Wed, 19 May 2021 23:30:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNuPb1H6GgcBejEqtfEk4G+6+0hpLo6D3PmJC9QoZVsHwbgkZ+4/XF36vpbR0o9XtSZq3ixA==
X-Received: by 2002:a50:ff13:: with SMTP id a19mr3255207edu.300.1621492255469;
        Wed, 19 May 2021 23:30:55 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id fb19sm882547ejc.10.2021.05.19.23.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 23:30:54 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
Date:   Thu, 20 May 2021 08:30:52 +0200
To:     Joe Perches <joe@perches.com>
Cc:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        wim@linux-watchdog.org, linux@roeck-us.net, joel@jms.id.au,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
Message-ID: <20210520083052.68a0e1d9@smeagol>
In-Reply-To: <f2e616645f311ccaf6e0acb996f8c4360a0480ec.camel@perches.com>
References: <20210511061812.480172-1-juergh@canonical.com>
        <f2e616645f311ccaf6e0acb996f8c4360a0480ec.camel@perches.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L_fDvoyzrJmgDY0oW_xHuS=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 21:48:37 -0700
Joe Perches <joe@perches.com> wrote:

> On Tue, 2021-05-11 at 08:18 +0200, Juerg Haefliger wrote:
> > Convert sprintf() in sysfs "show" functions to sysfs_emit() and
> > sysfs_emit_at() in order to check for buffer overruns in sysfs outputs.=
 =20
> []
> > diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_=
wdt.c =20
> []
> > @@ -445,8 +445,9 @@ static ssize_t ziirave_wdt_sysfs_show_firm(struct d=
evice *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, ZIIRAVE_FW_VERSION_FMT, w_priv->firmware_rev.maj=
or,
> > -		      w_priv->firmware_rev.minor);
> > +	ret =3D sysfs_emit(buf, ZIIRAVE_FW_VERSION_FMT,
> > +			 w_priv->firmware_rev.major,
> > +			 w_priv->firmware_rev.minor);
> > =C2=A0
> >=20
> > =C2=A0	mutex_unlock(&w_priv->sysfs_mutex);
> > =C2=A0
> >=20
> > @@ -468,8 +469,9 @@ static ssize_t ziirave_wdt_sysfs_show_boot(struct d=
evice *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, ZIIRAVE_BL_VERSION_FMT, w_priv->bootloader_rev.m=
ajor,
> > -		      w_priv->bootloader_rev.minor);
> > +	ret =3D sysfs_emit(buf, ZIIRAVE_BL_VERSION_FMT,
> > +			 w_priv->bootloader_rev.major,
> > +			 w_priv->bootloader_rev.minor);
> > =C2=A0
> >=20
> > =C2=A0	mutex_unlock(&w_priv->sysfs_mutex);
> > =C2=A0
> >=20
> > @@ -491,7 +493,7 @@ static ssize_t ziirave_wdt_sysfs_show_reason(struct=
 device *dev,
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> >=20
> > -	ret =3D sprintf(buf, "%s", ziirave_reasons[w_priv->reset_reason]);
> > +	ret =3D sysfs_emit(buf, "%s", ziirave_reasons[w_priv->reset_reason]);=
 =20
>=20
> All of these formats should probably end with a newline
> and the ZIIRAVE_<FOO>_VERSION_FMT defines are to me unnecessary.
>=20

I'll send a follow-on patch for that.

...Juerg

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmCmAhwACgkQD9OLCQum
QrdOUhAAhmiMFmidekLXp9pqzm0r5JwSAY1m4G+OnbZpW9WCaxohD8bivxvVa7Xm
6EQ6SNXkM6joh9iOr0MOawpiWxD2M//Cfuy2XKMSQudbTE4TE8rDD6KbgsBxWzd4
6z82Nsd56uBA87Hrl3pVuVBHtPffIxHZGIc04GQIP24up9hZRmeZZj74trNOSdSb
Dtf0zv2qkkWsWNTolj/aVK9oIo/gRYKFYS4Y2pouUyWO9ZKwceJoKdCZtzZjIeUT
PIRyAFdd0LR4yVUxIF4pZSixNuL1o03ny5jRIBT8ToYxfS1jielPtsvlva7MWLdW
wBACWcOkS6ZvvKdYyFDBmvi/6MOwkrLzPuoVxeMitWMZKVoyKXwff8pCPOLd+IVk
qGKNjn1bNT2oi3AgDo6oA13Fl8rrkRpeJPi5aHZtmz0gs/xBsyD55l2tEBuBQREF
z6hU4+R7FUak99gLvIVDIaKqmJn6k/1fRoCKr9BokKgS9yqJl8DVxkRNXP1LfaQt
5RO5nsWLmgI5vSW2ScDa8hHBE0eGgaVaLJeRTSyreuTQFNJrAWpgu3Fc4LKUT2JR
CXyR+PFBZyNQLv4SomVOztXBN83EO4cBYFebZQF3JERAOdzy4FUvwnuDj+cq//fA
Ra6RAuVCO3+yjoIxNZVXpZiVIdPQlYeIIzBNwiSJJh06OXpovqI=
=lrYW
-----END PGP SIGNATURE-----

--Sig_/L_fDvoyzrJmgDY0oW_xHuS=--
