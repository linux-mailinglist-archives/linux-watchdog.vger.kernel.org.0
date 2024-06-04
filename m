Return-Path: <linux-watchdog+bounces-1097-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9398FACEA
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 09:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26871C20FB4
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jun 2024 07:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1285F14264C;
	Tue,  4 Jun 2024 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgZ94qm2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEC142640;
	Tue,  4 Jun 2024 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487791; cv=none; b=IGCsrddrhvChjQBhysL9EpLlrJm1jxjCQQwaD8O9RBVaFSz2aOL9VslHrGhpHOAbZXJm+3G1waOV61vSgxFpJo7Lc+8CQENN7vrzVV4UTjO8GseAwAfzpJZ28/FVRMmURZT9G9jElWDybs3J4msU4PVMYN8WpTlzeR4SdyuciK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487791; c=relaxed/simple;
	bh=feaIqaihD8R/vxH6jQ9TH/pIyCnGS+fT5q8C0Cpwa8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDCyUcsxmSrqni4VyaYP1MI3trgK9PqZzEKAXjQ0fIjQFQ39BUq93PzXnEq43MLuiIMx/lRfGgWNbWoOcqyXWCDbvaIod+fki6+K7mMbIMrqyQYtSRN9nTj3mOYxYptsURI6V1TrbfikTuRd1zhGefI0mZTBrRiTcW9nartTHi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgZ94qm2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so45597831fa.0;
        Tue, 04 Jun 2024 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717487787; x=1718092587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MVbdsvtFL9jT3Uzv4EwBY07SpsdfsNJUaB3GkizM14Q=;
        b=JgZ94qm2akNIt8bHRF96fNQsKmVatGEq3fVdTJmQU2rbhz3C7UCsITdr2ISQKFuonF
         F9iGCHChzVHVN4+9MLHR1GR1E60xWTRKzwfjt5wZoA/zK/i0/AP6VElt+YRLMrOcLq2+
         3i4u2Mt3M2Lp2FHTg5o4Ooiq7cqMEZkVTZSAqFa+Lhsmdut+wfsbkCS4hrPEKa1qeCvt
         DHBw1/I0T5Ws9pBdqS6lKHQrkhhBloNjNpLRbSVq3FXOTvUpAhh6b8dM+txcUpkna6pW
         mGTO3dlRzDCJmzIwP+cYkwmWIhQpem2/hrO3DcV3MdGu/6uIKywHWziQIWaljIyN3tjR
         p+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717487787; x=1718092587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVbdsvtFL9jT3Uzv4EwBY07SpsdfsNJUaB3GkizM14Q=;
        b=vc5QZ5dp5Q+EAuiD2EgXc1vHFVPcRReKPgC9BZvcZfUxHrefRj09ud7MyyHDzEAyXQ
         33uu0eOFhuZoS+2qZ66j5CORH8tini0oUKJSTqUISXXHV5qW1LY01svThbIVE9AtrT6F
         BihsVR8+DnU39pIODlJ/Y9td4SrgVcqFaZcCT9mi8u/1PBjOQ3RF/KdrV2Dv3NrbTAOJ
         G21vz355ShyZzSchfVRKbrJPAKx2LkoQhSOl73GjbMfu/6UKqaSdKjFHkYfQ0j7/BBee
         C3B8U7OH0WljV7Vkg+EOlSSMQrBdWT5jt78FmcfejMGVPR7z0CXRn1yLV5bzpBbW/Z/q
         e6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU+0wYzs5o/HrV8s9q4ZmPDiD72vFLisKCksTUxjreHhHzfzBeI13lIVAD6eCcwuTBTocX5xOx1EXTW8vuwvMaDJdKDa71v1ftZx5ZpcN2YHQd2S445JzCBQuyHMcNNWDVCqB9KPkagju15jpMiYzX5X5tpagX4aMP9wWFlDycIOMmVaOgAPSPS
X-Gm-Message-State: AOJu0Yz54qqz/Lymu3rSmzsieaAfw1T0spdM2g1NJKg89/o3OucUAoWE
	Eji2+vchbkGxpb/hqYdHXM3EAv2tFuwOFYLM+kKDYWeh+yQYzeV+
