Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC4137906C
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 16:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235930AbhEJORP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 10:17:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46483 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245108AbhEJOPO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 10:15:14 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1lg6fg-0004Fw-U4
        for linux-watchdog@vger.kernel.org; Mon, 10 May 2021 14:14:09 +0000
Received: by mail-ed1-f71.google.com with SMTP id d8-20020a0564020008b0290387d38e3ce0so9129833edu.1
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 07:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version;
        bh=fbZHevFPK4kJ3Oy/1nhCAJSC3PFsFtZgI6Obl9f93YE=;
        b=FR2xuDqu7qY4veqL7FrLkIKjR4MerqABvZO+JGVlVXr5A6ZrcS+Y6dFIjsKA+ekGyg
         SjVL31wjcmxIjPDB/UYH4FxAQoLIGUmGixTIEdxTIeEVxzRXGy+SYQqqvzX8aNQ+ZZsH
         JEjksBtoM9j72l5xlCPefh0xZ8j3mGHTQZ9c2PiLl/DYBWhi/YUJubh1Wo35pyTBL+j1
         5uq1XivE8Ii7COxyxvbbiG8e+G7sDbrnFtAldXAiYrPNQeQpWdATXPHP6REEpmuwsuUh
         AkvmhzPPUrxpHIHPxrikphguCFmVflOAhszLpUlYCD5uBcG5W/8jOVpCndbjRd0H0ZzD
         Vadw==
X-Gm-Message-State: AOAM531IWD5iC1/Lhf3zi6Z1Np0pbSYAO6oEDntTAOEPnsgAhg3M2QNE
        G2Wvc8vr/z6adC+SpZN1PSwyHda5OPTrfP3WsVlmOC2sezFjDqRUAdqh1UugI+2rXuOHVWdvIha
        WG1wxdUl1tFZL+PFlNszX45q4zU+b47z4YHF7gkNYIINQ
X-Received: by 2002:a17:906:5a83:: with SMTP id l3mr26000937ejq.50.1620656048553;
        Mon, 10 May 2021 07:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziN7V8IF+eETtey6eCBiXKyTYKjZfq7RMKqvrr5GQJnMf4337zoLzjpbQG+k7mxZa1ZX8iZA==
X-Received: by 2002:a17:906:5a83:: with SMTP id l3mr26000915ejq.50.1620656048370;
        Mon, 10 May 2021 07:14:08 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id l11sm11223540eds.75.2021.05.10.07.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:14:07 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
Date:   Mon, 10 May 2021 16:14:06 +0200
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Add {min,max}_timeout sysfs nodes
Message-ID: <20210510161406.1b32debd@gollum>
In-Reply-To: <695dfd0f-f090-653e-7580-e45484228781@roeck-us.net>
References: <20210510131625.21506-1-juergh@canonical.com>
        <695dfd0f-f090-653e-7580-e45484228781@roeck-us.net>
Organization: Canonical Ltd
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ryNewuZSjVJeL.p+oeOWUl2";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--Sig_/ryNewuZSjVJeL.p+oeOWUl2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 10 May 2021 06:45:15 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 5/10/21 6:16 AM, Juerg Haefliger wrote:
> > The valid range for the 'timeout' value is useful information so expose
> > the min and max timeout values via sysfs.
> >=20
> > Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> > ---
> >   drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >=20
> > diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdo=
g_dev.c
> > index 2946f3a63110..b84d53a79618 100644
> > --- a/drivers/watchdog/watchdog_dev.c
> > +++ b/drivers/watchdog/watchdog_dev.c
> > @@ -525,6 +525,24 @@ static ssize_t timeout_show(struct device *dev, st=
ruct device_attribute *attr,
> >   }
> >   static DEVICE_ATTR_RO(timeout);
> >  =20
> > +static ssize_t min_timeout_show(struct device *dev,
> > +				struct device_attribute *attr, char *buf)
> > +{
> > +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > +
> > +	return sprintf(buf, "%u\n", wdd->min_timeout);
> > +}
> > +static DEVICE_ATTR_RO(min_timeout);
> > +
> > +static ssize_t max_timeout_show(struct device *dev,
> > +				struct device_attribute *attr, char *buf)
> > +{
> > +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > +
> > +	return sprintf(buf, "%u\n", wdd->max_timeout); =20
>=20
> Makes sense, but please use sysfs_emit().

OK. And maybe I should send a patch to convert the other occurrences of
sprintf as well?

...Juerg


> Guenter
>=20
> > +}
> > +static DEVICE_ATTR_RO(max_timeout);
> > +
> >   static ssize_t pretimeout_show(struct device *dev,
> >   			       struct device_attribute *attr, char *buf)
> >   {
> > @@ -609,6 +627,8 @@ static struct attribute *wdt_attrs[] =3D {
> >   	&dev_attr_state.attr,
> >   	&dev_attr_identity.attr,
> >   	&dev_attr_timeout.attr,
> > +	&dev_attr_min_timeout.attr,
> > +	&dev_attr_max_timeout.attr,
> >   	&dev_attr_pretimeout.attr,
> >   	&dev_attr_timeleft.attr,
> >   	&dev_attr_bootstatus.attr,
> >  =20
>=20


--Sig_/ryNewuZSjVJeL.p+oeOWUl2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmCZP64ACgkQD9OLCQum
QreCZA//WV4QDVPBwEjUkBJk1mhwNSpVnnXN+KP9wLFeHqf6zIBu+LFdULXUNvc5
lJKoGEXdouTk7Zp7Tfa4GMNJ+sL3AfCuToUpQmKDJaR9Hq27HF1BptBtRAPhP5rQ
hkQFc00bRyD7aG/MC1xh53R4AGIu97Wn40ZocCZh3EZk0jJnInlhR/gGqUmvqxyX
ZimWBAFP6gQt9P2HXanB5488tenH9FbbTXjPUzOJY3QcKLTh5rXmF8l2HMqE+B8K
meM43PFGuDyWK4+2O4VRkY725wrWxqpbNa9VhxYK1gjutteAaCI829ePAOt/fMG3
Wir2uH8QP7eN4Hc1AaAaPq2QEXIjW9PlMWDTfsCN9FtXMWA1nVr5hx345M0TCaN5
FQe+w2gD4yvi2aBo29xg93yHO2HXwDhHxDAq+KvHm2raf4OO/17R5KSFDy9ZTdq6
e63SSs0o1fId9TA0GE5+7x12Wlr6sQyt4HtejGqoC/NQW7u13dakwjdt23Wb2g97
S89wl5guRHVcheTtDTrmFWoVx4qOKMZfxCI8Ybp4EDPS/L9pqqQupl2P69Flpevn
p57VQG1dMLIfO8g2P2+vokrqOy3+wRVkml9W9ol6HGkQgghXGDDnRSr0T2ebEZBW
I/RfTeV9XyQ8xB2LWwpoNmNgVldjfzFJgf6lDImZSnaxXmn37Tc=
=0plC
-----END PGP SIGNATURE-----

--Sig_/ryNewuZSjVJeL.p+oeOWUl2--
