Return-Path: <linux-watchdog+bounces-1131-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2229087D8
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 11:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5CA285A33
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2024 09:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38241946CF;
	Fri, 14 Jun 2024 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH/cDMGU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C81946C6;
	Fri, 14 Jun 2024 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358262; cv=none; b=BtXqPS+jc8CUvO8MY9DfWzK4OQL9oq6H42YZsn3yQdwv9r/bd8MmrntEJoZKirV31mB2K4ecd23cvXY8NWgqasSKXTdWRlVYheSFsVByL+FC0WhhJ1CFM8suiaVm0BZvWTVLUQxY8385rF826cKW/mJfG5a9klyyEfygfPnMNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358262; c=relaxed/simple;
	bh=FBswqCiLg9TlG8Siezz8vhRjZVhLXFjJDieojEfPD7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRmF6J7Ro8Rt2s+apqDcunoza17CbzgBR06xz/8XAV5rSpAP5mrLuEVaAuHtuksYGDWD7tlaQ35d7t302f1c0O4eMvOXyOrz/yyJiH27JYmp1W1CTFvYLUxqxHPnpV6G6cOcbb/qKSgUhnw7GbB06Y54cp/LI1xWW32KYej0ya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH/cDMGU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eadaac1d28so19247471fa.3;
        Fri, 14 Jun 2024 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718358259; x=1718963059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqpc67QYeeNqLJ+wCShba4WU/8tjZMIL4vS6uDzRCxo=;
        b=fH/cDMGUkME18BnnT5n+WQYgrRT1UHUhIfpB20NEEqIMpEUNeuN3GsgZ2JGRML+MLQ
         p4lDeN4r/oJlvFrFS4PcSk1sLYW+ZJP9tvaYpF+FcVVLzDdu58SA+fsY554l4dTawAaU
         SuJqKdWDt/v01IZH4ME3A/1U2yzV3hJ2Aaprjwnzmj2m7PjubDb1qkn3jT4mtggVgfHk
         O4nYjRgA+KHXxbl2VkdN0Zc54WvKiDmnx3iiy0CcfAIzFdhp/VfF6cUYijqgkC29M8ds
         VXo8n7uLz1Jt2is6qZtx5ElKkOv5Wpnfh3ixyAEXrNFvLY/CjAmDaPfpJgNPGBsRSNQ6
         feEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358259; x=1718963059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eqpc67QYeeNqLJ+wCShba4WU/8tjZMIL4vS6uDzRCxo=;
        b=uvNKUZEIIEO1Yt+tLqEYMwtZ+JVxGlDw/BuSu2f/FtQTnLKMiDTUUv+qo8mfcX5mA+
         9D5yhIliuQdzP0+O6oHhu98jHHHUruRm/BihsK6uFlgUmkfeXhwOIIrOU/Uzvc5YVrgv
         fyIPAGaEiVvfDbaepySejIhOOH2KjAUWc+3aOZE0+m+Zyxs0MZeecAH7beLWwIj5KdQr
         lHcfvjJVW98PhFnsWHlXUCaYYCYaPkPc/FhM64MYsOzkOaporBExjrFej/kznQcCHSO1
         DDMRQDfhFqZ75aT++EciEAtHaymTKan/x13S6dL2Mqb1i2aHQ5f9q8hHu8i8zvLnMZ8I
         JXXw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ermRgv4oVo3Q9otQrvrxEgNRU0uFK1Xi3WBnFSJ+ZCmvRkvyIzxgNhjm2mHNOyKlKOdVHoeoSLfgAiICeu0q/ijxrSP52JP+itvuZpr2Bao7AToTxLsqXGDECJh6iHKGTe6+2P5U3A8c5om8A+eLEuTDyd3EVmUKVx5AP6pKS3fCVtm/nMFB
X-Gm-Message-State: AOJu0Yw95dxOH39HWkXoQ3l87RY8rF8C8u/xtutOJ441nkNbMkFJwzm3
	ZkCVs9jwpfNR/NjDjjYlG1GKWrmGObAzeSxPpNZ9Emzv6hykZJy2
