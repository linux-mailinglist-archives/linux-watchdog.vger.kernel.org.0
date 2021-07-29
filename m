Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D3C3DA2F4
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 14:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhG2MS0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 08:18:26 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:37875 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236916AbhG2MS0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 08:18:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id E61AD580D2B;
        Thu, 29 Jul 2021 08:18:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 29 Jul 2021 08:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=c
        u23+PZRqrAy/6j8rc1XI2CnzOsUmITZAfnFUZNm5jg=; b=LCdYhaZxjmT6YovVi
        cR85cwO5zt910fZyksOL8KnNtJ0AZ2n0o3K/ScXxburHdly3dTUx6e/gYdvRUyou
        esAZEopVeVEwzK1ZBB5gN6Of2KADfpYVh6MoG/cW88kIrPcAmddimMdo1OSGZD3x
        uj3t8VcBY0CC3zPoKyhUTYP/d8rpC6FX+xBNP3Y0NI4fdx5ePMeXDAPHRwLE34W8
        OPGwG6TVtZqYuxQd0F09aCfLliWJJsbewgUXvs/3l8rervQA4aze0P4J2KQS5hgo
        htPhX2Y+OvKGob0imm58Y1BJl3j2AIXx0dRmHWY0dn6Ascsuf8uffO7LkZXns1OZ
        hslxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=cu23+PZRqrAy/6j8rc1XI2CnzOsUmITZAfnFUZNm5
        jg=; b=rpe92drOK60Ux41Rj7BmQJ9c8u1gvK8i1QItj/H+7MEtms/YNp+s0rD3G
        GcC1yt+DOePiG3iacZVCVvkpQQldt9NbdZrHvxOigEjs0FRPETIGgUinIDioNkEk
        McYH8BvDHOiZuPU+7YUKbj9ldXUdlhYrAUYNN00j606UFOISR8MFLSP8qo0fMV2I
        aJfZ8MqxAokdiB7ltjWJknk7QlgquSd7rYNNmuq+nfDQ3hSF4KgyUfy0obBzbSGD
        xr4htAahVV7YKyVKBSFlOS9/ywTJkh11fqy1IAuFpB33/OuiaMvz41IHSNPB+oao
        dgeAZ2UVFEwHA2CzIj5dRBy8oznVg==
X-ME-Sender: <xms:jJwCYc6s8wndG5bqI19RtFfgbeOGJy2Hf9IZMV2Og_09v9j9kOZu0w>
    <xme:jJwCYd7D32OvLW9_X3F2Ii6mOCsVZHYnlJr1M-Aalm7pQGZhUj2gaVQcgA8JT1WIk
    kbArgtEHlNxzOtwBv4>
X-ME-Received: <xmr:jJwCYbcxSJzfC3Ef2AXUes0VZgfvyWsXqyKPuwTRVJzVsMPT3jOOZNpPGANDxwX6X6b_c_gTqSDJPKE27hbf1ptbSlOK1cB9g8Aq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheefgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jJwCYRIB_zIR6Emy1hOEceywGXW_DHl8oT01irWlrLPoZFB2cnUIww>
    <xmx:jJwCYQJlZablBP-zyxdXAUnb_EqGUUJ7EV5nVNjor0XsEM5fK4xCrQ>
    <xmx:jJwCYSxqqkzJwL43kX3X_7EUU1FWAxsHnFfPRTHlZIQbcIY4Wejaug>
    <xmx:jZwCYVWK_kkvvRTvB4MvsqKY9y31RmWU09j4s3ip44CUxkqaL__1Nw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 08:18:20 -0400 (EDT)
Date:   Thu, 29 Jul 2021 14:18:19 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: sunxi: Add compatible for R329
Message-ID: <20210729121819.oqryiww4mzow3kev@gilmour>
References: <20210726035143.53132-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726035143.53132-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Sun, Jul 25, 2021 at 10:51:41PM -0500, Samuel Holland wrote:
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
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a=
10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a1=
0-wdt.yaml
> index 9aa3c313c49f..853ceb1b7c0f 100644
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
> @@ -33,7 +34,16 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - hosc
> +        - losc

So I assume that the expectations are that hosc is first (or the only
valid choice with older SoCs), and losc second?

If so, we should make it clear using two const instead of an enum. Here
you state that on older SoCs we could use either the hosc or losc clocks
as source, which is incorrect.

I guess adding descriptions for clocks would be great too.

Maxime
