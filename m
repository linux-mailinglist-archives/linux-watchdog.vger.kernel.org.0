Return-Path: <linux-watchdog+bounces-4273-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EDB9DDA1
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 09:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979061B28646
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 07:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CDA2E7BAE;
	Thu, 25 Sep 2025 07:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpR4FUbu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AD15DBC1;
	Thu, 25 Sep 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758785338; cv=none; b=i+kHHWLJaCFAuCw04A7KGgxrIwMQbvkdlboj5zOPDpJxPUt0gWvKO98hnCtUbhvJVa7YOwhuoCYSpxu03WtnuYvgQTH+v7N+d+mpTNw/QF4C2vvz4Qw6Mu+Rr3mPsrTPclTwRSuO6MczIT038R7m7v3UTq7Xz5vrHec6yGOuOu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758785338; c=relaxed/simple;
	bh=E5H22ljejFV7OF7GmWz23BkhezFyc+iVSQv0Pyu/jqI=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=ANyVEOW2Z4j3vtEphK96suh6VT5ita4eNhOiAP+Hk2/AuZx3ry1N4zN4yFxw5CelIbQOhSQDl1rV1hCJF7U+ZPSf7934APYOe//XyhaPOKwiG2M3MBao1eS2ew728nGqC6ArXhotU8eq2cxsqhG9OdJDCnMVjD7a+LE3Q9eIxAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpR4FUbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 375AEC4CEF0;
	Thu, 25 Sep 2025 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758785337;
	bh=E5H22ljejFV7OF7GmWz23BkhezFyc+iVSQv0Pyu/jqI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=qpR4FUbuRe+vO4qghhExmZIfSTpFhRiJnGnNyZsW967PX6XSYQkAoLyuYENEpquWI
	 HN7e+8SFMSoArAk9VV5oRKuLSNMMpgdlRvwCNt7S+kQ8ZTGEAtZgoFGmt0BSVopW8A
	 gfn+i7uCp4wZxpP5u519ZPHZdkwont1gxBSSAA1DVIlK6salhnGcXj2bwmWHVKcf9B
	 A6xPQmzDsDEVkYWbAiLOpJl8XpETbWlCnq0iI+dom6ZgWljwwCS8mK37QVLWB9JbHZ
	 4qauHkQ0AYwguWYn0aerkZSGTjlt8AkTutFazB32t0uTpPBfXW40vugdLKAki5ggqH
	 aZgucfXSNl0IQ==
Content-Type: multipart/signed;
 boundary=0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 25 Sep 2025 09:28:53 +0200
Message-Id: <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>
Subject: Re: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, "Andrew Davis" <afd@ti.com>, "Nishanth
 Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Michael Walle"
 <mwalle@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Lee Jones" <lee@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.16.0
References: <20250912120745.2295115-1-mwalle@kernel.org>
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Lee,

On Fri Sep 12, 2025 at 2:07 PM CEST, Michael Walle wrote:
> Now that the PMIC support is there, we can finally, upstream the
> support for this board. Besides the usual device tree, this
> patchset contains the support for the on-board house keeping MCU. It
> make extensive reuse of the drivers for the former SMARC-sAL28
> board. Besides different hwmon sensors, all the dt binding patches
> will just add a board specific compatible (in addition to the old
> sl28 compatible) to make any future board specific quirks possible.
>
> I'm aware that there is a patch [1] which moves the sl28cpld MFD
> schema to a different directory. Once that patch is merged, I'll
> repost this series. But I already want to get some early feedback.
>
> v2:
>  - dropped patches which were already picked up
>  - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
>  - separate driver for the hwmon, add missing hwmon documentation,
>    thanks Guenter
>  - split the DT as suggested by the SoC maintainers
>  - add missing copyright and license to the overlays, thanks Andrew
>
> Michael Walle (7):
>   dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
>   dt-bindings: mfd: tps6594: allow gpio-line-names
>   arm64: dts: ti: Add support for Kontron SMARC-sAM67
>   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
>   dt-bindings: watchdog: add SMARC-sAM67 support
>   hwmon: add SMARC-sAM67 support
>   arm64: dts: ti: sa67: add on-board management controller node

Would you take these two patches
    dt-bindings: mfd: tps6594: allow gpio-line-names
    dt-bindings: watchdog: add SMARC-sAM67 support

through the MFD tree this cycle? If they make it in, there wouldn't
be any more dependencies for the next cycle for the actual device
tree.

Thanks,
-michael

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaNTvNRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iMSgF/U/Hnym3/BbU5iWgqn4kuJE5mIgjGrqH+
xebvDaMtckOeHjdqxGIg7wAV1v5PZLsUAYCYJPNo/zXnrrWdXLOY+md/sOocOPZr
/NGu1VF2dlgbKARDg+JXcIGreW3wYK3JzV0=
=kccx
-----END PGP SIGNATURE-----

--0afea6db4dd96f53b68f9fad7bcae6c16f16bfb407d755022db670fb382c--

