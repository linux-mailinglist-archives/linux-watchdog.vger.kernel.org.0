Return-Path: <linux-watchdog+bounces-4530-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F2C41032
	for <lists+linux-watchdog@lfdr.de>; Fri, 07 Nov 2025 18:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530D03A5B14
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Nov 2025 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6859032B9AC;
	Fri,  7 Nov 2025 17:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtZWpcp6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B32BE658;
	Fri,  7 Nov 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762536062; cv=none; b=CxnGNmCZkYlCDAe3pX3Lr+gzM5WSjU/is1M23HzhqZN2NINA/8GNUIKGo3LPvcpUCDHmpHI3EG+J2D9huVY41WX25U5914H7EDqyzMvW5v4pZGBRjVcK0nw151FnR7b5B4hnPQ+FgUwfo4lsCGjSXW+tLZt/TGxClM/IN4SOJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762536062; c=relaxed/simple;
	bh=GvZYa5F5ySYoW05pxUy3AyDv6FWq9BSflVcoFS5vqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgV5XjTbRo/DATXrue9n/zuHmzlzcOwmSblVQ+lf2WW2FpKX6twfbyqKUg3ezPeAwjhuWwzDy2uXJUeQz5DZq5UY4TGkc+pMxrEZm6RM/wnTEJCUKIsX8md0qPOXtWro7uBNvvNLGFebMLG+b0hKho9/1LK1HpSvGa5c7iHxpoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtZWpcp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A55C4CEF8;
	Fri,  7 Nov 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762536061;
	bh=GvZYa5F5ySYoW05pxUy3AyDv6FWq9BSflVcoFS5vqck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtZWpcp6S7pCvN2YBf8QF92ntcb6O70LvS12dppm4LaBzj5f1kKE9LEl/yue1fOSR
	 UUHBsRCMTVFTjQt98QqX/u44BidjYP12wdZA/xOEPEvOSGXztnHhFa7s6alZui/QhQ
	 PAnbiNcbv5DTaDKklm0pxbgPobHN4DYeV1ij2jNnBPPtClYMmXoe3t3JluSIM5judI
	 GMb/KDGxDn42T5o9JUdSOBnc1Z5yQQtuxF3XPpH65gTjaBtBg6zv7FpMbkid5hdt6Z
	 ngJo/RyBpZnJWeFZZ8nDERuVv0L1ZaZOyn8pckGalAS5kKfnpm7D6OpgYjzymMQtMc
	 26JnvEZjgWbsg==
Date: Fri, 7 Nov 2025 17:20:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: watchdog: loongson,ls1x-wdt: Add
 ls2k0300-wdt compatible
Message-ID: <20251107-scandal-fifteen-5d11ebeea512@spud>
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
 <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hXx4OH+R/PAhzxJP"
Content-Disposition: inline
In-Reply-To: <a1f64f3d3816620b690aaff7b87162ba9e5b155f.1762482089.git.zhoubinbin@loongson.cn>


--hXx4OH+R/PAhzxJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hXx4OH+R/PAhzxJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4qeAAKCRB4tDGHoIJi
0rcsAP4kyl9qKvFLpCvfCrj3UQUFnhCqaE277gT7JePNPQuDJQEA9TucVHY3R0j/
59WO2zJGDl9XnrSUTTSyKXj8hs7s0AI=
=U3mR
-----END PGP SIGNATURE-----

--hXx4OH+R/PAhzxJP--

