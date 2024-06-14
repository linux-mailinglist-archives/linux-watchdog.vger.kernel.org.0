Return-Path: <linux-watchdog+bounces-1128-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B68719087C8
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40AA82857AA
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD06192B79;
	Fri, 14 Jun 2024 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prm+fAWC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC71192B65;
	Fri, 14 Jun 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358209; cv=none; b=PRirTp1PjKSj1/2BdOm7Of6SSxhw7CcYdbpvzaOW2FoBDJoKtL+brv58EnIoBR1iOEWQTLYzdSJOCs9tVr1ZntfinM90J6WlR8MiUlwxtJiwSYr2ljobM2hXVshxlgmcc7XrDZ34h1sVMIZKS8MLrxUbiDVMVYZOQWhcaUSlDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358209; c=relaxed/simple;
	bh=ImG28gZvOYgvuw4fQRjEIctsoC5Nsi73iRWz3ovBxZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXcfxYmYvYD8khi5hIPBuejraobRoZK2/KKxVJUhZYMxOZi7+6kxpNY5Lpd1o8WzBoMsEazJJx+UM8dzwi2CK9lXdEhfR+cCYyBnTqEsQb7lC04aPjm6rjHoOtCQyIxaLMx4K3Wk7Ptp0V1D28+PummUHLl1P2hkdANCkQS21Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prm+fAWC; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bbdc237f0so2357634e87.0;
        Fri, 14 Jun 2024 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718358205; x=1718963005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MfxfdM44t79XaxGysFwU0f7hctUdFT0UiecrtkK1oB4=;
        b=Prm+fAWCSJBVcm06hVP/PEDHg+c2eDPNzhnsP3+AEok062Fhxgc2rQy0DDgpUeaxbx
         9WXKRWrHWecSghjzrUgw5qyCvA24pPZzOFn3K+fAcTQ6wlSoRNJQYOGCleR+m74OQVwO
         YYYFjgoNvt+UYBA4RxE/4t9unbcrfvDXZ8AlyVduHgJRaM3OOvG5TF3dmP4+e7N7xJsj
         r/SCuvLup+8TzXTkmKIkybHbp5HfxgFAYwA7XsDtMjeEHkD0Na9KbUEO2EdROICRHAdu
         ljiUtdFYOillizXovkaHYCZBHr4IaNIV6XS9aeo7Rs13vyOBVxIl7cnr6CwW6WMIh6qA
         jIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358205; x=1718963005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfxfdM44t79XaxGysFwU0f7hctUdFT0UiecrtkK1oB4=;
        b=PPTbtI8fo6m1F+kxWVHVEl8AZSVs2WWNtTBeCQ9aU6L4cG1/Jy+pfOzobGd0parjq5
         qRhfQt2fsn5D2LH72Z5JkOcS0HUCmFVmIKPxxZOSionlyy2xIL3qmLZZd2SXNJekslT/
         a1H+1UkbX+fOq9z3Z7nZNtyT9ircCRtndVDuCKVjKPaS8b8jGFpVWU7xvgcd2NdTBax+
         tt0sDYgceho+3JhA7L1ZIY5JyC/IFE51cd3tyQqxibi3PcQcGfStW04t9BTsNtpq9oZp
         nzGPloSJl3gYnJZ9rx//1JyTIJ/Xsqb43VXMBp5xvXQBuVnp6h84Qgn0bKlKdcEC678b
         oMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZC8m72ZT7xmJhXLk9yH46cwmw2zaKoNBKlMfNHb6LbQnDyc3ddLV7e+0Pk1Gg2jclc09/dGRg4Nd0zUEE8dXken7ePDQy9vZHfYoHuuK/sCGgQasWeSuC4pU0wuBXy7cuqxkY0qNWfXb7J/8sIHlH9W9y+b03MnLIKRuMiu//uDyMNEIluXwJ
