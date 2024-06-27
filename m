Return-Path: <linux-watchdog+bounces-1193-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2F91A0A7
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18F0B1C21248
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD4B59164;
	Thu, 27 Jun 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE2UyPFR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048544D599;
	Thu, 27 Jun 2024 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474187; cv=none; b=R0AbeD1FifPkoriIs2Bo775O8KbJp7OUIzkNDMX8cMoMwUzC+vMv/tBV38T24lri5aVKIerzdjpolfQ3jJG4kAOGJwAjPw2ydm6isD0mefHuRRh4oXOml0O/CMqo+gjam/coU5uvKx0PbGtKpxn9XAvYAWX1cSkADEUqAm0XcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474187; c=relaxed/simple;
	bh=am37yhg8tEwrGaH+7KzNQHAoQNp2ZMTQaZxvQN+reDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiCXx9YQr5frej6Qa6tiR3Brh+HymI1BynEXiVy9aWFiXzw2A43WcouZeFUdb3qAdK3B8Y6fmwT8PGRSlLy5vWa3LizMZAcWPtD3idiMbaD0xf8ky1XRgUkfv7HX8kwxl6V7eV1xmNxwlUr07SIRq7+gNhgNzWvpYV7eKEvFFPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE2UyPFR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so5122042e87.2;
        Thu, 27 Jun 2024 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474184; x=1720078984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNcN2sh0AeqSnpyxcUirrwPsHSFwDLCWyBgNSuG8gNs=;
        b=PE2UyPFR6wBt3pDZ/qcF7G1FlO5OY5DsVNPLepCHVhv1l5pnTcb0DCXyeCwFHeNSM9
         YPY/rO1Z/9qll/DNUFIuq7i9ARSkC/FqPYNg/i1Ifsi03Beg3vtvaNn6shyAI5sRXEiW
         5T7Xm6XPnO2sO7Iz/oTvcpPguTPUVgwGk8enKkvNBZJmTNChCdrQTeCkpPNcl/PvMta4
         Kae/0MlXeUV8zCIzhVUM2uFDTteSSEKryjuR4g1ULxj6TfSNm39WBirAD8O3/zgtF+34
         0bPKOeFOt+hTSOo1wqz1tfkcsGpn7lTWy3Vh+jgwq0F2kUgcu09ZWgvChyzP3TCGurFT
         8Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474184; x=1720078984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNcN2sh0AeqSnpyxcUirrwPsHSFwDLCWyBgNSuG8gNs=;
        b=eeLWOZXjf4voDPeavFDQ/pN4LX94KBQf3BgnPQxcYcBSYsaTyFej+V8+SBrksfwhvC
         iG6bW+dWOXMVuG4VNzplAb9xPAoU8S1WHi2cV1pz3xP+hhRnDSmsDwLzuubW2HE/58zt
         q3i2XQsOXL63KFPs2oSPXJjLMaqK/pH4EnVrQDiE0nikI7ydnYxBxUjMcJbGmPaIWzO/
         1IBxz27qA92RNZ2PN/XJx+JRzgyuQCubCJRmb/Ny7c4i91yqo6ieVrBrwgzBHYjX+wEn
         wTSAo+EQixPoDRUc5zeGSV+U7w/sUXNy8bGsYCI3StJPbw6zXXIsFEwFet36JY7A6hrf
         oiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+WAmhjnOYFfdZjmKkl9EK2IfpuMzl9tZkR9inEQ5/ryxK7VoqyNJd82AqgAPQqmRBDz4uvlttXQTZNnpOhL1NfqQz3PmBby/xD8C1smx0WVcbxCwkkEm/nkEM9mwexCEa280kCnwZH9WXE5lhmLYYxjyUfQRjjXwmFI1woUQYfJSkRVJBIvdg
X-Gm-Message-State: AOJu0YyU1a/o2VIQMXNV2Pj30cGXAfaqyGUbJZYQk4bjAFs+eDfazBw0
	cFZDAJbe6ol+UWEEwtnQPObEW+j0OiDj+gJMG4NGJfJKxz79qTTT