X-Google-Smtp-Source: AGHT+IEvirsyZDE5UR7D1dOsXlq1UmLrRlTdaFYQrrBOaphZLiEAleo7GsSRId1DkzBkn4hejIJeVA==
X-Received: by 2002:a2e:7c12:0:b0:2ea:804a:18b2 with SMTP id 38308e7fff4ca-2ea951ac739mr69679711fa.35.1717487786554;
        Tue, 04 Jun 2024 00:56:26 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d65fsm14881601fa.27.2024.06.04.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 00:56:25 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:56:20 +0300
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
Subject: [PATCH v3 09/10] mfd: bd96801: Add ERRB IRQ
Message-ID: <332a2d2429e2ba3c96afd28c1ccc18efc38e1fd3.1717486682.git.mazziesaccount@gmail.com>
References: <cover.1717486682.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HWofJ7cnk3YqvqLp"
Content-Disposition: inline
In-Reply-To: <cover.1717486682.git.mazziesaccount@gmail.com>


--HWofJ7cnk3YqvqLp
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
---
Revision history:
v2 =3D>:
	- No changes
v1 =3D> v2:
	- New patch
---
 drivers/mfd/rohm-bd96801.c | 291 ++++++++++++++++++++++++++++++++-----
 1 file changed, 253 insertions(+), 38 deletions(-)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index 1c2a9591be7b..b7f073318873 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -5,13 +5,9 @@
  * ROHM BD96801 PMIC driver
  *
  * This version of the "BD86801 scalable PMIC"'s driver supports only very
- * basic set of the PMIC features. Most notably, there is no support for
- * the ERRB interrupt and the configurations which should be done when the
- * PMIC is in STBY mode.
- *
- * Supporting the ERRB interrupt would require dropping the regmap-IRQ
- * usage or working around (or accepting a presense of) a naming conflict
- * in debugFS IRQs.
+ * basic set of the PMIC features.
+ * Most notably, there is no support for the configurations which should
+ * be done when the PMIC is in STBY mode.
  *
  * Being able to reliably do the configurations like changing the
  * regulator safety limits (like limits for the over/under -voltages, over
@@ -23,16 +19,14 @@
  * be the need to configure these safety limits. Hence it's not simple to
  * come up with a generic solution.
  *
- * Users who require the ERRB handling and STBY state configurations can
- * have a look at the original RFC:
+ * Users who require the STBY state configurations can  have a look at the
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
+ * STBY configuration support or a proper fix in your downstream driver ;)
  */
=20
 #include <linux/i2c.h>
@@ -45,6 +39,65 @@
=20
 #include <linux/mfd/rohm-bd96801.h>
 #include <linux/mfd/rohm-generic.h>
