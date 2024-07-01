Return-Path: <linux-watchdog+bounces-1209-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AE91D983
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Jul 2024 09:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D231280D00
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Jul 2024 07:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4581768FD;
	Mon,  1 Jul 2024 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdn8ECoS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD63137142;
	Mon,  1 Jul 2024 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820626; cv=none; b=iQqyAwaCXeCl3WNHrt6L1tksXU8syZHhEjjlqoGuw0JK8ocUOstj5mrncz+aQ+lAs2Djd1nJeBfU9kZEN+YyeaWOofUX2a79ZldUNb2EwCJCAfFXMyOvxtjjLQxQ/lU7G+NdBFPSw/BNpskvXL7MHHduYmNKELN31MFSJDTCal8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820626; c=relaxed/simple;
	bh=SgRYTTInf8ZvtLqlwSdFXZS4xKvDrT2mPrGB2EWF33M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTAsJNrl0GVTH/MbzwiDHG1p7J7BIkKdJouH5HYqRB9RwTMoONDOxI3NzGlhMeOnYKT7vpRe+JFHOt+V8dp6KGNykNuJbCDrhXvsUncxsbAicIJUBAtf/fyEqrx9fGtbjY8XNURU8dRaGKqw7n3Ffca6cvNgHqQUsoVh3yWwuyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdn8ECoS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso2890453e87.3;
        Mon, 01 Jul 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719820623; x=1720425423; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+05MK1kXai4oMRlN0UFzQqyVHePDjZHTYYHi6/JPEWk=;
        b=gdn8ECoSEi42rbmkeMdT6qbIZ/2GH6Y4qnb6NePySE9t8GHh9FpLXE32ewQDAvrCjI
         B1+l8TvEhfnrbsdgTqEHm0o361hAimpZf4GimlNJhiTAm/rHYdKg6NsLacJFRuhmNAX9
         ByjUb79yv7UVwT2RDGb9rF/l1UcJGVu1XIn3hQQMRZP1iELUGOTx/YVMa7yLCxsi+GNP
         jIpRlT47+FROq8uDjCyMIL1//3BOs4oFaGheDfvtTNjeb4LzjFbtcR1YLtonSSddXpMF
         oP+5jPhrg2ZH+zzyomrGeY/TMYyAqWp9RxETBWNEpdYihP3rWVO7guBhxZgfcMGTjlEJ
         H4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719820623; x=1720425423;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+05MK1kXai4oMRlN0UFzQqyVHePDjZHTYYHi6/JPEWk=;
        b=tl6ULhuekGGM+7ju2P4VZZlqbdDO6FkAUBPDJyo7jJhOMpdkxw8qGcs+bJwgVx1I8g
         /XPYGAiMo2Hvwwf31RorGJNjlUFQIWmOERiAi4EXQIAA6kDcLPZHPVy7BpXweu5TZwIc
         98qZIP8dR6m+Ugxxmxr/7m/QrKgYOjstgvuvgctqbZrtveW17ptYi0zSHo7IDsz/HkRB
         POPucA0fnGMolY+HUCMBT3JC/IPe4aTAACKUZfxMhkvRxUuYiFhM+60XvKLZWvnDQ9bu
         Nqnd2+yQizz5d3RrPh+7I14pL4LUGzR+vst1fCYos1T65C/tGlP5YJbIW8QrhS3S/6h2
         dZpw==
X-Forwarded-Encrypted: i=1; AJvYcCUVtqzybTrudCSDs9L9oHZTihEfskWHLq/LUw/gkIemJBjMyQoz/uSaQSpR/LltjsP/fgGoUBELfSoVZM71mQV5NXs1rlkkTyNMlN9GawFAb4cV+8tPwQacKQq2VSBdBX5Rvd4LolmSeoArBzXGQ4pJGvop5uqDFTN8FnTVv6IVE0UtxRZDj904
X-Gm-Message-State: AOJu0YxbJkdxGXRkPd65booDZIEqJCGLSdRwmE5m2kbHvpB5vCd0u5hv
	p/tpVlwa76SQMqB323yZeoHbO4un89d2TrXhbIx990+A+w74JSqy
X-Google-Smtp-Source: AGHT+IGCVIArH6otjWMlTKGGmfEh/kav/BXrAKZti4HR6dcditB1AIJw9P/0E6YGqWLyw+7l8hOhWQ==
X-Received: by 2002:a05:6512:480c:b0:52d:b182:9664 with SMTP id 2adb3069b0e04-52e827398c7mr2293393e87.69.1719820620280;
        Mon, 01 Jul 2024 00:57:00 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0ba53sm1236119e87.50.2024.07.01.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:56:59 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:56:49 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: Add missing include for FIELD_*()
Message-ID: <ZoJhQVF-U6sSJ_Sg@fedora>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w8fIcGOUVCvHByY0"
Content-Disposition: inline


--w8fIcGOUVCvHByY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The FIELD_PREP() and FIELD_GET() macros are defined in the
linux/bitfield.h. Include this header to avoid missing the macro
definitions.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406300817.hcJ9VtLf-lkp@int=
el.com/

---
This patch is built on the ib-mfd-regulator-watchdog-v6.11 tag.
These macros got included via some indirect route in my build
config on v6.10-rc1 - but the lkp reported problem on some config.

Please, let me know if this follow-up fix is Ok or if I should rather
respin the:
https://lore.kernel.org/all/20240627082555.GH2532839@google.com/
with this fix. (I don't see much of potential bisecting problems if this
fix still gets in the next release, as the watchdog code is behind a new
Kconfig flag - but please let me know if I should re-spin whole series).
---
 drivers/watchdog/bd96801_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
index ff51f42ced2a..12b74fd2bc05 100644
--- a/drivers/watchdog/bd96801_wdt.c
+++ b/drivers/watchdog/bd96801_wdt.c
@@ -5,6 +5,7 @@
  * ROHM BD96801 watchdog driver
  */
=20
+#include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd96801.h>

base-commit: fcf1f960a6aa45a22efd4d49114c672ed305b85f
--=20
2.45.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--w8fIcGOUVCvHByY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmaCYT0ACgkQeFA3/03a
ocU7Vwf+PTfgWjQlll+7y+IpErsbcIFKJ3tTFZjAoq2QK6d7WuQnmRSQfGTfQZDl
SQ3hq/io3RicjVha+JC5TrBsv0HGJqfdcfYQ/iS3dzSSrUSnRa+oDfGNyREm1haM
8adxdGYw3vGJFI6uvhZyIki6XH+E43CYaKeRKBe1TKoQmA5TIRT9Xyvve9qErMq/
AmPD6p0yWMHoNTlA6WBcIFjq1hLuexR37mbOVS0mn44r4O+nG4ZZwX/4XbK+JKby
ya3sWG6Ou/IyO/gwszvnq7IyMY+J1dnbMQvFAJARCyr2QWnktL9NZyMjoYcxI/rq
F9d86MJB1Ga/ik0UHTl6nifiZ48krQ==
=Buqp
-----END PGP SIGNATURE-----

--w8fIcGOUVCvHByY0--

