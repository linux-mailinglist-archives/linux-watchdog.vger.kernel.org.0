Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258A81E7B3E
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 May 2020 13:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2LIN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 May 2020 07:08:13 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46153 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbgE2LIM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 May 2020 07:08:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 62C621715;
        Fri, 29 May 2020 07:08:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 29 May 2020 07:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=SxWQBChLhXnrPHqeCmBO4IZDrkY
        HZslBN1SC7IncoZw=; b=m4awqB9JDpZw7mHkuvrM2/gcKJlHPxysFnTIbIxVXnb
        VFDUZkqNWe7HuSdVI1pbrA+6H4L0v3NPVT1rhX/9oIlaMDtm28tVOFbHKLH/CRwr
        cvCdBlviNGNVcLkowm4Slv6zXCNO6HFLDBokfPelQOcrwkhs1Zsx+2hjbt1cuTew
        NaE5aXmZ+fT2W9Ri3OlKL0M8rccNsJBoApkdRIGjUX/akxsXiqgJQjAc+y/M/NJ2
        rtc9cV5/+6pfHTejKOyF/BOvdlZa9wuqg0b2aI1jUUfpJ+XZLwlh2D4zwhG95y0I
        /GpLP6aL2NHpKoHJucd6f82htQVYB/mDZOIvhT2ChwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SxWQBC
        hLhXnrPHqeCmBO4IZDrkYHZslBN1SC7IncoZw=; b=iQkIKl7TCD2huV+kPTxyoX
        pakucsKYS//IHle36N+PpFReoUmruON53vh/T1mWgp4qQktuJL+DM6H8Z4/pzvtX
        yhzlvIFEepPSUS45kGXEuUE966cGpdb17bkKHYQEvBGUUnTaKU/2IfhbCIjgR3sT
        BhNLqvWuqRRVjToSXHQqA0dhiMRBMc9WbNUyliEwOLwU2O/H3++e+kESdjLyUoY6
        Y/Lk7f2sUeq7BSKSDxWKi5I/105njvbMlwfa50krJQJgeREDcQ2OeUHLgpUnnaP0
        ZlkQvnvA2izCxwkYKhcF0ZiiWDbJ1ZQYEY5WRoCCo/BTgn4uzPVGoi7oMcJEniVw
        ==
X-ME-Sender: <xms:F-3QXiVLCwHiW3iFohPv1pLT8lo8jahs2-Y8Zhjbeg-WwOsfs4l1Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:F-3QXulYZDsqd_pQKBhaAxIDg25R2iNioGkxHjnGF2UizvJZABUeTQ>
    <xmx:F-3QXmaJx22JYp0z9GToMbzuH9fYpZSrAbZ5x5XwaX20VdwspUYUXQ>
    <xmx:F-3QXpWQUmYw59fowYgL7v9M-g_-aiOCrtV4FdPQBSh8q3eJUStECg>
    <xmx:Ge3QXrstdt3sLo0l6eH_by8XeHhWKClt-j7o3SckdFkJCWzEDi5Xrw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5BC243280059;
        Fri, 29 May 2020 07:08:07 -0400 (EDT)
Date:   Fri, 29 May 2020 13:08:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, wens@csie.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        wuyan@allwinnertech.com, tiny.windzz@gmail.com
Subject: Re: [PATCH] watchdog: sunxi_wdt: fix improper error exit code
Message-ID: <20200529110805.d7q6y54vmhsc2azy@gilmour.lan>
References: <20200529094514.26374-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ca6lng7rcdaswecq"
Content-Disposition: inline
In-Reply-To: <20200529094514.26374-1-frank@allwinnertech.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--ca6lng7rcdaswecq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 05:45:14PM +0800, Frank Lee wrote:
> From: Martin Wu <wuyan@allwinnertech.com>
>=20
> sunxi_wdt_probe() should return -ENOMEM when devm_kzalloc() fails.
>=20
> Signed-off-by: Martin Wu <wuyan@allwinnertech.com>
> Signed-off-by: Frank Lee <frank@allwinnertech.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--ca6lng7rcdaswecq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtDtFQAKCRDj7w1vZxhR
xXMOAQCjE+1Rd4EClkmssnyOcaObsF1+kumPmeztCrmYIRyK7wD/Tqi0pk8lCIsJ
iFncOmTNd4SD6CZPBKtkhym2VAJ70Qc=
=Xr1z
-----END PGP SIGNATURE-----

--ca6lng7rcdaswecq--
