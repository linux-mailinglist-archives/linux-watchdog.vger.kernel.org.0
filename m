Return-Path: <linux-watchdog+bounces-2201-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587299BCB1
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Oct 2024 01:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B011C20AA5
	for <lists+linux-watchdog@lfdr.de>; Sun, 13 Oct 2024 23:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A4F13CA9C;
	Sun, 13 Oct 2024 23:09:18 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21452F34
	for <linux-watchdog@vger.kernel.org>; Sun, 13 Oct 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728860958; cv=none; b=Yl0863IykENWdh7CK+jaB/uc8DEOEigaapNd7EXlvx52G3zPShg/SMeQSei+4Q8c31r37cFTEJ4Wumw8Bvm5W2gS3efWxjIR6F5bIWivU7VAOuyNVeo8Y0sz0a/mIXG6Hv/wDP3H09pPdnSdwYjckY8/7BrR+6xmG9VFh1AtQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728860958; c=relaxed/simple;
	bh=9Z+Zm6+VcaoWBOzpLQ9KqZ1e4CQwAmFpkFg/NQegE5k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FNpCRnXfdF7PsK612E3uZ4vtSY9ARPOYKNXyDDixRWKtqZCk37JPLBd1UMoWPUie6M386rYyoat1omH8JKdMC0e09B1EHQpQ2tk7Gibq2sxl7aFJqW3pJtZm2HHiADbfFWC2Xbqcpjraw9oiSj3Jc26Gv2PHrbXf3wzhpCQPQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1t07i0-00COvB-0R;
	Sun, 13 Oct 2024 23:09:08 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1t07hz-0000000E1dI-0MCc;
	Mon, 14 Oct 2024 01:09:07 +0200
Message-ID: <106117f95a80bbcc2921c3efc92b7211bef68028.camel@decadent.org.uk>
Subject: Re: DL380 instability with hpwdt
From: Ben Hutchings <ben@decadent.org.uk>
To: Jerry.Hoemann@hpe.com
Cc: linux-watchdog@vger.kernel.org, 898336@bugs.debian.org, Marcos
 =?ISO-8859-1?Q?Ra=FAl?= Carot
	 <marcos.carot@gmail.com>
Date: Mon, 14 Oct 2024 01:09:02 +0200
In-Reply-To: <Zwdbk_P1CRhXfx7Y@anatevka.ftc.rdlabs.hpecorp.net>
References: <0db492a0e8e5474f67bafdab7ae0a50b69cbc717.camel@decadent.org.uk>
	 <Zwdbk_P1CRhXfx7Y@anatevka.ftc.rdlabs.hpecorp.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nUCIrMqaP01Yx0I1ZCSA"
User-Agent: Evolution 3.54.0-1+b1 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-nUCIrMqaP01Yx0I1ZCSA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-10-09 at 22:44 -0600, Jerry Hoemann wrote:
[...]
> Questions:
> 1) The Debian bug above mentions only Gen 7 and 8 systems.
>    Are you seeing this issue on other ProLiant systems?

Not that I can see in our open bugs.

> 2) You mentioned back-porting commit dced0b3e51dd.  Does your
>    drivers/watchdog/hpwdt.c source match upstream Linux? Or
>    do you cherry pick patches?  (sorry, not knowing Debian,
>    I don't know how find/navigate your kernel source.)
[...]

We follow kernel.org stable branches, with a small number of our own
patches on top.  The latest stable release, Debian 12 "boowkorm", is
following the 6.1.y branch, which included a backport of that fix in
6.1.75.  So far as I can see, none of our own patches have ever touched
hpwdt.c.

Ben.

--=20
Ben Hutchings
Man invented language to satisfy his deep need to complain.
                                                          - Lily Tomlin


--=-nUCIrMqaP01Yx0I1ZCSA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmcMUw4ACgkQ57/I7JWG
EQm8cxAAxbktWIdBwxAQ8tZh9n0QCpZoesqLmSC5eaDJBwm/+kbuYGwyuhOe7k9g
KHbJqNtAVOXFkYBb/YiSua8EiNr/F0PBycqJvS5W9jPWiCrd0he27sJW8Rye9r18
bRrJgMhUGgj/0ZRJi1+asTLcjyWm97+3s5WkMq528tOg+EsCpglGoL9nUs9aiUqS
o6DPb3PU0LO4ESMf6Ba6gE5JQjHr5TMkTA5txcb0kuW/5gIwNFlj3eed1YbVSmyn
5VnFI3WtuOP2HjDmFMnnBir3hSNQlW0vmPsniT8hsVtutIY4mJf6O0y1o7h2Q3UR
/UQjbhZLLUML4zANKnxgHvcW5cR9LzhxtfAeIYCSrJaAVxJDx3fWJ1zmzf4fHsm0
RUoilfOvAhcjwhV/VneNTbOsNK9ZvhjBXzNaA6i6GZfgaDvufar1NwIe0bUTUH6r
pyLSbxEdwwakcWZ/DvVDdE76eslJc77yiiWm3wn3hckahCXr0a8qGnqn+uKaztup
PXU6WEPHC1xbC+k++c5GIhBBgK4L5F7GH/nLAJaYdRUAq3QWZheyEsgc7PVZOtv3
+13nwkzO+IoLJUcW+QPHpfhtbiQzW0gT5gjLvyyVTGtQrgjsxQ16gUfo7YJ9ZFRS
LmG1wj3zyqDTfBJXQV1JCUsrRLCL5wYcSQZtK2nSRLQMDv6hkqk=
=3ohc
-----END PGP SIGNATURE-----

--=-nUCIrMqaP01Yx0I1ZCSA--

