Return-Path: <linux-watchdog+bounces-1127-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D869087C3
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5371C21661
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1C3192B8C;
	Fri, 14 Jun 2024 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQUS2Kbe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7A192B77;
	Fri, 14 Jun 2024 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358194; cv=none; b=oSFwgGphbVGpCv9i41hB72uJnef7X+QQmJDc64Wrl/OcsJrgEWaBnj3TFWl2H/H7l1fDXp/nqGyxQj7uVTCiLBcrspDEUWi4c5sGJtBje3zNIZIlETcNmg9dFhKSMKtKOE0nyOC95IJZLx/krsWqFbFH+PmfLQMSmaTRvMPajwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358194; c=relaxed/simple;
	bh=RZDjTmZNcho40VtJeQGNtzA1C1hWFN6ZK8m7f+7YPVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaZ1h4WOtSmnKHBzO6sDbf+8nyxL7LyPPX3bUn1obQsuUt3Y6EPH7AF4iW23ett++GUnL6h2K29tWaFzkObIKdToG9bDfxRUExVlyEwiRr7e7Ke3UaONFk2essZfHb12G0s5vodNiYMelnl4JEgZtSbUgaRT3pGiGDdjjE1dx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQUS2Kbe; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so20414811fa.3;
        Fri, 14 Jun 2024 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718358191; x=1718962991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EZDkymXGQI/HQdkNqSqeM0mtl+UUEgtX5UcKiSORlxk=;
        b=FQUS2KbeVTEw5MT61IGBwTP4n1NuJ/xiIZ3PaGitAMMil9D/Hj4mz6dKK7iN06LFw5
         3C24bd0RRIy/+kS3UB4T7d4hYP1CcW5bhH2fChB4rX1eQJ/1+v6XPDXi6Eo7BPRSmVT9
         bLuZMRXsIZD7rYk4L1IooK6EcU1G1MY4kOF83ZV4qc2fq8BEY/S1JuMJebas9noDGQjz
         i/IDT0Bo3sK5xCMAxT4NnMFmSZt+il3xwKWeWS3CTc0P11Y+jGWF5gcoa9Bq0lhsXDMa
         L7ZHx4ahA//qfllmSbRADGfod3BRqd5fGdXf9WbgPsv86Xj8sWVkn7/SZBRxOjLgimwR
         5oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358191; x=1718962991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZDkymXGQI/HQdkNqSqeM0mtl+UUEgtX5UcKiSORlxk=;
        b=peVMLxgF4ZsJm38RfqLjKk8IyPG0BXXo/IIrJfLQDsowBBixmtGhuxvVMEMHsnD2yh
         z591Lcfucxfr6wZ4/qX16Qt28xtyy0HXsldkc98ogPksww0cydqGsN3aPrcSwOb/fKlD
         1i58xNWcVHXC/iiuDfslRGfSRT1nwwY/SdheIaUKHGmSakpSBC/GvVH6oztgANOD/rnC
         K/5onsochW62DFtdZv2BR0wBg4t2Ndrzs25zoptwveelrfP/6k1QGk8tNN3wf1CV5gV+
         splHQlpT/jdLhprgTUWMBhIz7dwYmoI0b0rIsXQ23PGuIwr9dPQsgoL6ITivfHNC8APf
         7YLA==
X-Forwarded-Encrypted: i=1; AJvYcCWGOD4HA6Cu2KS2tC3/LDAIVpB9VvuBdqeKdtthSsI6yQa83rTxwC2UWX98yEGZtvQDm/Rkv3JZg9yCubqGF40yZjvyPpdZHWQ6HOqAN30IoJXCpJYgIaxK0rSfPpN1IPqRLZaIGuAUlvX3KhPeRZnPjGGEGnj0bkkjlmlqw8QUTiGmE4wqRMqo
X-Gm-Message-State: AOJu0Yz8+DwSfbeNVCNBQtDVwMSWMqf8+i/FoJmMM+zIFXBxn+KsCTVR
	JtUy6HmPJfN1WFtlBWmY3BDL/a/HlFfqiHKfLNvBy14L9W82YVr0
X-Google-Smtp-Source: AGHT+IGLCthWftgTLltD3Vk5j/4XywuoxN+Uhpe1vLKEr+8bpHhrhY2oikKmQ45FIfgrb6xqAbjy7w==
X-Received: by 2002:a05:651c:220b:b0:2ec:165a:224e with SMTP id 38308e7fff4ca-2ec165a2446mr11536361fa.35.1718358190776;
        Fri, 14 Jun 2024 02:43:10 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c071d8sm4891831fa.55.2024.06.14.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:43:09 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:43:05 +0300
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
Subject: [PATCH v4 1/6] dt-bindings: ROHM BD96801 PMIC regulators
Message-ID: <7bdc1e2c5569dbe2babbce187b0093852fe392e0.1718356964.git.mazziesaccount@gmail.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QHlkor7i1jfv59q1"
Content-Disposition: inline
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>


--QHlkor7i1jfv59q1
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

--QHlkor7i1jfv59q1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZsEKkACgkQeFA3/03a
ocVDYAgAqA/99+9kbsQ6JRkWrDTe6AxZh6GLc++N1Dl/htDJ5CHtl6DU8LP/oYRY
3DBPfYYmBLt/LGEomFdonmx2qcbDZD1i3c4UK7bpQuf2hM7hB5P8rRPYVheqveN+
BQmhZ9zYPBvZVGeMSBA696VrTnDuxn8ow1fRQ8K4ZmYjG9UctY2GcBU3qGCKIBlO
bE7C6NzDyeVNFJ8FlgqXh5RlechFR78/5HfWX+2E+82Al3xm8EeyTbRWVdv6LDem
eF7M9RIfwGnyY6j3xq+PMCiSekRBFRKnZ8H83T2eY/eBUgI304+y7IsanSSH1tw0
m+3gmBmkCS2fTdFdFPAHVNoAolzlWw==
=0lrx
-----END PGP SIGNATURE-----

--QHlkor7i1jfv59q1--

