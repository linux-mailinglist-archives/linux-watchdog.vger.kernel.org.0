Return-Path: <linux-watchdog+bounces-1096-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B658FACD0
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EA3C1F251D7
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E7B1419B4;
	Tue,  4 Jun 2024 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZVKQr3E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B4143880;
	Tue,  4 Jun 2024 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487771; cv=none; b=Nq92dIK3wGM4JepbfDK1OVAoP5yCIaL57M2j1/XcoCf0wPdJuYpevgMJSPAg2k9bUopGURo7VCKaMgFhXyfVkB0ZKwtlKlWKHdKQSFHiaE/hSROZYJPMbBlnAOo1y7mnjvRylYom+EfwyGRyfPAPkcufx0z8/nARKgDpDwPtNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487771; c=relaxed/simple;
	bh=Th2X0P0NR+EYfy5Fht2yUCRMhtyLvZfQvaqQZUcH8hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcJ6mHwKsHHEJbOwfFE7wE0NxKoC1KnpMqqle/CqHlaQQHJy7Ck7t7SlvklWG9g3vewrcBAOFVo8STfwMwCw0qF/0LQkAPig6q5bywTHhTBFyoSKZLCnDSH9ATBNDhtMcc7tjtj79NLGOwekVrq1Dq/KB85kkSw/6nB6zHqiA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZVKQr3E; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaa80cb573so37038751fa.1;
        Tue, 04 Jun 2024 00:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487768; x=1718092568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/osOaeGzL7NBtD1GUS86QPUM+BgjTKgchC2AVQ2xiQM=;
        b=hZVKQr3EdJEtzrm5qLr+F/R1G4p4ENvQ5vAkmbmNgLXQkXOhDf8phNbZ1ZYBdKCDi7
         IByyIADosbKfjPMpT0r2stJXbNrbqz1axlfwnG5hJJJD5GMCsL2cdAlqbRvBkqL2sPy/
         zhJdVf/oazhqDqaorWyb6P0BImzlrRpm5Li4fdiRxz3XS3DCeYCPL9b4PJ12mGCGno9/
         Ay0N+l0Ej87+yq6Q4OxLXwjnq2H6QkNUVzO1L04Ijqv1eXn51qehNSnVRiRMYUNhedfD
         L/ApZfbFv+6zTho0yBIT18uTUI+2Kh8IZvYbBgSS50vVcEYQ12Z6TjOzW9qk2B06DseO
         u5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487768; x=1718092568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/osOaeGzL7NBtD1GUS86QPUM+BgjTKgchC2AVQ2xiQM=;
        b=pshD/sMeLtiiQkTqZlP5At1H/dHYtaGiraeTAJunZYCF9mdLtWTI3YRZSSBpO/INei
         WUo96k6kLd2Dnltb9EoE4JLB+lzGPx1tEZJRfsWF+t0jCc9588umws6yfb/LIX6E5Qp/
         6wn2kJgEN1qN/GSBOdsYABL4pXygrDjyKzkDIoRtJgNWINZPWjKQNZeKo0sC+np59C9N
         HYtEP/SG57VCV53JFMwsv4ZqYOAdICMGCguxQUHXoP7UIj/1kGDCF/b5VJZPy7zVNfgm
         Fzq8psTCjBf2Wy8miohQBH14MwiuBlJIifADRrZagdUTI7qSkdufo8oOH/AcGsj/6NEl
         k2ig==
X-Forwarded-Encrypted: i=1; AJvYcCWUijz7rMCQPzQtQ6fBOP9FhYMQ4To3QHGt/nCiAP1RLU8nUt5bkf06597mUynYc1F+lm+YiPpgitMRpQXp6Zl6OSCefdl3nXMFORcXEMYk24RkMpMKxSsMx69SS1mgwRkarAdedLbopue4tcvmAbS7KIIsjDXs7M4y9iJMlDvzLacl78eINOoo
X-Gm-Message-State: AOJu0YzRqh+moOaX9yHtPwib1ZyCPomd0nO4O1GZdwtT6OLZlbvL2CyL
	Wer5EXbaigoGBngFgFIztmzarc+R4w7+Z2pZ59gpx4o+e6fJ5DsyOq7aqg==
