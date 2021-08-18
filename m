Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8C53EFFF6
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhHRJIi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 05:08:38 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:43543 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229864AbhHRJIh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 05:08:37 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id BC56D2B0091B;
        Wed, 18 Aug 2021 05:08:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 18 Aug 2021 05:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=6ook4MNkbbxDqFEkYPBEIeliWHD
        k8Xp4O+ulRq92OBM=; b=4hwpTJmibMI/Fr7KaOeRB7/okcgFkxI2BcI+Ip8Jzwc
        5vrKY1W9DyQNUZxx+I6fnyYEpF5cSOP/5zJw+LgAAFmeWQdB33kdxKmkwSvp1V5E
        r0LGnEd/sFR8Y3wg7U/tCWE5vrr00vlbugt507rACZw8H5o7CUOqdY6fqsCajwPj
        c8ySOHu7PmAJL6Gs2EaQcj/HbmgbwlcepjqVZ4vNYqv9ZkLevjGGT7IO3GU5OUM/
        reD8+JL8XSCxEChGPEiNjTLsENncU7q1V49HNQBkTOsNThgw9AbmaobcBDEVo6cf
        flXZ+2IpKy0wHt4cN+4BxpE0PAnHHm3m9mTlQrXj+ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6ook4M
        NkbbxDqFEkYPBEIeliWHDk8Xp4O+ulRq92OBM=; b=RsA5oxGfxq2CVjdnEH9JZ3
        4FK+CaNIf+d6916cheUqytS7JdNIZZLX/AOEkLaoYpOt3ndIAFxqnJERbcJAD95F
        kjXS+5mUN+RlJia3QU22hI+VtnQNWJcDKR+KMZ8xvJ+0cT9dSFsfxMP5R/9rpvTo
        VL5KpQPjKORiOCCnlV64zyzoz4kGC0N8WP1Y3pLooQuaR3bhQhPrVz9IMfGAMCXe
        jxigS6r+ZYVGfdr7SIvqQqMDN6HSe76/x8Om0uODdMXYWBTy4RugBRUef0rYiYwW
        gTCKcIUQ+GPi56WrSFbNq6vt9ngbW+3hCPi9YyuYOPVK3Fpa6hPA5Ia0JjWjeUoA
        ==
X-ME-Sender: <xms:8M0cYZTy6r-Ht52DouEqmNkKZoWJnNfC839WRbw5tbbtkPUCGJH-LA>
    <xme:8M0cYSxdYA25x75VLozkhb3d7dvJ6Hd3wS1RecyWLiZu2z3TGgyveEMEmYgtDr5XV
    j1_KyjuCTWraH6PYs0>
X-ME-Received: <xmr:8M0cYe2LrUmBCvVvaJ6qK56E0BrARiZyw2OdYF6Ae3QDgt_xgz5CymelMqMQYJd0slzg4Ek_WZ57JovSGO4GEu8jr954GLmGpuij>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8M0cYRDu-hMzrhLGhUSliLIgIHPxfT8cIuJUDatJSz72QyFDVlZ8tw>
    <xmx:8M0cYSiBvYbmfXmCnO397uTtAA8iiYFfyALziMc1ItivMZ9azzMpBQ>
    <xmx:8M0cYVqKgOLdnm3A25hUo65i1UcTi2U4CFd7q_xDBvPyvsam7eI8DQ>
    <xmx:8s0cYXatpsdOwsE9ubrWuKE9AUfWBdh5d3qpJhNZkTYE7gt9j5KXOB_N82A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 05:08:00 -0400 (EDT)
Date:   Wed, 18 Aug 2021 11:07:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: watchdog: sunxi: Add compatible for
 D1
Message-ID: <20210818090759.defewtmx3l3ku3rd@gilmour>
References: <20210805045716.46141-1-samuel@sholland.org>
 <20210805045716.46141-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bpctm2rk2nphsa2v"
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--bpctm2rk2nphsa2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 11:57:15PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--bpctm2rk2nphsa2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRzN7wAKCRDj7w1vZxhR
xYgzAQDAb+DgUneWjV0G22QdPTXGnpq0NkLpcPcAhyZCiPrr3AD/efKGbxKNrLy7
avaTFG36E8DVB3AG3GxBogPcwmGwPQ4=
=47S9
-----END PGP SIGNATURE-----

--bpctm2rk2nphsa2v--