X-Google-Smtp-Source: AGHT+IH7bH9UH+KSwR0+XIsUHLn1C63NRYgrRxvc0KJ1jXLuLNl3Uv4trKPtCiIfMwdXnkyK0oorVw==
X-Received: by 2002:a2e:8416:0:b0:2ec:422:126 with SMTP id 38308e7fff4ca-2ec0e47b630mr14381801fa.30.1718358258445;
        Fri, 14 Jun 2024 02:44:18 -0700 (PDT)
Received: from fedora ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05e436ccsm4836611fa.23.2024.06.14.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:44:17 -0700 (PDT)
Date: Fri, 14 Jun 2024 12:44:13 +0300
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
Subject: [PATCH v4 5/6] watchdog: ROHM BD96801 PMIC WDG driver
Message-ID: <00911b1d1676b828c509e7c39237f9e602b43570.1718356964.git.mazziesaccount@gmail.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sef03VTwslF/xBUu"
Content-Disposition: inline
In-Reply-To: <cover.1718356964.git.mazziesaccount@gmail.com>


--sef03VTwslF/xBUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Introduce driver for WDG block on ROHM BD96801 scalable PMIC.

This driver only supports watchdog with I2C feeding and delayed
response detection. Whether the watchdog toggles PRSTB pin or
just causes an interrupt can be configured via device-tree.

The BD96801 PMIC HW supports also window watchdog (too early
feeding detection) and Q&A mode. These are not supported by
this driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v2 =3D>:
- No changes

v1 =3D> v2:
- Drop the forward declaration for emergency_reboot()
- Typofixes
- Do error checks before assignments in find_closest_fast()
- Improve prints for unsupported (HW) timeout values
- Use FIELD_GET() and FIELD_PREP()
- Use error severity when unsupported Q&A WDG mode is tried to be used.
- Minor styling fixes

RFCv2 =3D> v1:
- Fix watchdog time-outs to match DS4
- Fix target timeout overflow
- Improve dbg prints

RFCv1 =3D> RFCv2:
- remove always running
- add IRQ handling
- call emergency_restart()
- drop MODULE_ALIAS and add MODULE_DEVICE_TABLE

watchdog: bd96801: styling fix
---
 drivers/watchdog/Kconfig       |  13 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/bd96801_wdt.c | 416 +++++++++++++++++++++++++++++++++
 3 files changed, 430 insertions(+)
 create mode 100644 drivers/watchdog/bd96801_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 85eea38dbdf4..ceb3431f23b8 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -181,6 +181,19 @@ config BD957XMUF_WATCHDOG
 	  watchdog. Alternatively say M to compile the driver as a module,
 	  which will be called bd9576_wdt.
=20
+config BD96801_WATCHDOG
+	tristate "ROHM BD96801 PMIC Watchdog"
+	depends on MFD_ROHM_BD96801
+	select WATCHDOG_CORE
+	help
+	  Support for the watchdog in the ROHM BD96801 PMIC. Watchdog can be
+	  configured to only generate IRQ or to trigger system reset via reset
+	  pin.
+
+	  Say Y here to include support for the ROHM BD96801 watchdog.
+	  Alternatively say M to compile the driver as a module,
+	  which will be called bd96801_wdt.
+
 config CROS_EC_WATCHDOG
 	tristate "ChromeOS EC-based watchdog"
 	select WATCHDOG_CORE
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2d1117564f5b..b51030f035a6 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -218,6 +218,7 @@ obj-$(CONFIG_XEN_WDT) +=3D xen_wdt.o
=20
 # Architecture Independent
 obj-$(CONFIG_BD957XMUF_WATCHDOG) +=3D bd9576_wdt.o
+obj-$(CONFIG_BD96801_WATCHDOG) +=3D bd96801_wdt.o
 obj-$(CONFIG_CROS_EC_WATCHDOG) +=3D cros_ec_wdt.o
 obj-$(CONFIG_DA9052_WATCHDOG) +=3D da9052_wdt.o
 obj-$(CONFIG_DA9055_WATCHDOG) +=3D da9055_wdt.o
