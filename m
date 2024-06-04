Return-Path: <linux-watchdog+bounces-1098-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE46E8FACF0
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41512852C3
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5413B142909;
	Tue,  4 Jun 2024 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKs8G3KE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E6142905;
	Tue,  4 Jun 2024 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487805; cv=none; b=F85fxVvwmblggxa6PXWd/DEzBsuLqFb9XO8TeSdwPSgOU3jBpZzHsGIUnFN5Jo1GSYhzdCSGYhkT78ipvKs3mQe7Bf7amaVLWO0BBgpkxJUEiq+gf+oFX54PnOAP46HGsZbSFwPBwnL5sR+UsI1ZmEjxXBTMMmb1XZIt0l4nGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487805; c=relaxed/simple;
	bh=l/XyvCGS+PrP4ROgzHCnOkqa7jCy28PZpvTxS+CwZro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grhxiadnah5sZSOD/eWW5TI63u0adrgzu00AQqDN59dAfihLZtU8HJ7hWIx5Jw99Y4byFc5UqmHLwJ345tpaxm4su4MdtLWJt1CZhn0wI/cWYOLAcQI6nm4Hhng0GgiIvk6/rDiI8+f3Lo+rMwVeEEZZg096NPmcQj4+8RxjkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKs8G3KE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b962c4bb6so3334932e87.3;
        Tue, 04 Jun 2024 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487801; x=1718092601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQcOotaSPSL/kfYX/AiUNrk4z/j38OzBj/92nUZIbcs=;
        b=cKs8G3KETsyly59WkMSXHZLwDXjI6IeDl4Gc2F+EtE1N0hjkaNss+6mZN6/Qth/91W
         A+V8KaF9g6bqFHgaTvyJwlyYM/0CSwQfSIQN7/eQpjCmlW0ZX9LqYozq4poIFU014fsp
         3UwuPvAjRJDQO6lpebeAuEz2wFe2vgSSAFIrlsC6NX67mCRTFqfjF+FScrLhdd/4yWo4
         kyJ8sVegJIv6qdR6rFuAIiuwUGWhUgBPVCcujWB1EZT3JHvr1okMS/dg9JrjXNi6tHNi
         +5yhwIDV83kWHVT0jQPCO0vHlaPVlryxDpZE7wKfeG3OY8CgCBSLj/+undb3tjMfgib4
         A0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487801; x=1718092601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQcOotaSPSL/kfYX/AiUNrk4z/j38OzBj/92nUZIbcs=;
        b=Ms/DYdgcgEy8nGcQHBFsieGBqwmaU+85r/95+2d1dt2rwu3R9dteqZDU/uDhonVWAC
         DvGnGnL1qKrkeQUSlBj67RrjlfC2qUOsKeBfy77PVjVqnXEwr6jBeRkNNNW+mBxKDdaP
         oQpY0Lq/+SAJXuso+JKfjwDX8QJZCXW7ZXemy0MOqz07SMFA6Ku0Yptme41K5WLaM/Ap
         N94wJipjKYGqqZuOn47ANMh15Cgv4me1iKsM3z9m6ty/VCKlC1zpH8eoDykjp3AosDaN
         bHOEPvLyrIS0/lNdkLYTvzBpk7iZmPgr2bEx8TOzL6lPq8wZUnShcvrE4+yeegY3n/o2
         X4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7tdliKM0i98lp2prbzs3tgOBdikNXiIbzlhHLaSmCS4qkm4jcWq4b/1+CCJ5RERl1W8pQfZT8PWb/V3lDK9VduIodHIeb6HFJLATJvQ9137vHJdoe+K9Gy7ubG8JINu7xVS98qgR+06tf1e/7T1DDOTJMWdHQ+SQVXvoluc5hqd2oU6FQY6MM
X-Gm-Message-State: AOJu0YxKjUWtdytjIBsTPOMuRGr8zjt8y8Ce8fSl9bGpds3oDpd9fTwb
	BtvWrI5Ay9mlyXXMiUAcLSPXMKuH9fuXegOKfd8oC7ykSi0ooNIw
X-Google-Smtp-Source: AGHT+IERgdTVY1aR1YufVnprJNU1ikg7ILZzkhy5LdVDZ2HD8AwGg5mzxoDejvWJTdIKpDa//go7Ng==
X-Received: by 2002:a05:6512:2391:b0:52b:8aa1:bdca with SMTP id 2adb3069b0e04-52b8aa1be8emr11298672e87.49.1717487801125;
        Tue, 04 Jun 2024 00:56:41 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9ea8ca6asm307543e87.245.2024.06.04.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:56:40 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:56:36 +0300
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
Subject: [PATCH v3 10/10] regulator: bd96801: Add ERRB IRQ
Message-ID: <ac4094cdec5c822a854ead7cd5ad91b5289c1583.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TugQnY9j7ox5NahE"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--TugQnY9j7ox5NahE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96801 "scalable PMIC" provides two physical IRQs. The ERRB
handling can in many cases be omitted because it is used to inform fatal
IRQs, which usually kill the power from the SOC.

