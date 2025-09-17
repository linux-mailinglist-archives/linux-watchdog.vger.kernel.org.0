Return-Path: <linux-watchdog+bounces-4257-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C148FB818E9
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 21:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39C9A1C8191E
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Sep 2025 19:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBEF242D6E;
	Wed, 17 Sep 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvtF6AOD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21122F546D;
	Wed, 17 Sep 2025 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758136603; cv=none; b=HEcI8D+xbqyrjstU4tIFgrlIueW49mne329P0itdHqVvmJ7e5RtJpaljSsAgxK68QQ1rSnkMraWKkfPSZrajnSgDRlqzDujrc+qUuYqYrGWoEaZo+bCKS1FxY9hpIrN2d8G6vOOk14P3NE5A/g+briVgrot7GJE39R7n5EG97/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758136603; c=relaxed/simple;
	bh=zsuXfz2l0ieBKasfVRzilSBA3J4YCqEenQZxHbAGcm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nV4gHWfmTDmght23dZR7/in+ABrvpVFhP7nkVpc4DrjVFuFu1AZNWqtpmsBVlr01LDzhLJyIiOAqAUKZSsR5db5/FcDIHsINZgK0j+AKLOlnr7puAcHICc+L3Nw/YoUGu5MDJVMcnFAh+NhptFkxxYH+XsUXJrgYFNyyhL2U+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvtF6AOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8DAC4CEE7;
	Wed, 17 Sep 2025 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136602;
	bh=zsuXfz2l0ieBKasfVRzilSBA3J4YCqEenQZxHbAGcm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvtF6AODoW8+siPMZz2eBXBEAVgnbmITngd5FXgTvBrdNZbney+L/Q3QNS+cgv7W9
	 RlJdti7Da6s33em0MsiuVP3MN0Hi9k03AQD5hDb+5Hi2vD0QOuFxlddZcaZdSGScB4
	 TmoIjRSp6jVfeFC/5nMbU5qCaR00wT5+THA+1+9oBSHnTmzkbmLNBX4ubmhZcJHPDD
	 +FgLe2lFq7w4++b36SDyD3msKSrZ9E8OzJTj/+aolO6NntJv8k7Pu3cjZKhD09+jxl
	 2xehZVSKzklXn0Mj698SOQmaZUQPwHe911Y+dssp+TTAfamBxQbWmnr3v7udqku9Ea
	 z47m/EbgWd+yg==
Date: Wed, 17 Sep 2025 20:16:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Renesas WWDT
Message-ID: <20250917-village-oversized-e532df10644a@spud>
References: <20250917185651.12428-1-wsa+renesas@sang-engineering.com>
 <20250917185651.12428-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzxG3ZAHF/leqDVv"
Content-Disposition: inline
In-Reply-To: <20250917185651.12428-2-wsa+renesas@sang-engineering.com>


--lzxG3ZAHF/leqDVv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 08:56:48PM +0200, Wolfram Sang wrote:
> Describe the Window Watchdog Timer found on Renesas R-Car SoCs from late
> Gen3 onwards.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Passes the binding check here.
>=20
>  .../bindings/watchdog/renesas,wwdt.yaml       | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,ww=
dt.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml=
 b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml
> new file mode 100644
> index 000000000000..921713dd40fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,wwdt.yaml

filename matching the base compatible please

> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/renesas,wwdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Window Watchdog Timer (WWDT) Controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a779g0-wwdt  # V4H
> +      - const: renesas,rcar-gen4-wwdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Pretimeout, 75% of overflow reached
> +      - description: Error occurred
> +
> +  interrupt-names:
> +    items:
> +      - const: pretimeout
> +      - const: error
> +
> +  clocks:
> +    items:
> +      - description: Bus clock
> +      - description: Counting clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: cnt
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - power-domains
> +
> +allOf:
> +  - $ref: watchdog.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    wwdt0: watchdog@ffc90000 {

and remove the wwwdt0 label here as it has no users.

> +            compatible =3D "renesas,r8a779g0-wwdt",
> +                         "renesas,rcar-gen4-wwdt";
> +            reg =3D <0xffc90000 0x10>;
> +            interrupts =3D <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names =3D "pretimeout", "error";
> +            clocks =3D <&cpg CPG_CORE R8A779G0_CLK_SASYNCRT>,
> +                     <&cpg CPG_CORE R8A779G0_CLK_R>;
> +            clock-names =3D "bus", "cnt";
> +            power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +            resets =3D <&cpg 1200>;
> +    };
> --=20
> 2.47.2
>=20

--lzxG3ZAHF/leqDVv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsJFQAKCRB4tDGHoIJi
0nCIAP4hKbgAUxP75XKV3H4rO1XJVQ27Ml8zsP82vfiTogMyzwD+LRMdq38bqVfO
q9NATpzidRl+FhTEL5jV5kgYuioH0AM=
=Utge
-----END PGP SIGNATURE-----

--lzxG3ZAHF/leqDVv--

