Return-Path: <linux-watchdog+bounces-2731-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3DA144F8
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 23:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1E327A0537
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 22:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775AE22CBDC;
	Thu, 16 Jan 2025 22:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOUhFgNJ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD80D22FAFC
	for <linux-watchdog@vger.kernel.org>; Thu, 16 Jan 2025 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737068334; cv=none; b=M2bgNMDRMmJgmVwCHIYbhgYyyyunFGLO1DEjiCsqvl7BTD5HgI5spxMA7Y4en7q/ANouOoa/U+ot7qpyvpGimskSFdkm/PFR1APuI+ycvsLRffWIecVKpDBKCIDHj7GP99wtOALBbS9gx+mY4LxF1EtWjXEalumC3E0c97FXd5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737068334; c=relaxed/simple;
	bh=g13QriG2HaYgqb0uLffYe8D5Ap9JtELmtfDRmSibjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kt/0PULZDynNVf6BZoCBd3Q8HSIXSrhMjkv4aWFvNfe3Yb6syoLyhyLUBR6ElDrb4VUnip+myphGaTt6ajktw8YC5PUYbZ6G+ITpC+m66OUd2GDvRAvXjU9r93RDfIWUK1oXxcryopD7Vb5lIQV5PGfD33nv1XDaKV0esCBfims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOUhFgNJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso2209547a91.1
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737068332; x=1737673132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvMp8UJ+AUZmpf/2T1YDxrAGfWL2IguTr0D7rYDEuSg=;
        b=QOUhFgNJ2+0ON7EUYK9O6n6TpDSOx1WMrJ1BeQBLsBAbdUxBgtaLXHxYBezNng3qYg
         FlC4TclTNR4ycZ4SI63i79aHhrqA0JLjrhy7T1YbwzaugaxnucdbeD9shig66lSsO3QO
         qXGrTyISRdffPxRbjm0Gxhip/UvgYlQxGLvjmXaMK/per2Ei0gr0qtREg+nua4Ku0r6h
         mT2ChIRCpM1uizDxIPCBmZWTusgQsFW0mOif8SDEPGWQ1N47PYHt4lO0SqX72Ch14sli
         aNRnmMf1uLhhK1+CCneJEGqUNArsWrNwEi499HGEzK/ekaHwCIdISvlsFqDyv1LizxkH
         eirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737068332; x=1737673132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvMp8UJ+AUZmpf/2T1YDxrAGfWL2IguTr0D7rYDEuSg=;
        b=fJRcE0Y6vQUtY/h4wMfbB/3GByKlHEblw5yh41xnY0pzG/cCF8J3VoMNFsE6eNTo1U
         Maj/ex/wEoHKbzwI51UH7X8l3DxDLnSrQWSvRBLZiizZNYTl4n8eY+n1P71/QRJU2Jjc
         n7ZkqVdfpTtjH6h/uQeZ5o4im3TYSGg3rl2xJ1cQ2Nv47o5hXgj8vQ62x2D79HceYW2t
         wKp6FuY3wOfsiNZ9OTcFYgxCaIUWZMoWvU4UpxOgU7JNyEUgIxVOqBl/4Ye/pKfwszTw
         8/rzEJxY6kz1Ri7ax79/XHVE5ms3tBmCsozIjGjY0F/QCNoXxQt+iem9lT5HW+oN1iv5
         D0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzal5qd8GYSoejFvk5Jh4ofXCaI5R+TkhmDwWRIVoQ7DSqlw69jMv54cH+ZHuAnvL+O7TSh+aMGLKD1Uq5fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VHeP2trfST0L4W3KbD8mLaB5jKeU1CA7suQRhGC9NC+z+DBF
	b3ZyXUDUh8FD0gFS4ExCB/HIX05FB8DNtJ6+pjy+rnXIxB1Gs1hlWZO7yGAYUw==