X-Gm-Message-State: AOJu0YxWNg8Nlsp+GBDKMkcsyi3Yu68XnU6X4enxgYjSmRlJqKZQr9oz
	5q0gsi/oRrzIELSvMJhtIkGnowrFDGIZWb/ZoivhWsBVIPvIXlDX
X-Google-Smtp-Source: AGHT+IEhjAS4PJ+PARf4UhiFOpzEp0ukOgVzgE2me1I58+RDRfC6GwjXnxThhycrJMBAr8Ak5+Qtig==
X-Received: by 2002:a05:6512:3e1c:b0:52c:a882:c309 with SMTP id 2adb3069b0e04-52ca882c3d7mr2078420e87.62.1718358205263;
        Fri, 14 Jun 2024 02:43:25 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2889d38sm459333e87.303.2024.06.14.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:43:24 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:43:20 +0300
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
Subject: [PATCH v4 2/6] dt-bindings: mfd: bd96801 PMIC core
Message-ID: <674f3c69eefb2d31ceb064f898cb0237a5301044.1718356964.git.mazziesaccount@gmail.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AFxg5jF1Z59tuvHC"
Content-Disposition: inline
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>


--AFxg5jF1Z59tuvHC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

ROHM BD96801 is a highly configurable automotive grade PMIC. Introduce
DT bindings for the BD96801 core.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

---
Revision history:
v2 =3D>:
 - No changes

v1 =3D> v2:
 - use lowercase node names in example
 - minor addition to ERRB use-cases

RFCv2 =3D> v1
 - minor cleaning
 - add timeout-sec

RFCv1 =3D> RFCv2:
  - Document rohm,hw-timeout-ms
  - Document rohm,wdg-action
---
 .../bindings/mfd/rohm,bd96801-pmic.yaml       | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic=
