Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF763FFD22
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 11:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348788AbhICJbY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 05:31:24 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:42947 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233770AbhICJbX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 05:31:23 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id 424CF2B011C8;
        Fri,  3 Sep 2021 05:30:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 03 Sep 2021 05:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=IGEBOEErSNulXsOnxM80EaSXHLJ
        wTSCF3Uvi0vxzSpM=; b=KOypvJVTjCFbIvSTewqQxBcV7wwcO0+BLpDP6HwP395
        RVtQnhtg9S8h5f6yYoZ1PAqFiNltgwk2WCTtcDcYCbbMVMmkVEp52jufM3yNqoet
        ruTI59FMc4q7evuwfXRRFngkcy9CY0o9SKNFg29Wt85ZyXA3kEe7TVUZHBn0tf/9
        I7BjJOEI+4fPWGq4n5a0H5JJpQz0m2yrSGnNIdPodzq5GWscCHdjGbiPQdsMvVsJ
        9zRHTIh78sfmR6iBNMrU/4G+pLsgdyVZQVumwAgGGYiJth1STDBLp/Qtn6Z4b7QS
        uUQaFn/A3yZBC4E6aj8+0s3FJBaztoazLKzY4WP/QeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IGEBOE
        ErSNulXsOnxM80EaSXHLJwTSCF3Uvi0vxzSpM=; b=JPanbmDDARGGbiYb/3Uz12
        /7iRX9j8aoiuLkV4dWdyNAzQuLIqk+Z/SsMXOK8y21O3oK/ylgCqPYR1eR6HItXD
        dAQl2OwXidOhmUASuMuxCYPQLuJ5uRcsdua7BKzWgaBnmyxFdcuPvQ5Sg9q+xN7p
        dp05foMvZuPc3p718G90mkIygEErg+bdO8pYcJLbQjep0RRkLGyjUWpzP8dVgX1e
        P2uI4B+8C9vguu41QMasQdja+6xk2m4e6XY7hBbbJdDqU9ujj0naxeRPxA5wcCrX
        SeKOnYDreNJtU5HXampwH+Jv1E8QQE/V+7EhDfp96GVsqgelXCw6lzDMaONE6Kew
        ==
X-ME-Sender: <xms:LusxYSN9-_EnEOANz6ur3jOeOJGcsJWOFetBsO9HCp7wJ3t_fDT6dQ>
    <xme:LusxYQ_Wu_joeDMgml3fwUZOsRthXHogec1wzvjkUHkrGebc3A0vWGiMdH49vyt5W
    dOGDvyLy9APg77si-Y>
X-ME-Received: <xmr:LusxYZT2f_nfByrLBRIXQpIEeH_osDsf7LtkH-bx-PGpN9vk6twqiW9aj2iZb4vf0ZtB67syqEOtGTdsjIJwJeolQgCuhNybUrHr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LusxYSthWCA7vC0WaYmVl4He61Rt1ryrAjSQpx-FYpFXrX664kaeRA>
    <xmx:LusxYafF1UaY6HXZ83qI2rVXG0BtGqkdK8ThBOp-DlgvKauKRihF3w>
    <xmx:LusxYW3Oc8FX2Oyb60oemIfr0A2IDqbyHsUcJgfsP6oVKLns7BLYrg>
    <xmx:LusxYbUP5Wcl3eWh5w6jxQDmc1DJbIkZlE2CJS-NTA6r-aoR9RnTFqK8M0A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 05:30:22 -0400 (EDT)
Date:   Fri, 3 Sep 2021 11:30:21 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: sunxi: Add compatibles for
 D1
Message-ID: <20210903093021.zhap6lriawl6nfgp@gilmour>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="honha4p7n5kpn3m6"
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--honha4p7n5kpn3m6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 05:57:49PM -0500, Samuel Holland wrote:
> D1 keeps the same register layout and clock sources as the R329, but it
> adds a key field which must be set to update the watchdog's "CFG" and
> "MODE" registers. Therefore it is not backward-compatible.
>=20
> Similarly to the R329, the D1 has three watchdog instances, and only one
> of them has the "soft reset" registers. So that instance needs an extra
> compatible string.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--honha4p7n5kpn3m6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTHrLQAKCRDj7w1vZxhR
xRa4AQCLTdTXNv7OZZ32Xb+U167vFLcwDB2EKEnGw8dRBKPmYAEAxVI7iO767nSs
h+rUkjC5Lk3Wbonwx0IirJwiM26EOAA=
=3tFL
-----END PGP SIGNATURE-----

--honha4p7n5kpn3m6--
