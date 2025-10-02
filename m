Return-Path: <linux-watchdog+bounces-4302-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02986BB2B9B
	for <lists+linux-watchdog@lfdr.de>; Thu, 02 Oct 2025 09:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B595516433C
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Oct 2025 07:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156AC1D61B7;
	Thu,  2 Oct 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hdMC6LTv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216E1C68F
	for <linux-watchdog@vger.kernel.org>; Thu,  2 Oct 2025 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759391175; cv=none; b=dZM47r1bBBnp3rogAYlkRLPTAro2aVo+aDy2/EQdeMT6FScxb9x5FEldstr5kzjty2fSXlFvE5HErEUmOgfJPVLhCqnqArUZVAqekGTJ6egmSeLd+piV4gkXMV0SqHCoz+eLZJBowu59BeeE79upf4bcg763fky/SsmT6iDPEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759391175; c=relaxed/simple;
	bh=cxdhP4mqFsJBNQO/VRV1m4vk7D6c4c++Lg24qQFgRZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVKrLapLFE/oCZa0Usv56C5y6gYdfbCu/quveMdqUhgyXXOdaf7gmcVUdWF83X2KCw86Ht5cHUeH+OVjnA/4eL7flQOBC8f+VzqpSwLGchUw2wwSX4eH1h+uqqcz1Y+psqQvzehTxRMMi8yDjagDXEAMTgbeL++pUmxNWN8WbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hdMC6LTv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cxdh
	P4mqFsJBNQO/VRV1m4vk7D6c4c++Lg24qQFgRZQ=; b=hdMC6LTvkBHtyCgwjhtb
	2eW/JF/5zIlSoeIQfppFGhIMUy9stGa7FvD8XyoaLprIjgDmHZ+vEJ/UKoVnGrdg
	2NnvUIvYp7PM+y2Ggk2i6MVdfWdEy95yMVPde0LiBEF0fmPTro9aggq2ozZ0OcxP
	rCjAi+Cq+G6/UwL6cL1RCyMfGsUIr4lidv1Y6nhsGnHURmxsJHrZrmqJ+pChfuvz
	D+S2yKNF3I9BfuW92oAaPHa+kFMKv6zDunxxtZx+FaxQlI+7pFgUHMlVdQ8L6r9U
	hna9oM0VnVyD01b1ueptRnTYL9Fw358/cBxPdB0Z7cD78gRvWbBefV3LVXcxJHF8
	bw==
Received: (qmail 163477 invoked from network); 2 Oct 2025 09:46:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 09:46:06 +0200
X-UD-Smtp-Session: l3s3148p1@oI01LShA0OsgAwDPXwQHAL/S9V79e5yL
Date: Thu, 2 Oct 2025 09:46:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 0/4] dt-bindings: watchdog: factor out RZ watchdogs
Message-ID: <aN4tuTgRUqd0T54U@shikoro>
References: <20250926112218.28723-1-wsa+renesas@sang-engineering.com>
 <20251002022324.GA2916027-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kNM4CdNxEDzw257Z"
Content-Disposition: inline
In-Reply-To: <20251002022324.GA2916027-robh@kernel.org>


--kNM4CdNxEDzw257Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Let me know if watchdog maintainers fail to pick this up. Seems to be=20
> hit or miss for bindings...

Thanks. I think the WDT tree is the better choice here because this is
only a preparational cleanup for the actual changes...


--kNM4CdNxEDzw257Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjeLbUACgkQFA3kzBSg
KbYglBAAoXua78nbPkr1NGhV3hH3oSp1WpZplCPBFgZyLm55f4ENVLeIcagrkfIB
Bh2jkRN2RYrszgfwVrNt61Jt2xcO5XuppQH5QvlICppuBL63rR1uTw65wBMZOMol
Sa1WMO40lk0DR7Qin4DLTG1FqsDQmBD2sPDqvXUbcbVm5h6iQ0lvTonaRIAbQO+d
SD3wPFgHqOxkC76aKkzx4vXTSIU8fTbx1EBXjDq/aHhJ71uGF12tQHw12Q37BAuQ
c1AWb7iBfWDGaqPPljTG42lzhUw+J0n92jA9dAkcYBPNxiImaGculSlQWr+aLpbj
TxbphFitwqwaRfFM5ou/lxBLUdDgmVu5qkSSIlqdalAj5LWYegyZwI0FhSFELeeQ
vHtzAd3wUm4TOd7iuCqlC6RMC3SmhvWVBvctjdKmG127dK2TvZrms8u3axm1MRIm
3y8GTrif3GREIRmKFn1KyGGCOhMMzQgNr8hj612rzYXyHlgwDzgx7MMAAScBBbZw
ayK6yi3y+/6OJGTlBu3Mg+geyoEOrKD5shl/OK1dBei7qOJKb/r0X78JAKIcjuIe
yquV68WPKFySB5awc9qznZoc00X29y3D1CkKagAtfF70oM/84jKGuMtbtdrNywPP
+7XtI8d/dmWZqLjWErkooNkEiRryy50cTXuG5vSeomN25yfVMu0=
=1+en
-----END PGP SIGNATURE-----

--kNM4CdNxEDzw257Z--