X-Gm-Gg: ASbGnct7Tu8kONE5uxuS4tSC84mWacrOtZKkifoPa3tSnCkB1F7bj6UAJ93lIcyFAih
	wp2/I/cQm+ckocXo4yMjGvpoklHRzm0jsj3G/nIlkFpLRuRAO37IzG51+SNAGld0ur+Rab+X8Lt
	AbL549Ra7kCs4awOpsrUenwVAT8ui7zwN+ueyU9bfrwv6FOHYdMv+zS0VmmGu3K/ODlOyUdfZ48
	epvoHio1pRB5tfnXH3X37tR4fQFEyTY9gYlbbjIQ7T1OGMG0jxoWnWXUmQyQVq9lj8+1rYTdGH6
	midFgxhmAMkusw==
X-Google-Smtp-Source: AGHT+IHI0gnCSzyJPMRPrLaAscBds4qE3vC5wbmKSUGCK9b/EKZJbpAOYjrqiqEA0exBtUcdYrt1Uw==
X-Received: by 2002:a17:90b:38ca:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f782d306dbmr434742a91.22.1737068331992;
        Thu, 16 Jan 2025 14:58:51 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77629bf96sm715296a91.36.2025.01.16.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 14:58:50 -0800 (PST)
Date: Thu, 16 Jan 2025 22:58:46 +0000
From: Benson Leung <bleung@google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org, Lukasz Majczak <lma@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] watchdog: cros-ec: Add newlines to printks
Message-ID: <Z4mPJmbBXqXkfoX8@google.com>
References: <20250116224605.110870-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pw379ZAJmMFLjC7o"
Content-Disposition: inline
In-Reply-To: <20250116224605.110870-1-swboyd@chromium.org>


--Pw379ZAJmMFLjC7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 02:46:04PM -0800, Stephen Boyd wrote:
> Add newlines to printk messages so that the next record is more easily
> readable.
>=20
> Cc: Lukasz Majczak <lma@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/watchdog/cros_ec_wdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wd=
t.c
> index ba045e29f9a5..716c23f4388c 100644
> --- a/drivers/watchdog/cros_ec_wdt.c
> +++ b/drivers/watchdog/cros_ec_wdt.c
> @@ -58,7 +58,7 @@ static int cros_ec_wdt_ping(struct watchdog_device *wdd)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_RELOAD;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -74,7 +74,7 @@ static int cros_ec_wdt_start(struct watchdog_device *wd=
d)
>  	arg.req.reboot_timeout_sec =3D wdd->timeout;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to start watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -88,7 +88,7 @@ static int cros_ec_wdt_stop(struct watchdog_device *wdd)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_CANCEL;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)", ret);
> +		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)\n", ret);
> =20
>  	return ret;
>  }
> @@ -136,7 +136,7 @@ static int cros_ec_wdt_probe(struct platform_device *=
pdev)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_GET_STATUS;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus\n");
> =20
>  	wdd->parent =3D &pdev->dev;
>  	wdd->info =3D &cros_ec_wdt_ident;
> @@ -150,7 +150,7 @@ static int cros_ec_wdt_probe(struct platform_device *=
pdev)
>  	arg.req.command =3D EC_HANG_DETECT_CMD_CLEAR_STATUS;
>  	ret =3D cros_ec_wdt_send_cmd(cros_ec, &arg);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus");
> +		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus\n"=
);
> =20
>  	watchdog_stop_on_reboot(wdd);
>  	watchdog_stop_on_unregister(wdd);
>=20
> base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
> --=20
> https://chromeos.dev
>=20

--Pw379ZAJmMFLjC7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ4mPJgAKCRBzbaomhzOw
wm3iAP0Z7Dg/5jcSL4eji0cptrtvNWyhVdS51qVX3Tnlw+bADgEAjjcwFG7aUqYQ
ahmXBLry1zvisbI5crLJC4Jadbo2rwY=
=ppxp
-----END PGP SIGNATURE-----

--Pw379ZAJmMFLjC7o--

