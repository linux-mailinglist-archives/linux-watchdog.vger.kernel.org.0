Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84ABC767197
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jul 2023 18:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbjG1QLP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Jul 2023 12:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjG1QLM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Jul 2023 12:11:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F85AFC;
        Fri, 28 Jul 2023 09:11:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6D3A62196;
        Fri, 28 Jul 2023 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4871FC433C7;
        Fri, 28 Jul 2023 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690560670;
        bh=tjGuSrDwTbS2bQDCEbJvPIHSpBadcYgXq8DyDZNK8XU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyAzu+W+m+DUr2THVKr8nlypPSMO/0fSh5RLpztO0wYLpGqCdkGeG9LwczxcmgwFh
         1xsiWwYcgbX3PSQ2CIVG2rBb9D1JRNcAnfchiXceCXcI4a4Frro59/iv/kWqBzLW4O
         aDEpZE6AH3utAOsXGRNYIIh/UGblZeJpwXYsh2/4DoLWPJW6K6/qrimrbrkQTl41sz
         pfb15Sb49WK7O5dU14vI9hUNF+g44dcyEG6oEn4klzDM5xARx60q3qkBkxJ7cbepuZ
         jMvTa9PMJm0QNsb1YUchIAU+F66g+DsywJoKLaSb3mKTaOcZehRaF/9JYoBOzmscUm
         oSkxewggZst+w==
Date:   Fri, 28 Jul 2023 17:10:54 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Varshini Rajendran <varshini.rajendran@microchip.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
        andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org,
        lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
        richard@nod.at, vigneshr@ti.com, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
        sre@kernel.org, p.zabel@pengutronix.de, olivia@selenic.com,
        a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, gregkh@linuxfoundation.org,
        lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, linux@armlinux.org.uk,
        durai.manickamkr@microchip.com, andrew@lunn.ch,
        jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
        alexandre.torgue@st.com, gregory.clement@bootlin.com,
        arnd@arndb.de, rientjes@google.com, deller@gmx.de,
        42.hyeyoo@gmail.com, vbabka@suse.cz, mripard@kernel.org,
        mihai.sain@microchip.com, codrin.ciubotariu@microchip.com,
        eugen.hristev@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Message-ID: <20230728-perfectly-online-499ba99ce421@spud>
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
 <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
 <20230728-floss-stark-889158f968ea@spud>
 <20230728180443.55363550@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JwCxVt0P/WwXvHk3"
Content-Disposition: inline
In-Reply-To: <20230728180443.55363550@xps-13>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--JwCxVt0P/WwXvHk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 06:04:43PM +0200, Miquel Raynal wrote:
> Hi Conor,
>=20
> conor@kernel.org wrote on Fri, 28 Jul 2023 16:50:24 +0100:
>=20
> > On Fri, Jul 28, 2023 at 01:32:12PM +0200, Krzysztof Kozlowski wrote:
> > > On 28/07/2023 12:22, Varshini Rajendran wrote: =20
> > > > This patch series adds support for the new SoC family - sam9x7.
> > > >  - The device tree, configs and drivers are added
> > > >  - Clock driver for sam9x7 is added
> > > >  - Support for basic peripherals is added
> > > >  - Target board SAM9X75 Curiosity is added
> > > >  =20
> > >=20
> > > Your threading is absolutely broken making it difficult to review and=
 apply. =20
> >=20
> > I had a chat with Varshini today, they were trying to avoid sending the
> > patches to a massive CC list, but didn't set any in-reply-to header.
> > For the next submission whole series could be sent to the binding &
> > platform maintainers and the individual patches additionally to their
> > respective lists/maintainers. Does that sound okay to you, or do you
> > think it should be broken up?
>=20
> I usually prefer receiving the dt-bindings *and* the driver changes, so
> I can give my feedback on the description side, as well as looking at
> the implementation and see if that really matches what was discussed
> with you :)

Right, that is what I was suggesting. Respective maintainers would get
the drivers *and* bindings for their subsystems - IOW, each patch is
sent to what get_maintainer.pl outputs for it.

--JwCxVt0P/WwXvHk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPojgAKCRB4tDGHoIJi
0kkfAP4ga1L8W2nIhESI6nBrFIrWddcSQtR9qdorSuJaMVMayQD8DIEJcInDpQKd
xcNO0xMMpnCF1rhZL6BPvkIZHuZ5Ygk=
=CpFU
-----END PGP SIGNATURE-----

--JwCxVt0P/WwXvHk3--
