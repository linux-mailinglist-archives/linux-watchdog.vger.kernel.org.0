Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D0B3EFFF3
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 11:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhHRJIO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 05:08:14 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59265 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230412AbhHRJIN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 05:08:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 7458E2B0094B;
        Wed, 18 Aug 2021 05:07:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 18 Aug 2021 05:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=z7ZxsuepG3y8/7tCBq9V+CXM2sV
        9UAdzMVufzaRE13k=; b=Edlj8+3EALgXlGDt/c0FFAzN16mWjgVHIVPBd6D7AZb
        FQLnqcYIirILU73d7SerLVWsiVNHE8vPs9mHJUJOEcFzfAYtQtxA1GZRgrnMjHKV
        /xB4yhl8/vL4PCC/8+cCqjnjmjbSaGayS0cVlkJVBNlz7xk7aSmI3ynf7vhz60LB
        U22K3+8bmlSl8lEggpjf617/dLwt7X6hCAHz6lueGluIU/LQmNSpr+uo94bqGHak
        9klMALhepCdOccROUin0a+4MKHWY8ECUBN7zLmTYJ1JyZePePDnnsveM6cZL3O8x
        kLU903noWfVl7B7wDJPuYHiC2N78s/w7BTBNS4layNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z7Zxsu
        epG3y8/7tCBq9V+CXM2sV9UAdzMVufzaRE13k=; b=iIDqJv8vFvUmdMHfHICawC
        T9+GMiZ7jmgZnQez3LVGbSJHMRX5oCSbwndYpOPjFOptH5evus3eJHTLMKiWkPxN
        TXpsW2g72GOY5CGgg+NCr3YRCVIVUwy2c1hebCI4/Hvt/iKYeVLlrCIF+d9ViMqC
        1rXO6J5Y+NXu5OJhhxTtooPgXjHkMj/E/mio7DdY2ivq0/MHKrzU5QRhmAkmzRql
        gjF9fFrV8cUF3YBzZEkPAbYWQJGooSyBeWl2CLOzlNRyb4DB4TlekSXHyL6GpV9r
        xOx/tiM6Qp6123DK7M/uNv6oP+LeoKbtE8H19fdWvD5NYIErfHKSiqWDEpnEi8Ww
        ==
X-ME-Sender: <xms:1s0cYeSY1VoDbvj8v1hwYiTkSN_bdm-p6ejhsshfocOJWHAPSNgYaQ>
    <xme:1s0cYTwNdYap25FigqYS6YAmK-H88VV8XHGod-hplOPmEl50w8pXMhctRH1UKftZR
    Ugz2UtlgNaAB7GJX1w>
X-ME-Received: <xmr:1s0cYb3iapy_85xh0Q6EAruoublXzVjY3xVzA2Rnoh7sKZMi7Wy5h52SzCEv8iyGJYhONrk0-T0j0BNHzWGoY-0oO3JNWfL3brm->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1s0cYaDEV9KA2JuQWiv-DnuUBNLx_3dMYTFWXQndvDWcyG7j2IJlpQ>
    <xmx:1s0cYXg8yqki-J9Y-brp5tjEz8uJAyBvzliiiXyvAbqP6nOlORVtcQ>
    <xmx:1s0cYWor9kybvC5ygdOBtG-EHz3u-he516QYVleA3XNXFnJVww0cwA>
    <xmx:2M0cYWNNZ029ZIW4uQRJX-a2BmU823_XEkUHg0r9Waf1MWx42zzvDjmoUc4>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 05:07:34 -0400 (EDT)
Date:   Wed, 18 Aug 2021 11:07:32 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: sunxi: Add compatible for
 R329
Message-ID: <20210818090732.wdickyw67oc4zqpt@gilmour>
References: <20210805045716.46141-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eamo24t6pkxxpznb"
Content-Disposition: inline
In-Reply-To: <20210805045716.46141-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--eamo24t6pkxxpznb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 04, 2021 at 11:57:14PM -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
>=20
> Since 24 MHz / 750 =3D=3D 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
>=20
> R329 also adds two new registers, to allow software to immediately drive
> the SoC reset signal.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes v1 to v2:
>  - Switch from enum to const
>  - Add descriptions to "clocks" items
>=20
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a=
10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a1=
0-wdt.yaml
> index 9aa3c313c49f..8fa5b0d32381 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> @@ -24,6 +24,7 @@ properties:
>                - allwinner,sun50i-a100-wdt
>                - allwinner,sun50i-h6-wdt
>                - allwinner,sun50i-h616-wdt
> +              - allwinner,sun50i-r329-wdt
>            - const: allwinner,sun6i-a31-wdt
>        - items:
>            - const: allwinner,suniv-f1c100s-wdt
> @@ -33,7 +34,18 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: High-frequency oscillator input, divided internally
> +      - description: Low-frequency oscillator input, only found on some =
variants
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: hosc
> +      - const: losc
> =20
>    interrupts:
>      maxItems: 1
> @@ -44,6 +56,24 @@ required:
>    - clocks
>    - interrupts
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun50i-r329-wdt
> +
> +then:
> +  properties:
> +    clocks:
> +      minItems: 2
> +
> +    clock-names:
> +      minItems: 2
> +
> +  required:
> +    - clock-names
> +

We should also make sure through an else clause that all the other SoCs
have a length of one for both clocks and clock-names

Also, it looks like you forgot the patch to enable the compatible in the
driver?

Maxime

--eamo24t6pkxxpznb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRzN1AAKCRDj7w1vZxhR
xYXsAQDr5ekVM8uJrcHoLhj+ppOK2mKe5bJpApZXEwpgvVkFyQEA9cQNKQuAw8iE
ndCLVdSf+DZW+tJkbTU4D1eAS22W5wA=
=tBH9
-----END PGP SIGNATURE-----

--eamo24t6pkxxpznb--
