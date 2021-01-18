Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BFB2FA4EB
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 16:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391404AbhARPhc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 10:37:32 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:49919 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406006AbhARPfj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 10:35:39 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id BEA4958077C;
        Mon, 18 Jan 2021 10:34:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 18 Jan 2021 10:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:date:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=oU0HqCO/5476uMOlzZwZPuowCXA
        18QWWN/mw1RTCV9g=; b=vaLbxPDj1tzN7TvKH7vMSi8rBS2vusxWy7RC4A/CE9S
        Ylt63G5nEwedMq4k910g9dGsqleq9P+5+WLnYB99gqTjkkT8DkXqQt7hY5CicuuU
        QNee8aJ92b8/DJrqmADB/FO5bm1BHwTdLwVGHSk+AY1cnx4ejvMg8FD69cwhNlFE
        cBqQDRP+OZ4vjQ0iJ9Ygl69Q+wxTp14dRR4p744L9nc+NRpIfjgMXgdr5petDQ+F
        +5rBz4APbiZkBKs6S3PKv/+qpR4AH5nBhe+BGrYbjoiogNQ2gcCzS5R/xqiPlpz0
        J+VR0VV8X4GVG5C4yPlt4nHjxk4CKb0U0PMOzf4b0aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oU0HqC
        O/5476uMOlzZwZPuowCXA18QWWN/mw1RTCV9g=; b=mjqAXbJ6T9w+h2IIeJ2kX5
        dy5ImmXm3D6BhD4QYyrTZInUCozeZE5atfcmUT+QIlkVv0yRDigd9ce1Va4g2afk
        bvKjwg45/Kw/igygZlLmkjPEQGZ6nzcwuiCPHLsUUPTjtLorVZM/T0w3nxDthTD7
        Il2/uBS0/7pQqfNYVV9dU2LJxD/X6tSRjvWqJd4vY8JH62Lo8Ul6nAqgrR1ESbj6
        9hfokd49eLluMen+YfDewoAInBtbmMI+XQnpknlOlOaJ26LwO0nRsO8upZJD+7Ic
        Zu6ZWju0Jv094mIZfuAMvl/zmH4zJZOd1U0V9HEvdb8ALm/HyqaixhKu8/u7pP9Q
        ==
X-ME-Sender: <xms:eqoFYAJ4CIUHiG4GVCR9KCgyZlIZ6qgs3_c5rq9uY6vJupciZOv_-g>
    <xme:eqoFYAIBO-axLA9_9Bu_uw3lhNYlHZpSdGmIG4_m4sLk_B6xF-NcFlIvaOjKBIoVe
    -IOSY9IK-8PwV65wDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepmhgrgihimhgv
    segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpefhffffgfetjeegieetleeuvd
    ekffdukeejjeehveelkefggffgkeekvdfhieeggfenucfkphepledtrdekledrieekrdej
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eqoFYAuSP6s61YaBhGfA4YBZq8QhJsIuKNugI-L4bTlJoEGbpCxTwA>
    <xmx:eqoFYNZ8Tng5XbR2GgZ9fBL9Lz-bRniwPUQ3TgLruEFhyNG-KVA5DQ>
    <xmx:eqoFYHYvH6Nzfweadf_THLEOYAh8kARqsi6PpmDOLaW5xGryZ6ecsg>
    <xmx:eqoFYNweQh-H9eN39ex1dLODCaGKM4rRD-af1Dc_ji3FzpefRF-Fnw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E640E24005D;
        Mon, 18 Jan 2021 10:34:17 -0500 (EST)
From:   maxime@cerno.tech
Date:   Mon, 18 Jan 2021 16:34:16 +0100
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 17/21] dt-bindings: watchdog: sun4i: Add H616
 compatible string
Message-ID: <20210118153416.h6zc5h5j52rlxro2@gilmour>
65;6201;1cFrom: Maxime Ripard <maxime@cerno.tech>
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-18-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ekw7d4qbod7okqkh"
Content-Disposition: inline
In-Reply-To: <20210118020848.11721-18-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--ekw7d4qbod7okqkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:08:44AM +0000, Andre Przywara wrote:
> Use enums to group all compatible devices together on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ekw7d4qbod7okqkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAWqeAAKCRDj7w1vZxhR
xa7kAQCUNTWleBinyXgESqWs2vbvBzOFbAYKt3vV6V2JdkaMIgEAoqaV9ae12yAo
z+OKnbYdl4+hDmjGI/vB8yaRTyP6mwg=
=maz4
-----END PGP SIGNATURE-----

--ekw7d4qbod7okqkh--