=2Eyaml

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
new file mode 100644
index 000000000000..d381125a0a15
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/rohm,bd96801-pmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD96801 Scalable Power Management Integrated Circuit
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description:
+  BD96801 is an automotive grade single-chip power management IC.
+  It integrates 4 buck converters and 3 LDOs with safety features like
+  over-/under voltage and over current detection and a watchdog.
+
+properties:
+  compatible:
+    const: rohm,bd96801
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The PMIC provides intb and errb IRQ lines. The errb IRQ line is used
+      for fatal IRQs which will cause the PMIC to shut down power outputs.
+      In many systems this will shut down the SoC contolling the PMIC and
+      connecting/handling the errb can be omitted. However, there are cases
+      where the SoC is not powered by the PMIC or has a short time backup
+      energy to handle shutdown of critical hardware. In that case it may =
be
+      useful to connect the errb and handle errb events.
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - enum: [intb, errb]
+      - const: errb
+
+  rohm,hw-timeout-ms:
+    description:
+      Watchdog timeout value(s). First walue is timeout limit. Second valu=
e is
+      optional value for 'too early' watchdog ping if window timeout mode =
is
+      to be used.
+    minItems: 1
+    maxItems: 2
+
+  rohm,wdg-action:
+    description:
+      Whether the watchdog failure must turn off the regulator power outpu=
ts or
+      just toggle the INTB line.
+    enum:
+      - prstb
+      - intb-only
+
+  timeout-sec:
+    maxItems: 2
+
+  regulators:
+    $ref: /schemas/regulator/rohm,bd96801-regulator.yaml
+    description:
+      List of child nodes that specify the regulators.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        pmic: pmic@60 {
+            reg =3D <0x60>;
+            compatible =3D "rohm,bd96801";
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>, <6 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-names =3D "intb", "errb";
+
+            regulators {
+                buck1 {
+                    regulator-name =3D "buck1";
+                    regulator-ramp-delay =3D <1250>;
+                    /* 0.5V min INITIAL - 150 mV tune */
+                    regulator-min-microvolt =3D <350000>;
+                    /* 3.3V + 150mV tune */
+                    regulator-max-microvolt =3D <3450000>;
+
+                    /* These can be set only when PMIC is in STBY */
+                    rohm,initial-voltage-microvolt =3D <500000>;
+                    regulator-ov-error-microvolt =3D <230000>;
+                    regulator-uv-error-microvolt =3D <230000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <0>;
+                };
+                buck2 {
+                    regulator-name =3D "buck2";
+                    regulator-min-microvolt =3D <350000>;
+                    regulator-max-microvolt =3D <3450000>;
+
+                    rohm,initial-voltage-microvolt =3D <3000000>;
+                    regulator-ov-error-microvolt =3D <18000>;
+                    regulator-uv-error-microvolt =3D <18000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <1>;
+                };
+                buck3 {
+                    regulator-name =3D "buck3";
+                    regulator-min-microvolt =3D <350000>;
+                    regulator-max-microvolt =3D <3450000>;
+
+                    rohm,initial-voltage-microvolt =3D <600000>;
+                    regulator-ov-warn-microvolt =3D <18000>;
+                    regulator-uv-warn-microvolt =3D <18000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-error-kelvin =3D <0>;
+                };
+                buck4 {
+                    regulator-name =3D "buck4";
+                    regulator-min-microvolt =3D <350000>;
+                    regulator-max-microvolt =3D <3450000>;
+
+                    rohm,initial-voltage-microvolt =3D <600000>;
+                    regulator-ov-warn-microvolt =3D <18000>;
+                    regulator-uv-warn-microvolt =3D <18000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-error-kelvin =3D <0>;
+                };
+                ldo5 {
+                    regulator-name =3D "ldo5";
+                    regulator-min-microvolt =3D <300000>;
+                    regulator-max-microvolt =3D <3300000>;
+
+                    rohm,initial-voltage-microvolt =3D <500000>;
+                    regulator-ov-error-microvolt =3D <36000>;
+                    regulator-uv-error-microvolt =3D <34000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <0>;
+                };
+                ldo6 {
+                    regulator-name =3D "ldo6";
+                    regulator-min-microvolt =3D <300000>;
+                    regulator-max-microvolt =3D <3300000>;
+
+                    rohm,initial-voltage-microvolt =3D <300000>;
+                    regulator-ov-error-microvolt =3D <36000>;
+                    regulator-uv-error-microvolt =3D <34000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <0>;
+                };
+                ldo7 {
+                    regulator-name =3D "ldo7";
+                    regulator-min-microvolt =3D <300000>;
+                    regulator-max-microvolt =3D <3300000>;
+
+                    rohm,initial-voltage-microvolt =3D <500000>;
+                    regulator-ov-error-microvolt =3D <36000>;
+                    regulator-uv-error-microvolt =3D <34000>;
+                    regulator-temp-protection-kelvin =3D <1>;
+                    regulator-temp-warn-kelvin =3D <0>;
+                };
+            };
+        };
+    };
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

--AFxg5jF1Z59tuvHC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZsELgACgkQeFA3/03a
ocUyygf/a3fTSkjXY1Sn8d7DvM986v5SyokCfoJkDmT7Xn3O7GJZsfzsQIuZrtq9
5b1GEgyYyjtFy1E8vtQDTbUTws45+ggm33EB4cueV8DhM9F2w/F3UY1T62z7XDBB
f0B6n2TNUsVf3OHrGryIt0XRTBfdWIBhVZRZwvbaqOkRkRvq/8IeL+ZAl9hElVN+
heacKuNHqpeXwpp3H3CecrcO35YjIsAHysRnWHmcWdncIGq5XUXoQ+DbhGjvO4zO
uuACd3Xt7wFAdZkLYtaxR5mQMCmNhJ1hfILjk4a2o/6Qwm3Rlf/Kdc+PIwwzh1eh
k6WOce3fzv4EAVDqXWRzfHQpePaGlg==
=bg+Y
-----END PGP SIGNATURE-----

--AFxg5jF1Z59tuvHC--