X-Google-Smtp-Source: AGHT+IHUShnGdSs9YZ4e0VIuGjqGVsSLb7X17+DQ/K7Ple5rFiNH+vzrjNFHS83dE0xPwsx/lG3rNA==
X-Received: by 2002:a2e:838a:0:b0:2d9:eb66:6d39 with SMTP id 38308e7fff4ca-2ea950f66e8mr77375821fa.19.1717487767746;
        Tue, 04 Jun 2024 00:56:07 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eaac556d6fsm7040091fa.87.2024.06.04.00.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:56:06 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:56:01 +0300
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
Subject: [PATCH v3 08/10] regmap: Allow setting IRQ domain name suffix
Message-ID: <dddd61e87f90c48e7d0514ef50e25039595ec885.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="20CFtLxgAkACyflE"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--20CFtLxgAkACyflE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When multiple IRQ domains are created from the same device-tree node they
will get the same name based on the device-tree path. This will cause a
naming collision in debugFS when IRQ domain specific entries are created.

The regmap-IRQ creates per instance IRQ domains. This will lead to a
domain name conflict when a device which provides more than one
interrupt line uses the regmap-IRQ.

Add support for specifying an IRQ domain name suffix when creating a
regmap-IRQ controller.

The regmap-IRQ supports both the legacy IRQ domains and the linear IRQ
domains. New devices are not expected to be using the legacy domains so
support name suffixes only for linear domains and warn if suffix is
tried to be added for a legacy domain.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v2 =3D> v3:
 - Drop name suffix support for the legacy domains
---
 drivers/base/regmap/regmap-irq.c | 15 +++++++++++----
 include/linux/regmap.h           |  4 ++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-=
irq.c
index 45fd13ef13fc..79247202aa9d 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -856,13 +856,20 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *=
fwnode,
 		}
 	}
=20
-	if (irq_base)
+	if (irq_base) {
+		if (chip->domain_suffix)
+			dev_warn(map->dev,
+				"Can't add name suffix for legacy domain\n");
+
 		d->domain =3D irq_domain_create_legacy(fwnode, chip->num_irqs,
 						     irq_base, 0,
 						     &regmap_domain_ops, d);
-	else
-		d->domain =3D irq_domain_create_linear(fwnode, chip->num_irqs,
-						     &regmap_domain_ops, d);
+	} else {
+		d->domain =3D irq_domain_create_linear_named(fwnode,
+						chip->num_irqs, &regmap_domain_ops,
+						d, chip->domain_suffix);
+	}
+
 	if (!d->domain) {
 		dev_err(map->dev, "Failed to create IRQ domain\n");
 		ret =3D -ENOMEM;
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a6bc2980a98b..b0b6cd3afefa 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1519,6 +1519,9 @@ struct regmap_irq_chip_data;
  * struct regmap_irq_chip - Description of a generic regmap irq_chip.
  *
  * @name:        Descriptive name for IRQ controller.
+ * @domain_suffix: Name suffix to be appended to end of IRQ domain name. N=
eeded
+ *		   when multiple regmap-IRQ controllers are created from same
+ *		   device.
  *
  * @main_status: Base main status register address. For chips which have
  *		 interrupts arranged in separate sub-irq blocks with own IRQ
@@ -1604,6 +1607,7 @@ struct regmap_irq_chip_data;
  */
 struct regmap_irq_chip {
 	const char *name;
+	const char *domain_suffix;
=20
 	unsigned int main_status;
 	unsigned int num_main_status_bits;
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

--20CFtLxgAkACyflE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyJEACgkQeFA3/03a
ocXlmQf/RkOGMjcT1T4tnhcYWuQOaMKSft8ieVRng4XJ0jz9ztrAmYCiI/H8UiN9
nzi7yVUiKM4tUoRzQOhsu8jMzUa5NaU1QctW2pFZOgEkNROcOnQVd+m+dDiBU/xo
SG/O4XlhZJeB4OdNplG3lDoVcPlm3gCQdu8Y7bz+If+2WNgAwicxYR01nJ67RTfH
/vIIfiJyvYsuJ+lcK1JtP6UpOWhuTxfVKV6qL5LUhpC8g/XFaX0Fj3KVZynWBUpE
Q5CuENoZnv/mdC/x/K52l47pzwKE5yD7n0Z80P2cyEzpTIK5OZ1NWEh1cL1QTlR3
OGbNE58EwooOKKG0mZ1JZURmcd8CaA==
=Mh5C
-----END PGP SIGNATURE-----

--20CFtLxgAkACyflE--

