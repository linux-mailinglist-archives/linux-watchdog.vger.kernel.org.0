Return-Path: <linux-watchdog+bounces-1090-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A98FAC98
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3CF1F21A81
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE51A1419A0;
	Tue,  4 Jun 2024 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MP+Clkmi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1361411FD;
	Tue,  4 Jun 2024 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487653; cv=none; b=M/ektmnmp8rMaFlEZoSl5Io9ZVh+EfNWdOQVZGT2oKR22WueGBwzrjrA58/uCZc8+q4kNXoy3XTiRmSDQUEebud3TV3349WOXGPCY6KEQ00Yp1x0yWgxmsYZEciVeLV9uoQT4+ft9bxLlE6ztVwxIL3slOGbt6mdZNW2XkwJX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487653; c=relaxed/simple;
	bh=+07XjaCmvSa2PN1d6lMA+SwXTKZqzU2wx3qN8oHNSUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImmqQIq8AkUegyGT0Sk93+vg0/WPvHGkcEdfjNfgN/WFrvMlxxvIb7k495xNZhveo14lAjZIsv93aWl9h81kCMQd0w43z5XPGRNZi3c7PbxOheD+hEFJUvT6Wc1MIr1D6Aj34j9HttrPLBjPKcaTAs80T+OmEvlXZSJtnDvmAtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MP+Clkmi; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b992fd796so777824e87.0;
        Tue, 04 Jun 2024 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487650; x=1718092450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BoSVUPBHVu1Boko+k4yuvY/1xggpNKidapHYx+cVQow=;
        b=MP+ClkmiJ7/SCMB3tuggw9iyM2JLiq2qdeCDiee4/oLT4iJ5eOZIs8VGjMBHLILWIg
         5p1WQyw0CN7L+8ECdN/kC9z88+HPAyyZTR6G3uOw7olg3+pothbArAdd2EElvuEkM95E
         WAS//ZZ+qk/geE0isbIQ4rUVsvYeHN6GGjrZ5xPD5xfEdbjkFUtYIV7RibnKqDBbekrN
         4lIaXz8SDFVA/wsVlqDuq0lssLZCBgBFGlGrCtcYiFyvMDxWexzcL/AhhE/O5O6t/nfp
         7WAQztHI2zRU8+u5I1MJyopHRa0SrjNsBKRRjRHzAuTwBQY7Uh2mvDR70CTOkdWZ92Ro
         PHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487650; x=1718092450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoSVUPBHVu1Boko+k4yuvY/1xggpNKidapHYx+cVQow=;
        b=sA4rAUzX2Npvi1QzTTzr8lgGRGDUbdIOhoV9WbJ/E1cJ1tx+MwFkzAuJNcYkWW3f4n
         m6LgXOv3NxzfkLK6nR6S9LPLpZlbz+Kgv87hrVOZRvOgyMwUiPhYLtj+ZVguXK5TMHpH
         9ga+iIm+j1RyArLQdjXCaA9raHGYJM1aYYNiax8cfJu4GZ3lqQ555Vj5vuX6fqyYzaVH
         Ebjt8rLTiby9Mpo+0r13yws2T6ufQKxT8oQc7zE48g7GiOBB0MhqzOS7y4JckhCs3boF
         PGZCUe0sp781+tVb43u+HpymV1j1Cj+wJSfv99fZuYqi8qtSWNtL5W/W3e5XoksmQrWZ
         b4pg==
X-Forwarded-Encrypted: i=1; AJvYcCW46TxxrOrkyNP9HkwS2/ej5n4NxJKTYosldiyG+d+RxqFz4+6p3iWxzULnG8THj4bbw6w5tqvHtdwZdSexIMaSFzHoyw8FSGO4spfgjMY5O4ZEXPPOzI/Cg2neN3k2bTlvh82ndQaGoks+VZ+yeiNeN1Gp1NpQgXP9TVOQbpZ4FdWCzE/htfXN
X-Gm-Message-State: AOJu0Yz/6KYicgaSMLkBfZLVwQJcWhXw1oU4iXNHLjThO03UvCc9TVC4
	GYjlmsijzX5idfbBX+heuD+30Vf6iJ7MOFML08LFyXJLhn1nFB5B
X-Google-Smtp-Source: AGHT+IHzq/IV6y+wMC6pEzqLt2bPySVEN6Iakhv0//gENZjemwN+WDCSwgUzCoMmEtlycllLGYPy6A==
X-Received: by 2002:a05:6512:118e:b0:52b:a5bb:12e6 with SMTP id 2adb3069b0e04-52ba5bb136bmr635980e87.35.1717487649543;
        Tue, 04 Jun 2024 00:54:09 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7ecbdsm1432069e87.182.2024.06.04.00.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:54:08 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:54:04 +0300
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
Subject: [PATCH v3 02/10] dt-bindings: mfd: bd96801 PMIC core
Message-ID: <674f3c69eefb2d31ceb064f898cb0237a5301044.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ps4zMNCG7GQ+eF5"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--4Ps4zMNCG7GQ+eF5
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

--4Ps4zMNCG7GQ+eF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyBwACgkQeFA3/03a
ocXSnQf/YCl6DS+PfaoCQuZc+4eoWP3t8mAR7po//JC+pbpMGtlYiaGwxD/3RkE5
Oxs04bd8gOxGLVYrIua9e0bJ29EGkoCemDOVmSr7kG+CCH9abIsfPqti1KlevhGB
XQrttdSrHH9W0t6x3IkjCLVxRj23m24oZBBKT5032WkoDawJZuybOPRMWrF5p/IG
fi9w7F8CNRmkdnpahsyTPP1ModWapgKIt6dHpRlMaGlGLBcUmUzIhdr+6yGdQ9yL
j7hULd858cPG65jbt6mqR9z+erK/yDQ3vxIRrAyNf+3vS9gqMVNIqiaqs+Ha3zXc
oAe3gLpuOcf6aBfDQm1F2MDwN+qxCg==
=vY9r
-----END PGP SIGNATURE-----

--4Ps4zMNCG7GQ+eF5--

