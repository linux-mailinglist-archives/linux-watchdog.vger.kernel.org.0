Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B300243CA58
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 15:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236897AbhJ0NLx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 09:11:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53170 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234339AbhJ0NLx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 09:11:53 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D986F596;
        Wed, 27 Oct 2021 15:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635340167;
        bh=nSBBdtY5RhYIZtueCATbtovl6jxRm2CUdgwXLZX9OJg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GyENAem8SFatgBxmn368G5y7yWnjGEgs1MOTSNCdRKls4mwtdQ9vF72N+/HHiZgK2
         GM+/H6yUrXgjStMuWcf74ZtUFmQto6fHeKKNMHgElJLaBmy92RyX7SY8G28xvXttIt
         fFLjquHqFVMuIfmsOIct7jNY0hOWYCdBufsfnDaQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dc4e3692480a136f5c2efdd38862ff2c8741f93c.1635338097.git.geert+renesas@glider.be>
References: <dc4e3692480a136f5c2efdd38862ff2c8741f93c.1635338097.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] watchdog: rza_wdt: Use semicolons instead of commas
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Date:   Wed, 27 Oct 2021 14:09:24 +0100
Message-ID: <163534016415.1184428.1151584448808244621@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Geert Uytterhoeven (2021-10-27 13:36:03)
> This code works, but it is cleaner to use semicolons at the end of
> statements instead of commas.
>=20
> Extracted from a big anonymous patch by Julia Lawall
> <julia.lawall@inria.fr>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Yikes, that's subtle, the fun you can have with valid C code ;-)

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/watchdog/rza_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/watchdog/rza_wdt.c b/drivers/watchdog/rza_wdt.c
> index 7b6c365f7cd36297..fe6c2ed35e04cc4b 100644
> --- a/drivers/watchdog/rza_wdt.c
> +++ b/drivers/watchdog/rza_wdt.c
> @@ -189,8 +189,8 @@ static int rza_wdt_probe(struct platform_device *pdev)
>                 return -ENOENT;
>         }
> =20
> -       priv->wdev.info =3D &rza_wdt_ident,
> -       priv->wdev.ops =3D &rza_wdt_ops,
> +       priv->wdev.info =3D &rza_wdt_ident;
> +       priv->wdev.ops =3D &rza_wdt_ops;
>         priv->wdev.parent =3D dev;
> =20
>         priv->cks =3D (u8)(uintptr_t) of_device_get_match_data(dev);
> --=20
> 2.25.1
>