There may however be use-cases where the SOC has a 'back-up' emergency
power source which allows some very short time of operation to try to
gracefully shut down sensitive hardware. Furthermore, it is possible the
processor controlling the PMIC is not powered by the PMIC. In such cases
handling the ERRB IRQs may be beneficial.

Add support for ERRB IRQs.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Mark Brown <broonie@kernel.org>

---
Revision history:
v2 =3D>:
	- No changes
v1 =3D> v2:
        - New patch
---
 drivers/regulator/bd96801-regulator.c | 130 +++++++++++++++++++++++---
 1 file changed, 115 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96=
801-regulator.c
index a1ac068c69f8..e49a9948223e 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -5,12 +5,7 @@
 /*
  * This version of the "BD86801 scalable PMIC"'s driver supports only very
  * basic set of the PMIC features. Most notably, there is no support for
- * the ERRB interrupt and the configurations which should be done when the
- * PMIC is in STBY mode.
- *
- * Supporting the ERRB interrupt would require dropping the regmap-IRQ
- * usage or working around (or accepting a presense of) a naming conflict
- * in debugFS IRQs.
+ * the configurations which should be done when the PMIC is in STBY mode.
  *
  * Being able to reliably do the configurations like changing the
  * regulator safety limits (like limits for the over/under -voltages, over
@@ -22,16 +17,14 @@
  * be the need to configure these safety limits. Hence it's not simple to
  * come up with a generic solution.
  *
- * Users who require the ERRB handling and STBY state configurations can
- * have a look at the original RFC:
+ * Users who require the STBY state configurations can have a look at the
+ * original RFC:
  * https://lore.kernel.org/all/cover.1712920132.git.mazziesaccount@gmail.c=
om/
- * which implements a workaround to debugFS naming conflict and some of
- * the safety limit configurations - but leaves the state change handling
- * and synchronization to be implemented.
+ * which implements some of the safety limit configurations - but leaves t=
he
+ * state change handling and synchronization to be implemented.
  *
  * It would be great to hear (and receive a patch!) if you implement the
- * STBY configuration support or a proper fix to the debugFS naming
- * conflict in your downstream driver ;)
+ * STBY configuration support in your downstream driver ;)
  */
=20
 #include <linux/delay.h>
@@ -733,6 +726,95 @@ static int initialize_pmic_data(struct device *dev,
 	return 0;
 }