diff --git a/drivers/watchdog/bd96801_wdt.c b/drivers/watchdog/bd96801_wdt.c
new file mode 100644
index 000000000000..ff51f42ced2a
--- /dev/null
+++ b/drivers/watchdog/bd96801_wdt.c
@@ -0,0 +1,416 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 ROHM Semiconductors
+ *
+ * ROHM BD96801 watchdog driver
+ */
+
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/rohm-bd96801.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+static bool nowayout;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		"Watchdog cannot be stopped once started (default=3D\"false\")");
+
+#define BD96801_WD_TMO_SHORT_MASK	0x70
+#define BD96801_WD_RATIO_MASK		0x3
+#define BD96801_WD_TYPE_MASK		0x4
+#define BD96801_WD_TYPE_SLOW		0x4
+#define BD96801_WD_TYPE_WIN		0x0
+
+#define BD96801_WD_EN_MASK		0x3
+#define BD96801_WD_IF_EN		0x1
+#define BD96801_WD_QA_EN		0x2
+#define BD96801_WD_DISABLE		0x0
+
+#define BD96801_WD_ASSERT_MASK		0x8
+#define BD96801_WD_ASSERT_RST		0x8
+#define BD96801_WD_ASSERT_IRQ		0x0
+
+#define BD96801_WD_FEED_MASK		0x1
+#define BD96801_WD_FEED			0x1
+
+/* 1.1 mS */
+#define FASTNG_MIN			11
+#define FASTNG_MAX_US			(100 * FASTNG_MIN << 7)
+#define SLOWNG_MAX_US			(16 * FASTNG_MAX_US)
+
+#define BD96801_WDT_DEFAULT_MARGIN_MS	1843
+/* Unit is seconds */
+#define DEFAULT_TIMEOUT 30
+
+/*
+ * BD96801 WDG supports window mode so the TMO consists of SHORT and LONG
+ * timeout values. SHORT time is meaningful only in window mode where feed=
ing
+ * period shorter than SHORT would be an error. LONG time is used to detec=
t if
+ * feeding is not occurring within given time limit (SoC SW hangs). The LO=
NG
+ * timeout time is a multiple of (2, 4, 8 or 16 times) the SHORT timeout.
+ */
+
+struct wdtbd96801 {
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct watchdog_device	wdt;
+};
+
+static int bd96801_wdt_ping(struct watchdog_device *wdt)
+{
+	struct wdtbd96801 *w =3D watchdog_get_drvdata(wdt);
+
+	return regmap_update_bits(w->regmap, BD96801_REG_WD_FEED,
+				  BD96801_WD_FEED_MASK, BD96801_WD_FEED);
+}
+
+static int bd96801_wdt_start(struct watchdog_device *wdt)
+{
+	struct wdtbd96801 *w =3D watchdog_get_drvdata(wdt);
+
+	return regmap_update_bits(w->regmap, BD96801_REG_WD_CONF,
+				  BD96801_WD_EN_MASK, BD96801_WD_IF_EN);
+}
+
+static int bd96801_wdt_stop(struct watchdog_device *wdt)
+{
+	struct wdtbd96801 *w =3D watchdog_get_drvdata(wdt);
+
+	return regmap_update_bits(w->regmap, BD96801_REG_WD_CONF,
+				  BD96801_WD_EN_MASK, BD96801_WD_DISABLE);
+}
+
+static const struct watchdog_info bd96801_wdt_info =3D {
+	.options	=3D WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING |
+			  WDIOF_SETTIMEOUT,
+	.identity	=3D "BD96801 Watchdog",
+};
+
+static const struct watchdog_ops bd96801_wdt_ops =3D {
+	.start		=3D bd96801_wdt_start,
+	.stop		=3D bd96801_wdt_stop,
+	.ping		=3D bd96801_wdt_ping,
+};
+
+static int find_closest_fast(unsigned int target, int *sel, unsigned int *=
val)
+{
+	unsigned int window =3D FASTNG_MIN;
+	int i;
+
+	for (i =3D 0; i < 8 && window < target; i++)
+		window <<=3D 1;
+
+	if (i =3D=3D 8)
+		return -EINVAL;
+
+	*val =3D window;
+	*sel =3D i;
+
+	return 0;
+}
+
+static int find_closest_slow_by_fast(unsigned int fast_val, unsigned int *=
target,
+				     int *slowsel)
+{
+	static const int multipliers[] =3D {2, 4, 8, 16};
+	int sel;
+
+	for (sel =3D 0; sel < ARRAY_SIZE(multipliers) &&
+	     multipliers[sel] * fast_val < *target; sel++)
+		;
+
+	if (sel =3D=3D ARRAY_SIZE(multipliers))
+		return -EINVAL;
+
+	*slowsel =3D sel;
+	*target =3D multipliers[sel] * fast_val;
+
+	return 0;
+}
+
+static int find_closest_slow(unsigned int *target, int *slow_sel, int *fas=
t_sel)
+{
+	static const int multipliers[] =3D {2, 4, 8, 16};
+	unsigned int window =3D FASTNG_MIN;
+	unsigned int val =3D 0;
+	int i, j;
+
+	for (i =3D 0; i < 8; i++) {
+		for (j =3D 0; j < ARRAY_SIZE(multipliers); j++) {
+			unsigned int slow;
+
+			slow =3D window * multipliers[j];
+			if (slow >=3D *target && (!val || slow < val)) {
+				val =3D slow;
+				*fast_sel =3D i;
+				*slow_sel =3D j;
+			}
+		}
+		window <<=3D 1;
+	}
+	if (!val)
+		return -EINVAL;
+
+	*target =3D val;
+
+	return 0;
+}
+
+static int bd96801_set_wdt_mode(struct wdtbd96801 *w, unsigned int hw_marg=
in,
+			       unsigned int hw_margin_min)
+{
+	int fastng, slowng, type, ret, reg, mask;
+	struct device *dev =3D w->dev;
+
+
+	if (hw_margin_min * 1000 > FASTNG_MAX_US) {
+		dev_err(dev, "Unsupported fast timeout %u uS [max %u]\n",
+			hw_margin_min * 1000, FASTNG_MAX_US);
+
+		return -EINVAL;
+	}
+
+	if (hw_margin * 1000 > SLOWNG_MAX_US) {
+		dev_err(dev, "Unsupported slow timeout %u uS [max %u]\n",
+			hw_margin * 1000, SLOWNG_MAX_US);
+
+		return -EINVAL;
+	}
+
+	/*
+	 * Convert to 100uS to guarantee reasonable timeouts fit in
+	 * 32bit maintaining also a decent accuracy.
+	 */
+	hw_margin *=3D 10;
+	hw_margin_min *=3D 10;
+
+	if (hw_margin_min) {
+		unsigned int min;
+
+		type =3D BD96801_WD_TYPE_WIN;
+		dev_dbg(dev, "Setting type WINDOW 0x%x\n", type);
+		ret =3D find_closest_fast(hw_margin_min, &fastng, &min);
+		if (ret)
+			return ret;
+
+		ret =3D find_closest_slow_by_fast(min, &hw_margin, &slowng);
+		if (ret) {
+			dev_err(dev,
+				"can't support slow timeout %u uS using fast %u uS. [max slow %u uS]\n=
",
+				hw_margin * 100, min * 100, min * 100 * 16);
+
+			return ret;
+		}
+		w->wdt.min_hw_heartbeat_ms =3D min / 10;
+	} else {
+		type =3D BD96801_WD_TYPE_SLOW;
+		dev_dbg(dev, "Setting type SLOW 0x%x\n", type);
+		ret =3D find_closest_slow(&hw_margin, &slowng, &fastng);
+		if (ret)
+			return ret;
+	}
+
+	w->wdt.max_hw_heartbeat_ms =3D hw_margin / 10;
+
+	fastng =3D FIELD_PREP(BD96801_WD_TMO_SHORT_MASK, fastng);
+
+	reg =3D slowng | fastng;
+	mask =3D BD96801_WD_RATIO_MASK | BD96801_WD_TMO_SHORT_MASK;
+	ret =3D regmap_update_bits(w->regmap, BD96801_REG_WD_TMO,
+				 mask, reg);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_update_bits(w->regmap, BD96801_REG_WD_CONF,
+				 BD96801_WD_TYPE_MASK, type);
+
+	return ret;
+}
+
+static int bd96801_set_heartbeat_from_hw(struct wdtbd96801 *w,
+					 unsigned int conf_reg)
+{
+	int ret;
+	unsigned int val, sel, fast;
+
+	/*
+	 * The BD96801 supports a somewhat peculiar QA-mode, which we do not
+	 * support in this driver. If the QA-mode is enabled then we just
+	 * warn and bail-out.
+	 */
+	if ((conf_reg & BD96801_WD_EN_MASK) !=3D BD96801_WD_IF_EN) {
+		dev_err(w->dev, "watchdog set to Q&A mode - exiting\n");
+		return -EINVAL;
+	}
+
+	ret =3D regmap_read(w->regmap, BD96801_REG_WD_TMO, &val);
+	if (ret)
+		return ret;
+
+	sel =3D FIELD_GET(BD96801_WD_TMO_SHORT_MASK, val);
+	fast =3D FASTNG_MIN << sel;
+
+	sel =3D (val & BD96801_WD_RATIO_MASK) + 1;
+	w->wdt.max_hw_heartbeat_ms =3D (fast << sel) / USEC_PER_MSEC;
+
+	if ((conf_reg & BD96801_WD_TYPE_MASK) =3D=3D BD96801_WD_TYPE_WIN)
+		w->wdt.min_hw_heartbeat_ms =3D fast / USEC_PER_MSEC;
+
+	return 0;
+}
+
+static int init_wdg_hw(struct wdtbd96801 *w)
+{
+	u32 hw_margin[2];
+	int count, ret;
+	u32 hw_margin_max =3D BD96801_WDT_DEFAULT_MARGIN_MS, hw_margin_min =3D 0;
+
+	count =3D device_property_count_u32(w->dev->parent, "rohm,hw-timeout-ms");
+	if (count < 0 && count !=3D -EINVAL)
+		return count;
+
+	if (count > 0) {
+		if (count > ARRAY_SIZE(hw_margin))
+			return -EINVAL;
+
+		ret =3D device_property_read_u32_array(w->dev->parent,
+						     "rohm,hw-timeout-ms",
+						     &hw_margin[0], count);
+		if (ret < 0)
+			return ret;
+
+		if (count =3D=3D 1)
+			hw_margin_max =3D hw_margin[0];
+
+		if (count =3D=3D 2) {
+			if (hw_margin[1] > hw_margin[0]) {
+				hw_margin_max =3D hw_margin[1];
+				hw_margin_min =3D hw_margin[0];
+			} else {
+				hw_margin_max =3D hw_margin[0];
+				hw_margin_min =3D hw_margin[1];
+			}
+		}
+	}
+
+	ret =3D bd96801_set_wdt_mode(w, hw_margin_max, hw_margin_min);
+	if (ret)
+		return ret;
+
+	ret =3D device_property_match_string(w->dev->parent, "rohm,wdg-action",
+					   "prstb");
+	if (ret >=3D 0) {
+		ret =3D regmap_update_bits(w->regmap, BD96801_REG_WD_CONF,
+				 BD96801_WD_ASSERT_MASK,
+				 BD96801_WD_ASSERT_RST);
+		return ret;
+	}
+
+	ret =3D device_property_match_string(w->dev->parent, "rohm,wdg-action",
+					   "intb-only");
+	if (ret >=3D 0) {
+		ret =3D regmap_update_bits(w->regmap, BD96801_REG_WD_CONF,
+				 BD96801_WD_ASSERT_MASK,
+				 BD96801_WD_ASSERT_IRQ);
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t bd96801_irq_hnd(int irq, void *data)
+{
+	emergency_restart();
+
+	return IRQ_NONE;
+}
+
+static int bd96801_wdt_probe(struct platform_device *pdev)
+{
+	struct wdtbd96801 *w;
+	int ret, irq;
+	unsigned int val;
+
+	w =3D devm_kzalloc(&pdev->dev, sizeof(*w), GFP_KERNEL);
+	if (!w)
+		return -ENOMEM;
+
+	w->regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+	w->dev =3D &pdev->dev;
+
+	w->wdt.info =3D &bd96801_wdt_info;
+	w->wdt.ops =3D  &bd96801_wdt_ops;
+	w->wdt.parent =3D pdev->dev.parent;
+	w->wdt.timeout =3D DEFAULT_TIMEOUT;
+	watchdog_set_drvdata(&w->wdt, w);
+
+	ret =3D regmap_read(w->regmap, BD96801_REG_WD_CONF, &val);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to get the watchdog state\n");
+
+	/*
+	 * If the WDG is already enabled we assume it is configured by boot.
+	 * In this case we just update the hw-timeout based on values set to
+	 * the timeout / mode registers and leave the hardware configs
+	 * untouched.
+	 */
+	if ((val & BD96801_WD_EN_MASK) !=3D BD96801_WD_DISABLE) {
+		dev_dbg(&pdev->dev, "watchdog was running during probe\n");
+		ret =3D bd96801_set_heartbeat_from_hw(w, val);
+		if (ret)
+			return ret;
+
+		set_bit(WDOG_HW_RUNNING, &w->wdt.status);
+	} else {
+		/* If WDG is not running so we will initializate it */
+		ret =3D init_wdg_hw(w);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(w->dev, "heartbeat set to %u - %u\n",
+		w->wdt.min_hw_heartbeat_ms, w->wdt.max_hw_heartbeat_ms);
+
+	watchdog_init_timeout(&w->wdt, 0, pdev->dev.parent);
+	watchdog_set_nowayout(&w->wdt, nowayout);
+	watchdog_stop_on_reboot(&w->wdt);
+
+	irq =3D platform_get_irq_byname(pdev, "bd96801-wdg");
+	if (irq > 0) {
+		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
+						bd96801_irq_hnd,
+						IRQF_ONESHOT,  "bd96801-wdg",
+						NULL);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to register IRQ\n");
+	}
+
+	return devm_watchdog_register_device(&pdev->dev, &w->wdt);
+}
+
+static const struct platform_device_id bd96801_wdt_id[] =3D {
+	{ "bd96801-wdt", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, bd96801_wdt_id);
+
+static struct platform_driver bd96801_wdt =3D {
+	.driver =3D {
+		.name =3D "bd96801-wdt"
+	},
+	.probe =3D bd96801_wdt_probe,
+	.id_table =3D bd96801_wdt_id,
+};
+module_platform_driver(bd96801_wdt);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("BD96801 watchdog driver");
+MODULE_LICENSE("GPL");
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

--sef03VTwslF/xBUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmZsEO0ACgkQeFA3/03a
ocVEOQf/cmgVVMpLuhgrWV/gN74sYydtrzD7qPdQrJV7yyBBIvNXTONAPGHcQOmK
RvN+FEml861V7JdWiScOTgn8mbcWDyh70lTilt7G6Y+GI/yr3X3IwOl+qpuZL8vD
YoGdxbCeURckQGyN7F19bt+eVoeA6R00l/oFqD8JBtNtuXD/DwakmizyP/4MQs9C
sGbv06qiFgJOoxGmQ4H85+XXq4Geot3uvw53uk+eaIUDGmLCYs1A0BXiKBBTCMnf
IjCYYPKUJdb9faKn/OfvCaV8fbzovCDDMD8u1p4YtHwy01pX6qEGojiotFY9xWw6
5ozSYvh5iUHxthvxRZTbbEBMDW/OxQ==
=GEnM
-----END PGP SIGNATURE-----

--sef03VTwslF/xBUu--

