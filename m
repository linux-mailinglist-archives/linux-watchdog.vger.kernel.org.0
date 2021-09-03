Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26D63FFD1F
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Sep 2021 11:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348830AbhICJbM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Sep 2021 05:31:12 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:60989 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233770AbhICJbL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Sep 2021 05:31:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id F33402B011C6;
        Fri,  3 Sep 2021 05:30:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 03 Sep 2021 05:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=1pwRinPBD8y1/Ty20gj5OVt6w1t
        NJRf+OuIqCVAiZlI=; b=ddMDOkjPziPYXJBQwJr3521htK0sshh0ctScBPr2Iht
        1ZOXdAMBc0PbHqAwqOpLpwebg/LRVX9K7U5yaD3jNpIrhln2c7KQ4yhdPrOqXs+x
        C+2J/vzsm3VBToAIPiqaCHeVrCCWwmNXdfPHhVgKydBTcaq8UvmGgjrsN1M43dpU
        ykVbqJGKd098oo/aXEfwGZUKt+HLpthPVl+LVMBmuKv/guDGsZI/+aQZNn1mS1Mv
        CK/LIbBC881kkXyunp0x71FN1pS641f9cZimFdBccFL0v8jl/+jdp56OxcwI/Ly0
        tuZ+lxHfTiqmR/4ASl+sEhThBrWLAnhtSuPydync1OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1pwRin
        PBD8y1/Ty20gj5OVt6w1tNJRf+OuIqCVAiZlI=; b=p3M5GaRGrm4iNXddKICcuk
        tIL9LRarnrfo+edC+8VdfaYC62Z2SeC6A+w8Mr9Bwqj9r0azK8RwqVK2wMxUniWK
        FQbUawCQNOXFINUzAJ0wZQXgALsH2pfLsOr9ZZoM+5kiucHJH5Z0YZQP34taS6lf
        aX2jnXtftPk7SVbLIYJc1Ggi3UJcbs3ABGVmH0hcdi2KhSYk91sIZxJGxhSloiMH
        UHPd1p0z/6ITrjuHYzCnIhb5UUBjbG/7RrJlwnwU/R9zcGos13A11h9uNZdNPY0n
        7HBTD8ORdmFhgGSGR6V7/zpMiAesV/15Z8d9hd1oBy90Xj9pwi5m33VFGn0+mU/w
        ==
X-ME-Sender: <xms:IesxYV-47SQbY_LtpYWw4vjCEiOIMutpaIqHhizujJT_NYXcCCvZLA>
    <xme:IesxYZv2Zu5EbPDsyk8NCQnIwjkDMXFIqrkerRdytoQ4st1ezM730EHRAYjbYnA7U
    YHGCvcK4HNIEyvwtl4>
X-ME-Received: <xmr:IesxYTCaqruFP7xFU8fwp7wtmCuG4-Q2FxQZtKhYy3STQs4k2r-TDrd80V9c2EA9iMgVLreGn9fRW_mVKka0P-vnuyyMPfjsLDL3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IesxYZcyTjdjkwN8L6sqM45WnW7BSqxW5Tgzapp4y2q1deRENxIP-w>
    <xmx:IesxYaP4Np_AeMqWm3JVn7p1PzL5MtPNeDH5QLZ8NZ23g0UKvFgqDw>
    <xmx:IesxYbnr9D6eTa9j1KAoyAMImaM0V71BDG9rGwsmcKXIpvzW1eBz2A>
    <xmx:IusxYbH5KDXOoHq6j9kmyFUZY81vicC0nnLk9b8VY6EIHO2WpL1dnjwGgpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 05:30:09 -0400 (EDT)
Date:   Fri, 3 Sep 2021 11:30:07 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: sunxi: Add compatibles for
 R329
Message-ID: <20210903093007.3v3cveosljsvlv2i@gilmour>
References: <20210902225750.29313-1-samuel@sholland.org>
 <20210902225750.29313-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wnlqfpc4sbztns23"
Content-Disposition: inline
In-Reply-To: <20210902225750.29313-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--wnlqfpc4sbztns23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 05:57:48PM -0500, Samuel Holland wrote:
> On existing SoCs, the watchdog has a single clock input: HOSC (OSC24M)
> divided by 750.  However, starting with R329, LOSC (OSC32k) is added as
> an alternative clock source, with a bit to switch between them.
>=20
> Since 24 MHz / 750 =3D=3D 32 kHz, not 32.768 kHz, the hardware adjusts the
> cycle counts to keep the timeouts independent of the clock source. This
> keeps the programming interface backward-compatible.
>=20
> Furthermore, the R329 has two watchdogs: one for use by the ARM CPUs
> at 0x20000a0, and a second one for use by the DSPs at 0x7020400. The
> first of these adds two more new registers, to allow software to
> immediately assert the SoC reset signal. Add an additional "-reset"
> suffix to signify the presence of this feature.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--wnlqfpc4sbztns23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTHrHwAKCRDj7w1vZxhR
xQcmAP48dKb7HDJ5PMZmU7eZAIoQjOYTV5e+mfZqWVr8Q7KnVgEAlHVqmD/mpf1X
pRgf+O2dkN9i+uCNlxb53BjMtELO2gk=
=AGu5
-----END PGP SIGNATURE-----

--wnlqfpc4sbztns23--
