Return-Path: <linux-watchdog+bounces-4411-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D86BFDBC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Oct 2025 19:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1859519C304A
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Oct 2025 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE212DFA26;
	Wed, 22 Oct 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g80AJZgi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A01271459;
	Wed, 22 Oct 2025 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155830; cv=none; b=fIdFrmScwoX+cHEcXNl5ugmpjWINlgBRu08JOeYIisPgbmxOgfz2NXVpd9aA5kCj8xl4yZuLIYP/l7YosmaNIuNvinHudF4paA4lgef8vriSAkytM4AEPac9FrCdmazVz9gx53SSY5riAd0cVf6xFGS/hs78+on8yghQhLk0Dz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155830; c=relaxed/simple;
	bh=GRlzaTupabyv7n01dRDHzydMMiDkpH0snUr2Kbfr2ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIqQ7vlOMDpqFl3cYJKpTWfYZK2ksg5t+mAT86JRc6dlP3v6Y+t7DZowsZAhHV+MoLDtI4BckQIU9GpNclYK8XWN3jX+ETAuLdUsu8tFSzPD1msfgu2KuHmedLPXZ4r8HcKVg/LnLLIo9hyAtVprCLjXlpe6m0U8RxyFPeor2Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g80AJZgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E667AC4CEE7;
	Wed, 22 Oct 2025 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155829;
	bh=GRlzaTupabyv7n01dRDHzydMMiDkpH0snUr2Kbfr2ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g80AJZgiScyonh4o4Pdpxa1k6ktKgWJe3ATv4uaHK6EcWtLeR4xlo+8UR9npSNE2l
	 xmFk3KJDxVtYtxCIWA5h5347w96lBqfOGXFQNw3G/QDKYm29N6mNWoTD6WwQqNgU+0
	 TzTYDUwIOJusNiyYzajQoq07Yo8pg1fBa6q0M6gIAQeGzYDocR1v1C+Filyaxj43ag
	 b4EELyzlqgNIRMM0uOa6jMuKs/0v2lUbq06XP5yXFiG0QoKnkHqoN0v4VDxhl27MHY
	 Vk6rg1b17mCpT9WR26GMBeU6JJ7LFuwlA04Qaap0fiUwnfEDytlsZlFwk4RkrO+8RD
	 JSM/WvDLUgpcg==
Date: Wed, 22 Oct 2025 18:57:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: Add RK3506 compatible
Message-ID: <20251022-dealt-empty-18504ec10a94@spud>
References: <20251021223308.193700-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sqgi4PtCNTdt1lQ6"
Content-Disposition: inline
In-Reply-To: <20251021223308.193700-1-heiko@sntech.de>


--sqgi4PtCNTdt1lQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:33:08AM +0200, Heiko Stuebner wrote:
> The watchdog used on the RK3506 is still the same snps,dw-wdt compatible
> one that is in use since the RK3066 days, so add the RK3506 to the
> variant list.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sqgi4PtCNTdt1lQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPka8QAKCRB4tDGHoIJi
0tW4AQDaM0p71oVgku+V5aomu9Psr5lTgRsfAsVEiSQRh4Dz6gD+O8h08VQRXkbT
+G64wJ+4JiDlcMWAnYnXMT9laarNiwM=
=8qg8
-----END PGP SIGNATURE-----

--sqgi4PtCNTdt1lQ6--

