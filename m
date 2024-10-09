Return-Path: <linux-watchdog+bounces-2155-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A998997596
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 21:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABEDE281E75
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2024 19:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5CD2629D;
	Wed,  9 Oct 2024 19:25:19 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CC15CD49
	for <linux-watchdog@vger.kernel.org>; Wed,  9 Oct 2024 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728501919; cv=none; b=pmZG4TEvVSYFkRCdTxvGiVMJ4eqqppSPpSFD5KP+unWeiEAOdcTQcmlR+5IB5M09BZpLzNwG6MqDPeiJOoJNN/1z5d3vVKBjxWrUMp9/Q2nUDv5GSYPeOGQGBhqEn3aLg26QvevjTO9lKAOY060S0d606ggtgq/4fTta97PLyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728501919; c=relaxed/simple;
	bh=Gv5NvupffzRKi2ZuTQuiacnzY6GPIWz1ZfJBpbZ/X2s=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=tyad9lgjc1cm6EJRInbjC1gvxTeZbADq5g1gaTnbi0g2hU/9zuZt+fRIAmCE7qQmGtDLdtA7NaOaQcxYU5X3h/jKvZq+q3AT0bUlzaOcVDuC5Gww9Iga8kPMzCD9HbFveZSRe7kVVnZSc35SUTOTmKRah+sN6k+SjF2D0/l9Uzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1sybut-00BxAS-0s;
	Wed, 09 Oct 2024 19:00:11 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1sybuq-0000000DZOv-4ATL;
	Wed, 09 Oct 2024 21:00:09 +0200
Message-ID: <0db492a0e8e5474f67bafdab7ae0a50b69cbc717.camel@decadent.org.uk>
Subject: DL380 instability with hpwdt
From: Ben Hutchings <ben@decadent.org.uk>
To: Jerry Hoemann <jerry.hoemann@hpe.com>
Cc: linux-watchdog@vger.kernel.org, 898336@bugs.debian.org, Marcos
 =?ISO-8859-1?Q?Ra=FAl?= Carot
	 <marcos.carot@gmail.com>
Date: Wed, 09 Oct 2024 21:00:00 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-e6iMIIfiv2PD6vNNphFZ"
User-Agent: Evolution 3.53.3-1 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-e6iMIIfiv2PD6vNNphFZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerry,

The Debian kernel team received a number of reports over the past few
years of instability of the Proliant DL380 G7 and DL380p G8, seemingly
related to the hpwdt driver (in that this goes away if it is not
loaded).  These reports can be seen at
<https://bugs.debian.org/898336>.

The instability has been seen with kernel versions ranging from 4.16 to
6.1.y, including after the backport of commit dced0b3e51dd
"watchdog/hpwdt: Only claim UNKNOWN NMI if from iLO").

I can see that hpwdt seems to be used for error reporting so it's not
clear to me whether these are problems caused by the driver, or the
driver is only reporting that something bad happened.

Do you have any ideas about what's going wrong here?  Is there
something odd about these models that needs to be handled in hpwdt, or
are they just popular models?

Ben.

--=20
Ben Hutchings
Klipstein's 4th Law of Prototyping and Production:
                               A fail-safe circuit will destroy others.


--=-e6iMIIfiv2PD6vNNphFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmcG0rAACgkQ57/I7JWG
EQkRPRAAvdTZMhjoaIK6PFx5PuBLw6Dh4RqacUlgAutR3mveC5fMnMMH69nGauvs
Kp/aUcS7w9vXaBcxF19iz72R050yQqM+Y4ZM2EZ/CAWRrD7yn77eeVOcIJXH7T5n
bSkTh3SQLsycGY7qnlDjDQdvKPbngvob+Zql8cQ0cZ2rBLfxI8yoZS5fT4QTteTf
ot1XUBOBT132v1hRklohQO9z87oF/BF/aNECUzwZxVjc7onfkdEMKTrpabjIPzAU
5K5hm5NmhXqobeNklZMxuq8hxBAl6KJBMspevHsnbDYSBoBBs2aP5kQrYjgE9wK7
nJI45grCSakHTmNJvBE/0+gHXiU7gmbwPn8fEdFPi1mxd9TQ8zsXPQzmZnCjaAAY
nlIcdyww2pG/+wyGAbTRgRO566y1QPdtaNxQjStz94EKe4FdatgmzPwW4fL2s8ED
aDm3kuZBAwjjxbZpSMn5PZmBYXPHz+3ezdHwqjH7/uqsORqfPRC5QHClwhiKqvbK
l59lkZRioojhtpBaV/jb7bIC0m0Owty4wIEjgBzRh+ZlCkarQiz+OE40LEn++ybp
KBjQiO6vwiK+PgMJgSbxxvDVMDO8oO/udI2XUfaVS9vTMc72JBjoqCBVCWo/dWWq
ZulodzfLFeB0Vy9XHVqm2CX2oCcAikvkqzmKshx4X0eOcVDdcl0=
=/ovc
-----END PGP SIGNATURE-----

--=-e6iMIIfiv2PD6vNNphFZ--

