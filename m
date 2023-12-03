Return-Path: <linux-watchdog+bounces-106-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DA802328
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 12:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 145071C208CD
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 Dec 2023 11:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43645BA33;
	Sun,  3 Dec 2023 11:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXQooySW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB419465;
	Sun,  3 Dec 2023 11:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105BEC433C9;
	Sun,  3 Dec 2023 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701603249;
	bh=FF27Gtp85RvVSUKvKpquUEpWiWzCYxX4BL9akxy0TXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXQooySWxHaxhDzmFHHRvr5I50wJKbvoYZiyObUSaaFtM9SooNsE57wh++e4oLBbX
	 Xb26I9xtSJmaSENareq1gA8vAS1rnBIeG0T1Kj/G/5Tivob0/KePJo2HkEjYARwU9b
	 n3RucS9V5mOYpCBR/lUCFZXnn9v8F6QlRik/mWdSHXm55/IV+h/t4d4EAXPd3IcTsl
	 Qu6D5vZP46Ia+e8eXU0Hh/iuXm1cSoQ+TazUYG78zQwC55WOzYr0atc9yAPKFFPIza
	 myrn0AOHfbWyZ4yYMdGayt9Qaky+/lPi9XSKRitaBmi8kuFE3Z9QFji70mOAwuaEdW
	 16GY5jq3WueWg==
Date: Sun, 3 Dec 2023 11:34:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: watchdog: dlg,da9062-watchdog: Add
 fallback for DA9061 watchdog
Message-ID: <20231203-daisy-palm-9e97126eaf3f@spud>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HSa8T4Sqr1mf0skW"
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-2-biju.das.jz@bp.renesas.com>


--HSa8T4Sqr1mf0skW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 07:25:25PM +0000, Biju Das wrote:
> The DA9061 watchdog is identical to DA9062 watchdog, so no driver changes
> are required. The fallback compatible string "dlg,da9062-watchdog" will be
> used on DA9061 watchdog.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2:
>  * New patch
> ---
>  .../bindings/watchdog/dlg,da9062-watchdog.yaml        | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchd=
og.yaml b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.ya=
ml
> index f058628bb632..2b71fdb9251c 100644
> --- a/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/dlg,da9062-watchdog.yaml
> @@ -14,9 +14,14 @@ allOf:
> =20
>  properties:
>    compatible:
> -    enum:=20
> -      - dlg,da9061-watchdog
> -      - dlg,da9062-watchdog
> +    oneOf:
> +      - items:
> +          - enum:
> +              - dlg,da9062-watchdog
> +      - items:
> +          - enum:
> +              - dlg,da9061-watchdog

If there is no da9064 on the horizon, I'd just make this const.

> +          - const: dlg,da9062-watchdog # da9062-watchdog fallback

The comment here is just noise IMO.

Otherwise, LGTM.

--HSa8T4Sqr1mf0skW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxnrAAKCRB4tDGHoIJi
0lwJAP47+tcfuwaa6VGm0TUXRPCymbnNbwE2VATxk4klxwSSWAD+KeuN+uh7L3DV
zKMu0xWgAq+rKuz4TiHaAeCgbKR8MQg=
=c0+e
-----END PGP SIGNATURE-----

--HSa8T4Sqr1mf0skW--

