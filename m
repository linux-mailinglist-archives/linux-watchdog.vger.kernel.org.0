Return-Path: <linux-watchdog+bounces-1089-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8C38FAC92
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298131C21D84
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAB21420D1;
	Tue,  4 Jun 2024 07:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lvs9qAIi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6761420BB;
	Tue,  4 Jun 2024 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487636; cv=none; b=IMLa87QJq3aKrpmOSJ6KWATxNmdZWBrJlQgWQ8dZEAJaagXws4k2LymxXCemjxzDJ+IbJEb0Kg885xqivlCNzxuIW07qSC6edrwDWzjT1XJ14gbFCafaRefEXwbb0ZSHQ4FjcyF7IpXVV2Y4JLtfSc1IHVW0RJAVeDJaAzjWH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487636; c=relaxed/simple;
	bh=Qt1UxDzx67PlscS9zxplX6GrtN/rzHghHyXi74rsPgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCJMzhe30Cc+/LzWV+SrAZ5uOfgiHKw2PyK0UCjhkCpVSI7OXHH+jQEyI+VBYUI/tnQfHZWLcqtbhv3PPuEQc6GwS+6pNXwJEkuzVdEiYfyKnnRvcV81MgGpd3r6tx3cahow9GqEy0J7wSElouTT19UR2N621HkFwHHdWroy6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lvs9qAIi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295e488248so5463194e87.2;
        Tue, 04 Jun 2024 00:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487633; x=1718092433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBfFcC2E1asbHPvw4EnTDAgesuuGLIZ6WxcAdenhakA=;
        b=Lvs9qAIi7Bl7RliN0y6fvsX0crQ57VJD0WFCCjUVrmq/u7nRWK+3st/KfIkUtzj+cx
         8a/YQ5z61VpL+FQveb+ycWKxxUR4WscPPGW/G5ENRW7vMEwABheSFf3ljdXdwFMLEEc0
         Iji13wvTd/2grpL/FPLsICELVm3fcVwDpcXVlzFR1Qwe1peDYNRTjw/KRe+VKGG+WIEF
         XAzPzxJo+rauJvMBffSKRQybSi9XIOKR6n+xbMXIDhBEuZ6U2j/av87QmOsESqsPOPjZ
         6KwwIDMXfRfDMeDb0GUb8/xeW1PgYgig0SAjhtQsdOL0GBV1DeEh95TQ4jMZSGOjs3oK
         ZN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487633; x=1718092433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBfFcC2E1asbHPvw4EnTDAgesuuGLIZ6WxcAdenhakA=;
        b=QiWF8fydW/q1QBssaNJo7dC0kzmCh5jAFjenelleidhM4pYaDV8eOOFghfYCk97LJ7
         xJBKcmdSYccVjrjArJlXGF+UjmQYrjNELmG/j+ksNbU5nmwJZFhaGD5RVvPOfbKW9z6l
         U7aKPzJy71RtKoMpvcLrtIH2BNbj0pfqG3KB3deRm++T3g5VaiN6M9KQ+foufdvlxkZq
         3LAMzgO3oFcSXcEUsvf/eEjh3lueOBUJ5r7MJvMU++i8gmtM9c1rDXw/Ur63qVcfRMjC
         /HjPWpYz9V8PxId9fXe0tD8uBTWBeWLVZk6wQgXMaxRkiZuVKKBR7btn8ERkwuT/KYvL
         I3ng==
X-Forwarded-Encrypted: i=1; AJvYcCV5oRai+7kCxgfca1XoX53KjgQ8X7Xh2pg3bAB3JwW6OrOOzqtfGOR21eBgz5DqE1NtNBTLPQKXXruZBaoHYsFaLLTk4L84LwpbHdlRGj4cyK67AZ0EkZa/nXu4emcJJlyJA9OptM8b0InAMfqSgyRTvdJha8ZwVqo/vtR0JP5h4WdsPUkoBfE2
X-Gm-Message-State: AOJu0YwjLwAxN/oE0e/PF+6dGYuHRAvqlvZ6hnDer+JTXC2G5Je1ehJ8
	eggx66UAPh+H2tTYU8QTE8ryXZ8hgYDMDJzQJv51ZBeWrhWfnKHH
X-Google-Smtp-Source: AGHT+IEYmFpoM6HPa7bleaTijAw+N+sB7DvoZFvscGVt1ROfzws5p9DcQ013WdXPXbDZ/dejw3Wz2A==
X-Received: by 2002:ac2:464c:0:b0:528:4841:e4a1 with SMTP id 2adb3069b0e04-52b896aba8fmr6890813e87.40.1717487632712;
        Tue, 04 Jun 2024 00:53:52 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b97ff7bfasm667048e87.95.2024.06.04.00.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:53:51 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:53:47 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 01/10] dt-bindings: ROHM BD96801 PMIC regulators
Message-ID: <7bdc1e2c5569dbe2babbce187b0093852fe392e0.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="REWxSoZFNY1Z+Z7s"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--REWxSoZFNY1Z+Z7s
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

--REWxSoZFNY1Z+Z7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyAsACgkQeFA3/03a
ocXkggf/Rmrjk+giarTH442MSLth0a0QuE6IrcgZfDZLtvcI08idCj9VHapQmoxM
Ww7GH7dFOqbDSOmlPZpr5VEIUahC9IeueqV0GAUZr1dI7+vokr1AzYlhktYI0qQz
4eyPZc/qQ66BMStrlzcBSNo63lHv8AURknc3KkQ5dcdk/jENi3+TnO3QRHJxmr6+
3rmw5DTm+3jKD+uOTIao9kMkrP36J5UBkzM9CNd1YQw9Neaebm141HNs6thHOm/Q
m4ucNY8d2Axc/N9ecj2F6tirbj+6TSP05+kPyZm13WvdDI8Oht0kbR80EWXg8H/O
Z0KU3ekfBAGtOtTBWQ08bzEaa8xLYQ==
=oV6Z
-----END PGP SIGNATURE-----

--REWxSoZFNY1Z+Z7s--