X-Google-Smtp-Source: AGHT+IHAkqxxTdDbU0jxjjGl19PYUxV1PQ+Z0R/3hQ6OLBX8asHgxCUBrkHPuedwXVb+R2rDofgRgw==
X-Received: by 2002:a05:6512:2083:b0:52c:e040:7d9 with SMTP id 2adb3069b0e04-52ce0680398mr8011641e87.59.1719474181536;
        Thu, 27 Jun 2024 00:43:01 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7131a211sm110381e87.222.2024.06.27.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:43:00 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:42:56 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: ROHM BD96801 PMIC regulators
Message-ID: <53a05b77833cb3f06ecada906411c2f46eecea64.1719473802.git.mazziesaccount@gmail.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+p/h85IZJmYTvoBT"
Content-Disposition: inline
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>


--+p/h85IZJmYTvoBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ROHM BD96801 is a highly configurable automotive grade PMIC. Introduce
DT bindings for the BD96801 regulators.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

---
Revision history:
v2 =3D>
    - No changes

v1 =3D> v2:
    - use lowercase node names in example
    - drop unneeded '|' from description

RFCv2 =3D> v1
    - Drop regulator-name pattern requirement
    - do not require regulator-name
---
 .../regulator/rohm,bd96801-regulator.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd9680=
1-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd96801-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd96801-regula=
tor.yaml
new file mode 100644
index 000000000000..b3d2d7d583ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd96801-regulator.ya=
ml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,bd96801-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD96801 Power Management Integrated Circuit regulators
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description:
+  This module is part of the ROHM BD96801 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml.
+
+  The regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+  Regulator nodes should be named to buck_<number> and ldo_<number>.
+  The valid names for BD96801 regulator nodes are
+  buck1, buck2, buck3, buck4, ldo5, ldo6, ldo7
+
+patternProperties:
+  "^ldo[5-7]$":
+    type: object
+    description:
+      Properties for single LDO regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      rohm,initial-voltage-microvolt:
+        description:
+          Initial voltage for regulator. Voltage can be tuned +/-150 mV fr=
om
+          this value. NOTE, This can be modified via I2C only when PMIC is=
 in
+          STBY state.
+        minimum: 300000
+        maximum: 3300000
+
+    unevaluatedProperties: false
+
+  "^buck[1-4]$":
+    type: object
+    description:
+      Properties for single BUCK regulator.
+    $ref: regulator.yaml#
+
+    properties:
+      rohm,initial-voltage-microvolt:
+        description:
+          Initial voltage for regulator. Voltage can be tuned +/-150 mV fr=
om
+          this value. NOTE, This can be modified via I2C only when PMIC is=
 in
+          STBY state.
+        minimum: 500000
+        maximum: 3300000
+
+      rohm,keep-on-stby:
+        description:
+          Keep the regulator powered when PMIC transitions to STBY state.
+        type: boolean
+
+    unevaluatedProperties: false
+
+additionalProperties: false
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

--+p/h85IZJmYTvoBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9GAAACgkQeFA3/03a
ocWgUAgAsgHPjOBdazVurGr8EKJQPi3JMw7SHturkXSaTfbYaZ2Tm1nMOfTfQufn
uZahFRGkylut9TS9y5xp7aI7qQw/dJ6G7swqbCIrkp9Dvnw/byyUq04zOwfn4aan
34IlZsnvMC++xb+tvBV9DIDUWV9r7tCbpk9Q2/LktodLvyH/c84MGN9zihiwxUVj
DDfEfPXynAlFnz0KTeOPAY6GdXRvn2FcDlvm84NlvAowOJqg9/cAPtgDR+gxf6Zq
6+amIj44NXBMp+/NuH5nYmsD4nIGVXQV1UTaX/2Csgv6DOyfLzDydaZLuBzNUmOh
YRoQXRCG6DHpV1ZpnNPDKWDkNXe+7Q==
=k9T+
-----END PGP SIGNATURE-----

--+p/h85IZJmYTvoBT--

