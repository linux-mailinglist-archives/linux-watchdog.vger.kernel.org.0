Return-Path: <linux-watchdog+bounces-1194-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2A91A0AA
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 09:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 602781F21CD7
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Jun 2024 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C0E62A02;
	Thu, 27 Jun 2024 07:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve644JMc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883026BFB5;
	Thu, 27 Jun 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474201; cv=none; b=HGpqDLhQgZp08gv95dqUW3WojyfEZ9SoriTyx9PxorIOJp6r39klVwuu/L/c4Ys3+ILkitFPfH+AXsh3roqdMTlUHl2/UFVj/P5dY/gC+mqyVqg0ByNldqe2G0CTfjybzJWaqbPGmNbkdOSsiHsltD0p3h40okxhiyKfnDuwWAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474201; c=relaxed/simple;
	bh=pF9klZUMkl/gjXaLLjJwDP//MV/lpz4OR+pkMARGYxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtpByKQIJp6Poxo8+KW4ZTqKIyOS1XCsOWWZIHXm7wPLPIEWrKYIt7LwJQYc2o9R5opjZ1hwOhTO9p9JMQAsG8vwoVHRj/HXdSsIhIhzRCdQZC65mYfPSmnwe3PH2TsqN5IqXw/VUJwm/dUbUoD0pK46+KQ0ItXgsmKUC0DGkhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve644JMc; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso57134671fa.1;
        Thu, 27 Jun 2024 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719474198; x=1720078998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Su6m/UdqYHPExRzqOOsbZoNyiDSgocrYc+ZQrQaWZh8=;
        b=Ve644JMcM+NEfh/J3IMpJ8TEtDikFX3v45En8MSGZiASjfBOkHsZTr2Ij1AXCtDyYD
         D0hyNaGa2x7pJ0/TB0hxOjMJrCczdk9H15/cRr7M9n/ExoU99XaxunDykTq/to7mqeSx
         rD3bEliD93eKo0R5B9WlHIeYHJUf8dn5+ZnHCoIDKxXTTqZKQbwbaRsvQP8w4ni5gTEO
         CbIXPRM9z4cpftmKiArl553W9Sa3ijRjyY4Tkj19OEYftBvmTp/hXvG/UQV9W7IYEQ98
         shmFmbhCa2RQ9quww6PThx/KIdQ7ksdQM70NxZGF6miaFhxZSGkXGg2fcAogPGQ/p7Q+
         Oc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474198; x=1720078998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su6m/UdqYHPExRzqOOsbZoNyiDSgocrYc+ZQrQaWZh8=;
        b=F/U3TtzZcsDN3EEpTdafU4LwxR6UWBbhWn+6du+RYke6lJDnqRRXic/Chyx4aYA0R+
         KBvVjwcq4KmFzj0exuCb0l0gn7s+7vxu/rtjI6OCsUbnyhayWmeM5bTbq+9Iq+ZKfJzi
         xiz1rO3nBliy2LsaxCEppX1f5BOjgeMkIP2XFXVVpFn/c1QFyKUGqlVfnvpu/zmXX5cc
         X1HvlWu4fA5e0PTIMQBow9m58gL+brZBLH2SDxqNSN7kDRKc4n4nYVos8Wqp1Y9DNnxr
         iUp2hl+auBM52uJInhUXinY4h7GY3jkgBxuUoTtoV4MjfM82u6sjW2OGF0ZHtLkgVN6B
         vZQw==
X-Forwarded-Encrypted: i=1; AJvYcCXSzcAt+86hoUXVlQehnXuza1QrvLCfJnuu9uPEMG/4allUqhMkXAG40jvKbIkVD+9FPFEsj7u2IKDTI6tjOKdfBqFhax9vi1Mw5cUFns/K1qW29/6hGfvA19cwgR9S2/+bSmXizEtjytSD5nJuVR9vjpJa2ci/hDdsOn/6tf/Sqc8PiwUukawW
X-Gm-Message-State: AOJu0Yy6FElahvDzAv3xPFqSUEUa5RUN8Q0eSV7dL3tqRAYc1CJyrG77
	V92RJqNyxv51Mzrg4Wx/M+4nzTmSXX5WP5j3rhoqZY/UnoaPYD472fWx4A==
X-Google-Smtp-Source: AGHT+IHpuFqG78TJg/F2BXh8QlighlyHz04lFDtzXjqd2Dm7kKzmQBeqtiKZHD/SWfS4adaGGKGl2Q==
X-Received: by 2002:a2e:720c:0:b0:2ec:4e79:b416 with SMTP id 38308e7fff4ca-2ec5b2fc299mr91484611fa.6.1719474197081;
        Thu, 27 Jun 2024 00:43:17 -0700 (PDT)
Received: from fedora ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350ef0sm1531171fa.56.2024.06.27.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:43:16 -0700 (PDT)
Date: Thu, 27 Jun 2024 10:43:12 +0300
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
Subject: [PATCH v5 2/6] dt-bindings: mfd: bd96801 PMIC core
Message-ID: <9fa3f30dede2b85871a89b20fe1eb13549418489.1719473802.git.mazziesaccount@gmail.com>
References: <cover.1719473802.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HCM8wcVnAVet1a55"
Content-Disposition: inline
In-Reply-To: <cover.1719473802.git.mazziesaccount@gmail.com>


--HCM8wcVnAVet1a55
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

--HCM8wcVnAVet1a55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZ9GBAACgkQeFA3/03a
ocWP6Af+JjJh8Py2GXRNDOyJDAueKBCX+Pvw6Rr54mOx4ehtosOx1VFtXjfGMmx6
6cgZDepj+on0HBJ1murOQANUv1q5YZlmq3l1qkOtaYLN0GBJ1CIxnB2/ljJBxJVu
nQBUUVjsFuVkU5eIGSiExyYkP9JyUf3gK14vVl2O7hFq/4A9LJLOVWmiwJ5NMHuL
cHUtQQu/Cyj2785bhfEMHFJ8zsWfzvbWyjyMxE1XGE8oEAB54YsfvgW1DnfIWkaf
BEyeBBKGThT5q+YdAlKGcaFsMjP0gvIS12rqQDImk+1xXK81lW/eEhnMSgvRb4e+
cOMNrfMWkZnDffMGqMeY13isr3WG4A==
=raYi
-----END PGP SIGNATURE-----

--HCM8wcVnAVet1a55--

