Return-Path: <linux-watchdog+bounces-4469-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C57D7C21C8E
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 19:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 149B61A257F2
	for <lists+linux-watchdog@lfdr.de>; Thu, 30 Oct 2025 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3020E363366;
	Thu, 30 Oct 2025 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uc3n00xc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0355F277026;
	Thu, 30 Oct 2025 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761849194; cv=none; b=K33IyFvNne3kg0XNVWB/RrqSqztv3htmCfT9WK9VZCLN93qjxdBKbWFQNGqtIxwBM6JtYZA5gPmCAMaZ8UUSgenaRxe0DvK4a1Tmw3bw7F3xkVud+YshCsec/CnPYXZppjYSWpbfTjt8hTxF5ms0FJdJy8Z7dW9quhe/NOwpP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761849194; c=relaxed/simple;
	bh=JvqCJgn8JrvX/wqRcJdBnCeJJvGQqO6u4dEBjS3ynJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnfE4mjUTJxZLPO/mdOODq1O87AKx7GAsk+Mufgczq5KZakOSH8Lf6JOinV4px9tylmRzDrMcpt8OmhipmN8HiG3e8VgBKo28+EBfwhcnOgroazNQBJVRNHIHi7RMNACvEyN08IOprW6dVsR05tX/e31p1nxy6gx1r2VU4cSVe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uc3n00xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5346EC4CEF1;
	Thu, 30 Oct 2025 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849191;
	bh=JvqCJgn8JrvX/wqRcJdBnCeJJvGQqO6u4dEBjS3ynJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uc3n00xcX2apahvQe+vOAxBTIP7QlaGSOysJWttTvoz8CF5WhCm4Inx7CKbgcsyvp
	 FMHQ8uvIu1k2j3aWsbR0vFulwKd54VbMtPwe1wc1YvMd/syHapKHw5QRy1dIE31aNP
	 pp5PXeHLaAudnWWG59ST7SoU6KMOJYjz2DWBHaMeF2GJmfrs4K/Bmg95XX2A7kXIWw
	 p9iirwk3LlZ+6FOQKkaLKjamzAroKf4MgfCFUR+G4gn6tfbfswOXaZxR+r8OvGdGrY
	 v1PkUebQysUlEZcYHVXYzEX3cCErawNt1JtrqkeJ8C05e7wosQ3j19rYB74Rk8y9yp
	 oigdXlMNfZEmg==
Date: Thu, 30 Oct 2025 18:33:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible
 for MT8189 SoC
Message-ID: <20251030-smooth-agony-bea253b919fa@spud>
References: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hd7qwYh7dn279Ibw"
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-wdt-v1-1-975971ba29e5@collabora.com>


--hd7qwYh7dn279Ibw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:40:07AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for the watchdog block on MT8189 SoC, which is
> compatible with the one used on MT6589.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hd7qwYh7dn279Ibw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOvYgAKCRB4tDGHoIJi
0oimAP9o2MEl59jifVvyPGLCWbSwGzDMmbIfyk1LRXRhAcGMcQD+MdAmHKkHucGO
9XwvmdiZ/DSlgirQirhb+GL9vuMRdQY=
=Qv/D
-----END PGP SIGNATURE-----

--hd7qwYh7dn279Ibw--

