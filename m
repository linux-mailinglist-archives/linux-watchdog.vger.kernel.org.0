Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6435D3EFFF9
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 11:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhHRJI5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 05:08:57 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38955 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231719AbhHRJI4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 05:08:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id C6E882B0094B;
        Wed, 18 Aug 2021 05:08:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 18 Aug 2021 05:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=u9bG+4wNqQW8Q6ftF5wHQm+W0Hy
        eApI0kU8bT7jSU/c=; b=m1Adjwfyy82QgScHp5ILIDVbEAsjmFORFv9pNabBwPJ
        F1/P+tk4/cU8T3soyPdWUKm4JQ/iq21hmkUwP1pAlKaA7P3cVrAgATLPi0hczis8
        UKs86hdgn7GnPslnnFqoJdLgQ96c02uDzPcsiaeeH8oocsH8Pj90PfDEtkrVj5pH
        Ndn6xSVUIjVeKIYNc84kt7Nqdx7Dg/f1fg8kRTvfKe7+60PUzkZTO6BneE7fsRSd
        sKoqPANqKN+mp5D1SJn+qbOoczQHr/MLq/RytpzIRceLjfRHCzpHvFrqm6EqV1kw
        1BDpZ5dchtjnRZ1Rs6Xs+eQCDOy6Sx7uehvJAWuCeEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=u9bG+4
        wNqQW8Q6ftF5wHQm+W0HyeApI0kU8bT7jSU/c=; b=YDs2dIaOKPv/sslas828D5
        kvFzgLVrgGzXTYZ5oXjIaLf4ddCH+L756U2tcFu5WTXMRniVIQV8ERt405RfMbMc
        lXc/gi9xKEIkGuKA8RtvvG5AlIoXdsUIRpr5Sh4rdvoL/dJxMZ6jIUBOYoMR8yei
        Go5smI8B0r7DzmUzMoQosTplEZOO7rT++WDiheThaJmAVpZs3WEfVbnhUiBIfmMh
        9SxO1O6nXlrTfKKJ7hYnV8yzd8Vd7w84Igx6o6Hq0aa12XhhO78+BDFHcDO8Oocf
        2+ICa5PtP8G2Oa1i+Gj2JAZQqm0VTe2bIoK/kdRKRQXBZmzlR1wMyFyHKPiiACFQ
        ==
X-ME-Sender: <xms:_c0cYSHxGm-VlMJWwlGdTr-GFhemQ58ALHOkOWMbUsy-J_lmxTnjPg>
    <xme:_c0cYTVtfrOzspPvJdEwYd2FVZeogHDuBd8q4xFJAXvVVogmkIavMeKymDpimpHuu
    bEYrsIvk3pOmHy9hh4>
X-ME-Received: <xmr:_c0cYcJ1Lp3BFCzz4vqD9nNhDsODUSF9mH2xK27OVGTgKVc2UNiLMQpLvwNkY_ek-w1tvezUFwIYxpxGgxicT_T600giK53InMIv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_c0cYcHbT7oAWrqrbf9Jsk4UtW4NCvgs98uoyEhJzKeOF1BipxJscA>
    <xmx:_c0cYYW7n0Oz6Jrs4CLzSFOW2pU7cA_tt1rjLipTLoheDEDuOdgE5A>
    <xmx:_c0cYfPx_gIG2QwWSChIAjdX8zT9KrPH_fYScK_a6T8JxYtuGcEGbQ>
    <xmx:_c0cYcRuh_4RYZNrCOx82xJUDI2MPJa54_SfA2IgHD01gCZlOf1pZ-MeHMU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 05:08:12 -0400 (EDT)
Date:   Wed, 18 Aug 2021 11:08:11 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] watchdog: sunxi_wdt: Add support for D1
Message-ID: <20210818090811.fl7u4jtxh4ko7j3c@gilmour>
References: <20210805045716.46141-1-samuel@sholland.org>
 <20210805045716.46141-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4cs6fzq5kbpskuj3"
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--4cs6fzq5kbpskuj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:57:16PM -0500, Samuel Holland wrote:
> D1 adds a key field to the "CFG" and "MODE" registers, that must be set
> to change the other bits. Add logic to set the key when updating those
> registers.
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--4cs6fzq5kbpskuj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRzN+wAKCRDj7w1vZxhR
xYLRAPoC8/IXiSXIcg2lYUl8qma4+EbErj5NI79KPiJaHThQRQD/Xiy5hmEcNhit
wILOH0oJ88MjIB57FIGoZGAHDBETIQg=
=999a
-----END PGP SIGNATURE-----

--4cs6fzq5kbpskuj3--