+
+static const struct resource regulator_errb_irqs[] =3D {
+	DEFINE_RES_IRQ_NAMED(BD96801_OTP_ERR_STAT, "bd96801-otp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_DBIST_ERR_STAT, "bd96801-dbist-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_EEP_ERR_STAT, "bd96801-eep-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_ABIST_ERR_STAT, "bd96801-abist-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_PRSTB_ERR_STAT, "bd96801-prstb-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_DRMOS1_ERR_STAT, "bd96801-drmoserr1"),
+	DEFINE_RES_IRQ_NAMED(BD96801_DRMOS2_ERR_STAT, "bd96801-drmoserr2"),
+	DEFINE_RES_IRQ_NAMED(BD96801_SLAVE_ERR_STAT, "bd96801-slave-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_VREF_ERR_STAT, "bd96801-vref-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_TSD_ERR_STAT, "bd96801-tsd"),
+	DEFINE_RES_IRQ_NAMED(BD96801_UVLO_ERR_STAT, "bd96801-uvlo-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_OVLO_ERR_STAT, "bd96801-ovlo-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_OSC_ERR_STAT, "bd96801-osc-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_PON_ERR_STAT, "bd96801-pon-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_POFF_ERR_STAT, "bd96801-poff-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_CMD_SHDN_ERR_STAT, "bd96801-cmd-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_INT_PRSTB_WDT_ERR, "bd96801-prstb-wdt-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_INT_CHIP_IF_ERR, "bd96801-chip-if-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_INT_SHDN_ERR_STAT, "bd96801-int-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_PVIN_ERR_STAT, "bd96801-buck1-pvin-err=
"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_OVP_ERR_STAT, "bd96801-buck1-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_UVP_ERR_STAT, "bd96801-buck1-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK1_SHDN_ERR_STAT, "bd96801-buck1-shdn-err=
"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_PVIN_ERR_STAT, "bd96801-buck2-pvin-err=
"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_OVP_ERR_STAT, "bd96801-buck2-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_UVP_ERR_STAT, "bd96801-buck2-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK2_SHDN_ERR_STAT, "bd96801-buck2-shdn-err=
"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_PVIN_ERR_STAT, "bd96801-buck3-pvin-err=
"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_OVP_ERR_STAT, "bd96801-buck3-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_UVP_ERR_STAT, "bd96801-buck3-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK3_SHDN_ERR_STAT, "bd96801-buck3-shdn-err=
"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_PVIN_ERR_STAT, "bd96801-buck4-pvin-err=
"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_OVP_ERR_STAT, "bd96801-buck4-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_UVP_ERR_STAT, "bd96801-buck4-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_BUCK4_SHDN_ERR_STAT, "bd96801-buck4-shdn-err=
"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_PVIN_ERR_STAT, "bd96801-ldo5-pvin-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_OVP_ERR_STAT, "bd96801-ldo5-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_UVP_ERR_STAT, "bd96801-ldo5-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO5_SHDN_ERR_STAT, "bd96801-ldo5-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_PVIN_ERR_STAT, "bd96801-ldo6-pvin-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_OVP_ERR_STAT, "bd96801-ldo6-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_UVP_ERR_STAT, "bd96801-ldo6-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO6_SHDN_ERR_STAT, "bd96801-ldo6-shdn-err"),
+
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_PVIN_ERR_STAT, "bd96801-ldo7-pvin-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_OVP_ERR_STAT, "bd96801-ldo7-ovp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVP_ERR_STAT, "bd96801-ldo7-uvp-err"),
+	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_SHDN_ERR_STAT, "bd96801-ldo7-shdn-err"),
+};
+
 static const struct resource regulator_intb_irqs[] =3D {
 	DEFINE_RES_IRQ_NAMED(BD96801_TW_STAT, "bd96801-core-thermal"),
=20
@@ -89,20 +142,14 @@ static const struct resource regulator_intb_irqs[] =3D=
 {
 	DEFINE_RES_IRQ_NAMED(BD96801_LDO7_UVD_STAT, "bd96801-ldo7-undervolt"),
 };
=20
-static const struct resource wdg_intb_irqs[] =3D {
-	DEFINE_RES_IRQ_NAMED(BD96801_WDT_ERR_STAT, "bd96801-wdg"),
+enum {
+	WDG_CELL =3D 0,
+	REGULATOR_CELL,
 };
=20
 static struct mfd_cell bd96801_mfd_cells[] =3D {
-	{
-		.name =3D "bd96801-wdt",
-		.resources =3D wdg_intb_irqs,
-		.num_resources =3D ARRAY_SIZE(wdg_intb_irqs),
-	}, {
-		.name =3D "bd96801-pmic",
-		.resources =3D regulator_intb_irqs,
-		.num_resources =3D ARRAY_SIZE(regulator_intb_irqs),
-	},
+	[WDG_CELL] =3D { .name =3D "bd96801-wdt", },
+	[REGULATOR_CELL] =3D { .name =3D "bd96801-pmic", },
 };
=20
 static const struct regmap_range bd96801_volatile_ranges[] =3D {
@@ -127,6 +174,91 @@ static const struct regmap_access_table volatile_regs =
=3D {
 	.n_yes_ranges =3D ARRAY_SIZE(bd96801_volatile_ranges),
 };
=20
+/*
+ * For ERRB we need main register bit mapping as bit(0) indicates active I=
RQ
+ * in one of the first 3 sub IRQ registers, For INTB we can use default 1 =
to 1
+ * mapping.
+ */
+static unsigned int bit0_offsets[] =3D {0, 1, 2};	/* System stat, 3 regist=
ers */
+static unsigned int bit1_offsets[] =3D {3};	/* Buck 1 stat */
+static unsigned int bit2_offsets[] =3D {4};	/* Buck 2 stat */
+static unsigned int bit3_offsets[] =3D {5};	/* Buck 3 stat */
+static unsigned int bit4_offsets[] =3D {6};	/* Buck 4 stat */
+static unsigned int bit5_offsets[] =3D {7};	/* LDO 5 stat */
+static unsigned int bit6_offsets[] =3D {8};	/* LDO 6 stat */
+static unsigned int bit7_offsets[] =3D {9};	/* LDO 7 stat */
+
+static struct regmap_irq_sub_irq_map errb_sub_irq_offsets[] =3D {
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit3_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit4_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit5_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit6_offsets),
+	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
+};
+
+static const struct regmap_irq bd96801_errb_irqs[] =3D {
+	/* Reg 0x52 Fatal ERRB1 */
+	REGMAP_IRQ_REG(BD96801_OTP_ERR_STAT, 0, BD96801_OTP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_DBIST_ERR_STAT, 0, BD96801_DBIST_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_EEP_ERR_STAT, 0, BD96801_EEP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_ABIST_ERR_STAT, 0, BD96801_ABIST_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_PRSTB_ERR_STAT, 0, BD96801_PRSTB_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_DRMOS1_ERR_STAT, 0, BD96801_DRMOS1_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_DRMOS2_ERR_STAT, 0, BD96801_DRMOS2_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_SLAVE_ERR_STAT, 0, BD96801_SLAVE_ERR_MASK),
+	/* 0x53 Fatal ERRB2 */
+	REGMAP_IRQ_REG(BD96801_VREF_ERR_STAT, 1, BD96801_VREF_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_TSD_ERR_STAT, 1, BD96801_TSD_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_UVLO_ERR_STAT, 1, BD96801_UVLO_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_OVLO_ERR_STAT, 1, BD96801_OVLO_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_OSC_ERR_STAT, 1, BD96801_OSC_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_PON_ERR_STAT, 1, BD96801_PON_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_POFF_ERR_STAT, 1, BD96801_POFF_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_CMD_SHDN_ERR_STAT, 1, BD96801_CMD_SHDN_ERR_MASK),
+	/* 0x54 Fatal INTB shadowed to ERRB */
+	REGMAP_IRQ_REG(BD96801_INT_PRSTB_WDT_ERR, 2, BD96801_INT_PRSTB_WDT_ERR_MA=
SK),
+	REGMAP_IRQ_REG(BD96801_INT_CHIP_IF_ERR, 2, BD96801_INT_CHIP_IF_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_INT_SHDN_ERR_STAT, 2, BD96801_INT_SHDN_ERR_MASK),
+	/* Reg 0x55 BUCK1 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_BUCK1_PVIN_ERR_STAT, 3, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_OVP_ERR_STAT, 3, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_UVP_ERR_STAT, 3, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK1_SHDN_ERR_STAT, 3, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x56 BUCK2 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_BUCK2_PVIN_ERR_STAT, 4, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_OVP_ERR_STAT, 4, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_UVP_ERR_STAT, 4, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK2_SHDN_ERR_STAT, 4, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x57 BUCK3 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_BUCK3_PVIN_ERR_STAT, 5, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_OVP_ERR_STAT, 5, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_UVP_ERR_STAT, 5, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK3_SHDN_ERR_STAT, 5, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x58 BUCK4 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_BUCK4_PVIN_ERR_STAT, 6, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_OVP_ERR_STAT, 6, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_UVP_ERR_STAT, 6, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_BUCK4_SHDN_ERR_STAT, 6, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x59 LDO5 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_LDO5_PVIN_ERR_STAT, 7, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO5_OVP_ERR_STAT, 7, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO5_UVP_ERR_STAT, 7, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO5_SHDN_ERR_STAT, 7, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x5a LDO6 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_LDO6_PVIN_ERR_STAT, 8, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO6_OVP_ERR_STAT, 8, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO6_UVP_ERR_STAT, 8, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO6_SHDN_ERR_STAT, 8, BD96801_OUT_SHDN_ERR_MASK),
+	/* Reg 0x5b LDO7 ERR IRQs */
+	REGMAP_IRQ_REG(BD96801_LDO7_PVIN_ERR_STAT, 9, BD96801_OUT_PVIN_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO7_OVP_ERR_STAT, 9, BD96801_OUT_OVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO7_UVP_ERR_STAT, 9, BD96801_OUT_UVP_ERR_MASK),
+	REGMAP_IRQ_REG(BD96801_LDO7_SHDN_ERR_STAT, 9, BD96801_OUT_SHDN_ERR_MASK),
+};
+
 static const struct regmap_irq bd96801_intb_irqs[] =3D {
 	/* STATUS SYSTEM INTB */
 	REGMAP_IRQ_REG(BD96801_TW_STAT, 0, BD96801_TW_STAT_MASK),
@@ -175,8 +307,25 @@ static const struct regmap_irq bd96801_intb_irqs[] =3D=
 {
 	REGMAP_IRQ_REG(BD96801_LDO7_UVD_STAT, 7, BD96801_LDO_UVD_STAT_MASK),
 };
=20
+static struct regmap_irq_chip bd96801_irq_chip_errb =3D {
+	.name =3D "bd96801-irq-errb",
+	.domain_suffix =3D "errb",
+	.main_status =3D BD96801_REG_INT_MAIN,
+	.num_main_regs =3D 1,
+	.irqs =3D &bd96801_errb_irqs[0],
+	.num_irqs =3D ARRAY_SIZE(bd96801_errb_irqs),
+	.status_base =3D BD96801_REG_INT_SYS_ERRB1,
+	.mask_base =3D BD96801_REG_MASK_SYS_ERRB,
+	.ack_base =3D BD96801_REG_INT_SYS_ERRB1,
+	.init_ack_masked =3D true,
+	.num_regs =3D 10,
+	.irq_reg_stride =3D 1,
+	.sub_reg_offsets =3D &errb_sub_irq_offsets[0],
+};
+
 static struct regmap_irq_chip bd96801_irq_chip_intb =3D {
 	.name =3D "bd96801-irq-intb",
+	.domain_suffix =3D "intb",
 	.main_status =3D BD96801_REG_INT_MAIN,
 	.num_main_regs =3D 1,
 	.irqs =3D &bd96801_intb_irqs[0],
@@ -198,11 +347,14 @@ static const struct regmap_config bd96801_regmap_conf=
ig =3D {
=20
 static int bd96801_i2c_probe(struct i2c_client *i2c)
 {
-	struct regmap_irq_chip_data *intb_irq_data;
+	int i, ret, intb_irq, errb_irq, num_regu_irqs, num_intb, num_errb =3D 0;
+	int wdg_irq_no;
+	struct regmap_irq_chip_data *intb_irq_data, *errb_irq_data;
+	struct irq_domain *intb_domain, *errb_domain;
+	struct resource wdg_irq;
 	const struct fwnode_handle *fwnode;
-	struct irq_domain *intb_domain;
+	struct resource *regulator_res;
 	struct regmap *regmap;
-	int ret, intb_irq;
=20
 	fwnode =3D dev_fwnode(&i2c->dev);
 	if (!fwnode)
@@ -212,10 +364,28 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	if (intb_irq < 0)
 		return dev_err_probe(&i2c->dev, intb_irq, "INTB IRQ not configured\n");
=20
+	num_intb =3D  ARRAY_SIZE(regulator_intb_irqs);
+
+	/* ERRB may be omitted if processor is powered by the PMIC */
+	errb_irq =3D fwnode_irq_get_byname(fwnode, "errb");
+	if (errb_irq < 0)
+		errb_irq =3D 0;
+
+	if (errb_irq)
+		num_errb =3D ARRAY_SIZE(regulator_errb_irqs);
+
+	num_regu_irqs =3D num_intb + num_errb;
+
+	regulator_res =3D kcalloc(num_regu_irqs, sizeof(*regulator_res), GFP_KERN=
EL);
+	if (!regulator_res)
+		return -ENOMEM;
+
 	regmap =3D devm_regmap_init_i2c(i2c, &bd96801_regmap_config);
-	if (IS_ERR(regmap))
-		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
+	if (IS_ERR(regmap)) {
+		ret =3D dev_err_probe(&i2c->dev, PTR_ERR(regmap),
 				    "Regmap initialization failed\n");
+		goto free_out;
+	}
=20
 	ret =3D regmap_write(regmap, BD96801_LOCK_REG, BD96801_UNLOCK);
 	if (ret)
@@ -224,18 +394,63 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	ret =3D devm_regmap_add_irq_chip(&i2c->dev, regmap, intb_irq,
 				       IRQF_ONESHOT, 0, &bd96801_irq_chip_intb,
 				       &intb_irq_data);
-	if (ret)
-		return dev_err_probe(&i2c->dev, ret, "Failed to add INTB IRQ chip\n");
+	if (ret) {
+		dev_err_probe(&i2c->dev, ret, "Failed to add INTB irq_chip\n");
+		goto free_out;
+	}
=20
 	intb_domain =3D regmap_irq_get_domain(intb_irq_data);
=20
-	ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
-				   bd96801_mfd_cells,
-				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0,
-				   intb_domain);
-
+	/*
+	 * MFD core code is built to handle only one IRQ domain. BD96801
+	 * has two domains so we do IRQ mapping here and provide the
+	 * already mapped IRQ numbers to sub-devices.
+	 */
+	for (i =3D 0; i < num_intb; i++) {
+		struct resource *res =3D &regulator_res[i];
+
+		*res =3D regulator_intb_irqs[i];
+		res->start =3D res->end =3D irq_create_mapping(intb_domain,
+							    res->start);
+	}
+
+	wdg_irq_no =3D irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
+	wdg_irq =3D DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
+	bd96801_mfd_cells[WDG_CELL].resources =3D &wdg_irq;
+	bd96801_mfd_cells[WDG_CELL].num_resources =3D 1;
+
+	if (num_errb) {
+		ret =3D devm_regmap_add_irq_chip(&i2c->dev, regmap, errb_irq,
+					       IRQF_ONESHOT, 0,
+					       &bd96801_irq_chip_errb,
+					       &errb_irq_data);
+		if (ret) {
+			dev_err_probe(&i2c->dev, ret,
+				      "Failed to add ERRB (%d) irq_chip\n",
+				      errb_irq);
+			goto free_out;
+		}
+		errb_domain =3D regmap_irq_get_domain(errb_irq_data);
+
+		for (i =3D 0; i < num_errb; i++) {
+			struct resource *res =3D &regulator_res[num_intb + i];
+
+			*res =3D regulator_errb_irqs[i];
+			res->start =3D res->end =3D irq_create_mapping(errb_domain,
+								   res->start);
+		}
+	}
+
+	bd96801_mfd_cells[REGULATOR_CELL].resources =3D regulator_res;
+	bd96801_mfd_cells[REGULATOR_CELL].num_resources =3D num_regu_irqs;
+
+	ret =3D devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, bd96801_mfd_=
cells,
+				   ARRAY_SIZE(bd96801_mfd_cells), NULL, 0, NULL);
 	if (ret)
-		dev_err(&i2c->dev, "Failed to create subdevices\n");
+		dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
+
+free_out:
+	kfree(regulator_res);
=20
 	return ret;
 }
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

--HWofJ7cnk3YqvqLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZeyKQACgkQeFA3/03a
ocX0nQf+OaH8T1JhLiap74VVgxHsb9lqU3VYKlOqwhz8nU52CPjBsbpOlMj6V6p4
a8PXxCWgA8HjCmhreBMDD0akVUUsL2LDWn9zsQ+brZ4Xs/Q5ko0uaDXpgpv2vAX3
7ZLlzhEbQdCxpgvdfMTbT1lKddXgpHMmwbF0VgV/pnh8Uy2J2I/sVXgVdtkOOMK6
sNrWYcLgHxl4q+sCKwShGv5804PD8RQCay+bm/Tq0Dp/qSWvDy2cxCAfeo59iCh6
9TWmmhZplTlGrSEwaRg+cKZirYafhYWqSucDXbWZrjVq9MQ8r/CZs393OziI/tBz
UBEGaqFhXUf1gxD8/3cE7bdPWvI+Ww==
=elnG
-----END PGP SIGNATURE-----

--HWofJ7cnk3YqvqLp--