=20
+static int bd96801_map_event_all(int irq, struct regulator_irq_data *rid,
+			  unsigned long *dev_mask)
+{
+	int i;
+
+	for (i =3D 0; i < rid->num_states; i++) {
+		rid->states[i].notifs =3D REGULATOR_EVENT_FAIL;
+		rid->states[i].errors =3D REGULATOR_ERROR_FAIL;
+		*dev_mask |=3D BIT(i);
+	}
+
+	return 0;
+}
+
+static int bd96801_rdev_errb_irqs(struct platform_device *pdev,
+				  struct regulator_dev *rdev)
+{
+	int i;
+	void *retp;
+	static const char * const single_out_errb_irqs[] =3D {
+		"bd96801-%s-pvin-err", "bd96801-%s-ovp-err",
+		"bd96801-%s-uvp-err", "bd96801-%s-shdn-err",
+	};
+
+	for (i =3D 0; i < ARRAY_SIZE(single_out_errb_irqs); i++) {
+		struct regulator_irq_desc id =3D {
+			.map_event =3D bd96801_map_event_all,
+			.irq_off_ms =3D 1000,
+		};
+		struct regulator_dev *rdev_arr[1];
+		char tmp[255];
+		int irq;
+
+		snprintf(tmp, 255, single_out_errb_irqs[i], rdev->desc->name);
+		tmp[254] =3D 0;
+		id.name =3D tmp;
+
+		irq =3D platform_get_irq_byname(pdev, tmp);
+		if (irq < 0)
+			continue;
+
+		rdev_arr[0] =3D rdev;
+		retp =3D devm_regulator_irq_helper(&pdev->dev, &id, irq, 0,
+						 REGULATOR_ERROR_FAIL, NULL,
+						 rdev_arr, 1);
+		if (IS_ERR(retp))
+			return PTR_ERR(retp);
+
+	}
+	return 0;
+}
+
+static int bd96801_global_errb_irqs(struct platform_device *pdev,
+				    struct regulator_dev **rdev, int num_rdev)
+{
+	int i, num_irqs;
+	void *retp;
+	static const char * const global_errb_irqs[] =3D {
+		"bd96801-otp-err", "bd96801-dbist-err", "bd96801-eep-err",
+		"bd96801-abist-err", "bd96801-prstb-err", "bd96801-drmoserr1",
+		"bd96801-drmoserr2", "bd96801-slave-err", "bd96801-vref-err",
+		"bd96801-tsd", "bd96801-uvlo-err", "bd96801-ovlo-err",
+		"bd96801-osc-err", "bd96801-pon-err", "bd96801-poff-err",
+		"bd96801-cmd-shdn-err", "bd96801-int-shdn-err"
+	};
+
+	num_irqs =3D ARRAY_SIZE(global_errb_irqs);
+	for (i =3D 0; i < num_irqs; i++) {
+		int irq;
+		struct regulator_irq_desc id =3D {
+			.name =3D global_errb_irqs[i],
+			.map_event =3D bd96801_map_event_all,
+			.irq_off_ms =3D 1000,
+		};
+
+		irq =3D platform_get_irq_byname(pdev, global_errb_irqs[i]);
+		if (irq < 0)
+			continue;
+
+		retp =3D devm_regulator_irq_helper(&pdev->dev, &id, irq, 0,
+						 REGULATOR_ERROR_FAIL, NULL,
+						  rdev, num_rdev);
+		if (IS_ERR(retp))
+			return PTR_ERR(retp);
+	}
+
+	return 0;
+}
+
 static int bd96801_rdev_intb_irqs(struct platform_device *pdev,
 				  struct bd96801_pmic_data *pdata,
 				  struct bd96801_irqinfo *iinfo,
@@ -788,11 +870,10 @@ static int bd96801_rdev_intb_irqs(struct platform_dev=
ice *pdev,
 	return 0;
 }
=20
-
-
 static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
+	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config =3D {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -800,6 +881,7 @@ static int bd96801_probe(struct platform_device *pdev)
 	int temp_notif_ldos =3D 0;
 	struct device *parent;
 	int i, ret;
+	bool use_errb;
 	void *retp;
=20
 	parent =3D pdev->dev.parent;
@@ -824,6 +906,13 @@ static int bd96801_probe(struct platform_device *pdev)
 	config.regmap =3D pdata->regmap;
 	config.dev =3D parent;
=20
+	ret =3D of_property_match_string(pdev->dev.parent->of_node,
+				       "interrupt-names", "errb");
+	if (ret < 0)
+		use_errb =3D false;
+	else
+		use_errb =3D true;
+
 	ret =3D bd96801_walk_regulator_dt(&pdev->dev, pdata->regmap, rdesc,
 					BD96801_NUM_REGULATORS);
 	if (ret)
@@ -842,6 +931,7 @@ static int bd96801_probe(struct platform_device *pdev)
 				rdesc[i].desc.name);
 			return PTR_ERR(rdev);
 		}
+		all_rdevs[i] =3D rdev;
 		/*
 		 * LDOs don't have own temperature monitoring. If temperature
 		 * notification was requested for this LDO from DT then we will
@@ -863,6 +953,12 @@ static int bd96801_probe(struct platform_device *pdev)
 			if (ret)
 				return ret;
 		}
+		/* Register per regulator ERRB notifiers */
+		if (use_errb) {
+			ret =3D bd96801_rdev_errb_irqs(pdev, rdev);
+			if (ret)
+				return ret;
+		}
 	}
 	if (temp_notif_ldos) {
 		int irq;
@@ -884,6 +980,10 @@ static int bd96801_probe(struct platform_device *pdev)
 			return PTR_ERR(retp);
 	}
=20
+	if (use_errb)
+		return bd96801_global_errb_irqs(pdev, all_rdevs,
+						ARRAY_SIZE(all_rdevs));
+
 	return 0;
 }
=20
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

--TugQnY9j7ox5NahE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyLQACgkQeFA3/03a
ocXA+Qf+JtjXc5Mnl4nUfyoWMNqu7+hn2aqq1WyS5f91cStYzgC8eaqf+aeZ3BvM
tzpW1h+NiaPjsVa/7YaOK3c4VlgpcLWQCIdhPPaALr7iBYow6jFctZ/P8Fm4Skw0
STPsWPaJ6vuyxOqYNO/goAv27Qvl1JvzgcQTlgQSSCZBIba7PaCnUWorW6vh0dht
tx8UcvN6AzHW/DZg2HCqvc2B/41sLpPw7RG7RDp+uGeSXPIkFCX3cDw0wuhuyhp8
yD96L1iP5B4mx5ArI4E1FNb6+oBAwkpgnVJ8A/a5WHT5Eof8QExtaaFPqXZ4n9VP
urwr4J/5PtqJZkI8YonOUS6puaTbvg==
=bD/e
-----END PGP SIGNATURE-----

--TugQnY9j7ox5NahE--

