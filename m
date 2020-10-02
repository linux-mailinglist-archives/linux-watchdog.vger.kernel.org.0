Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5326281664
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 17:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388093AbgJBPTe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 11:19:34 -0400
Received: from www.zeus03.de ([194.117.254.33]:39992 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBPTe (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 11:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=jRBYqhHs9MUo+I345CM5zWv3GEXs
        j18napmugZrEyZo=; b=dZ7w8Dlkp2T+HpY2X/1ppWsCRdmQr/+XuNNtkcmVPErG
        Gr0YVpfXax97Oy/hEVyAV0q1OxPJFwgLNMJBY+4vYJZXlLoLGVpzRlkEBXf/B1yR
        u0LASyvGKvz1m3z6C7LzkRnEmf7OTWHXoAOcnX7xRy7ZI8BsvZ8WAQZEt13vj2I=
Received: (qmail 1420813 invoked from network); 2 Oct 2020 17:12:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2020 17:12:51 +0200
X-UD-Smtp-Session: l3s3148p1@cQ/1kLGwvsQgAwDPXwkAADD+YGrDqBUE
Date:   Fri, 2 Oct 2020 17:12:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-watchdog@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] watchdog: renesas_wdt: don't sleep in atomic context
Message-ID: <20201002151250.GC1447@ninjato>
References: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline
In-Reply-To: <20201002150944.9696-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  	delay = DIV_ROUND_UP(cycles * 1000000, priv->clk_rate);
> -
> -	usleep_range(delay, 2 * delay);
> +	udelay(delay);

I should probably add a comment here explaining the situation.


--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl93Q28ACgkQFA3kzBSg
KbZU7w/+J5wDYBQWBz1IkgOLMXJINpjqVPOCvJEYUrioxPyrN8iya5hwFA1uFl6r
7o/bp1o8FtQ/+ZyF94jEijgNKZqDvV6UG8huzv1uQ1S3Xq9ss4bXzx+yEIAPehe2
bHjQHZ9+pd3MZOTiSis3PWfmPMxsLL/IXgKBgLITQ20CM59ADrtg28mvUBHQmr/y
XWyhElYQ9xG/15WgM03Lva0ExsIV0YUg+LKj39aVp0EnWPDqGuScEKwzKHNfO9Xz
SzXsyOujerFeGdUzGxlXoqMs595ARq9Km46g3dn2uRuA/XnNTsNXkGY97wR6W296
zaxdNyZ61HXi/4MULRTKzXtsY8hGiRfGyqf8m8pTPrZmTCgLBEMk+VxUts6KHNlj
woWQ/rinvE9oQFe1oaepdefFF92QV83k4B20B7XNOtFNjOm2GEpAF5CxgSs9f7G3
6KKAK5gM3P7G8MEfFL/bdlrYhLN8QVNuPbUjM0KOvh1sc3G6IbR4Hnl6W6EOGJHJ
zsH4+GS1OlbS6nTFcqTyBMmOVguRmfUK2T78fxNQamoV5Qz3OeQ7OjRr0eOdnZI1
SzaonlIJF7VKmAKH5OhoCoCCBUKenaJfGNZvo9cC4W4hz7F/LE4vlJwQQRSLjEZU
i/vK0QOEOErz2OGEMTsxawS8zEuXUgzGMAz7z0UR6pcFoMxnMfg=
=aSd7
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
